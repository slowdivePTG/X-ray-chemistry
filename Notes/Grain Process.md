# Grain process

> Based on Hasegawa & Herbst 1992, 1993a and 1993b

Species we are interested in are listed in the table `grain.csv`

## Grain model

- Fixed size - radius of 1000 angstrom, density of 3 g/cm$^3$, $N_s=10^6$ surface sites for absorption
- Gas-to-dust ratio by mass - 100
- Number density - $1.33\times10^{-12}n$, where $n$ is the concentration of hydrogen nuclei ($2\times10^4$)
- Dust temperature - 10 K

## Accretion

- Sticking probability - 1

- Accretion rate
  $$
  R_{\mathrm{acc}}(i)=\overline{\sigma_{d}n_{d}}\langle v(i)\rangle n(i) = \sqrt{\frac{2 k_{B} T}{\pi m}}\sigma_{d}n_{d}n(i)
  $$

  $$
  k_i= \sqrt{\frac{2 k_{B} T}{\pi m}}\sigma_{d}n_{d}n(i)=6.0557\sqrt{\frac{T\ (\text{K})}{\mu}}\times10^{-14}\text{ s}^{-1}
  $$

- Do not consider absorption of molecular and atomic ions

- Charge on the grain does not influence the chemistry

## Desorption

- The desorption rate depends on the binding energy $E_D\sim \mathcal{O}(1000)$ K $\sim \mathcal{O}(0.1)$ eV
  - Dependent on the material making up the grains - time dependent - neglected

## Exothermal surface reactions

- Mobility (in order to react) - hop time scale $t_\rm{hop}$ - time scale for absorbed species to migrate from one site (a potential well) to an adjacent site via thermal hopping
  $$
  t_\mathrm{hop}=\nu_o^{-1}\exp(E_b/kT_d)
  $$
  where

  - $\nu_0$ is the (isotropic) characteristic vibration frequency for the absorbed species (the authors utilized the harmonic oscillator frequency $\nu_0=(2n_sE_D/\pi^2m)^{1/2}\sim 10^{12}-10^{13}$ Hz, where $n_s\sim1.5\times 10^{15}$ cm$^{-2}$ is the surface density of sites and $m$ is the mass of the absorbed particle)
  - $E_b\sim0.3E_D$ is the potential energy barrier between adjacent surface potential energy wells

- Diffusion time $t_\mathrm{diff}$ - time scale for an absorbed particle to sweep over a number of sites equialent to the whole surface
  $$
  t_\mathrm{diff}=N_st_\mathrm{hop}
  $$
  Diffusion rate is the inverse of the diffusion time

- Surface reaction rate 
  $$
  R_{ij}=\kappa_{ij}(R_{\mathrm{diff},i}+R_{\mathrm{diff},j})N_iN_jn_d=k_{ij}n_s(i)n_s(j)
  $$
  where $n_s(i)=N_in_d$ and the rate coefficient $k_{ij}=\kappa_{ij}(R_{\mathrm{diff},i}+R_{\mathrm{diff},j})/n_d$

- $\kappa_{ij}$ is the probability for the reaction to happen upon an encounter

  - No energy barrier - $\kappa_{ij}=1$
  - Activation energy $E_a$ - $\kappa=\exp[-2(a/\hbar)(2\mu E_a)^{1/2}]$ ($\mu$ is the reduced mass, $a$ is taken as 1 angstrom; quantum tunneling)

- For light reactive species $\ce{H}$ and $\ce{He}$, surface migration due to quantum tunneling is more rapid than that due to classical hopping

## Evaporation

- Only $\ce{H, H2, He}$ have meaningful evaporation times
  $$
  k_{\mathrm{eva}}(\mathrm{X})=\nu_{\mathrm{X}} \exp \left[-E_{\mathrm{bind}}(\mathrm{X}) / T\right]
  $$
  
  $$
  \begin{aligned} \nu_{\mathrm{X}} &=\left(2 \rho_{\mathrm{S}} E_{\mathrm{bind}} / \pi^{2} m_{\mathrm{X}}\right)^{1 / 2} \\ &=2.4 \times 10^{12} \mathrm{Hz}\left(\frac{\rho_{\mathrm{S}}}{10^{15} \mathrm{cm}^{-2}}\right)^{1 / 2}\left(\frac{E_{\mathrm{bind}}}{350 \mathrm{K}}\right)^{1 / 2}\left(\frac{m_{\mathrm{X}}}{m_{\mathrm{H}}}\right)^{-1 / 2} \end{aligned}
  $$
  