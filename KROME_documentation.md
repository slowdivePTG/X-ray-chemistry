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
     - *Optional*: Anaconda (for environment management)
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
   
     that are information relative to the test, namely the name of the test (`hello`), a control to avoid sink species, and the network name (`networks/react_hello`). These options are stored in `tests/hello/options.opt`. For more options, please visit the official docs for [Options](https://bitbucket.org/tgrassi/krome/wiki/optionsALL).
   
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

2. How to run `KROME`

## A Review of Fortran Files



## Embedding X-ray

