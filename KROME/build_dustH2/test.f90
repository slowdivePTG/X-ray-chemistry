
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

  implicit none

  integer,parameter::nx=krome_nmols
  real*8::x(nx),Tgas,t,dt,spy,xH,j21xs,dust2gas,x1(nx),x2(nx)
  integer,parameter::nd=krome_ndust,imax=100
  real*8::xdust(nd),adust(nd),xdusti(nd),data(imax,nd),dataT(imax)
  integer::i,j
  spy = 3600. * 24. * 365. !seconds per year
  Tgas = 5d1 !gas temperature (K)
  xH = 4d5 !Hydrogen density

  !user commons for opacity and CR rate
  call krome_set_user_av(1d1) !opacity Av (#)E11.3,
  call krome_set_user_gas_dust_ratio(7.57d11) !gas/dust
  !Second run:j21xs=1d-1
  call krome_init()

  x(:) = 1d-20
  !initial densities (model EA2 Wakelam+Herbst 2008)
  x(KROME_idx_H2)  = 0.5d0   * xH
  x(KROME_idx_He)  = 0.1d0   * xH
  x(KROME_idx_N)   = 2.15d-5  * xH
  x(KROME_idx_O)   = 1.75d-4 * xH
  x(KROME_idx_Cj)  = 8d-5  * xH
  x(KROME_idx_Mgj) = 1.07d-6  * xH

  !calculate elctrons (neutral cloud)
  x(KROME_idx_e) = krome_get_electrons(x(:))

  !REMEMBER TO INITIAL X(:) FIRST
  call krome_init_dust_distribution(x(:), 1d0/1d2)!/1.86d8)
  call krome_set_Tdust(Tgas)

  !NOTE: here myCoe array is employed to store the
  ! coefficient values, since the temperature is
  ! constant during the model evolution.
  ! myCoe(:) is defined in krome_user_commons
  !myCoe(:) = krome_get_coef(Tgas,x(:))

  dt = 0.5d6*spy !time-step (s)
  t = 0d0 !initial time (s)

  !call krome_set_user_crate(6.8d-16) !CR rate (1/s)
  j21xs=800d0
  call krome_set_J21xray(j21xs)
  !output header
  open(unit=77, file="./data/case5")
  !write(77,'(a)') "#Jx21=0.1 "
  write(77,'(a)') "#time "//trim(krome_get_names_header())
  x1(:)=x(:)
  do
     print '(a10,E11.3,a3)',"time:",t/spy,"yr"
     call krome(x1(:),Tgas,dt) !call KROME
     !call jex(nx,t,x1(:),"./data/Trace5_0")
     t = t + dt !increase time
     dt = max(0.5d6*spy,t/3d0) !increase time-step
     write(77,'(999E15.5)') t/spy,x1(:)/xH
     if(t>3d6*spy) exit !exit when overshoot 5d6 years
  end do


    dt = 0.5d6*spy !time-step (s)
    t = 0d0 !initial time (s)
    j21xs=800*1.2d0
    call krome_set_J21xray(j21xs)
    !call krome_set_user_crate(7.8d-16) !CR rate (1/s)
    !output header
    open(unit=77, file="./data/case5_1")
    !write(77,'(a)') "#Jx21=0.11 "
    write(77,'(a)') "#time "//trim(krome_get_names_header())
    x2(:)=x(:)
    do
       print '(a10,E11.3,a3)',"time:",t/spy,"yr"
       call krome(x2(:),Tgas,dt) !call KROME
       !call jex(nx,t,x2(:),"./data/Trace5_1") !Jacobian Matrix
       t = t + dt !increase time
       dt = max(0.5d6*spy,t/3d0) !increase time-step
       write(77,'(999E12.5)') t/spy,x2(:)/xH
       if(t>3d6*spy) exit !exit when overshoot 5d6 years
    end do
end program test_krome
