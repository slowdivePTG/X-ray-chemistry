
!############### MODULE ##############
module krome_dust
contains

  subroutine set_dust_distribution(ngas,dust_gas_ratio,alow,aup,phi)
    !krome_init_dust: initialize the dust ditribution
    ! and the dust bin mean sizes. Arguments are
    ! alow the size of the smallest
    ! bin size, aup the largest, phi the exponent
    ! of the MRN power law. These parameters
    ! are optional and can be omitted during the call.
    use krome_commons
    use krome_subs
    use krome_constants
    use krome_getphys
    implicit none
    real*8::rhogas,dmass,ngas(nmols),dust_gas_ratio,d2g
    real*8::iphi1,c,phi1,abin(ndust+1),mass(nspec),myc,phi4
    real*8::alow,aup,phi,dtg(ndustTypes),adust(ndust),Tbb,myx,a0,a1
    real*8::alogmin,alogmax,keyFrac(ndustTypes),frac(ndustTypes)
    integer::i,j,ilow,iup,imax,nd

    d2g = dust_gas_ratio

    phi1 = phi + 1.d0
    phi4 = phi + 4.d0
    iphi1 = 1.d0/phi1

    alogmin = log10(alow)
    alogmax = log10(aup)

    mass(:) = get_mass()
    nd = ndust/ndustTypes

    !dust grain density (g/cm3)
    krome_grain_rho(1) = 2.25d0
    krome_grain_rho(2) = 3.13d0

    !dust binding energy (K)
    krome_dust_Tbind(1:nd) = 88880.0d0
    krome_dust_Tbind(nd+1:2*nd) = 60560.0d0

    !key element fraction
    keyFrac(1) = 1d1**(-3.57)
    keyFrac(2) = 1d1**(-4.49)

    frac(:) = keyFrac(:)/sum(keyFrac)

    rhogas = sum(mass(1:nmols)*ngas(:)) !total gas density g/cm3
    !loop on dust types
    do j=1,ndustTypes
      !integration constant
      myc = frac(j)*rhogas*d2g/(4d0*pi/3d0*krome_grain_rho(j) &
          *(aup**phi4-alow**phi4)/phi4)

      ilow = nd * (j - 1) + 1 !lower index
      iup = nd * j !upper index

      !loop to find limits
      do i=1,nd+1
        abin(i) = 1d1**((i-1)*(alogmax-alogmin)/nd+alogmin)
      end do

      !loop to find mean size, span, and dust number density
      do i=1,nd
        adust(i+ilow-1) = ((abin(i+1)**phi4-abin(i)**phi4)/(abin(i+1)**phi1-abin(i)**phi1)*(phi1/phi4))**(1./3.) !(abin(i)+abin(i+1)) * 0.5d0 !mean bin size
        krome_dust_aspan(i+ilow-1) = abin(i+1) - abin(i) !bin span
        xdust(i+ilow-1) = myc*(abin(i+1)**phi1-abin(i)**phi1)/phi1
      end do
    end do

    krome_dust_asize(:) = adust(:) !store mean size
    krome_dust_asize2(:) = adust(:)**2 !store mean size square
    krome_dust_asize3(:) = adust(:)**3 !store mean size cube

    !default dust temperature
    krome_dust_T(:) = 3d1

    !init optical properties

    !init integral Qabs(nu)*B(nu)*dnu



  end subroutine set_dust_distribution

  !****************************
  !load the Qabs from the file fname
  ! for the dust type jtype-th
  subroutine dust_load_Qabs(fname,jtype)
    use krome_commons
    use krome_constants
    implicit none
    character(*)::fname
    integer::ios,nE,i,jtype,nd,nlow,nup,na,idx,j
    integer,parameter::nEmax=int(1e4),namax=int(1e4)
    real*8::rout(5),E,asize,Qabs,asize_old,Qabs_old
    real*8::Qabs_tmp(namax,nEmax),Qabs_E_tmp(nEmax)
    real*8::Qabs_a_tmp(namax)

    !number of dust bins per type
    nd = ndust/ndustTypes

    !check if Qabs for the given type is already filled with data
    if(Qabs_allocated(jtype)) return
    Qabs_allocated(jtype) = .true.

    !set initial values and counters
    nE = 0
    na = 0
    asize_old = -1d99
    Qabs_old = -1d99

    !open file and read
    open(32,file=fname,status="old",iostat=ios)
    !loop on file lines
    do
      read(32,*,iostat=ios) rout(:)
      if(ios<0) exit !eof
      !skip when # is found
      if(ios==59.or.ios==5010) cycle
      !skip blanks
      if(ios/=0) cycle

      !read values
      E = rout(2) * planck_eV !eV
      Qabs = rout(3) !dimensionless
      asize = rout(1) !cm

      !check for next energy block
      if(asize/=asize_old) then
        nE = 0 !restart energy counter
        na = na + 1 !increase size counter
      end if

      nE = nE + 1 !increase energy index
      Qabs_E_tmp(nE) = E !store energy found, eV
      Qabs_a_tmp(na) = asize !store size found, cm
      Qabs_tmp(na,nE) = Qabs !store Qabs
      asize_old = asize
    end do
    close(32)

    !if not allocated allocate
    if(.not.(allocated(dust_Qabs))) then
      !allocate common Qabs
      allocate(dust_Qabs(ndust,nE))
      allocate(dust_Qabs_E(nE))
      allocate(dust_intBB(ndust,dust_nT))
      allocate(dust_intBB_dT(ndust,dust_nT))
      allocate(dust_intBB_sigma(ndust,dust_nT))
      dust_intBB_Tbb(:) = 0d0 !default
    end if

    !store the number of energies in the common
    dust_Qabs_nE = nE

    !upper and lower limits
    nlow = (jtype-1)*nd+1
    nup = jtype*nd
    !copy temp Qabs to common Qabs and interpolate over grain sizes
    !loop on dust bins
    do i=nlow,nup
      idx = -1 !deafult error-rising index
      !loop on opt table sizes to found dust size corresponding index
      do j=1,na
        if(krome_dust_asize(i)<Qabs_a_tmp(j)) then
          idx = j !found index
          exit
        end if
      end do
      !interpolate on the dust size
      dust_Qabs(i,:) = (Qabs_tmp(idx,1:nE) - Qabs_tmp(idx-1,1:nE)) &
          *(krome_dust_asize(i)-Qabs_a_tmp(idx-1)) &
          / (Qabs_a_tmp(idx)-Qabs_a_tmp(idx-1)) + Qabs_tmp(idx-1,1:nE)
    end do

    !copy energies
    dust_Qabs_E(:) = Qabs_E_tmp(1:nE)

  end subroutine dust_load_Qabs

  !***********************
  !This sub prepares a table of the BB integral
  ! weighted by the Qabs as a function of Tbb e asize
  subroutine dust_init_intBB()
    use krome_subs
    use krome_commons
    use krome_constants
    use krome_phfuncs
    implicit none
    integer::i,j,k,ios,nread
    real*8::Tbb,E,intBB,dE,intBB_dT,rout(4)
    logical::exists

    !if already initialized no need to reload
    if(dust_intBB_Tbb(1)/=dust_intBB_Tbb(dust_nT)) return

    !check if tables are already computed
    inquire(file="KROME_dust_intBB.dat", exist=exists)

    !if tables are already present load from file
    if(exists) then
      print *,"Loading dust tables from file..."
      open(33,file="KROME_dust_intBB.dat",status="old")
      nread = 0
      do
        read(33,*,iostat=ios) k,i,rout(:)
        if(ios.ne.0) exit
        nread = nread + 1
        dust_intBB_Tbb(i) = rout(1)
        dust_intBB(k,i) = rout(2)
        dust_intBB_dT(k,i) = rout(3)
        dust_intBB_sigma(k,i) = rout(4)
      end do
      close(33)

      !check if the number of data loaded is OK
      if(nread/=dust_nT*ndust) then
        print *,"ERROR: the size of the file KROME_dust_intBB.dat"
        print *," seems to be wrong. Delete it and restart the "
        print *," executable."
        stop
      end if
      return
    end if

    print *,"Computing dust tables..."
    print *,"dust bins:",ndust
    print *,"(it may take a while)"

    open(33,file="KROME_dust_intBB.dat",status="replace")
    !loop on dust bins
    do k=1,ndust
      !loop on Tbb
      do i=1,dust_nT
        !increase Tbb (TbbMax is log and common)
        !Tbb = 1d1**((i-1)*TbbMax/(dust_nT-1))
        Tbb = (i-1) / TbbMult  + TbbMin
        dust_intBB_Tbb(i) = Tbb !store Tbb
        intBB = 0d0
        intBB_dT = 0d0
        !integral Q(E,a)*B(E,Tbb) and Q*dB/dTdust
        do j=2,dust_Qabs_nE
          dE = dust_Qabs_E(j) - dust_Qabs_E(j-1)
          intBB = intBB + 0.5d0 * dE &
              * (planckBB(dust_Qabs_E(j),Tbb) &
              * dust_Qabs(k,j) + planckBB(dust_Qabs_E(j-1),Tbb) &
              * dust_Qabs(k,j-1))
          intBB_dT = intBB_dT + 0.5d0 * dE &
              * (planckBB_dT(dust_Qabs_E(j),Tbb) &
              * dust_Qabs(k,j) + planckBB_dT(dust_Qabs_E(j-1),Tbb) &
              * dust_Qabs(k,j-1))
        end do
        !integral / hplanck (erg/s/cm2)
        dust_intBB(k,i) = intBB * pi * iplanck_eV * eV_to_erg
        !integral / hplanck (erg/s/cm2/K)
        dust_intBB_dT(k,i) = intBB_dT * pi * iplanck_eV * eV_to_erg
        !normalized integral
        dust_intBB_sigma(k,i) = dust_intBB(k,i) &
            / (stefboltz_erg*Tbb**4)
        !write the data on a file
        write(33,'(2I8,99E17.8e3)') k, i, dust_intBB_Tbb(i), &
            dust_intBB(k,i), dust_intBB_dT(k,i), dust_intBB_sigma(k,i)
      end do
    end do
    close(33)

  end subroutine dust_init_intBB

  !************************
  !interpolate dust Qabs over photobins
  subroutine interp_qabs()
    use krome_commons
    implicit none
    integer::i,jdust

  end subroutine interp_qabs

  !*************************
  !return the Qabs for the dust bin jdust
  ! and for the given energy in eV
  function get_Qabs(energy,jdust)
    use krome_commons
    implicit none
    integer::jdust,j
    real*8::get_Qabs,energy

    !rise error if array size problem
    if(dust_Qabs_nE<=0) then
      print *,"ERROR: when interpolating Qabs found zero energy points!"
      print *,"You should probably intialize dust before initializing"
      print *," photochemistry..."
      stop
    end if

    !loop to find the energy and interpolate
    do j=2,dust_Qabs_nE
      if(energy<dust_Qabs_E(j)) then
        get_Qabs = (energy - dust_Qabs_E(j-1)) &
            / (dust_Qabs_E(j) - dust_Qabs_E(j-1)) &
            * (dust_Qabs(jdust,j) - dust_Qabs(jdust,j-1)) &
            + dust_Qabs(jdust,j-1)
        !when found return
        return
      end if
    end do

    !rise an error if nothing found
    print *,"ERROR: no value found for get_Qabs"
    print *,"energy (eV):", energy
    print *,"energy limits (eV):", dust_Qabs_E(1), dust_Qabs_E(dust_Qabs_nE)
    print *,"jdust:",jdust
    stop

  end function get_Qabs

  !************************
  !jbin is the photobin, jdust the dust bin
  function get_Qabs_bin(jbin,jdust)
    use krome_commons
    implicit none
    real*8::get_Qabs_bin
    integer::jbin,jdust

    get_Qabs_bin = dust_Qabs_interp(jbin,jdust)

  end function get_Qabs_bin

  !*******************************
  !returns the integral in erg/s/cm2 of the BB at
  ! temperature Tbb multiplied by Qabs for the
  ! dust bin jdust
  function get_dust_intBB(jdust,Tbb)
    use krome_commons
    implicit none
    integer::jdust,ibb
    real*8::Tbb,get_dust_intBB

    ibb = (Tbb-TbbMin) * TbbMult + 1

    get_dust_intBB = (Tbb - dust_intBB_Tbb(ibb)) &
        / (dust_intBB_Tbb(ibb+1) - dust_intBB_Tbb(ibb)) &
        * (dust_intBB(jdust,ibb+1) - dust_intBB(jdust,ibb)) &
        +  dust_intBB(jdust,ibb)

  end function get_dust_intBB

  !*******************************
  !returns the integral in erg/s/cm2/K of the dBB/dTdust
  ! at temperature Tbb multiplied by Qabs for the
  ! dust bin jdust
  function get_dust_intBB_dT(jdust,Tbb)
    use krome_commons
    implicit none
    integer::jdust,ibb
    real*8::Tbb,get_dust_intBB_dT

    ibb = (Tbb-TbbMin) * TbbMult + 1

    get_dust_intBB_dT = (Tbb - dust_intBB_Tbb(ibb)) &
        / (dust_intBB_Tbb(ibb+1) - dust_intBB_Tbb(ibb)) &
        * (dust_intBB_dT(jdust,ibb+1) - dust_intBB_dT(jdust,ibb)) &
        +  dust_intBB_dT(jdust,ibb)

  end function get_dust_intBB_dT

  !*******************************
  !compute beta escape using the planck opacity
  function besc(n,Tgas,lj,rhogas)
    use krome_commons
    use krome_subs
    use krome_phfuncs
    implicit none
    real*8::n(:),besc,Tgas,tau,lj,tau_d,tau_g,rhogas,Tff
    integer::j

    besc = 1d0
    tau_d = 0d0
    do j=1,ndust
      Tff = krome_dust_T(j)
      if(xdust(j)<1d-20) cycle
      !when temperature difference is small
      ! Tgas can be used instead of Tdust
      if(abs(Tff-Tgas)<5d0) Tff = Tgas
      tau_d = tau_d + xdust(j) * kpla_dust(Tff,j)
    end do

    tau_g = 0d0
    !tau_g = rhogas * 1d1**fit_anytab2D(mayer_x(:), mayer_y(:), mayer_z(:,:), &
        !     mayer_xmul, mayer_ymul,log10(rhogas),log10(Tgas))
    tau = (tau_d + tau_g) * lj

    if(tau<1d0) return
    besc = tau**(-2)

  end function besc

  !********************************
  !planck opacity for the dust in the
  ! bin jdust for a given temperature Tdust
  function kpla_dust(Tdust,jdust)
    use krome_commons
    use krome_constants
    implicit none
    real*8::kpla_dust,Tdust,intBB
    integer::jdust,ibb

    !ibb = (dust_nT - 1) * log10(Tdust) / TbbMax + 1
    ibb = (Tdust-TbbMin) * TbbMult + 1
    !loop on the temperatures to find the corresponding interval

    intBB = (Tdust-dust_intBB_Tbb(ibb)) &
        / (dust_intBB_Tbb(ibb+1)-dust_intBB_Tbb(ibb)) &
        * (dust_intBB_sigma(jdust,ibb+1)-dust_intBB_sigma(jdust,ibb)) &
        + dust_intBB_sigma(jdust,ibb)

    kpla_dust = intBB * krome_dust_asize2(jdust) * pi

  end function kpla_dust

  !*********************************
  !This subroutine computes the dust temperature for each bin
  ! and copies the cooling in the common variable
  subroutine compute_Tdust(n,Tgas)
    use krome_commons
    use krome_constants
    use krome_subs
    use krome_getphys
    implicit none
    integer::i,j1,j2,jmid
    real*8::Td1,Td2,fact,vgas,ntot,n(:),be,ljeans,rhogas
    real*8::f1,f2,fmid,pre,Tdmid,Tgas,dustCooling,intCMB
    real*8::m(nspec),intJflux

    !compute dust cooling pre-factor (HM79)
    fact = 0.5d0
    ntot = sum(n(1:nmols))
    m(:) = get_mass()
    rhogas = sum(n(1:nmols)*m(1:nmols))
    vgas = sqrt(kvgas_erg*Tgas) !thermal speed of the gas
    pre = 0.5d0*fact*vgas*boltzmann_erg * ntot
    !jeans length cm
    ljeans = get_jeans_length_rho(n(:),Tgas,rhogas)
    !escape
    be = besc(n(:),Tgas,ljeans,rhogas)

    !init dust cooling
    dustCooling = 0d0

    !init external radiation flux
    intJflux = 0d0

    !loop on dust bins
    do i=1,ndust
      j1 = 1 !first index
      j2 = dust_nT !last index
      !no need to compute Tdust when small amount of dust
      if(xdust(i)<1d-30*ntot) then
        krome_dust_T(i) = Tgas
        cycle
      end if
      !get initial temperatures
      Td1 = dust_intBB_Tbb(j1)
      Td2 = dust_intBB_Tbb(j2)-1d0
      !compute Tcmb
      intCMB = get_dust_intBB(i,phys_Tcmb)
      !bisection method
      do

        !f(x) evaluated at j1 and j2
        f1 = (get_dust_intBB(i,Td1) - intCMB - intJflux) * be &
            - pre * (Tgas - Td1)
        f2 = (get_dust_intBB(i,Td2) - intCMB - intJflux) * be &
            - pre * (Tgas - Td2)

        !compute Tdmid
        Tdmid = .5d0 * (Td1 + Td2)
        krome_dust_T(i) = Tdmid
        fmid = (get_dust_intBB(i,Tdmid) - intCMB - intJflux) * be &
            - pre * (Tgas - Tdmid)

        !check signs and assign Tdmid
        if(f1*fmid<0d0) then
          Td2 = Tdmid
        else
          Td1 = Tdmid
        end if
        !convergence criterium
        if(abs(Td1-Td2)<1d-8) exit
      end do

      !compute the cooling (avoid the difference Tgas-Tdust)
      dustCooling = dustCooling + (get_dust_intBB(i,krome_dust_T(i)) &
          - intCMB - intJflux) * be * xdust(i) * krome_dust_asize2(i)
    end do

    !copy (isotropic) cooling
    dust_cooling = 4d0 * pi * dustCooling

  end subroutine compute_Tdust

  !*****************************
  !computes the dust cooling using the temperature difference
  function dustCool(adust2,nndust,Tgas,Tdust,ntot)
    use krome_constants
    real*8::dustCool,adust2,Tgas,nndust,ntot,fact,vgas,Tdust

    !factor of contribution for species other than protons
    ! mean value, see Hollenbach and McKee 1979 for a
    ! more accurate value
    fact = 0.5d0
    vgas = sqrt(kvgas_erg*Tgas) !thermal speed of the gas

    dustCool = 2.d0 * boltzmann_erg * nndust * adust2 * &
        fact * vgas * (Tgas - Tdust) * ntot

  end function dustCool

  !******************
  function sgn(arg)
    !return sign of a double arg
    real*8::sgn,arg
    sgn = 1.d0
    if(arg>=0.d0) return
    sgn = -1.d0
  end function sgn

  !*********************
  function krome_dust_growth(natom,Tgas,Tdust,vgas,atom_mass,rho0)
    !krome_dust_growth: compute dust growth in cm/s
    implicit none
    real*8::krome_dust_growth,natom,Tgas,Tdust,vgas,atom_mass,rho0

    krome_dust_growth = krome_dust_stick(Tgas,Tdust) * vgas * &
        atom_mass / 4d0 / rho0 * natom

  end function krome_dust_growth

  !*******************
  function krome_dust_stick(Tgas,Tdust)
    !krome_dust_stick: sticking coefficient (Leitch-Devlin & Williams 1985)
    ! (Grassi2012, eqn.26)
    real*8::krome_dust_stick,Tgas,Tdust

    krome_dust_stick = 1.9d-2 * Tgas * (1.7d-3 * Tdust + .4d0) &
        * exp(-7.d-3 * Tgas)
    krome_dust_stick = min(krome_dust_stick,1d0)

  end function krome_dust_stick

  !******************
  !dust evaporation following Evans+93: cm/s
  ! ebind: binding energy in K
  function dust_evap(Tdust,ebind,amass,asize2,rho0)
    use krome_constants
    implicit none
    real*8::dust_evap,Tdust,ebind,nu0,amass
    real*8::asize2,rho0

    dust_evap = 0d0 !default
    nu0 = 1d12 !1/s
    if(asize2<=0d0) return
    dust_evap = nu0 * amass/4d0/pi/asize2/rho0 * exp(-ebind/Tdust)

  end function dust_evap

  !***************
  function krome_dust_sput(Tgas,adust,natom,nndust)
    use krome_constants
    use krome_commons
    !sputtering rate using nozawa 2006 yields as impact efficiency
    real*8::krome_dust_sput,Tgas,adust,natom,logT,nndust,y,logy
    real*8::a0,a1,a2,a3,mgrain

    if(Tgas<1d5) then
      krome_dust_sput = 0.d0
      return
    end if
    logT = log10(Tgas)
    a0 = -3.9280689440337335d-01
    a1 = 1.9746828032397993d+01
    a2 = -4.0031865960055839d+00
    a3 = 7.8081665612858187d+00

    !yield contains thermal speed (y*vgas)
    logy = exp(-a0 * logT) / (a1 + a2 * logT) + a3
    y = 1d1**logy
    mgrain = adust**3 *2.3d0 / (p_mass)
    krome_dust_sput = y*natom*nndust*adust**2 / mgrain

    if(krome_dust_sput>1.d0) then
      print *,"sputtering>1!"
      print *,"sputtering ","adust ","natom ","Tgas ","nndust"
      print *,krome_dust_sput,adust,natom,Tgas,nndust
      stop
    end if

  end function krome_dust_sput

  !*******************************
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
    !print '(E11.3)',H2_dust

  end function krome_H2_dust

  !*************************
  function H2_eps_Si(myTgas, myTdust)
    !give back the H2 formation efficiency on silicates
    real*8::H2_eps_Si,Ec,Es,Ep,apc,func
    real*8::myTgas,myTdust
    Ec = 1.5d4 !K
    Es = -1d3 !K
    Ep = 7d2 !K
    !m (must be in m even if in CS2009 it's in \AA!!, Cazaux2012 private comm.)
    apc = 1.7d-10
    func = 2.d0 * exp(-(Ep-Es)/(Ep+myTgas)) / (1.d0+sqrt((Ec-Es)/(Ep-Es)))**2
    H2_eps_Si = 1.d0/(1.+16.*myTdust/(Ec-Es) * exp(-Ep/myTdust)&
        * exp(4d9*apc*sqrt(Ep-Es))) + func

    H2_eps_Si = min(H2_eps_Si,1d0)
    if(H2_eps_Si<0.d0) then
      print *,"problem on H2_eps_Si"
      print *,H2_eps_Si
      stop
    end if
  end function H2_eps_Si

  !*************************
  function H2_eps_C(myTgas, myTdust)
    !give back the H2 formation efficiency on C
    real*8::H2_eps_C,myTgas,myTdust
    real*8::Ep,Ec,Es,Th
    Ep = 8d2 !K
    Ec = 7d3 !K
    Es = 2d2 !K
    TH = 4.d0*(1.d0+sqrt((Ec-Es)/(Ep-Es)))**(-2) * exp(-(Ep-Es)/(Ep+myTgas))
    H2_eps_C = (1.d0-TH) / (1.d0+0.25*(1.d0+sqrt((Ec-Es)/(Ep-Es)))**2 &
        * exp(-Es/myTdust))
    if(H2_eps_C>1.d0 .or. H2_eps_C<0.d0) then
      print *,"problem on H2_eps_C"
      stop
    end if
  end function H2_eps_C

  !***************************
  function stick(myTgas,myTdust)
    !sticking coefficient for the H2 formation
    real*8::stick,myTgas,myTdust
    stick = 1.d0 / (1.d0 + 0.4*sqrt((myTgas+myTdust)/1d2) &
        + 0.2*myTgas/1d2 + 0.08*(myTgas/1d2)**2)
    if(stick>1.d0 .or. stick<0.d0) then
      print *,"problem on stick coefficient"
      stop
    end if
  end function stick

  !***********************
  subroutine init_dust_tabs()
    use krome_commons
    use krome_fit
    implicit none

    call init_anytab2D("dust_table_cool.dat",dust_tab_ngas(:), &
        dust_tab_Tgas(:), dust_tab_cool(:,:), dust_mult_ngas, &
        dust_mult_Tgas)
    call init_anytab2D("dust_table_Tdust.dat",dust_tab_ngas(:), &
        dust_tab_Tgas(:), dust_tab_Tdust(:,:), dust_mult_ngas, &
        dust_mult_Tgas)
    call init_anytab2D("dust_table_H2.dat",dust_tab_ngas(:), &
        dust_tab_Tgas(:), dust_tab_H2(:,:), dust_mult_ngas, &
        dust_mult_Tgas)

  end subroutine init_dust_tabs

end module krome_dust
