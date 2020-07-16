# Basic KROME for X-ray Chemistry

In this project, we use the *astrochemistry* package [`KROME`](packagekromepackage.org) to perform all our X-ray chemistry simulations. This documentation concludes the basic set-ups of Chang Liu's undergraduate research (under the supervision of Prof. Xian Chen and Prof. Fujun Du).

>  The official documentation
>
>  - [https://bitbucket.org/tgrassi/krome/wiki/Home](https://bitbucket.org/tgrassi/krome/wiki/Home)

## A Quick Start

1. Prerequisites

   - Linux or macOS

   - Python

     - Python 2.7 (Python 3 is not supported)
     - `Numpy` and `Scipy`
     
- Fortran
  
  `KROME` needs a Fortran compiler, such as `gfortran` or `ifort`, the former is free and is now embedded in the `gcc` complier.
  

More information can be found in the [official documentation](https://bitbucket.org/tgrassi/krome/wiki/Prerequisities).

2. Getting Started

   - Clone `KROME` From Bitbucket

     ```shell
     git clone https://tgrassi@bitbucket.org/tgrassi/krome.git     
     ```
     
     This will create a folder called `krome/`. `KROME` is frequently updated so it is recommended to keep with the latest version
     
     ```shell
     cd krome && git pull origin
     ```
     
   - The 'Hello KROME!' test
   
     In the `krome` folder, run
   
     ```shell
     ./krome -test=hello
     ```
   
     The output should show something like
   
     ```
     ******************************
           WELCOME TO KROME
     ******************************
     
     This TEST is running with the following arguments:
      -test = hello
      -noSinkCheck = True
      -n = networks/react_hello
     ```
   
     that are information relative to the test, namely the name of the test (`hello`), a control to avoid sink species, and the network name (`networks/react_hello`). These options are stored in `tests/hello/options.opt`.
   
     Then
   
     ```
     ODEs needed: 7
     Reactions found: 2
     Species found: 3
     ```
   
     displays the number of the ODEs found, the number of the reactions, and the species found.
   
     ```
     Species list saved in build/species.log
     Species index initialization for gnuplot in build/species.gps
     Heating cooling index init for gnuplot in build/heatcool.gps
     Reactions saved in build/reactions.log
     ```
   
     It then shows the place where the list of species and reactions are stored (*.log*), including some `gnuplot` utilities (*.gps*). Since we mainly utilize `matplotlib` for visualization instead of `gnuplot`, the user will need a Python file based on `build/species.gps` for initialization of species index later.
   
     ```
     ODE partition: [3 atom/mols]  + [1 CR] + [1 PHOT] + [1 Tgas] + [1 dummy] = 7 ODEs
     ODEs list: FK1, FK2, FK3, CR, g, Tgas, dummy
     ```
   
     In this case the partition of the ODE has 3 species + cosmic rays + photons + Tgas + dummy. Note that cosmic rays and photons are included only for retro-compatibility and are no longer used. Dummy ODE is always zero, while dummy species always 1. These last four terms are internally employed by `KROME` and the user can ignore them. The user should employ a species array of 3 (in general krome_specs), while the internal length of the ODE array is 7 (in general krome_spec+4).
   
     ```
     Max number of reactants: 1
     Max number of products: 1
     ```
   
     in this case the maximum number of reactants and products is 1, since all the reactions are A->B.
   
     ```
     Jacobian non-zero elements: 4 over 49
     (8.16% of total elements, sparsity = 91.84%)
     solver info:
      MF: 222
      MOSS+METH+MITER: 2+2+2
      LWM: 166 LRW: 249
     ```
   
     Information on the Jacobian and on the solver: see DLSODES manual for further details. The sparsity is algebraic, hence this is the maximum sparsity allowed.
   
     ```
     ******************
     Reading coolants from data/coolZ.dat...
     ...
     ...
     ```
   
     Then KROME reads the network file and writes the files in the build\ folder.
   
     ```
     Everything done, goodbye!
     
     ************************************************
     HERE SHOULD BE A QUOTE
     ************************************************
     ```
   
     If everything went smoothly the user should see a goodbye message along with a random quote.
   
   - Compile and run the test
   
     `KROME` is a pre-processor. In the previous step we have created all necessary files (mainly Fortran files) in the `build/` directory.
   
     In the `build/` directory, if you have `ifort` compiler, type
   
     ```shell
     make
     ./test
     ```
   
     or if you have `gfortran` compiler, type
   
     ```shell
     make gfortran
     ./test
     ```
   
     then you should obtain the message
   
     ```
     Test OK!
     ```
   
     If there are anything wrong, check the prerequisites.

## Basic Operations

1. Chemical Network

   All astrochemical simulations on `KROME` start with a chemical network in a `network_file`

   ```shell
   ./krome -n=network_file
   ```

   `network_file` is a Comma-Separated Values (CSV) file with the follow default format

   ```
   idx,R,R,R,P,P,P,P,Tmin,Tmax,rate
   ```

   - `idx` - reaction index (integer)
   - `R` - a reactant (string)
   - `P` - a product (string)
   - `Tmin` and `Tmax` - the temperature limits of the reaction (double)
   - `rate` - chemical coefficient written in Fortran style (string)

   For example, the reaction `HCO + HNO -> H2CO + NO` has

   ```
   3637,HCO,HNO,,H2CO,NO,,,NONE,NONE,1.00e-12*exp(-9.76e+02/Tgas)
   ```

   the coefficient has a unit of $\text{cm}^{3(n-1)}/\text{s}$, where $n$ is the number of reactants.

2. How to run `KROME` (by using an optional file)

   To create necassary files for a specific model, the user may look through the official docs for [Options](https://bitbucket.org/tgrassi/krome/wiki/optionsALL). For our simple X-ray chemistry model for dense cores, apart from calling the chemical network, currently there is no need for other options, thus the command looks like

   ```shell
   ./krome -n=networks/x_grain
   ```

   Below are some of the possible options

   - `-project=NAME` build everything in a folder called `build_NAME/` instead of building all in the default `build/` folder. It also creates a `NAME.kpj` file with the krome input used.

   - `-dust=N,TYPE1,TYPE2,..., -dustOption=OPTIONS` 

     Even in a purely gas-phase model for cold, dense cores, the formation of H2 on the grain should be taken into account.

     - With `-dust=N,TYPE1,TYPE2,...`, we initialize the dust module by subdividing all dust into `N` bins times the type of dust employed. The dust can be carbon-based (graphite) or silicon-based (silicates) and the option `TYPE` allows to determine what grains are used. An example is `-dust=10,C,Si` that creates 10 bins of dust of graphite and 10 bins of silicates.
     - `-dustOptions=OPTIONS` activates the options related to the dust processes. For H2 formation on dust (Cazaux 2009), the `OPTIONS` should be `H2`.
     - **In a gas-grain model where H2 formation on the grains is automatically counted (like in ours), there is no need to call this module.**

   - `-checkConserv` check mass conservation during integration (slower).

## A Review of Fortran Files

Type `ls *.f90` in the `build/` directory, you will see all the Fortran files produced by the pre-processor

```
krome.f90              krome_gadiab.f90       krome_reduction.f90
krome_commons.f90      krome_getphys.f90      krome_stars.f90
krome_constants.f90    krome_grfuncs.f90      krome_subs.f90
krome_cooling.f90      krome_heating.f90      krome_tabs.f90
krome_coolingGH.f90    krome_ode.f90          krome_user.f90
krome_dust.f90         krome_phfuncs.f90      krome_user_commons.f90
krome_fit.f90          krome_photo.f90        test.f90
```

Here is a review for the most vital Fortran files.

### `test.f90`

In the `test.f90` file, we call the ODE solver `krome()` to numerically solve a large system of linear differential equations of chemical reactions. 

For example, first we set the gas temperature, visual extinction (Av), cosmic ray (CR) ionization rate, and the gas-to-dust ratio, and initialize the `krome` module BEFORE calling it.

```fortran
Tgas = 1d1 !gas temperature (K)
!user commons for opacity and CR rate
call krome_set_user_av(Av) !opacity Av (#)
call krome_set_user_crate(CR_Rate) !CR rate (1/s)
!user commans for gas/dust ratio - ONLY for empirical H2 formation rate on grains
call krome_set_user_gas_dust_ratio(Gas_To_Dust_Ratio)
!Initialization the krome module
call krome_init()
```

Then we set the initial densities for each species.

```fortran
xH = 2d4 !Hydrogen density
x(:) = Min_Dens !the array to store all densities
!initial densities (model EA2 Wakelam+Herbst 2008)
x(KROME_idx_H2)  = 0.5d0   * xH
x(KROME_idx_He)  = 9d-2   * xH
x(KROME_idx_N)   = 7.6d-5  * xH
x(KROME_idx_O)   = 2.56d-4 * xH
x(KROME_idx_Cj)  = 1.2d-4  * xH
x(KROME_idx_Sj)  = 1.5d-5  * xH
x(KROME_idx_SIj) = 1.7d-6  * xH
x(KROME_idx_Fej) = 2d-7   * xH
x(KROME_idx_Naj) = 2d-7   * xH
x(KROME_idx_Mgj) = 2.4d-6  * xH
x(KROME_idx_Clj) = 1.8d-7  * xH
x(KROME_idx_Pj)  = 1.17d-7 * xH
x(KROME_idx_Fj)  = 1.8d-8  * xH

!calculate elctrons (neutral cloud)
x(KROME_idx_e) = krome_get_electrons(x(:))
```

Then we compute the chemical abundances after a time-step of `dt` (in the unit of second). Note that the ODE solver automatically determines its time-step, which has nothing to do with `dt`, to solve a possibly stiff system of linear differential equation in higher accuracy. Calling the `krome` module renews values in `x(:)`.

```fortran
call krome(x(:),Tgas,dt)
```

For abundance evolutions, this is usually put in a loop

```fortran
spy = 3600. * 24. * 365. !seconds per year
t = 0 !initial time
dt = 1d3 * spy !initial time-step
open(unit=77, file=File_Name)
write(77,'(a)') "#time "//trim(krome_get_names_header()) !header for the output
do
  print '(a10,E18.8,a3)',"time:",t/spy,"yr"
  call krome(x(:),Tgas,dt) !call KROME
  t = t + dt !increase time
  dt = max(dt, t/5d0) !increase time-step
  write(77,'(999E18.8)') t/spy,x(:)/xH
  if(t >= 1d6*spy) exit !exit when overshoot ~1d6 years
end do
```



### `krome_subs.f90`

In this file, some important subroutines are defined. The most crucial one, `coe()`, is defined to compute the reaction rates by transforming the CSV-style chemical network into Fortran expressions. When embedding X-ray ionization we need to modify the `coe()` subroutine generated automatically by the pre-processor.

### `krome_ode.f90`

### `krome_user.f90`

### `krome_getphys.f90`

## Embedding X-ray

1. `KROME` X-ray ionization module for H and He
2. Secondary ionization for other species

## Reaction Tracing Module

