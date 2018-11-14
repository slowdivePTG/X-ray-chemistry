# Different Methods of Calculating the X-ray Ionization
### Starting with the simpliest
> Krolik & Kallman 1983

### Not difficult to get the primary rates

### How to get the secondary rates (H/He)
> Latif+ 2015

### How to get the secondary rates (H$_2$/He)

> Stäuber+ 2005
>
> Maloney+ 1996

Consider a mean energy per ion pair $W(E)={E}/{N(E)}$. $E$ is the initial energy, while $N(E)$ is the number of produced ionizations in the gas, which, for a mixture of H, He and H$_2$. According to Dalgarno et al. (1999), an electron with an initial energy of $1\text{ keV}$ will then lead to $\approx27$ ionizations for such mixture.

Then we calculate the secondary ionization rate by:
$$
\zeta _ { \mathrm { H } _ { 2 } } = \int F ( E , r ) \sigma _ { \mathrm { eff } } ( E ) \frac { E } { W ( E ) x \left( \mathrm { H } _ { 2 } \right) } \mathrm { d } E \quad \left[ \mathrm { s } ^ { - 1 } \right]
$$

$x(\text{H}_2)\approx0.5$, $\sigma _ { \mathrm { eff } } ( E )$ is the **effective or total photoionization cross section** at energy $E$, including Compton scattering, assuming **each** scattering process will ionize **a** hydrogen molecule.

As **a first approximation**, The electron impact ionization rates of other molecules
or atoms can be calculated by ***multiplying*** the **$\text{H}_2$ ionization rate** with the **ratio of the electron impact cross sections of species $i$ to $\text{H}_2$ at a specific energy** (Maloney et al. 1996) 
$$
\zeta_i=\zeta _ { \mathrm { H } _ { 2 } }\frac{\sigma_i(E)}{\sigma_{\mathrm { H } _ { 2 }}(E)}
$$
Usually we can take an **average energy** and neglect the error due to the energy dependence of the cross sections or to our estimations are within a factor of a few but certainly $\le 10\times​$ 