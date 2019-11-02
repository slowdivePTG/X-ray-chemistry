program test_krome

  use krome_main
  use krome_user
  use krome_user_commons
  use krome_ode
  use krome_getphys

  implicit none

  integer,parameter::nx=krome_nmols
  real*8::x(nx),m(nx+4),Tgas,t,dt,spy,xH,dust2gas,x1(nx)
  integer,parameter::nd=krome_ndust,imax=100
  real*8::xdust(nd),adust(nd),xdusti(nd),data(imax,nd),dataT(imax)
  integer::i,j,k
  spy = 3600. * 24. * 365. !seconds per year
  Tgas = 1d1 !gas temperature (K)
  xH = 2d4 !Hydrogen density

  !user commons for opacity and CR rate
  call krome_set_user_av(16.76d0) !opacity Av (#)
  call krome_set_user_crate(1.3d-17) !CR rate (1/s)
  call krome_set_user_gas_dust_ratio(1d2) !gas/dust
  call krome_init()

  x(:) = 1.d-20
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

  call krome_set_J21xray(0d0)
  call krome(x(:),Tgas,1.0e+07*spy) !call KROME before the AGN event

  dt = 1d0*spy !time-step (s)
  t = 0 !initial time (s)
  call krome_set_J21xray(0d0)
  open(unit=77, file="./data/dis_inf")
  write(77,'(a)') "#time "//trim(krome_get_names_header())

  x1(:)=x(:)
  do
    print '(a10,E18.8,a3)',"time:",t/spy,"yr"
    if (t + dt > 1d6*spy) dt = 1d6*spy - t
    call krome(x1(:),Tgas,dt) !call KROME
    x1(:)=max(1d-50*xH,x1(:))
    t = t + dt !increase time
    dt = max(dt, t/5d0) !increase time-step
    write(77,'(999E18.8)') t/spy,x1(:)/xH
    if(t >= 1d6*spy) exit !exit when overshoot ~1d6 years
  end do

  call krome_set_J21xray(0d0)
  dt = 1d0*spy !time-step (s) renewed

  k = 0
  do
    print '(a10,E18.8,a3)',"time:",t/spy,"yr"
    call krome(x1(:),Tgas,dt) !call KROME
    x1(:)=max(1d-50*xH,x1(:))
    k = k + 1
    t = t + dt !increase time
    if (mod(k,10) == 0) call trace(nx,t/spy,x1(:))
    dt = max(dt, (t-1d6*spy)/5d0) !increase time-step
    write(77,'(999E18.8)') t/spy,x1(:)/xH
    if(t>5d7*spy) exit !exit when overshoot 1d8 years
  end do

end program test_krome
