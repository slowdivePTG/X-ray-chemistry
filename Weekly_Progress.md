# The Weekly Progress
**Since Nov. 10, 2018**

In the autumn semester, hopefully I'll record my progress every Thursday morning

## Before Nov. 10, 2018
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




## Nov. 10, 2018
1. Trace the most important reactions using the Jacobian Matrix pd(i,j)
   $$
   pd(i,j)=\frac{\partial}{\partial n(j)}\left(\frac{\text{d}n(i)}{\text{d}t}\right)
   $$

   $$
   \left(\frac{\text{d}n(i)}{\text{d}t}\right)_j=n(j)\cdot pd(i,j)
   $$

   In `krome_oed.f90`, the `jex` function calculate the Jacobian Matrix.

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
  x(KROME_idx_H2)  = 0.5d0   * xH !In this case we actually use  x(KROME_idx_H)  = 0.5d0   * xH, which is not true
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



## Nov. 15, 2018 

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
$$
n_t(\ce{H})=n(\ce{H})+2n(\ce{H2})
$$


​	The modification of Fortran code in `krome_subs.f90` is shown here

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



## Nov. 22, 2018

1. More details on secondary ionization

   The secondary ionization rate for $\ce{H}$ ( Stäuber 2005, Maloney 1996, ): 
   $$
   \zeta_H^{(2)}=\int_{E_{min}}^{E_{max}}\frac{F(E)}{E}N_{sec}(E,x_e)\sigma(E)\text{d}E\\
   N_{sec}(E,x_e)=\frac{E-E_{th}}{W(E)}\approx\frac{E}{W(E)}
   $$
   $N_{sec}(E)$ is the number of secondary **ionizations** per unit energy produced by primary photoelectrons$W(E)$ is the mean energy expended to produce an ion pair through rapid electron process

   #### A BIG MISTAKE HERE LAST WEEK!

   $N_{sec}(E)$ is not the number of secondary electrons but the number of ion pairs produced by a secondary electron. **WE DON’T COUNT ELECTRONS HERE! **

   ### More comments on the formula

   - $W(E)$ is nearly independent of $E$ if $E>200\text{ eV}$ , which is easy to satisfied in our case

   - $N_{sec}(E,x_e)$ is dependent on $x_e$. When $x_e>1\%$ , the energy in photoelectrons will be mainly lost to Coulomb Interaction with ambient thermal electrons.  In our case, $n_e/n_\ce{H}<10^{-4}$ . For weakly ionized gases,  $\approx40\%$ of the primary electron energy will be used for ionization (Krolik 1983, Shull 1985) , then for a secondary electron with energy $1\text{ keV}$ , the number of $\ce{H}$ it can ionize is:
     $$
     N=\frac{0.40\times1\text{ keV}}{13.6\text{ eV}}\approx30
     $$
     More precise calculation ( Glassgold & Langer 1973, Dalgarno 1999, Glassgold 2012 ) shows that in $\ce{H2 + He}$ neutral gas, $47\%$ of energy goes to ionization, $47\%$ in $\ce{H2}$ and $\ce{He}$ excitation, the rest goes for heating. $N_{sec}(E)\approx27$ and thus we can take $W(E)\approx37\text{ eV}$.

   ### The formula I actually use

   $$
   \zeta _ { \mathrm { tot } } ^ { i } = \zeta _ { \mathrm { p } } ^ { i } + \sum _ { j = \mathrm { H } , \mathrm { He } } \frac { n _ { j } } { n _ { i } } \zeta _ { \mathrm { p } } ^ { j } \left\langle \phi ^ { i } \right\rangle
   $$

   - The numbers of secondary ionization of $\ce{H}$ and $\ce{He}$ per primary ionization are taken from Shull 1985
     $$
     \begin{aligned} \phi ^ { \mathrm { H } } \left( E , x _ { \mathrm { e } } \right) & = \left( \frac { E } { 13.6 \mathrm { eV } } - 1 \right) 0.3908 \left( 1 - x _ { \mathrm { e } } ^ { 0.4092 } \right) ^ { 1.7592 } \\ \phi ^ { \mathrm { He } } \left( E , x _ { \mathrm { e } } \right) & = \left( \frac { E } { 24.6 \mathrm { eV } } - 1 \right) 0.0554 \left( 1 - x _ { \mathrm { e } } ^ { 0.4014 } \right) ^ { 1.660 } \end{aligned}
     $$

   - Can be rewritten like this:
     $$
     \zeta_{tot}^\ce{H}=\zeta_p^\ce{H}(1+\langle\phi^\ce{H}\rangle)+\zeta_p^\ce{He}\frac{n_\ce{He}}{n_\ce{H}}\langle\phi^\ce{H}\rangle\\
     \zeta_{tot}^\ce{He}=\zeta_p^\ce{He}(1+\langle\phi^\ce{He}\rangle)+\zeta_p^\ce{H}\frac{n_\ce{H}}{n_\ce{He}}\langle\phi^\ce{He}\rangle
     $$
     which average $\phi$ over the X-ray spectrum $F(E)$

      

2. Test all the species listed last week

   ![](Pics/list1.png)

   ![](Pics/list2.png)



## Nov. 29, 2018

1. Recalculate the ionization rate using the primal formula
   $$
   \zeta_{tot}^\ce{H}=\zeta_p^\ce{H}+\frac{n_\ce{He}}{n_\ce{H}}\int_{E_{min}}^{E_{max}}\frac{F(E)}{E}e^{-\tau(E)}\phi^\ce{H}\sigma_{\ce{He}}(E)\text{d}E+\int_{E_{min}}^{E_{max}}\frac{F(E)}{E}e^{-\tau(E)}\phi^\ce{H}\sigma_{\ce{H}}(E)\text{d}E
   $$
   rather than the simplified one
   $$
   \zeta_{tot}^\ce{H}=\zeta_p^\ce{H}(1+\langle\phi^\ce{H}\rangle)+\zeta_p^\ce{He}\frac{n_\ce{He}}{n_\ce{H}}\langle\phi^\ce{H}\rangle
   $$
   and compare the results.

   When we set $n_\ce{H}=2\times10^4\text{ cm}^{-3},n_\ce{He}=2\times10^3\text{ cm}^{-3},J_{X21}=0.1,T=160\text{ K}​$ , we get
   $$
   \zeta_\ce{H}=4.09\times10^{-18}\text{ s}^{-1},\quad\zeta_\ce{He}=3.61\times10^{-18}\text{ s}^{-1}\quad(\text{Primal})\\
   \zeta_\ce{H'}=7.23\times10^{-18}\text{ s}^{-1},\quad\zeta_\ce{He'}=6.07\times10^{-18}\text{ s}^{-1}\quad(\text{Simplified})\\
   \frac{\zeta_\ce{H}}{\zeta_\ce{H'}}\approx\frac{\zeta_\ce{He}}{\zeta_\ce{He'}}\approx0.56
   $$

   Since we take $E_{min}=2\text{ keV},E_{max}=10\text{ keV}$ , and in our case, $F(E)\propto E^{-1.5}$, $ \sigma(E)\propto E^{-3}$ , $\phi(E,x_e)\propto E$, $e^{-\tau(E)}\sim1$, we have
   $$
   \zeta^{(2)}=\int_{E_{min}}^{E_{max}}\frac{F(E)}{E}\phi(E)\sigma(E)\text{d}E=F_0\phi_0\sigma_0\cdot\int_{2}^{10}E^{-4.5}\text{d}E=\frac{2^{-3.5}-10^{-3.5}}{3.5}F_0\phi_0\sigma_0\approx0.025F_0\phi_0\sigma_0\\
   $$
   and
   $$
   \int_{E_{min}}^{E_{max}}\frac{F(E)}{E}\sigma(E)\text{d}E=F_0\sigma_0\int_{2}^{10}E^{-5.5}\text{d}E\approx0.0098F_0\sigma_0\\
   \int_{E_{min}}^{E_{max}}{F(E)}\phi(E)\text{d}E=F_0\phi_0\int_{2}^{10}E^{-0.5}\text{d}E\approx3.50F_0\phi_0\\
   \int_{E_{min}}^{E_{max}}{F(E)}\text{d}E=F_0\int_{2}^{10}E^{-1.5}\text{d}E\approx0.078F_0\\
   \Rightarrow \zeta^{(2)'}\approx\frac{0.0098F_0\sigma_0\cdot3.50F_0\phi_0}{0.078F_0}\approx0.044F_0\phi_0\sigma_0\approx0.57\zeta^{(2)}
   $$














<<<<<<< HEAD

=======
>>>>>>> origin/master
2. Why does KROME use a simplified formula to calculate the total ionization rate?

   - $\zeta_p^\ce{H},\zeta_p^\ce{He}$ are stored in data-files rateH.dat and rateHe.dat (column density *v.s.* primary ionization rate)
   - To calculate $\zeta^{(2)}$ the program needs to read $x_e,n_\ce{H},n_\ce{He}$ for each calculation
   - By using the simplified formula, we may avoid integration

   Here is part of the codes (`krome_subs.f90`):

   ```fortran
       T = Tgas
       Trad = 2d4
       ncolH = num2col(n(idx_H),n(:))
       ncolHe = num2col(n(idx_He),n(:)) !number density to column density
       logHe = log10(ncolHe) !take log
       logH = log10(ncolH)
       xe = min(n(idx_e) / (get_Hnuclei(n(:)) + 1d-40), 1d0)
       user_xray_H = fit_anytab2D(user_xray_H_anytabx(:), &
           user_xray_H_anytaby(:), &
           user_xray_H_anytabz(:,:), &
           user_xray_H_anytabxmul, &
           user_xray_H_anytabymul, &
           logH,logHe-logH)
           !linear interpolation to find the proper rate for the column density
       phiH = .3908d0*(1e0-xe**.4092)**1.7592 * 327.832286034056d0 ! avoid integration
       ratexH = 1d1**user_xray_H
       user_xray_He = fit_anytab2D(user_xray_He_anytabx(:), &
           user_xray_He_anytaby(:), &
           user_xray_He_anytabz(:,:), &
           user_xray_He_anytabxmul, &
           user_xray_He_anytabymul, &
           logH,logHe-logH)
       phiHe = .0554d0*(1d0-xe**.4614)**1.666 * 180.793458763612d0
       ratexHe = 1d1**user_xray_He
       
       k(:) = small !inizialize coefficients
   
       !H -> H+ + E
       k(1) = small + ((ratexH &
           * (1d0+phiH) + n(idx_He)&
           /(n(idx_H)+1d-40) * ratexHe * phiH)&
           * J21xray)
   
       !HE -> HE+ + E
       k(2) = small + ((ratexHe &
           * (1d0+phiHe) + n(idx_H)&
           /(n(idx_He)+1d-40) * ratexH * phiHe)&
           * J21xray)
           
       print '(a10,E15.8)',"XrateH:",log10(k(1))
       print '(a10,E15.8)',"XrateHe:",log10(k(2))
       coe(:) = k(:) !set coefficients to return variable
   ```



## Dec. 5,  2018

1. Try to repeat some results in former papers…but pretty difficult to do
   - Krolik 1983 did not consider the X-ray ionization of $\ce{H2}$

     > Dec. 12 review: Actually, $\ce{H2}$ ionization is considered with an approximate model (Brown and Gould’s 1970)

   - Those who have considered the x-ray ionization of $\ce{H2}$ usually have too complex physical problems and models, which means they are not easy to fully understand and repeat within hours

   - The model we consider is simple and does not include heating/cooling process and totally ignore UV-photon process
2. Add molecular hydrogen formation process to the network (from react_primordial, primordial rates from several authors mostly based on Abel et al. 1997 + Grassi et al. 2014)



## Dec. 12, 2018

1. Reread and try to repeat the results in Krolik 1983. 

   [A Review on Krolik 1983](Paper_Review/Krolik_1983.md)

   - Modify the codes
     - Initial abundances

     - Longer time period (steady-state solutions) $\Delta t=10^8\text{ yrs}$

       (Strange tendency appears when $\Delta t>10^8\text{ yrs}$, abundances of some species changes rapidly)

     - Set two branches for $\ce{H2}$ ionization & dissociation

     - Add $\ce{H2}$ formation process on grains
   - Step 1. Still use the power law spectrum,

     - It is the total ionization rate rather than the detail of the spectrum that is the most important to the chemistry

2. A new paper on the enhanced molecular ionization in the central molecular zone of our Galaxy

   [Molecular Ionization Rates and Ultracompact Dark Matter Minihalos, Silk, J. 2018, PRL](Paper_Review/Silk_2018.md)



## Dec. 20, 2018
1. Grain Process

   - It’s important to find out how $\ce{H2}$ molecules form on the grain surface as well as how KROME deal with the process 
     $$
     \ce{H + H + dust -> H2 +dust}
     $$

   - Theoretically, KROME uses
     $$
     \frac { \mathrm { d } n _ { \mathrm { H } _ { 2 } } } { \mathrm { d } t } = \frac { \pi } { 2 } n _ { \mathrm { H } } v _ { g } \sum _ { j \in [ \mathrm { C } , \mathrm { Si } ] } \sum _ { i } n _ { i j } a _ { i j } ^ { 2 } \epsilon _ { j } \left( T , T _ { i } \right) \alpha \left( T , T _ { i } \right)
     $$
     where $v_g$ is the gas thermal velocity, $a_{ij}$ is the size of the grain, $T_i$ is the dust temperature, $\epsilon_j$ depends on the type of the dust and $\alpha$ is the sticking coefficient

   - The rate is defined in the file `krome_dust.f90`

     ```fortran
     function krome_H2_dust(nndust,Tgas,Tdust,nH,H2_eps_f,myvgas)
         !H2 formed on dust (1/cm3/s)
         use krome_constants
         use krome_commons
         real*8::H2_dust, krome_H2_dust,Tgas,Tdust(:)
         real*8::myvgas,H2_eps,nndust(:),nH,H2_eps_f
         integer::i
     
         H2_dust = 0.d0
         do i = 1,size(Tdust)
           H2_eps = H2_eps_f(Tgas, Tdust(i))
           H2_dust = H2_dust + 0.5d0 * nH * myvgas * nndust(i) &
               * krome_dust_asize2(i) &
               * pi * H2_eps * stick(Tgas, Tdust(i))
         end do
     
         krome_H2_dust = H2_dust
     
       end function krome_H2_dust
     ```

     as well as related functions. Again in `krome_ode.f90` this rate is added to the total rate of $\ce{H2}$ formation. The process is shown in `kromeobj.py` where

     ```python
     #add H2 formation on dust
     if(self.useDustH2const):
         if("H"==specs[idnw].name): x += " - 2d0*nH2dust"
         if("H2"==specs[idnw].name): x += " + nH2dust"
     ```

2. Slightly modify the X-ray ionization

   - In Krolik 1983, there are two branches for molecular Hydrogen ionization (See **X-ray** module in the [review](https://github.com/slowdivePTG/X-ray-chemistry/blob/master/Paper_Review/Krolik_1983.md))

   - Modify the `krome_subs.f90`

     ```fortran
     !H2 -> H+ + H + E
     k(36) = rateEvaluateOnce(36)
     
     !H2 -> H2+ + E
     k(38) = rateEvaluateOnce(38)
     
     !H -> H+ + E
     k(4452) = small + ((ratexH &
         * (1d0+phiH) + n(idx_He)&
         /(n(idx_H)+2*n(idx_H2)+1d-40) * ratexHe * phiH)&
         * J21xray)
        
     !1keV cross section ratio
     k(14) = k(14) + 150*k(4452) !C
     k(22) = k(22) + 400*k(4452) !O
     k(20) = k(20) + 280*k(4452) !N
     k(19) = k(19) + 7*k(4452) !Mg
     k(36) = k(36) + 2*k(4452)*0.2
     k(38) = k(38) + 2*k(4452)*0.8
     
     !Many molecular species are also included
     
     !HE -> HE+ + E
         k(4453) = small + ((ratexHe &
             * (1d0+phiHe) + (n(idx_H)+2*n(idx_H2))&
             /(n(idx_He)+1d-40) * ratexH * phiHe)&
             * J21xray)
     ```

3. [Repeat Krolik’s results](https://github.com/slowdivePTG/X-ray-chemistry/blob/master/KROME/build_dustH2/data/alpha.ipynb)

   - Cosmic ray
     - well matched, except for several species such as $\ce{HNO+}$ which has a larger $\alpha$.
     - The difference in $\alpha$ between stronger and weaker ionization rates is larger.
   - X-ray
     - For lower ionization rate (Jx21=0.08 and 8), the result is not far from Krolik’s.
     - For high ionization rate (Jx21=80), a strange problem occurs at about 20 million yrs, when the abundances of many species and reaction rates change by a few order of magnitude ‘in a sudden’. Perhaps because of some calculation errors in the program?
     - There seems not to be a state of chemical equilibrium, the abundance of molecular Hydrogen continue to go down.

4. Ameliorate [the program to trace the important species](https://github.com/slowdivePTG/X-ray-chemistry/blob/master/KROME/build_dustH2/data/Trace.ipynb)



## Dec. 27, 2018

1. Plot and compare the $\alpha$ of Krolik’s and the calculation results

![](./KROME/build_dustH2/data/Table1.png)

![](./KROME/build_dustH2/data/Table2.png)

![](./KROME/build_dustH2/data/Table3.png)

![](./KROME/build_dustH2/data/Table4.png)

## To do list

- Check the step-length of KROME differential equation solver
- Check if there is any threshold (bound) of abundances 