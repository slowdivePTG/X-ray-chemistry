#The Way KROME Calculates 'auto' Ionization Rates

> Latif+ 2015

**The total X-ray ionization rate for certain species $i$**
$$
\zeta_x^i=\zeta_p^i+\sum_{j=H,He}\frac{n_j}{n_i}\zeta_p^j\langle\phi^j\rangle
$$

where $n_j​$ is the number density.

- The primary ionization rate

$$
\zeta_p^i=\frac{4\pi}{h}\int_{E_{min}}^{E_{max}}\frac{J(E)}{E}e^{-\tau(E)}\sigma^i(E)\text{d}E\\
J(E)=J_{X,21}\left( \frac{E}{1\text{keV}}\right) ^{-1.5}\times10^{-21}\text{ erg cm}^{−2}\text{ s}^{-1}\text{ Hz}^{-1} \text{ sr}^{-1}
$$

- Optical depth $\tau$ is determined by the size of the cloud as well as the abundance of each species

$$
\tau(E)=\sum_{i=\ce H,\ce He}N_i\sigma^i=\frac{\lambda_J}{2}\sum_{i=\ce H,\ce He}n_i\sigma^i
$$

- To estimate the size we take Jeans length

$$
\lambda_J=\sqrt{\frac{\pi kT}{G\rho \mu m_p}}
$$

where the mean molecular mass
$$
\mu=\frac{1.00794n_H+4.0026022n_{He}}{n_H+n_{He}}
$$

- $\sigma^i$ comes from Verner $\&$ Ferland (1996)

- $\langle\phi^j\rangle​$ is much more complex. For $E>100​$eV and H, He mixture

$$
\phi^H(E,x_e)=\left( \frac{E}{13.6\text{eV}}-1\right)0.3908(1-x_e^{0.4092})^{1.7592}\\
\phi^{He}(E,x_e)=\left( \frac{E}{24.6\text{eV}}-1\right)0.0554(1-x_e^{0.4614})^{1.666}
$$

where $x_e​$ is the electron fraction
$$
\langle\phi^i\rangle=\frac{\int J(E)\phi^i(E,x_e)\text{d}E}{\int J(E)\text{d}E}
$$


**In the datafile that KROME sets**
$$
E_{min}=2\text{ keV}\qquad E_{max}=10\text{ keV}\\
T=160\text{ K}\\
J_{X,21}=1\\
$$

- The datafile is a $30\times30$ table which shows $\log(N_{\ce H}), \log(N_{\ce H})-\log(N_{\ce He})$, $N$ stands for the column density. The size of the cloud is estimated by its Jeans length and the number density $n$

  $$
  n^i=\frac{N^i}{\lambda_J/2}
  $$

- **But wait here** (Mar. 22), this is actually not the formula applied. The datafile utilizes an approximation
  $$
  N^i=1.83\times{10}^{21}\left(\frac{n^i}{1000}\right)^{2/3}
  $$
  by assuming the number of $\ce{H/He}$ in different molecular clouds as a constant

- The third column is $\log(\zeta_p^i(\text{s}^{-1}))$ showing the **primary ionization rate**. It varies only because the total optical depth $\tau$ varies

- To get the certain X-ray ionization rate
  - the KROME package first turns the **number densities** of $\ce{H, He}$ into **column densities**. Note that the Jeans length now does not only depend on $\ce{H,He}$ but also other atoms. 
  - Then it reads the datafile `rateH.dat/rateHe.dat` and does **2-Dimension linear interpolation** to find the ionization rate.