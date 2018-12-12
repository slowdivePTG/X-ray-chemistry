# X-ray ionization and the Orion molecular cloud

J. Krolik, T. Kallman, 1983, APJ

## X-ray Spectrum and Primary Rate

- Spectrum: 
  $$
  F(E)=\frac{F}{k T _ { * } } \exp \left( - E / k T _ { * } \right)(\text {cm}^{-2}\text{ s}^{-1})\\k T _ { \star } \approx 500 \text { eV}
  $$
  The bigger $k T _ { \star }$ is, the harder the spectrum is

- Primary Rates:
$$
  \zeta_x=\int_{E_{0}}^\infty \frac{F(E)}{E}\sigma(E)e^{-\tau(E)}\text{d}E\\
  G=\int_{E_{0}}^\infty {F(E)}\sigma(E)e^{-\tau(E)}\text{d}E
$$
  $\sigma$ is the effective cross section per **Hydrogen atom**

## Elementary Data - Fixed free parameters

- Density: $n _ { \ce{H}(\text {atoms} )} = 4 \times 10 ^ { 5 } \text { cm} ^ { - 3 }$

- Temperature: $T = 50 \text { K }$

- Incident X-ray flux

- Optical depth

- Initial abundances(per Hydrogen atom)
  $$
  \begin{align*}
  \ce{H2} &= 0.5\\
  \ce{He} &= 0.1\\
  \ce{C+} &= 8\times10^{-5}\\
  \ce{N} &= 2.15\times10^{-5}\\
  \ce{O} &= 1.75\times10^{-4}\\
  \ce{Mg} &= 1.07\times10^{-6}\\
  \end{align*}
  $$



## Ionization Rates

### Cosmic ray

- Molecular Hydrogen (2 branches)
  $$
  \ce{H2 + cosmic-ray -> H2+ + e-}\Rightarrow 95\%\\
  \ce{H2 + cosmic-ray -> H+ + H + e-}\Rightarrow 5\%
  $$
  $\ce{H+}$ quickly react to become $\ce{H}$ 

- Helium: $\ce{He+}$ does not react with $\ce{H2}$ , accounts for the greatest part of the net rate

- $\ce{C,N,O,CO}$ 

### X-ray

- Molecular Hydrogen (2 branches)
  $$
  \ce{H2 + \gamma -> H2+ + e-}\Rightarrow 80\%\\
  \ce{H2 + \gamma -> H+ + H + e-}\Rightarrow 20\%
  $$

- Helium

- Heavy elements: assume that the photo-ionization cross sections of all elements other than $\ce{H}$ are unaffected by molecular binding, which mostly concerns valence shell electrons - Auger electrons, double charged

  - Diatomic Molecules: $\ce{CO}$ rule: $80\%$ dissociates into equally charged ions, $20\%$ gives one fragment neutral and the other double charged
  - Three or More Atoms: 2 fragments , $\ce{CO}$ rule

- Secondary Electrons

  - $45\%$ of the energy goes to ionization
  - Assume all secondary electrons comes from $\ce{H2}$ and $\ce{He}$ 
  - mean energy: $19 \text{ eV}$ , $\sim29.6$ every $\text{keV}$

## Reaction Rates

- $\ce{H2}$ Formation on Grains: a conventional dust-to-gas ratio, a conventional formation rate of $1.2 \times 10 ^ { - 12 } \left( n / 10 ^ { 5 }\right) \text { cm} ^ { - 3 } \text{ s} ^ { - 1 }$

## Numerical Method

- Solve the steady-state rate equations