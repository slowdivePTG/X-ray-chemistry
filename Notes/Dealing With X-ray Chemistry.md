#Dealing With X-ray Chemistry

## X-Ray--irradiated Molecular Gas. I. Physical Processes and General Results

> **Maloney+1996**

### What to calculate

- Chemical Abundances
- Heating & Cooling Rates
- Equilibrium Temperature
- Intensity of Important Lines

### X-ray processes

#### Energy Deposition, Ionization, Heating Rates

- The physical and chemical state of the dense cloud is insensitive to the shape of the X-ray spectrum, but depend mostly on the ***ratio*** of **the local X-ray energy deposition rate per particle $H_X$** to **the gas density $n$**
  $$
  H_ {  { X } } = \int _ { E _ { \min } } ^ { E _ { \max } } \sigma _ { \mathrm { pa } } ( E ) F ( E ) \mathrm d E
  $$
  Here we assume that the Auger electrons contributes an energy equal to the photoionization threshold

  - Ionization rate $\zeta_X\sim n H_X$
  - Molecular formation and cooling rate $\sim n^2k$ , $k$ is a rate coefficient

- Total ionization rate is dominated by the secondary ionization rate
  $$
  \zeta_T\approx N_{sec}(x_e)H_X
  $$
  For $x_e\leq 1\%$ , approximately $40\%$ of the energy goes to the ionization, therefore $N_{sec}(x_e)\sim26(30)$ per $\mathrm{keV}$ of primary photoelectron energy for molecular or atomic hydrogen

  Above $x_e\sim1\%$, more energy goes to Coulomb interactions with ambient thermal electrons

- Heating and excitation rates due to the non thermal electrons are functions of both **the ionization fraction** and **the chemical composition**
  $$
  \Gamma_X\approx f_kH_X
  $$
  $f_k$ is the heating efficiency $\sim 30\%$ to $40\%$ under low $x_e$

  - Atomic

    - Low heating efficiency
    - Once the energy of secondary electrons drop below the exception threshold of Ly$\alpha$ ($10.2\ \mathrm{eV}$), all of the remaining secondary electron energy goes into heating, which is the only way of heating for neutral gas (or low $x_e$)
    - For higher $x_e$ , the radiative recombination energy of protons may be lost to the gas

  - Molecular

    - Much higher heating efficiency

    - Much of the ionization energy may go into heating the gas

    - The $\ce{H2+}$ ion will soon react to produce $\ce{H3+}$
      $$
      \ce{H2+ + H2 -> H3+ + H}, \text{ release energy of } 11 \text{ eV}
      $$
      The $\ce{H3+}$ ion may dissociatively recombine with an electron, so much of the ionization energy goes into the kinetic energy of the products

      For the $11\ \mathrm{eV}$ released, $2\ \mathrm{eV}$ goes to the ionization, $8\ \mathrm{eV}$ goes to heating

    - Significant amount of the primary nonthermal photoelectron energy can go into ***excitation*** of **the rotation-vibration bands of $\ce{H2}​$** & **dissociative electrons**

#### UV photon flux from secondary electrons

- Internally generated **FUV photons** ($6\ \mathrm { eV } \lesssim h \nu \lesssim 13.6\ \mathrm { eV }$) produced by energetic non-thermal electrons colliding with hydrogen atoms and molecules -- emission of Ly$\alpha​$ and Lyman-Werner band photons

> Lyman and Werner absorption bands of molecular hydrogen, $11.2 \sim 13.6 \ \mathrm { eV }$

- $x_e\lesssim0.01$, over $40\%$ of the energy deposited by X-ray goes to FUV photons -- the dense, opaque (to FUV) regions for X-ray photons can chemically resemble photodissociation regions (PDRs) with $\ce{Fe+,Si+,C+}$ and large abundances of neutral atomic oxygen
- Most of the FUV is absorbed by dust, but the gas is generally heated by the X-ray-induced photoelectrons -- a much higher ratio ($\sim0.1-1$) of **gas heating** to **grain heating** than that of PDRs ($\sim10^{-3}-10^{-2}$)
- Nearly all FUV produced in atomic gas is Ly$\alpha$, thus not energetic enough to ionize $\ce{C}$ or $\ce{S}$

#### Excitation of molecular hydrogen vibration-rotation levels

- Direct collisional excitation from the ground rotation and vibration states
  - The apparent excitation temperature is determined by the relative collisional cross sections
- Cascade following collisional excitation of excited electron states
  - Einstein *A*-coefficients -- the level distribution is essentially the same as in the case of UV pumping of the electron states

#### The effect of X-ray on molecular and atomic species

- For atomic Hydrogen and Helium, they assume that the secondary ionization dominates

- For other atomic species including $\ce{C,O,S,Si,Fe}​$, they also introduce the primary ionization using the cross section of Verner et. al. (1993)

  - For $\ce{C,O}$, they assume X-ray ionization produces singly charged ions because of the rapid charge exchange with hydrogen
  - For $\ce{S,Si,Fe}$, they assume that X-ray ionization produces doubly charged ions and explicitly calculate the relative abundance of neutral, singly charged and doubly charged species

- Every primary ionization of a heavy element in a molecule leads to **a doubly charged species** because of the Auger Effect, which then dissociates into singly charged ions

- Sometimes the secondary ionization of heavy elements can also be significant, and in the lowest order
  $$
  \zeta _ { s , m } = \zeta _ { s , \ce{H} } \frac { \sigma _ { \mathrm { ei } , m } ( E ) } { \sigma _ { \mathrm { ei } , \mathrm { H } } ( E ) } \mathrm { s } ^ { - 1 }
  $$

  - $\sigma_{ \mathrm { ei } }(E) $ is the electron-impact cross section at energy $E$ , a few hundred $\mathrm{eV}$s for primary electrons and $50\ \mathrm{eV}$ for secondary electrons
  - A mean value of the ratio from $0.1$ to $1\ \mathrm{keV}​$ is obtained, but the dependence on energy is small
  - Typically the ratio is $3\sim7$

### Grain heating and cooling mechanisms

- Heating
  - **Heating source:** The grain opacity in the FUV wavelength is substantial, so most FUV photons generated by the non-thermal electrons are absorbed by the grains
  - Assume that all FUV photons generated by the non-thermal electrons are **locally** absorbed
  - Include FUV photons generated by radiative recombination, assuming $13.6\ \mathrm{eV}$ of photon energy per recombination
  - ...

###Gas cooling mechanisms

- Highest temperature
  - Collisional excitation of Ly$\alpha$ and forbidden and semi-forbidden transitions of $\left[\mathrm{OI}\right](\lambda \lambda 6300,6363)$, $[\ce{CI}](\lambda \lambda 9823,9850 )$, $[\mathrm{Fe} \mathrm{II}](1.26 \text { and } 1.64 \mu \mathrm{m})$, $[\mathrm{S} \mathrm{II}]({\lambda} \lambda 6716,6731)$
- Below $T\sim 5000\ \text K$
  - Fine structure transitions of neutral and singly charged atomic species such as $[\mathrm{O} \mathrm{I}](63 \mu \mathrm{m})$, $[\operatorname{SiII}](35 \mu \mathrm{m})$, $[\mathrm{C} \mathrm{II}](158 \mu \mathrm{m})$, $[\mathrm{CI} ](369 \text { and } 609 \mu \mathrm{m})$
- Cooling by the rotational and vibrational transitions of $\ce{H2,H2O,CO}$
- Cooling by the rotational lines of $\ce{OH}$
- Electron impact excitation
- Cooling from $\ce{H2}$ collision dissociation



## X-ray chemistry in the envelopes around young stellar objects

> **Stäuber+2005**

### X-ray induced chemistry

####Direct X-ray ionizations and dissociations

- Auger process

  - X-rays ionize heavy elements preferentially by removing the **K-shell electron**. The vacancy is then filled by a cascade of radiative (fluorescent) and non-radiative Auger transitions.
  - Other electrons and X-ray photons (can be neglected) are emitted by the ion, leading finally to a multiply ionized species

- They consider the ionization of atoms and atomic ions leading to a **singly and doubly ionized state** by **calculating explicitly the cross sections** according to Verner et al. (1996).

- The **probability distribution for the number of ejected electrons for inner shell ionizations** are taken from Kaastra & Mewe (1993)

- The (primary) X-ray ionization rate of species $i$ at a point $r$ 

  $$
  \zeta _ { i } = \int F ( E , r ) \sigma _ { i } ( E ) \mathrm { d } E \quad \left[ \mathrm { s } ^ { - 1 } \right]
  $$

- Molecule (follow Maloney 1996)
  - Consider only diatomic molecules for direct X-ray impact (not significant compared to the secondary ionization)
  - Assume that the molecule dissociates into singly charged ions after inner shell ionization
  - The cross sections for this process are calculated by **adding the atomic cross sections**
  - 

####X-ray induced electron impact reactions

- In Maloney 1996

#####Ionizations

- The secondary ionization rate per hydrogen molecule
  $$
  \zeta _ { \mathrm { H } _ { 2 } } = \int F ( E , r ) \sigma _ { \mathrm { eff } } ( E ) \frac { E } { W ( E ) x \left( \mathrm { H } _ { 2 } \right) } \mathrm { d } E \quad \left[ \mathrm { s } ^ { - 1 } \right]
  $$
  $E​$ is the energy of the fast electron, $W(E)​$ is the mean energy per ion pair,  $x \left( \mathrm { H } _ { 2 } \right) \approx 0.5​$ is the fractional abundance of molecular hydrogen, $\sigma_{\mathrm{eff}}​$ is the **effective or total photoionization cross section**, including the cross section for Compton scattering, assuming that each scattering process will ionize a hydrogen molecule

- $\zeta_i$ for other species can be calculated as a first approximation by multiplying the $\ce{H2}$ ionization rate with the ratio of the electron impact cross sections of species $i$ to $\ce{H2}$ at a specific energy

#####UV photodissociations and photoionizations

...



## X-ray ionization of heavy elements applied to protoplanetary disks

> **Ádámkovics+2011**

### Ionization Rates

- X-ray Ionization

  - Direct ionization immediately following absorption (photoionization, fluorescence, and the Auger effect)
    $$
    \zeta _ { \mathrm { A } , \mathrm { dir } } = \int _ { E _ { 0 } } ^ { \infty } \mathrm d E F ( E ) \sigma _ { \mathrm { A } } ( E )
    $$

    $$
    \zeta _ { \mathrm { dir } } = \sum _ { \mathrm { A } } x _ { \mathrm { A } } \zeta _ { \mathrm { A } , \mathrm { dir } }
    $$

  - Secondary ionization due to the secondary electrons resulting from the direct ionization
    $$
    \zeta _ { \mathrm { A } , \mathrm { sec } } = \int \mathrm d e n _ { \mathrm { sec } } ( e ) v ( e ) \sigma _ { \mathrm { A } , \mathrm { ion } } ( e )
    $$
    where $n_{\mathrm{sec}}(e)$ is the absolute number distribution, $v(e)$ is the speed of a secondary electron
    $$
    \zeta _ { \mathrm { sec } } = \sum _ { \mathrm { A } } x _ { \mathrm { A } } \zeta _ { \mathrm { A } , \mathrm { sec } }\approx\zeta _ { \mathrm { H } , \mathrm { sec } } + x _ { \mathrm { He } } \zeta _ { \mathrm { He } , \mathrm { sec } }
    $$

  - Practical Implementation
    $$
    \zeta = \zeta _ { \mathrm { dir } } + \zeta _ { \mathrm { sec } }\approx \zeta _ { \mathrm { sec } }
    $$
    For a lack of knowledge in the distribution of secondary electrons, they use a semi-empirical formula
    $$
    \zeta _ { \mathrm { sec } } \simeq \int _ { E _ { 0 } } ^ { \infty } \mathrm d E F ( E ) \overline { \sigma } ( E ) \frac { E } { W }
    $$
    For individual heavy species
    $$
    \frac { \zeta _ { \mathrm { A } , \mathrm { sec } } } { \zeta _ { \mathrm { sec } } }  \simeq \frac { \zeta _ { \mathrm { A } , \mathrm { sec } } } { \zeta _ { \mathrm { H } , \mathrm { sec } } + x _ { \mathrm { He } } \zeta _ { \mathrm { He } , \mathrm { sec } } }
    $$
    Therefore
    $$
    \zeta _ { \mathrm { A } , \mathrm { sec } } \simeq \frac { \zeta _ { \mathrm { A } , \mathrm { sec } } } { \zeta _ { \mathrm { H } , \mathrm { sec } } + x _ { \mathrm { He } } \zeta _ { \mathrm { He } , \mathrm { sec } } } \zeta
    $$
    If we ignore Helium collisions
    $$
    \zeta _ { \mathrm { A } , \mathrm { sec } } \simeq \frac { \int \mathrm d e f _ { \mathrm { sec } } ( e ) \overline { v } ( e ) \sigma _ { \mathrm { A } , \mathrm { ion } } ( e ) } { \int \mathrm d e f _ { \mathrm { sec } } ( e ) \overline { v } ( e ) \sigma _ { \mathrm { H } , \mathrm { ion } } ( e ) } \zeta \equiv \frac { \left\langle \sigma _ { \mathrm { A } , \mathrm { ion } } \right\rangle } { \left\langle \sigma _ { \mathrm { H } , \mathrm { ion } } \right\rangle } \zeta
    $$
    where $f_\mathrm{sec}(e)\equiv n _ { \mathrm { sec } } ( e ) / n _ { \mathrm { sec } }$ is the relative secondary energy distribution

    To avoid calculate distribution, they replace the ratio of the two cross-section integrals by the ratio of the cross-sections at some typical energy (Table 1, Tarawa & Kato (1987))

  - The theory applies generally to any ionization stage, though ions beyond $\ce{A2+}$ have negligible abundances because of rapid charge exchange with atomic and molecular hydrogen and other species

### Direct Rates by Shell

- Consider **the ionization state of the product** and **the number of electrons released**

- Direct ionization can produce a variety of charge states depending on the X-ray energy, i.e., on whether the K, L, or M threshold (in Table 2)
  $$
  \zeta _ { \mathrm { A } , \mathrm { dir } } = \zeta _ { \mathrm { K } } + \zeta _ { \mathrm { L } } + \zeta _ { \mathrm { M } }
  $$
  