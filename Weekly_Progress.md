# The Weekly Progress
##### Starting in Nov. 10, 2018

In the autumn semester, hopefully I'll record my progress every Thursday morning

### SO FAR
1. Understand why X-ray cause profound effects to ISM

2. Aquire the X-ray spectra emitted the SMBH in the center of Milky Way Galaxy several mys ago  

3. Decide to focus on a cold dense cloud 8 kpc from the SMBH, thus fixing the flux

4. Figure out how KROME works, especially its X-ray module (details on <https://github.com/slowdivePTG/X-ray-chemistry/tree/master>)

5. Be able to calculate primary X-ray ionizations according to a X-ray spectra and the cross sections of certain species.
   $$
   \zeta_k^p=\int_{E_{min}}^{E_{max}}\frac{F_X(E)}{E}\sigma_k(E)\text{d}E
   $$

   $$
   F_X(E):\text{ erg}\cdot\text{ cm}^{-2}\cdot\text{ s}^{-1}
   $$











6. Learn about the cosmic ray ionization




### Nov. 10, 2018
1. Trace the most important reactions using the Jacobian Matrix pd(i,j)
   $$
   pd(i,j)=\frac{\partial}{\partial n(j)}\left(\frac{\text{d}n(i)}{\text{d}t}\right)
   $$

   $$
   \left(\frac{\text{d}n(i)}{\text{d}t}\right)_j=n(j)\cdot pd(i,j)
   $$

2. Test a simple model but consider a mixture of H/He rather than $\text{H}_2/\text{He}$. $J_{X21}=0.1$ for 1 mys then turn off the X-ray radiation. Plot the abundance of $\text{CH}_4$ with time.

> For this molecular cloud test we choose the **osu_01_2007** network and the initial conditions proposed by *Wakelam & Herbst (2008)*: a constant temperature of $\text{T} = 10\text{ K}$, $\ce{H2}$ density of $10^4\text{ cm}^{−3}$, cosmic rays ionization rate of $1.3 \times 10^{−17}\text{ s}^{−1}$, and a visual extinction of 10.
> The initial conditions of the species are listed in Table 7 and correspond to the EA2 model of *Wakelam & Herbst (2008)*, an high-metal environment observed in the diffuse cloud $\zeta$ *Ophiuchi*

```fortran
  Tgas = 1d1 !gas temperature (K)
  xH = 2d4 !Hydrogen density

  !user commons for opacity and CR rate
  call krome_set_user_av(1d1) !opacity Av (#)E11.3,
  call krome_set_user_crate(1.3d-17) !CR rate (1/s)
  call krome_set_user_gas_dust_ratio(7.57d11) !gas/dust

  call krome_init()
  j21xs = 0d0
  call krome_set_J21xray(j21xs)
  print *,"J21 Xray = ",j21xs

  x(:) = 1.d-20
  !initial densities (model EA2 Wakelam+Herbst 2008)
  x(KROME_idx_H2)  = 0.5d0   * xH !In this case we actually use x(KROME_idx_H)  = 0.5d0   * xH, which is not true
  x(KROME_idx_He)  = 9d-2   * xH
  x(KROME_idx_N)   = 7.6d-5  * xH
  x(KROME_idx_O)   = 2.56d-4 * xH
  x(KROME_idx_Cj)  = 1.2d-4  * xH
  x(KROME_idx_Sj)  = 1.5d-5  * xH
  x(KROME_idx_Sij) = 1.7d-6  * xH
  x(KROME_idx_Fej) = 2d-7   * xH
  x(KROME_idx_Naj) = 2d-7   * xH
  x(KROME_idx_Mgj) = 2.4d-6  * xH
  x(KROME_idx_Clj) = 1.8d-7  * xH
  x(KROME_idx_Pj)  = 1.17d-7 * xH
  x(KROME_idx_Fj)  = 1.8d-8  * xH

  !calculate elctrons (neutral cloud)
  x(KROME_idx_e) = krome_get_electrons(x(:))
```



### Nov. 15, 2018 

1. (From Prof. Du) The secondary ionization rate of molecular hydrogen can be approximately considered as 2 hydrogen atoms.

   > Related readings:
   >
   > *X-ray chemistry in the envelopes around young stellar objects*, Stäuber 2005
   >
   > *X-Ray--irradiated Molecular Gas. I. Physical Processes and General Results*, Maloney 1996

   According to Maloney 1996, the main process in the X-ray (secondary) ionization of $\ce{H2}$ is:
   $$
   \ce{H2 + e- -> H2+ + 2e-}
   $$
   We can assume the rate coefficient is twice the ionization rates of $\ce{H}$, and thus include it in the network.



   > **INCLUDE** means when calculating the secondary ionization rates, we take the abundance of $\ce{H}$ :
   > $$
   > n_t(\ce{H})=n(\ce{H})+2n(\ce{H2})
   > $$
   >

​	

​	The modification of Fortran code in krome_subs.f90 is shown here

   ```fortran
   !H2 -> H2+ + E
   k(38) = rateEvaluateOnce(38)
   
   !H -> H+ + E
   k(4430) = small + ((ratexH &
       * (1d0+phiH) + n(idx_He)&
       /(n(idx_H)+2*n(idx_H2)+1d-40) * ratexHe * phiH)&
       * J21xray)
       
   k(38) = k(38) + 2*k(4430)
   
   !HE -> HE+ + E
   k(4431) = small + ((ratexHe &
       * (1d0+phiHe) + (n(idx_H)+2*n(idx_H2))&
       /(n(idx_He)+1d-40) * ratexH * phiHe)&
       * J21xray)
   
   ```



​	Some results are:

![](Pics/add_H2_ionization.png)



​	Obviously the ionization of $\ce{H2}$ becomes more significant, and the profile of $\ce{CH4}$ changes a lot. If we don’t take $n_t(\ce{H})$ the effect is even more profound.

- *(NOT AT PRESENT)* For heavier atoms or other molecules, we can apply the approximation with the energy $E$ fixed, neglecting the dependence of the cross sections on energy:

$$
\zeta_i=\zeta _ { \mathrm { H } _ { 2 } }\frac{\sigma_i(E)}{\sigma_{\mathrm { H } _ { 2 }}(E)}
$$

2. Species observants most interested in:

  > 经常观测的分子包括$\ce{CO、HCO+、N2H+、HCN}$、各种碳氢化合物$\ce{C2H、C3H3}$等等。可以关注一下代表了电离度的电子丰度$x_e$，以及$\ce{H3+、C+、OH+、H2O+}$等离子的丰度；$\ce{OH、CH、NH3、H2O}$等也可以看看。还可以看更复杂一些的$\ce{CH3CN、CH3OH}$等

  $x_e$ is important because it decides the chemical composition and whether the heating process is sufficient



3. The simple $\ce{H/He}$ model used before:

   - Abundance of $\ce{CH4}$ too low
   - Not enough time to form $\ce{H2}$
   - Does not include $\ce{H2}$ formation on **grains**

   Therefore it is not reasonable enough, and I shall focus on the new $\ce{H2/He}$ model to see what will happen if I turn off the X-ray after 1 mys.

   Without $\ce{H2}$ formation on **grains**, there seems no jump in the abundance of $\ce{CH4}$ , which is shown in the plot.

![](Pics/add_H2_ionization_1_mys.png)



### Nov. 22, 2018

1. More details on secondary ionization

   The secondary ionization rate for $\ce{H}$ ( Stäuber 2005, Maloney 1996, ): 
   $$
   \zeta_H^{(2)}=\int_{E_{min}}^{E_{max}}\frac{F(E)}{E}N_{sec}(E,x_e)\sigma(E)\text{d}E\\
   N_{sec}(E,x_e)=\frac{E-E_{th}}{W(E)}\approx\frac{E}{W(E)}
   $$
   $N_{sec}(E)$ is the number of secondary **ionizations** per unit energy produced by primary photoelectrons$W(E)$ is the mean energy expended to produce an ion pair through rapid electron process

   ##### A BIG MISTAKE HERE LAST WEEK!

   $N_{sec}(E)$ is not the number of secondary electrons but the number of ion pairs produced by a secondary electron. **WE DON’T COUNT ELECTRONS HERE! **

   #### More comments on the formula

   - $W(E)$ is nearly independent of $E$ if $E>200\text{ eV}$ , which is easy to satisfied in our case

   - $N_{sec}(E,x_e)$ is dependent on $x_e$. When $x_e>1\%$ , the energy in photoelectrons will be mainly lost to Coulomb Interaction with ambient thermal electrons.  In our case, $n_e/n_\ce{H}<10^{-4}$ . For weakly ionized gases,  $\approx40\%$ of the primary electron energy will be used for ionization (Krolik 1983, Shull 1985) , then for a secondary electron with energy $1\text{ keV}$ , the number of $\ce{H}$ it can ionize is:
     $$
     N=\frac{0.40\times1\text{ keV}}{13.6\text{ eV}}\approx30
     $$
     More precise calculation ( Glassgold & Langer 1973, Dalgarno 1999, Glass- gold 2012 ) shows that in $\ce{H2 + He}$ neutral gas, $47\%$ of energy goes to ionization, $47\%$ in $\ce{H2}$ and $\ce{He}$ excitation, the rest goes for heating. $N_{sec}(E)\approx27$ and thus we can take $W(E)\approx37\text{ eV}$.

   #### The formula I actually use

   $$
   \zeta _ { \mathrm { tot } } ^ { i } = \zeta _ { \mathrm { p } } ^ { i } + \sum _ { j = \mathrm { H } , \mathrm { He } } \frac { n _ { j } } { n _ { i } } \zeta _ { \mathrm { p } } ^ { j } \left\langle \phi ^ { i } \right\rangle
   $$

   - The numbers of secondary ionization of $\ce{H}$ and $\ce{He}$ per primary ionization are taken from Shull 1985
     $$
     \begin{aligned} \phi ^ { \mathrm { H } } \left( E , x _ { \mathrm { e } } \right) & = \left( \frac { E } { 13.6 \mathrm { eV } } - 1 \right) 0.3908 \left( 1 - x _ { \mathrm { e } } ^ { 0.4092 } \right) ^ { 1.7592 } \\ \phi ^ { \mathrm { He } } \left( E , x _ { \mathrm { e } } \right) & = \left( \frac { E } { 24.6 \mathrm { eV } } - 1 \right) 0.0554 \left( 1 - x _ { \mathrm { e } } ^ { 0.4014 } \right) ^ { 1.660 } \end{aligned}
     $$

   - Can be rewritten like this:
     $$
     \zeta_{tot}^\ce{H}=\zeta_p^\ce{H}(1+\frac{n_\ce{He}}{n_\ce{H}}\langle\phi^\ce{He}\rangle+\langle\phi^\ce{H}\rangle)
     $$
     which average $\phi$ over the X-ray spectrum $F(E)$

      

2. Test all the species listed last week

   ![](Pics/list1.png)

   ![](Pics/list2.png)

3. 