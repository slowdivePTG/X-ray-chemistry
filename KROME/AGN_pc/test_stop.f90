
!###################################################
! WARNING:This is a test auto-generated by KROME, in order to
! show a bare-minimal code to call the KROME's subroutine.
! Most of the values could not be appropriate for your
! problem, since this test is only intended as a general
! purpose example.

program test_krome

  use krome_main
  use krome_user
  use krome_user_commons
  use krome_ode
  use krome_getphys

  implicit none

  integer,parameter::nx=krome_nmols
  real*8::x(nx),m(nx+24),Tgas,t,dt,spy,xH,dust2gas,x1(nx)
  integer,parameter::nd=krome_ndust,imax=100
  real*8::xdust(nd),adust(nd),xdusti(nd),data(imax,nd),dataT(imax)
  integer::i,j,k
  spy = 3600. * 24. * 365. !seconds per year
  Tgas = 1d1 !gas temperature (K)
  xH = 2d4 !Hydrogen density

  !user commons for opacity and CR rate
  call krome_set_user_av(1d1) !opacity Av (#)
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

  !REMEMBER TO INITIAL X(:) FIRST
  call krome_init_dust_distribution(x(:), 1d0/1d2)
  call krome_set_Tdust(Tgas)

  !NOTE: here myCoe array is employed to store the
  ! coefficient values, since the temperature is
  ! constant during the model evolution.
  ! myCoe(:) is defined in krome_user_commons
  !myCoe(:) = krome_get_coef(Tgas,x(:))

  dt = 1d2*spy !time-step (s)
  t = 1d6*spy !initial time (s)

  call krome_set_J21xray(1d0)
  !output header
  open(unit=77, file="./data/dis")
  !write(77,'(a)') "#zeta=6.8e-16/s"
  !write(77,'(a)') "#Jx21=0.08"
  write(77,'(a)') "#time "//trim(krome_get_names_header())
  x1(:)=x(:)
  call krome(x1(:),Tgas,1d6*spy)
  m(:)=get_mass()
  k = 0
  do
    print '(a10,E11.3,a3)',"time:",t/spy,"yr"
    call krome(x1(:),Tgas,dt) !call KROME
    x1(:)=max(1d-99*xH,x1(:))
    k = k + 1
    t = t + dt !increase time
    !if (mod(k,10) == 0) call jex(nx,t,x1(:),"./data/Trace_inf")
    call krome_set_J21xray(0d0)
    dt = max(dt, (t-1d6*spy)/1d1) !increase time-step
    write(77,'(999E15.5)') t/spy,x1(:)/xH
    if(t>1d8*spy) exit !exit when overshoot 1d8 years
  end do

end program test_krome
