subroutine trace(neq,tt,nin)
  use krome_commons
  use krome_constants
  use krome_subs
  use krome_cooling
  use krome_heating
  use krome_tabs
  use krome_photo
  use krome_gadiab
  use krome_getphys
  use krome_phfuncs
  use krome_fit
  implicit none
  real*8::tt,n(neq),k(nrea),krome_gamma
  real*8::gamma,Tgas,vgas,ntot,nH2dust,nd,nin(neq)
  real*8::rr
  integer::neq
  integer::i,r1,r2,p1,p2,p3,p4

  n(:) = nin(:)

  k(:) = coe_tab(n(:)) !compute coefficients

  open(unit=66, file='./data/Trace', position="append")

    !E
    !E
    dn(idx_E) = &
        -k(1)*n(idx_E)*n(idx_GRAIN0) &
        +k(14)*n(idx_C) &
        +k(15)*n(idx_CL) &
        +k(16)*n(idx_FE) &
        +k(17)*n(idx_H) &
        +k(18)*n(idx_HE) &
        +k(19)*n(idx_MG) &
        +k(20)*n(idx_N) &
        +k(21)*n(idx_NA) &
        +k(22)*n(idx_O) &
        +k(23)*n(idx_P) &
        +k(24)*n(idx_S) &
        +k(25)*n(idx_SI) &
        +k(32)*n(idx_CO) &
        +k(36)*n(idx_H2) &
        +k(38)*n(idx_H2) &
        +k(47)*n(idx_NO) &
        +k(50)*n(idx_O2) &
        +k(70)*n(idx_CH2) &
        +k(74)*n(idx_H2S) &
        +k(77)*n(idx_HCO) &
        +k(79)*n(idx_HCS) &
        +k(82)*n(idx_HNO) &
        +k(89)*n(idx_NH2) &
        +k(95)*n(idx_OCS) &
        +k(103)*n(idx_C2H2) &
        +k(112)*n(idx_CH3) &
        +k(121)*n(idx_NH3) &
        +k(128)*n(idx_C2H2O) &
        +k(138)*n(idx_CH2O2) &
        +k(149)*n(idx_CH3CN) &
        +k(151)*n(idx_C2H4) &
        +k(156)*n(idx_C4H2) &
        +k(162)*n(idx_CH3OH) &
        +k(163)*n(idx_CH3OH) &
        +k(166)*n(idx_C2H4O) &
        +k(170)*n(idx_C3H4) &
        +k(175)*n(idx_CH5N) &
        +k(183)*n(idx_C2H5OH) &
        +k(189)*n(idx_CH3OCH3) &
        +k(3118)*n(idx_Ck)*n(idx_CO2) &
        +k(3208)*n(idx_Ck)*n(idx_C) &
        +k(3209)*n(idx_Ck)*n(idx_H) &
        +k(3210)*n(idx_Ck)*n(idx_N) &
        +k(3211)*n(idx_Ck)*n(idx_O) &
        +k(3212)*n(idx_Ck)*n(idx_CH) &
        +k(3213)*n(idx_Ck)*n(idx_H2) &
        +k(3214)*n(idx_Ck)*n(idx_NH) &
        +k(3215)*n(idx_Ck)*n(idx_O2) &
        +k(3216)*n(idx_Ck)*n(idx_OH) &
        +k(3217)*n(idx_Ck)*n(idx_CH2) &
        +k(3218)*n(idx_Ck)*n(idx_H2O) &
        +k(3219)*n(idx_Hk)*n(idx_C) &
        +k(3220)*n(idx_Hk)*n(idx_H) &
        +k(3221)*n(idx_Hk)*n(idx_N) &
        +k(3222)*n(idx_Hk)*n(idx_O) &
        +k(3223)*n(idx_Hk)*n(idx_C2) &
        +k(3224)*n(idx_Hk)*n(idx_CH) &
        +k(3225)*n(idx_Hk)*n(idx_CN) &
        +k(3226)*n(idx_Hk)*n(idx_CO) &
        +k(3227)*n(idx_Hk)*n(idx_NH) &
        +k(3228)*n(idx_Hk)*n(idx_OH) &
        +k(3229)*n(idx_Hk)*n(idx_C2H) &
        +k(3230)*n(idx_Hk)*n(idx_CH2) &
        +k(3231)*n(idx_Hk)*n(idx_HCO) &
        +k(3232)*n(idx_Hk)*n(idx_NH2) &
        +k(3233)*n(idx_Hk)*n(idx_CH3) &
        +k(3234)*n(idx_Ok)*n(idx_C) &
        +k(3235)*n(idx_Ok)*n(idx_H) &
        +k(3236)*n(idx_Ok)*n(idx_N) &
        +k(3237)*n(idx_Ok)*n(idx_O) &
        +k(3238)*n(idx_Ok)*n(idx_CH) &
        +k(3239)*n(idx_Ok)*n(idx_CO) &
        +k(3240)*n(idx_Ok)*n(idx_H2) &
        +k(3241)*n(idx_Ok)*n(idx_CH2) &
        +k(3242)*n(idx_Sk)*n(idx_C) &
        +k(3243)*n(idx_Sk)*n(idx_H) &
        +k(3244)*n(idx_Sk)*n(idx_N) &
        +k(3245)*n(idx_Sk)*n(idx_O) &
        +k(3246)*n(idx_Sk)*n(idx_CO) &
        +k(3247)*n(idx_Sk)*n(idx_O2) &
        +k(3248)*n(idx_CNk)*n(idx_H) &
        +k(3249)*n(idx_CNk)*n(idx_CH3) &
        +k(3250)*n(idx_OHk)*n(idx_C) &
        +k(3251)*n(idx_OHk)*n(idx_H) &
        +k(3252)*n(idx_OHk)*n(idx_CH) &
        +k(3253)*n(idx_OHk)*n(idx_CH3) &
        +k(3254)*n(idx_O)*n(idx_CH) &
        -k(3657)*n(idx_C2j)*n(idx_E) &
        -k(3658)*n(idx_CCLj)*n(idx_E) &
        -k(3659)*n(idx_CFj)*n(idx_E) &
        -k(3660)*n(idx_CHj)*n(idx_E) &
        -k(3661)*n(idx_CLOj)*n(idx_E) &
        -k(3662)*n(idx_CNj)*n(idx_E) &
        -k(3663)*n(idx_COj)*n(idx_E) &
        -k(3664)*n(idx_CPj)*n(idx_E) &
        -k(3665)*n(idx_CSj)*n(idx_E) &
        -k(3666)*n(idx_H2j)*n(idx_E) &
        -k(3667)*n(idx_HCLj)*n(idx_E) &
        -k(3668)*n(idx_HFj)*n(idx_E) &
        -k(3669)*n(idx_HEHj)*n(idx_E) &
        -k(3670)*n(idx_HSj)*n(idx_E) &
        -k(3671)*n(idx_N2j)*n(idx_E) &
        -k(3672)*n(idx_NHj)*n(idx_E) &
        -k(3673)*n(idx_NOj)*n(idx_E) &
        -k(3674)*n(idx_NSj)*n(idx_E) &
        -k(3675)*n(idx_O2j)*n(idx_E) &
        -k(3676)*n(idx_OHj)*n(idx_E) &
        -k(3677)*n(idx_PHj)*n(idx_E) &
        -k(3678)*n(idx_PNj)*n(idx_E) &
        -k(3679)*n(idx_POj)*n(idx_E) &
        -k(3680)*n(idx_S2j)*n(idx_E) &
        -k(3681)*n(idx_SICj)*n(idx_E) &
        -k(3682)*n(idx_SIHj)*n(idx_E) &
        -k(3683)*n(idx_SINj)*n(idx_E) &
        -k(3684)*n(idx_SIOj)*n(idx_E) &
        -k(3685)*n(idx_SISj)*n(idx_E) &
        -k(3686)*n(idx_SIFj)*n(idx_E) &
        -k(3687)*n(idx_SOj)*n(idx_E) &
        -k(3688)*n(idx_C2Hj)*n(idx_E) &
        -k(3689)*n(idx_C2Hj)*n(idx_E) &
        -k(3690)*n(idx_C2Hj)*n(idx_E) &
        -k(3691)*n(idx_C2Nj)*n(idx_E) &
        -k(3692)*n(idx_C2Nj)*n(idx_E) &
        -k(3693)*n(idx_C2Oj)*n(idx_E) &
        -k(3694)*n(idx_C2Sj)*n(idx_E) &
        -k(3695)*n(idx_C2Sj)*n(idx_E) &
        -k(3696)*n(idx_C3j)*n(idx_E) &
        -k(3697)*n(idx_CCPj)*n(idx_E) &
        -k(3698)*n(idx_CCPj)*n(idx_E) &
        -k(3699)*n(idx_CH2j)*n(idx_E) &
        -k(3700)*n(idx_CH2j)*n(idx_E) &
        -k(3701)*n(idx_CH2j)*n(idx_E) &
        -k(3702)*n(idx_CHSIj)*n(idx_E) &
        -k(3703)*n(idx_CHSIj)*n(idx_E) &
        -k(3704)*n(idx_CNCj)*n(idx_E) &
        -k(3705)*n(idx_CO2j)*n(idx_E) &
        -k(3706)*n(idx_H2CLj)*n(idx_E) &
        -k(3707)*n(idx_H2CLj)*n(idx_E) &
        -k(3708)*n(idx_H2Fj)*n(idx_E) &
        -k(3709)*n(idx_H2Fj)*n(idx_E) &
        -k(3710)*n(idx_H2Oj)*n(idx_E) &
        -k(3711)*n(idx_H2Oj)*n(idx_E) &
        -k(3712)*n(idx_H2Oj)*n(idx_E) &
        -k(3713)*n(idx_H2Sj)*n(idx_E) &
        -k(3714)*n(idx_H2Sj)*n(idx_E) &
        -k(3715)*n(idx_H3j)*n(idx_E) &
        -k(3716)*n(idx_H3j)*n(idx_E) &
        -k(3717)*n(idx_HCNj)*n(idx_E) &
        -k(3718)*n(idx_HCOj)*n(idx_E) &
        -k(3719)*n(idx_HCOj)*n(idx_E) &
        -k(3720)*n(idx_HCOj)*n(idx_E) &
        -k(3721)*n(idx_HCPj)*n(idx_E) &
        -k(3722)*n(idx_HCPj)*n(idx_E) &
        -k(3723)*n(idx_HCSj)*n(idx_E) &
        -k(3724)*n(idx_HCSj)*n(idx_E) &
        -k(3725)*n(idx_HNCj)*n(idx_E) &
        -k(3726)*n(idx_HNOj)*n(idx_E) &
        -k(3727)*n(idx_HNSj)*n(idx_E) &
        -k(3728)*n(idx_HNSIj)*n(idx_E) &
        -k(3729)*n(idx_HNSIj)*n(idx_E) &
        -k(3730)*n(idx_HOCj)*n(idx_E) &
        -k(3731)*n(idx_HPNj)*n(idx_E) &
        -k(3732)*n(idx_HPNj)*n(idx_E) &
        -k(3733)*n(idx_HPOj)*n(idx_E) &
        -k(3734)*n(idx_HPOj)*n(idx_E) &
        -k(3735)*n(idx_HSIOj)*n(idx_E) &
        -k(3736)*n(idx_HSIOj)*n(idx_E) &
        -k(3737)*n(idx_HSISj)*n(idx_E) &
        -k(3738)*n(idx_HSISj)*n(idx_E) &
        -k(3739)*n(idx_HSOj)*n(idx_E) &
        -k(3740)*n(idx_N2Hj)*n(idx_E) &
        -k(3741)*n(idx_N2Hj)*n(idx_E) &
        -k(3742)*n(idx_NAH2j)*n(idx_E) &
        -k(3743)*n(idx_NAH2j)*n(idx_E) &
        -k(3744)*n(idx_NCOj)*n(idx_E) &
        -k(3745)*n(idx_NH2j)*n(idx_E) &
        -k(3746)*n(idx_NH2j)*n(idx_E) &
        -k(3747)*n(idx_NO2j)*n(idx_E) &
        -k(3748)*n(idx_O2Hj)*n(idx_E) &
        -k(3749)*n(idx_OCSj)*n(idx_E) &
        -k(3750)*n(idx_OCSj)*n(idx_E) &
        -k(3751)*n(idx_OCSj)*n(idx_E) &
        -k(3752)*n(idx_PH2j)*n(idx_E) &
        -k(3753)*n(idx_PH2j)*n(idx_E) &
        -k(3754)*n(idx_S2Hj)*n(idx_E) &
        -k(3755)*n(idx_S2Hj)*n(idx_E) &
        -k(3756)*n(idx_SIC2j)*n(idx_E) &
        -k(3757)*n(idx_SIC2j)*n(idx_E) &
        -k(3758)*n(idx_SIH2j)*n(idx_E) &
        -k(3759)*n(idx_SIH2j)*n(idx_E) &
        -k(3760)*n(idx_SIH2j)*n(idx_E) &
        -k(3761)*n(idx_SINCj)*n(idx_E) &
        -k(3762)*n(idx_SO2j)*n(idx_E) &
        -k(3763)*n(idx_C2H2j)*n(idx_E) &
        -k(3764)*n(idx_C2H2j)*n(idx_E) &
        -k(3765)*n(idx_C2H2j)*n(idx_E) &
        -k(3766)*n(idx_C2H2j)*n(idx_E) &
        -k(3767)*n(idx_C2H2j)*n(idx_E) &
        -k(3768)*n(idx_C2HOj)*n(idx_E) &
        -k(3769)*n(idx_C2HOj)*n(idx_E) &
        -k(3770)*n(idx_C2HOj)*n(idx_E) &
        -k(3771)*n(idx_C2HOj)*n(idx_E) &
        -k(3772)*n(idx_C2N2j)*n(idx_E) &
        -k(3773)*n(idx_C2N2j)*n(idx_E) &
        -k(3774)*n(idx_C2NHj)*n(idx_E) &
        -k(3775)*n(idx_C2NHj)*n(idx_E) &
        -k(3776)*n(idx_C3Hj)*n(idx_E) &
        -k(3777)*n(idx_C3Hj)*n(idx_E) &
        -k(3778)*n(idx_C3Nj)*n(idx_E) &
        -k(3779)*n(idx_C3Oj)*n(idx_E) &
        -k(3780)*n(idx_C3Sj)*n(idx_E) &
        -k(3781)*n(idx_C3Sj)*n(idx_E) &
        -k(3782)*n(idx_C3Sj)*n(idx_E) &
        -k(3783)*n(idx_C4j)*n(idx_E) &
        -k(3784)*n(idx_C4j)*n(idx_E) &
        -k(3785)*n(idx_CH2SIj)*n(idx_E) &
        -k(3786)*n(idx_CH2SIj)*n(idx_E) &
        -k(3787)*n(idx_CH2SIj)*n(idx_E) &
        -k(3788)*n(idx_CH3j)*n(idx_E) &
        -k(3789)*n(idx_CH3j)*n(idx_E) &
        -k(3790)*n(idx_CH3j)*n(idx_E) &
        -k(3791)*n(idx_CH3j)*n(idx_E) &
        -k(3792)*n(idx_H2CCLj)*n(idx_E) &
        -k(3793)*n(idx_HCNHj)*n(idx_E) &
        -k(3794)*n(idx_HCNHj)*n(idx_E) &
        -k(3795)*n(idx_HCNHj)*n(idx_E) &
        -k(3796)*n(idx_H2COj)*n(idx_E) &
        -k(3797)*n(idx_H2COj)*n(idx_E) &
        -k(3798)*n(idx_H2CSj)*n(idx_E) &
        -k(3799)*n(idx_H2CSj)*n(idx_E) &
        -k(3800)*n(idx_H2NCj)*n(idx_E) &
        -k(3801)*n(idx_H2NCj)*n(idx_E) &
        -k(3802)*n(idx_H2NOj)*n(idx_E) &
        -k(3803)*n(idx_H2NOj)*n(idx_E) &
        -k(3804)*n(idx_H2POj)*n(idx_E) &
        -k(3805)*n(idx_H2POj)*n(idx_E) &
        -k(3806)*n(idx_H2S2j)*n(idx_E) &
        -k(3807)*n(idx_H2S2j)*n(idx_E) &
        -k(3808)*n(idx_H2SIOj)*n(idx_E) &
        -k(3809)*n(idx_H2SIOj)*n(idx_E) &
        -k(3810)*n(idx_H3Oj)*n(idx_E) &
        -k(3811)*n(idx_H3Oj)*n(idx_E) &
        -k(3812)*n(idx_H3Oj)*n(idx_E) &
        -k(3813)*n(idx_H3Oj)*n(idx_E) &
        -k(3814)*n(idx_H3Sj)*n(idx_E) &
        -k(3815)*n(idx_H3Sj)*n(idx_E) &
        -k(3816)*n(idx_HC2Sj)*n(idx_E) &
        -k(3817)*n(idx_HC2Sj)*n(idx_E) &
        -k(3818)*n(idx_HCO2j)*n(idx_E) &
        -k(3819)*n(idx_HCO2j)*n(idx_E) &
        -k(3820)*n(idx_HCO2j)*n(idx_E) &
        -k(3821)*n(idx_HNCOj)*n(idx_E) &
        -k(3822)*n(idx_HOCSj)*n(idx_E) &
        -k(3823)*n(idx_HOCSj)*n(idx_E) &
        -k(3824)*n(idx_HSIO2j)*n(idx_E) &
        -k(3825)*n(idx_HSIO2j)*n(idx_E) &
        -k(3826)*n(idx_HSO2j)*n(idx_E) &
        -k(3827)*n(idx_HSO2j)*n(idx_E) &
        -k(3828)*n(idx_HSO2j)*n(idx_E) &
        -k(3829)*n(idx_NAH2Oj)*n(idx_E) &
        -k(3830)*n(idx_NAH2Oj)*n(idx_E) &
        -k(3831)*n(idx_NH3j)*n(idx_E) &
        -k(3832)*n(idx_NH3j)*n(idx_E) &
        -k(3833)*n(idx_PC2Hj)*n(idx_E) &
        -k(3834)*n(idx_PC2Hj)*n(idx_E) &
        -k(3835)*n(idx_PCH2j)*n(idx_E) &
        -k(3836)*n(idx_PCH2j)*n(idx_E) &
        -k(3837)*n(idx_PH3j)*n(idx_E) &
        -k(3838)*n(idx_PH3j)*n(idx_E) &
        -k(3839)*n(idx_PNH2j)*n(idx_E) &
        -k(3840)*n(idx_SIC2Hj)*n(idx_E) &
        -k(3841)*n(idx_SIC2Hj)*n(idx_E) &
        -k(3842)*n(idx_SIC3j)*n(idx_E) &
        -k(3843)*n(idx_SIC3j)*n(idx_E) &
        -k(3844)*n(idx_SIH3j)*n(idx_E) &
        -k(3845)*n(idx_SIH3j)*n(idx_E) &
        -k(3846)*n(idx_SINCHj)*n(idx_E) &
        -k(3847)*n(idx_SINCHj)*n(idx_E) &
        -k(3848)*n(idx_SINH2j)*n(idx_E) &
        -k(3849)*n(idx_SINH2j)*n(idx_E) &
        -k(3850)*n(idx_CH2CNj)*n(idx_E) &
        -k(3851)*n(idx_CH2CNj)*n(idx_E) &
        -k(3852)*n(idx_CH2CNj)*n(idx_E) &
        -k(3853)*n(idx_C2H2Oj)*n(idx_E) &
        -k(3854)*n(idx_C2H2Oj)*n(idx_E) &
        -k(3855)*n(idx_C2H2Oj)*n(idx_E) &
        -k(3856)*n(idx_C2H3j)*n(idx_E) &
        -k(3857)*n(idx_C2H3j)*n(idx_E) &
        -k(3858)*n(idx_C2H3j)*n(idx_E) &
        -k(3859)*n(idx_C2H3j)*n(idx_E) &
        -k(3860)*n(idx_C2H3j)*n(idx_E) &
        -k(3861)*n(idx_C2H3j)*n(idx_E) &
        -k(3862)*n(idx_C3H2j)*n(idx_E) &
        -k(3863)*n(idx_H2C3j)*n(idx_E) &
        -k(3864)*n(idx_C3H2j)*n(idx_E) &
        -k(3865)*n(idx_H2C3j)*n(idx_E) &
        -k(3866)*n(idx_C3H2j)*n(idx_E) &
        -k(3867)*n(idx_H2C3j)*n(idx_E) &
        -k(3868)*n(idx_C3H2j)*n(idx_E) &
        -k(3869)*n(idx_H2C3j)*n(idx_E) &
        -k(3870)*n(idx_C3H2j)*n(idx_E) &
        -k(3871)*n(idx_H2C3j)*n(idx_E) &
        -k(3872)*n(idx_C3HNj)*n(idx_E) &
        -k(3873)*n(idx_C3HNj)*n(idx_E) &
        -k(3874)*n(idx_C3HNj)*n(idx_E) &
        -k(3875)*n(idx_C4Hj)*n(idx_E) &
        -k(3876)*n(idx_C4Hj)*n(idx_E) &
        -k(3877)*n(idx_C4Hj)*n(idx_E) &
        -k(3878)*n(idx_C4Hj)*n(idx_E) &
        -k(3879)*n(idx_C4Nj)*n(idx_E) &
        -k(3880)*n(idx_C4Nj)*n(idx_E) &
        -k(3881)*n(idx_C4Pj)*n(idx_E) &
        -k(3882)*n(idx_C4Pj)*n(idx_E) &
        -k(3883)*n(idx_C4Sj)*n(idx_E) &
        -k(3884)*n(idx_C4Sj)*n(idx_E) &
        -k(3885)*n(idx_C4Sj)*n(idx_E) &
        -k(3886)*n(idx_C5j)*n(idx_E) &
        -k(3887)*n(idx_C5j)*n(idx_E) &
        -k(3888)*n(idx_CH2O2j)*n(idx_E) &
        -k(3889)*n(idx_CH4j)*n(idx_E) &
        -k(3890)*n(idx_CH4j)*n(idx_E) &
        -k(3891)*n(idx_H3COj)*n(idx_E) &
        -k(3892)*n(idx_H3COj)*n(idx_E) &
        -k(3893)*n(idx_H3COj)*n(idx_E) &
        -k(3894)*n(idx_H3CSj)*n(idx_E) &
        -k(3895)*n(idx_H3CSj)*n(idx_E) &
        -k(3896)*n(idx_H3S2j)*n(idx_E) &
        -k(3897)*n(idx_H3S2j)*n(idx_E) &
        -k(3898)*n(idx_H3SIOj)*n(idx_E) &
        -k(3899)*n(idx_H3SIOj)*n(idx_E) &
        -k(3900)*n(idx_HC3Oj)*n(idx_E) &
        -k(3901)*n(idx_HC3Oj)*n(idx_E) &
        -k(3902)*n(idx_HC3Oj)*n(idx_E) &
        -k(3903)*n(idx_HC3Sj)*n(idx_E) &
        -k(3904)*n(idx_HC3Sj)*n(idx_E) &
        -k(3905)*n(idx_NH4j)*n(idx_E) &
        -k(3906)*n(idx_NH4j)*n(idx_E) &
        -k(3907)*n(idx_NH4j)*n(idx_E) &
        -k(3908)*n(idx_OCSjH2)*n(idx_E) &
        -k(3909)*n(idx_PC2H2j)*n(idx_E) &
        -k(3910)*n(idx_PC2H2j)*n(idx_E) &
        -k(3911)*n(idx_PC2H2j)*n(idx_E) &
        -k(3912)*n(idx_PC3Hj)*n(idx_E) &
        -k(3913)*n(idx_PC3Hj)*n(idx_E) &
        -k(3914)*n(idx_PC3Hj)*n(idx_E) &
        -k(3915)*n(idx_PCH3j)*n(idx_E) &
        -k(3916)*n(idx_PCH3j)*n(idx_E) &
        -k(3917)*n(idx_PCH3j)*n(idx_E) &
        -k(3918)*n(idx_PNH3j)*n(idx_E) &
        -k(3919)*n(idx_SIC2H2j)*n(idx_E) &
        -k(3920)*n(idx_SIC2H2j)*n(idx_E) &
        -k(3921)*n(idx_SIC3Hj)*n(idx_E) &
        -k(3922)*n(idx_SIC3Hj)*n(idx_E) &
        -k(3923)*n(idx_SIC3Hj)*n(idx_E) &
        -k(3924)*n(idx_SIC4j)*n(idx_E) &
        -k(3925)*n(idx_SIC4j)*n(idx_E) &
        -k(3926)*n(idx_SICH3j)*n(idx_E) &
        -k(3927)*n(idx_SICH3j)*n(idx_E) &
        -k(3928)*n(idx_SIH4j)*n(idx_E) &
        -k(3929)*n(idx_SIH4j)*n(idx_E) &
        -k(3930)*n(idx_CH3CNj)*n(idx_E) &
        -k(3931)*n(idx_CH3CNj)*n(idx_E) &
        -k(3932)*n(idx_CH3CNj)*n(idx_E) &
        -k(3933)*n(idx_CH3CNj)*n(idx_E) &
        -k(3934)*n(idx_C2H3Oj)*n(idx_E) &
        -k(3935)*n(idx_C2H3Oj)*n(idx_E) &
        -k(3936)*n(idx_C2H4j)*n(idx_E) &
        -k(3937)*n(idx_C2H4j)*n(idx_E) &
        -k(3938)*n(idx_C2H4j)*n(idx_E) &
        -k(3939)*n(idx_C2H4j)*n(idx_E) &
        -k(3940)*n(idx_C2H4j)*n(idx_E) &
        -k(3941)*n(idx_C2H4j)*n(idx_E) &
        -k(3942)*n(idx_C2H4j)*n(idx_E) &
        -k(3943)*n(idx_C3H2Nj)*n(idx_E) &
        -k(3944)*n(idx_C3H2Nj)*n(idx_E) &
        -k(3945)*n(idx_C3H2Nj)*n(idx_E) &
        -k(3946)*n(idx_C3H2Nj)*n(idx_E) &
        -k(3947)*n(idx_C3H2Nj)*n(idx_E) &
        -k(3948)*n(idx_C3H3j)*n(idx_E) &
        -k(3949)*n(idx_H3C3j)*n(idx_E) &
        -k(3950)*n(idx_C3H3j)*n(idx_E) &
        -k(3951)*n(idx_H3C3j)*n(idx_E) &
        -k(3952)*n(idx_C3H3j)*n(idx_E) &
        -k(3953)*n(idx_H3C3j)*n(idx_E) &
        -k(3954)*n(idx_C4H2j)*n(idx_E) &
        -k(3955)*n(idx_C4H2j)*n(idx_E) &
        -k(3956)*n(idx_C5Hj)*n(idx_E) &
        -k(3957)*n(idx_C5Hj)*n(idx_E) &
        -k(3958)*n(idx_C5Nj)*n(idx_E) &
        -k(3959)*n(idx_C6j)*n(idx_E) &
        -k(3960)*n(idx_C6j)*n(idx_E) &
        -k(3961)*n(idx_CH3O2j)*n(idx_E) &
        -k(3962)*n(idx_CH3O2j)*n(idx_E) &
        -k(3963)*n(idx_CH4Nj)*n(idx_E) &
        -k(3964)*n(idx_CH4Nj)*n(idx_E) &
        -k(3965)*n(idx_CH4Nj)*n(idx_E) &
        -k(3966)*n(idx_CH4Nj)*n(idx_E) &
        -k(3967)*n(idx_CH4Oj)*n(idx_E) &
        -k(3968)*n(idx_CH4Oj)*n(idx_E) &
        -k(3969)*n(idx_CH5j)*n(idx_E) &
        -k(3970)*n(idx_CH5j)*n(idx_E) &
        -k(3971)*n(idx_CH5j)*n(idx_E) &
        -k(3972)*n(idx_CH5j)*n(idx_E) &
        -k(3973)*n(idx_CH5j)*n(idx_E) &
        -k(3974)*n(idx_H2C3Oj)*n(idx_E) &
        -k(3975)*n(idx_H2C3Oj)*n(idx_E) &
        -k(3976)*n(idx_H2C3Oj)*n(idx_E) &
        -k(3977)*n(idx_H2C3Oj)*n(idx_E) &
        -k(3978)*n(idx_H2C3Oj)*n(idx_E) &
        -k(3979)*n(idx_HC2NCHj)*n(idx_E) &
        -k(3980)*n(idx_HC2NCHj)*n(idx_E) &
        -k(3981)*n(idx_HC2NCHj)*n(idx_E) &
        -k(3982)*n(idx_HC2NCHj)*n(idx_E) &
        -k(3983)*n(idx_HC2NCHj)*n(idx_E) &
        -k(3984)*n(idx_HC2NCHj)*n(idx_E) &
        -k(3985)*n(idx_HC4Nj)*n(idx_E) &
        -k(3986)*n(idx_HC4Oj)*n(idx_E) &
        -k(3987)*n(idx_HC4Oj)*n(idx_E) &
        -k(3988)*n(idx_HC4Oj)*n(idx_E) &
        -k(3989)*n(idx_HC4Sj)*n(idx_E) &
        -k(3990)*n(idx_HC4Sj)*n(idx_E) &
        -k(3991)*n(idx_HC4Sj)*n(idx_E) &
        -k(3992)*n(idx_NH2CNHj)*n(idx_E) &
        -k(3993)*n(idx_NH2CNHj)*n(idx_E) &
        -k(3994)*n(idx_PC2H3j)*n(idx_E) &
        -k(3995)*n(idx_PC2H3j)*n(idx_E) &
        -k(3996)*n(idx_PC2H3j)*n(idx_E) &
        -k(3997)*n(idx_PC4Hj)*n(idx_E) &
        -k(3998)*n(idx_PC4Hj)*n(idx_E) &
        -k(3999)*n(idx_PC4Hj)*n(idx_E) &
        -k(4000)*n(idx_PC4Hj)*n(idx_E) &
        -k(4001)*n(idx_PC4Hj)*n(idx_E) &
        -k(4002)*n(idx_PCH4j)*n(idx_E) &
        -k(4003)*n(idx_PCH4j)*n(idx_E) &
        -k(4004)*n(idx_PCH4j)*n(idx_E) &
        -k(4005)*n(idx_SIC2H3j)*n(idx_E) &
        -k(4006)*n(idx_SIC2H3j)*n(idx_E) &
        -k(4007)*n(idx_SIC3H2j)*n(idx_E) &
        -k(4008)*n(idx_SIC3H2j)*n(idx_E) &
        -k(4009)*n(idx_SIC4Hj)*n(idx_E) &
        -k(4010)*n(idx_SIC4Hj)*n(idx_E) &
        -k(4011)*n(idx_SICH4j)*n(idx_E) &
        -k(4012)*n(idx_SICH4j)*n(idx_E) &
        -k(4013)*n(idx_SIH5j)*n(idx_E) &
        -k(4014)*n(idx_SIH5j)*n(idx_E) &
        -k(4015)*n(idx_C2H4Nj)*n(idx_E) &
        -k(4016)*n(idx_C2H4Nj)*n(idx_E) &
        -k(4017)*n(idx_C2H4Oj)*n(idx_E) &
        -k(4018)*n(idx_C2H4Oj)*n(idx_E) &
        -k(4019)*n(idx_C2H4Oj)*n(idx_E) &
        -k(4020)*n(idx_C2H5j)*n(idx_E) &
        -k(4021)*n(idx_C2H5j)*n(idx_E) &
        -k(4022)*n(idx_C2H5j)*n(idx_E) &
        -k(4023)*n(idx_C2H5j)*n(idx_E) &
        -k(4024)*n(idx_C3H3Nj)*n(idx_E) &
        -k(4025)*n(idx_C3H3Nj)*n(idx_E) &
        -k(4026)*n(idx_C3H4j)*n(idx_E) &
        -k(4027)*n(idx_C3H4j)*n(idx_E) &
        -k(4028)*n(idx_C3H4j)*n(idx_E) &
        -k(4029)*n(idx_C3H4j)*n(idx_E) &
        -k(4030)*n(idx_C3H4j)*n(idx_E) &
        -k(4031)*n(idx_C3H4j)*n(idx_E) &
        -k(4032)*n(idx_C3H4j)*n(idx_E) &
        -k(4033)*n(idx_C3H4j)*n(idx_E) &
        -k(4034)*n(idx_C4H3j)*n(idx_E) &
        -k(4035)*n(idx_C4H3j)*n(idx_E) &
        -k(4036)*n(idx_C5H2j)*n(idx_E) &
        -k(4037)*n(idx_C5H2j)*n(idx_E) &
        -k(4038)*n(idx_C5HNj)*n(idx_E) &
        -k(4039)*n(idx_C5HNj)*n(idx_E) &
        -k(4040)*n(idx_C5HNj)*n(idx_E) &
        -k(4041)*n(idx_C6Hj)*n(idx_E) &
        -k(4042)*n(idx_C6Hj)*n(idx_E) &
        -k(4043)*n(idx_C7j)*n(idx_E) &
        -k(4044)*n(idx_C7j)*n(idx_E) &
        -k(4045)*n(idx_C7j)*n(idx_E) &
        -k(4046)*n(idx_CH5Nj)*n(idx_E) &
        -k(4047)*n(idx_CH5Nj)*n(idx_E) &
        -k(4048)*n(idx_CH5Oj)*n(idx_E) &
        -k(4049)*n(idx_CH5Oj)*n(idx_E) &
        -k(4050)*n(idx_CH5Oj)*n(idx_E) &
        -k(4051)*n(idx_CH5Oj)*n(idx_E) &
        -k(4052)*n(idx_CH5Oj)*n(idx_E) &
        -k(4053)*n(idx_H2C4Nj)*n(idx_E) &
        -k(4054)*n(idx_H3C3Oj)*n(idx_E) &
        -k(4055)*n(idx_H3C3Oj)*n(idx_E) &
        -k(4056)*n(idx_H3C3Oj)*n(idx_E) &
        -k(4057)*n(idx_NH2CH2Oj)*n(idx_E) &
        -k(4058)*n(idx_NH2CH2Oj)*n(idx_E) &
        -k(4059)*n(idx_NH2CH2Oj)*n(idx_E) &
        -k(4060)*n(idx_NH2CH2Oj)*n(idx_E) &
        -k(4061)*n(idx_NH2CH2Oj)*n(idx_E) &
        -k(4062)*n(idx_PC2H4j)*n(idx_E) &
        -k(4063)*n(idx_PC2H4j)*n(idx_E) &
        -k(4064)*n(idx_PC2H4j)*n(idx_E) &
        -k(4065)*n(idx_PC4H2j)*n(idx_E) &
        -k(4066)*n(idx_PC4H2j)*n(idx_E) &
        -k(4067)*n(idx_C2H5Oj)*n(idx_E) &
        -k(4068)*n(idx_C2H5Oj)*n(idx_E) &
        -k(4069)*n(idx_C2H5Oj)*n(idx_E) &
        -k(4070)*n(idx_C2H5Oj)*n(idx_E) &
        -k(4071)*n(idx_C2H6j)*n(idx_E) &
        -k(4072)*n(idx_C2H6j)*n(idx_E) &
        -k(4073)*n(idx_C3H4Nj)*n(idx_E) &
        -k(4074)*n(idx_C3H4Nj)*n(idx_E) &
        -k(4075)*n(idx_C3H4Nj)*n(idx_E) &
        -k(4076)*n(idx_C3H5j)*n(idx_E) &
        -k(4077)*n(idx_C3H5j)*n(idx_E) &
        -k(4078)*n(idx_C4H4j)*n(idx_E) &
        -k(4079)*n(idx_C4H4j)*n(idx_E) &
        -k(4080)*n(idx_C4H4j)*n(idx_E) &
        -k(4081)*n(idx_C5H2Nj)*n(idx_E) &
        -k(4082)*n(idx_C5H2Nj)*n(idx_E) &
        -k(4083)*n(idx_C5H3j)*n(idx_E) &
        -k(4084)*n(idx_C5H3j)*n(idx_E) &
        -k(4085)*n(idx_C6H2j)*n(idx_E) &
        -k(4086)*n(idx_C6H2j)*n(idx_E) &
        -k(4087)*n(idx_C6H2j)*n(idx_E) &
        -k(4088)*n(idx_C7Hj)*n(idx_E) &
        -k(4089)*n(idx_C7Hj)*n(idx_E) &
        -k(4090)*n(idx_C7Nj)*n(idx_E) &
        -k(4091)*n(idx_C8j)*n(idx_E) &
        -k(4092)*n(idx_C8j)*n(idx_E) &
        -k(4093)*n(idx_CH6Nj)*n(idx_E) &
        -k(4094)*n(idx_CH6Nj)*n(idx_E) &
        -k(4095)*n(idx_COOCH4j)*n(idx_E) &
        -k(4096)*n(idx_COOCH4j)*n(idx_E) &
        -k(4097)*n(idx_H3C4Nj)*n(idx_E) &
        -k(4098)*n(idx_C2H5OHj)*n(idx_E) &
        -k(4099)*n(idx_C2H5OHj)*n(idx_E) &
        -k(4100)*n(idx_C2H5OHj)*n(idx_E) &
        -k(4101)*n(idx_C2H5OHj)*n(idx_E) &
        -k(4102)*n(idx_C4H4Nj)*n(idx_E) &
        -k(4103)*n(idx_C4H4Nj)*n(idx_E) &
        -k(4104)*n(idx_C4H5j)*n(idx_E) &
        -k(4105)*n(idx_C4H5j)*n(idx_E) &
        -k(4106)*n(idx_C4H5j)*n(idx_E) &
        -k(4107)*n(idx_C4H5j)*n(idx_E) &
        -k(4108)*n(idx_C4H5j)*n(idx_E) &
        -k(4109)*n(idx_C5H3Nj)*n(idx_E) &
        -k(4110)*n(idx_C5H3Nj)*n(idx_E) &
        -k(4111)*n(idx_C5H4j)*n(idx_E) &
        -k(4112)*n(idx_C5H4j)*n(idx_E) &
        -k(4113)*n(idx_C6H3j)*n(idx_E) &
        -k(4114)*n(idx_C6H3j)*n(idx_E) &
        -k(4115)*n(idx_C6H3j)*n(idx_E) &
        -k(4116)*n(idx_C7H2j)*n(idx_E) &
        -k(4117)*n(idx_C7H2j)*n(idx_E) &
        -k(4118)*n(idx_C7HNj)*n(idx_E) &
        -k(4119)*n(idx_C7HNj)*n(idx_E) &
        -k(4120)*n(idx_C8Hj)*n(idx_E) &
        -k(4121)*n(idx_C8Hj)*n(idx_E) &
        -k(4122)*n(idx_C9j)*n(idx_E) &
        -k(4123)*n(idx_C9j)*n(idx_E) &
        -k(4124)*n(idx_CH3OCH3j)*n(idx_E) &
        -k(4125)*n(idx_CH3OCH3j)*n(idx_E) &
        -k(4126)*n(idx_CH3OCH3j)*n(idx_E) &
        -k(4127)*n(idx_H5C2O2j)*n(idx_E) &
        -k(4128)*n(idx_H5C2O2j)*n(idx_E) &
        -k(4129)*n(idx_C10j)*n(idx_E) &
        -k(4130)*n(idx_C10j)*n(idx_E) &
        -k(4131)*n(idx_C2H5OH2j)*n(idx_E) &
        -k(4132)*n(idx_C2H5OH2j)*n(idx_E) &
        -k(4133)*n(idx_C2H5OH2j)*n(idx_E) &
        -k(4134)*n(idx_C2H6COj)*n(idx_E) &
        -k(4135)*n(idx_C2H6COj)*n(idx_E) &
        -k(4136)*n(idx_C5H4Nj)*n(idx_E) &
        -k(4137)*n(idx_C5H4Nj)*n(idx_E) &
        -k(4138)*n(idx_C5H5j)*n(idx_E) &
        -k(4139)*n(idx_C5H5j)*n(idx_E) &
        -k(4140)*n(idx_C6H4j)*n(idx_E) &
        -k(4141)*n(idx_C6H4j)*n(idx_E) &
        -k(4142)*n(idx_C7H2Nj)*n(idx_E) &
        -k(4143)*n(idx_C7H2Nj)*n(idx_E) &
        -k(4144)*n(idx_C7H3j)*n(idx_E) &
        -k(4145)*n(idx_C7H3j)*n(idx_E) &
        -k(4146)*n(idx_C8H2j)*n(idx_E) &
        -k(4147)*n(idx_C8H2j)*n(idx_E) &
        -k(4148)*n(idx_C9Hj)*n(idx_E) &
        -k(4149)*n(idx_C9Hj)*n(idx_E) &
        -k(4150)*n(idx_C9Nj)*n(idx_E) &
        -k(4151)*n(idx_CH3OCH4j)*n(idx_E) &
        -k(4152)*n(idx_CH3OCH4j)*n(idx_E) &
        -k(4153)*n(idx_CH3OCH4j)*n(idx_E) &
        -k(4154)*n(idx_C3H6OHj)*n(idx_E) &
        -k(4155)*n(idx_C3H6OHj)*n(idx_E) &
        -k(4156)*n(idx_C4H7j)*n(idx_E) &
        -k(4157)*n(idx_C4H7j)*n(idx_E) &
        -k(4158)*n(idx_C4H7j)*n(idx_E) &
        -k(4159)*n(idx_C4H7j)*n(idx_E) &
        -k(4160)*n(idx_C6H4Nj)*n(idx_E) &
        -k(4161)*n(idx_C6H4Nj)*n(idx_E) &
        -k(4162)*n(idx_C6H5j)*n(idx_E) &
        -k(4163)*n(idx_C6H5j)*n(idx_E) &
        -k(4164)*n(idx_C7H3Nj)*n(idx_E) &
        -k(4165)*n(idx_C7H3Nj)*n(idx_E) &
        -k(4166)*n(idx_C7H4j)*n(idx_E) &
        -k(4167)*n(idx_C7H4j)*n(idx_E) &
        -k(4168)*n(idx_C8H3j)*n(idx_E) &
        -k(4169)*n(idx_C8H3j)*n(idx_E) &
        -k(4170)*n(idx_C9H2j)*n(idx_E) &
        -k(4171)*n(idx_C9H2j)*n(idx_E) &
        -k(4172)*n(idx_C9HNj)*n(idx_E) &
        -k(4173)*n(idx_C9HNj)*n(idx_E) &
        -k(4174)*n(idx_C7H5j)*n(idx_E) &
        -k(4175)*n(idx_C7H5j)*n(idx_E) &
        -k(4176)*n(idx_C8H4j)*n(idx_E) &
        -k(4177)*n(idx_C8H4j)*n(idx_E) &
        -k(4178)*n(idx_C9H2Nj)*n(idx_E) &
        -k(4179)*n(idx_C9H2Nj)*n(idx_E) &
        -k(4180)*n(idx_C9H3j)*n(idx_E) &
        -k(4181)*n(idx_C9H3j)*n(idx_E) &
        -k(4182)*n(idx_C6H7j)*n(idx_E) &
        -k(4183)*n(idx_C6H7j)*n(idx_E) &
        -k(4184)*n(idx_C8H4Nj)*n(idx_E) &
        -k(4185)*n(idx_C8H4Nj)*n(idx_E) &
        -k(4186)*n(idx_C8H5j)*n(idx_E) &
        -k(4187)*n(idx_C8H5j)*n(idx_E) &
        -k(4188)*n(idx_C9H3Nj)*n(idx_E) &
        -k(4189)*n(idx_C9H3Nj)*n(idx_E) &
        -k(4190)*n(idx_C9H4j)*n(idx_E) &
        -k(4191)*n(idx_C9H4j)*n(idx_E) &
        -k(4192)*n(idx_C9H5j)*n(idx_E) &
        -k(4193)*n(idx_C9H5j)*n(idx_E) &
        -k(4194)*n(idx_Cj)*n(idx_E) &
        -k(4195)*n(idx_CLj)*n(idx_E) &
        -k(4196)*n(idx_FEj)*n(idx_E) &
        -k(4197)*n(idx_Hj)*n(idx_E) &
        -k(4198)*n(idx_HEj)*n(idx_E) &
        -k(4199)*n(idx_MGj)*n(idx_E) &
        -k(4200)*n(idx_Nj)*n(idx_E) &
        -k(4201)*n(idx_NAj)*n(idx_E) &
        -k(4202)*n(idx_Oj)*n(idx_E) &
        -k(4203)*n(idx_Sj)*n(idx_E) &
        -k(4204)*n(idx_SIj)*n(idx_E) &
        -k(4205)*n(idx_H2j)*n(idx_E) &
        -k(4206)*n(idx_H2Sj)*n(idx_E) &
        -k(4207)*n(idx_CH3j)*n(idx_E) &
        -k(4208)*n(idx_H2COj)*n(idx_E) &
        -k(4209)*n(idx_H2CSj)*n(idx_E) &
        -k(4246)*n(idx_C)*n(idx_E) &
        -k(4247)*n(idx_H)*n(idx_E) &
        -k(4248)*n(idx_O)*n(idx_E) &
        -k(4249)*n(idx_S)*n(idx_E) &
        +k(4250)*n(idx_C) &
        +k(4251)*n(idx_CL) &
        +k(4252)*n(idx_FE) &
        +k(4253)*n(idx_MG) &
        +k(4254)*n(idx_NA) &
        +k(4255)*n(idx_S) &
        +k(4256)*n(idx_SI) &
        +k(4258)*n(idx_C2) &
        +k(4261)*n(idx_CH) &
        +k(4272)*n(idx_NH) &
        +k(4274)*n(idx_NO) &
        +k(4277)*n(idx_O2) &
        +k(4279)*n(idx_OH) &
        +k(4286)*n(idx_C2H) &
        +k(4292)*n(idx_CH2) &
        +k(4295)*n(idx_H2O) &
        +k(4299)*n(idx_HCO) &
        +k(4304)*n(idx_NH2) &
        +k(4308)*n(idx_OCS) &
        +k(4311)*n(idx_C2H2) &
        +k(4321)*n(idx_CH3) &
        +k(4324)*n(idx_H2CO) &
        +k(4325)*n(idx_H2CO) &
        +k(4329)*n(idx_NH3) &
        +k(4331)*n(idx_C2H2O) &
        +k(4333)*n(idx_C2H3) &
        +k(4344)*n(idx_CH2O2) &
        +k(4351)*n(idx_CH3CN) &
        +k(4353)*n(idx_C2H4) &
        +k(4360)*n(idx_C4H2) &
        +k(4367)*n(idx_CH3OH) &
        +k(4370)*n(idx_C2H4O) &
        +k(4374)*n(idx_C3H4) &
        +k(4387)*n(idx_CH5N) &
        +k(4409)*n(idx_C2H5OH) &
        +k(4412)*n(idx_CH3OCH3) &
        +k(4424)*n(idx_Ck) &
        +k(4425)*n(idx_Hk) &
        +k(4426)*n(idx_Ok) &
        +k(4427)*n(idx_Sk) &
        +k(4428)*n(idx_CNk) &
        +k(4429)*n(idx_OHk) &
        +k(4430)*n(idx_H) &
        +k(4431)*n(idx_HE)

    !GRAIN-
    !GRAIN-
    dn(idx_GRAINk) = &
        +k(1)*n(idx_E)*n(idx_GRAIN0) &
        -k(2)*n(idx_Cj)*n(idx_GRAINk) &
        -k(3)*n(idx_FEj)*n(idx_GRAINk) &
        -k(4)*n(idx_Hj)*n(idx_GRAINk) &
        -k(5)*n(idx_HEj)*n(idx_GRAINk) &
        -k(6)*n(idx_MGj)*n(idx_GRAINk) &
        -k(7)*n(idx_Nj)*n(idx_GRAINk) &
        -k(8)*n(idx_NAj)*n(idx_GRAINk) &
        -k(9)*n(idx_Oj)*n(idx_GRAINk) &
        -k(10)*n(idx_Sj)*n(idx_GRAINk) &
        -k(11)*n(idx_SIj)*n(idx_GRAINk) &
        -k(12)*n(idx_H3j)*n(idx_GRAINk) &
        -k(13)*n(idx_HCOj)*n(idx_GRAINk)

    !H-
    !H-
    dn(idx_Hk) = &
        +k(37)*n(idx_H2) &
        -k(3119)*n(idx_Hk)*n(idx_H2O) &
        -k(3120)*n(idx_Hk)*n(idx_HCN) &
        -k(3219)*n(idx_Hk)*n(idx_C) &
        -k(3220)*n(idx_Hk)*n(idx_H) &
        -k(3221)*n(idx_Hk)*n(idx_N) &
        -k(3222)*n(idx_Hk)*n(idx_O) &
        -k(3223)*n(idx_Hk)*n(idx_C2) &
        -k(3224)*n(idx_Hk)*n(idx_CH) &
        -k(3225)*n(idx_Hk)*n(idx_CN) &
        -k(3226)*n(idx_Hk)*n(idx_CO) &
        -k(3227)*n(idx_Hk)*n(idx_NH) &
        -k(3228)*n(idx_Hk)*n(idx_OH) &
        -k(3229)*n(idx_Hk)*n(idx_C2H) &
        -k(3230)*n(idx_Hk)*n(idx_CH2) &
        -k(3231)*n(idx_Hk)*n(idx_HCO) &
        -k(3232)*n(idx_Hk)*n(idx_NH2) &
        -k(3233)*n(idx_Hk)*n(idx_CH3) &
        -k(4211)*n(idx_Cj)*n(idx_Hk) &
        -k(4214)*n(idx_FEj)*n(idx_Hk) &
        -k(4217)*n(idx_Hj)*n(idx_Hk) &
        -k(4220)*n(idx_HEj)*n(idx_Hk) &
        -k(4223)*n(idx_MGj)*n(idx_Hk) &
        -k(4226)*n(idx_Nj)*n(idx_Hk) &
        -k(4229)*n(idx_NAj)*n(idx_Hk) &
        -k(4232)*n(idx_Oj)*n(idx_Hk) &
        -k(4235)*n(idx_Sj)*n(idx_Hk) &
        -k(4238)*n(idx_SIj)*n(idx_Hk) &
        -k(4240)*n(idx_H2j)*n(idx_Hk) &
        -k(4241)*n(idx_H3j)*n(idx_Hk) &
        -k(4242)*n(idx_HCOj)*n(idx_Hk) &
        -k(4243)*n(idx_H3Oj)*n(idx_Hk) &
        -k(4244)*n(idx_H3Oj)*n(idx_Hk) &
        -k(4245)*n(idx_NH4j)*n(idx_Hk) &
        +k(4247)*n(idx_H)*n(idx_E) &
        -k(4425)*n(idx_Hk)

    !C-
    !C-
    dn(idx_Ck) = &
        -k(3116)*n(idx_Ck)*n(idx_NO) &
        -k(3117)*n(idx_Ck)*n(idx_O2) &
        -k(3118)*n(idx_Ck)*n(idx_CO2) &
        -k(3208)*n(idx_Ck)*n(idx_C) &
        -k(3209)*n(idx_Ck)*n(idx_H) &
        -k(3210)*n(idx_Ck)*n(idx_N) &
        -k(3211)*n(idx_Ck)*n(idx_O) &
        -k(3212)*n(idx_Ck)*n(idx_CH) &
        -k(3213)*n(idx_Ck)*n(idx_H2) &
        -k(3214)*n(idx_Ck)*n(idx_NH) &
        -k(3215)*n(idx_Ck)*n(idx_O2) &
        -k(3216)*n(idx_Ck)*n(idx_OH) &
        -k(3217)*n(idx_Ck)*n(idx_CH2) &
        -k(3218)*n(idx_Ck)*n(idx_H2O) &
        -k(4210)*n(idx_Cj)*n(idx_Ck) &
        -k(4213)*n(idx_FEj)*n(idx_Ck) &
        -k(4216)*n(idx_Hj)*n(idx_Ck) &
        -k(4219)*n(idx_HEj)*n(idx_Ck) &
        -k(4222)*n(idx_MGj)*n(idx_Ck) &
        -k(4225)*n(idx_Nj)*n(idx_Ck) &
        -k(4228)*n(idx_NAj)*n(idx_Ck) &
        -k(4231)*n(idx_Oj)*n(idx_Ck) &
        -k(4234)*n(idx_Sj)*n(idx_Ck) &
        -k(4237)*n(idx_SIj)*n(idx_Ck) &
        +k(4246)*n(idx_C)*n(idx_E) &
        -k(4424)*n(idx_Ck)

    !CN-
    !CN-
    dn(idx_CNk) = &
        +k(3116)*n(idx_Ck)*n(idx_NO) &
        +k(3120)*n(idx_Hk)*n(idx_HCN) &
        +k(3121)*n(idx_Ok)*n(idx_CN) &
        +k(3123)*n(idx_Ok)*n(idx_HCN) &
        +k(3125)*n(idx_OHk)*n(idx_CN) &
        +k(3126)*n(idx_OHk)*n(idx_HCN) &
        -k(3248)*n(idx_CNk)*n(idx_H) &
        -k(3249)*n(idx_CNk)*n(idx_CH3) &
        -k(4428)*n(idx_CNk)

    !O-
    !O-
    dn(idx_Ok) = &
        +k(3117)*n(idx_Ck)*n(idx_O2) &
        -k(3121)*n(idx_Ok)*n(idx_CN) &
        -k(3122)*n(idx_Ok)*n(idx_H2) &
        -k(3123)*n(idx_Ok)*n(idx_HCN) &
        -k(3124)*n(idx_Ok)*n(idx_CH4) &
        -k(3234)*n(idx_Ok)*n(idx_C) &
        -k(3235)*n(idx_Ok)*n(idx_H) &
        -k(3236)*n(idx_Ok)*n(idx_N) &
        -k(3237)*n(idx_Ok)*n(idx_O) &
        -k(3238)*n(idx_Ok)*n(idx_CH) &
        -k(3239)*n(idx_Ok)*n(idx_CO) &
        -k(3240)*n(idx_Ok)*n(idx_H2) &
        -k(3241)*n(idx_Ok)*n(idx_CH2) &
        +k(4248)*n(idx_O)*n(idx_E) &
        -k(4426)*n(idx_Ok)

    !OH-
    !OH-
    dn(idx_OHk) = &
        +k(3119)*n(idx_Hk)*n(idx_H2O) &
        +k(3122)*n(idx_Ok)*n(idx_H2) &
        +k(3124)*n(idx_Ok)*n(idx_CH4) &
        -k(3125)*n(idx_OHk)*n(idx_CN) &
        -k(3126)*n(idx_OHk)*n(idx_HCN) &
        -k(3250)*n(idx_OHk)*n(idx_C) &
        -k(3251)*n(idx_OHk)*n(idx_H) &
        -k(3252)*n(idx_OHk)*n(idx_CH) &
        -k(3253)*n(idx_OHk)*n(idx_CH3) &
        -k(4429)*n(idx_OHk)

    !S-
    !S-
    dn(idx_Sk) = &
        -k(3242)*n(idx_Sk)*n(idx_C) &
        -k(3243)*n(idx_Sk)*n(idx_H) &
        -k(3244)*n(idx_Sk)*n(idx_N) &
        -k(3245)*n(idx_Sk)*n(idx_O) &
        -k(3246)*n(idx_Sk)*n(idx_CO) &
        -k(3247)*n(idx_Sk)*n(idx_O2) &
        -k(4212)*n(idx_Cj)*n(idx_Sk) &
        -k(4215)*n(idx_FEj)*n(idx_Sk) &
        -k(4218)*n(idx_Hj)*n(idx_Sk) &
        -k(4221)*n(idx_HEj)*n(idx_Sk) &
        -k(4224)*n(idx_MGj)*n(idx_Sk) &
        -k(4227)*n(idx_Nj)*n(idx_Sk) &
        -k(4230)*n(idx_NAj)*n(idx_Sk) &
        -k(4233)*n(idx_Oj)*n(idx_Sk) &
        -k(4236)*n(idx_Sj)*n(idx_Sk) &
        -k(4239)*n(idx_SIj)*n(idx_Sk) &
        +k(4249)*n(idx_S)*n(idx_E) &
        -k(4427)*n(idx_Sk)

    !GRAIN0
    !GRAIN0
    dn(idx_GRAIN0) = &
        -k(1)*n(idx_E)*n(idx_GRAIN0) &
        +k(2)*n(idx_Cj)*n(idx_GRAINk) &
        +k(3)*n(idx_FEj)*n(idx_GRAINk) &
        +k(4)*n(idx_Hj)*n(idx_GRAINk) &
        +k(5)*n(idx_HEj)*n(idx_GRAINk) &
        +k(6)*n(idx_MGj)*n(idx_GRAINk) &
        +k(7)*n(idx_Nj)*n(idx_GRAINk) &
        +k(8)*n(idx_NAj)*n(idx_GRAINk) &
        +k(9)*n(idx_Oj)*n(idx_GRAINk) &
        +k(10)*n(idx_Sj)*n(idx_GRAINk) &
        +k(11)*n(idx_SIj)*n(idx_GRAINk) &
        +k(12)*n(idx_H3j)*n(idx_GRAINk) &
        +k(13)*n(idx_HCOj)*n(idx_GRAINk)

    !C
    !C
    dn(idx_C) = &
        +k(2)*n(idx_Cj)*n(idx_GRAINk) &
        -k(14)*n(idx_C) &
        +2.d0*k(26)*n(idx_C2) &
        +k(27)*n(idx_CCL) &
        +k(28)*n(idx_CH) &
        +k(30)*n(idx_CN) &
        +k(31)*n(idx_CO) &
        +k(33)*n(idx_CP) &
        +k(34)*n(idx_CS) &
        +k(56)*n(idx_SIC) &
        +k(63)*n(idx_C2N) &
        +k(64)*n(idx_C2S) &
        +k(65)*n(idx_C3) &
        +k(67)*n(idx_CCO) &
        +k(69)*n(idx_CCP) &
        +k(97)*n(idx_SIC2) &
        +k(108)*n(idx_C3P) &
        +k(110)*n(idx_C4) &
        +k(123)*n(idx_SIC3) &
        +k(134)*n(idx_C4P) &
        +k(136)*n(idx_C5) &
        +k(159)*n(idx_C6) &
        +k(173)*n(idx_C7) &
        +k(180)*n(idx_C8) &
        +k(186)*n(idx_C9) &
        +k(200)*n(idx_CHj) &
        +k(201)*n(idx_Cj)*n(idx_FE) &
        +k(202)*n(idx_Cj)*n(idx_MG) &
        +k(203)*n(idx_Cj)*n(idx_NA) &
        +k(204)*n(idx_Cj)*n(idx_P) &
        +k(205)*n(idx_Cj)*n(idx_S) &
        +k(206)*n(idx_Cj)*n(idx_SI) &
        +k(207)*n(idx_Cj)*n(idx_CCL) &
        +k(209)*n(idx_Cj)*n(idx_CH) &
        +k(210)*n(idx_Cj)*n(idx_CLO) &
        +k(211)*n(idx_Cj)*n(idx_CP) &
        +k(218)*n(idx_Cj)*n(idx_NO) &
        +k(220)*n(idx_Cj)*n(idx_NS) &
        +k(224)*n(idx_Cj)*n(idx_PH) &
        +k(225)*n(idx_Cj)*n(idx_PO) &
        +k(227)*n(idx_Cj)*n(idx_SIC) &
        +k(230)*n(idx_Cj)*n(idx_SIN) &
        +k(233)*n(idx_Cj)*n(idx_SIS) &
        +k(237)*n(idx_Cj)*n(idx_SO) &
        +k(239)*n(idx_Cj)*n(idx_C2S) &
        +k(241)*n(idx_Cj)*n(idx_CCO) &
        +k(243)*n(idx_Cj)*n(idx_CCP) &
        +k(245)*n(idx_Cj)*n(idx_CH2) &
        +k(249)*n(idx_Cj)*n(idx_H2S) &
        +k(254)*n(idx_Cj)*n(idx_HCO) &
        +k(256)*n(idx_Cj)*n(idx_HCP) &
        +k(260)*n(idx_Cj)*n(idx_HPO) &
        +k(265)*n(idx_Cj)*n(idx_OCS) &
        +k(266)*n(idx_Cj)*n(idx_SIC2) &
        +k(269)*n(idx_Cj)*n(idx_SIH2) &
        +k(275)*n(idx_Cj)*n(idx_C3O) &
        +k(278)*n(idx_Cj)*n(idx_C3S) &
        +k(282)*n(idx_Cj)*n(idx_CH3) &
        +k(285)*n(idx_Cj)*n(idx_H2CO) &
        +k(287)*n(idx_Cj)*n(idx_H2SIO) &
        +k(292)*n(idx_Cj)*n(idx_NH3) &
        +k(293)*n(idx_Cj)*n(idx_SIC2H) &
        +k(295)*n(idx_Cj)*n(idx_SIC3) &
        +k(297)*n(idx_Cj)*n(idx_SICH2) &
        +k(301)*n(idx_Cj)*n(idx_SIH3) &
        +k(302)*n(idx_Cj)*n(idx_CH2CN) &
        +k(303)*n(idx_Cj)*n(idx_C2H2O) &
        +k(305)*n(idx_Cj)*n(idx_C2H3) &
        +k(314)*n(idx_Cj)*n(idx_C4S) &
        +k(329)*n(idx_Cj)*n(idx_HC2NC) &
        +k(341)*n(idx_Cj)*n(idx_SICH3) &
        +k(350)*n(idx_Cj)*n(idx_C2H4) &
        +k(353)*n(idx_Cj)*n(idx_C3H3) &
        +k(354)*n(idx_Cj)*n(idx_C3H3) &
        +k(358)*n(idx_Cj)*n(idx_C4H2) &
        +k(363)*n(idx_Cj)*n(idx_CH3OH) &
        +k(371)*n(idx_Cj)*n(idx_C2H4O) &
        +k(374)*n(idx_Cj)*n(idx_C2H5) &
        +k(375)*n(idx_Cj)*n(idx_C3H3N) &
        +k(381)*n(idx_Cj)*n(idx_C3H4) &
        +k(384)*n(idx_Cj)*n(idx_C4H3) &
        +k(391)*n(idx_Cj)*n(idx_CH5N) &
        +k(393)*n(idx_Cj)*n(idx_HC5N) &
        +k(399)*n(idx_Cj)*n(idx_HCOOCH3) &
        +k(402)*n(idx_Cj)*n(idx_C2H5OH) &
        +k(409)*n(idx_Cj)*n(idx_CH3OCH3) &
        +k(411)*n(idx_Cj)*n(idx_C2H6CO) &
        +k(539)*n(idx_Hj)*n(idx_HC2NC) &
        +k(632)*n(idx_HEj)*n(idx_C2) &
        +k(639)*n(idx_HEj)*n(idx_CN) &
        +k(642)*n(idx_HEj)*n(idx_CP) &
        +k(644)*n(idx_HEj)*n(idx_CS) &
        +k(667)*n(idx_HEj)*n(idx_SIC) &
        +k(678)*n(idx_HEj)*n(idx_C2H) &
        +k(683)*n(idx_HEj)*n(idx_C2S) &
        +k(685)*n(idx_HEj)*n(idx_C3) &
        +k(694)*n(idx_HEj)*n(idx_CO2) &
        +k(717)*n(idx_HEj)*n(idx_HNC) &
        +k(764)*n(idx_HEj)*n(idx_C4) &
        +k(782)*n(idx_HEj)*n(idx_SIC3) &
        +k(803)*n(idx_HEj)*n(idx_C5) &
        +k(836)*n(idx_HEj)*n(idx_HNC3) &
        +k(844)*n(idx_HEj)*n(idx_SIC4) &
        +k(867)*n(idx_HEj)*n(idx_C6) &
        +k(890)*n(idx_HEj)*n(idx_C4H3) &
        +k(891)*n(idx_HEj)*n(idx_C4H3) &
        +k(900)*n(idx_HEj)*n(idx_C7) &
        +k(915)*n(idx_HEj)*n(idx_C8) &
        +k(929)*n(idx_HEj)*n(idx_C9) &
        +k(961)*n(idx_Nj)*n(idx_CO) &
        +k(1006)*n(idx_Oj)*n(idx_C2) &
        +k(1009)*n(idx_Oj)*n(idx_CN) &
        +k(1060)*n(idx_Sj)*n(idx_C2) &
        -k(1121)*n(idx_C2j)*n(idx_C) &
        +k(1123)*n(idx_C2j)*n(idx_O) &
        +k(1125)*n(idx_C2j)*n(idx_S) &
        +k(1126)*n(idx_C2j)*n(idx_C2) &
        -k(1152)*n(idx_CHj)*n(idx_C) &
        +k(1161)*n(idx_CHj)*n(idx_S) &
        +k(1179)*n(idx_CHj)*n(idx_H2O) &
        +k(1181)*n(idx_CHj)*n(idx_H2S) &
        +k(1184)*n(idx_CHj)*n(idx_HCN) &
        +k(1187)*n(idx_CHj)*n(idx_HNC) &
        +k(1190)*n(idx_CHj)*n(idx_OCS) &
        +k(1195)*n(idx_CHj)*n(idx_H2CO) &
        +k(1198)*n(idx_CHj)*n(idx_NH3) &
        +k(1204)*n(idx_CHj)*n(idx_CH3OH) &
        -k(1205)*n(idx_CNj)*n(idx_C) &
        -k(1236)*n(idx_COj)*n(idx_C) &
        +k(1238)*n(idx_COj)*n(idx_N) &
        +k(1243)*n(idx_COj)*n(idx_CH) &
        -k(1274)*n(idx_CSj)*n(idx_C) &
        -k(1283)*n(idx_H2j)*n(idx_C) &
        -k(1336)*n(idx_HSj)*n(idx_C) &
        -k(1356)*n(idx_N2j)*n(idx_C) &
        -k(1393)*n(idx_NHj)*n(idx_C) &
        +k(1401)*n(idx_NHj)*n(idx_C2) &
        -k(1440)*n(idx_O2j)*n(idx_C) &
        -k(1441)*n(idx_O2j)*n(idx_C) &
        -k(1468)*n(idx_OHj)*n(idx_C) &
        +k(1532)*n(idx_SICj)*n(idx_O) &
        -k(1534)*n(idx_SIHj)*n(idx_C) &
        -k(1540)*n(idx_SIOj)*n(idx_C) &
        -k(1562)*n(idx_C2Hj)*n(idx_C) &
        +k(1565)*n(idx_C2Hj)*n(idx_O) &
        +k(1592)*n(idx_C2Nj)*n(idx_H2) &
        -k(1604)*n(idx_CH2j)*n(idx_C) &
        -k(1656)*n(idx_H2Oj)*n(idx_C) &
        -k(1696)*n(idx_H2Sj)*n(idx_C) &
        -k(1712)*n(idx_H3j)*n(idx_C) &
        -k(1873)*n(idx_HCNj)*n(idx_C) &
        -k(1901)*n(idx_HCOj)*n(idx_C) &
        -k(2034)*n(idx_HCPj)*n(idx_C) &
        -k(2040)*n(idx_HNCj)*n(idx_C) &
        -k(2059)*n(idx_HNOj)*n(idx_C) &
        -k(2086)*n(idx_N2Hj)*n(idx_C) &
        -k(2148)*n(idx_O2Hj)*n(idx_C) &
        -k(2178)*n(idx_SIH2j)*n(idx_C) &
        -k(2187)*n(idx_C2H2j)*n(idx_C) &
        -k(2188)*n(idx_C2H2j)*n(idx_C) &
        -k(2189)*n(idx_C2H2j)*n(idx_C) &
        -k(2304)*n(idx_CH2SIj)*n(idx_C) &
        -k(2305)*n(idx_CH2SIj)*n(idx_C) &
        -k(2306)*n(idx_CH2SIj)*n(idx_C) &
        -k(2311)*n(idx_CH3j)*n(idx_C) &
        -k(2312)*n(idx_CH3j)*n(idx_C) &
        -k(2427)*n(idx_H3Oj)*n(idx_C) &
        -k(2499)*n(idx_HCO2j)*n(idx_C) &
        +k(2516)*n(idx_NH3j)*n(idx_CH) &
        -k(2532)*n(idx_SIC2Hj)*n(idx_C) &
        -k(2534)*n(idx_SIH3j)*n(idx_C) &
        -k(2541)*n(idx_SINH2j)*n(idx_C) &
        -k(2542)*n(idx_SINH2j)*n(idx_C) &
        -k(2543)*n(idx_C2H3j)*n(idx_C) &
        -k(2544)*n(idx_C2H3j)*n(idx_C) &
        -k(2545)*n(idx_C2H3j)*n(idx_C) &
        -k(2610)*n(idx_C3H2j)*n(idx_C) &
        -k(2611)*n(idx_H2C3j)*n(idx_C) &
        -k(2684)*n(idx_C4Hj)*n(idx_C) &
        -k(2746)*n(idx_NH4j)*n(idx_C) &
        -k(2747)*n(idx_NH4j)*n(idx_C) &
        -k(2748)*n(idx_SIC2H2j)*n(idx_C) &
        -k(2749)*n(idx_SIC3Hj)*n(idx_C) &
        -k(2750)*n(idx_SICH3j)*n(idx_C) &
        -k(2752)*n(idx_SIH4j)*n(idx_C) &
        -k(2757)*n(idx_C2H4j)*n(idx_C) &
        -k(2758)*n(idx_C2H4j)*n(idx_C) &
        -k(2759)*n(idx_C2H4j)*n(idx_C) &
        -k(2760)*n(idx_C2H4j)*n(idx_C) &
        -k(2812)*n(idx_C3H3j)*n(idx_C) &
        -k(2813)*n(idx_H3C3j)*n(idx_C) &
        -k(2814)*n(idx_C3H3j)*n(idx_C) &
        -k(2815)*n(idx_H3C3j)*n(idx_C) &
        -k(2870)*n(idx_C4H2j)*n(idx_C) &
        -k(2871)*n(idx_C4H2j)*n(idx_C) &
        -k(2900)*n(idx_C5Hj)*n(idx_C) &
        -k(2906)*n(idx_CH5j)*n(idx_C) &
        -k(2907)*n(idx_CH5j)*n(idx_C) &
        -k(2908)*n(idx_CH5j)*n(idx_C) &
        -k(2934)*n(idx_SIC2H3j)*n(idx_C) &
        -k(2935)*n(idx_SIC3H2j)*n(idx_C) &
        -k(2936)*n(idx_SICH4j)*n(idx_C) &
        -k(2937)*n(idx_SIH5j)*n(idx_C) &
        -k(2940)*n(idx_C2H5j)*n(idx_C) &
        -k(2941)*n(idx_C2H5j)*n(idx_C) &
        -k(2942)*n(idx_C2H5j)*n(idx_C) &
        -k(2956)*n(idx_C3H4j)*n(idx_C) &
        -k(2957)*n(idx_C3H4j)*n(idx_C) &
        -k(2965)*n(idx_C4H3j)*n(idx_C) &
        -k(2966)*n(idx_C4H3j)*n(idx_C) &
        -k(2988)*n(idx_C5H2j)*n(idx_C) &
        -k(2989)*n(idx_C5H2j)*n(idx_C) &
        -k(3014)*n(idx_C6Hj)*n(idx_C) &
        -k(3022)*n(idx_C3H5j)*n(idx_C) &
        -k(3030)*n(idx_C5H3j)*n(idx_C) &
        -k(3031)*n(idx_C5H3j)*n(idx_C) &
        -k(3034)*n(idx_C6H2j)*n(idx_C) &
        -k(3035)*n(idx_C6H2j)*n(idx_C) &
        -k(3052)*n(idx_C7Hj)*n(idx_C) &
        -k(3059)*n(idx_C4H4Nj)*n(idx_C) &
        -k(3062)*n(idx_C6H3j)*n(idx_C) &
        -k(3063)*n(idx_C6H3j)*n(idx_C) &
        -k(3065)*n(idx_C7H2j)*n(idx_C) &
        -k(3066)*n(idx_C7H2j)*n(idx_C) &
        -k(3080)*n(idx_C7H3j)*n(idx_C) &
        -k(3081)*n(idx_C7H3j)*n(idx_C) &
        -k(3084)*n(idx_C8H2j)*n(idx_C) &
        -k(3085)*n(idx_C8H2j)*n(idx_C) &
        -k(3088)*n(idx_C9Hj)*n(idx_C) &
        -k(3093)*n(idx_C6H4Nj)*n(idx_C) &
        -k(3099)*n(idx_C8H3j)*n(idx_C) &
        -k(3100)*n(idx_C8H3j)*n(idx_C) &
        -k(3102)*n(idx_C9H2j)*n(idx_C) &
        -k(3109)*n(idx_C8H4Nj)*n(idx_C) &
        -k(3208)*n(idx_Ck)*n(idx_C) &
        -k(3219)*n(idx_Hk)*n(idx_C) &
        -k(3234)*n(idx_Ok)*n(idx_C) &
        -k(3242)*n(idx_Sk)*n(idx_C) &
        -k(3250)*n(idx_OHk)*n(idx_C) &
        -k(3255)*n(idx_C)*n(idx_CH) &
        -k(3256)*n(idx_C)*n(idx_HS) &
        -k(3257)*n(idx_C)*n(idx_NH) &
        -k(3258)*n(idx_C)*n(idx_NO) &
        -k(3259)*n(idx_C)*n(idx_NO) &
        -k(3260)*n(idx_C)*n(idx_NS) &
        -k(3261)*n(idx_C)*n(idx_O2) &
        -k(3262)*n(idx_C)*n(idx_OH) &
        -k(3263)*n(idx_C)*n(idx_PH) &
        -k(3264)*n(idx_C)*n(idx_S2) &
        -k(3265)*n(idx_C)*n(idx_SIH) &
        -k(3266)*n(idx_C)*n(idx_SO) &
        -k(3267)*n(idx_C)*n(idx_SO) &
        -k(3268)*n(idx_C)*n(idx_CH2) &
        -k(3269)*n(idx_C)*n(idx_HCO) &
        -k(3270)*n(idx_C)*n(idx_HCO) &
        -k(3271)*n(idx_C)*n(idx_C2N) &
        -k(3272)*n(idx_C)*n(idx_C2H) &
        -k(3273)*n(idx_C)*n(idx_CCO) &
        -k(3274)*n(idx_C)*n(idx_NH2) &
        -k(3275)*n(idx_C)*n(idx_NH2) &
        -k(3276)*n(idx_C)*n(idx_OCN) &
        -k(3277)*n(idx_C)*n(idx_SIH2) &
        -k(3278)*n(idx_C)*n(idx_SO2) &
        -k(3279)*n(idx_C)*n(idx_CH3) &
        -k(3280)*n(idx_C)*n(idx_C2H2) &
        -k(3281)*n(idx_C)*n(idx_C2H2) &
        -k(3282)*n(idx_C)*n(idx_C2H2) &
        -k(3283)*n(idx_C)*n(idx_H2CN) &
        -k(3284)*n(idx_C)*n(idx_SIH3) &
        -k(3285)*n(idx_C)*n(idx_C2H4) &
        -k(3286)*n(idx_C)*n(idx_HCNC2) &
        -k(3287)*n(idx_C)*n(idx_HNC3) &
        -k(3288)*n(idx_C)*n(idx_CH2CN) &
        -k(3289)*n(idx_C)*n(idx_C2H3) &
        -k(3290)*n(idx_C)*n(idx_C2H3) &
        -k(3291)*n(idx_C)*n(idx_C3H) &
        -k(3292)*n(idx_C)*n(idx_HC3) &
        -k(3293)*n(idx_C)*n(idx_C3H2) &
        -k(3294)*n(idx_C)*n(idx_H2C3) &
        -k(3295)*n(idx_C)*n(idx_C3N) &
        -k(3296)*n(idx_C)*n(idx_C3O) &
        -k(3297)*n(idx_C)*n(idx_C3H3) &
        -k(3298)*n(idx_C)*n(idx_C3H4) &
        -k(3299)*n(idx_C)*n(idx_C2H5) &
        -k(3300)*n(idx_C)*n(idx_C4H) &
        -k(3301)*n(idx_C)*n(idx_C4H2) &
        -k(3302)*n(idx_C)*n(idx_C4H3) &
        -k(3303)*n(idx_C)*n(idx_C5H) &
        -k(3304)*n(idx_C)*n(idx_C5N) &
        -k(3305)*n(idx_C)*n(idx_C5H2) &
        -k(3306)*n(idx_C)*n(idx_C6H) &
        -k(3307)*n(idx_C)*n(idx_C6H2) &
        -k(3308)*n(idx_C)*n(idx_C7H) &
        -k(3309)*n(idx_C)*n(idx_C7N) &
        -k(3310)*n(idx_C)*n(idx_C7H2) &
        -k(3311)*n(idx_C)*n(idx_C8H) &
        -k(3312)*n(idx_C)*n(idx_C8H2) &
        -k(3313)*n(idx_C)*n(idx_C9H) &
        -k(3314)*n(idx_C)*n(idx_C9N) &
        -k(3315)*n(idx_C)*n(idx_CH3C4H) &
        -k(3316)*n(idx_C)*n(idx_CH3C6H) &
        -k(3317)*n(idx_C)*n(idx_C4) &
        -k(3318)*n(idx_C)*n(idx_C5) &
        -k(3319)*n(idx_C)*n(idx_C6) &
        -k(3320)*n(idx_C)*n(idx_C6) &
        -k(3321)*n(idx_C)*n(idx_C7) &
        -k(3322)*n(idx_C)*n(idx_C8) &
        -k(3323)*n(idx_C)*n(idx_C8) &
        -k(3324)*n(idx_C)*n(idx_C8) &
        -k(3325)*n(idx_C)*n(idx_CH2) &
        -k(3326)*n(idx_C)*n(idx_NH2) &
        -k(3327)*n(idx_C)*n(idx_CN) &
        -k(3328)*n(idx_C)*n(idx_N2) &
        -k(3329)*n(idx_C)*n(idx_CO) &
        +k(3337)*n(idx_H)*n(idx_CH) &
        -k(3361)*n(idx_H2)*n(idx_C) &
        +k(3371)*n(idx_N)*n(idx_C2) &
        +k(3373)*n(idx_N)*n(idx_CN) &
        +k(3383)*n(idx_N)*n(idx_SIC) &
        +k(3431)*n(idx_O)*n(idx_C2) &
        +k(3432)*n(idx_O)*n(idx_CCL) &
        +k(3448)*n(idx_O)*n(idx_SIC) &
        +k(3519)*n(idx_S)*n(idx_C2) &
        +k(3541)*n(idx_F)*n(idx_CH) &
        -2.d0*k(3641)*n(idx_C)*n(idx_C) &
        -k(3642)*n(idx_C)*n(idx_H) &
        -k(3643)*n(idx_C)*n(idx_N) &
        -k(3644)*n(idx_C)*n(idx_O) &
        -k(3645)*n(idx_C)*n(idx_H2) &
        -k(3653)*n(idx_C)*n(idx_C2) &
        -k(3654)*n(idx_C)*n(idx_C3) &
        +2.d0*k(3657)*n(idx_C2j)*n(idx_E) &
        +k(3658)*n(idx_CCLj)*n(idx_E) &
        +k(3659)*n(idx_CFj)*n(idx_E) &
        +k(3660)*n(idx_CHj)*n(idx_E) &
        +k(3662)*n(idx_CNj)*n(idx_E) &
        +k(3663)*n(idx_COj)*n(idx_E) &
        +k(3664)*n(idx_CPj)*n(idx_E) &
        +k(3665)*n(idx_CSj)*n(idx_E) &
        +k(3681)*n(idx_SICj)*n(idx_E) &
        +k(3689)*n(idx_C2Hj)*n(idx_E) &
        +2.d0*k(3690)*n(idx_C2Hj)*n(idx_E) &
        +k(3691)*n(idx_C2Nj)*n(idx_E) &
        +k(3693)*n(idx_C2Oj)*n(idx_E) &
        +k(3695)*n(idx_C2Sj)*n(idx_E) &
        +k(3696)*n(idx_C3j)*n(idx_E) &
        +k(3698)*n(idx_CCPj)*n(idx_E) &
        +k(3699)*n(idx_CH2j)*n(idx_E) &
        +k(3701)*n(idx_CH2j)*n(idx_E) &
        +k(3704)*n(idx_CNCj)*n(idx_E) &
        +k(3719)*n(idx_HCOj)*n(idx_E) &
        +k(3751)*n(idx_OCSj)*n(idx_E) &
        +k(3757)*n(idx_SIC2j)*n(idx_E) &
        +k(3766)*n(idx_C2H2j)*n(idx_E) &
        +k(3768)*n(idx_C2HOj)*n(idx_E) &
        +k(3776)*n(idx_C3Hj)*n(idx_E) &
        +k(3781)*n(idx_C3Sj)*n(idx_E) &
        +k(3784)*n(idx_C4j)*n(idx_E) &
        +k(3788)*n(idx_CH3j)*n(idx_E) &
        +k(3843)*n(idx_SIC3j)*n(idx_E) &
        +k(3860)*n(idx_C2H3j)*n(idx_E) &
        +k(3868)*n(idx_C3H2j)*n(idx_E) &
        +k(3869)*n(idx_H2C3j)*n(idx_E) &
        +k(3876)*n(idx_C4Hj)*n(idx_E) &
        +k(3880)*n(idx_C4Nj)*n(idx_E) &
        +k(3882)*n(idx_C4Pj)*n(idx_E) &
        +k(3885)*n(idx_C4Sj)*n(idx_E) &
        +k(3887)*n(idx_C5j)*n(idx_E) &
        +k(3914)*n(idx_PC3Hj)*n(idx_E) &
        +k(3925)*n(idx_SIC4j)*n(idx_E) &
        +k(3940)*n(idx_C2H4j)*n(idx_E) &
        +k(3956)*n(idx_C5Hj)*n(idx_E) &
        +k(3960)*n(idx_C6j)*n(idx_E) &
        +k(4041)*n(idx_C6Hj)*n(idx_E) &
        +k(4045)*n(idx_C7j)*n(idx_E) &
        +k(4088)*n(idx_C7Hj)*n(idx_E) &
        +k(4092)*n(idx_C8j)*n(idx_E) &
        +k(4120)*n(idx_C8Hj)*n(idx_E) &
        +k(4123)*n(idx_C9j)*n(idx_E) &
        +k(4130)*n(idx_C10j)*n(idx_E) &
        +k(4148)*n(idx_C9Hj)*n(idx_E) &
        +k(4194)*n(idx_Cj)*n(idx_E) &
        +2.d0*k(4210)*n(idx_Cj)*n(idx_Ck) &
        +k(4211)*n(idx_Cj)*n(idx_Hk) &
        +k(4212)*n(idx_Cj)*n(idx_Sk) &
        +k(4213)*n(idx_FEj)*n(idx_Ck) &
        +k(4216)*n(idx_Hj)*n(idx_Ck) &
        +k(4219)*n(idx_HEj)*n(idx_Ck) &
        +k(4222)*n(idx_MGj)*n(idx_Ck) &
        +k(4225)*n(idx_Nj)*n(idx_Ck) &
        +k(4228)*n(idx_NAj)*n(idx_Ck) &
        +k(4231)*n(idx_Oj)*n(idx_Ck) &
        +k(4234)*n(idx_Sj)*n(idx_Ck) &
        +k(4237)*n(idx_SIj)*n(idx_Ck) &
        -k(4246)*n(idx_C)*n(idx_E) &
        -k(4250)*n(idx_C) &
        +2.d0*k(4257)*n(idx_C2) &
        +k(4259)*n(idx_CCL) &
        +k(4260)*n(idx_CH) &
        +k(4263)*n(idx_CN) &
        +k(4264)*n(idx_CO) &
        +k(4265)*n(idx_CS) &
        +k(4280)*n(idx_SIC) &
        +k(4288)*n(idx_C2N) &
        +k(4290)*n(idx_C3) &
        +k(4318)*n(idx_C4) &
        +k(4375)*n(idx_C4H4) &
        +k(4376)*n(idx_C4H6) &
        +k(4413)*n(idx_C2j) &
        +k(4424)*n(idx_Ck) &
        -k(4433)*n(idx_C) &
        +k(4479)*n(idx_C_DUST)

    !FE
    !FE
    dn(idx_FE) = &
        +k(3)*n(idx_FEj)*n(idx_GRAINk) &
        -k(16)*n(idx_FE) &
        -k(201)*n(idx_Cj)*n(idx_FE) &
        +k(423)*n(idx_FEj)*n(idx_NA) &
        -k(425)*n(idx_Hj)*n(idx_FE) &
        -k(954)*n(idx_Nj)*n(idx_FE) &
        -k(1003)*n(idx_Oj)*n(idx_FE) &
        -k(1056)*n(idx_Sj)*n(idx_FE) &
        -k(1095)*n(idx_SIj)*n(idx_FE) &
        -k(1153)*n(idx_CHj)*n(idx_FE) &
        -k(1275)*n(idx_CSj)*n(idx_FE) &
        -k(1337)*n(idx_HSj)*n(idx_FE) &
        -k(1357)*n(idx_N2j)*n(idx_FE) &
        -k(1435)*n(idx_NOj)*n(idx_FE) &
        -k(1442)*n(idx_O2j)*n(idx_FE) &
        -k(1541)*n(idx_SIOj)*n(idx_FE) &
        -k(1556)*n(idx_SOj)*n(idx_FE) &
        -k(1657)*n(idx_H2Oj)*n(idx_FE) &
        -k(1697)*n(idx_H2Sj)*n(idx_FE) &
        -k(1714)*n(idx_H3j)*n(idx_FE) &
        -k(1902)*n(idx_HCOj)*n(idx_FE) &
        -k(2190)*n(idx_C2H2j)*n(idx_FE) &
        -k(2313)*n(idx_CH3j)*n(idx_FE) &
        -k(2400)*n(idx_H2COj)*n(idx_FE) &
        -k(2509)*n(idx_NH3j)*n(idx_FE) &
        -k(2685)*n(idx_C4Hj)*n(idx_FE) &
        +k(4196)*n(idx_FEj)*n(idx_E) &
        +k(4213)*n(idx_FEj)*n(idx_Ck) &
        +k(4214)*n(idx_FEj)*n(idx_Hk) &
        +k(4215)*n(idx_FEj)*n(idx_Sk) &
        -k(4252)*n(idx_FE)

    !H
    !H
    dn(idx_H) = &
        +k(4)*n(idx_Hj)*n(idx_GRAINk) &
        +k(12)*n(idx_H3j)*n(idx_GRAINk) &
        +k(13)*n(idx_HCOj)*n(idx_GRAINk) &
        -k(17)*n(idx_H) &
        +k(28)*n(idx_CH) &
        +2.d0*k(35)*n(idx_H2) &
        +k(36)*n(idx_H2) &
        +k(39)*n(idx_HCL) &
        +k(40)*n(idx_HF) &
        +k(41)*n(idx_HS) &
        +k(42)*n(idx_MGH) &
        +k(44)*n(idx_NAH) &
        +k(45)*n(idx_NH) &
        +k(51)*n(idx_OH) &
        +k(52)*n(idx_PH) &
        +k(57)*n(idx_SIH) &
        +k(62)*n(idx_C2H) &
        +k(72)*n(idx_H2O) &
        +k(75)*n(idx_HCN) &
        +k(76)*n(idx_HCO) &
        +k(78)*n(idx_HCP) &
        +k(81)*n(idx_HNC) &
        +k(83)*n(idx_HNSI) &
        +k(84)*n(idx_HPO) &
        +k(88)*n(idx_NH2) &
        +k(92)*n(idx_O2H) &
        +k(96)*n(idx_PH2) &
        +k(98)*n(idx_SIH2) &
        +k(102)*n(idx_C2H2) &
        +k(104)*n(idx_C3H) &
        +k(105)*n(idx_HC3) &
        +k(111)*n(idx_CH3) &
        +k(118)*n(idx_HCCP) &
        +k(120)*n(idx_NH3) &
        +k(122)*n(idx_SIC2H) &
        +k(125)*n(idx_SIH3) &
        +k(129)*n(idx_C2H3) &
        +k(130)*n(idx_C3H2) &
        +k(131)*n(idx_H2C3) &
        +k(132)*n(idx_C4H) &
        +k(144)*n(idx_SIC3H) &
        +k(146)*n(idx_SICH3) &
        +k(152)*n(idx_C3H3) &
        +k(153)*n(idx_C3H3) &
        +k(155)*n(idx_C4H2) &
        +k(157)*n(idx_C5H) &
        +k(162)*n(idx_CH3OH) &
        +k(167)*n(idx_C2H5) &
        +k(169)*n(idx_C3H4) &
        +k(171)*n(idx_C5H2) &
        +k(172)*n(idx_C6H) &
        +2.d0*k(174)*n(idx_CH5N) &
        +k(177)*n(idx_C6H2) &
        +k(178)*n(idx_C7H) &
        +k(184)*n(idx_C7H2) &
        +k(185)*n(idx_C8H) &
        +k(192)*n(idx_C8H2) &
        +k(193)*n(idx_C9H) &
        +k(196)*n(idx_C9H2) &
        +k(208)*n(idx_Cj)*n(idx_CH) &
        +k(212)*n(idx_Cj)*n(idx_HCL) &
        +k(213)*n(idx_Cj)*n(idx_HF) &
        +k(214)*n(idx_Cj)*n(idx_HS) &
        +k(217)*n(idx_Cj)*n(idx_NH) &
        +k(223)*n(idx_Cj)*n(idx_OH) &
        +k(228)*n(idx_Cj)*n(idx_SIH) &
        +k(238)*n(idx_Cj)*n(idx_C2H) &
        +k(244)*n(idx_Cj)*n(idx_CH2) &
        +k(247)*n(idx_Cj)*n(idx_H2O) &
        +k(248)*n(idx_Cj)*n(idx_H2O) &
        +k(250)*n(idx_Cj)*n(idx_H2S) &
        +k(251)*n(idx_Cj)*n(idx_HCN) &
        +k(252)*n(idx_Cj)*n(idx_HCN) &
        +k(255)*n(idx_Cj)*n(idx_HCP) &
        +k(257)*n(idx_Cj)*n(idx_HCSI) &
        +k(258)*n(idx_Cj)*n(idx_HNC) &
        +k(259)*n(idx_Cj)*n(idx_HNSI) &
        +k(262)*n(idx_Cj)*n(idx_NH2) &
        +k(268)*n(idx_Cj)*n(idx_SIH2) &
        +k(271)*n(idx_Cj)*n(idx_C2H2) &
        +k(272)*n(idx_Cj)*n(idx_C3H) &
        +k(273)*n(idx_Cj)*n(idx_HC3) &
        +k(281)*n(idx_Cj)*n(idx_CH3) &
        +k(291)*n(idx_Cj)*n(idx_NH3) &
        +k(294)*n(idx_Cj)*n(idx_SIC2H) &
        +k(298)*n(idx_Cj)*n(idx_SICH2) &
        +k(300)*n(idx_Cj)*n(idx_SIH3) &
        +k(306)*n(idx_Cj)*n(idx_C2H3) &
        +k(307)*n(idx_Cj)*n(idx_C2H3) &
        +k(310)*n(idx_Cj)*n(idx_C3H2) &
        +k(311)*n(idx_Cj)*n(idx_H2C3) &
        +k(312)*n(idx_Cj)*n(idx_C4H) &
        +k(317)*n(idx_Cj)*n(idx_CH3N) &
        +k(319)*n(idx_Cj)*n(idx_CH4) &
        +k(323)*n(idx_Cj)*n(idx_HCNC2) &
        +k(328)*n(idx_Cj)*n(idx_HC2NC) &
        +k(332)*n(idx_Cj)*n(idx_HC3N) &
        +k(336)*n(idx_Cj)*n(idx_HNC3) &
        +k(337)*n(idx_Cj)*n(idx_SIC2H2) &
        +k(338)*n(idx_Cj)*n(idx_SIC3H) &
        +k(340)*n(idx_Cj)*n(idx_SICH3) &
        +k(343)*n(idx_Cj)*n(idx_SIH4) &
        +k(345)*n(idx_Cj)*n(idx_CH3CN) &
        +k(346)*n(idx_Cj)*n(idx_C2H4) &
        +k(351)*n(idx_Cj)*n(idx_C2H4) &
        +k(355)*n(idx_Cj)*n(idx_C3H3) &
        +k(359)*n(idx_Cj)*n(idx_C4H2) &
        +k(360)*n(idx_Cj)*n(idx_C5H) &
        +k(382)*n(idx_Cj)*n(idx_C4H3) &
        +k(388)*n(idx_Cj)*n(idx_C5H2) &
        +k(389)*n(idx_Cj)*n(idx_C6H) &
        +k(395)*n(idx_Cj)*n(idx_C6H2) &
        +k(396)*n(idx_Cj)*n(idx_C7H) &
        +k(404)*n(idx_Cj)*n(idx_C7H2) &
        +k(405)*n(idx_Cj)*n(idx_C8H) &
        +k(408)*n(idx_Cj)*n(idx_CH3C4H) &
        +k(413)*n(idx_Cj)*n(idx_C8H2) &
        +k(414)*n(idx_Cj)*n(idx_C9H) &
        +k(421)*n(idx_CLj)*n(idx_H2) &
        +k(424)*n(idx_Fj)*n(idx_H2) &
        +k(425)*n(idx_Hj)*n(idx_FE) &
        +k(426)*n(idx_Hj)*n(idx_MG) &
        +k(427)*n(idx_Hj)*n(idx_NA) &
        +k(428)*n(idx_Hj)*n(idx_O) &
        +k(429)*n(idx_Hj)*n(idx_P) &
        +k(430)*n(idx_Hj)*n(idx_S) &
        +k(431)*n(idx_Hj)*n(idx_SI) &
        +k(432)*n(idx_Hj)*n(idx_C2) &
        +k(433)*n(idx_Hj)*n(idx_CH) &
        +k(434)*n(idx_Hj)*n(idx_CP) &
        +k(435)*n(idx_Hj)*n(idx_CS) &
        +k(436)*n(idx_Hj)*n(idx_HCL) &
        +k(438)*n(idx_Hj)*n(idx_HS) &
        +k(441)*n(idx_Hj)*n(idx_NH) &
        +k(442)*n(idx_Hj)*n(idx_NO) &
        +k(443)*n(idx_Hj)*n(idx_NS) &
        +k(444)*n(idx_Hj)*n(idx_O2) &
        +k(445)*n(idx_Hj)*n(idx_OH) &
        +k(446)*n(idx_Hj)*n(idx_PH) &
        +k(447)*n(idx_Hj)*n(idx_PN) &
        +k(448)*n(idx_Hj)*n(idx_PO) &
        +k(449)*n(idx_Hj)*n(idx_S2) &
        +k(450)*n(idx_Hj)*n(idx_SIC) &
        +k(452)*n(idx_Hj)*n(idx_SIH) &
        +k(453)*n(idx_Hj)*n(idx_SIN) &
        +k(454)*n(idx_Hj)*n(idx_SIO) &
        +k(455)*n(idx_Hj)*n(idx_SIS) &
        +k(456)*n(idx_Hj)*n(idx_SO) &
        +k(458)*n(idx_Hj)*n(idx_C2H) &
        +k(459)*n(idx_Hj)*n(idx_C2N) &
        +k(460)*n(idx_Hj)*n(idx_C2S) &
        +k(461)*n(idx_Hj)*n(idx_C3) &
        +k(462)*n(idx_Hj)*n(idx_CCO) &
        +k(463)*n(idx_Hj)*n(idx_CCP) &
        +k(465)*n(idx_Hj)*n(idx_CH2) &
        +k(467)*n(idx_Hj)*n(idx_H2O) &
        +k(468)*n(idx_Hj)*n(idx_H2S) &
        +k(469)*n(idx_Hj)*n(idx_HCN) &
        +k(472)*n(idx_Hj)*n(idx_HCO) &
        +k(473)*n(idx_Hj)*n(idx_HCP) &
        +k(476)*n(idx_Hj)*n(idx_HCSI) &
        +k(480)*n(idx_Hj)*n(idx_HNSI) &
        +k(481)*n(idx_Hj)*n(idx_HPO) &
        +k(482)*n(idx_Hj)*n(idx_HS2) &
        +k(484)*n(idx_Hj)*n(idx_NH2) &
        +k(486)*n(idx_Hj)*n(idx_PH2) &
        +k(487)*n(idx_Hj)*n(idx_SIC2) &
        +k(489)*n(idx_Hj)*n(idx_SIH2) &
        +k(490)*n(idx_Hj)*n(idx_SINC) &
        +k(492)*n(idx_Hj)*n(idx_C2H2) &
        +k(495)*n(idx_Hj)*n(idx_C3H) &
        +k(496)*n(idx_Hj)*n(idx_HC3) &
        +k(497)*n(idx_Hj)*n(idx_C3O) &
        +k(498)*n(idx_Hj)*n(idx_C3S) &
        +k(499)*n(idx_Hj)*n(idx_C4) &
        +k(500)*n(idx_Hj)*n(idx_CH3) &
        +k(502)*n(idx_Hj)*n(idx_H2CO) &
        +k(503)*n(idx_Hj)*n(idx_H2CS) &
        +k(504)*n(idx_Hj)*n(idx_H2S2) &
        +k(506)*n(idx_Hj)*n(idx_H2SIO) &
        +k(507)*n(idx_Hj)*n(idx_HCCP) &
        +k(508)*n(idx_Hj)*n(idx_NH3) &
        +k(510)*n(idx_Hj)*n(idx_SIC2H) &
        +k(511)*n(idx_Hj)*n(idx_SIC3) &
        +k(513)*n(idx_Hj)*n(idx_SICH2) &
        +k(515)*n(idx_Hj)*n(idx_SIH3) &
        +k(516)*n(idx_Hj)*n(idx_CH2CN) &
        +k(517)*n(idx_Hj)*n(idx_C2H2O) &
        +k(519)*n(idx_Hj)*n(idx_C2H3) &
        +k(522)*n(idx_Hj)*n(idx_C3H2) &
        +k(523)*n(idx_Hj)*n(idx_H2C3) &
        +k(525)*n(idx_Hj)*n(idx_C4H) &
        +k(526)*n(idx_Hj)*n(idx_C4P) &
        +k(527)*n(idx_Hj)*n(idx_C4S) &
        +k(528)*n(idx_Hj)*n(idx_C5) &
        +k(530)*n(idx_Hj)*n(idx_CH2O2) &
        +k(531)*n(idx_Hj)*n(idx_CH2PH) &
        +k(534)*n(idx_Hj)*n(idx_CH4) &
        +k(542)*n(idx_Hj)*n(idx_HC3N) &
        +k(544)*n(idx_Hj)*n(idx_HNC3) &
        +k(552)*n(idx_Hj)*n(idx_SIC2H2) &
        +k(554)*n(idx_Hj)*n(idx_SIC3H) &
        +k(555)*n(idx_Hj)*n(idx_SIC4) &
        +k(557)*n(idx_Hj)*n(idx_SICH3) &
        +k(559)*n(idx_Hj)*n(idx_SIH4) &
        +k(561)*n(idx_Hj)*n(idx_CH3CN) &
        +k(563)*n(idx_Hj)*n(idx_C2H4) &
        +k(566)*n(idx_Hj)*n(idx_C3H3) &
        +k(567)*n(idx_Hj)*n(idx_C3H3) &
        +k(569)*n(idx_Hj)*n(idx_C4H2) &
        +k(571)*n(idx_Hj)*n(idx_C5H) &
        +k(572)*n(idx_Hj)*n(idx_C6) &
        +k(574)*n(idx_Hj)*n(idx_CH3OH) &
        +k(580)*n(idx_Hj)*n(idx_C2H4O) &
        +k(582)*n(idx_Hj)*n(idx_C2H5) &
        +k(584)*n(idx_Hj)*n(idx_C3H3N) &
        +k(587)*n(idx_Hj)*n(idx_C3H4) &
        +k(588)*n(idx_Hj)*n(idx_C4H3) &
        +k(591)*n(idx_Hj)*n(idx_C5H2) &
        +k(593)*n(idx_Hj)*n(idx_C6H) &
        +k(594)*n(idx_Hj)*n(idx_C7) &
        +k(596)*n(idx_Hj)*n(idx_CH5N) &
        +k(597)*n(idx_Hj)*n(idx_HC5N) &
        +k(599)*n(idx_Hj)*n(idx_C6H2) &
        +k(601)*n(idx_Hj)*n(idx_C7H) &
        +k(602)*n(idx_Hj)*n(idx_C8) &
        +k(604)*n(idx_Hj)*n(idx_HCOOCH3) &
        +k(606)*n(idx_Hj)*n(idx_C2H5OH) &
        +k(608)*n(idx_Hj)*n(idx_C7H2) &
        +k(610)*n(idx_Hj)*n(idx_C8H) &
        +k(611)*n(idx_Hj)*n(idx_C9) &
        +k(613)*n(idx_Hj)*n(idx_CH3C4H) &
        +k(615)*n(idx_Hj)*n(idx_CH3OCH3) &
        +k(616)*n(idx_Hj)*n(idx_HC7N) &
        +k(617)*n(idx_Hj)*n(idx_C2H6CO) &
        +k(619)*n(idx_Hj)*n(idx_C8H2) &
        +k(621)*n(idx_Hj)*n(idx_C9H) &
        +k(624)*n(idx_Hj)*n(idx_C9H2) &
        +k(626)*n(idx_Hj)*n(idx_CH3C6H) &
        +k(628)*n(idx_Hj)*n(idx_HC9N) &
        -k(629)*n(idx_HEj)*n(idx_H) &
        +k(635)*n(idx_HEj)*n(idx_CH) &
        +k(645)*n(idx_HEj)*n(idx_H2) &
        +k(647)*n(idx_HEj)*n(idx_HCL) &
        +k(648)*n(idx_HEj)*n(idx_HF) &
        +k(649)*n(idx_HEj)*n(idx_HS) &
        +k(650)*n(idx_HEj)*n(idx_MGH) &
        +k(653)*n(idx_HEj)*n(idx_NAH) &
        +k(654)*n(idx_HEj)*n(idx_NH) &
        +k(661)*n(idx_HEj)*n(idx_OH) &
        +k(662)*n(idx_HEj)*n(idx_PH) &
        +k(668)*n(idx_HEj)*n(idx_SIH) &
        +k(677)*n(idx_HEj)*n(idx_C2H) &
        +k(690)*n(idx_HEj)*n(idx_CH2) &
        +k(697)*n(idx_HEj)*n(idx_H2O) &
        +k(700)*n(idx_HEj)*n(idx_H2S) &
        +k(702)*n(idx_HEj)*n(idx_HCN) &
        +k(705)*n(idx_HEj)*n(idx_HCN) &
        +k(707)*n(idx_HEj)*n(idx_HCO) &
        +k(712)*n(idx_HEj)*n(idx_HCS) &
        +k(714)*n(idx_HEj)*n(idx_HCSI) &
        +k(715)*n(idx_HEj)*n(idx_HNC) &
        +k(716)*n(idx_HEj)*n(idx_HNC) &
        +k(719)*n(idx_HEj)*n(idx_HNO) &
        +k(720)*n(idx_HEj)*n(idx_HNSI) &
        +k(722)*n(idx_HEj)*n(idx_HPO) &
        +k(724)*n(idx_HEj)*n(idx_HS2) &
        +k(731)*n(idx_HEj)*n(idx_NH2) &
        +k(741)*n(idx_HEj)*n(idx_SIH2) &
        +k(750)*n(idx_HEj)*n(idx_C2H2) &
        +k(752)*n(idx_HEj)*n(idx_C3H) &
        +k(753)*n(idx_HEj)*n(idx_HC3) &
        +k(766)*n(idx_HEj)*n(idx_CH3) &
        +k(768)*n(idx_HEj)*n(idx_H2CO) &
        +k(773)*n(idx_HEj)*n(idx_H2S2) &
        +k(774)*n(idx_HEj)*n(idx_H2SIO) &
        +k(778)*n(idx_HEj)*n(idx_NH3) &
        +k(781)*n(idx_HEj)*n(idx_SIC2H) &
        +k(784)*n(idx_HEj)*n(idx_SICH2) &
        +k(786)*n(idx_HEj)*n(idx_SIH3) &
        +k(791)*n(idx_HEj)*n(idx_C2H3) &
        +k(794)*n(idx_HEj)*n(idx_C3H2) &
        +k(795)*n(idx_HEj)*n(idx_H2C3) &
        +k(797)*n(idx_HEj)*n(idx_C4H) &
        +2.d0*k(804)*n(idx_HEj)*n(idx_CH2O2) &
        +k(805)*n(idx_HEj)*n(idx_CH2O2) &
        +k(811)*n(idx_HEj)*n(idx_CH3N) &
        +k(813)*n(idx_HEj)*n(idx_CH4) &
        +k(815)*n(idx_HEj)*n(idx_CH4) &
        +k(819)*n(idx_HEj)*n(idx_HCNC2) &
        +k(823)*n(idx_HEj)*n(idx_HC2NC) &
        +k(831)*n(idx_HEj)*n(idx_HC3N) &
        +k(834)*n(idx_HEj)*n(idx_HNC3) &
        +k(840)*n(idx_HEj)*n(idx_SIC2H2) &
        +k(843)*n(idx_HEj)*n(idx_SIC3H) &
        +k(846)*n(idx_HEj)*n(idx_SICH3) &
        +k(848)*n(idx_HEj)*n(idx_SIH4) &
        +k(851)*n(idx_HEj)*n(idx_C2H4) &
        +k(854)*n(idx_HEj)*n(idx_C2H4) &
        +k(856)*n(idx_HEj)*n(idx_C3H3) &
        +k(858)*n(idx_HEj)*n(idx_C3H3) &
        +k(859)*n(idx_HEj)*n(idx_C3H3) &
        +k(862)*n(idx_HEj)*n(idx_C4H2) &
        +k(864)*n(idx_HEj)*n(idx_C5H) &
        +k(878)*n(idx_HEj)*n(idx_C2H4O) &
        +k(880)*n(idx_HEj)*n(idx_C2H5) &
        +k(884)*n(idx_HEj)*n(idx_C3H4) &
        +k(887)*n(idx_HEj)*n(idx_C3H4) &
        +k(888)*n(idx_HEj)*n(idx_C3H4) &
        +k(889)*n(idx_HEj)*n(idx_C4H3) &
        +k(896)*n(idx_HEj)*n(idx_C5H2) &
        +k(898)*n(idx_HEj)*n(idx_C6H) &
        +k(903)*n(idx_HEj)*n(idx_CH5N) &
        +k(904)*n(idx_HEj)*n(idx_CH5N) &
        +k(910)*n(idx_HEj)*n(idx_C6H2) &
        +k(912)*n(idx_HEj)*n(idx_C7H) &
        +k(919)*n(idx_HEj)*n(idx_C2H5OH) &
        +k(922)*n(idx_HEj)*n(idx_C2H5OH) &
        +k(925)*n(idx_HEj)*n(idx_C7H2) &
        +k(927)*n(idx_HEj)*n(idx_C8H) &
        +k(931)*n(idx_HEj)*n(idx_CH3C4H) &
        +k(932)*n(idx_HEj)*n(idx_CH3OCH3) &
        +k(938)*n(idx_HEj)*n(idx_C8H2) &
        +k(940)*n(idx_HEj)*n(idx_C9H) &
        +k(945)*n(idx_HEj)*n(idx_C9H2) &
        +k(947)*n(idx_HEj)*n(idx_CH3C6H) &
        +k(950)*n(idx_HEj)*n(idx_C6H6) &
        +k(958)*n(idx_Nj)*n(idx_CH) &
        +k(962)*n(idx_Nj)*n(idx_H2) &
        +k(963)*n(idx_Nj)*n(idx_NH) &
        +k(970)*n(idx_Nj)*n(idx_OH) &
        +k(992)*n(idx_Nj)*n(idx_CH4) &
        +k(993)*n(idx_Nj)*n(idx_CH4) &
        +2.d0*k(995)*n(idx_Nj)*n(idx_CH4) &
        +k(998)*n(idx_Nj)*n(idx_CH3OH) &
        +k(999)*n(idx_Nj)*n(idx_CH3OH) &
        +k(1000)*n(idx_Nj)*n(idx_CH3OH) &
        -k(1004)*n(idx_Oj)*n(idx_H) &
        +k(1008)*n(idx_Oj)*n(idx_CH) &
        +k(1010)*n(idx_Oj)*n(idx_H2) &
        +k(1013)*n(idx_Oj)*n(idx_NH) &
        +k(1016)*n(idx_Oj)*n(idx_OH) &
        +k(1047)*n(idx_Pj)*n(idx_OH) &
        +k(1049)*n(idx_Pj)*n(idx_H2O) &
        +k(1050)*n(idx_Pj)*n(idx_C2H2) &
        +k(1053)*n(idx_Pj)*n(idx_NH3) &
        +k(1061)*n(idx_Sj)*n(idx_CH) &
        +k(1062)*n(idx_Sj)*n(idx_NH) &
        +k(1065)*n(idx_Sj)*n(idx_OH) &
        +k(1068)*n(idx_Sj)*n(idx_SIH) &
        +k(1070)*n(idx_Sj)*n(idx_C2H) &
        +k(1071)*n(idx_Sj)*n(idx_CH2) &
        +k(1073)*n(idx_Sj)*n(idx_H2S) &
        +k(1078)*n(idx_Sj)*n(idx_C2H2) &
        +k(1079)*n(idx_Sj)*n(idx_C3H) &
        +k(1080)*n(idx_Sj)*n(idx_HC3) &
        +k(1081)*n(idx_Sj)*n(idx_CH3) &
        +k(1086)*n(idx_Sj)*n(idx_C3H2) &
        +k(1087)*n(idx_Sj)*n(idx_H2C3) &
        +k(1088)*n(idx_Sj)*n(idx_C4H) &
        +k(1089)*n(idx_Sj)*n(idx_CH4) &
        +k(1094)*n(idx_Sj)*n(idx_C4H2) &
        +k(1098)*n(idx_SIj)*n(idx_CH) &
        +k(1099)*n(idx_SIj)*n(idx_NH) &
        +k(1100)*n(idx_SIj)*n(idx_OH) &
        +k(1101)*n(idx_SIj)*n(idx_HF) &
        +k(1102)*n(idx_SIj)*n(idx_CH2) &
        +k(1103)*n(idx_SIj)*n(idx_H2O) &
        +k(1104)*n(idx_SIj)*n(idx_HCN) &
        +k(1105)*n(idx_SIj)*n(idx_HNC) &
        +k(1107)*n(idx_SIj)*n(idx_C2H2) &
        +k(1108)*n(idx_SIj)*n(idx_C3H) &
        +k(1109)*n(idx_SIj)*n(idx_HC3) &
        +k(1111)*n(idx_SIj)*n(idx_CH3) &
        +k(1112)*n(idx_SIj)*n(idx_NH3) &
        +k(1113)*n(idx_SIj)*n(idx_C2H3) &
        +k(1114)*n(idx_SIj)*n(idx_C3H2) &
        +k(1115)*n(idx_SIj)*n(idx_H2C3) &
        +k(1116)*n(idx_SIj)*n(idx_C4H) &
        +k(1117)*n(idx_SIj)*n(idx_C2H4) &
        +k(1118)*n(idx_SIj)*n(idx_C3H3) &
        +k(1128)*n(idx_C2j)*n(idx_CH) &
        +k(1129)*n(idx_C2j)*n(idx_H2) &
        +k(1131)*n(idx_C2j)*n(idx_NH) &
        +k(1135)*n(idx_C2j)*n(idx_CH2) &
        +k(1137)*n(idx_C2j)*n(idx_H2O) &
        +k(1139)*n(idx_C2j)*n(idx_HCN) &
        +k(1143)*n(idx_C2j)*n(idx_NH2) &
        +k(1144)*n(idx_C2j)*n(idx_C2H2) &
        +k(1147)*n(idx_C2j)*n(idx_CH4) &
        +k(1150)*n(idx_C2j)*n(idx_CH4) &
        +k(1151)*n(idx_C2j)*n(idx_CH4) &
        +k(1152)*n(idx_CHj)*n(idx_C) &
        -k(1154)*n(idx_CHj)*n(idx_H) &
        +k(1156)*n(idx_CHj)*n(idx_N) &
        +k(1158)*n(idx_CHj)*n(idx_O) &
        +k(1160)*n(idx_CHj)*n(idx_S) &
        +k(1163)*n(idx_CHj)*n(idx_C2) &
        +k(1165)*n(idx_CHj)*n(idx_CN) &
        +k(1166)*n(idx_CHj)*n(idx_CN) &
        +k(1167)*n(idx_CHj)*n(idx_H2) &
        +k(1178)*n(idx_CHj)*n(idx_H2O) &
        +k(1183)*n(idx_CHj)*n(idx_HCN) &
        +k(1191)*n(idx_CHj)*n(idx_C2H2) &
        +k(1192)*n(idx_CHj)*n(idx_C2H2) &
        +k(1199)*n(idx_CHj)*n(idx_CH4) &
        +k(1201)*n(idx_CHj)*n(idx_CH4) &
        -k(1206)*n(idx_CNj)*n(idx_H) &
        +k(1212)*n(idx_CNj)*n(idx_H2) &
        +k(1228)*n(idx_CNj)*n(idx_H2O) &
        +k(1230)*n(idx_CNj)*n(idx_HCN) &
        -k(1237)*n(idx_COj)*n(idx_H) &
        +k(1244)*n(idx_COj)*n(idx_H2) &
        +k(1271)*n(idx_COj)*n(idx_CH4) &
        +k(1273)*n(idx_CPj)*n(idx_H2) &
        +k(1280)*n(idx_CSj)*n(idx_H2) &
        +k(1283)*n(idx_H2j)*n(idx_C) &
        -k(1284)*n(idx_H2j)*n(idx_H) &
        +k(1285)*n(idx_H2j)*n(idx_N) &
        +k(1286)*n(idx_H2j)*n(idx_O) &
        +k(1288)*n(idx_H2j)*n(idx_C2) &
        +k(1290)*n(idx_H2j)*n(idx_CH) &
        +k(1292)*n(idx_H2j)*n(idx_CN) &
        +k(1294)*n(idx_H2j)*n(idx_CO) &
        +k(1295)*n(idx_H2j)*n(idx_H2) &
        +k(1296)*n(idx_H2j)*n(idx_N2) &
        +k(1298)*n(idx_H2j)*n(idx_NH) &
        +k(1300)*n(idx_H2j)*n(idx_NO) &
        +k(1302)*n(idx_H2j)*n(idx_O2) &
        +k(1304)*n(idx_H2j)*n(idx_OH) &
        +k(1306)*n(idx_H2j)*n(idx_C2H) &
        +k(1308)*n(idx_H2j)*n(idx_CH2) &
        +k(1311)*n(idx_H2j)*n(idx_CO2) &
        +k(1313)*n(idx_H2j)*n(idx_H2O) &
        +k(1315)*n(idx_H2j)*n(idx_H2S) &
        +k(1322)*n(idx_H2j)*n(idx_C2H2) &
        +k(1323)*n(idx_H2j)*n(idx_H2CO) &
        +k(1326)*n(idx_H2j)*n(idx_CH4) &
        +k(1328)*n(idx_H2j)*n(idx_CH4) &
        +k(1330)*n(idx_H2j)*n(idx_C2H4) &
        +k(1332)*n(idx_HCLj)*n(idx_H2) &
        +k(1333)*n(idx_HFj)*n(idx_H2) &
        -k(1334)*n(idx_HEHj)*n(idx_H) &
        +k(1336)*n(idx_HSj)*n(idx_C) &
        -k(1338)*n(idx_HSj)*n(idx_H) &
        +k(1340)*n(idx_HSj)*n(idx_N) &
        +k(1343)*n(idx_HSj)*n(idx_O) &
        -k(1358)*n(idx_N2j)*n(idx_H) &
        +k(1369)*n(idx_N2j)*n(idx_H2) &
        +k(1380)*n(idx_N2j)*n(idx_H2S) &
        +k(1388)*n(idx_N2j)*n(idx_H2CO) &
        +k(1392)*n(idx_N2j)*n(idx_CH4) &
        +k(1394)*n(idx_NHj)*n(idx_N) &
        +k(1398)*n(idx_NHj)*n(idx_S) &
        +k(1400)*n(idx_NHj)*n(idx_C2) &
        +k(1405)*n(idx_NHj)*n(idx_CO) &
        +k(1407)*n(idx_NHj)*n(idx_H2) &
        +k(1453)*n(idx_O2j)*n(idx_NH) &
        +k(1462)*n(idx_O2j)*n(idx_H2CO) &
        +k(1465)*n(idx_O2j)*n(idx_CH4) &
        +k(1466)*n(idx_O2j)*n(idx_CH3OH) &
        +k(1469)*n(idx_OHj)*n(idx_N) &
        +k(1470)*n(idx_OHj)*n(idx_O) &
        +k(1473)*n(idx_OHj)*n(idx_S) &
        +k(1481)*n(idx_OHj)*n(idx_H2) &
        +k(1513)*n(idx_PHj)*n(idx_O) &
        +k(1516)*n(idx_PHj)*n(idx_H2O) &
        +k(1519)*n(idx_PHj)*n(idx_C2H2) &
        +k(1522)*n(idx_PHj)*n(idx_NH3) &
        +k(1524)*n(idx_PHj)*n(idx_CH4) &
        +k(1533)*n(idx_SICj)*n(idx_H2) &
        +k(1534)*n(idx_SIHj)*n(idx_C) &
        -k(1535)*n(idx_SIHj)*n(idx_H) &
        +k(1536)*n(idx_SIHj)*n(idx_N) &
        +k(1537)*n(idx_SIHj)*n(idx_O) &
        +k(1550)*n(idx_SIOj)*n(idx_H2) &
        -k(1554)*n(idx_SISj)*n(idx_H) &
        +k(1555)*n(idx_SISj)*n(idx_H2) &
        +k(1562)*n(idx_C2Hj)*n(idx_C) &
        +k(1564)*n(idx_C2Hj)*n(idx_N) &
        +k(1568)*n(idx_C2Hj)*n(idx_CH) &
        +k(1569)*n(idx_C2Hj)*n(idx_CN) &
        +k(1570)*n(idx_C2Hj)*n(idx_H2) &
        +k(1573)*n(idx_C2Hj)*n(idx_CH2) &
        +k(1574)*n(idx_C2Hj)*n(idx_CH2) &
        +k(1576)*n(idx_C2Hj)*n(idx_H2O) &
        +k(1579)*n(idx_C2Hj)*n(idx_HCN) &
        +k(1583)*n(idx_C2Hj)*n(idx_NH2) &
        +k(1584)*n(idx_C2Hj)*n(idx_C2H2) &
        +k(1591)*n(idx_C2Hj)*n(idx_CH4) &
        +k(1602)*n(idx_C3j)*n(idx_H2) &
        +k(1603)*n(idx_C3j)*n(idx_C2H2) &
        +k(1604)*n(idx_CH2j)*n(idx_C) &
        +k(1605)*n(idx_CH2j)*n(idx_N) &
        +k(1606)*n(idx_CH2j)*n(idx_O) &
        +k(1607)*n(idx_CH2j)*n(idx_S) &
        +k(1608)*n(idx_CH2j)*n(idx_C2) &
        +k(1609)*n(idx_CH2j)*n(idx_CH) &
        +k(1610)*n(idx_CH2j)*n(idx_H2) &
        +k(1611)*n(idx_CH2j)*n(idx_NH) &
        +k(1614)*n(idx_CH2j)*n(idx_O2) &
        +k(1615)*n(idx_CH2j)*n(idx_OH) &
        +k(1616)*n(idx_CH2j)*n(idx_C2H) &
        +k(1617)*n(idx_CH2j)*n(idx_C2H) &
        +k(1618)*n(idx_CH2j)*n(idx_CH2) &
        +k(1620)*n(idx_CH2j)*n(idx_H2O) &
        +k(1621)*n(idx_CH2j)*n(idx_H2S) &
        +k(1622)*n(idx_CH2j)*n(idx_H2S) &
        +k(1623)*n(idx_CH2j)*n(idx_HCN) &
        +k(1625)*n(idx_CH2j)*n(idx_HCO) &
        +k(1631)*n(idx_CH2j)*n(idx_H2CO) &
        +k(1633)*n(idx_CH2j)*n(idx_NH3) &
        +k(1635)*n(idx_CH2j)*n(idx_CH4) &
        +k(1636)*n(idx_CHSIj)*n(idx_H2) &
        -k(1641)*n(idx_CO2j)*n(idx_H) &
        -k(1642)*n(idx_CO2j)*n(idx_H) &
        +k(1645)*n(idx_CO2j)*n(idx_H2) &
        +k(1659)*n(idx_H2Oj)*n(idx_N) &
        +k(1664)*n(idx_H2Oj)*n(idx_S) &
        +k(1671)*n(idx_H2Oj)*n(idx_H2) &
        +k(1696)*n(idx_H2Sj)*n(idx_C) &
        -k(1698)*n(idx_H2Sj)*n(idx_H) &
        +k(1714)*n(idx_H3j)*n(idx_FE) &
        +k(1715)*n(idx_H3j)*n(idx_MG) &
        +k(1716)*n(idx_H3j)*n(idx_N) &
        +k(1717)*n(idx_H3j)*n(idx_F) &
        +k(1718)*n(idx_H3j)*n(idx_NA) &
        -k(1874)*n(idx_HCNj)*n(idx_H) &
        +k(1881)*n(idx_HCNj)*n(idx_H2) &
        +k(1918)*n(idx_HCOj)*n(idx_OH) &
        +k(2034)*n(idx_HCPj)*n(idx_C) &
        +k(2036)*n(idx_HCPj)*n(idx_H2) &
        +k(2038)*n(idx_HCSj)*n(idx_O) &
        +k(2045)*n(idx_HNCj)*n(idx_H2) &
        +k(2060)*n(idx_HNOj)*n(idx_O) &
        +k(2080)*n(idx_HNSIj)*n(idx_H2) &
        +k(2112)*n(idx_NH2j)*n(idx_N) &
        +k(2113)*n(idx_NH2j)*n(idx_O) &
        +k(2116)*n(idx_NH2j)*n(idx_S) &
        +k(2122)*n(idx_NH2j)*n(idx_H2) &
        -k(2146)*n(idx_NO2j)*n(idx_H) &
        +k(2149)*n(idx_O2Hj)*n(idx_N) &
        +k(2177)*n(idx_SIC2j)*n(idx_H2) &
        +k(2178)*n(idx_SIH2j)*n(idx_C) &
        +k(2179)*n(idx_SIH2j)*n(idx_N) &
        +k(2180)*n(idx_SIH2j)*n(idx_O) &
        +k(2181)*n(idx_SIH2j)*n(idx_S) &
        +k(2185)*n(idx_SO2j)*n(idx_H2) &
        +k(2189)*n(idx_C2H2j)*n(idx_C) &
        +k(2194)*n(idx_C2H2j)*n(idx_N) &
        +k(2198)*n(idx_C2H2j)*n(idx_O) &
        +k(2199)*n(idx_C2H2j)*n(idx_P) &
        +k(2202)*n(idx_C2H2j)*n(idx_SI) &
        +k(2203)*n(idx_C2H2j)*n(idx_CH) &
        +k(2204)*n(idx_C2H2j)*n(idx_CH) &
        +k(2205)*n(idx_C2H2j)*n(idx_CN) &
        +k(2206)*n(idx_C2H2j)*n(idx_NH) &
        +k(2208)*n(idx_C2H2j)*n(idx_OH) &
        +k(2210)*n(idx_C2H2j)*n(idx_C2H) &
        +k(2211)*n(idx_C2H2j)*n(idx_CH2) &
        +k(2212)*n(idx_C2H2j)*n(idx_CH2) &
        +k(2215)*n(idx_C2H2j)*n(idx_HCN) &
        +k(2219)*n(idx_C2H2j)*n(idx_HNC) &
        +k(2221)*n(idx_C2H2j)*n(idx_NH2) &
        +k(2223)*n(idx_C2H2j)*n(idx_C2H2) &
        +k(2226)*n(idx_C2H2j)*n(idx_C3H) &
        +k(2227)*n(idx_C2H2j)*n(idx_HC3) &
        +k(2237)*n(idx_C2H2j)*n(idx_C3H2) &
        +k(2238)*n(idx_C2H2j)*n(idx_H2C3) &
        +k(2240)*n(idx_C2H2j)*n(idx_C4H) &
        +k(2242)*n(idx_C2H2j)*n(idx_CH4) &
        +k(2246)*n(idx_C2H2j)*n(idx_C2H4) &
        +k(2250)*n(idx_C2H2j)*n(idx_C3H3) &
        +k(2253)*n(idx_C2H2j)*n(idx_C4H2) &
        +k(2255)*n(idx_C2H2j)*n(idx_C5H) &
        +k(2258)*n(idx_C2H2j)*n(idx_C3H4) &
        +k(2261)*n(idx_C2H2j)*n(idx_C5H2) &
        +k(2263)*n(idx_C2H2j)*n(idx_C6H) &
        +k(2266)*n(idx_C2H2j)*n(idx_C6H2) &
        +k(2268)*n(idx_C2H2j)*n(idx_C7H) &
        +k(2271)*n(idx_C2H2j)*n(idx_C7H2) &
        +k(2272)*n(idx_C3Hj)*n(idx_SI) &
        +k(2273)*n(idx_C3Hj)*n(idx_H2) &
        +k(2287)*n(idx_C3Hj)*n(idx_OCS) &
        +k(2290)*n(idx_C3Hj)*n(idx_C2H2) &
        +k(2302)*n(idx_C3Nj)*n(idx_H2) &
        +k(2303)*n(idx_C4j)*n(idx_H2) &
        +k(2306)*n(idx_CH2SIj)*n(idx_C) &
        +k(2307)*n(idx_CH2SIj)*n(idx_N) &
        +k(2312)*n(idx_CH3j)*n(idx_C) &
        +k(2316)*n(idx_CH3j)*n(idx_N) &
        +k(2320)*n(idx_CH3j)*n(idx_O) &
        +k(2321)*n(idx_CH3j)*n(idx_P) &
        +k(2325)*n(idx_CH3j)*n(idx_SI) &
        +k(2328)*n(idx_CH3j)*n(idx_CN) &
        +k(2339)*n(idx_CH3j)*n(idx_C2H) &
        +k(2340)*n(idx_CH3j)*n(idx_C2H) &
        +k(2345)*n(idx_CH3j)*n(idx_NH2) &
        +k(2356)*n(idx_CH3j)*n(idx_C2H3) &
        +k(2357)*n(idx_CH3j)*n(idx_C2H3) &
        +k(2375)*n(idx_CH3j)*n(idx_C3H3) &
        +k(2389)*n(idx_HCNHj)*n(idx_NA) &
        +k(2390)*n(idx_HCNHj)*n(idx_NA) &
        +k(2425)*n(idx_H2COj)*n(idx_CH4) &
        +k(2428)*n(idx_H3Oj)*n(idx_NA) &
        -k(2494)*n(idx_H3Sj)*n(idx_H) &
        +k(2513)*n(idx_NH3j)*n(idx_O) &
        +k(2517)*n(idx_NH3j)*n(idx_H2) &
        +k(2530)*n(idx_PC2Hj)*n(idx_C2H2) &
        +k(2532)*n(idx_SIC2Hj)*n(idx_C) &
        +k(2534)*n(idx_SIH3j)*n(idx_C) &
        +k(2536)*n(idx_SIH3j)*n(idx_N) &
        +k(2538)*n(idx_SIH3j)*n(idx_O) &
        +k(2542)*n(idx_SINH2j)*n(idx_C) &
        +k(2544)*n(idx_C2H3j)*n(idx_C) &
        +k(2545)*n(idx_C2H3j)*n(idx_C) &
        -k(2546)*n(idx_C2H3j)*n(idx_H) &
        +k(2548)*n(idx_C2H3j)*n(idx_O) &
        +k(2552)*n(idx_C2H3j)*n(idx_SI) &
        +k(2555)*n(idx_C2H3j)*n(idx_C2H) &
        +k(2565)*n(idx_C2H3j)*n(idx_C3H) &
        +k(2566)*n(idx_C2H3j)*n(idx_HC3) &
        +k(2570)*n(idx_C2H3j)*n(idx_C2H3) &
        +k(2575)*n(idx_C2H3j)*n(idx_C3H2) &
        +k(2576)*n(idx_C2H3j)*n(idx_H2C3) &
        +k(2579)*n(idx_C2H3j)*n(idx_C4H) &
        +k(2585)*n(idx_C2H3j)*n(idx_C3H3) &
        +k(2588)*n(idx_C2H3j)*n(idx_C4H2) &
        +k(2591)*n(idx_C2H3j)*n(idx_C5H) &
        +k(2596)*n(idx_C2H3j)*n(idx_C5H2) &
        +k(2599)*n(idx_C2H3j)*n(idx_C6H) &
        +k(2602)*n(idx_C2H3j)*n(idx_C6H2) &
        +k(2605)*n(idx_C2H3j)*n(idx_C7H) &
        +k(2608)*n(idx_C2H3j)*n(idx_C7H2) &
        +k(2610)*n(idx_C3H2j)*n(idx_C) &
        +k(2611)*n(idx_H2C3j)*n(idx_C) &
        -k(2612)*n(idx_C3H2j)*n(idx_H) &
        -k(2613)*n(idx_H2C3j)*n(idx_H) &
        +k(2614)*n(idx_C3H2j)*n(idx_N) &
        +k(2615)*n(idx_H2C3j)*n(idx_N) &
        +k(2618)*n(idx_C3H2j)*n(idx_P) &
        +k(2619)*n(idx_H2C3j)*n(idx_P) &
        +k(2620)*n(idx_C3H2j)*n(idx_S) &
        +k(2621)*n(idx_H2C3j)*n(idx_S) &
        +k(2624)*n(idx_C3H2j)*n(idx_SI) &
        +k(2625)*n(idx_H2C3j)*n(idx_SI) &
        +k(2626)*n(idx_C3H2j)*n(idx_C2H) &
        +k(2627)*n(idx_H2C3j)*n(idx_C2H) &
        +k(2628)*n(idx_C3H2j)*n(idx_C2H2) &
        +k(2629)*n(idx_H2C3j)*n(idx_C2H2) &
        +k(2630)*n(idx_C3H2j)*n(idx_C3H) &
        +k(2631)*n(idx_H2C3j)*n(idx_HC3) &
        +k(2634)*n(idx_C3H2j)*n(idx_C2H3) &
        +k(2635)*n(idx_H2C3j)*n(idx_C2H3) &
        +k(2638)*n(idx_C3H2j)*n(idx_C3H2) &
        +k(2639)*n(idx_H2C3j)*n(idx_H2C3) &
        +k(2642)*n(idx_C3H2j)*n(idx_C4H) &
        +k(2643)*n(idx_H2C3j)*n(idx_C4H) &
        +k(2644)*n(idx_C3H2j)*n(idx_CH4) &
        +k(2645)*n(idx_H2C3j)*n(idx_CH4) &
        +k(2648)*n(idx_C3H2j)*n(idx_C2H4) &
        +k(2649)*n(idx_H2C3j)*n(idx_C2H4) &
        +k(2650)*n(idx_C3H2j)*n(idx_C3H3) &
        +k(2651)*n(idx_H2C3j)*n(idx_C3H3) &
        +k(2654)*n(idx_C3H2j)*n(idx_C4H2) &
        +k(2655)*n(idx_H2C3j)*n(idx_C4H2) &
        +k(2658)*n(idx_C3H2j)*n(idx_C5H) &
        +k(2659)*n(idx_H2C3j)*n(idx_C5H) &
        +k(2668)*n(idx_C3H2j)*n(idx_C3H4) &
        +k(2669)*n(idx_H2C3j)*n(idx_C3H4) &
        +k(2672)*n(idx_C3H2j)*n(idx_C5H2) &
        +k(2673)*n(idx_H2C3j)*n(idx_C5H2) &
        +k(2676)*n(idx_C3H2j)*n(idx_C6H) &
        +k(2677)*n(idx_H2C3j)*n(idx_C6H) &
        +k(2680)*n(idx_C3H2j)*n(idx_C6H2) &
        +k(2681)*n(idx_H2C3j)*n(idx_C6H2) &
        +k(2683)*n(idx_C3HNj)*n(idx_H2) &
        +k(2684)*n(idx_C4Hj)*n(idx_C) &
        +k(2689)*n(idx_C4Hj)*n(idx_H2) &
        +k(2691)*n(idx_C4Hj)*n(idx_C2H) &
        +k(2692)*n(idx_C4Hj)*n(idx_C2H2) &
        +k(2695)*n(idx_C4Hj)*n(idx_C3H) &
        +k(2696)*n(idx_C4Hj)*n(idx_HC3) &
        +k(2697)*n(idx_C4Hj)*n(idx_C2H3) &
        +k(2698)*n(idx_C4Hj)*n(idx_C3H2) &
        +k(2699)*n(idx_C4Hj)*n(idx_H2C3) &
        +k(2701)*n(idx_C4Hj)*n(idx_C4H) &
        +k(2704)*n(idx_C4Hj)*n(idx_C2H4) &
        +k(2705)*n(idx_C4Hj)*n(idx_C3H3) &
        +k(2706)*n(idx_C4Hj)*n(idx_C4H2) &
        +k(2707)*n(idx_C4Hj)*n(idx_C5H) &
        +k(2708)*n(idx_C4Hj)*n(idx_C3H4) &
        +k(2709)*n(idx_C4Hj)*n(idx_C5H2) &
        +k(2715)*n(idx_C5j)*n(idx_H2) &
        -k(2716)*n(idx_CH4j)*n(idx_H) &
        +k(2719)*n(idx_CH4j)*n(idx_H2) &
        +k(2729)*n(idx_CH4j)*n(idx_C2H2) &
        +k(2730)*n(idx_CH4j)*n(idx_C2H2) &
        +k(2741)*n(idx_H3COj)*n(idx_NA) &
        +k(2748)*n(idx_SIC2H2j)*n(idx_C) &
        +k(2749)*n(idx_SIC3Hj)*n(idx_C) &
        +k(2750)*n(idx_SICH3j)*n(idx_C) &
        +k(2754)*n(idx_SIH4j)*n(idx_H2) &
        +k(2759)*n(idx_C2H4j)*n(idx_C) &
        +k(2760)*n(idx_C2H4j)*n(idx_C) &
        -k(2761)*n(idx_C2H4j)*n(idx_H) &
        +k(2763)*n(idx_C2H4j)*n(idx_N) &
        +k(2766)*n(idx_C2H4j)*n(idx_S) &
        +k(2768)*n(idx_C2H4j)*n(idx_SI) &
        +k(2774)*n(idx_C2H4j)*n(idx_C2H2) &
        +k(2777)*n(idx_C2H4j)*n(idx_C3H) &
        +k(2778)*n(idx_C2H4j)*n(idx_HC3) &
        +k(2786)*n(idx_C2H4j)*n(idx_C3H2) &
        +k(2787)*n(idx_C2H4j)*n(idx_H2C3) &
        +k(2789)*n(idx_C2H4j)*n(idx_C4H) &
        +k(2792)*n(idx_C2H4j)*n(idx_C2H4) &
        +k(2800)*n(idx_C2H4j)*n(idx_C5H) &
        +k(2803)*n(idx_C2H4j)*n(idx_C5H2) &
        +k(2805)*n(idx_C2H4j)*n(idx_C6H) &
        +k(2809)*n(idx_C2H4j)*n(idx_C7H) &
        +k(2814)*n(idx_C3H3j)*n(idx_C) &
        +k(2815)*n(idx_H3C3j)*n(idx_C) &
        +k(2822)*n(idx_C3H3j)*n(idx_SI) &
        +k(2823)*n(idx_H3C3j)*n(idx_SI) &
        +k(2826)*n(idx_C3H3j)*n(idx_C2H) &
        +k(2827)*n(idx_H3C3j)*n(idx_C2H) &
        +k(2832)*n(idx_C3H3j)*n(idx_C3H) &
        +k(2833)*n(idx_H3C3j)*n(idx_HC3) &
        +k(2838)*n(idx_C3H3j)*n(idx_C3H2) &
        +k(2839)*n(idx_H3C3j)*n(idx_H2C3) &
        +k(2842)*n(idx_C3H3j)*n(idx_C4H) &
        +k(2843)*n(idx_H3C3j)*n(idx_C4H) &
        +k(2850)*n(idx_C3H3j)*n(idx_C3H3) &
        +k(2851)*n(idx_H3C3j)*n(idx_C3H3) &
        +k(2856)*n(idx_C3H3j)*n(idx_C5H) &
        +k(2857)*n(idx_H3C3j)*n(idx_C5H) &
        +k(2862)*n(idx_C3H3j)*n(idx_C5H2) &
        +k(2863)*n(idx_H3C3j)*n(idx_C5H2) &
        +k(2866)*n(idx_C3H3j)*n(idx_C6H) &
        +k(2867)*n(idx_H3C3j)*n(idx_C6H) &
        +k(2871)*n(idx_C4H2j)*n(idx_C) &
        +k(2872)*n(idx_C4H2j)*n(idx_N) &
        +k(2873)*n(idx_C4H2j)*n(idx_O) &
        +k(2876)*n(idx_C4H2j)*n(idx_P) &
        +k(2877)*n(idx_C4H2j)*n(idx_S) &
        +k(2879)*n(idx_C4H2j)*n(idx_SI) &
        +k(2880)*n(idx_C4H2j)*n(idx_C2H) &
        +k(2881)*n(idx_C4H2j)*n(idx_C2H2) &
        +k(2882)*n(idx_C4H2j)*n(idx_C3H) &
        +k(2883)*n(idx_C4H2j)*n(idx_HC3) &
        +k(2885)*n(idx_C4H2j)*n(idx_C2H3) &
        +k(2886)*n(idx_C4H2j)*n(idx_C3H2) &
        +k(2887)*n(idx_C4H2j)*n(idx_H2C3) &
        +k(2888)*n(idx_C4H2j)*n(idx_C4H) &
        +k(2890)*n(idx_C4H2j)*n(idx_CH4) &
        +k(2892)*n(idx_C4H2j)*n(idx_C2H4) &
        +k(2894)*n(idx_C4H2j)*n(idx_C3H3) &
        +k(2897)*n(idx_C4H2j)*n(idx_C5H) &
        +k(2898)*n(idx_C4H2j)*n(idx_C3H4) &
        +k(2899)*n(idx_C4H2j)*n(idx_C5H2) &
        +k(2900)*n(idx_C5Hj)*n(idx_C) &
        +k(2901)*n(idx_C5Hj)*n(idx_N) &
        +k(2903)*n(idx_C5Hj)*n(idx_H2) &
        +k(2904)*n(idx_C5Nj)*n(idx_H2) &
        +k(2905)*n(idx_C6j)*n(idx_H2) &
        +k(2908)*n(idx_CH5j)*n(idx_C) &
        -k(2909)*n(idx_CH5j)*n(idx_H) &
        +k(2910)*n(idx_CH5j)*n(idx_MG) &
        +k(2915)*n(idx_CH5j)*n(idx_SI) &
        +k(2933)*n(idx_HC4Nj)*n(idx_H2) &
        +k(2934)*n(idx_SIC2H3j)*n(idx_C) &
        +k(2935)*n(idx_SIC3H2j)*n(idx_C) &
        +k(2936)*n(idx_SICH4j)*n(idx_C) &
        +k(2937)*n(idx_SIH5j)*n(idx_C) &
        +k(2942)*n(idx_C2H5j)*n(idx_C) &
        -k(2943)*n(idx_C2H5j)*n(idx_H) &
        +k(2945)*n(idx_C2H5j)*n(idx_O) &
        +k(2957)*n(idx_C3H4j)*n(idx_C) &
        -k(2958)*n(idx_C3H4j)*n(idx_H) &
        -k(2959)*n(idx_C3H4j)*n(idx_H) &
        +k(2961)*n(idx_C3H4j)*n(idx_N) &
        +k(2963)*n(idx_C3H4j)*n(idx_C2H2) &
        +k(2964)*n(idx_C3H4j)*n(idx_C3H4) &
        +k(2966)*n(idx_C4H3j)*n(idx_C) &
        +k(2967)*n(idx_C4H3j)*n(idx_N) &
        +k(2971)*n(idx_C4H3j)*n(idx_C2H) &
        +k(2972)*n(idx_C4H3j)*n(idx_C3H) &
        +k(2973)*n(idx_C4H3j)*n(idx_HC3) &
        +k(2975)*n(idx_C4H3j)*n(idx_C2H3) &
        +k(2976)*n(idx_C4H3j)*n(idx_C3H2) &
        +k(2977)*n(idx_C4H3j)*n(idx_H2C3) &
        +k(2978)*n(idx_C4H3j)*n(idx_C4H) &
        +k(2981)*n(idx_C4H3j)*n(idx_C3H3) &
        +k(2983)*n(idx_C4H3j)*n(idx_C4H2) &
        +k(2984)*n(idx_C4H3j)*n(idx_C5H) &
        +k(2987)*n(idx_C4H3j)*n(idx_C5H2) &
        +k(2989)*n(idx_C5H2j)*n(idx_C) &
        +k(2990)*n(idx_C5H2j)*n(idx_N) &
        +k(2992)*n(idx_C5H2j)*n(idx_C2H) &
        +k(2994)*n(idx_C5H2j)*n(idx_C2H2) &
        +k(2995)*n(idx_C5H2j)*n(idx_C3H) &
        +k(2996)*n(idx_C5H2j)*n(idx_HC3) &
        +k(2998)*n(idx_C5H2j)*n(idx_C2H3) &
        +k(3001)*n(idx_C5H2j)*n(idx_C3H2) &
        +k(3002)*n(idx_C5H2j)*n(idx_H2C3) &
        +k(3003)*n(idx_C5H2j)*n(idx_C4H) &
        +k(3005)*n(idx_C5H2j)*n(idx_CH4) &
        +k(3007)*n(idx_C5H2j)*n(idx_C2H4) &
        +k(3009)*n(idx_C5H2j)*n(idx_C3H3) &
        +k(3011)*n(idx_C5H2j)*n(idx_C4H2) &
        +k(3013)*n(idx_C5HNj)*n(idx_H2) &
        +k(3014)*n(idx_C6Hj)*n(idx_C) &
        +k(3016)*n(idx_C6Hj)*n(idx_H2) &
        +k(3017)*n(idx_C7j)*n(idx_H2) &
        +k(3020)*n(idx_H2C4Nj)*n(idx_H2) &
        -k(3021)*n(idx_C2H6j)*n(idx_H) &
        +k(3028)*n(idx_C4H4j)*n(idx_C2H2) &
        +k(3031)*n(idx_C5H3j)*n(idx_C) &
        +k(3032)*n(idx_C5H3j)*n(idx_N) &
        +k(3035)*n(idx_C6H2j)*n(idx_C) &
        +k(3037)*n(idx_C6H2j)*n(idx_C2H) &
        +k(3038)*n(idx_C6H2j)*n(idx_HC3) &
        +k(3039)*n(idx_C6H2j)*n(idx_C3H) &
        +k(3041)*n(idx_C6H2j)*n(idx_C2H3) &
        +k(3044)*n(idx_C6H2j)*n(idx_C3H2) &
        +k(3045)*n(idx_C6H2j)*n(idx_H2C3) &
        +k(3047)*n(idx_C6H2j)*n(idx_CH4) &
        +k(3050)*n(idx_C6H2j)*n(idx_C3H3) &
        +k(3052)*n(idx_C7Hj)*n(idx_C) &
        +k(3053)*n(idx_C7Hj)*n(idx_N) &
        +k(3055)*n(idx_C7Hj)*n(idx_H2) &
        +k(3056)*n(idx_C7Nj)*n(idx_H2) &
        +k(3057)*n(idx_C8j)*n(idx_H2) &
        +k(3058)*n(idx_H3C4Nj)*n(idx_H2) &
        +k(3059)*n(idx_C4H4Nj)*n(idx_C) &
        +k(3060)*n(idx_C4H5j)*n(idx_N) &
        +k(3061)*n(idx_C5H4j)*n(idx_N) &
        +k(3063)*n(idx_C6H3j)*n(idx_C) &
        +k(3066)*n(idx_C7H2j)*n(idx_C) &
        +k(3067)*n(idx_C7H2j)*n(idx_N) &
        +k(3069)*n(idx_C7H2j)*n(idx_C2H) &
        +k(3071)*n(idx_C7H2j)*n(idx_C2H2) &
        +k(3073)*n(idx_C7H2j)*n(idx_C2H3) &
        +k(3076)*n(idx_C7HNj)*n(idx_H2) &
        +k(3077)*n(idx_C8Hj)*n(idx_H2) &
        +k(3078)*n(idx_C9j)*n(idx_H2) &
        +k(3081)*n(idx_C7H3j)*n(idx_C) &
        +k(3082)*n(idx_C7H3j)*n(idx_N) &
        +k(3085)*n(idx_C8H2j)*n(idx_C) &
        +k(3088)*n(idx_C9Hj)*n(idx_C) &
        +k(3089)*n(idx_C9Hj)*n(idx_N) &
        +k(3091)*n(idx_C9Hj)*n(idx_H2) &
        +k(3092)*n(idx_C9Nj)*n(idx_H2) &
        +k(3093)*n(idx_C6H4Nj)*n(idx_C) &
        +k(3094)*n(idx_C6H5j)*n(idx_N) &
        +k(3098)*n(idx_C7H4j)*n(idx_N) &
        +k(3100)*n(idx_C8H3j)*n(idx_C) &
        +k(3103)*n(idx_C9H2j)*n(idx_N) &
        +k(3105)*n(idx_C9HNj)*n(idx_H2) &
        +k(3107)*n(idx_C9H3j)*n(idx_N) &
        +k(3109)*n(idx_C8H4Nj)*n(idx_C) &
        +k(3110)*n(idx_C9H4j)*n(idx_N) &
        +k(3111)*n(idx_COj)*n(idx_H2) &
        -k(3112)*n(idx_SO2j)*n(idx_H) &
        +k(3113)*n(idx_CNj)*n(idx_H2) &
        -k(3114)*n(idx_C2N2j)*n(idx_H) &
        -k(3115)*n(idx_C2N2j)*n(idx_H) &
        +k(3122)*n(idx_Ok)*n(idx_H2) &
        -k(3127)*n(idx_Cj)*n(idx_H) &
        -k(3137)*n(idx_Hj)*n(idx_H) &
        -k(3142)*n(idx_SIj)*n(idx_H) &
        -k(3152)*n(idx_C3j)*n(idx_H) &
        -k(3156)*n(idx_C2H2j)*n(idx_H) &
        -k(3162)*n(idx_C3Hj)*n(idx_H) &
        -k(3163)*n(idx_C3Hj)*n(idx_H) &
        -k(3184)*n(idx_C3H2j)*n(idx_H) &
        -k(3185)*n(idx_H2C3j)*n(idx_H) &
        -k(3186)*n(idx_C4Hj)*n(idx_H) &
        -k(3191)*n(idx_C4H2j)*n(idx_H) &
        -k(3200)*n(idx_C4H3j)*n(idx_H) &
        -k(3206)*n(idx_C6H4j)*n(idx_H) &
        -k(3209)*n(idx_Ck)*n(idx_H) &
        -k(3220)*n(idx_Hk)*n(idx_H) &
        -k(3235)*n(idx_Ok)*n(idx_H) &
        -k(3243)*n(idx_Sk)*n(idx_H) &
        -k(3248)*n(idx_CNk)*n(idx_H) &
        -k(3251)*n(idx_OHk)*n(idx_H) &
        +k(3255)*n(idx_C)*n(idx_CH) &
        +k(3256)*n(idx_C)*n(idx_HS) &
        +k(3257)*n(idx_C)*n(idx_NH) &
        +k(3262)*n(idx_C)*n(idx_OH) &
        +k(3263)*n(idx_C)*n(idx_PH) &
        +k(3265)*n(idx_C)*n(idx_SIH) &
        +k(3268)*n(idx_C)*n(idx_CH2) &
        +k(3270)*n(idx_C)*n(idx_HCO) &
        +k(3272)*n(idx_C)*n(idx_C2H) &
        +k(3274)*n(idx_C)*n(idx_NH2) &
        +k(3275)*n(idx_C)*n(idx_NH2) &
        +k(3277)*n(idx_C)*n(idx_SIH2) &
        +k(3279)*n(idx_C)*n(idx_CH3) &
        +k(3280)*n(idx_C)*n(idx_C2H2) &
        +k(3281)*n(idx_C)*n(idx_C2H2) &
        +k(3284)*n(idx_C)*n(idx_SIH3) &
        +k(3285)*n(idx_C)*n(idx_C2H4) &
        +k(3288)*n(idx_C)*n(idx_CH2CN) &
        +k(3289)*n(idx_C)*n(idx_C2H3) &
        +k(3290)*n(idx_C)*n(idx_C2H3) &
        +k(3291)*n(idx_C)*n(idx_C3H) &
        +k(3292)*n(idx_C)*n(idx_HC3) &
        +k(3293)*n(idx_C)*n(idx_C3H2) &
        +k(3294)*n(idx_C)*n(idx_H2C3) &
        +k(3297)*n(idx_C)*n(idx_C3H3) &
        +k(3298)*n(idx_C)*n(idx_C3H4) &
        +k(3299)*n(idx_C)*n(idx_C2H5) &
        +k(3300)*n(idx_C)*n(idx_C4H) &
        +k(3301)*n(idx_C)*n(idx_C4H2) &
        +k(3302)*n(idx_C)*n(idx_C4H3) &
        +k(3303)*n(idx_C)*n(idx_C5H) &
        +k(3305)*n(idx_C)*n(idx_C5H2) &
        +k(3306)*n(idx_C)*n(idx_C6H) &
        +k(3307)*n(idx_C)*n(idx_C6H2) &
        +k(3308)*n(idx_C)*n(idx_C7H) &
        +k(3310)*n(idx_C)*n(idx_C7H2) &
        +k(3311)*n(idx_C)*n(idx_C8H) &
        +k(3312)*n(idx_C)*n(idx_C8H2) &
        +k(3313)*n(idx_C)*n(idx_C9H) &
        -k(3330)*n(idx_H)*n(idx_HS) &
        -k(3331)*n(idx_H)*n(idx_HCO) &
        -k(3332)*n(idx_H)*n(idx_HCO) &
        -k(3333)*n(idx_H)*n(idx_C2H3) &
        -k(3334)*n(idx_H)*n(idx_H2CN) &
        -k(3335)*n(idx_H)*n(idx_HCNC2) &
        +k(3335)*n(idx_H)*n(idx_HCNC2) &
        -k(3336)*n(idx_H)*n(idx_HNC3) &
        +k(3336)*n(idx_H)*n(idx_HNC3) &
        -k(3337)*n(idx_H)*n(idx_CH) &
        -k(3338)*n(idx_H)*n(idx_CH2) &
        -k(3339)*n(idx_H)*n(idx_CH3) &
        -k(3340)*n(idx_H)*n(idx_CH4) &
        -k(3341)*n(idx_H)*n(idx_OH) &
        -k(3342)*n(idx_H)*n(idx_NH3) &
        -k(3343)*n(idx_H)*n(idx_H2O) &
        -k(3344)*n(idx_H)*n(idx_HCN) &
        -k(3345)*n(idx_H)*n(idx_NO) &
        -k(3346)*n(idx_H)*n(idx_NO) &
        -k(3347)*n(idx_H)*n(idx_H2CO) &
        -k(3348)*n(idx_H)*n(idx_HNO) &
        -k(3349)*n(idx_H)*n(idx_HNO) &
        -k(3350)*n(idx_H)*n(idx_O2) &
        -k(3351)*n(idx_H)*n(idx_O2H) &
        -k(3352)*n(idx_H)*n(idx_O2H) &
        -k(3353)*n(idx_H)*n(idx_O2H) &
        -k(3354)*n(idx_H)*n(idx_H2O2) &
        -k(3355)*n(idx_H)*n(idx_H2O2) &
        -k(3356)*n(idx_H)*n(idx_H2S) &
        -k(3357)*n(idx_H)*n(idx_CO2) &
        -k(3358)*n(idx_H)*n(idx_N2O) &
        -k(3359)*n(idx_H)*n(idx_NO2) &
        -k(3360)*n(idx_H)*n(idx_OCS) &
        +k(3361)*n(idx_H2)*n(idx_C) &
        +k(3362)*n(idx_H2)*n(idx_CH) &
        +k(3363)*n(idx_H2)*n(idx_CH2) &
        +k(3364)*n(idx_H2)*n(idx_CH3) &
        +k(3365)*n(idx_H2)*n(idx_O) &
        +k(3366)*n(idx_H2)*n(idx_OH) &
        +k(3367)*n(idx_H2)*n(idx_N) &
        +k(3368)*n(idx_H2)*n(idx_NH) &
        +k(3369)*n(idx_H2)*n(idx_NH2) &
        +k(3370)*n(idx_H2)*n(idx_O2H) &
        +k(3372)*n(idx_N)*n(idx_CH) &
        +k(3374)*n(idx_N)*n(idx_HS) &
        +k(3375)*n(idx_N)*n(idx_NH) &
        +k(3378)*n(idx_N)*n(idx_OH) &
        +k(3380)*n(idx_N)*n(idx_PH) &
        +k(3384)*n(idx_N)*n(idx_SIH) &
        +k(3386)*n(idx_N)*n(idx_CH2) &
        +k(3387)*n(idx_N)*n(idx_CH2) &
        +k(3388)*n(idx_N)*n(idx_HCO) &
        +k(3394)*n(idx_N)*n(idx_SIH2) &
        +k(3395)*n(idx_N)*n(idx_C2H) &
        +k(3399)*n(idx_N)*n(idx_C3H) &
        +k(3400)*n(idx_N)*n(idx_HC3) &
        +2.d0*k(3402)*n(idx_N)*n(idx_CH3) &
        +k(3403)*n(idx_N)*n(idx_CH3) &
        +k(3406)*n(idx_N)*n(idx_C2H3) &
        +k(3408)*n(idx_N)*n(idx_C3H2) &
        +k(3409)*n(idx_N)*n(idx_H2C3) &
        +k(3413)*n(idx_N)*n(idx_C4H) &
        +k(3415)*n(idx_N)*n(idx_C5H) &
        +k(3419)*n(idx_N)*n(idx_C5H2) &
        +k(3423)*n(idx_N)*n(idx_C7H) &
        +k(3424)*n(idx_N)*n(idx_C7H2) &
        +k(3429)*n(idx_N)*n(idx_C9H) &
        +k(3434)*n(idx_O)*n(idx_CH) &
        +k(3439)*n(idx_O)*n(idx_HS) &
        +k(3440)*n(idx_O)*n(idx_NH) &
        +k(3444)*n(idx_O)*n(idx_OH) &
        +k(3445)*n(idx_O)*n(idx_PH) &
        +k(3449)*n(idx_O)*n(idx_SIH) &
        +2.d0*k(3456)*n(idx_O)*n(idx_CH2) &
        +k(3458)*n(idx_O)*n(idx_HCO) &
        +k(3460)*n(idx_O)*n(idx_HCN) &
        +k(3462)*n(idx_O)*n(idx_HCS) &
        +k(3467)*n(idx_O)*n(idx_HNO) &
        +k(3470)*n(idx_O)*n(idx_NH2) &
        +k(3476)*n(idx_O)*n(idx_PH2) &
        +2.d0*k(3480)*n(idx_O)*n(idx_SIH2) &
        +k(3483)*n(idx_O)*n(idx_C2H3) &
        +k(3484)*n(idx_O)*n(idx_C2H5) &
        +k(3492)*n(idx_O)*n(idx_CH3) &
        +k(3496)*n(idx_O)*n(idx_SIH3) &
        +k(3503)*n(idx_O)*n(idx_CH2PH) &
        +k(3520)*n(idx_S)*n(idx_CH) &
        +k(3521)*n(idx_S)*n(idx_NH) &
        +k(3522)*n(idx_S)*n(idx_HS) &
        +k(3524)*n(idx_S)*n(idx_OH) &
        +k(3525)*n(idx_S)*n(idx_CH2) &
        +k(3527)*n(idx_S)*n(idx_CH3) &
        +k(3530)*n(idx_SI)*n(idx_OH) &
        +k(3531)*n(idx_SI)*n(idx_CH2) &
        +k(3532)*n(idx_SI)*n(idx_CH3) &
        +k(3533)*n(idx_SI)*n(idx_C2H2) &
        +k(3534)*n(idx_SI)*n(idx_C3H4) &
        +k(3535)*n(idx_SI)*n(idx_C4H2) &
        +k(3536)*n(idx_SI)*n(idx_C6H2) &
        +k(3537)*n(idx_SI)*n(idx_C8H2) &
        +k(3538)*n(idx_SI)*n(idx_C2H4) &
        +k(3539)*n(idx_SI)*n(idx_C3H6) &
        +k(3540)*n(idx_F)*n(idx_H2) &
        +k(3547)*n(idx_CH)*n(idx_CH4) &
        +k(3548)*n(idx_CH)*n(idx_C2H2) &
        +k(3549)*n(idx_CH)*n(idx_C3H4) &
        +k(3550)*n(idx_CH)*n(idx_C4H2) &
        +k(3551)*n(idx_CH)*n(idx_C6H2) &
        +k(3552)*n(idx_CH)*n(idx_C2H4) &
        +k(3553)*n(idx_CH)*n(idx_C3H6) &
        +k(3554)*n(idx_CH)*n(idx_C3) &
        +k(3555)*n(idx_CH)*n(idx_C5) &
        +k(3556)*n(idx_CH)*n(idx_C7) &
        +k(3557)*n(idx_CH)*n(idx_C9) &
        +k(3558)*n(idx_CH)*n(idx_C2) &
        +k(3559)*n(idx_CH)*n(idx_C4) &
        +k(3560)*n(idx_CH)*n(idx_C6) &
        +k(3561)*n(idx_CH)*n(idx_C8) &
        +k(3562)*n(idx_CH)*n(idx_HC3N) &
        +k(3563)*n(idx_CH)*n(idx_HC5N) &
        +k(3564)*n(idx_CH)*n(idx_HC7N) &
        +k(3565)*n(idx_CH)*n(idx_HC9N) &
        +k(3566)*n(idx_CH)*n(idx_HC11N) &
        +k(3567)*n(idx_C2)*n(idx_C2H2) &
        +k(3568)*n(idx_C2)*n(idx_C2H4) &
        +k(3569)*n(idx_C2)*n(idx_C4H2) &
        +k(3570)*n(idx_C2)*n(idx_C6H2) &
        +k(3574)*n(idx_CN)*n(idx_OH) &
        +k(3577)*n(idx_CN)*n(idx_C2H2) &
        +k(3579)*n(idx_CN)*n(idx_NH3) &
        +k(3580)*n(idx_CN)*n(idx_C2H4) &
        +k(3581)*n(idx_CN)*n(idx_C4H2) &
        +k(3582)*n(idx_CN)*n(idx_C6H2) &
        +k(3583)*n(idx_CN)*n(idx_C8H2) &
        +k(3584)*n(idx_CN)*n(idx_HC3N) &
        +k(3585)*n(idx_CN)*n(idx_HC5N) &
        +k(3586)*n(idx_CN)*n(idx_HC7N) &
        +k(3587)*n(idx_CN)*n(idx_HC9N) &
        +k(3588)*n(idx_CN)*n(idx_HC11N) &
        +k(3589)*n(idx_CO)*n(idx_OH) &
        +2.d0*k(3592)*n(idx_NH)*n(idx_NH) &
        +k(3593)*n(idx_NH)*n(idx_NO) &
        +k(3595)*n(idx_OH)*n(idx_SIO) &
        +k(3596)*n(idx_OH)*n(idx_SO) &
        +k(3598)*n(idx_OH)*n(idx_CH2) &
        +k(3606)*n(idx_OH)*n(idx_H2CO) &
        +k(3610)*n(idx_C2H)*n(idx_S) &
        +k(3611)*n(idx_C2H)*n(idx_CS) &
        +k(3613)*n(idx_C2H)*n(idx_HCN) &
        +k(3614)*n(idx_C2H)*n(idx_HNC) &
        +k(3615)*n(idx_C2H)*n(idx_C2H2) &
        +k(3616)*n(idx_C2H)*n(idx_C3H2) &
        +k(3617)*n(idx_C2H)*n(idx_H2C3) &
        +k(3618)*n(idx_C2H)*n(idx_C4H2) &
        +k(3619)*n(idx_C2H)*n(idx_C5H2) &
        +k(3620)*n(idx_C2H)*n(idx_C6H2) &
        +k(3621)*n(idx_C2H)*n(idx_C7H2) &
        +k(3622)*n(idx_C2H)*n(idx_C3) &
        +k(3623)*n(idx_C2H)*n(idx_C5) &
        +k(3624)*n(idx_C2H)*n(idx_C7) &
        +k(3625)*n(idx_C2H)*n(idx_C9) &
        +k(3626)*n(idx_C2H)*n(idx_C2) &
        +k(3627)*n(idx_C2H)*n(idx_C4) &
        +k(3628)*n(idx_C2H)*n(idx_C6) &
        +k(3629)*n(idx_C2H)*n(idx_C8) &
        +k(3630)*n(idx_C2H)*n(idx_HC3N) &
        +k(3631)*n(idx_C2H)*n(idx_HC5N) &
        +k(3632)*n(idx_C2H)*n(idx_HC7N) &
        +k(3633)*n(idx_C2H)*n(idx_HC9N) &
        +k(3634)*n(idx_C2H)*n(idx_HC11N) &
        +k(3640)*n(idx_NH2)*n(idx_H2CO) &
        -k(3642)*n(idx_C)*n(idx_H) &
        -k(3646)*n(idx_H)*n(idx_O) &
        -k(3655)*n(idx_H)*n(idx_OH) &
        +k(3660)*n(idx_CHj)*n(idx_E) &
        +2.d0*k(3666)*n(idx_H2j)*n(idx_E) &
        +k(3667)*n(idx_HCLj)*n(idx_E) &
        +k(3668)*n(idx_HFj)*n(idx_E) &
        +k(3669)*n(idx_HEHj)*n(idx_E) &
        +k(3670)*n(idx_HSj)*n(idx_E) &
        +k(3672)*n(idx_NHj)*n(idx_E) &
        +k(3676)*n(idx_OHj)*n(idx_E) &
        +k(3677)*n(idx_PHj)*n(idx_E) &
        +k(3682)*n(idx_SIHj)*n(idx_E) &
        +k(3688)*n(idx_C2Hj)*n(idx_E) &
        +k(3690)*n(idx_C2Hj)*n(idx_E) &
        +k(3700)*n(idx_CH2j)*n(idx_E) &
        +2.d0*k(3701)*n(idx_CH2j)*n(idx_E) &
        +k(3703)*n(idx_CHSIj)*n(idx_E) &
        +2.d0*k(3706)*n(idx_H2CLj)*n(idx_E) &
        +k(3707)*n(idx_H2CLj)*n(idx_E) &
        +2.d0*k(3708)*n(idx_H2Fj)*n(idx_E) &
        +k(3709)*n(idx_H2Fj)*n(idx_E) &
        +k(3711)*n(idx_H2Oj)*n(idx_E) &
        +2.d0*k(3712)*n(idx_H2Oj)*n(idx_E) &
        +2.d0*k(3713)*n(idx_H2Sj)*n(idx_E) &
        +k(3714)*n(idx_H2Sj)*n(idx_E) &
        +3.d0*k(3715)*n(idx_H3j)*n(idx_E) &
        +k(3716)*n(idx_H3j)*n(idx_E) &
        +k(3717)*n(idx_HCNj)*n(idx_E) &
        +k(3718)*n(idx_HCOj)*n(idx_E) &
        +k(3722)*n(idx_HCPj)*n(idx_E) &
        +k(3723)*n(idx_HCSj)*n(idx_E) &
        +k(3725)*n(idx_HNCj)*n(idx_E) &
        +k(3726)*n(idx_HNOj)*n(idx_E) &
        +k(3727)*n(idx_HNSj)*n(idx_E) &
        +k(3729)*n(idx_HNSIj)*n(idx_E) &
        +k(3730)*n(idx_HOCj)*n(idx_E) &
        +k(3732)*n(idx_HPNj)*n(idx_E) &
        +k(3734)*n(idx_HPOj)*n(idx_E) &
        +k(3736)*n(idx_HSIOj)*n(idx_E) &
        +k(3738)*n(idx_HSISj)*n(idx_E) &
        +k(3739)*n(idx_HSOj)*n(idx_E) &
        +k(3740)*n(idx_N2Hj)*n(idx_E) &
        +k(3743)*n(idx_NAH2j)*n(idx_E) &
        +2.d0*k(3745)*n(idx_NH2j)*n(idx_E) &
        +k(3746)*n(idx_NH2j)*n(idx_E) &
        +k(3748)*n(idx_O2Hj)*n(idx_E) &
        +k(3753)*n(idx_PH2j)*n(idx_E) &
        +k(3755)*n(idx_S2Hj)*n(idx_E) &
        +2.d0*k(3758)*n(idx_SIH2j)*n(idx_E) &
        +k(3760)*n(idx_SIH2j)*n(idx_E) &
        +k(3763)*n(idx_C2H2j)*n(idx_E) &
        +2.d0*k(3764)*n(idx_C2H2j)*n(idx_E) &
        +k(3768)*n(idx_C2HOj)*n(idx_E) &
        +k(3771)*n(idx_C2HOj)*n(idx_E) &
        +k(3775)*n(idx_C2NHj)*n(idx_E) &
        +k(3777)*n(idx_C3Hj)*n(idx_E) &
        +k(3787)*n(idx_CH2SIj)*n(idx_E) &
        +k(3788)*n(idx_CH3j)*n(idx_E) &
        +2.d0*k(3789)*n(idx_CH3j)*n(idx_E) &
        +k(3791)*n(idx_CH3j)*n(idx_E) &
        +2.d0*k(3792)*n(idx_H2CCLj)*n(idx_E) &
        +2.d0*k(3793)*n(idx_HCNHj)*n(idx_E) &
        +k(3794)*n(idx_HCNHj)*n(idx_E) &
        +k(3795)*n(idx_HCNHj)*n(idx_E) &
        +2.d0*k(3796)*n(idx_H2COj)*n(idx_E) &
        +k(3797)*n(idx_H2COj)*n(idx_E) &
        +2.d0*k(3798)*n(idx_H2CSj)*n(idx_E) &
        +k(3799)*n(idx_H2CSj)*n(idx_E) &
        +k(3801)*n(idx_H2NCj)*n(idx_E) &
        +k(3803)*n(idx_H2NOj)*n(idx_E) &
        +k(3805)*n(idx_H2POj)*n(idx_E) &
        +k(3807)*n(idx_H2S2j)*n(idx_E) &
        +2.d0*k(3810)*n(idx_H3Oj)*n(idx_E) &
        +k(3811)*n(idx_H3Oj)*n(idx_E) &
        +k(3813)*n(idx_H3Oj)*n(idx_E) &
        +2.d0*k(3814)*n(idx_H3Sj)*n(idx_E) &
        +k(3815)*n(idx_H3Sj)*n(idx_E) &
        +k(3817)*n(idx_HC2Sj)*n(idx_E) &
        +k(3818)*n(idx_HCO2j)*n(idx_E) &
        +k(3820)*n(idx_HCO2j)*n(idx_E) &
        +k(3823)*n(idx_HOCSj)*n(idx_E) &
        +k(3825)*n(idx_HSIO2j)*n(idx_E) &
        +k(3826)*n(idx_HSO2j)*n(idx_E) &
        +k(3828)*n(idx_HSO2j)*n(idx_E) &
        +k(3830)*n(idx_NAH2Oj)*n(idx_E) &
        +2.d0*k(3831)*n(idx_NH3j)*n(idx_E) &
        +k(3832)*n(idx_NH3j)*n(idx_E) &
        +k(3834)*n(idx_PC2Hj)*n(idx_E) &
        +k(3836)*n(idx_PCH2j)*n(idx_E) &
        +k(3838)*n(idx_PH3j)*n(idx_E) &
        +k(3841)*n(idx_SIC2Hj)*n(idx_E) &
        +k(3845)*n(idx_SIH3j)*n(idx_E) &
        +k(3847)*n(idx_SINCHj)*n(idx_E) &
        +k(3849)*n(idx_SINH2j)*n(idx_E) &
        +2.d0*k(3856)*n(idx_C2H3j)*n(idx_E) &
        +k(3858)*n(idx_C2H3j)*n(idx_E) &
        +k(3859)*n(idx_C2H3j)*n(idx_E) &
        +2.d0*k(3864)*n(idx_C3H2j)*n(idx_E) &
        +2.d0*k(3865)*n(idx_H2C3j)*n(idx_E) &
        +k(3870)*n(idx_C3H2j)*n(idx_E) &
        +k(3871)*n(idx_H2C3j)*n(idx_E) &
        +k(3874)*n(idx_C3HNj)*n(idx_E) &
        +k(3878)*n(idx_C4Hj)*n(idx_E) &
        +2.d0*k(3888)*n(idx_CH2O2j)*n(idx_E) &
        +2.d0*k(3889)*n(idx_CH4j)*n(idx_E) &
        +k(3890)*n(idx_CH4j)*n(idx_E) &
        +k(3891)*n(idx_H3COj)*n(idx_E) &
        +2.d0*k(3892)*n(idx_H3COj)*n(idx_E) &
        +k(3893)*n(idx_H3COj)*n(idx_E) &
        +k(3894)*n(idx_H3CSj)*n(idx_E) &
        +k(3895)*n(idx_H3CSj)*n(idx_E) &
        +k(3897)*n(idx_H3S2j)*n(idx_E) &
        +k(3898)*n(idx_H3SIOj)*n(idx_E) &
        +k(3899)*n(idx_H3SIOj)*n(idx_E) &
        +k(3902)*n(idx_HC3Oj)*n(idx_E) &
        +k(3904)*n(idx_HC3Sj)*n(idx_E) &
        +2.d0*k(3905)*n(idx_NH4j)*n(idx_E) &
        +k(3907)*n(idx_NH4j)*n(idx_E) &
        +k(3911)*n(idx_PC2H2j)*n(idx_E) &
        +k(3913)*n(idx_PC3Hj)*n(idx_E) &
        +k(3915)*n(idx_PCH3j)*n(idx_E) &
        +k(3920)*n(idx_SIC2H2j)*n(idx_E) &
        +k(3923)*n(idx_SIC3Hj)*n(idx_E) &
        +k(3927)*n(idx_SICH3j)*n(idx_E) &
        +k(3929)*n(idx_SIH4j)*n(idx_E) &
        +k(3930)*n(idx_CH3CNj)*n(idx_E) &
        +k(3933)*n(idx_CH3CNj)*n(idx_E) &
        +k(3935)*n(idx_C2H3Oj)*n(idx_E) &
        +2.d0*k(3936)*n(idx_C2H4j)*n(idx_E) &
        +k(3938)*n(idx_C2H4j)*n(idx_E) &
        +k(3939)*n(idx_C2H4j)*n(idx_E) &
        +k(3944)*n(idx_C3H2Nj)*n(idx_E) &
        +k(3945)*n(idx_C3H2Nj)*n(idx_E) &
        +k(3946)*n(idx_C3H2Nj)*n(idx_E) &
        +k(3947)*n(idx_C3H2Nj)*n(idx_E) &
        +k(3952)*n(idx_C3H3j)*n(idx_E) &
        +k(3953)*n(idx_H3C3j)*n(idx_E) &
        +k(3955)*n(idx_C4H2j)*n(idx_E) &
        +k(3957)*n(idx_C5Hj)*n(idx_E) &
        +k(3961)*n(idx_CH3O2j)*n(idx_E) &
        +k(3962)*n(idx_CH3O2j)*n(idx_E) &
        +k(3965)*n(idx_CH4Nj)*n(idx_E) &
        +k(3966)*n(idx_CH4Nj)*n(idx_E) &
        +k(3970)*n(idx_CH5j)*n(idx_E) &
        +2.d0*k(3971)*n(idx_CH5j)*n(idx_E) &
        +k(3972)*n(idx_CH5j)*n(idx_E) &
        +2.d0*k(3977)*n(idx_H2C3Oj)*n(idx_E) &
        +k(3981)*n(idx_HC2NCHj)*n(idx_E) &
        +k(3982)*n(idx_HC2NCHj)*n(idx_E) &
        +k(3983)*n(idx_HC2NCHj)*n(idx_E) &
        +k(3984)*n(idx_HC2NCHj)*n(idx_E) &
        +k(3991)*n(idx_HC4Sj)*n(idx_E) &
        +k(3993)*n(idx_NH2CNHj)*n(idx_E) &
        +k(3995)*n(idx_PC2H3j)*n(idx_E) &
        +k(4001)*n(idx_PC4Hj)*n(idx_E) &
        +k(4002)*n(idx_PCH4j)*n(idx_E) &
        +k(4003)*n(idx_PCH4j)*n(idx_E) &
        +k(4006)*n(idx_SIC2H3j)*n(idx_E) &
        +k(4008)*n(idx_SIC3H2j)*n(idx_E) &
        +k(4010)*n(idx_SIC4Hj)*n(idx_E) &
        +k(4012)*n(idx_SICH4j)*n(idx_E) &
        +k(4014)*n(idx_SIH5j)*n(idx_E) &
        +2.d0*k(4015)*n(idx_C2H4Nj)*n(idx_E) &
        +k(4016)*n(idx_C2H4Nj)*n(idx_E) &
        +2.d0*k(4018)*n(idx_C2H4Oj)*n(idx_E) &
        +k(4021)*n(idx_C2H5j)*n(idx_E) &
        +k(4023)*n(idx_C2H5j)*n(idx_E) &
        +k(4024)*n(idx_C3H3Nj)*n(idx_E) &
        +k(4028)*n(idx_C3H4j)*n(idx_E) &
        +2.d0*k(4032)*n(idx_C3H4j)*n(idx_E) &
        +2.d0*k(4033)*n(idx_C3H4j)*n(idx_E) &
        +k(4035)*n(idx_C4H3j)*n(idx_E) &
        +k(4037)*n(idx_C5H2j)*n(idx_E) &
        +k(4040)*n(idx_C5HNj)*n(idx_E) &
        +k(4042)*n(idx_C6Hj)*n(idx_E) &
        +k(4048)*n(idx_CH5Oj)*n(idx_E) &
        +k(4050)*n(idx_CH5Oj)*n(idx_E) &
        +k(4051)*n(idx_CH5Oj)*n(idx_E) &
        +k(4052)*n(idx_CH5Oj)*n(idx_E) &
        +k(4056)*n(idx_H3C3Oj)*n(idx_E) &
        +k(4057)*n(idx_NH2CH2Oj)*n(idx_E) &
        +k(4058)*n(idx_NH2CH2Oj)*n(idx_E) &
        +k(4064)*n(idx_PC2H4j)*n(idx_E) &
        +k(4068)*n(idx_C2H5Oj)*n(idx_E) &
        +k(4069)*n(idx_C2H5Oj)*n(idx_E) &
        +k(4070)*n(idx_C2H5Oj)*n(idx_E) &
        +k(4072)*n(idx_C2H6j)*n(idx_E) &
        +k(4074)*n(idx_C3H4Nj)*n(idx_E) &
        +k(4075)*n(idx_C3H4Nj)*n(idx_E) &
        +k(4077)*n(idx_C3H5j)*n(idx_E) &
        +k(4078)*n(idx_C4H4j)*n(idx_E) &
        +k(4080)*n(idx_C4H4j)*n(idx_E) &
        +k(4082)*n(idx_C5H2Nj)*n(idx_E) &
        +k(4084)*n(idx_C5H3j)*n(idx_E) &
        +2.d0*k(4085)*n(idx_C6H2j)*n(idx_E) &
        +k(4087)*n(idx_C6H2j)*n(idx_E) &
        +k(4089)*n(idx_C7Hj)*n(idx_E) &
        +k(4093)*n(idx_CH6Nj)*n(idx_E) &
        +k(4094)*n(idx_CH6Nj)*n(idx_E) &
        +k(4095)*n(idx_COOCH4j)*n(idx_E) &
        +k(4103)*n(idx_C4H4Nj)*n(idx_E) &
        +k(4105)*n(idx_C4H5j)*n(idx_E) &
        +k(4109)*n(idx_C5H3Nj)*n(idx_E) &
        +k(4111)*n(idx_C5H4j)*n(idx_E) &
        +2.d0*k(4113)*n(idx_C6H3j)*n(idx_E) &
        +k(4115)*n(idx_C6H3j)*n(idx_E) &
        +k(4117)*n(idx_C7H2j)*n(idx_E) &
        +k(4119)*n(idx_C7HNj)*n(idx_E) &
        +k(4121)*n(idx_C8Hj)*n(idx_E) &
        +k(4128)*n(idx_H5C2O2j)*n(idx_E) &
        +k(4131)*n(idx_C2H5OH2j)*n(idx_E) &
        +k(4132)*n(idx_C2H5OH2j)*n(idx_E) &
        +k(4133)*n(idx_C2H5OH2j)*n(idx_E) &
        +k(4137)*n(idx_C5H4Nj)*n(idx_E) &
        +k(4138)*n(idx_C5H5j)*n(idx_E) &
        +k(4139)*n(idx_C5H5j)*n(idx_E) &
        +k(4140)*n(idx_C6H4j)*n(idx_E) &
        +k(4143)*n(idx_C7H2Nj)*n(idx_E) &
        +k(4145)*n(idx_C7H3j)*n(idx_E) &
        +k(4147)*n(idx_C8H2j)*n(idx_E) &
        +k(4149)*n(idx_C9Hj)*n(idx_E) &
        +k(4153)*n(idx_CH3OCH4j)*n(idx_E) &
        +k(4155)*n(idx_C3H6OHj)*n(idx_E) &
        +k(4161)*n(idx_C6H4Nj)*n(idx_E) &
        +k(4163)*n(idx_C6H5j)*n(idx_E) &
        +k(4164)*n(idx_C7H3Nj)*n(idx_E) &
        +k(4166)*n(idx_C7H4j)*n(idx_E) &
        +k(4169)*n(idx_C8H3j)*n(idx_E) &
        +k(4171)*n(idx_C9H2j)*n(idx_E) &
        +k(4173)*n(idx_C9HNj)*n(idx_E) &
        +k(4174)*n(idx_C7H5j)*n(idx_E) &
        +k(4175)*n(idx_C7H5j)*n(idx_E) &
        +k(4176)*n(idx_C8H4j)*n(idx_E) &
        +k(4179)*n(idx_C9H2Nj)*n(idx_E) &
        +k(4181)*n(idx_C9H3j)*n(idx_E) &
        +k(4182)*n(idx_C6H7j)*n(idx_E) &
        +k(4183)*n(idx_C6H7j)*n(idx_E) &
        +k(4185)*n(idx_C8H4Nj)*n(idx_E) &
        +k(4187)*n(idx_C8H5j)*n(idx_E) &
        +k(4188)*n(idx_C9H3Nj)*n(idx_E) &
        +k(4190)*n(idx_C9H4j)*n(idx_E) &
        +k(4193)*n(idx_C9H5j)*n(idx_E) &
        +k(4197)*n(idx_Hj)*n(idx_E) &
        +k(4211)*n(idx_Cj)*n(idx_Hk) &
        +k(4214)*n(idx_FEj)*n(idx_Hk) &
        +k(4216)*n(idx_Hj)*n(idx_Ck) &
        +2.d0*k(4217)*n(idx_Hj)*n(idx_Hk) &
        +k(4218)*n(idx_Hj)*n(idx_Sk) &
        +k(4220)*n(idx_HEj)*n(idx_Hk) &
        +k(4223)*n(idx_MGj)*n(idx_Hk) &
        +k(4226)*n(idx_Nj)*n(idx_Hk) &
        +k(4229)*n(idx_NAj)*n(idx_Hk) &
        +k(4232)*n(idx_Oj)*n(idx_Hk) &
        +k(4235)*n(idx_Sj)*n(idx_Hk) &
        +k(4238)*n(idx_SIj)*n(idx_Hk) &
        +k(4240)*n(idx_H2j)*n(idx_Hk) &
        +k(4243)*n(idx_H3Oj)*n(idx_Hk) &
        -k(4247)*n(idx_H)*n(idx_E) &
        +k(4260)*n(idx_CH) &
        +2.d0*k(4266)*n(idx_H2) &
        +k(4267)*n(idx_HCL) &
        +k(4268)*n(idx_HF) &
        +k(4269)*n(idx_HS) &
        +k(4271)*n(idx_NH) &
        +k(4278)*n(idx_OH) &
        +k(4281)*n(idx_SIH) &
        +k(4285)*n(idx_C2H) &
        +k(4291)*n(idx_CH2) &
        +k(4294)*n(idx_H2O) &
        +k(4296)*n(idx_H2S) &
        +k(4297)*n(idx_HCN) &
        +k(4298)*n(idx_HCO) &
        +k(4300)*n(idx_HNC) &
        +k(4301)*n(idx_HNO) &
        +k(4303)*n(idx_NH2) &
        +k(4310)*n(idx_C2H2) &
        +k(4312)*n(idx_C3H) &
        +k(4313)*n(idx_HC3) &
        +k(4320)*n(idx_CH3) &
        +2.d0*k(4322)*n(idx_H2CO) &
        +k(4324)*n(idx_H2CO) &
        +k(4328)*n(idx_NH3) &
        +k(4332)*n(idx_C2H3) &
        +k(4336)*n(idx_C3H2) &
        +k(4337)*n(idx_H2C3) &
        +k(4339)*n(idx_C4H) &
        +k(4346)*n(idx_CH4) &
        +k(4348)*n(idx_CH4) &
        +k(4356)*n(idx_C3H3) &
        +k(4357)*n(idx_C3H3) &
        +k(4359)*n(idx_C4H2) &
        +k(4364)*n(idx_C5H) &
        +k(4373)*n(idx_C3H4) &
        +k(4379)*n(idx_C5H2) &
        +k(4383)*n(idx_CH5N) &
        +2.d0*k(4384)*n(idx_CH5N) &
        +2.d0*k(4386)*n(idx_CH5N) &
        +k(4388)*n(idx_HC5N) &
        +k(4402)*n(idx_SIC2H3) &
        +k(4414)*n(idx_CHj) &
        +k(4415)*n(idx_H2j) &
        +k(4417)*n(idx_SIHj) &
        +k(4418)*n(idx_C2Hj) &
        +k(4419)*n(idx_CH2j) &
        +k(4421)*n(idx_H3j) &
        +k(4423)*n(idx_CH3j) &
        +k(4425)*n(idx_Hk) &
        -k(4430)*n(idx_H) &
        -k(4432)*n(idx_H) &
        +k(4478)*n(idx_H_DUST)

    !HE
    !HE
    dn(idx_HE) = &
        +k(5)*n(idx_HEj)*n(idx_GRAINk) &
        -k(18)*n(idx_HE) &
        +k(629)*n(idx_HEj)*n(idx_H) &
        +k(630)*n(idx_HEj)*n(idx_P) &
        +k(631)*n(idx_HEj)*n(idx_SI) &
        +k(632)*n(idx_HEj)*n(idx_C2) &
        +k(633)*n(idx_HEj)*n(idx_C2) &
        +k(634)*n(idx_HEj)*n(idx_CCL) &
        +k(635)*n(idx_HEj)*n(idx_CH) &
        +k(636)*n(idx_HEj)*n(idx_CH) &
        +k(637)*n(idx_HEj)*n(idx_CLO) &
        +k(638)*n(idx_HEj)*n(idx_CN) &
        +k(639)*n(idx_HEj)*n(idx_CN) &
        +k(640)*n(idx_HEj)*n(idx_CO) &
        +k(641)*n(idx_HEj)*n(idx_CP) &
        +k(642)*n(idx_HEj)*n(idx_CP) &
        +k(643)*n(idx_HEj)*n(idx_CS) &
        +k(644)*n(idx_HEj)*n(idx_CS) &
        +k(645)*n(idx_HEj)*n(idx_H2) &
        +k(646)*n(idx_HEj)*n(idx_H2) &
        +k(647)*n(idx_HEj)*n(idx_HCL) &
        +k(648)*n(idx_HEj)*n(idx_HF) &
        +k(649)*n(idx_HEj)*n(idx_HS) &
        +k(650)*n(idx_HEj)*n(idx_MGH) &
        +k(651)*n(idx_HEj)*n(idx_N2) &
        +k(652)*n(idx_HEj)*n(idx_N2) &
        +k(653)*n(idx_HEj)*n(idx_NAH) &
        +k(654)*n(idx_HEj)*n(idx_NH) &
        +k(655)*n(idx_HEj)*n(idx_NO) &
        +k(656)*n(idx_HEj)*n(idx_NO) &
        +k(657)*n(idx_HEj)*n(idx_NS) &
        +k(658)*n(idx_HEj)*n(idx_NS) &
        +k(659)*n(idx_HEj)*n(idx_O2) &
        +k(660)*n(idx_HEj)*n(idx_O2) &
        +k(661)*n(idx_HEj)*n(idx_OH) &
        +k(662)*n(idx_HEj)*n(idx_PH) &
        +k(663)*n(idx_HEj)*n(idx_PN) &
        +k(664)*n(idx_HEj)*n(idx_PO) &
        +k(665)*n(idx_HEj)*n(idx_S2) &
        +k(666)*n(idx_HEj)*n(idx_SIC) &
        +k(667)*n(idx_HEj)*n(idx_SIC) &
        +k(668)*n(idx_HEj)*n(idx_SIH) &
        +k(669)*n(idx_HEj)*n(idx_SIN) &
        +k(670)*n(idx_HEj)*n(idx_SIO) &
        +k(671)*n(idx_HEj)*n(idx_SIO) &
        +k(672)*n(idx_HEj)*n(idx_SIS) &
        +k(673)*n(idx_HEj)*n(idx_SIS) &
        +k(674)*n(idx_HEj)*n(idx_SO) &
        +k(675)*n(idx_HEj)*n(idx_SO) &
        +k(676)*n(idx_HEj)*n(idx_C2H) &
        +k(677)*n(idx_HEj)*n(idx_C2H) &
        +k(678)*n(idx_HEj)*n(idx_C2H) &
        +k(679)*n(idx_HEj)*n(idx_C2N) &
        +k(680)*n(idx_HEj)*n(idx_C2S) &
        +k(681)*n(idx_HEj)*n(idx_C2S) &
        +k(682)*n(idx_HEj)*n(idx_C2S) &
        +k(683)*n(idx_HEj)*n(idx_C2S) &
        +k(684)*n(idx_HEj)*n(idx_C3) &
        +k(685)*n(idx_HEj)*n(idx_C3) &
        +k(686)*n(idx_HEj)*n(idx_CCO) &
        +k(687)*n(idx_HEj)*n(idx_CCP) &
        +k(688)*n(idx_HEj)*n(idx_CCP) &
        +k(689)*n(idx_HEj)*n(idx_CH2) &
        +k(690)*n(idx_HEj)*n(idx_CH2) &
        +k(691)*n(idx_HEj)*n(idx_CO2) &
        +k(692)*n(idx_HEj)*n(idx_CO2) &
        +k(693)*n(idx_HEj)*n(idx_CO2) &
        +k(694)*n(idx_HEj)*n(idx_CO2) &
        +k(695)*n(idx_HEj)*n(idx_CO2) &
        +k(696)*n(idx_HEj)*n(idx_H2O) &
        +k(697)*n(idx_HEj)*n(idx_H2O) &
        +k(698)*n(idx_HEj)*n(idx_H2O) &
        +k(699)*n(idx_HEj)*n(idx_H2S) &
        +k(700)*n(idx_HEj)*n(idx_H2S) &
        +k(701)*n(idx_HEj)*n(idx_H2S) &
        +k(702)*n(idx_HEj)*n(idx_HCN) &
        +k(703)*n(idx_HEj)*n(idx_HCN) &
        +k(704)*n(idx_HEj)*n(idx_HCN) &
        +k(705)*n(idx_HEj)*n(idx_HCN) &
        +k(706)*n(idx_HEj)*n(idx_HCO) &
        +k(707)*n(idx_HEj)*n(idx_HCO) &
        +k(709)*n(idx_HEj)*n(idx_HCP) &
        +k(710)*n(idx_HEj)*n(idx_HCP) &
        +k(711)*n(idx_HEj)*n(idx_HCS) &
        +k(712)*n(idx_HEj)*n(idx_HCS) &
        +k(713)*n(idx_HEj)*n(idx_HCSI) &
        +k(714)*n(idx_HEj)*n(idx_HCSI) &
        +k(715)*n(idx_HEj)*n(idx_HNC) &
        +k(716)*n(idx_HEj)*n(idx_HNC) &
        +k(717)*n(idx_HEj)*n(idx_HNC) &
        +k(718)*n(idx_HEj)*n(idx_HNO) &
        +k(719)*n(idx_HEj)*n(idx_HNO) &
        +k(720)*n(idx_HEj)*n(idx_HNSI) &
        +k(721)*n(idx_HEj)*n(idx_HPO) &
        +k(722)*n(idx_HEj)*n(idx_HPO) &
        +k(723)*n(idx_HEj)*n(idx_HS2) &
        +k(724)*n(idx_HEj)*n(idx_HS2) &
        +k(725)*n(idx_HEj)*n(idx_N2O) &
        +k(726)*n(idx_HEj)*n(idx_N2O) &
        +k(727)*n(idx_HEj)*n(idx_N2O) &
        +k(728)*n(idx_HEj)*n(idx_N2O) &
        +k(729)*n(idx_HEj)*n(idx_NAOH) &
        +k(730)*n(idx_HEj)*n(idx_NH2) &
        +k(731)*n(idx_HEj)*n(idx_NH2) &
        +k(732)*n(idx_HEj)*n(idx_OCN) &
        +k(733)*n(idx_HEj)*n(idx_OCN) &
        +k(734)*n(idx_HEj)*n(idx_OCS) &
        +k(735)*n(idx_HEj)*n(idx_OCS) &
        +k(736)*n(idx_HEj)*n(idx_OCS) &
        +k(737)*n(idx_HEj)*n(idx_OCS) &
        +k(738)*n(idx_HEj)*n(idx_PH2) &
        +k(739)*n(idx_HEj)*n(idx_SIC2) &
        +k(740)*n(idx_HEj)*n(idx_SIH2) &
        +k(741)*n(idx_HEj)*n(idx_SIH2) &
        +k(742)*n(idx_HEj)*n(idx_SINC) &
        +k(743)*n(idx_HEj)*n(idx_SIO2) &
        +k(744)*n(idx_HEj)*n(idx_SO2) &
        +k(745)*n(idx_HEj)*n(idx_SO2) &
        +k(746)*n(idx_HEj)*n(idx_SO2) &
        +k(747)*n(idx_HEj)*n(idx_SO2) &
        +k(748)*n(idx_HEj)*n(idx_C2H2) &
        +k(749)*n(idx_HEj)*n(idx_C2H2) &
        +k(750)*n(idx_HEj)*n(idx_C2H2) &
        +k(751)*n(idx_HEj)*n(idx_C2H2) &
        +k(752)*n(idx_HEj)*n(idx_C3H) &
        +k(753)*n(idx_HEj)*n(idx_HC3) &
        +k(754)*n(idx_HEj)*n(idx_C3N) &
        +k(755)*n(idx_HEj)*n(idx_C3N) &
        +k(756)*n(idx_HEj)*n(idx_C3O) &
        +k(757)*n(idx_HEj)*n(idx_C3O) &
        +k(758)*n(idx_HEj)*n(idx_C3P) &
        +k(759)*n(idx_HEj)*n(idx_C3P) &
        +k(760)*n(idx_HEj)*n(idx_C3S) &
        +k(761)*n(idx_HEj)*n(idx_C3S) &
        +k(762)*n(idx_HEj)*n(idx_C4) &
        +k(763)*n(idx_HEj)*n(idx_C4) &
        +k(764)*n(idx_HEj)*n(idx_C4) &
        +k(765)*n(idx_HEj)*n(idx_CH3) &
        +k(766)*n(idx_HEj)*n(idx_CH3) &
        +k(767)*n(idx_HEj)*n(idx_H2CO) &
        +k(768)*n(idx_HEj)*n(idx_H2CO) &
        +k(769)*n(idx_HEj)*n(idx_H2CS) &
        +k(770)*n(idx_HEj)*n(idx_H2CS) &
        +k(771)*n(idx_HEj)*n(idx_H2CS) &
        +k(772)*n(idx_HEj)*n(idx_H2S2) &
        +k(773)*n(idx_HEj)*n(idx_H2S2) &
        +k(774)*n(idx_HEj)*n(idx_H2SIO) &
        +k(775)*n(idx_HEj)*n(idx_HCCP) &
        +k(776)*n(idx_HEj)*n(idx_HCCP) &
        +k(777)*n(idx_HEj)*n(idx_NH3) &
        +k(778)*n(idx_HEj)*n(idx_NH3) &
        +k(779)*n(idx_HEj)*n(idx_NH3) &
        +k(780)*n(idx_HEj)*n(idx_SIC2H) &
        +k(781)*n(idx_HEj)*n(idx_SIC2H) &
        +k(782)*n(idx_HEj)*n(idx_SIC3) &
        +k(783)*n(idx_HEj)*n(idx_SICH2) &
        +k(784)*n(idx_HEj)*n(idx_SICH2) &
        +k(785)*n(idx_HEj)*n(idx_SIH3) &
        +k(786)*n(idx_HEj)*n(idx_SIH3) &
        +k(787)*n(idx_HEj)*n(idx_CH2CN) &
        +k(788)*n(idx_HEj)*n(idx_C2H2O) &
        +k(789)*n(idx_HEj)*n(idx_C2H2O) &
        +k(790)*n(idx_HEj)*n(idx_C2H3) &
        +k(791)*n(idx_HEj)*n(idx_C2H3) &
        +k(792)*n(idx_HEj)*n(idx_C3H2) &
        +k(793)*n(idx_HEj)*n(idx_H2C3) &
        +k(794)*n(idx_HEj)*n(idx_C3H2) &
        +k(795)*n(idx_HEj)*n(idx_H2C3) &
        +k(796)*n(idx_HEj)*n(idx_C4H) &
        +k(797)*n(idx_HEj)*n(idx_C4H) &
        +k(798)*n(idx_HEj)*n(idx_C4P) &
        +k(799)*n(idx_HEj)*n(idx_C4P) &
        +k(800)*n(idx_HEj)*n(idx_C4S) &
        +k(801)*n(idx_HEj)*n(idx_C4S) &
        +k(802)*n(idx_HEj)*n(idx_C5) &
        +k(803)*n(idx_HEj)*n(idx_C5) &
        +k(804)*n(idx_HEj)*n(idx_CH2O2) &
        +k(805)*n(idx_HEj)*n(idx_CH2O2) &
        +k(806)*n(idx_HEj)*n(idx_CH2PH) &
        +k(807)*n(idx_HEj)*n(idx_CH2PH) &
        +k(808)*n(idx_HEj)*n(idx_CH3N) &
        +k(809)*n(idx_HEj)*n(idx_CH3N) &
        +k(810)*n(idx_HEj)*n(idx_CH3N) &
        +k(811)*n(idx_HEj)*n(idx_CH3N) &
        +k(812)*n(idx_HEj)*n(idx_CH4) &
        +k(813)*n(idx_HEj)*n(idx_CH4) &
        +k(814)*n(idx_HEj)*n(idx_CH4) &
        +k(815)*n(idx_HEj)*n(idx_CH4) &
        +k(816)*n(idx_HEj)*n(idx_CH4) &
        +k(817)*n(idx_HEj)*n(idx_HCNC2) &
        +k(818)*n(idx_HEj)*n(idx_HCNC2) &
        +k(819)*n(idx_HEj)*n(idx_HCNC2) &
        +k(820)*n(idx_HEj)*n(idx_HCNC2) &
        +k(821)*n(idx_HEj)*n(idx_HC2NC) &
        +k(822)*n(idx_HEj)*n(idx_HC2NC) &
        +k(823)*n(idx_HEj)*n(idx_HC2NC) &
        +k(824)*n(idx_HEj)*n(idx_HC2NC) &
        +k(825)*n(idx_HEj)*n(idx_HC3N) &
        +k(826)*n(idx_HEj)*n(idx_HC3N) &
        +k(827)*n(idx_HEj)*n(idx_HC3N) &
        +k(828)*n(idx_HEj)*n(idx_HC3N) &
        +k(829)*n(idx_HEj)*n(idx_HC3N) &
        +k(830)*n(idx_HEj)*n(idx_HC3N) &
        +k(831)*n(idx_HEj)*n(idx_HC3N) &
        +k(832)*n(idx_HEj)*n(idx_HNC3) &
        +k(833)*n(idx_HEj)*n(idx_HNC3) &
        +k(834)*n(idx_HEj)*n(idx_HNC3) &
        +k(835)*n(idx_HEj)*n(idx_HNC3) &
        +k(836)*n(idx_HEj)*n(idx_HNC3) &
        +k(837)*n(idx_HEj)*n(idx_NH2CN) &
        +k(838)*n(idx_HEj)*n(idx_NH2CN) &
        +k(839)*n(idx_HEj)*n(idx_SIC2H2) &
        +k(840)*n(idx_HEj)*n(idx_SIC2H2) &
        +k(841)*n(idx_HEj)*n(idx_SIC3H) &
        +k(842)*n(idx_HEj)*n(idx_SIC3H) &
        +k(843)*n(idx_HEj)*n(idx_SIC3H) &
        +k(844)*n(idx_HEj)*n(idx_SIC4) &
        +k(845)*n(idx_HEj)*n(idx_SICH3) &
        +k(846)*n(idx_HEj)*n(idx_SICH3) &
        +k(847)*n(idx_HEj)*n(idx_SIH4) &
        +k(848)*n(idx_HEj)*n(idx_SIH4) &
        +k(849)*n(idx_HEj)*n(idx_CH3CN) &
        +k(850)*n(idx_HEj)*n(idx_CH3CN) &
        +k(851)*n(idx_HEj)*n(idx_C2H4) &
        +k(852)*n(idx_HEj)*n(idx_C2H4) &
        +k(853)*n(idx_HEj)*n(idx_C2H4) &
        +k(854)*n(idx_HEj)*n(idx_C2H4) &
        +k(855)*n(idx_HEj)*n(idx_C2H4) &
        +k(856)*n(idx_HEj)*n(idx_C3H3) &
        +k(857)*n(idx_HEj)*n(idx_C3H3) &
        +k(858)*n(idx_HEj)*n(idx_C3H3) &
        +k(859)*n(idx_HEj)*n(idx_C3H3) &
        +k(860)*n(idx_HEj)*n(idx_C4H2) &
        +k(861)*n(idx_HEj)*n(idx_C4H2) &
        +k(862)*n(idx_HEj)*n(idx_C4H2) &
        +k(863)*n(idx_HEj)*n(idx_C5H) &
        +k(864)*n(idx_HEj)*n(idx_C5H) &
        +k(865)*n(idx_HEj)*n(idx_C5N) &
        +k(866)*n(idx_HEj)*n(idx_C6) &
        +k(867)*n(idx_HEj)*n(idx_C6) &
        +k(868)*n(idx_HEj)*n(idx_CH3OH) &
        +k(869)*n(idx_HEj)*n(idx_CH3OH) &
        +k(870)*n(idx_HEj)*n(idx_NH2CHO) &
        +k(871)*n(idx_HEj)*n(idx_NH2CHO) &
        +k(872)*n(idx_HEj)*n(idx_NH2CHO) &
        +k(873)*n(idx_HEj)*n(idx_NH2CHO) &
        +k(874)*n(idx_HEj)*n(idx_NH2CHO) &
        +k(875)*n(idx_HEj)*n(idx_C2H4O) &
        +k(876)*n(idx_HEj)*n(idx_C2H4O) &
        +k(877)*n(idx_HEj)*n(idx_C2H4O) &
        +k(878)*n(idx_HEj)*n(idx_C2H4O) &
        +k(879)*n(idx_HEj)*n(idx_C2H5) &
        +k(880)*n(idx_HEj)*n(idx_C2H5) &
        +k(881)*n(idx_HEj)*n(idx_C2H5) &
        +k(882)*n(idx_HEj)*n(idx_C3H3N) &
        +k(883)*n(idx_HEj)*n(idx_C3H4) &
        +k(884)*n(idx_HEj)*n(idx_C3H4) &
        +k(885)*n(idx_HEj)*n(idx_C3H4) &
        +k(886)*n(idx_HEj)*n(idx_C3H4) &
        +k(887)*n(idx_HEj)*n(idx_C3H4) &
        +k(888)*n(idx_HEj)*n(idx_C3H4) &
        +k(889)*n(idx_HEj)*n(idx_C4H3) &
        +k(890)*n(idx_HEj)*n(idx_C4H3) &
        +k(891)*n(idx_HEj)*n(idx_C4H3) &
        +k(892)*n(idx_HEj)*n(idx_C4H3) &
        +k(893)*n(idx_HEj)*n(idx_C4H3) &
        +k(894)*n(idx_HEj)*n(idx_C5H2) &
        +k(895)*n(idx_HEj)*n(idx_C5H2) &
        +k(896)*n(idx_HEj)*n(idx_C5H2) &
        +k(897)*n(idx_HEj)*n(idx_C6H) &
        +k(898)*n(idx_HEj)*n(idx_C6H) &
        +k(899)*n(idx_HEj)*n(idx_C7) &
        +k(900)*n(idx_HEj)*n(idx_C7) &
        +k(901)*n(idx_HEj)*n(idx_CH5N) &
        +k(902)*n(idx_HEj)*n(idx_CH5N) &
        +k(903)*n(idx_HEj)*n(idx_CH5N) &
        +k(904)*n(idx_HEj)*n(idx_CH5N) &
        +k(905)*n(idx_HEj)*n(idx_HC5N) &
        +k(906)*n(idx_HEj)*n(idx_HC5N) &
        +k(907)*n(idx_HEj)*n(idx_HC5N) &
        +k(908)*n(idx_HEj)*n(idx_C6H2) &
        +k(909)*n(idx_HEj)*n(idx_C6H2) &
        +k(910)*n(idx_HEj)*n(idx_C6H2) &
        +k(911)*n(idx_HEj)*n(idx_C7H) &
        +k(912)*n(idx_HEj)*n(idx_C7H) &
        +k(913)*n(idx_HEj)*n(idx_C7N) &
        +k(914)*n(idx_HEj)*n(idx_C8) &
        +k(915)*n(idx_HEj)*n(idx_C8) &
        +k(916)*n(idx_HEj)*n(idx_CH3C3N) &
        +k(917)*n(idx_HEj)*n(idx_HCOOCH3) &
        +k(918)*n(idx_HEj)*n(idx_C2H5OH) &
        +k(919)*n(idx_HEj)*n(idx_C2H5OH) &
        +k(920)*n(idx_HEj)*n(idx_C2H5OH) &
        +k(921)*n(idx_HEj)*n(idx_C2H5OH) &
        +k(922)*n(idx_HEj)*n(idx_C2H5OH) &
        +k(923)*n(idx_HEj)*n(idx_C7H2) &
        +k(924)*n(idx_HEj)*n(idx_C7H2) &
        +k(925)*n(idx_HEj)*n(idx_C7H2) &
        +k(926)*n(idx_HEj)*n(idx_C8H) &
        +k(927)*n(idx_HEj)*n(idx_C8H) &
        +k(928)*n(idx_HEj)*n(idx_C9) &
        +k(929)*n(idx_HEj)*n(idx_C9) &
        +k(930)*n(idx_HEj)*n(idx_CH3C4H) &
        +k(931)*n(idx_HEj)*n(idx_CH3C4H) &
        +k(932)*n(idx_HEj)*n(idx_CH3OCH3) &
        +k(933)*n(idx_HEj)*n(idx_CH3OCH3) &
        +k(934)*n(idx_HEj)*n(idx_HC7N) &
        +k(935)*n(idx_HEj)*n(idx_C2H6CO) &
        +k(936)*n(idx_HEj)*n(idx_C8H2) &
        +k(937)*n(idx_HEj)*n(idx_C8H2) &
        +k(938)*n(idx_HEj)*n(idx_C8H2) &
        +k(939)*n(idx_HEj)*n(idx_C9H) &
        +k(940)*n(idx_HEj)*n(idx_C9H) &
        +k(941)*n(idx_HEj)*n(idx_C9N) &
        +k(942)*n(idx_HEj)*n(idx_CH3C5N) &
        +k(943)*n(idx_HEj)*n(idx_C9H2) &
        +k(944)*n(idx_HEj)*n(idx_C9H2) &
        +k(945)*n(idx_HEj)*n(idx_C9H2) &
        +k(946)*n(idx_HEj)*n(idx_CH3C6H) &
        +k(947)*n(idx_HEj)*n(idx_CH3C6H) &
        +k(948)*n(idx_HEj)*n(idx_CH3C7N) &
        +k(949)*n(idx_HEj)*n(idx_HC9N) &
        +k(950)*n(idx_HEj)*n(idx_C6H6) &
        +k(951)*n(idx_HEj)*n(idx_C6H6) &
        +k(1334)*n(idx_HEHj)*n(idx_H) &
        +k(1335)*n(idx_HEHj)*n(idx_H2) &
        +k(3669)*n(idx_HEHj)*n(idx_E) &
        +k(4198)*n(idx_HEj)*n(idx_E) &
        +k(4219)*n(idx_HEj)*n(idx_Ck) &
        +k(4220)*n(idx_HEj)*n(idx_Hk) &
        +k(4221)*n(idx_HEj)*n(idx_Sk) &
        -k(4431)*n(idx_HE)

    !MG
    !MG
    dn(idx_MG) = &
        +k(6)*n(idx_MGj)*n(idx_GRAINk) &
        -k(19)*n(idx_MG) &
        +k(42)*n(idx_MGH) &
        -k(202)*n(idx_Cj)*n(idx_MG) &
        -k(426)*n(idx_Hj)*n(idx_MG) &
        +k(952)*n(idx_MGj)*n(idx_NA) &
        -k(955)*n(idx_Nj)*n(idx_MG) &
        -k(1057)*n(idx_Sj)*n(idx_MG) &
        -k(1096)*n(idx_SIj)*n(idx_MG) &
        -k(1155)*n(idx_CHj)*n(idx_MG) &
        -k(1276)*n(idx_CSj)*n(idx_MG) &
        -k(1339)*n(idx_HSj)*n(idx_MG) &
        -k(1359)*n(idx_N2j)*n(idx_MG) &
        -k(1436)*n(idx_NOj)*n(idx_MG) &
        -k(1443)*n(idx_O2j)*n(idx_MG) &
        -k(1542)*n(idx_SIOj)*n(idx_MG) &
        -k(1557)*n(idx_SOj)*n(idx_MG) &
        -k(1658)*n(idx_H2Oj)*n(idx_MG) &
        -k(1699)*n(idx_H2Sj)*n(idx_MG) &
        -k(1715)*n(idx_H3j)*n(idx_MG) &
        -k(1903)*n(idx_HCOj)*n(idx_MG) &
        -k(2191)*n(idx_C2H2j)*n(idx_MG) &
        -k(2314)*n(idx_CH3j)*n(idx_MG) &
        -k(2401)*n(idx_H2COj)*n(idx_MG) &
        -k(2510)*n(idx_NH3j)*n(idx_MG) &
        -k(2686)*n(idx_C4Hj)*n(idx_MG) &
        -k(2910)*n(idx_CH5j)*n(idx_MG) &
        +k(4199)*n(idx_MGj)*n(idx_E) &
        +k(4222)*n(idx_MGj)*n(idx_Ck) &
        +k(4223)*n(idx_MGj)*n(idx_Hk) &
        +k(4224)*n(idx_MGj)*n(idx_Sk) &
        -k(4253)*n(idx_MG)

    !N
    !N
    dn(idx_N) = &
        +k(7)*n(idx_Nj)*n(idx_GRAINk) &
        -k(20)*n(idx_N) &
        +k(30)*n(idx_CN) &
        +2.d0*k(43)*n(idx_N2) &
        +k(45)*n(idx_NH) &
        +k(46)*n(idx_NO) &
        +k(48)*n(idx_NS) &
        +k(53)*n(idx_PN) &
        +k(58)*n(idx_SIN) &
        +k(86)*n(idx_N2O) &
        +k(219)*n(idx_Cj)*n(idx_NS) &
        +k(229)*n(idx_Cj)*n(idx_SIN) &
        +k(364)*n(idx_Cj)*n(idx_NH2CHO) &
        +k(638)*n(idx_HEj)*n(idx_CN) &
        +k(651)*n(idx_HEj)*n(idx_N2) &
        +k(656)*n(idx_HEj)*n(idx_NO) &
        +k(658)*n(idx_HEj)*n(idx_NS) &
        +k(663)*n(idx_HEj)*n(idx_PN) &
        +k(669)*n(idx_HEj)*n(idx_SIN) &
        +k(702)*n(idx_HEj)*n(idx_HCN) &
        +k(704)*n(idx_HEj)*n(idx_HCN) &
        +k(715)*n(idx_HEj)*n(idx_HNC) &
        +k(728)*n(idx_HEj)*n(idx_N2O) &
        +k(830)*n(idx_HEj)*n(idx_HC3N) &
        +k(954)*n(idx_Nj)*n(idx_FE) &
        +k(955)*n(idx_Nj)*n(idx_MG) &
        +k(956)*n(idx_Nj)*n(idx_C2) &
        +k(957)*n(idx_Nj)*n(idx_CH) &
        +k(959)*n(idx_Nj)*n(idx_CN) &
        +k(960)*n(idx_Nj)*n(idx_CO) &
        +k(964)*n(idx_Nj)*n(idx_NH) &
        +k(966)*n(idx_Nj)*n(idx_NO) &
        +k(969)*n(idx_Nj)*n(idx_O2) &
        +k(971)*n(idx_Nj)*n(idx_OH) &
        +k(972)*n(idx_Nj)*n(idx_C2H) &
        +k(973)*n(idx_Nj)*n(idx_CH2) &
        +k(975)*n(idx_Nj)*n(idx_CO2) &
        +k(976)*n(idx_Nj)*n(idx_H2O) &
        +k(978)*n(idx_Nj)*n(idx_H2S) &
        +k(979)*n(idx_Nj)*n(idx_HCN) &
        +k(981)*n(idx_Nj)*n(idx_HCO) &
        +k(982)*n(idx_Nj)*n(idx_NH2) &
        +k(983)*n(idx_Nj)*n(idx_OCS) &
        +k(985)*n(idx_Nj)*n(idx_OCS) &
        +k(988)*n(idx_Nj)*n(idx_H2CO) &
        +k(991)*n(idx_Nj)*n(idx_NH3) &
        +k(993)*n(idx_Nj)*n(idx_CH4) &
        +k(997)*n(idx_Nj)*n(idx_CH4) &
        +k(1002)*n(idx_Nj)*n(idx_CH3OH) &
        +k(1011)*n(idx_Oj)*n(idx_N2) &
        +k(1028)*n(idx_Oj)*n(idx_HCN) &
        -k(1122)*n(idx_C2j)*n(idx_N) &
        +k(1130)*n(idx_C2j)*n(idx_NH) &
        +k(1138)*n(idx_C2j)*n(idx_HCN) &
        -k(1156)*n(idx_CHj)*n(idx_N) &
        +k(1215)*n(idx_CNj)*n(idx_NO) &
        -k(1238)*n(idx_COj)*n(idx_N) &
        +k(1246)*n(idx_COj)*n(idx_NH) &
        -k(1285)*n(idx_H2j)*n(idx_N) &
        -k(1340)*n(idx_HSj)*n(idx_N) &
        -k(1360)*n(idx_N2j)*n(idx_N) &
        +k(1363)*n(idx_N2j)*n(idx_O) &
        +k(1393)*n(idx_NHj)*n(idx_C) &
        -k(1394)*n(idx_NHj)*n(idx_N) &
        +k(1395)*n(idx_NHj)*n(idx_O) &
        +k(1397)*n(idx_NHj)*n(idx_S) &
        +k(1399)*n(idx_NHj)*n(idx_C2) &
        +k(1402)*n(idx_NHj)*n(idx_CH) &
        +k(1403)*n(idx_NHj)*n(idx_CN) &
        +k(1404)*n(idx_NHj)*n(idx_CO) &
        +k(1406)*n(idx_NHj)*n(idx_H2) &
        +k(1408)*n(idx_NHj)*n(idx_N2) &
        +k(1409)*n(idx_NHj)*n(idx_NH) &
        +k(1414)*n(idx_NHj)*n(idx_O2) &
        +k(1415)*n(idx_NHj)*n(idx_OH) &
        +k(1416)*n(idx_NHj)*n(idx_C2H) &
        +k(1417)*n(idx_NHj)*n(idx_CH2) &
        +k(1420)*n(idx_NHj)*n(idx_CO2) &
        +k(1424)*n(idx_NHj)*n(idx_H2O) &
        +k(1426)*n(idx_NHj)*n(idx_HCN) &
        +k(1427)*n(idx_NHj)*n(idx_HCO) &
        +k(1428)*n(idx_NHj)*n(idx_HNC) &
        +k(1429)*n(idx_NHj)*n(idx_NH2) &
        +k(1432)*n(idx_NHj)*n(idx_H2CO) &
        +k(1434)*n(idx_NHj)*n(idx_NH3) &
        -k(1444)*n(idx_O2j)*n(idx_N) &
        -k(1469)*n(idx_OHj)*n(idx_N) &
        -k(1531)*n(idx_SICj)*n(idx_N) &
        -k(1536)*n(idx_SIHj)*n(idx_N) &
        +k(1539)*n(idx_SINj)*n(idx_O) &
        -k(1543)*n(idx_SIOj)*n(idx_N) &
        -k(1544)*n(idx_SIOj)*n(idx_N) &
        -k(1558)*n(idx_SOj)*n(idx_N) &
        -k(1563)*n(idx_C2Hj)*n(idx_N) &
        -k(1564)*n(idx_C2Hj)*n(idx_N) &
        -k(1605)*n(idx_CH2j)*n(idx_N) &
        -k(1659)*n(idx_H2Oj)*n(idx_N) &
        +k(1672)*n(idx_H2Oj)*n(idx_NH) &
        -k(1700)*n(idx_H2Sj)*n(idx_N) &
        -k(1716)*n(idx_H3j)*n(idx_N) &
        -k(2112)*n(idx_NH2j)*n(idx_N) &
        +k(2120)*n(idx_NH2j)*n(idx_CN) &
        +k(2121)*n(idx_NH2j)*n(idx_CN) &
        +k(2123)*n(idx_NH2j)*n(idx_NH) &
        -k(2149)*n(idx_O2Hj)*n(idx_N) &
        -k(2179)*n(idx_SIH2j)*n(idx_N) &
        -k(2192)*n(idx_C2H2j)*n(idx_N) &
        -k(2193)*n(idx_C2H2j)*n(idx_N) &
        -k(2194)*n(idx_C2H2j)*n(idx_N) &
        -k(2307)*n(idx_CH2SIj)*n(idx_N) &
        -k(2315)*n(idx_CH3j)*n(idx_N) &
        -k(2316)*n(idx_CH3j)*n(idx_N) &
        +k(2409)*n(idx_H2COj)*n(idx_NH) &
        +k(2518)*n(idx_NH3j)*n(idx_NH) &
        -k(2535)*n(idx_SIH3j)*n(idx_N) &
        -k(2536)*n(idx_SIH3j)*n(idx_N) &
        -k(2547)*n(idx_C2H3j)*n(idx_N) &
        -k(2614)*n(idx_C3H2j)*n(idx_N) &
        -k(2615)*n(idx_H2C3j)*n(idx_N) &
        -k(2762)*n(idx_C2H4j)*n(idx_N) &
        -k(2763)*n(idx_C2H4j)*n(idx_N) &
        -k(2872)*n(idx_C4H2j)*n(idx_N) &
        -k(2901)*n(idx_C5Hj)*n(idx_N) &
        -k(2960)*n(idx_C3H4j)*n(idx_N) &
        -k(2961)*n(idx_C3H4j)*n(idx_N) &
        -k(2967)*n(idx_C4H3j)*n(idx_N) &
        -k(2990)*n(idx_C5H2j)*n(idx_N) &
        -k(3023)*n(idx_C3H5j)*n(idx_N) &
        -k(3024)*n(idx_C3H5j)*n(idx_N) &
        -k(3032)*n(idx_C5H3j)*n(idx_N) &
        -k(3053)*n(idx_C7Hj)*n(idx_N) &
        -k(3060)*n(idx_C4H5j)*n(idx_N) &
        -k(3061)*n(idx_C5H4j)*n(idx_N) &
        -k(3067)*n(idx_C7H2j)*n(idx_N) &
        -k(3079)*n(idx_C5H5j)*n(idx_N) &
        -k(3082)*n(idx_C7H3j)*n(idx_N) &
        -k(3089)*n(idx_C9Hj)*n(idx_N) &
        -k(3094)*n(idx_C6H5j)*n(idx_N) &
        -k(3098)*n(idx_C7H4j)*n(idx_N) &
        -k(3103)*n(idx_C9H2j)*n(idx_N) &
        -k(3106)*n(idx_C7H5j)*n(idx_N) &
        -k(3107)*n(idx_C9H3j)*n(idx_N) &
        -k(3110)*n(idx_C9H4j)*n(idx_N) &
        -k(3210)*n(idx_Ck)*n(idx_N) &
        -k(3221)*n(idx_Hk)*n(idx_N) &
        -k(3236)*n(idx_Ok)*n(idx_N) &
        -k(3244)*n(idx_Sk)*n(idx_N) &
        +k(3259)*n(idx_C)*n(idx_NO) &
        +k(3327)*n(idx_C)*n(idx_CN) &
        +k(3328)*n(idx_C)*n(idx_N2) &
        +k(3346)*n(idx_H)*n(idx_NO) &
        -k(3367)*n(idx_H2)*n(idx_N) &
        -k(3371)*n(idx_N)*n(idx_C2) &
        -k(3372)*n(idx_N)*n(idx_CH) &
        -k(3373)*n(idx_N)*n(idx_CN) &
        -k(3374)*n(idx_N)*n(idx_HS) &
        -k(3375)*n(idx_N)*n(idx_NH) &
        -k(3376)*n(idx_N)*n(idx_NO) &
        -k(3377)*n(idx_N)*n(idx_NS) &
        -k(3378)*n(idx_N)*n(idx_OH) &
        -k(3379)*n(idx_N)*n(idx_O2) &
        -k(3380)*n(idx_N)*n(idx_PH) &
        -k(3381)*n(idx_N)*n(idx_PO) &
        -k(3382)*n(idx_N)*n(idx_SIC) &
        -k(3383)*n(idx_N)*n(idx_SIC) &
        -k(3384)*n(idx_N)*n(idx_SIH) &
        -k(3385)*n(idx_N)*n(idx_SO) &
        -k(3386)*n(idx_N)*n(idx_CH2) &
        -k(3387)*n(idx_N)*n(idx_CH2) &
        -k(3388)*n(idx_N)*n(idx_HCO) &
        -k(3389)*n(idx_N)*n(idx_HCS) &
        -k(3390)*n(idx_N)*n(idx_NO2) &
        -k(3391)*n(idx_N)*n(idx_NO2) &
        -k(3392)*n(idx_N)*n(idx_NO2) &
        -k(3393)*n(idx_N)*n(idx_O2H) &
        -k(3394)*n(idx_N)*n(idx_SIH2) &
        -k(3395)*n(idx_N)*n(idx_C2H) &
        -k(3396)*n(idx_N)*n(idx_C2N) &
        -k(3397)*n(idx_N)*n(idx_CCO) &
        -k(3398)*n(idx_N)*n(idx_C3) &
        -k(3399)*n(idx_N)*n(idx_C3H) &
        -k(3400)*n(idx_N)*n(idx_HC3) &
        -k(3401)*n(idx_N)*n(idx_C3N) &
        -k(3402)*n(idx_N)*n(idx_CH3) &
        -k(3403)*n(idx_N)*n(idx_CH3) &
        -k(3404)*n(idx_N)*n(idx_H2CN) &
        -k(3405)*n(idx_N)*n(idx_SIH3) &
        -k(3406)*n(idx_N)*n(idx_C2H3) &
        -k(3407)*n(idx_N)*n(idx_C2H3) &
        -k(3408)*n(idx_N)*n(idx_C3H2) &
        -k(3409)*n(idx_N)*n(idx_H2C3) &
        -k(3410)*n(idx_N)*n(idx_C3H3) &
        -k(3411)*n(idx_N)*n(idx_C4) &
        -k(3412)*n(idx_N)*n(idx_C5) &
        -k(3413)*n(idx_N)*n(idx_C4H) &
        -k(3414)*n(idx_N)*n(idx_C4N) &
        -k(3415)*n(idx_N)*n(idx_C5H) &
        -k(3416)*n(idx_N)*n(idx_C5N) &
        -k(3417)*n(idx_N)*n(idx_C2H5) &
        -k(3418)*n(idx_N)*n(idx_C2H5) &
        -k(3419)*n(idx_N)*n(idx_C5H2) &
        -k(3420)*n(idx_N)*n(idx_C6) &
        -k(3421)*n(idx_N)*n(idx_C6H) &
        -k(3422)*n(idx_N)*n(idx_C7) &
        -k(3423)*n(idx_N)*n(idx_C7H) &
        -k(3424)*n(idx_N)*n(idx_C7H2) &
        -k(3425)*n(idx_N)*n(idx_C7N) &
        -k(3426)*n(idx_N)*n(idx_C8) &
        -k(3427)*n(idx_N)*n(idx_C8H) &
        -k(3428)*n(idx_N)*n(idx_C9) &
        -k(3429)*n(idx_N)*n(idx_C9H) &
        -k(3430)*n(idx_N)*n(idx_C9N) &
        +k(3436)*n(idx_O)*n(idx_CN) &
        +k(3441)*n(idx_O)*n(idx_NH) &
        +k(3443)*n(idx_O)*n(idx_NS) &
        +k(3451)*n(idx_O)*n(idx_SIN) &
        +k(3529)*n(idx_SI)*n(idx_NO) &
        -k(3643)*n(idx_C)*n(idx_N) &
        +k(3662)*n(idx_CNj)*n(idx_E) &
        +2.d0*k(3671)*n(idx_N2j)*n(idx_E) &
        +k(3672)*n(idx_NHj)*n(idx_E) &
        +k(3673)*n(idx_NOj)*n(idx_E) &
        +k(3674)*n(idx_NSj)*n(idx_E) &
        +k(3678)*n(idx_PNj)*n(idx_E) &
        +k(3683)*n(idx_SINj)*n(idx_E) &
        +k(3692)*n(idx_C2Nj)*n(idx_E) &
        +k(3731)*n(idx_HPNj)*n(idx_E) &
        +k(3741)*n(idx_N2Hj)*n(idx_E) &
        +k(3744)*n(idx_NCOj)*n(idx_E) &
        +k(3745)*n(idx_NH2j)*n(idx_E) &
        +k(3773)*n(idx_C2N2j)*n(idx_E) &
        +k(4200)*n(idx_Nj)*n(idx_E) &
        +k(4225)*n(idx_Nj)*n(idx_Ck) &
        +k(4226)*n(idx_Nj)*n(idx_Hk) &
        +k(4227)*n(idx_Nj)*n(idx_Sk) &
        +k(4263)*n(idx_CN) &
        +2.d0*k(4270)*n(idx_N2) &
        +k(4271)*n(idx_NH) &
        +k(4273)*n(idx_NO) &
        +k(4275)*n(idx_NS) &
        +k(4287)*n(idx_C2N) &
        -k(4434)*n(idx_N) &
        +k(4480)*n(idx_N_DUST)

    !NA
    !NA
    dn(idx_NA) = &
        +k(8)*n(idx_NAj)*n(idx_GRAINk) &
        -k(21)*n(idx_NA) &
        +k(44)*n(idx_NAH) &
        +k(87)*n(idx_NAOH) &
        -k(203)*n(idx_Cj)*n(idx_NA) &
        +k(261)*n(idx_Cj)*n(idx_NAOH) &
        -k(423)*n(idx_FEj)*n(idx_NA) &
        -k(427)*n(idx_Hj)*n(idx_NA) &
        -k(952)*n(idx_MGj)*n(idx_NA) &
        -k(1058)*n(idx_Sj)*n(idx_NA) &
        -k(1097)*n(idx_SIj)*n(idx_NA) &
        -k(1157)*n(idx_CHj)*n(idx_NA) &
        -k(1277)*n(idx_CSj)*n(idx_NA) &
        -k(1341)*n(idx_HSj)*n(idx_NA) &
        -k(1361)*n(idx_N2j)*n(idx_NA) &
        -k(1437)*n(idx_NOj)*n(idx_NA) &
        -k(1445)*n(idx_O2j)*n(idx_NA) &
        -k(1559)*n(idx_SOj)*n(idx_NA) &
        -k(1660)*n(idx_H2Oj)*n(idx_NA) &
        -k(1701)*n(idx_H2Sj)*n(idx_NA) &
        -k(1718)*n(idx_H3j)*n(idx_NA) &
        -k(1904)*n(idx_HCOj)*n(idx_NA) &
        -k(2195)*n(idx_C2H2j)*n(idx_NA) &
        -k(2317)*n(idx_CH3j)*n(idx_NA) &
        -k(2389)*n(idx_HCNHj)*n(idx_NA) &
        -k(2390)*n(idx_HCNHj)*n(idx_NA) &
        -k(2402)*n(idx_H2COj)*n(idx_NA) &
        -k(2428)*n(idx_H3Oj)*n(idx_NA) &
        -k(2511)*n(idx_NH3j)*n(idx_NA) &
        -k(2687)*n(idx_C4Hj)*n(idx_NA) &
        -k(2741)*n(idx_H3COj)*n(idx_NA) &
        +k(3742)*n(idx_NAH2j)*n(idx_E) &
        +k(3829)*n(idx_NAH2Oj)*n(idx_E) &
        +k(4201)*n(idx_NAj)*n(idx_E) &
        +k(4228)*n(idx_NAj)*n(idx_Ck) &
        +k(4229)*n(idx_NAj)*n(idx_Hk) &
        +k(4230)*n(idx_NAj)*n(idx_Sk) &
        -k(4254)*n(idx_NA) &
        +k(4302)*n(idx_NAOH)

    !O
    !O
    dn(idx_O) = &
        +k(9)*n(idx_Oj)*n(idx_GRAINk) &
        -k(22)*n(idx_O) &
        +k(29)*n(idx_CLO) &
        +k(31)*n(idx_CO) &
        +k(46)*n(idx_NO) &
        +2.d0*k(49)*n(idx_O2) &
        +k(51)*n(idx_OH) &
        +k(54)*n(idx_PO) &
        +k(59)*n(idx_SIO) &
        +k(61)*n(idx_SO) &
        +k(66)*n(idx_CCO) &
        +k(71)*n(idx_CO2) &
        +k(90)*n(idx_NO2) &
        +k(91)*n(idx_O2H) &
        +k(93)*n(idx_OCN) &
        +k(100)*n(idx_SIO2) &
        +k(101)*n(idx_SO2) &
        +k(222)*n(idx_Cj)*n(idx_O2) &
        +k(236)*n(idx_Cj)*n(idx_SO) &
        +k(276)*n(idx_Cj)*n(idx_C3O) &
        +k(369)*n(idx_Cj)*n(idx_NH2CHO) &
        -k(428)*n(idx_Hj)*n(idx_O) &
        +k(466)*n(idx_Hj)*n(idx_CO2) &
        +k(637)*n(idx_HEj)*n(idx_CLO) &
        +k(640)*n(idx_HEj)*n(idx_CO) &
        +k(655)*n(idx_HEj)*n(idx_NO) &
        +k(659)*n(idx_HEj)*n(idx_O2) &
        +k(664)*n(idx_HEj)*n(idx_PO) &
        +k(671)*n(idx_HEj)*n(idx_SIO) &
        +k(675)*n(idx_HEj)*n(idx_SO) &
        +k(693)*n(idx_HEj)*n(idx_CO2) &
        +k(706)*n(idx_HEj)*n(idx_HCO) &
        +k(721)*n(idx_HEj)*n(idx_HPO) &
        +k(727)*n(idx_HEj)*n(idx_N2O) &
        +k(733)*n(idx_HEj)*n(idx_OCN) &
        +k(737)*n(idx_HEj)*n(idx_OCS) &
        +k(746)*n(idx_HEj)*n(idx_SO2) &
        +k(757)*n(idx_HEj)*n(idx_C3O) &
        +k(965)*n(idx_Nj)*n(idx_NO) &
        +k(968)*n(idx_Nj)*n(idx_O2) &
        +k(1003)*n(idx_Oj)*n(idx_FE) &
        +k(1004)*n(idx_Oj)*n(idx_H) &
        +k(1005)*n(idx_Oj)*n(idx_C2) &
        +k(1007)*n(idx_Oj)*n(idx_CH) &
        +k(1012)*n(idx_Oj)*n(idx_NH) &
        +k(1014)*n(idx_Oj)*n(idx_NO) &
        +k(1015)*n(idx_Oj)*n(idx_O2) &
        +k(1017)*n(idx_Oj)*n(idx_OH) &
        +k(1019)*n(idx_Oj)*n(idx_C2H) &
        +k(1020)*n(idx_Oj)*n(idx_CH2) &
        +k(1022)*n(idx_Oj)*n(idx_H2O) &
        +k(1025)*n(idx_Oj)*n(idx_H2S) &
        +k(1030)*n(idx_Oj)*n(idx_HCO) &
        +k(1032)*n(idx_Oj)*n(idx_NH2) &
        +k(1033)*n(idx_Oj)*n(idx_NO2) &
        +k(1035)*n(idx_Oj)*n(idx_OCS) &
        +k(1038)*n(idx_Oj)*n(idx_H2CO) &
        +k(1039)*n(idx_Oj)*n(idx_NH3) &
        +k(1041)*n(idx_Oj)*n(idx_CH4) &
        +k(1044)*n(idx_Oj)*n(idx_CH3OH) &
        +k(1046)*n(idx_Pj)*n(idx_O2) &
        +k(1064)*n(idx_Sj)*n(idx_O2) &
        -k(1123)*n(idx_C2j)*n(idx_O) &
        -k(1158)*n(idx_CHj)*n(idx_O) &
        +k(1172)*n(idx_CHj)*n(idx_O2) &
        -k(1207)*n(idx_CNj)*n(idx_O) &
        +k(1218)*n(idx_CNj)*n(idx_O2) &
        +k(1227)*n(idx_CNj)*n(idx_H2O) &
        -k(1239)*n(idx_COj)*n(idx_O) &
        +k(1250)*n(idx_COj)*n(idx_OH) &
        -k(1272)*n(idx_CPj)*n(idx_O) &
        -k(1278)*n(idx_CSj)*n(idx_O) &
        +k(1281)*n(idx_CSj)*n(idx_O2) &
        -k(1286)*n(idx_H2j)*n(idx_O) &
        -k(1342)*n(idx_HSj)*n(idx_O) &
        -k(1343)*n(idx_HSj)*n(idx_O) &
        -k(1362)*n(idx_N2j)*n(idx_O) &
        -k(1363)*n(idx_N2j)*n(idx_O) &
        -k(1395)*n(idx_NHj)*n(idx_O) &
        +k(1411)*n(idx_NHj)*n(idx_NO) &
        +k(1425)*n(idx_NHj)*n(idx_H2O) &
        -k(1439)*n(idx_NSj)*n(idx_O) &
        +k(1441)*n(idx_O2j)*n(idx_C) &
        +k(1444)*n(idx_O2j)*n(idx_N) &
        +k(1447)*n(idx_O2j)*n(idx_S) &
        +k(1451)*n(idx_O2j)*n(idx_CH) &
        +k(1452)*n(idx_O2j)*n(idx_NH) &
        +k(1456)*n(idx_O2j)*n(idx_CH2) &
        +k(1468)*n(idx_OHj)*n(idx_C) &
        -k(1470)*n(idx_OHj)*n(idx_O) &
        +k(1472)*n(idx_OHj)*n(idx_S) &
        +k(1474)*n(idx_OHj)*n(idx_SI) &
        +k(1476)*n(idx_OHj)*n(idx_C2) &
        +k(1478)*n(idx_OHj)*n(idx_CH) &
        +k(1479)*n(idx_OHj)*n(idx_CN) &
        +k(1480)*n(idx_OHj)*n(idx_CO) &
        +k(1482)*n(idx_OHj)*n(idx_N2) &
        +k(1483)*n(idx_OHj)*n(idx_NH) &
        +k(1485)*n(idx_OHj)*n(idx_NO) &
        +k(1487)*n(idx_OHj)*n(idx_OH) &
        +k(1488)*n(idx_OHj)*n(idx_SIC) &
        +k(1489)*n(idx_OHj)*n(idx_SIH) &
        +k(1490)*n(idx_OHj)*n(idx_SIO) &
        +k(1492)*n(idx_OHj)*n(idx_C2H) &
        +k(1494)*n(idx_OHj)*n(idx_CH2) &
        +k(1495)*n(idx_OHj)*n(idx_CO2) &
        +k(1497)*n(idx_OHj)*n(idx_H2O) &
        +k(1499)*n(idx_OHj)*n(idx_H2S) &
        +k(1500)*n(idx_OHj)*n(idx_HCN) &
        +k(1503)*n(idx_OHj)*n(idx_HCO) &
        +k(1504)*n(idx_OHj)*n(idx_HNC) &
        +k(1506)*n(idx_OHj)*n(idx_NH2) &
        +k(1508)*n(idx_OHj)*n(idx_H2CO) &
        +k(1510)*n(idx_OHj)*n(idx_NH3) &
        +k(1512)*n(idx_OHj)*n(idx_CH4) &
        -k(1513)*n(idx_PHj)*n(idx_O) &
        -k(1532)*n(idx_SICj)*n(idx_O) &
        -k(1537)*n(idx_SIHj)*n(idx_O) &
        -k(1539)*n(idx_SINj)*n(idx_O) &
        -k(1545)*n(idx_SIOj)*n(idx_O) &
        +k(1558)*n(idx_SOj)*n(idx_N) &
        -k(1565)*n(idx_C2Hj)*n(idx_O) &
        -k(1606)*n(idx_CH2j)*n(idx_O) &
        +k(1642)*n(idx_CO2j)*n(idx_H) &
        -k(1643)*n(idx_CO2j)*n(idx_O) &
        -k(1644)*n(idx_CO2j)*n(idx_O) &
        -k(1661)*n(idx_H2Oj)*n(idx_O) &
        +k(1675)*n(idx_H2Oj)*n(idx_OH) &
        -k(1702)*n(idx_H2Sj)*n(idx_O) &
        -k(1703)*n(idx_H2Sj)*n(idx_O) &
        -k(1719)*n(idx_H3j)*n(idx_O) &
        -k(1875)*n(idx_HCNj)*n(idx_O) &
        -k(2035)*n(idx_HCPj)*n(idx_O) &
        -k(2037)*n(idx_HCSj)*n(idx_O) &
        -k(2038)*n(idx_HCSj)*n(idx_O) &
        -k(2060)*n(idx_HNOj)*n(idx_O) &
        -k(2113)*n(idx_NH2j)*n(idx_O) &
        +k(2126)*n(idx_NH2j)*n(idx_O2) &
        +k(2132)*n(idx_NH2j)*n(idx_H2O) &
        -k(2150)*n(idx_O2Hj)*n(idx_O) &
        -k(2180)*n(idx_SIH2j)*n(idx_O) &
        -k(2183)*n(idx_SINCj)*n(idx_O) &
        -k(2196)*n(idx_C2H2j)*n(idx_O) &
        -k(2197)*n(idx_C2H2j)*n(idx_O) &
        -k(2198)*n(idx_C2H2j)*n(idx_O) &
        +k(2279)*n(idx_C3Hj)*n(idx_O2) &
        -k(2308)*n(idx_CH2SIj)*n(idx_O) &
        -k(2309)*n(idx_CH2SIj)*n(idx_O) &
        -k(2318)*n(idx_CH3j)*n(idx_O) &
        -k(2319)*n(idx_CH3j)*n(idx_O) &
        -k(2320)*n(idx_CH3j)*n(idx_O) &
        +k(2333)*n(idx_CH3j)*n(idx_O2) &
        -k(2500)*n(idx_HCO2j)*n(idx_O) &
        -k(2512)*n(idx_NH3j)*n(idx_O) &
        -k(2513)*n(idx_NH3j)*n(idx_O) &
        +k(2520)*n(idx_NH3j)*n(idx_OH) &
        -k(2537)*n(idx_SIH3j)*n(idx_O) &
        -k(2538)*n(idx_SIH3j)*n(idx_O) &
        +k(2539)*n(idx_SIH3j)*n(idx_O2) &
        -k(2540)*n(idx_SINCHj)*n(idx_O) &
        -k(2548)*n(idx_C2H3j)*n(idx_O) &
        -k(2549)*n(idx_C2H3j)*n(idx_O) &
        -k(2616)*n(idx_C3H2j)*n(idx_O) &
        -k(2617)*n(idx_H2C3j)*n(idx_O) &
        -k(2688)*n(idx_C4Hj)*n(idx_O) &
        -k(2717)*n(idx_CH4j)*n(idx_O) &
        -k(2764)*n(idx_C2H4j)*n(idx_O) &
        -k(2765)*n(idx_C2H4j)*n(idx_O) &
        -k(2816)*n(idx_C3H3j)*n(idx_O) &
        -k(2817)*n(idx_H3C3j)*n(idx_O) &
        -k(2873)*n(idx_C4H2j)*n(idx_O) &
        -k(2874)*n(idx_C4H2j)*n(idx_O) &
        -k(2875)*n(idx_C4H2j)*n(idx_O) &
        -k(2902)*n(idx_C5Hj)*n(idx_O) &
        -k(2911)*n(idx_CH5j)*n(idx_O) &
        -k(2912)*n(idx_CH5j)*n(idx_O) &
        -k(2938)*n(idx_SIH5j)*n(idx_O) &
        -k(2944)*n(idx_C2H5j)*n(idx_O) &
        -k(2945)*n(idx_C2H5j)*n(idx_O) &
        -k(2962)*n(idx_C3H4j)*n(idx_O) &
        -k(2968)*n(idx_C4H3j)*n(idx_O) &
        -k(2969)*n(idx_C4H3j)*n(idx_O) &
        -k(2991)*n(idx_C5H2j)*n(idx_O) &
        -k(3015)*n(idx_C6Hj)*n(idx_O) &
        -k(3025)*n(idx_C3H5j)*n(idx_O) &
        -k(3033)*n(idx_C5H3j)*n(idx_O) &
        -k(3036)*n(idx_C6H2j)*n(idx_O) &
        -k(3054)*n(idx_C7Hj)*n(idx_O) &
        -k(3064)*n(idx_C6H3j)*n(idx_O) &
        -k(3068)*n(idx_C7H2j)*n(idx_O) &
        -k(3083)*n(idx_C7H3j)*n(idx_O) &
        -k(3086)*n(idx_C8H2j)*n(idx_O) &
        -k(3090)*n(idx_C9Hj)*n(idx_O) &
        -k(3096)*n(idx_C6H5j)*n(idx_O) &
        -k(3101)*n(idx_C8H3j)*n(idx_O) &
        -k(3104)*n(idx_C9H2j)*n(idx_O) &
        -k(3108)*n(idx_C9H3j)*n(idx_O) &
        +k(3116)*n(idx_Ck)*n(idx_NO) &
        +k(3121)*n(idx_Ok)*n(idx_CN) &
        -k(3128)*n(idx_Cj)*n(idx_O) &
        -k(3143)*n(idx_SIj)*n(idx_O) &
        -k(3211)*n(idx_Ck)*n(idx_O) &
        -k(3222)*n(idx_Hk)*n(idx_O) &
        -k(3237)*n(idx_Ok)*n(idx_O) &
        -k(3245)*n(idx_Sk)*n(idx_O) &
        -k(3254)*n(idx_O)*n(idx_CH) &
        +k(3258)*n(idx_C)*n(idx_NO) &
        +k(3261)*n(idx_C)*n(idx_O2) &
        +k(3267)*n(idx_C)*n(idx_SO) &
        +k(3329)*n(idx_C)*n(idx_CO) &
        +k(3332)*n(idx_H)*n(idx_HCO) &
        +k(3341)*n(idx_H)*n(idx_OH) &
        +k(3345)*n(idx_H)*n(idx_NO) &
        +k(3348)*n(idx_H)*n(idx_HNO) &
        +k(3350)*n(idx_H)*n(idx_O2) &
        +k(3353)*n(idx_H)*n(idx_O2H) &
        -k(3365)*n(idx_H2)*n(idx_O) &
        +k(3376)*n(idx_N)*n(idx_NO) &
        +k(3379)*n(idx_N)*n(idx_O2) &
        +k(3381)*n(idx_N)*n(idx_PO) &
        +k(3392)*n(idx_N)*n(idx_NO2) &
        -k(3431)*n(idx_O)*n(idx_C2) &
        -k(3432)*n(idx_O)*n(idx_CCL) &
        -k(3433)*n(idx_O)*n(idx_CCL) &
        -k(3434)*n(idx_O)*n(idx_CH) &
        -k(3435)*n(idx_O)*n(idx_CLO) &
        -k(3436)*n(idx_O)*n(idx_CN) &
        -k(3437)*n(idx_O)*n(idx_CP) &
        -k(3438)*n(idx_O)*n(idx_CS) &
        -k(3439)*n(idx_O)*n(idx_HS) &
        -k(3440)*n(idx_O)*n(idx_NH) &
        -k(3441)*n(idx_O)*n(idx_NH) &
        -k(3442)*n(idx_O)*n(idx_NS) &
        -k(3443)*n(idx_O)*n(idx_NS) &
        -k(3444)*n(idx_O)*n(idx_OH) &
        -k(3445)*n(idx_O)*n(idx_PH) &
        -k(3446)*n(idx_O)*n(idx_S2) &
        -k(3447)*n(idx_O)*n(idx_SIC) &
        -k(3448)*n(idx_O)*n(idx_SIC) &
        -k(3449)*n(idx_O)*n(idx_SIH) &
        -k(3450)*n(idx_O)*n(idx_SIN) &
        -k(3451)*n(idx_O)*n(idx_SIN) &
        -k(3452)*n(idx_O)*n(idx_C2H) &
        -k(3453)*n(idx_O)*n(idx_C2N) &
        -k(3454)*n(idx_O)*n(idx_CCO) &
        -k(3455)*n(idx_O)*n(idx_CCP) &
        -k(3456)*n(idx_O)*n(idx_CH2) &
        -k(3457)*n(idx_O)*n(idx_CH2) &
        -k(3458)*n(idx_O)*n(idx_HCO) &
        -k(3459)*n(idx_O)*n(idx_HCO) &
        -k(3460)*n(idx_O)*n(idx_HCN) &
        -k(3461)*n(idx_O)*n(idx_HCP) &
        -k(3462)*n(idx_O)*n(idx_HCS) &
        -k(3463)*n(idx_O)*n(idx_HCS) &
        -k(3464)*n(idx_O)*n(idx_HCSI) &
        -k(3465)*n(idx_O)*n(idx_H2S) &
        -k(3466)*n(idx_O)*n(idx_HNO) &
        -k(3467)*n(idx_O)*n(idx_HNO) &
        -k(3468)*n(idx_O)*n(idx_HPO) &
        -k(3469)*n(idx_O)*n(idx_NH2) &
        -k(3470)*n(idx_O)*n(idx_NH2) &
        -k(3471)*n(idx_O)*n(idx_NH2) &
        -k(3472)*n(idx_O)*n(idx_NO2) &
        -k(3473)*n(idx_O)*n(idx_O2H) &
        -k(3474)*n(idx_O)*n(idx_OCN) &
        -k(3475)*n(idx_O)*n(idx_OCN) &
        -k(3476)*n(idx_O)*n(idx_PH2) &
        -k(3477)*n(idx_O)*n(idx_PH2) &
        -k(3478)*n(idx_O)*n(idx_C3) &
        -k(3479)*n(idx_O)*n(idx_SIC2) &
        -k(3480)*n(idx_O)*n(idx_SIH2) &
        -k(3481)*n(idx_O)*n(idx_SIH2) &
        -k(3482)*n(idx_O)*n(idx_SINC) &
        -k(3483)*n(idx_O)*n(idx_C2H3) &
        -k(3484)*n(idx_O)*n(idx_C2H5) &
        -k(3485)*n(idx_O)*n(idx_C2H5) &
        -k(3486)*n(idx_O)*n(idx_C3H) &
        -k(3487)*n(idx_O)*n(idx_HC3) &
        -k(3488)*n(idx_O)*n(idx_C3N) &
        -k(3489)*n(idx_O)*n(idx_C3O) &
        -k(3490)*n(idx_O)*n(idx_C3P) &
        -k(3491)*n(idx_O)*n(idx_C4) &
        -k(3492)*n(idx_O)*n(idx_CH3) &
        -k(3493)*n(idx_O)*n(idx_H2CN) &
        -k(3494)*n(idx_O)*n(idx_HCCP) &
        -k(3495)*n(idx_O)*n(idx_SIC3) &
        -k(3496)*n(idx_O)*n(idx_SIH3) &
        -k(3497)*n(idx_O)*n(idx_H2C3) &
        -k(3498)*n(idx_O)*n(idx_C5) &
        -k(3499)*n(idx_O)*n(idx_C4H) &
        -k(3500)*n(idx_O)*n(idx_C4H) &
        -k(3501)*n(idx_O)*n(idx_C4N) &
        -k(3502)*n(idx_O)*n(idx_C4P) &
        -k(3503)*n(idx_O)*n(idx_CH2PH) &
        -k(3504)*n(idx_O)*n(idx_SIC4) &
        -k(3505)*n(idx_O)*n(idx_C5H) &
        -k(3506)*n(idx_O)*n(idx_C5N) &
        -k(3507)*n(idx_O)*n(idx_C6) &
        -k(3508)*n(idx_O)*n(idx_C6H) &
        -k(3509)*n(idx_O)*n(idx_C7) &
        -k(3510)*n(idx_O)*n(idx_C7H) &
        -k(3511)*n(idx_O)*n(idx_C7N) &
        -k(3512)*n(idx_O)*n(idx_C8) &
        -k(3513)*n(idx_O)*n(idx_C8H) &
        -k(3514)*n(idx_O)*n(idx_C9) &
        -k(3515)*n(idx_O)*n(idx_C9H) &
        -k(3516)*n(idx_O)*n(idx_C9N) &
        -k(3517)*n(idx_O)*n(idx_C10) &
        -k(3518)*n(idx_O)*n(idx_C11) &
        +k(3523)*n(idx_S)*n(idx_O2) &
        +k(3528)*n(idx_SI)*n(idx_O2) &
        +k(3542)*n(idx_F)*n(idx_OH) &
        +k(3544)*n(idx_CH)*n(idx_NO) &
        +k(3572)*n(idx_CN)*n(idx_O2) &
        +k(3575)*n(idx_CN)*n(idx_OH) &
        +k(3597)*n(idx_OH)*n(idx_OH) &
        +k(3603)*n(idx_OH)*n(idx_NH2) &
        -k(3644)*n(idx_C)*n(idx_O) &
        -k(3646)*n(idx_H)*n(idx_O) &
        -2.d0*k(3647)*n(idx_O)*n(idx_O) &
        -k(3648)*n(idx_O)*n(idx_SO) &
        +k(3661)*n(idx_CLOj)*n(idx_E) &
        +k(3663)*n(idx_COj)*n(idx_E) &
        +k(3673)*n(idx_NOj)*n(idx_E) &
        +2.d0*k(3675)*n(idx_O2j)*n(idx_E) &
        +k(3676)*n(idx_OHj)*n(idx_E) &
        +k(3679)*n(idx_POj)*n(idx_E) &
        +k(3684)*n(idx_SIOj)*n(idx_E) &
        +k(3687)*n(idx_SOj)*n(idx_E) &
        +k(3705)*n(idx_CO2j)*n(idx_E) &
        +k(3710)*n(idx_H2Oj)*n(idx_E) &
        +k(3712)*n(idx_H2Oj)*n(idx_E) &
        +k(3720)*n(idx_HCOj)*n(idx_E) &
        +k(3733)*n(idx_HPOj)*n(idx_E) &
        +k(3747)*n(idx_NO2j)*n(idx_E) &
        +k(3750)*n(idx_OCSj)*n(idx_E) &
        +k(3762)*n(idx_SO2j)*n(idx_E) &
        +k(3770)*n(idx_C2HOj)*n(idx_E) &
        +k(3813)*n(idx_H3Oj)*n(idx_E) &
        +k(3818)*n(idx_HCO2j)*n(idx_E) &
        +k(3826)*n(idx_HSO2j)*n(idx_E) &
        +k(3855)*n(idx_C2H2Oj)*n(idx_E) &
        +k(3900)*n(idx_HC3Oj)*n(idx_E) &
        +k(3901)*n(idx_HC3Oj)*n(idx_E) &
        +k(4124)*n(idx_CH3OCH3j)*n(idx_E) &
        +k(4151)*n(idx_CH3OCH4j)*n(idx_E) &
        +k(4202)*n(idx_Oj)*n(idx_E) &
        +k(4231)*n(idx_Oj)*n(idx_Ck) &
        +k(4232)*n(idx_Oj)*n(idx_Hk) &
        +k(4233)*n(idx_Oj)*n(idx_Sk) &
        -k(4248)*n(idx_O)*n(idx_E) &
        +k(4262)*n(idx_CLO) &
        +k(4264)*n(idx_CO) &
        +k(4273)*n(idx_NO) &
        +2.d0*k(4276)*n(idx_O2) &
        +k(4278)*n(idx_OH) &
        +k(4282)*n(idx_SIO) &
        +k(4284)*n(idx_SO) &
        +k(4293)*n(idx_CO2) &
        +k(4305)*n(idx_NO2) &
        +k(4306)*n(idx_OCN) &
        +k(4309)*n(idx_SO2) &
        +k(4416)*n(idx_OHj) &
        +k(4426)*n(idx_Ok) &
        -k(4435)*n(idx_O) &
        +k(4481)*n(idx_O_DUST)

    !S
    !S
    dn(idx_S) = &
        +k(10)*n(idx_Sj)*n(idx_GRAINk) &
        -k(24)*n(idx_S) &
        +k(34)*n(idx_CS) &
        +k(41)*n(idx_HS) &
        +k(48)*n(idx_NS) &
        +2.d0*k(55)*n(idx_S2) &
        +k(60)*n(idx_SIS) &
        +k(61)*n(idx_SO) &
        +k(73)*n(idx_H2S) &
        +k(85)*n(idx_HS2) &
        +k(94)*n(idx_OCS) &
        -k(205)*n(idx_Cj)*n(idx_S) &
        +k(232)*n(idx_Cj)*n(idx_SIS) &
        +k(235)*n(idx_Cj)*n(idx_SO) &
        +k(240)*n(idx_Cj)*n(idx_C2S) &
        +k(279)*n(idx_Cj)*n(idx_C3S) &
        +k(315)*n(idx_Cj)*n(idx_C4S) &
        -k(430)*n(idx_Hj)*n(idx_S) &
        +k(643)*n(idx_HEj)*n(idx_CS) &
        +k(657)*n(idx_HEj)*n(idx_NS) &
        +k(665)*n(idx_HEj)*n(idx_S2) &
        +k(673)*n(idx_HEj)*n(idx_SIS) &
        +k(674)*n(idx_HEj)*n(idx_SO) &
        +k(682)*n(idx_HEj)*n(idx_C2S) &
        +k(736)*n(idx_HEj)*n(idx_OCS) &
        +k(745)*n(idx_HEj)*n(idx_SO2) &
        +k(771)*n(idx_HEj)*n(idx_H2CS) &
        +k(1056)*n(idx_Sj)*n(idx_FE) &
        +k(1057)*n(idx_Sj)*n(idx_MG) &
        +k(1058)*n(idx_Sj)*n(idx_NA) &
        +k(1059)*n(idx_Sj)*n(idx_SI) &
        +k(1063)*n(idx_Sj)*n(idx_NO) &
        +k(1066)*n(idx_Sj)*n(idx_SIC) &
        +k(1067)*n(idx_Sj)*n(idx_SIH) &
        +k(1069)*n(idx_Sj)*n(idx_SIS) &
        +k(1074)*n(idx_Sj)*n(idx_H2S) &
        +k(1076)*n(idx_Sj)*n(idx_HCO) &
        +k(1084)*n(idx_Sj)*n(idx_NH3) &
        +k(1093)*n(idx_Sj)*n(idx_C4H2) &
        -k(1124)*n(idx_C2j)*n(idx_S) &
        -k(1125)*n(idx_C2j)*n(idx_S) &
        -k(1159)*n(idx_CHj)*n(idx_S) &
        -k(1160)*n(idx_CHj)*n(idx_S) &
        -k(1161)*n(idx_CHj)*n(idx_S) &
        -k(1208)*n(idx_CNj)*n(idx_S) &
        -k(1240)*n(idx_COj)*n(idx_S) &
        +k(1278)*n(idx_CSj)*n(idx_O) &
        -k(1344)*n(idx_HSj)*n(idx_S) &
        +k(1346)*n(idx_HSj)*n(idx_CH) &
        +k(1348)*n(idx_HSj)*n(idx_H2O) &
        +k(1350)*n(idx_HSj)*n(idx_H2S) &
        +k(1351)*n(idx_HSj)*n(idx_HCN) &
        +k(1352)*n(idx_HSj)*n(idx_HNC) &
        +k(1354)*n(idx_HSj)*n(idx_NH3) &
        -k(1364)*n(idx_N2j)*n(idx_S) &
        -k(1396)*n(idx_NHj)*n(idx_S) &
        -k(1397)*n(idx_NHj)*n(idx_S) &
        -k(1398)*n(idx_NHj)*n(idx_S) &
        +k(1439)*n(idx_NSj)*n(idx_O) &
        -k(1446)*n(idx_O2j)*n(idx_S) &
        -k(1447)*n(idx_O2j)*n(idx_S) &
        -k(1471)*n(idx_OHj)*n(idx_S) &
        -k(1472)*n(idx_OHj)*n(idx_S) &
        -k(1473)*n(idx_OHj)*n(idx_S) &
        -k(1546)*n(idx_SIOj)*n(idx_S) &
        -k(1566)*n(idx_C2Hj)*n(idx_S) &
        -k(1607)*n(idx_CH2j)*n(idx_S) &
        -k(1662)*n(idx_H2Oj)*n(idx_S) &
        -k(1663)*n(idx_H2Oj)*n(idx_S) &
        -k(1664)*n(idx_H2Oj)*n(idx_S) &
        -k(1704)*n(idx_H2Sj)*n(idx_S) &
        -k(1721)*n(idx_H3j)*n(idx_S) &
        -k(1876)*n(idx_HCNj)*n(idx_S) &
        -k(1877)*n(idx_HCNj)*n(idx_S) &
        -k(1906)*n(idx_HCOj)*n(idx_S) &
        +k(2037)*n(idx_HCSj)*n(idx_O) &
        -k(2041)*n(idx_HNCj)*n(idx_S) &
        -k(2042)*n(idx_HNCj)*n(idx_S) &
        -k(2061)*n(idx_HNOj)*n(idx_S) &
        -k(2087)*n(idx_N2Hj)*n(idx_S) &
        -k(2114)*n(idx_NH2j)*n(idx_S) &
        -k(2115)*n(idx_NH2j)*n(idx_S) &
        -k(2116)*n(idx_NH2j)*n(idx_S) &
        +k(2137)*n(idx_NH2j)*n(idx_H2S) &
        -k(2151)*n(idx_O2Hj)*n(idx_S) &
        -k(2181)*n(idx_SIH2j)*n(idx_S) &
        -k(2310)*n(idx_CH2SIj)*n(idx_S) &
        -k(2322)*n(idx_CH3j)*n(idx_S) &
        -k(2403)*n(idx_H2COj)*n(idx_S) &
        -k(2404)*n(idx_H2COj)*n(idx_S) &
        -k(2550)*n(idx_C2H3j)*n(idx_S) &
        -k(2620)*n(idx_C3H2j)*n(idx_S) &
        -k(2621)*n(idx_H2C3j)*n(idx_S) &
        -k(2766)*n(idx_C2H4j)*n(idx_S) &
        -k(2818)*n(idx_C3H3j)*n(idx_S) &
        -k(2819)*n(idx_H3C3j)*n(idx_S) &
        -k(2877)*n(idx_C4H2j)*n(idx_S) &
        -k(2913)*n(idx_CH5j)*n(idx_S) &
        -k(2970)*n(idx_C4H3j)*n(idx_S) &
        +k(3260)*n(idx_C)*n(idx_NS) &
        +k(3264)*n(idx_C)*n(idx_S2) &
        +k(3266)*n(idx_C)*n(idx_SO) &
        +k(3330)*n(idx_H)*n(idx_HS) &
        +k(3377)*n(idx_N)*n(idx_NS) &
        +k(3385)*n(idx_N)*n(idx_SO) &
        +k(3389)*n(idx_N)*n(idx_HCS) &
        +k(3438)*n(idx_O)*n(idx_CS) &
        +k(3442)*n(idx_O)*n(idx_NS) &
        +k(3446)*n(idx_O)*n(idx_S2) &
        -k(3519)*n(idx_S)*n(idx_C2) &
        -k(3520)*n(idx_S)*n(idx_CH) &
        -k(3521)*n(idx_S)*n(idx_NH) &
        -k(3522)*n(idx_S)*n(idx_HS) &
        -k(3523)*n(idx_S)*n(idx_O2) &
        -k(3524)*n(idx_S)*n(idx_OH) &
        -k(3525)*n(idx_S)*n(idx_CH2) &
        -k(3526)*n(idx_S)*n(idx_CH2) &
        -k(3527)*n(idx_S)*n(idx_CH3) &
        +k(3591)*n(idx_HS)*n(idx_HS) &
        -k(3610)*n(idx_C2H)*n(idx_S) &
        -k(3649)*n(idx_S)*n(idx_CO) &
        +k(3665)*n(idx_CSj)*n(idx_E) &
        +k(3670)*n(idx_HSj)*n(idx_E) &
        +k(3674)*n(idx_NSj)*n(idx_E) &
        +2.d0*k(3680)*n(idx_S2j)*n(idx_E) &
        +k(3685)*n(idx_SISj)*n(idx_E) &
        +k(3687)*n(idx_SOj)*n(idx_E) &
        +k(3694)*n(idx_C2Sj)*n(idx_E) &
        +k(3713)*n(idx_H2Sj)*n(idx_E) &
        +k(3724)*n(idx_HCSj)*n(idx_E) &
        +k(3749)*n(idx_OCSj)*n(idx_E) &
        +k(3754)*n(idx_S2Hj)*n(idx_E) &
        +k(3782)*n(idx_C3Sj)*n(idx_E) &
        +k(4203)*n(idx_Sj)*n(idx_E) &
        +k(4212)*n(idx_Cj)*n(idx_Sk) &
        +k(4215)*n(idx_FEj)*n(idx_Sk) &
        +k(4218)*n(idx_Hj)*n(idx_Sk) &
        +k(4221)*n(idx_HEj)*n(idx_Sk) &
        +k(4224)*n(idx_MGj)*n(idx_Sk) &
        +k(4227)*n(idx_Nj)*n(idx_Sk) &
        +k(4230)*n(idx_NAj)*n(idx_Sk) &
        +k(4233)*n(idx_Oj)*n(idx_Sk) &
        +k(4234)*n(idx_Sj)*n(idx_Ck) &
        +k(4235)*n(idx_Sj)*n(idx_Hk) &
        +2.d0*k(4236)*n(idx_Sj)*n(idx_Sk) &
        +k(4239)*n(idx_SIj)*n(idx_Sk) &
        -k(4249)*n(idx_S)*n(idx_E) &
        -k(4255)*n(idx_S) &
        +k(4265)*n(idx_CS) &
        +k(4269)*n(idx_HS) &
        +k(4275)*n(idx_NS) &
        +k(4283)*n(idx_SIS) &
        +k(4284)*n(idx_SO) &
        +k(4289)*n(idx_C2S) &
        +k(4307)*n(idx_OCS) &
        +k(4427)*n(idx_Sk)

    !SI
    !SI
    dn(idx_SI) = &
        +k(11)*n(idx_SIj)*n(idx_GRAINk) &
        -k(25)*n(idx_SI) &
        +k(56)*n(idx_SIC) &
        +k(57)*n(idx_SIH) &
        +k(58)*n(idx_SIN) &
        +k(59)*n(idx_SIO) &
        +k(60)*n(idx_SIS) &
        +k(80)*n(idx_HCSI) &
        +k(99)*n(idx_SINC) &
        -k(206)*n(idx_Cj)*n(idx_SI) &
        -k(431)*n(idx_Hj)*n(idx_SI) &
        -k(631)*n(idx_HEj)*n(idx_SI) &
        +k(666)*n(idx_HEj)*n(idx_SIC) &
        +k(670)*n(idx_HEj)*n(idx_SIO) &
        +k(672)*n(idx_HEj)*n(idx_SIS) &
        +k(742)*n(idx_HEj)*n(idx_SINC) &
        -k(1045)*n(idx_Pj)*n(idx_SI) &
        -k(1059)*n(idx_Sj)*n(idx_SI) &
        +k(1095)*n(idx_SIj)*n(idx_FE) &
        +k(1096)*n(idx_SIj)*n(idx_MG) &
        +k(1097)*n(idx_SIj)*n(idx_NA) &
        -k(1162)*n(idx_CHj)*n(idx_SI) &
        -k(1279)*n(idx_CSj)*n(idx_SI) &
        -k(1345)*n(idx_HSj)*n(idx_SI) &
        -k(1438)*n(idx_NOj)*n(idx_SI) &
        -k(1448)*n(idx_O2j)*n(idx_SI) &
        -k(1474)*n(idx_OHj)*n(idx_SI) &
        +k(1538)*n(idx_SIHj)*n(idx_NH3) &
        +k(1544)*n(idx_SIOj)*n(idx_N) &
        +k(1548)*n(idx_SIOj)*n(idx_CH) &
        -k(1665)*n(idx_H2Oj)*n(idx_SI) &
        -k(1705)*n(idx_H2Sj)*n(idx_SI) &
        -k(1722)*n(idx_H3j)*n(idx_SI) &
        -k(1907)*n(idx_HCOj)*n(idx_SI) &
        -k(2200)*n(idx_C2H2j)*n(idx_SI) &
        -k(2201)*n(idx_C2H2j)*n(idx_SI) &
        -k(2202)*n(idx_C2H2j)*n(idx_SI) &
        -k(2272)*n(idx_C3Hj)*n(idx_SI) &
        -k(2323)*n(idx_CH3j)*n(idx_SI) &
        -k(2324)*n(idx_CH3j)*n(idx_SI) &
        -k(2325)*n(idx_CH3j)*n(idx_SI) &
        -k(2391)*n(idx_HCNHj)*n(idx_SI) &
        -k(2405)*n(idx_H2COj)*n(idx_SI) &
        -k(2426)*n(idx_H2NCj)*n(idx_SI) &
        -k(2430)*n(idx_H3Oj)*n(idx_SI) &
        -k(2514)*n(idx_NH3j)*n(idx_SI) &
        -k(2551)*n(idx_C2H3j)*n(idx_SI) &
        -k(2552)*n(idx_C2H3j)*n(idx_SI) &
        -k(2622)*n(idx_C3H2j)*n(idx_SI) &
        -k(2623)*n(idx_H2C3j)*n(idx_SI) &
        -k(2624)*n(idx_C3H2j)*n(idx_SI) &
        -k(2625)*n(idx_H2C3j)*n(idx_SI) &
        -k(2767)*n(idx_C2H4j)*n(idx_SI) &
        -k(2768)*n(idx_C2H4j)*n(idx_SI) &
        -k(2820)*n(idx_C3H3j)*n(idx_SI) &
        -k(2821)*n(idx_H3C3j)*n(idx_SI) &
        -k(2822)*n(idx_C3H3j)*n(idx_SI) &
        -k(2823)*n(idx_H3C3j)*n(idx_SI) &
        -k(2878)*n(idx_C4H2j)*n(idx_SI) &
        -k(2879)*n(idx_C4H2j)*n(idx_SI) &
        -k(2914)*n(idx_CH5j)*n(idx_SI) &
        -k(2915)*n(idx_CH5j)*n(idx_SI) &
        +k(3382)*n(idx_N)*n(idx_SIC) &
        +k(3447)*n(idx_O)*n(idx_SIC) &
        +k(3450)*n(idx_O)*n(idx_SIN) &
        -k(3528)*n(idx_SI)*n(idx_O2) &
        -k(3529)*n(idx_SI)*n(idx_NO) &
        -k(3530)*n(idx_SI)*n(idx_OH) &
        -k(3531)*n(idx_SI)*n(idx_CH2) &
        -k(3532)*n(idx_SI)*n(idx_CH3) &
        -k(3533)*n(idx_SI)*n(idx_C2H2) &
        -k(3534)*n(idx_SI)*n(idx_C3H4) &
        -k(3535)*n(idx_SI)*n(idx_C4H2) &
        -k(3536)*n(idx_SI)*n(idx_C6H2) &
        -k(3537)*n(idx_SI)*n(idx_C8H2) &
        -k(3538)*n(idx_SI)*n(idx_C2H4) &
        -k(3539)*n(idx_SI)*n(idx_C3H6) &
        +k(3681)*n(idx_SICj)*n(idx_E) &
        +k(3682)*n(idx_SIHj)*n(idx_E) &
        +k(3683)*n(idx_SINj)*n(idx_E) &
        +k(3684)*n(idx_SIOj)*n(idx_E) &
        +k(3685)*n(idx_SISj)*n(idx_E) &
        +k(3686)*n(idx_SIFj)*n(idx_E) &
        +k(3702)*n(idx_CHSIj)*n(idx_E) &
        +k(3728)*n(idx_HNSIj)*n(idx_E) &
        +k(3735)*n(idx_HSIOj)*n(idx_E) &
        +k(3737)*n(idx_HSISj)*n(idx_E) &
        +k(3756)*n(idx_SIC2j)*n(idx_E) &
        +k(3758)*n(idx_SIH2j)*n(idx_E) &
        +k(3759)*n(idx_SIH2j)*n(idx_E) &
        +k(3761)*n(idx_SINCj)*n(idx_E) &
        +k(3785)*n(idx_CH2SIj)*n(idx_E) &
        +k(3840)*n(idx_SIC2Hj)*n(idx_E) &
        +k(3921)*n(idx_SIC3Hj)*n(idx_E) &
        +k(3922)*n(idx_SIC3Hj)*n(idx_E) &
        +k(4204)*n(idx_SIj)*n(idx_E) &
        +k(4237)*n(idx_SIj)*n(idx_Ck) &
        +k(4238)*n(idx_SIj)*n(idx_Hk) &
        +k(4239)*n(idx_SIj)*n(idx_Sk) &
        -k(4256)*n(idx_SI) &
        +k(4280)*n(idx_SIC) &
        +k(4281)*n(idx_SIH) &
        +k(4282)*n(idx_SIO) &
        +k(4283)*n(idx_SIS) &
        +k(4405)*n(idx_SIC4H) &
        +k(4406)*n(idx_SIC6H) &
        +k(4407)*n(idx_SIC8H)

    !H2
    !H2
    dn(idx_H2) = &
        +k(12)*n(idx_H3j)*n(idx_GRAINk) &
        -k(35)*n(idx_H2) &
        -k(36)*n(idx_H2) &
        -k(37)*n(idx_H2) &
        -k(38)*n(idx_H2) &
        +k(73)*n(idx_H2S) &
        +k(113)*n(idx_H2CO) &
        +k(114)*n(idx_H2CS) &
        +k(117)*n(idx_H2SIO) &
        +k(119)*n(idx_NH3) &
        +k(124)*n(idx_SICH2) &
        +k(139)*n(idx_CH2PH) &
        +k(140)*n(idx_CH3N) &
        +k(141)*n(idx_CH4) &
        +k(143)*n(idx_SIC2H2) &
        +k(147)*n(idx_SIH4) &
        +k(150)*n(idx_C2H4) &
        +k(161)*n(idx_CH3OH) &
        +k(174)*n(idx_CH5N) &
        +k(267)*n(idx_Cj)*n(idx_SIH2) &
        +k(280)*n(idx_Cj)*n(idx_CH3) &
        +k(290)*n(idx_Cj)*n(idx_NH3) &
        +k(296)*n(idx_Cj)*n(idx_SICH2) &
        +k(299)*n(idx_Cj)*n(idx_SIH3) &
        +k(304)*n(idx_Cj)*n(idx_C2H3) &
        +k(308)*n(idx_Cj)*n(idx_C3H2) &
        +k(309)*n(idx_Cj)*n(idx_H2C3) &
        +k(316)*n(idx_Cj)*n(idx_CH2PH) &
        +k(318)*n(idx_Cj)*n(idx_CH4) &
        +k(339)*n(idx_Cj)*n(idx_SICH3) &
        +k(342)*n(idx_Cj)*n(idx_SIH4) &
        +k(346)*n(idx_Cj)*n(idx_C2H4) &
        +k(348)*n(idx_Cj)*n(idx_C2H4) &
        +k(349)*n(idx_Cj)*n(idx_C2H4) &
        +k(352)*n(idx_Cj)*n(idx_C3H3) &
        +k(357)*n(idx_Cj)*n(idx_C4H2) &
        +k(372)*n(idx_Cj)*n(idx_C2H5) &
        +k(373)*n(idx_Cj)*n(idx_C2H5) &
        +k(380)*n(idx_Cj)*n(idx_C3H4) &
        +k(383)*n(idx_Cj)*n(idx_C4H3) &
        +k(387)*n(idx_Cj)*n(idx_C5H2) &
        +k(394)*n(idx_Cj)*n(idx_C6H2) &
        +k(403)*n(idx_Cj)*n(idx_C7H2) &
        +k(407)*n(idx_Cj)*n(idx_CH3C4H) &
        +k(412)*n(idx_Cj)*n(idx_C8H2) &
        +k(416)*n(idx_Cj)*n(idx_C9H2) &
        +k(418)*n(idx_Cj)*n(idx_CH3C6H) &
        -k(421)*n(idx_CLj)*n(idx_H2) &
        -k(424)*n(idx_Fj)*n(idx_H2) &
        +k(437)*n(idx_Hj)*n(idx_HS) &
        +k(439)*n(idx_Hj)*n(idx_MGH) &
        +k(440)*n(idx_Hj)*n(idx_NAH) &
        +k(451)*n(idx_Hj)*n(idx_SIH) &
        +k(457)*n(idx_Hj)*n(idx_C2H) &
        +k(464)*n(idx_Hj)*n(idx_CH2) &
        +k(470)*n(idx_Hj)*n(idx_HCO) &
        +k(474)*n(idx_Hj)*n(idx_HCS) &
        +k(475)*n(idx_Hj)*n(idx_HCSI) &
        +k(478)*n(idx_Hj)*n(idx_HNO) &
        +k(479)*n(idx_Hj)*n(idx_HNSI) &
        +k(488)*n(idx_Hj)*n(idx_SIH2) &
        +k(491)*n(idx_Hj)*n(idx_C2H2) &
        +k(493)*n(idx_Hj)*n(idx_C3H) &
        +k(494)*n(idx_Hj)*n(idx_HC3) &
        +k(501)*n(idx_Hj)*n(idx_H2CO) &
        +k(505)*n(idx_Hj)*n(idx_H2SIO) &
        +k(509)*n(idx_Hj)*n(idx_SIC2H) &
        +k(512)*n(idx_Hj)*n(idx_SICH2) &
        +k(514)*n(idx_Hj)*n(idx_SIH3) &
        +k(518)*n(idx_Hj)*n(idx_C2H3) &
        +k(520)*n(idx_Hj)*n(idx_C3H2) &
        +k(521)*n(idx_Hj)*n(idx_H2C3) &
        +k(524)*n(idx_Hj)*n(idx_C4H) &
        +k(529)*n(idx_Hj)*n(idx_CH2O2) &
        +k(532)*n(idx_Hj)*n(idx_CH3N) &
        +k(533)*n(idx_Hj)*n(idx_CH4) &
        +k(537)*n(idx_Hj)*n(idx_HCNC2) &
        +k(541)*n(idx_Hj)*n(idx_HC2NC) &
        +k(546)*n(idx_Hj)*n(idx_HNC3) &
        +k(551)*n(idx_Hj)*n(idx_SIC2H2) &
        +k(553)*n(idx_Hj)*n(idx_SIC3H) &
        +k(556)*n(idx_Hj)*n(idx_SICH3) &
        +k(558)*n(idx_Hj)*n(idx_SIH4) &
        +k(560)*n(idx_Hj)*n(idx_CH3CN) &
        +k(562)*n(idx_Hj)*n(idx_C2H4) &
        +k(564)*n(idx_Hj)*n(idx_C3H3) &
        +k(565)*n(idx_Hj)*n(idx_C3H3) &
        +k(568)*n(idx_Hj)*n(idx_C4H2) &
        +k(570)*n(idx_Hj)*n(idx_C5H) &
        +k(573)*n(idx_Hj)*n(idx_CH3OH) &
        +k(579)*n(idx_Hj)*n(idx_C2H4O) &
        +k(581)*n(idx_Hj)*n(idx_C2H5) &
        +k(583)*n(idx_Hj)*n(idx_C3H3N) &
        +k(585)*n(idx_Hj)*n(idx_C3H4) &
        +k(586)*n(idx_Hj)*n(idx_C3H4) &
        +k(589)*n(idx_Hj)*n(idx_C4H3) &
        +k(590)*n(idx_Hj)*n(idx_C5H2) &
        +k(592)*n(idx_Hj)*n(idx_C6H) &
        +k(595)*n(idx_Hj)*n(idx_CH5N) &
        +k(598)*n(idx_Hj)*n(idx_C6H2) &
        +k(600)*n(idx_Hj)*n(idx_C7H) &
        +k(605)*n(idx_Hj)*n(idx_C2H5OH) &
        +k(607)*n(idx_Hj)*n(idx_C7H2) &
        +k(609)*n(idx_Hj)*n(idx_C8H) &
        +k(612)*n(idx_Hj)*n(idx_CH3C4H) &
        +k(614)*n(idx_Hj)*n(idx_CH3OCH3) &
        +k(618)*n(idx_Hj)*n(idx_C8H2) &
        +k(620)*n(idx_Hj)*n(idx_C9H) &
        +k(623)*n(idx_Hj)*n(idx_C9H2) &
        +k(625)*n(idx_Hj)*n(idx_CH3C6H) &
        -k(645)*n(idx_HEj)*n(idx_H2) &
        -k(646)*n(idx_HEj)*n(idx_H2) &
        +k(689)*n(idx_HEj)*n(idx_CH2) &
        +k(699)*n(idx_HEj)*n(idx_H2S) &
        +k(730)*n(idx_HEj)*n(idx_NH2) &
        +k(738)*n(idx_HEj)*n(idx_PH2) &
        +k(740)*n(idx_HEj)*n(idx_SIH2) &
        +k(748)*n(idx_HEj)*n(idx_C2H2) &
        +k(765)*n(idx_HEj)*n(idx_CH3) &
        +k(767)*n(idx_HEj)*n(idx_H2CO) &
        +k(770)*n(idx_HEj)*n(idx_H2CS) &
        +k(777)*n(idx_HEj)*n(idx_NH3) &
        +k(785)*n(idx_HEj)*n(idx_SIH3) &
        +k(790)*n(idx_HEj)*n(idx_C2H3) &
        +k(792)*n(idx_HEj)*n(idx_C3H2) &
        +k(793)*n(idx_HEj)*n(idx_H2C3) &
        +k(810)*n(idx_HEj)*n(idx_CH3N) &
        +k(813)*n(idx_HEj)*n(idx_CH4) &
        +k(814)*n(idx_HEj)*n(idx_CH4) &
        +k(847)*n(idx_HEj)*n(idx_SIH4) &
        +k(851)*n(idx_HEj)*n(idx_C2H4) &
        +k(853)*n(idx_HEj)*n(idx_C2H4) &
        +k(856)*n(idx_HEj)*n(idx_C3H3) &
        +k(857)*n(idx_HEj)*n(idx_C3H3) &
        +k(861)*n(idx_HEj)*n(idx_C4H2) &
        +k(877)*n(idx_HEj)*n(idx_C2H4O) &
        +k(879)*n(idx_HEj)*n(idx_C2H5) &
        +2.d0*k(883)*n(idx_HEj)*n(idx_C3H4) &
        +k(884)*n(idx_HEj)*n(idx_C3H4) &
        +k(885)*n(idx_HEj)*n(idx_C3H4) &
        +k(886)*n(idx_HEj)*n(idx_C3H4) &
        +k(895)*n(idx_HEj)*n(idx_C5H2) &
        +k(903)*n(idx_HEj)*n(idx_CH5N) &
        +k(909)*n(idx_HEj)*n(idx_C6H2) &
        +2.d0*k(918)*n(idx_HEj)*n(idx_C2H5OH) &
        +k(919)*n(idx_HEj)*n(idx_C2H5OH) &
        +k(920)*n(idx_HEj)*n(idx_C2H5OH) &
        +k(924)*n(idx_HEj)*n(idx_C7H2) &
        +k(930)*n(idx_HEj)*n(idx_CH3C4H) &
        +k(937)*n(idx_HEj)*n(idx_C8H2) &
        +k(944)*n(idx_HEj)*n(idx_C9H2) &
        +k(946)*n(idx_HEj)*n(idx_CH3C6H) &
        -k(962)*n(idx_Nj)*n(idx_H2) &
        +k(989)*n(idx_Nj)*n(idx_NH3) &
        +k(992)*n(idx_Nj)*n(idx_CH4) &
        +k(996)*n(idx_Nj)*n(idx_CH4) &
        -k(1010)*n(idx_Oj)*n(idx_H2) &
        +k(1048)*n(idx_Pj)*n(idx_H2O) &
        +k(1054)*n(idx_Pj)*n(idx_CH4) &
        +k(1055)*n(idx_Pj)*n(idx_C2H4) &
        +k(1072)*n(idx_Sj)*n(idx_H2S) &
        +k(1085)*n(idx_Sj)*n(idx_C2H3) &
        +k(1110)*n(idx_SIj)*n(idx_CH3) &
        +k(1120)*n(idx_SIj)*n(idx_C3H4) &
        -k(1129)*n(idx_C2j)*n(idx_H2) &
        +k(1147)*n(idx_C2j)*n(idx_CH4) &
        +k(1148)*n(idx_C2j)*n(idx_CH4) &
        +k(1149)*n(idx_C2j)*n(idx_CH4) &
        +k(1154)*n(idx_CHj)*n(idx_H) &
        +k(1164)*n(idx_CHj)*n(idx_CH) &
        -k(1167)*n(idx_CHj)*n(idx_H2) &
        +k(1168)*n(idx_CHj)*n(idx_NH) &
        +k(1173)*n(idx_CHj)*n(idx_OH) &
        +k(1174)*n(idx_CHj)*n(idx_C2H) &
        +k(1175)*n(idx_CHj)*n(idx_CH2) &
        +k(1177)*n(idx_CHj)*n(idx_H2O) &
        +k(1180)*n(idx_CHj)*n(idx_H2S) &
        +k(1182)*n(idx_CHj)*n(idx_HCN) &
        +k(1188)*n(idx_CHj)*n(idx_NH2) &
        +k(1196)*n(idx_CHj)*n(idx_NH3) &
        +k(1199)*n(idx_CHj)*n(idx_CH4) &
        +k(1200)*n(idx_CHj)*n(idx_CH4) &
        -k(1212)*n(idx_CNj)*n(idx_H2) &
        -k(1244)*n(idx_COj)*n(idx_H2) &
        -k(1273)*n(idx_CPj)*n(idx_H2) &
        -k(1280)*n(idx_CSj)*n(idx_H2) &
        +k(1284)*n(idx_H2j)*n(idx_H) &
        +k(1287)*n(idx_H2j)*n(idx_C2) &
        +k(1289)*n(idx_H2j)*n(idx_CH) &
        +k(1291)*n(idx_H2j)*n(idx_CN) &
        +k(1293)*n(idx_H2j)*n(idx_CO) &
        -k(1295)*n(idx_H2j)*n(idx_H2) &
        +k(1297)*n(idx_H2j)*n(idx_NH) &
        +k(1299)*n(idx_H2j)*n(idx_NO) &
        +k(1301)*n(idx_H2j)*n(idx_O2) &
        +k(1303)*n(idx_H2j)*n(idx_OH) &
        +k(1305)*n(idx_H2j)*n(idx_C2H) &
        +k(1307)*n(idx_H2j)*n(idx_CH2) &
        +k(1310)*n(idx_H2j)*n(idx_CO2) &
        +k(1312)*n(idx_H2j)*n(idx_H2O) &
        +2.d0*k(1314)*n(idx_H2j)*n(idx_H2S) &
        +k(1315)*n(idx_H2j)*n(idx_H2S) &
        +k(1316)*n(idx_H2j)*n(idx_H2S) &
        +k(1317)*n(idx_H2j)*n(idx_HCN) &
        +k(1319)*n(idx_H2j)*n(idx_HCO) &
        +k(1320)*n(idx_H2j)*n(idx_NH2) &
        +k(1321)*n(idx_H2j)*n(idx_C2H2) &
        +k(1323)*n(idx_H2j)*n(idx_H2CO) &
        +k(1324)*n(idx_H2j)*n(idx_H2CO) &
        +k(1325)*n(idx_H2j)*n(idx_NH3) &
        +k(1326)*n(idx_H2j)*n(idx_CH4) &
        +k(1327)*n(idx_H2j)*n(idx_CH4) &
        +2.d0*k(1329)*n(idx_H2j)*n(idx_C2H4) &
        +k(1330)*n(idx_H2j)*n(idx_C2H4) &
        +k(1331)*n(idx_H2j)*n(idx_C2H4) &
        -k(1332)*n(idx_HCLj)*n(idx_H2) &
        -k(1333)*n(idx_HFj)*n(idx_H2) &
        -k(1335)*n(idx_HEHj)*n(idx_H2) &
        +k(1338)*n(idx_HSj)*n(idx_H) &
        +k(1349)*n(idx_HSj)*n(idx_H2S) &
        +k(1355)*n(idx_HSj)*n(idx_CH4) &
        -k(1369)*n(idx_N2j)*n(idx_H2) &
        +k(1379)*n(idx_N2j)*n(idx_H2S) &
        +k(1391)*n(idx_N2j)*n(idx_CH4) &
        -k(1406)*n(idx_NHj)*n(idx_H2) &
        -k(1407)*n(idx_NHj)*n(idx_H2) &
        +k(1422)*n(idx_NHj)*n(idx_H2O) &
        -k(1481)*n(idx_OHj)*n(idx_H2) &
        +k(1515)*n(idx_PHj)*n(idx_H2O) &
        +k(1520)*n(idx_PHj)*n(idx_NH3) &
        +k(1523)*n(idx_PHj)*n(idx_CH4) &
        +k(1526)*n(idx_PHj)*n(idx_C2H4) &
        -k(1533)*n(idx_SICj)*n(idx_H2) &
        +k(1535)*n(idx_SIHj)*n(idx_H) &
        -k(1550)*n(idx_SIOj)*n(idx_H2) &
        -k(1555)*n(idx_SISj)*n(idx_H2) &
        -k(1570)*n(idx_C2Hj)*n(idx_H2) &
        +k(1586)*n(idx_C2Hj)*n(idx_NH3) &
        +k(1589)*n(idx_C2Hj)*n(idx_CH4) &
        +k(1590)*n(idx_C2Hj)*n(idx_CH4) &
        -k(1592)*n(idx_C2Nj)*n(idx_H2) &
        +k(1594)*n(idx_C2Nj)*n(idx_CH4) &
        -k(1602)*n(idx_C3j)*n(idx_H2) &
        -k(1610)*n(idx_CH2j)*n(idx_H2) &
        +k(1621)*n(idx_CH2j)*n(idx_H2S) &
        +k(1626)*n(idx_CH2j)*n(idx_NH2) &
        +k(1630)*n(idx_CH2j)*n(idx_H2CO) &
        +k(1634)*n(idx_CH2j)*n(idx_CH4) &
        -k(1636)*n(idx_CHSIj)*n(idx_H2) &
        -k(1645)*n(idx_CO2j)*n(idx_H2) &
        +k(1661)*n(idx_H2Oj)*n(idx_O) &
        -k(1671)*n(idx_H2Oj)*n(idx_H2) &
        +k(1698)*n(idx_H2Sj)*n(idx_H) &
        +k(1700)*n(idx_H2Sj)*n(idx_N) &
        +k(1703)*n(idx_H2Sj)*n(idx_O) &
        +k(1712)*n(idx_H3j)*n(idx_C) &
        +k(1713)*n(idx_H3j)*n(idx_CL) &
        +k(1714)*n(idx_H3j)*n(idx_FE) &
        +k(1715)*n(idx_H3j)*n(idx_MG) &
        +k(1718)*n(idx_H3j)*n(idx_NA) &
        +k(1719)*n(idx_H3j)*n(idx_O) &
        +k(1720)*n(idx_H3j)*n(idx_P) &
        +k(1721)*n(idx_H3j)*n(idx_S) &
        +k(1722)*n(idx_H3j)*n(idx_SI) &
        +k(1723)*n(idx_H3j)*n(idx_C2) &
        +k(1724)*n(idx_H3j)*n(idx_CH) &
        +k(1725)*n(idx_H3j)*n(idx_CN) &
        +k(1726)*n(idx_H3j)*n(idx_CO) &
        +k(1727)*n(idx_H3j)*n(idx_CO) &
        +k(1728)*n(idx_H3j)*n(idx_CP) &
        +k(1729)*n(idx_H3j)*n(idx_CS) &
        +k(1730)*n(idx_H3j)*n(idx_HCL) &
        +k(1731)*n(idx_H3j)*n(idx_HF) &
        +k(1732)*n(idx_H3j)*n(idx_HS) &
        +2.d0*k(1733)*n(idx_H3j)*n(idx_MGH) &
        +k(1734)*n(idx_H3j)*n(idx_N2) &
        +2.d0*k(1735)*n(idx_H3j)*n(idx_NAH) &
        +k(1736)*n(idx_H3j)*n(idx_NH) &
        +k(1737)*n(idx_H3j)*n(idx_NO) &
        +k(1738)*n(idx_H3j)*n(idx_NS) &
        +k(1739)*n(idx_H3j)*n(idx_O2) &
        +k(1740)*n(idx_H3j)*n(idx_OH) &
        +k(1741)*n(idx_H3j)*n(idx_PH) &
        +k(1742)*n(idx_H3j)*n(idx_PN) &
        +k(1743)*n(idx_H3j)*n(idx_PO) &
        +k(1744)*n(idx_H3j)*n(idx_S2) &
        +k(1745)*n(idx_H3j)*n(idx_SIC) &
        +k(1746)*n(idx_H3j)*n(idx_SIH) &
        +k(1747)*n(idx_H3j)*n(idx_SIN) &
        +k(1748)*n(idx_H3j)*n(idx_SIO) &
        +k(1749)*n(idx_H3j)*n(idx_SIS) &
        +k(1750)*n(idx_H3j)*n(idx_SO) &
        +k(1751)*n(idx_H3j)*n(idx_C2H) &
        +k(1752)*n(idx_H3j)*n(idx_C2N) &
        +k(1753)*n(idx_H3j)*n(idx_C2S) &
        +k(1754)*n(idx_H3j)*n(idx_C3) &
        +k(1755)*n(idx_H3j)*n(idx_CCO) &
        +k(1756)*n(idx_H3j)*n(idx_CCP) &
        +k(1757)*n(idx_H3j)*n(idx_CH2) &
        +k(1758)*n(idx_H3j)*n(idx_CO2) &
        +k(1759)*n(idx_H3j)*n(idx_H2O) &
        +k(1760)*n(idx_H3j)*n(idx_H2S) &
        +k(1761)*n(idx_H3j)*n(idx_HCN) &
        +k(1762)*n(idx_H3j)*n(idx_HCO) &
        +k(1763)*n(idx_H3j)*n(idx_HCP) &
        +k(1764)*n(idx_H3j)*n(idx_HCS) &
        +k(1765)*n(idx_H3j)*n(idx_HCSI) &
        +k(1766)*n(idx_H3j)*n(idx_HNC) &
        +k(1767)*n(idx_H3j)*n(idx_HNO) &
        +k(1768)*n(idx_H3j)*n(idx_HNSI) &
        +k(1769)*n(idx_H3j)*n(idx_HPO) &
        +k(1770)*n(idx_H3j)*n(idx_HS2) &
        +k(1771)*n(idx_H3j)*n(idx_NAOH) &
        +k(1772)*n(idx_H3j)*n(idx_NH2) &
        +k(1773)*n(idx_H3j)*n(idx_NO2) &
        +k(1774)*n(idx_H3j)*n(idx_OCS) &
        +k(1775)*n(idx_H3j)*n(idx_PH2) &
        +k(1776)*n(idx_H3j)*n(idx_SIC2) &
        +k(1777)*n(idx_H3j)*n(idx_SIH2) &
        +k(1778)*n(idx_H3j)*n(idx_SINC) &
        +k(1779)*n(idx_H3j)*n(idx_SIO2) &
        +k(1780)*n(idx_H3j)*n(idx_SO2) &
        +k(1781)*n(idx_H3j)*n(idx_C2H2) &
        +k(1782)*n(idx_H3j)*n(idx_C3H) &
        +k(1783)*n(idx_H3j)*n(idx_HC3) &
        +k(1784)*n(idx_H3j)*n(idx_C3N) &
        +k(1785)*n(idx_H3j)*n(idx_C3O) &
        +k(1786)*n(idx_H3j)*n(idx_C3P) &
        +k(1787)*n(idx_H3j)*n(idx_C3S) &
        +k(1788)*n(idx_H3j)*n(idx_C4) &
        +k(1789)*n(idx_H3j)*n(idx_CH3) &
        +k(1790)*n(idx_H3j)*n(idx_H2CO) &
        +k(1791)*n(idx_H3j)*n(idx_H2CS) &
        +k(1792)*n(idx_H3j)*n(idx_H2S2) &
        +k(1793)*n(idx_H3j)*n(idx_H2SIO) &
        +k(1794)*n(idx_H3j)*n(idx_HCCP) &
        +k(1795)*n(idx_H3j)*n(idx_NH3) &
        +k(1796)*n(idx_H3j)*n(idx_SIC2H) &
        +k(1797)*n(idx_H3j)*n(idx_SIC3) &
        +k(1798)*n(idx_H3j)*n(idx_SICH2) &
        +k(1799)*n(idx_H3j)*n(idx_SIH3) &
        +k(1800)*n(idx_H3j)*n(idx_CH2CN) &
        +k(1801)*n(idx_H3j)*n(idx_C2H2O) &
        +k(1802)*n(idx_H3j)*n(idx_C2H3) &
        +k(1803)*n(idx_H3j)*n(idx_C3H2) &
        +k(1804)*n(idx_H3j)*n(idx_H2C3) &
        +k(1805)*n(idx_H3j)*n(idx_C4H) &
        +k(1806)*n(idx_H3j)*n(idx_C4P) &
        +k(1807)*n(idx_H3j)*n(idx_C4S) &
        +k(1808)*n(idx_H3j)*n(idx_C5) &
        +k(1809)*n(idx_H3j)*n(idx_CH2O2) &
        +k(1810)*n(idx_H3j)*n(idx_CH2O2) &
        +k(1811)*n(idx_H3j)*n(idx_CH2PH) &
        +k(1812)*n(idx_H3j)*n(idx_CH3N) &
        +k(1813)*n(idx_H3j)*n(idx_CH4) &
        +k(1814)*n(idx_H3j)*n(idx_HCNC2) &
        +k(1815)*n(idx_H3j)*n(idx_HC2NC) &
        +k(1816)*n(idx_H3j)*n(idx_HC3N) &
        +k(1817)*n(idx_H3j)*n(idx_HNC3) &
        +k(1818)*n(idx_H3j)*n(idx_NH2CN) &
        +k(1819)*n(idx_H3j)*n(idx_SIC2H2) &
        +k(1820)*n(idx_H3j)*n(idx_SIC3H) &
        +k(1821)*n(idx_H3j)*n(idx_SIC4) &
        +k(1822)*n(idx_H3j)*n(idx_SICH3) &
        +k(1823)*n(idx_H3j)*n(idx_SIH4) &
        +k(1824)*n(idx_H3j)*n(idx_CH3CN) &
        +2.d0*k(1825)*n(idx_H3j)*n(idx_C2H4) &
        +k(1826)*n(idx_H3j)*n(idx_C2H4) &
        +k(1827)*n(idx_H3j)*n(idx_C3H3) &
        +k(1828)*n(idx_H3j)*n(idx_C4H2) &
        +k(1829)*n(idx_H3j)*n(idx_C5H) &
        +k(1830)*n(idx_H3j)*n(idx_C5N) &
        +k(1831)*n(idx_H3j)*n(idx_C6) &
        +k(1832)*n(idx_H3j)*n(idx_CH3OH) &
        +2.d0*k(1833)*n(idx_H3j)*n(idx_CH3OH) &
        +k(1834)*n(idx_H3j)*n(idx_CH3OH) &
        +k(1835)*n(idx_H3j)*n(idx_NH2CHO) &
        +k(1836)*n(idx_H3j)*n(idx_C2H4O) &
        +k(1837)*n(idx_H3j)*n(idx_C2H5) &
        +k(1838)*n(idx_H3j)*n(idx_C3H3N) &
        +2.d0*k(1839)*n(idx_H3j)*n(idx_C3H4) &
        +2.d0*k(1840)*n(idx_H3j)*n(idx_C3H4) &
        +k(1841)*n(idx_H3j)*n(idx_C3H4) &
        +k(1842)*n(idx_H3j)*n(idx_C4H3) &
        +k(1843)*n(idx_H3j)*n(idx_C5H2) &
        +k(1844)*n(idx_H3j)*n(idx_C6H) &
        +k(1845)*n(idx_H3j)*n(idx_C7) &
        +k(1846)*n(idx_H3j)*n(idx_CH5N) &
        +k(1847)*n(idx_H3j)*n(idx_HC5N) &
        +k(1848)*n(idx_H3j)*n(idx_C6H2) &
        +k(1849)*n(idx_H3j)*n(idx_C7H) &
        +k(1850)*n(idx_H3j)*n(idx_C7N) &
        +k(1851)*n(idx_H3j)*n(idx_C8) &
        +k(1852)*n(idx_H3j)*n(idx_CH3C3N) &
        +k(1853)*n(idx_H3j)*n(idx_HCOOCH3) &
        +k(1854)*n(idx_H3j)*n(idx_C2H5OH) &
        +k(1855)*n(idx_H3j)*n(idx_C2H5OH) &
        +k(1856)*n(idx_H3j)*n(idx_C2H5OH) &
        +k(1857)*n(idx_H3j)*n(idx_C7H2) &
        +k(1858)*n(idx_H3j)*n(idx_C8H) &
        +k(1859)*n(idx_H3j)*n(idx_C9) &
        +k(1860)*n(idx_H3j)*n(idx_CH3C4H) &
        +k(1861)*n(idx_H3j)*n(idx_CH3OCH3) &
        +k(1862)*n(idx_H3j)*n(idx_HC7N) &
        +k(1863)*n(idx_H3j)*n(idx_C2H6CO) &
        +k(1864)*n(idx_H3j)*n(idx_C8H2) &
        +k(1865)*n(idx_H3j)*n(idx_C9H) &
        +k(1866)*n(idx_H3j)*n(idx_C9N) &
        +k(1867)*n(idx_H3j)*n(idx_CH3C5N) &
        +k(1868)*n(idx_H3j)*n(idx_C9H2) &
        +k(1869)*n(idx_H3j)*n(idx_CH3C6H) &
        +k(1870)*n(idx_H3j)*n(idx_CH3C7N) &
        +k(1871)*n(idx_H3j)*n(idx_HC9N) &
        +k(1872)*n(idx_H3j)*n(idx_C6H6) &
        -k(1881)*n(idx_HCNj)*n(idx_H2) &
        +k(1913)*n(idx_HCOj)*n(idx_MGH) &
        +k(1914)*n(idx_HCOj)*n(idx_NAH) &
        -k(2036)*n(idx_HCPj)*n(idx_H2) &
        -k(2045)*n(idx_HNCj)*n(idx_H2) &
        -k(2080)*n(idx_HNSIj)*n(idx_H2) &
        -k(2083)*n(idx_HOCj)*n(idx_H2) &
        +k(2083)*n(idx_HOCj)*n(idx_H2) &
        +k(2111)*n(idx_NAH2j)*n(idx_H2O) &
        -k(2122)*n(idx_NH2j)*n(idx_H2) &
        -k(2147)*n(idx_NO2j)*n(idx_H2) &
        -k(2156)*n(idx_O2Hj)*n(idx_H2) &
        +k(2172)*n(idx_PH2j)*n(idx_C2H2) &
        +k(2174)*n(idx_PH2j)*n(idx_C2H4) &
        -k(2175)*n(idx_S2Hj)*n(idx_H2) &
        -k(2177)*n(idx_SIC2j)*n(idx_H2) &
        -k(2185)*n(idx_SO2j)*n(idx_H2) &
        +k(2188)*n(idx_C2H2j)*n(idx_C) &
        +k(2193)*n(idx_C2H2j)*n(idx_N) &
        +k(2201)*n(idx_C2H2j)*n(idx_SI) &
        +k(2222)*n(idx_C2H2j)*n(idx_C2H2) &
        +k(2224)*n(idx_C2H2j)*n(idx_C3H) &
        +k(2225)*n(idx_C2H2j)*n(idx_HC3) &
        +k(2234)*n(idx_C2H2j)*n(idx_C2H3) &
        +k(2235)*n(idx_C2H2j)*n(idx_C3H2) &
        +k(2236)*n(idx_C2H2j)*n(idx_H2C3) &
        +k(2239)*n(idx_C2H2j)*n(idx_C4H) &
        +k(2241)*n(idx_C2H2j)*n(idx_CH4) &
        +k(2249)*n(idx_C2H2j)*n(idx_C3H3) &
        +k(2252)*n(idx_C2H2j)*n(idx_C4H2) &
        +k(2254)*n(idx_C2H2j)*n(idx_C5H) &
        +k(2257)*n(idx_C2H2j)*n(idx_C3H4) &
        +k(2260)*n(idx_C2H2j)*n(idx_C5H2) &
        +k(2262)*n(idx_C2H2j)*n(idx_C6H) &
        +k(2265)*n(idx_C2H2j)*n(idx_C6H2) &
        +k(2267)*n(idx_C2H2j)*n(idx_C7H) &
        +k(2270)*n(idx_C2H2j)*n(idx_C7H2) &
        -k(2273)*n(idx_C3Hj)*n(idx_H2) &
        +k(2283)*n(idx_C3Hj)*n(idx_H2O) &
        +k(2286)*n(idx_C3Hj)*n(idx_H2S) &
        +k(2296)*n(idx_C3Hj)*n(idx_CH4) &
        +k(2299)*n(idx_C3Hj)*n(idx_C2H4) &
        -k(2302)*n(idx_C3Nj)*n(idx_H2) &
        -k(2303)*n(idx_C4j)*n(idx_H2) &
        +k(2305)*n(idx_CH2SIj)*n(idx_C) &
        +k(2311)*n(idx_CH3j)*n(idx_C) &
        +k(2315)*n(idx_CH3j)*n(idx_N) &
        +k(2318)*n(idx_CH3j)*n(idx_O) &
        +k(2319)*n(idx_CH3j)*n(idx_O) &
        +k(2322)*n(idx_CH3j)*n(idx_S) &
        +k(2324)*n(idx_CH3j)*n(idx_SI) &
        +k(2326)*n(idx_CH3j)*n(idx_C2) &
        +k(2327)*n(idx_CH3j)*n(idx_CH) &
        +k(2329)*n(idx_CH3j)*n(idx_HCL) &
        +k(2330)*n(idx_CH3j)*n(idx_HS) &
        +k(2331)*n(idx_CH3j)*n(idx_NH) &
        +k(2334)*n(idx_CH3j)*n(idx_OH) &
        +k(2335)*n(idx_CH3j)*n(idx_SIH) &
        +k(2336)*n(idx_CH3j)*n(idx_SO) &
        +k(2337)*n(idx_CH3j)*n(idx_C2H) &
        +k(2338)*n(idx_CH3j)*n(idx_C2H) &
        +k(2341)*n(idx_CH3j)*n(idx_CH2) &
        +k(2342)*n(idx_CH3j)*n(idx_H2S) &
        +k(2347)*n(idx_CH3j)*n(idx_C2H2) &
        +k(2350)*n(idx_CH3j)*n(idx_C3H) &
        +k(2351)*n(idx_CH3j)*n(idx_HC3) &
        +k(2354)*n(idx_CH3j)*n(idx_NH3) &
        +k(2356)*n(idx_CH3j)*n(idx_C2H3) &
        +k(2357)*n(idx_CH3j)*n(idx_C2H3) &
        +k(2358)*n(idx_CH3j)*n(idx_C2H3) &
        +k(2359)*n(idx_CH3j)*n(idx_C3H2) &
        +k(2360)*n(idx_CH3j)*n(idx_H2C3) &
        +k(2361)*n(idx_CH3j)*n(idx_C4H) &
        +k(2362)*n(idx_CH3j)*n(idx_CH4) &
        +2.d0*k(2372)*n(idx_CH3j)*n(idx_C2H4) &
        +2.d0*k(2373)*n(idx_CH3j)*n(idx_C2H4) &
        +k(2374)*n(idx_CH3j)*n(idx_C2H4) &
        +k(2378)*n(idx_CH3j)*n(idx_C4H2) &
        +k(2379)*n(idx_CH3j)*n(idx_C5H) &
        +k(2382)*n(idx_CH3j)*n(idx_C5H2) &
        +k(2383)*n(idx_CH3j)*n(idx_C6H) &
        +k(2384)*n(idx_CH3j)*n(idx_C6H2) &
        +k(2385)*n(idx_CH3j)*n(idx_C7H) &
        +k(2386)*n(idx_CH3j)*n(idx_C7H2) &
        +k(2387)*n(idx_CH3j)*n(idx_C8H) &
        +k(2388)*n(idx_CH3j)*n(idx_C8H2) &
        +k(2391)*n(idx_HCNHj)*n(idx_SI) &
        +k(2426)*n(idx_H2NCj)*n(idx_SI) &
        +k(2427)*n(idx_H3Oj)*n(idx_C) &
        +k(2429)*n(idx_H3Oj)*n(idx_P) &
        +k(2494)*n(idx_H3Sj)*n(idx_H) &
        +k(2512)*n(idx_NH3j)*n(idx_O) &
        -k(2517)*n(idx_NH3j)*n(idx_H2) &
        +k(2531)*n(idx_PH3j)*n(idx_C2H2) &
        +k(2533)*n(idx_SIC2Hj)*n(idx_C2H2) &
        +k(2535)*n(idx_SIH3j)*n(idx_N) &
        +k(2537)*n(idx_SIH3j)*n(idx_O) &
        +k(2541)*n(idx_SINH2j)*n(idx_C) &
        +k(2543)*n(idx_C2H3j)*n(idx_C) &
        +k(2546)*n(idx_C2H3j)*n(idx_H) &
        +k(2547)*n(idx_C2H3j)*n(idx_N) &
        +k(2550)*n(idx_C2H3j)*n(idx_S) &
        +k(2551)*n(idx_C2H3j)*n(idx_SI) &
        +k(2554)*n(idx_C2H3j)*n(idx_C2H) &
        +k(2560)*n(idx_C2H3j)*n(idx_C2H2) &
        +k(2563)*n(idx_C2H3j)*n(idx_C3H) &
        +k(2564)*n(idx_C2H3j)*n(idx_HC3) &
        +k(2573)*n(idx_C2H3j)*n(idx_C3H2) &
        +k(2574)*n(idx_C2H3j)*n(idx_H2C3) &
        +k(2578)*n(idx_C2H3j)*n(idx_C4H) &
        +k(2580)*n(idx_C2H3j)*n(idx_CH4) &
        +k(2584)*n(idx_C2H3j)*n(idx_C3H3) &
        +k(2587)*n(idx_C2H3j)*n(idx_C4H2) &
        +k(2590)*n(idx_C2H3j)*n(idx_C5H) &
        +k(2593)*n(idx_C2H3j)*n(idx_C3H4) &
        +k(2595)*n(idx_C2H3j)*n(idx_C5H2) &
        +k(2598)*n(idx_C2H3j)*n(idx_C6H) &
        +k(2601)*n(idx_C2H3j)*n(idx_C6H2) &
        +k(2604)*n(idx_C2H3j)*n(idx_C7H) &
        +k(2607)*n(idx_C2H3j)*n(idx_C7H2) &
        +k(2612)*n(idx_C3H2j)*n(idx_H) &
        +k(2613)*n(idx_H2C3j)*n(idx_H) &
        +k(2622)*n(idx_C3H2j)*n(idx_SI) &
        +k(2623)*n(idx_H2C3j)*n(idx_SI) &
        +k(2632)*n(idx_C3H2j)*n(idx_C2H3) &
        +k(2633)*n(idx_H2C3j)*n(idx_C2H3) &
        +k(2636)*n(idx_C3H2j)*n(idx_C3H2) &
        +k(2637)*n(idx_H2C3j)*n(idx_H2C3) &
        +k(2640)*n(idx_C3H2j)*n(idx_C4H) &
        +k(2641)*n(idx_H2C3j)*n(idx_C4H) &
        +k(2652)*n(idx_C3H2j)*n(idx_C4H2) &
        +k(2653)*n(idx_H2C3j)*n(idx_C4H2) &
        +k(2656)*n(idx_C3H2j)*n(idx_C5H) &
        +k(2657)*n(idx_H2C3j)*n(idx_C5H) &
        +k(2670)*n(idx_C3H2j)*n(idx_C5H2) &
        +k(2671)*n(idx_H2C3j)*n(idx_C5H2) &
        +k(2674)*n(idx_C3H2j)*n(idx_C6H) &
        +k(2675)*n(idx_H2C3j)*n(idx_C6H) &
        +k(2678)*n(idx_C3H2j)*n(idx_C6H2) &
        +k(2679)*n(idx_H2C3j)*n(idx_C6H2) &
        -k(2682)*n(idx_C3HNj)*n(idx_H2) &
        -k(2683)*n(idx_C3HNj)*n(idx_H2) &
        -k(2689)*n(idx_C4Hj)*n(idx_H2) &
        +k(2690)*n(idx_C4Hj)*n(idx_C2H) &
        +k(2693)*n(idx_C4Hj)*n(idx_C3H) &
        +k(2694)*n(idx_C4Hj)*n(idx_HC3) &
        +k(2702)*n(idx_C4Hj)*n(idx_CH4) &
        -k(2710)*n(idx_C4Nj)*n(idx_H2) &
        +k(2714)*n(idx_C4Nj)*n(idx_CH4) &
        -k(2715)*n(idx_C5j)*n(idx_H2) &
        +k(2716)*n(idx_CH4j)*n(idx_H) &
        -k(2719)*n(idx_CH4j)*n(idx_H2) &
        +k(2729)*n(idx_CH4j)*n(idx_C2H2) &
        +k(2730)*n(idx_CH4j)*n(idx_C2H2) &
        +k(2746)*n(idx_NH4j)*n(idx_C) &
        +k(2747)*n(idx_NH4j)*n(idx_C) &
        +k(2752)*n(idx_SIH4j)*n(idx_C) &
        -k(2754)*n(idx_SIH4j)*n(idx_H2) &
        +k(2757)*n(idx_C2H4j)*n(idx_C) &
        +k(2758)*n(idx_C2H4j)*n(idx_C) &
        +k(2761)*n(idx_C2H4j)*n(idx_H) &
        +k(2762)*n(idx_C2H4j)*n(idx_N) &
        +k(2766)*n(idx_C2H4j)*n(idx_S) &
        +k(2767)*n(idx_C2H4j)*n(idx_SI) &
        +k(2771)*n(idx_C2H4j)*n(idx_C2H) &
        +k(2783)*n(idx_C2H4j)*n(idx_C2H3) &
        +k(2796)*n(idx_C2H4j)*n(idx_C3H3) &
        +k(2798)*n(idx_C2H4j)*n(idx_C4H2) &
        +k(2807)*n(idx_C2H4j)*n(idx_C6H2) &
        +k(2811)*n(idx_C2H4j)*n(idx_C7H2) &
        +k(2812)*n(idx_C3H3j)*n(idx_C) &
        +k(2813)*n(idx_H3C3j)*n(idx_C) &
        +k(2818)*n(idx_C3H3j)*n(idx_S) &
        +k(2819)*n(idx_H3C3j)*n(idx_S) &
        +k(2820)*n(idx_C3H3j)*n(idx_SI) &
        +k(2821)*n(idx_H3C3j)*n(idx_SI) &
        +k(2824)*n(idx_C3H3j)*n(idx_C2H) &
        +k(2825)*n(idx_H3C3j)*n(idx_C2H) &
        +k(2828)*n(idx_C3H3j)*n(idx_C2H2) &
        +k(2829)*n(idx_H3C3j)*n(idx_C2H2) &
        +k(2830)*n(idx_C3H3j)*n(idx_C3H) &
        +k(2831)*n(idx_H3C3j)*n(idx_HC3) &
        +k(2834)*n(idx_C3H3j)*n(idx_C2H3) &
        +k(2835)*n(idx_H3C3j)*n(idx_C2H3) &
        +k(2836)*n(idx_C3H3j)*n(idx_C3H2) &
        +k(2837)*n(idx_H3C3j)*n(idx_H2C3) &
        +k(2840)*n(idx_C3H3j)*n(idx_C4H) &
        +k(2841)*n(idx_H3C3j)*n(idx_C4H) &
        +k(2844)*n(idx_C3H3j)*n(idx_CH4) &
        +k(2845)*n(idx_H3C3j)*n(idx_CH4) &
        +k(2846)*n(idx_C3H3j)*n(idx_C2H4) &
        +k(2847)*n(idx_H3C3j)*n(idx_C2H4) &
        +k(2848)*n(idx_C3H3j)*n(idx_C3H3) &
        +k(2849)*n(idx_H3C3j)*n(idx_C3H3) &
        +k(2852)*n(idx_C3H3j)*n(idx_C4H2) &
        +k(2853)*n(idx_H3C3j)*n(idx_C4H2) &
        +k(2854)*n(idx_C3H3j)*n(idx_C5H) &
        +k(2855)*n(idx_H3C3j)*n(idx_C5H) &
        +k(2858)*n(idx_C3H3j)*n(idx_C3H4) &
        +k(2859)*n(idx_H3C3j)*n(idx_C3H4) &
        +k(2860)*n(idx_C3H3j)*n(idx_C5H2) &
        +k(2861)*n(idx_H3C3j)*n(idx_C5H2) &
        +k(2864)*n(idx_C3H3j)*n(idx_C6H) &
        +k(2865)*n(idx_H3C3j)*n(idx_C6H) &
        +k(2868)*n(idx_C3H3j)*n(idx_C6H2) &
        +k(2869)*n(idx_H3C3j)*n(idx_C6H2) &
        +k(2870)*n(idx_C4H2j)*n(idx_C) &
        +k(2878)*n(idx_C4H2j)*n(idx_SI) &
        +k(2884)*n(idx_C4H2j)*n(idx_C2H3) &
        +k(2889)*n(idx_C4H2j)*n(idx_CH4) &
        +k(2891)*n(idx_C4H2j)*n(idx_C2H4) &
        +k(2893)*n(idx_C4H2j)*n(idx_C3H3) &
        +k(2896)*n(idx_C4H2j)*n(idx_C4H2) &
        -k(2903)*n(idx_C5Hj)*n(idx_H2) &
        -k(2904)*n(idx_C5Nj)*n(idx_H2) &
        -k(2905)*n(idx_C6j)*n(idx_H2) &
        +k(2907)*n(idx_CH5j)*n(idx_C) &
        +k(2909)*n(idx_CH5j)*n(idx_H) &
        +k(2912)*n(idx_CH5j)*n(idx_O) &
        +k(2914)*n(idx_CH5j)*n(idx_SI) &
        -k(2933)*n(idx_HC4Nj)*n(idx_H2) &
        +k(2938)*n(idx_SIH5j)*n(idx_O) &
        +k(2940)*n(idx_C2H5j)*n(idx_C) &
        +k(2941)*n(idx_C2H5j)*n(idx_C) &
        +k(2943)*n(idx_C2H5j)*n(idx_H) &
        +k(2952)*n(idx_C2H5j)*n(idx_C2H2) &
        +k(2956)*n(idx_C3H4j)*n(idx_C) &
        +k(2958)*n(idx_C3H4j)*n(idx_H) &
        +k(2959)*n(idx_C3H4j)*n(idx_H) &
        +k(2960)*n(idx_C3H4j)*n(idx_N) &
        +k(2965)*n(idx_C4H3j)*n(idx_C) &
        +k(2970)*n(idx_C4H3j)*n(idx_S) &
        +k(2974)*n(idx_C4H3j)*n(idx_C2H3) &
        +k(2979)*n(idx_C4H3j)*n(idx_CH4) &
        +k(2980)*n(idx_C4H3j)*n(idx_C3H3) &
        +k(2986)*n(idx_C4H3j)*n(idx_C5H2) &
        +k(2988)*n(idx_C5H2j)*n(idx_C) &
        +k(2993)*n(idx_C5H2j)*n(idx_C2H2) &
        +k(2997)*n(idx_C5H2j)*n(idx_C2H3) &
        +k(2999)*n(idx_C5H2j)*n(idx_C3H2) &
        +k(3000)*n(idx_C5H2j)*n(idx_H2C3) &
        +k(3004)*n(idx_C5H2j)*n(idx_CH4) &
        +k(3006)*n(idx_C5H2j)*n(idx_C2H4) &
        +k(3008)*n(idx_C5H2j)*n(idx_C3H3) &
        +k(3012)*n(idx_C5H2j)*n(idx_C3H4) &
        -k(3013)*n(idx_C5HNj)*n(idx_H2) &
        -k(3016)*n(idx_C6Hj)*n(idx_H2) &
        -k(3017)*n(idx_C7j)*n(idx_H2) &
        +k(3018)*n(idx_CH5Oj)*n(idx_H2CO) &
        -k(3020)*n(idx_H2C4Nj)*n(idx_H2) &
        +k(3021)*n(idx_C2H6j)*n(idx_H) &
        +k(3022)*n(idx_C3H5j)*n(idx_C) &
        +k(3024)*n(idx_C3H5j)*n(idx_N) &
        +k(3027)*n(idx_C4H4j)*n(idx_C2H2) &
        +k(3030)*n(idx_C5H3j)*n(idx_C) &
        +k(3034)*n(idx_C6H2j)*n(idx_C) &
        +k(3040)*n(idx_C6H2j)*n(idx_C2H3) &
        +k(3042)*n(idx_C6H2j)*n(idx_C3H2) &
        +k(3043)*n(idx_C6H2j)*n(idx_H2C3) &
        +k(3046)*n(idx_C6H2j)*n(idx_CH4) &
        +k(3048)*n(idx_C6H2j)*n(idx_C2H4) &
        +k(3049)*n(idx_C6H2j)*n(idx_C3H3) &
        +k(3051)*n(idx_C6H2j)*n(idx_C3H4) &
        -k(3055)*n(idx_C7Hj)*n(idx_H2) &
        -k(3056)*n(idx_C7Nj)*n(idx_H2) &
        -k(3057)*n(idx_C8j)*n(idx_H2) &
        -k(3058)*n(idx_H3C4Nj)*n(idx_H2) &
        +k(3062)*n(idx_C6H3j)*n(idx_C) &
        +k(3065)*n(idx_C7H2j)*n(idx_C) &
        +k(3070)*n(idx_C7H2j)*n(idx_C2H2) &
        +k(3072)*n(idx_C7H2j)*n(idx_C2H3) &
        +k(3074)*n(idx_C7H2j)*n(idx_CH4) &
        +k(3075)*n(idx_C7H2j)*n(idx_C2H4) &
        -k(3076)*n(idx_C7HNj)*n(idx_H2) &
        -k(3077)*n(idx_C8Hj)*n(idx_H2) &
        -k(3078)*n(idx_C9j)*n(idx_H2) &
        +k(3079)*n(idx_C5H5j)*n(idx_N) &
        +k(3080)*n(idx_C7H3j)*n(idx_C) &
        +k(3084)*n(idx_C8H2j)*n(idx_C) &
        +k(3087)*n(idx_C8H2j)*n(idx_CH4) &
        -k(3091)*n(idx_C9Hj)*n(idx_H2) &
        -k(3092)*n(idx_C9Nj)*n(idx_H2) &
        +k(3099)*n(idx_C8H3j)*n(idx_C) &
        +k(3102)*n(idx_C9H2j)*n(idx_C) &
        -k(3105)*n(idx_C9HNj)*n(idx_H2) &
        +k(3106)*n(idx_C7H5j)*n(idx_N) &
        -k(3111)*n(idx_COj)*n(idx_H2) &
        -k(3113)*n(idx_CNj)*n(idx_H2) &
        +k(3119)*n(idx_Hk)*n(idx_H2O) &
        +k(3120)*n(idx_Hk)*n(idx_HCN) &
        -k(3122)*n(idx_Ok)*n(idx_H2) &
        -k(3129)*n(idx_Cj)*n(idx_H2) &
        -k(3138)*n(idx_NAj)*n(idx_H2) &
        -k(3140)*n(idx_Pj)*n(idx_H2) &
        -k(3141)*n(idx_Sj)*n(idx_H2) &
        -k(3144)*n(idx_SIj)*n(idx_H2) &
        -k(3148)*n(idx_HSj)*n(idx_H2) &
        -k(3149)*n(idx_NOj)*n(idx_H2) &
        -k(3150)*n(idx_PHj)*n(idx_H2) &
        -k(3151)*n(idx_SIHj)*n(idx_H2) &
        -k(3155)*n(idx_OCSj)*n(idx_H2) &
        -k(3158)*n(idx_C2H2j)*n(idx_H2) &
        -k(3165)*n(idx_C3Hj)*n(idx_H2) &
        -k(3166)*n(idx_C3Hj)*n(idx_H2) &
        -k(3169)*n(idx_CH3j)*n(idx_H2) &
        -k(3181)*n(idx_SIC2Hj)*n(idx_H2) &
        -k(3182)*n(idx_SIH3j)*n(idx_H2) &
        -k(3197)*n(idx_C6j)*n(idx_H2) &
        -k(3207)*n(idx_C6H5j)*n(idx_H2) &
        -k(3213)*n(idx_Ck)*n(idx_H2) &
        +k(3220)*n(idx_Hk)*n(idx_H) &
        -k(3240)*n(idx_Ok)*n(idx_H2) &
        +k(3282)*n(idx_C)*n(idx_C2H2) &
        +k(3283)*n(idx_C)*n(idx_H2CN) &
        +k(3315)*n(idx_C)*n(idx_CH3C4H) &
        +k(3316)*n(idx_C)*n(idx_CH3C6H) &
        +k(3330)*n(idx_H)*n(idx_HS) &
        +k(3331)*n(idx_H)*n(idx_HCO) &
        +k(3333)*n(idx_H)*n(idx_C2H3) &
        +k(3334)*n(idx_H)*n(idx_H2CN) &
        +k(3337)*n(idx_H)*n(idx_CH) &
        +k(3338)*n(idx_H)*n(idx_CH2) &
        +k(3339)*n(idx_H)*n(idx_CH3) &
        +k(3340)*n(idx_H)*n(idx_CH4) &
        +k(3341)*n(idx_H)*n(idx_OH) &
        +k(3342)*n(idx_H)*n(idx_NH3) &
        +k(3343)*n(idx_H)*n(idx_H2O) &
        +k(3344)*n(idx_H)*n(idx_HCN) &
        +k(3347)*n(idx_H)*n(idx_H2CO) &
        +k(3351)*n(idx_H)*n(idx_O2H) &
        +k(3355)*n(idx_H)*n(idx_H2O2) &
        +k(3356)*n(idx_H)*n(idx_H2S) &
        -k(3361)*n(idx_H2)*n(idx_C) &
        -k(3362)*n(idx_H2)*n(idx_CH) &
        -k(3363)*n(idx_H2)*n(idx_CH2) &
        -k(3364)*n(idx_H2)*n(idx_CH3) &
        -k(3365)*n(idx_H2)*n(idx_O) &
        -k(3366)*n(idx_H2)*n(idx_OH) &
        -k(3367)*n(idx_H2)*n(idx_N) &
        -k(3368)*n(idx_H2)*n(idx_NH) &
        -k(3369)*n(idx_H2)*n(idx_NH2) &
        -k(3370)*n(idx_H2)*n(idx_O2H) &
        +k(3405)*n(idx_N)*n(idx_SIH3) &
        +k(3410)*n(idx_N)*n(idx_C3H3) &
        +k(3457)*n(idx_O)*n(idx_CH2) &
        +k(3471)*n(idx_O)*n(idx_NH2) &
        +k(3481)*n(idx_O)*n(idx_SIH2) &
        +k(3493)*n(idx_O)*n(idx_H2CN) &
        +k(3526)*n(idx_S)*n(idx_CH2) &
        -k(3540)*n(idx_F)*n(idx_H2) &
        -k(3645)*n(idx_C)*n(idx_H2) &
        -k(3650)*n(idx_CH)*n(idx_H2) &
        +k(3699)*n(idx_CH2j)*n(idx_E) &
        +k(3710)*n(idx_H2Oj)*n(idx_E) &
        +k(3716)*n(idx_H3j)*n(idx_E) &
        +k(3742)*n(idx_NAH2j)*n(idx_E) &
        +k(3752)*n(idx_PH2j)*n(idx_E) &
        +k(3759)*n(idx_SIH2j)*n(idx_E) &
        +k(3767)*n(idx_C2H2j)*n(idx_E) &
        +k(3786)*n(idx_CH2SIj)*n(idx_E) &
        +k(3788)*n(idx_CH3j)*n(idx_E) &
        +k(3790)*n(idx_CH3j)*n(idx_E) &
        +k(3800)*n(idx_H2NCj)*n(idx_E) &
        +k(3802)*n(idx_H2NOj)*n(idx_E) &
        +k(3809)*n(idx_H2SIOj)*n(idx_E) &
        +k(3812)*n(idx_H3Oj)*n(idx_E) &
        +k(3813)*n(idx_H3Oj)*n(idx_E) &
        +k(3835)*n(idx_PCH2j)*n(idx_E) &
        +k(3837)*n(idx_PH3j)*n(idx_E) &
        +k(3844)*n(idx_SIH3j)*n(idx_E) &
        +k(3848)*n(idx_SINH2j)*n(idx_E) &
        +k(3852)*n(idx_CH2CNj)*n(idx_E) &
        +k(3857)*n(idx_C2H3j)*n(idx_E) &
        +k(3859)*n(idx_C2H3j)*n(idx_E) &
        +k(3866)*n(idx_C3H2j)*n(idx_E) &
        +k(3867)*n(idx_H2C3j)*n(idx_E) &
        +k(3891)*n(idx_H3COj)*n(idx_E) &
        +k(3894)*n(idx_H3CSj)*n(idx_E) &
        +k(3896)*n(idx_H3S2j)*n(idx_E) &
        +k(3898)*n(idx_H3SIOj)*n(idx_E) &
        +k(3906)*n(idx_NH4j)*n(idx_E) &
        +k(3908)*n(idx_OCSjH2)*n(idx_E) &
        +k(3910)*n(idx_PC2H2j)*n(idx_E) &
        +k(3915)*n(idx_PCH3j)*n(idx_E) &
        +k(3916)*n(idx_PCH3j)*n(idx_E) &
        +k(3919)*n(idx_SIC2H2j)*n(idx_E) &
        +k(3926)*n(idx_SICH3j)*n(idx_E) &
        +k(3928)*n(idx_SIH4j)*n(idx_E) &
        +k(3930)*n(idx_CH3CNj)*n(idx_E) &
        +k(3937)*n(idx_C2H4j)*n(idx_E) &
        +k(3939)*n(idx_C2H4j)*n(idx_E) &
        +k(3950)*n(idx_C3H3j)*n(idx_E) &
        +k(3951)*n(idx_H3C3j)*n(idx_E) &
        +k(3954)*n(idx_C4H2j)*n(idx_E) &
        +k(3961)*n(idx_CH3O2j)*n(idx_E) &
        +2.d0*k(3963)*n(idx_CH4Nj)*n(idx_E) &
        +k(3965)*n(idx_CH4Nj)*n(idx_E) &
        +k(3968)*n(idx_CH4Oj)*n(idx_E) &
        +k(3969)*n(idx_CH5j)*n(idx_E) &
        +k(3972)*n(idx_CH5j)*n(idx_E) &
        +2.d0*k(3973)*n(idx_CH5j)*n(idx_E) &
        +k(3978)*n(idx_H2C3Oj)*n(idx_E) &
        +k(3995)*n(idx_PC2H3j)*n(idx_E) &
        +k(3996)*n(idx_PC2H3j)*n(idx_E) &
        +k(4002)*n(idx_PCH4j)*n(idx_E) &
        +k(4005)*n(idx_SIC2H3j)*n(idx_E) &
        +k(4007)*n(idx_SIC3H2j)*n(idx_E) &
        +k(4011)*n(idx_SICH4j)*n(idx_E) &
        +k(4013)*n(idx_SIH5j)*n(idx_E) &
        +k(4019)*n(idx_C2H4Oj)*n(idx_E) &
        +2.d0*k(4020)*n(idx_C2H5j)*n(idx_E) &
        +k(4021)*n(idx_C2H5j)*n(idx_E) &
        +k(4022)*n(idx_C2H5j)*n(idx_E) &
        +k(4024)*n(idx_C3H3Nj)*n(idx_E) &
        +k(4025)*n(idx_C3H3Nj)*n(idx_E) &
        +k(4026)*n(idx_C3H4j)*n(idx_E) &
        +k(4027)*n(idx_C3H4j)*n(idx_E) &
        +k(4034)*n(idx_C4H3j)*n(idx_E) &
        +k(4036)*n(idx_C5H2j)*n(idx_E) &
        +k(4047)*n(idx_CH5Nj)*n(idx_E) &
        +k(4048)*n(idx_CH5Oj)*n(idx_E) &
        +k(4056)*n(idx_H3C3Oj)*n(idx_E) &
        +2.d0*k(4060)*n(idx_NH2CH2Oj)*n(idx_E) &
        +2.d0*k(4063)*n(idx_PC2H4j)*n(idx_E) &
        +k(4064)*n(idx_PC2H4j)*n(idx_E) &
        +k(4066)*n(idx_PC4H2j)*n(idx_E) &
        +k(4068)*n(idx_C2H5Oj)*n(idx_E) &
        +k(4071)*n(idx_C2H6j)*n(idx_E) &
        +2.d0*k(4073)*n(idx_C3H4Nj)*n(idx_E) &
        +k(4074)*n(idx_C3H4Nj)*n(idx_E) &
        +k(4076)*n(idx_C3H5j)*n(idx_E) &
        +k(4078)*n(idx_C4H4j)*n(idx_E) &
        +k(4079)*n(idx_C4H4j)*n(idx_E) &
        +k(4081)*n(idx_C5H2Nj)*n(idx_E) &
        +k(4083)*n(idx_C5H3j)*n(idx_E) &
        +k(4086)*n(idx_C6H2j)*n(idx_E) &
        +k(4093)*n(idx_CH6Nj)*n(idx_E) &
        +2.d0*k(4098)*n(idx_C2H5OHj)*n(idx_E) &
        +k(4100)*n(idx_C2H5OHj)*n(idx_E) &
        +2.d0*k(4104)*n(idx_C4H5j)*n(idx_E) &
        +k(4105)*n(idx_C4H5j)*n(idx_E) &
        +k(4109)*n(idx_C5H3Nj)*n(idx_E) &
        +k(4110)*n(idx_C5H3Nj)*n(idx_E) &
        +k(4111)*n(idx_C5H4j)*n(idx_E) &
        +k(4112)*n(idx_C5H4j)*n(idx_E) &
        +k(4114)*n(idx_C6H3j)*n(idx_E) &
        +k(4116)*n(idx_C7H2j)*n(idx_E) &
        +k(4132)*n(idx_C2H5OH2j)*n(idx_E) &
        +2.d0*k(4136)*n(idx_C5H4Nj)*n(idx_E) &
        +k(4137)*n(idx_C5H4Nj)*n(idx_E) &
        +k(4138)*n(idx_C5H5j)*n(idx_E) &
        +k(4140)*n(idx_C6H4j)*n(idx_E) &
        +k(4141)*n(idx_C6H4j)*n(idx_E) &
        +k(4142)*n(idx_C7H2Nj)*n(idx_E) &
        +k(4144)*n(idx_C7H3j)*n(idx_E) &
        +k(4146)*n(idx_C8H2j)*n(idx_E) &
        +3.d0*k(4156)*n(idx_C4H7j)*n(idx_E) &
        +2.d0*k(4162)*n(idx_C6H5j)*n(idx_E) &
        +k(4163)*n(idx_C6H5j)*n(idx_E) &
        +k(4164)*n(idx_C7H3Nj)*n(idx_E) &
        +k(4165)*n(idx_C7H3Nj)*n(idx_E) &
        +k(4166)*n(idx_C7H4j)*n(idx_E) &
        +k(4167)*n(idx_C7H4j)*n(idx_E) &
        +k(4168)*n(idx_C8H3j)*n(idx_E) &
        +k(4170)*n(idx_C9H2j)*n(idx_E) &
        +k(4174)*n(idx_C7H5j)*n(idx_E) &
        +k(4176)*n(idx_C8H4j)*n(idx_E) &
        +k(4177)*n(idx_C8H4j)*n(idx_E) &
        +k(4178)*n(idx_C9H2Nj)*n(idx_E) &
        +k(4180)*n(idx_C9H3j)*n(idx_E) &
        +2.d0*k(4183)*n(idx_C6H7j)*n(idx_E) &
        +2.d0*k(4186)*n(idx_C8H5j)*n(idx_E) &
        +k(4187)*n(idx_C8H5j)*n(idx_E) &
        +k(4188)*n(idx_C9H3Nj)*n(idx_E) &
        +k(4189)*n(idx_C9H3Nj)*n(idx_E) &
        +k(4190)*n(idx_C9H4j)*n(idx_E) &
        +k(4191)*n(idx_C9H4j)*n(idx_E) &
        +2.d0*k(4192)*n(idx_C9H5j)*n(idx_E) &
        +k(4193)*n(idx_C9H5j)*n(idx_E) &
        +k(4205)*n(idx_H2j)*n(idx_E) &
        +k(4240)*n(idx_H2j)*n(idx_Hk) &
        +2.d0*k(4241)*n(idx_H3j)*n(idx_Hk) &
        +k(4242)*n(idx_HCOj)*n(idx_Hk) &
        +k(4243)*n(idx_H3Oj)*n(idx_Hk) &
        +k(4244)*n(idx_H3Oj)*n(idx_Hk) &
        +k(4245)*n(idx_NH4j)*n(idx_Hk) &
        -k(4266)*n(idx_H2) &
        +k(4319)*n(idx_CH3) &
        +k(4323)*n(idx_H2CO) &
        +k(4326)*n(idx_H2CS) &
        +k(4327)*n(idx_NH3) &
        +k(4334)*n(idx_C3H2) &
        +k(4335)*n(idx_H2C3) &
        +k(4345)*n(idx_CH3N) &
        +k(4346)*n(idx_CH4) &
        +k(4347)*n(idx_CH4) &
        +k(4352)*n(idx_C2H4) &
        +k(4354)*n(idx_C3H3) &
        +k(4355)*n(idx_C3H3) &
        +k(4366)*n(idx_CH3OH) &
        +k(4371)*n(idx_C3H4) &
        +k(4372)*n(idx_C3H4) &
        +2.d0*k(4383)*n(idx_CH5N) &
        +k(4384)*n(idx_CH5N) &
        +k(4403)*n(idx_SIC3H3) &
        +2.d0*k(4404)*n(idx_SIC3H5) &
        +k(4420)*n(idx_H3j) &
        +k(4422)*n(idx_CH3j) &
        -k(4436)*n(idx_H2) &
        +k(4482)*n(idx_H_DUSTH_DUST)

    !CO
    !CO
    dn(idx_CO) = &
        +k(13)*n(idx_HCOj)*n(idx_GRAINk) &
        -k(31)*n(idx_CO) &
        -k(32)*n(idx_CO) &
        +k(67)*n(idx_CCO) &
        +k(71)*n(idx_CO2) &
        +k(76)*n(idx_HCO) &
        +k(94)*n(idx_OCS) &
        +k(107)*n(idx_C3O) &
        +k(113)*n(idx_H2CO) &
        +k(127)*n(idx_C2H2O) &
        +k(165)*n(idx_C2H4O) &
        +k(221)*n(idx_Cj)*n(idx_O2) &
        +k(231)*n(idx_Cj)*n(idx_SIO) &
        +k(234)*n(idx_Cj)*n(idx_SO) &
        +k(246)*n(idx_Cj)*n(idx_CO2) &
        +k(253)*n(idx_Cj)*n(idx_HCO) &
        +k(264)*n(idx_Cj)*n(idx_OCS) &
        +k(270)*n(idx_Cj)*n(idx_SO2) &
        +k(274)*n(idx_Cj)*n(idx_C3O) &
        +k(283)*n(idx_Cj)*n(idx_H2CO) &
        +k(471)*n(idx_Hj)*n(idx_HCO) &
        +k(485)*n(idx_Hj)*n(idx_OCS) &
        +k(575)*n(idx_Hj)*n(idx_NH2CHO) &
        -k(640)*n(idx_HEj)*n(idx_CO) &
        +k(686)*n(idx_HEj)*n(idx_CCO) &
        +k(692)*n(idx_HEj)*n(idx_CO2) &
        +k(708)*n(idx_HEj)*n(idx_HCO) &
        +k(735)*n(idx_HEj)*n(idx_OCS) &
        +k(756)*n(idx_HEj)*n(idx_C3O) &
        +k(789)*n(idx_HEj)*n(idx_C2H2O) &
        +k(873)*n(idx_HEj)*n(idx_NH2CHO) &
        -k(960)*n(idx_Nj)*n(idx_CO) &
        -k(961)*n(idx_Nj)*n(idx_CO) &
        +k(980)*n(idx_Nj)*n(idx_HCO) &
        +k(983)*n(idx_Nj)*n(idx_OCS) &
        +k(1021)*n(idx_Oj)*n(idx_CO2) &
        +k(1029)*n(idx_Oj)*n(idx_HCO) &
        +k(1075)*n(idx_Sj)*n(idx_HCO) &
        +k(1077)*n(idx_Sj)*n(idx_OCS) &
        +k(1082)*n(idx_Sj)*n(idx_H2CO) &
        +k(1106)*n(idx_SIj)*n(idx_OCS) &
        +k(1133)*n(idx_C2j)*n(idx_O2) &
        +k(1140)*n(idx_C2j)*n(idx_HCO) &
        +k(1176)*n(idx_CHj)*n(idx_CO2) &
        +k(1185)*n(idx_CHj)*n(idx_HCO) &
        +k(1189)*n(idx_CHj)*n(idx_OCS) &
        +k(1194)*n(idx_CHj)*n(idx_H2CO) &
        -k(1211)*n(idx_CNj)*n(idx_CO) &
        +k(1216)*n(idx_CNj)*n(idx_O2) &
        +k(1224)*n(idx_CNj)*n(idx_CO2) &
        +k(1231)*n(idx_CNj)*n(idx_HCO) &
        +k(1236)*n(idx_COj)*n(idx_C) &
        +k(1237)*n(idx_COj)*n(idx_H) &
        +k(1239)*n(idx_COj)*n(idx_O) &
        +k(1240)*n(idx_COj)*n(idx_S) &
        +k(1241)*n(idx_COj)*n(idx_C2) &
        +k(1242)*n(idx_COj)*n(idx_CH) &
        +k(1245)*n(idx_COj)*n(idx_NH) &
        +k(1247)*n(idx_COj)*n(idx_NO) &
        +k(1248)*n(idx_COj)*n(idx_O2) &
        +k(1249)*n(idx_COj)*n(idx_OH) &
        +k(1251)*n(idx_COj)*n(idx_C2H) &
        +k(1253)*n(idx_COj)*n(idx_CH2) &
        +k(1255)*n(idx_COj)*n(idx_CO2) &
        +k(1256)*n(idx_COj)*n(idx_H2O) &
        +k(1258)*n(idx_COj)*n(idx_H2S) &
        +k(1260)*n(idx_COj)*n(idx_HCN) &
        +k(1261)*n(idx_COj)*n(idx_HCO) &
        +k(1263)*n(idx_COj)*n(idx_NH2) &
        +k(1266)*n(idx_COj)*n(idx_H2CO) &
        +k(1268)*n(idx_COj)*n(idx_NH3) &
        +k(1270)*n(idx_COj)*n(idx_CH4) &
        +k(1272)*n(idx_CPj)*n(idx_O) &
        -k(1293)*n(idx_H2j)*n(idx_CO) &
        -k(1294)*n(idx_H2j)*n(idx_CO) &
        +k(1318)*n(idx_H2j)*n(idx_HCO) &
        -k(1368)*n(idx_N2j)*n(idx_CO) &
        +k(1384)*n(idx_N2j)*n(idx_HCO) &
        +k(1386)*n(idx_N2j)*n(idx_OCS) &
        -k(1404)*n(idx_NHj)*n(idx_CO) &
        -k(1405)*n(idx_NHj)*n(idx_CO) &
        +k(1419)*n(idx_NHj)*n(idx_CO2) &
        +k(1449)*n(idx_O2j)*n(idx_C2) &
        +k(1459)*n(idx_O2j)*n(idx_HCO) &
        -k(1480)*n(idx_OHj)*n(idx_CO) &
        +k(1501)*n(idx_OHj)*n(idx_HCO) &
        +k(1540)*n(idx_SIOj)*n(idx_C) &
        +k(1547)*n(idx_SIOj)*n(idx_C2) &
        -k(1549)*n(idx_SIOj)*n(idx_CO) &
        +k(1575)*n(idx_C2Hj)*n(idx_CO2) &
        +k(1580)*n(idx_C2Hj)*n(idx_HCO) &
        +k(1598)*n(idx_C2Nj)*n(idx_H2O) &
        +k(1619)*n(idx_CH2j)*n(idx_CO2) &
        +k(1624)*n(idx_CH2j)*n(idx_HCO) &
        +k(1628)*n(idx_CH2j)*n(idx_OCS) &
        +k(1644)*n(idx_CO2j)*n(idx_O) &
        -k(1654)*n(idx_H2CLj)*n(idx_CO) &
        -k(1670)*n(idx_H2Oj)*n(idx_CO) &
        +k(1687)*n(idx_H2Oj)*n(idx_HCO) &
        -k(1726)*n(idx_H3j)*n(idx_CO) &
        -k(1727)*n(idx_H3j)*n(idx_CO) &
        +k(1810)*n(idx_H3j)*n(idx_CH2O2) &
        -k(1880)*n(idx_HCNj)*n(idx_CO) &
        +k(1892)*n(idx_HCNj)*n(idx_HCO) &
        +k(1901)*n(idx_HCOj)*n(idx_C) &
        +k(1905)*n(idx_HCOj)*n(idx_P) &
        +k(1906)*n(idx_HCOj)*n(idx_S) &
        +k(1907)*n(idx_HCOj)*n(idx_SI) &
        +k(1908)*n(idx_HCOj)*n(idx_C2) &
        +k(1909)*n(idx_HCOj)*n(idx_CH) &
        +k(1910)*n(idx_HCOj)*n(idx_CP) &
        +k(1911)*n(idx_HCOj)*n(idx_CS) &
        +k(1912)*n(idx_HCOj)*n(idx_HS) &
        +k(1913)*n(idx_HCOj)*n(idx_MGH) &
        +k(1914)*n(idx_HCOj)*n(idx_NAH) &
        +k(1915)*n(idx_HCOj)*n(idx_NH) &
        +k(1916)*n(idx_HCOj)*n(idx_NS) &
        +k(1917)*n(idx_HCOj)*n(idx_OH) &
        +k(1919)*n(idx_HCOj)*n(idx_PH) &
        +k(1920)*n(idx_HCOj)*n(idx_PN) &
        +k(1921)*n(idx_HCOj)*n(idx_PO) &
        +k(1922)*n(idx_HCOj)*n(idx_S2) &
        +k(1923)*n(idx_HCOj)*n(idx_SIC) &
        +k(1924)*n(idx_HCOj)*n(idx_SIH) &
        +k(1925)*n(idx_HCOj)*n(idx_SIO) &
        +k(1926)*n(idx_HCOj)*n(idx_SIS) &
        +k(1927)*n(idx_HCOj)*n(idx_SO) &
        +k(1928)*n(idx_HCOj)*n(idx_C2H) &
        +k(1929)*n(idx_HCOj)*n(idx_C2S) &
        +k(1930)*n(idx_HCOj)*n(idx_C3) &
        +k(1931)*n(idx_HCOj)*n(idx_CCO) &
        +k(1932)*n(idx_HCOj)*n(idx_CCP) &
        +k(1933)*n(idx_HCOj)*n(idx_CH2) &
        +k(1934)*n(idx_HCOj)*n(idx_H2O) &
        +k(1935)*n(idx_HCOj)*n(idx_H2S) &
        +k(1936)*n(idx_HCOj)*n(idx_HCN) &
        +k(1937)*n(idx_HCOj)*n(idx_HCO) &
        +k(1938)*n(idx_HCOj)*n(idx_HCP) &
        +k(1939)*n(idx_HCOj)*n(idx_HCSI) &
        +k(1940)*n(idx_HCOj)*n(idx_HNC) &
        +k(1941)*n(idx_HCOj)*n(idx_HNO) &
        +k(1942)*n(idx_HCOj)*n(idx_HNSI) &
        +k(1943)*n(idx_HCOj)*n(idx_HPO) &
        +k(1944)*n(idx_HCOj)*n(idx_HS2) &
        +k(1945)*n(idx_HCOj)*n(idx_NAOH) &
        +k(1946)*n(idx_HCOj)*n(idx_NH2) &
        +k(1947)*n(idx_HCOj)*n(idx_OCS) &
        +k(1948)*n(idx_HCOj)*n(idx_PH2) &
        +k(1949)*n(idx_HCOj)*n(idx_SIC2) &
        +k(1950)*n(idx_HCOj)*n(idx_SIH2) &
        +k(1951)*n(idx_HCOj)*n(idx_SINC) &
        +k(1952)*n(idx_HCOj)*n(idx_SIO2) &
        +k(1953)*n(idx_HCOj)*n(idx_C2H2) &
        +k(1954)*n(idx_HCOj)*n(idx_C3H) &
        +k(1955)*n(idx_HCOj)*n(idx_HC3) &
        +k(1956)*n(idx_HCOj)*n(idx_C3N) &
        +k(1957)*n(idx_HCOj)*n(idx_C3O) &
        +k(1958)*n(idx_HCOj)*n(idx_C3P) &
        +k(1959)*n(idx_HCOj)*n(idx_C3S) &
        +k(1960)*n(idx_HCOj)*n(idx_C4) &
        +k(1961)*n(idx_HCOj)*n(idx_H2CO) &
        +k(1962)*n(idx_HCOj)*n(idx_H2CS) &
        +k(1963)*n(idx_HCOj)*n(idx_H2S2) &
        +k(1964)*n(idx_HCOj)*n(idx_H2SIO) &
        +k(1965)*n(idx_HCOj)*n(idx_HCCP) &
        +k(1966)*n(idx_HCOj)*n(idx_NH3) &
        +k(1967)*n(idx_HCOj)*n(idx_SIC2H) &
        +k(1968)*n(idx_HCOj)*n(idx_SIC3) &
        +k(1969)*n(idx_HCOj)*n(idx_SICH2) &
        +k(1970)*n(idx_HCOj)*n(idx_C2H2O) &
        +k(1971)*n(idx_HCOj)*n(idx_C2H3) &
        +k(1972)*n(idx_HCOj)*n(idx_C3H2) &
        +k(1973)*n(idx_HCOj)*n(idx_H2C3) &
        +k(1974)*n(idx_HCOj)*n(idx_C4H) &
        +k(1975)*n(idx_HCOj)*n(idx_C4P) &
        +k(1976)*n(idx_HCOj)*n(idx_C4S) &
        +k(1977)*n(idx_HCOj)*n(idx_C5) &
        +k(1978)*n(idx_HCOj)*n(idx_CH2O2) &
        +k(1979)*n(idx_HCOj)*n(idx_CH2PH) &
        +k(1980)*n(idx_HCOj)*n(idx_CH3N) &
        +k(1981)*n(idx_HCOj)*n(idx_HCNC2) &
        +k(1982)*n(idx_HCOj)*n(idx_HC2NC) &
        +k(1983)*n(idx_HCOj)*n(idx_HC3N) &
        +k(1984)*n(idx_HCOj)*n(idx_HNC3) &
        +k(1985)*n(idx_HCOj)*n(idx_NH2CN) &
        +k(1986)*n(idx_HCOj)*n(idx_SIC2H2) &
        +k(1987)*n(idx_HCOj)*n(idx_SIC3H) &
        +k(1988)*n(idx_HCOj)*n(idx_SIC4) &
        +k(1989)*n(idx_HCOj)*n(idx_SICH3) &
        +k(1990)*n(idx_HCOj)*n(idx_SIH4) &
        +k(1991)*n(idx_HCOj)*n(idx_CH3CN) &
        +k(1992)*n(idx_HCOj)*n(idx_C2H4) &
        +k(1993)*n(idx_HCOj)*n(idx_C3H3) &
        +k(1994)*n(idx_HCOj)*n(idx_C4H2) &
        +k(1995)*n(idx_HCOj)*n(idx_C5H) &
        +k(1996)*n(idx_HCOj)*n(idx_C5N) &
        +k(1997)*n(idx_HCOj)*n(idx_C6) &
        +k(1998)*n(idx_HCOj)*n(idx_CH3OH) &
        +k(1999)*n(idx_HCOj)*n(idx_NH2CHO) &
        +k(2000)*n(idx_HCOj)*n(idx_C2H4O) &
        +k(2001)*n(idx_HCOj)*n(idx_C2H5) &
        +k(2002)*n(idx_HCOj)*n(idx_C3H3N) &
        +k(2003)*n(idx_HCOj)*n(idx_C3H4) &
        +k(2004)*n(idx_HCOj)*n(idx_C4H3) &
        +k(2005)*n(idx_HCOj)*n(idx_C5H2) &
        +k(2006)*n(idx_HCOj)*n(idx_C6H) &
        +k(2007)*n(idx_HCOj)*n(idx_C7) &
        +k(2008)*n(idx_HCOj)*n(idx_CH5N) &
        +k(2009)*n(idx_HCOj)*n(idx_HC5N) &
        +k(2010)*n(idx_HCOj)*n(idx_C6H2) &
        +k(2011)*n(idx_HCOj)*n(idx_C7H) &
        +k(2012)*n(idx_HCOj)*n(idx_C7N) &
        +k(2013)*n(idx_HCOj)*n(idx_C8) &
        +k(2014)*n(idx_HCOj)*n(idx_CH3C3N) &
        +k(2015)*n(idx_HCOj)*n(idx_HCOOCH3) &
        +k(2016)*n(idx_HCOj)*n(idx_C2H5OH) &
        +k(2017)*n(idx_HCOj)*n(idx_C2H5OH) &
        +k(2018)*n(idx_HCOj)*n(idx_C7H2) &
        +k(2019)*n(idx_HCOj)*n(idx_C8H) &
        +k(2020)*n(idx_HCOj)*n(idx_C9) &
        +k(2021)*n(idx_HCOj)*n(idx_CH3C4H) &
        +k(2022)*n(idx_HCOj)*n(idx_CH3OCH3) &
        +k(2023)*n(idx_HCOj)*n(idx_HC7N) &
        +k(2024)*n(idx_HCOj)*n(idx_C2H6CO) &
        +k(2025)*n(idx_HCOj)*n(idx_C8H2) &
        +k(2026)*n(idx_HCOj)*n(idx_C9H) &
        +k(2027)*n(idx_HCOj)*n(idx_C9N) &
        +k(2028)*n(idx_HCOj)*n(idx_CH3C5N) &
        +k(2029)*n(idx_HCOj)*n(idx_C9H2) &
        +k(2030)*n(idx_HCOj)*n(idx_CH3C6H) &
        +k(2031)*n(idx_HCOj)*n(idx_CH3C7N) &
        +k(2032)*n(idx_HCOj)*n(idx_HC9N) &
        +k(2033)*n(idx_HCOj)*n(idx_C6H6) &
        +k(2035)*n(idx_HCPj)*n(idx_O) &
        +k(2054)*n(idx_HNCj)*n(idx_HCO) &
        -k(2064)*n(idx_HNOj)*n(idx_CO) &
        -k(2079)*n(idx_HNSIj)*n(idx_CO) &
        -k(2082)*n(idx_HOCj)*n(idx_CO) &
        +k(2082)*n(idx_HOCj)*n(idx_CO) &
        +k(2084)*n(idx_HOCj)*n(idx_N2) &
        -k(2090)*n(idx_N2Hj)*n(idx_CO) &
        -k(2155)*n(idx_O2Hj)*n(idx_CO) &
        +k(2183)*n(idx_SINCj)*n(idx_O) &
        -k(2184)*n(idx_SO2j)*n(idx_CO) &
        +k(2217)*n(idx_C2H2j)*n(idx_HCO) &
        +k(2276)*n(idx_C3Hj)*n(idx_NO) &
        +k(2278)*n(idx_C3Hj)*n(idx_O2) &
        +k(2280)*n(idx_C3Hj)*n(idx_CO2) &
        +k(2282)*n(idx_C3Hj)*n(idx_H2O) &
        +k(2289)*n(idx_C3Hj)*n(idx_OCS) &
        +k(2344)*n(idx_CH3j)*n(idx_HCO) &
        +k(2346)*n(idx_CH3j)*n(idx_OCS) &
        +k(2418)*n(idx_H2COj)*n(idx_HCO) &
        -k(2501)*n(idx_HCO2j)*n(idx_CO) &
        +k(2525)*n(idx_NH3j)*n(idx_HCO) &
        +k(2549)*n(idx_C2H3j)*n(idx_O) &
        +k(2712)*n(idx_C4Nj)*n(idx_H2O) &
        -k(2718)*n(idx_CH4j)*n(idx_CO) &
        -k(2753)*n(idx_SIH4j)*n(idx_CO) &
        -k(2756)*n(idx_CH3CNj)*n(idx_CO) &
        +k(2816)*n(idx_C3H3j)*n(idx_O) &
        +k(2817)*n(idx_H3C3j)*n(idx_O) &
        +k(2874)*n(idx_C4H2j)*n(idx_O) &
        +k(2875)*n(idx_C4H2j)*n(idx_O) &
        -k(2918)*n(idx_CH5j)*n(idx_CO) &
        +k(3096)*n(idx_C6H5j)*n(idx_O) &
        +2.d0*k(3097)*n(idx_C6H5j)*n(idx_O2) &
        +k(3117)*n(idx_Ck)*n(idx_O2) &
        +2.d0*k(3118)*n(idx_Ck)*n(idx_CO2) &
        -k(3157)*n(idx_C2H2j)*n(idx_CO) &
        -k(3164)*n(idx_C3Hj)*n(idx_CO) &
        -k(3168)*n(idx_CH3j)*n(idx_CO) &
        -k(3183)*n(idx_C2H3j)*n(idx_CO) &
        -k(3198)*n(idx_CH5j)*n(idx_CO) &
        +k(3211)*n(idx_Ck)*n(idx_O) &
        -k(3226)*n(idx_Hk)*n(idx_CO) &
        +k(3234)*n(idx_Ok)*n(idx_C) &
        -k(3239)*n(idx_Ok)*n(idx_CO) &
        -k(3246)*n(idx_Sk)*n(idx_CO) &
        +k(3259)*n(idx_C)*n(idx_NO) &
        +k(3261)*n(idx_C)*n(idx_O2) &
        +k(3262)*n(idx_C)*n(idx_OH) &
        +k(3266)*n(idx_C)*n(idx_SO) &
        +k(3269)*n(idx_C)*n(idx_HCO) &
        +k(3273)*n(idx_C)*n(idx_CCO) &
        +k(3276)*n(idx_C)*n(idx_OCN) &
        +k(3278)*n(idx_C)*n(idx_SO2) &
        +k(3296)*n(idx_C)*n(idx_C3O) &
        -k(3329)*n(idx_C)*n(idx_CO) &
        +k(3331)*n(idx_H)*n(idx_HCO) &
        +k(3357)*n(idx_H)*n(idx_CO2) &
        +k(3360)*n(idx_H)*n(idx_OCS) &
        +k(3397)*n(idx_N)*n(idx_CCO) &
        +k(3431)*n(idx_O)*n(idx_C2) &
        +k(3433)*n(idx_O)*n(idx_CCL) &
        +k(3434)*n(idx_O)*n(idx_CH) &
        +k(3436)*n(idx_O)*n(idx_CN) &
        +k(3437)*n(idx_O)*n(idx_CP) &
        +k(3438)*n(idx_O)*n(idx_CS) &
        +k(3447)*n(idx_O)*n(idx_SIC) &
        +k(3452)*n(idx_O)*n(idx_C2H) &
        +k(3453)*n(idx_O)*n(idx_C2N) &
        +2.d0*k(3454)*n(idx_O)*n(idx_CCO) &
        +k(3455)*n(idx_O)*n(idx_CCP) &
        +k(3456)*n(idx_O)*n(idx_CH2) &
        +k(3457)*n(idx_O)*n(idx_CH2) &
        +k(3459)*n(idx_O)*n(idx_HCO) &
        +k(3461)*n(idx_O)*n(idx_HCP) &
        +k(3474)*n(idx_O)*n(idx_OCN) &
        +k(3478)*n(idx_O)*n(idx_C3) &
        +k(3479)*n(idx_O)*n(idx_SIC2) &
        +k(3482)*n(idx_O)*n(idx_SINC) &
        +k(3486)*n(idx_O)*n(idx_C3H) &
        +k(3487)*n(idx_O)*n(idx_HC3) &
        +k(3488)*n(idx_O)*n(idx_C3N) &
        +k(3489)*n(idx_O)*n(idx_C3O) &
        +k(3490)*n(idx_O)*n(idx_C3P) &
        +k(3491)*n(idx_O)*n(idx_C4) &
        +k(3494)*n(idx_O)*n(idx_HCCP) &
        +k(3495)*n(idx_O)*n(idx_SIC3) &
        +k(3497)*n(idx_O)*n(idx_H2C3) &
        +k(3498)*n(idx_O)*n(idx_C5) &
        +k(3499)*n(idx_O)*n(idx_C4H) &
        +k(3500)*n(idx_O)*n(idx_C4H) &
        +k(3501)*n(idx_O)*n(idx_C4N) &
        +k(3502)*n(idx_O)*n(idx_C4P) &
        +k(3503)*n(idx_O)*n(idx_CH2PH) &
        +k(3504)*n(idx_O)*n(idx_SIC4) &
        +k(3505)*n(idx_O)*n(idx_C5H) &
        +k(3506)*n(idx_O)*n(idx_C5N) &
        +k(3507)*n(idx_O)*n(idx_C6) &
        +k(3508)*n(idx_O)*n(idx_C6H) &
        +k(3509)*n(idx_O)*n(idx_C7) &
        +k(3510)*n(idx_O)*n(idx_C7H) &
        +k(3512)*n(idx_O)*n(idx_C8) &
        +k(3513)*n(idx_O)*n(idx_C8H) &
        +k(3514)*n(idx_O)*n(idx_C9) &
        +k(3515)*n(idx_O)*n(idx_C9H) &
        +k(3517)*n(idx_O)*n(idx_C10) &
        +k(3518)*n(idx_O)*n(idx_C11) &
        +k(3545)*n(idx_CH)*n(idx_O2) &
        +k(3571)*n(idx_CN)*n(idx_NO) &
        +k(3573)*n(idx_CN)*n(idx_HCO) &
        -k(3589)*n(idx_CO)*n(idx_OH) &
        -k(3590)*n(idx_CO)*n(idx_HNO) &
        +k(3600)*n(idx_OH)*n(idx_HCO) &
        +k(3612)*n(idx_C2H)*n(idx_O2) &
        +k(3636)*n(idx_HCO)*n(idx_HCO) &
        +k(3638)*n(idx_HCO)*n(idx_CH3) &
        +k(3644)*n(idx_C)*n(idx_O) &
        -k(3649)*n(idx_S)*n(idx_CO) &
        +k(3693)*n(idx_C2Oj)*n(idx_E) &
        +k(3705)*n(idx_CO2j)*n(idx_E) &
        +k(3718)*n(idx_HCOj)*n(idx_E) &
        +k(3730)*n(idx_HOCj)*n(idx_E) &
        +k(3744)*n(idx_NCOj)*n(idx_E) &
        +k(3749)*n(idx_OCSj)*n(idx_E) &
        +k(3768)*n(idx_C2HOj)*n(idx_E) &
        +k(3769)*n(idx_C2HOj)*n(idx_E) &
        +k(3779)*n(idx_C3Oj)*n(idx_E) &
        +k(3796)*n(idx_H2COj)*n(idx_E) &
        +k(3818)*n(idx_HCO2j)*n(idx_E) &
        +k(3819)*n(idx_HCO2j)*n(idx_E) &
        +k(3821)*n(idx_HNCOj)*n(idx_E) &
        +k(3854)*n(idx_C2H2Oj)*n(idx_E) &
        +k(3891)*n(idx_H3COj)*n(idx_E) &
        +k(3934)*n(idx_C2H3Oj)*n(idx_E) &
        +k(3974)*n(idx_H2C3Oj)*n(idx_E) &
        +k(3986)*n(idx_HC4Oj)*n(idx_E) &
        +k(3987)*n(idx_HC4Oj)*n(idx_E) &
        +k(4058)*n(idx_NH2CH2Oj)*n(idx_E) &
        +k(4069)*n(idx_C2H5Oj)*n(idx_E) &
        +k(4096)*n(idx_COOCH4j)*n(idx_E) &
        +k(4134)*n(idx_C2H6COj)*n(idx_E) &
        +k(4242)*n(idx_HCOj)*n(idx_Hk) &
        -k(4264)*n(idx_CO) &
        +k(4293)*n(idx_CO2) &
        +k(4298)*n(idx_HCO) &
        +k(4307)*n(idx_OCS) &
        +k(4315)*n(idx_C3O) &
        +k(4322)*n(idx_H2CO) &
        +k(4323)*n(idx_H2CO) &
        +k(4330)*n(idx_C2H2O) &
        +k(4369)*n(idx_C2H4O) &
        -k(4444)*n(idx_CO) &
        +k(4490)*n(idx_C_DUSTO_DUST)

    !CL
    !CL
    dn(idx_CL) = &
        -k(15)*n(idx_CL) &
        +k(27)*n(idx_CCL) &
        +k(29)*n(idx_CLO) &
        +k(39)*n(idx_HCL) &
        +k(422)*n(idx_CLj)*n(idx_O2) &
        +k(634)*n(idx_HEj)*n(idx_CCL) &
        -k(1713)*n(idx_H3j)*n(idx_CL) &
        +k(3433)*n(idx_O)*n(idx_CCL) &
        +k(3435)*n(idx_O)*n(idx_CLO) &
        +k(3658)*n(idx_CCLj)*n(idx_E) &
        +k(3661)*n(idx_CLOj)*n(idx_E) &
        +k(3667)*n(idx_HCLj)*n(idx_E) &
        +k(3706)*n(idx_H2CLj)*n(idx_E) &
        +k(4195)*n(idx_CLj)*n(idx_E) &
        -k(4251)*n(idx_CL) &
        +k(4259)*n(idx_CCL) &
        +k(4262)*n(idx_CLO) &
        +k(4267)*n(idx_HCL)

    !P
    !P
    dn(idx_P) = &
        -k(23)*n(idx_P) &
        +k(33)*n(idx_CP) &
        +k(52)*n(idx_PH) &
        +k(53)*n(idx_PN) &
        +k(54)*n(idx_PO) &
        +k(68)*n(idx_CCP) &
        -k(204)*n(idx_Cj)*n(idx_P) &
        +k(277)*n(idx_Cj)*n(idx_C3P) &
        +k(313)*n(idx_Cj)*n(idx_C4P) &
        -k(429)*n(idx_Hj)*n(idx_P) &
        -k(630)*n(idx_HEj)*n(idx_P) &
        +k(641)*n(idx_HEj)*n(idx_CP) &
        +k(759)*n(idx_HEj)*n(idx_C3P) &
        +k(1045)*n(idx_Pj)*n(idx_SI) &
        +k(1052)*n(idx_Pj)*n(idx_NH3) &
        +k(1517)*n(idx_PHj)*n(idx_H2O) &
        +k(1518)*n(idx_PHj)*n(idx_HCN) &
        +k(1521)*n(idx_PHj)*n(idx_NH3) &
        -k(1720)*n(idx_H3j)*n(idx_P) &
        -k(1905)*n(idx_HCOj)*n(idx_P) &
        -k(2199)*n(idx_C2H2j)*n(idx_P) &
        -k(2321)*n(idx_CH3j)*n(idx_P) &
        -k(2429)*n(idx_H3Oj)*n(idx_P) &
        -k(2618)*n(idx_C3H2j)*n(idx_P) &
        -k(2619)*n(idx_H2C3j)*n(idx_P) &
        -k(2876)*n(idx_C4H2j)*n(idx_P) &
        +k(3437)*n(idx_O)*n(idx_CP) &
        +k(3664)*n(idx_CPj)*n(idx_E) &
        +k(3677)*n(idx_PHj)*n(idx_E) &
        +k(3678)*n(idx_PNj)*n(idx_E) &
        +k(3679)*n(idx_POj)*n(idx_E) &
        +k(3697)*n(idx_CCPj)*n(idx_E) &
        +k(3721)*n(idx_HCPj)*n(idx_E) &
        +k(3752)*n(idx_PH2j)*n(idx_E) &
        +k(3839)*n(idx_PNH2j)*n(idx_E) &
        +k(3909)*n(idx_PC2H2j)*n(idx_E) &
        +k(3917)*n(idx_PCH3j)*n(idx_E) &
        +k(3918)*n(idx_PNH3j)*n(idx_E) &
        +k(4004)*n(idx_PCH4j)*n(idx_E) &
        +k(4062)*n(idx_PC2H4j)*n(idx_E)

    !C2
    !C2
    dn(idx_C2) = &
        -k(26)*n(idx_C2) &
        +k(62)*n(idx_C2H) &
        +k(65)*n(idx_C3) &
        +k(66)*n(idx_CCO) &
        +k(68)*n(idx_CCP) &
        +k(106)*n(idx_C3N) &
        +k(107)*n(idx_C3O) &
        +k(109)*n(idx_C3S) &
        +k(145)*n(idx_SIC4) &
        +k(226)*n(idx_Cj)*n(idx_SIC) &
        +k(242)*n(idx_Cj)*n(idx_CCP) &
        -k(432)*n(idx_Hj)*n(idx_C2) &
        -k(632)*n(idx_HEj)*n(idx_C2) &
        -k(633)*n(idx_HEj)*n(idx_C2) &
        +k(681)*n(idx_HEj)*n(idx_C2S) &
        +k(684)*n(idx_HEj)*n(idx_C3) &
        +k(688)*n(idx_HEj)*n(idx_CCP) &
        +k(739)*n(idx_HEj)*n(idx_SIC2) &
        +k(761)*n(idx_HEj)*n(idx_C3S) &
        +k(763)*n(idx_HEj)*n(idx_C4) &
        +k(796)*n(idx_HEj)*n(idx_C4H) &
        +k(799)*n(idx_HEj)*n(idx_C4P) &
        +k(802)*n(idx_HEj)*n(idx_C5) &
        +k(820)*n(idx_HEj)*n(idx_HCNC2) &
        +k(863)*n(idx_HEj)*n(idx_C5H) &
        +k(866)*n(idx_HEj)*n(idx_C6) &
        +k(897)*n(idx_HEj)*n(idx_C6H) &
        +k(899)*n(idx_HEj)*n(idx_C7) &
        +k(911)*n(idx_HEj)*n(idx_C7H) &
        +k(914)*n(idx_HEj)*n(idx_C8) &
        +k(926)*n(idx_HEj)*n(idx_C8H) &
        +k(928)*n(idx_HEj)*n(idx_C9) &
        +k(939)*n(idx_HEj)*n(idx_C9H) &
        -k(956)*n(idx_Nj)*n(idx_C2) &
        -k(1005)*n(idx_Oj)*n(idx_C2) &
        -k(1006)*n(idx_Oj)*n(idx_C2) &
        -k(1060)*n(idx_Sj)*n(idx_C2) &
        +k(1121)*n(idx_C2j)*n(idx_C) &
        +k(1124)*n(idx_C2j)*n(idx_S) &
        -k(1126)*n(idx_C2j)*n(idx_C2) &
        +k(1127)*n(idx_C2j)*n(idx_CH) &
        +k(1132)*n(idx_C2j)*n(idx_NO) &
        +k(1134)*n(idx_C2j)*n(idx_CH2) &
        +k(1141)*n(idx_C2j)*n(idx_HCO) &
        +k(1142)*n(idx_C2j)*n(idx_NH2) &
        -k(1163)*n(idx_CHj)*n(idx_C2) &
        -k(1209)*n(idx_CNj)*n(idx_C2) &
        -k(1241)*n(idx_COj)*n(idx_C2) &
        +k(1252)*n(idx_COj)*n(idx_C2H) &
        -k(1287)*n(idx_H2j)*n(idx_C2) &
        -k(1288)*n(idx_H2j)*n(idx_C2) &
        -k(1365)*n(idx_N2j)*n(idx_C2) &
        -k(1399)*n(idx_NHj)*n(idx_C2) &
        -k(1400)*n(idx_NHj)*n(idx_C2) &
        -k(1401)*n(idx_NHj)*n(idx_C2) &
        -k(1449)*n(idx_O2j)*n(idx_C2) &
        -k(1475)*n(idx_OHj)*n(idx_C2) &
        -k(1476)*n(idx_OHj)*n(idx_C2) &
        -k(1547)*n(idx_SIOj)*n(idx_C2) &
        +k(1567)*n(idx_C2Hj)*n(idx_CH) &
        +k(1572)*n(idx_C2Hj)*n(idx_CH2) &
        +k(1578)*n(idx_C2Hj)*n(idx_HCN) &
        +k(1581)*n(idx_C2Hj)*n(idx_HNC) &
        +k(1582)*n(idx_C2Hj)*n(idx_NH2) &
        +k(1585)*n(idx_C2Hj)*n(idx_H2CO) &
        +k(1587)*n(idx_C2Hj)*n(idx_NH3) &
        -k(1608)*n(idx_CH2j)*n(idx_C2) &
        -k(1666)*n(idx_H2Oj)*n(idx_C2) &
        -k(1667)*n(idx_H2Oj)*n(idx_C2) &
        -k(1723)*n(idx_H3j)*n(idx_C2) &
        -k(1878)*n(idx_HCNj)*n(idx_C2) &
        -k(1908)*n(idx_HCOj)*n(idx_C2) &
        -k(2043)*n(idx_HNCj)*n(idx_C2) &
        -k(2062)*n(idx_HNOj)*n(idx_C2) &
        -k(2088)*n(idx_N2Hj)*n(idx_C2) &
        -k(2117)*n(idx_NH2j)*n(idx_C2) &
        -k(2152)*n(idx_O2Hj)*n(idx_C2) &
        -k(2326)*n(idx_CH3j)*n(idx_C2) &
        -k(2406)*n(idx_H2COj)*n(idx_C2) &
        -k(2515)*n(idx_NH3j)*n(idx_C2) &
        -k(2916)*n(idx_CH5j)*n(idx_C2) &
        +k(3208)*n(idx_Ck)*n(idx_C) &
        -k(3223)*n(idx_Hk)*n(idx_C2) &
        +k(3255)*n(idx_C)*n(idx_CH) &
        +k(3271)*n(idx_C)*n(idx_C2N) &
        +k(3273)*n(idx_C)*n(idx_CCO) &
        +k(3317)*n(idx_C)*n(idx_C4) &
        +k(3319)*n(idx_C)*n(idx_C6) &
        +k(3324)*n(idx_C)*n(idx_C8) &
        +k(3327)*n(idx_C)*n(idx_CN) &
        +k(3329)*n(idx_C)*n(idx_CO) &
        -k(3371)*n(idx_N)*n(idx_C2) &
        +k(3398)*n(idx_N)*n(idx_C3) &
        -k(3431)*n(idx_O)*n(idx_C2) &
        +k(3478)*n(idx_O)*n(idx_C3) &
        -k(3519)*n(idx_S)*n(idx_C2) &
        -k(3558)*n(idx_CH)*n(idx_C2) &
        -k(3567)*n(idx_C2)*n(idx_C2H2) &
        -k(3568)*n(idx_C2)*n(idx_C2H4) &
        -k(3569)*n(idx_C2)*n(idx_C4H2) &
        -k(3570)*n(idx_C2)*n(idx_C6H2) &
        -k(3626)*n(idx_C2H)*n(idx_C2) &
        +k(3641)*n(idx_C)*n(idx_C) &
        -k(3653)*n(idx_C)*n(idx_C2) &
        +k(3688)*n(idx_C2Hj)*n(idx_E) &
        +k(3692)*n(idx_C2Nj)*n(idx_E) &
        +k(3694)*n(idx_C2Sj)*n(idx_E) &
        +k(3696)*n(idx_C3j)*n(idx_E) &
        +k(3697)*n(idx_CCPj)*n(idx_E) &
        +k(3756)*n(idx_SIC2j)*n(idx_E) &
        +k(3764)*n(idx_C2H2j)*n(idx_E) &
        +k(3767)*n(idx_C2H2j)*n(idx_E) &
        +k(3778)*n(idx_C3Nj)*n(idx_E) &
        +k(3779)*n(idx_C3Oj)*n(idx_E) &
        +k(3780)*n(idx_C3Sj)*n(idx_E) &
        +2.d0*k(3783)*n(idx_C4j)*n(idx_E) &
        +k(3842)*n(idx_SIC3j)*n(idx_E) &
        +k(3853)*n(idx_C2H2Oj)*n(idx_E) &
        +k(3859)*n(idx_C2H3j)*n(idx_E) &
        +k(3862)*n(idx_C3H2j)*n(idx_E) &
        +k(3863)*n(idx_H2C3j)*n(idx_E) &
        +k(3872)*n(idx_C3HNj)*n(idx_E) &
        +k(3875)*n(idx_C4Hj)*n(idx_E) &
        +k(3879)*n(idx_C4Nj)*n(idx_E) &
        +k(3881)*n(idx_C4Pj)*n(idx_E) &
        +k(3883)*n(idx_C4Sj)*n(idx_E) &
        +k(3886)*n(idx_C5j)*n(idx_E) &
        +k(3924)*n(idx_SIC4j)*n(idx_E) &
        +k(3958)*n(idx_C5Nj)*n(idx_E) &
        +k(3959)*n(idx_C6j)*n(idx_E) &
        +k(4044)*n(idx_C7j)*n(idx_E) &
        +k(4090)*n(idx_C7Nj)*n(idx_E) &
        +k(4091)*n(idx_C8j)*n(idx_E) &
        +k(4122)*n(idx_C9j)*n(idx_E) &
        +k(4129)*n(idx_C10j)*n(idx_E) &
        +k(4150)*n(idx_C9Nj)*n(idx_E) &
        -k(4257)*n(idx_C2) &
        -k(4258)*n(idx_C2) &
        +k(4285)*n(idx_C2H) &
        +k(4287)*n(idx_C2N) &
        +k(4289)*n(idx_C2S) &
        +k(4290)*n(idx_C3) &
        +k(4314)*n(idx_C3N) &
        +k(4315)*n(idx_C3O) &
        +k(4316)*n(idx_C3S) &
        +2.d0*k(4317)*n(idx_C4) &
        +k(4338)*n(idx_C4H) &
        +k(4342)*n(idx_C5) &
        +k(4362)*n(idx_C5H) &
        +k(4363)*n(idx_C5H) &
        +k(4391)*n(idx_NC4N) &
        +k(4396)*n(idx_HC4N) &
        -k(4437)*n(idx_C2) &
        +k(4483)*n(idx_C_DUSTC_DUST)

    !CCL
    !CCL
    dn(idx_CCL) = &
        -k(27)*n(idx_CCL) &
        -k(207)*n(idx_Cj)*n(idx_CCL) &
        -k(634)*n(idx_HEj)*n(idx_CCL) &
        -k(3432)*n(idx_O)*n(idx_CCL) &
        -k(3433)*n(idx_O)*n(idx_CCL) &
        +k(3792)*n(idx_H2CCLj)*n(idx_E) &
        -k(4259)*n(idx_CCL)

    !CH
    !CH
    dn(idx_CH) = &
        -k(28)*n(idx_CH) &
        +k(80)*n(idx_HCSI) &
        -k(208)*n(idx_Cj)*n(idx_CH) &
        -k(209)*n(idx_Cj)*n(idx_CH) &
        +k(215)*n(idx_Cj)*n(idx_MGH) &
        +k(216)*n(idx_Cj)*n(idx_NAH) &
        +k(284)*n(idx_Cj)*n(idx_H2CO) &
        +k(289)*n(idx_Cj)*n(idx_HCCP) &
        +k(320)*n(idx_Cj)*n(idx_HCNC2) &
        +k(335)*n(idx_Cj)*n(idx_HNC3) &
        +k(347)*n(idx_Cj)*n(idx_C2H4) &
        +k(362)*n(idx_Cj)*n(idx_CH3OH) &
        +k(370)*n(idx_Cj)*n(idx_C2H4O) &
        +k(378)*n(idx_Cj)*n(idx_C3H4) &
        +k(379)*n(idx_Cj)*n(idx_C3H4) &
        +k(390)*n(idx_Cj)*n(idx_CH5N) &
        +k(401)*n(idx_Cj)*n(idx_C2H5OH) &
        +k(406)*n(idx_Cj)*n(idx_CH3C4H) &
        +k(417)*n(idx_Cj)*n(idx_CH3C6H) &
        -k(433)*n(idx_Hj)*n(idx_CH) &
        +k(538)*n(idx_Hj)*n(idx_HCNC2) &
        -k(635)*n(idx_HEj)*n(idx_CH) &
        -k(636)*n(idx_HEj)*n(idx_CH) &
        +k(676)*n(idx_HEj)*n(idx_C2H) &
        +k(703)*n(idx_HEj)*n(idx_HCN) &
        +k(710)*n(idx_HEj)*n(idx_HCP) &
        +k(713)*n(idx_HEj)*n(idx_HCSI) &
        +k(749)*n(idx_HEj)*n(idx_C2H2) &
        +k(776)*n(idx_HEj)*n(idx_HCCP) &
        +k(783)*n(idx_HEj)*n(idx_SICH2) &
        +k(818)*n(idx_HEj)*n(idx_HCNC2) &
        +k(824)*n(idx_HEj)*n(idx_HC2NC) &
        +k(828)*n(idx_HEj)*n(idx_HC3N) &
        +k(892)*n(idx_HEj)*n(idx_C4H3) &
        +k(893)*n(idx_HEj)*n(idx_C4H3) &
        +k(951)*n(idx_HEj)*n(idx_C6H6) &
        -k(957)*n(idx_Nj)*n(idx_CH) &
        -k(958)*n(idx_Nj)*n(idx_CH) &
        -k(1007)*n(idx_Oj)*n(idx_CH) &
        -k(1008)*n(idx_Oj)*n(idx_CH) &
        +k(1018)*n(idx_Oj)*n(idx_C2H) &
        +k(1027)*n(idx_Oj)*n(idx_HCN) &
        -k(1061)*n(idx_Sj)*n(idx_CH) &
        -k(1098)*n(idx_SIj)*n(idx_CH) &
        -k(1127)*n(idx_C2j)*n(idx_CH) &
        -k(1128)*n(idx_C2j)*n(idx_CH) &
        +k(1153)*n(idx_CHj)*n(idx_FE) &
        +k(1155)*n(idx_CHj)*n(idx_MG) &
        +k(1157)*n(idx_CHj)*n(idx_NA) &
        +k(1159)*n(idx_CHj)*n(idx_S) &
        +k(1162)*n(idx_CHj)*n(idx_SI) &
        -k(1164)*n(idx_CHj)*n(idx_CH) &
        +k(1169)*n(idx_CHj)*n(idx_NO) &
        +k(1186)*n(idx_CHj)*n(idx_HCO) &
        +k(1197)*n(idx_CHj)*n(idx_NH3) &
        -k(1210)*n(idx_CNj)*n(idx_CH) &
        -k(1242)*n(idx_COj)*n(idx_CH) &
        -k(1243)*n(idx_COj)*n(idx_CH) &
        +k(1254)*n(idx_COj)*n(idx_CH2) &
        -k(1289)*n(idx_H2j)*n(idx_CH) &
        -k(1290)*n(idx_H2j)*n(idx_CH) &
        -k(1346)*n(idx_HSj)*n(idx_CH) &
        -k(1366)*n(idx_N2j)*n(idx_CH) &
        -k(1402)*n(idx_NHj)*n(idx_CH) &
        -k(1450)*n(idx_O2j)*n(idx_CH) &
        -k(1451)*n(idx_O2j)*n(idx_CH) &
        -k(1477)*n(idx_OHj)*n(idx_CH) &
        -k(1478)*n(idx_OHj)*n(idx_CH) &
        -k(1548)*n(idx_SIOj)*n(idx_CH) &
        -k(1567)*n(idx_C2Hj)*n(idx_CH) &
        -k(1568)*n(idx_C2Hj)*n(idx_CH) &
        -k(1609)*n(idx_CH2j)*n(idx_CH) &
        +k(1632)*n(idx_CH2j)*n(idx_NH3) &
        -k(1668)*n(idx_H2Oj)*n(idx_CH) &
        -k(1669)*n(idx_H2Oj)*n(idx_CH) &
        -k(1724)*n(idx_H3j)*n(idx_CH) &
        -k(1879)*n(idx_HCNj)*n(idx_CH) &
        -k(1909)*n(idx_HCOj)*n(idx_CH) &
        -k(2044)*n(idx_HNCj)*n(idx_CH) &
        -k(2063)*n(idx_HNOj)*n(idx_CH) &
        -k(2089)*n(idx_N2Hj)*n(idx_CH) &
        -k(2118)*n(idx_NH2j)*n(idx_CH) &
        -k(2119)*n(idx_NH2j)*n(idx_CH) &
        -k(2153)*n(idx_O2Hj)*n(idx_CH) &
        +k(2196)*n(idx_C2H2j)*n(idx_O) &
        +k(2197)*n(idx_C2H2j)*n(idx_O) &
        -k(2203)*n(idx_C2H2j)*n(idx_CH) &
        -k(2204)*n(idx_C2H2j)*n(idx_CH) &
        -k(2327)*n(idx_CH3j)*n(idx_CH) &
        -k(2392)*n(idx_HCNHj)*n(idx_CH) &
        -k(2407)*n(idx_H2COj)*n(idx_CH) &
        -k(2408)*n(idx_H2COj)*n(idx_CH) &
        -k(2431)*n(idx_H3Oj)*n(idx_CH) &
        -k(2516)*n(idx_NH3j)*n(idx_CH) &
        -k(2742)*n(idx_H3COj)*n(idx_CH) &
        -k(2917)*n(idx_CH5j)*n(idx_CH) &
        +k(3209)*n(idx_Ck)*n(idx_H) &
        -k(3212)*n(idx_Ck)*n(idx_CH) &
        +k(3219)*n(idx_Hk)*n(idx_C) &
        -k(3224)*n(idx_Hk)*n(idx_CH) &
        -k(3238)*n(idx_Ok)*n(idx_CH) &
        -k(3252)*n(idx_OHk)*n(idx_CH) &
        -k(3254)*n(idx_O)*n(idx_CH) &
        -k(3255)*n(idx_C)*n(idx_CH) &
        +k(3269)*n(idx_C)*n(idx_HCO) &
        +2.d0*k(3325)*n(idx_C)*n(idx_CH2) &
        +k(3326)*n(idx_C)*n(idx_NH2) &
        -k(3337)*n(idx_H)*n(idx_CH) &
        +k(3338)*n(idx_H)*n(idx_CH2) &
        +k(3361)*n(idx_H2)*n(idx_C) &
        -k(3362)*n(idx_H2)*n(idx_CH) &
        -k(3372)*n(idx_N)*n(idx_CH) &
        -k(3434)*n(idx_O)*n(idx_CH) &
        +k(3452)*n(idx_O)*n(idx_C2H) &
        +k(3464)*n(idx_O)*n(idx_HCSI) &
        -k(3520)*n(idx_S)*n(idx_CH) &
        -k(3541)*n(idx_F)*n(idx_CH) &
        -k(3544)*n(idx_CH)*n(idx_NO) &
        -k(3545)*n(idx_CH)*n(idx_O2) &
        -k(3546)*n(idx_CH)*n(idx_HNO) &
        -k(3547)*n(idx_CH)*n(idx_CH4) &
        -k(3548)*n(idx_CH)*n(idx_C2H2) &
        -k(3549)*n(idx_CH)*n(idx_C3H4) &
        -k(3550)*n(idx_CH)*n(idx_C4H2) &
        -k(3551)*n(idx_CH)*n(idx_C6H2) &
        -k(3552)*n(idx_CH)*n(idx_C2H4) &
        -k(3553)*n(idx_CH)*n(idx_C3H6) &
        -k(3554)*n(idx_CH)*n(idx_C3) &
        -k(3555)*n(idx_CH)*n(idx_C5) &
        -k(3556)*n(idx_CH)*n(idx_C7) &
        -k(3557)*n(idx_CH)*n(idx_C9) &
        -k(3558)*n(idx_CH)*n(idx_C2) &
        -k(3559)*n(idx_CH)*n(idx_C4) &
        -k(3560)*n(idx_CH)*n(idx_C6) &
        -k(3561)*n(idx_CH)*n(idx_C8) &
        -k(3562)*n(idx_CH)*n(idx_HC3N) &
        -k(3563)*n(idx_CH)*n(idx_HC5N) &
        -k(3564)*n(idx_CH)*n(idx_HC7N) &
        -k(3565)*n(idx_CH)*n(idx_HC9N) &
        -k(3566)*n(idx_CH)*n(idx_HC11N) &
        +k(3642)*n(idx_C)*n(idx_H) &
        -k(3650)*n(idx_CH)*n(idx_H2) &
        +k(3689)*n(idx_C2Hj)*n(idx_E) &
        +k(3700)*n(idx_CH2j)*n(idx_E) &
        +k(3702)*n(idx_CHSIj)*n(idx_E) &
        +k(3720)*n(idx_HCOj)*n(idx_E) &
        +k(3721)*n(idx_HCPj)*n(idx_E) &
        +k(3724)*n(idx_HCSj)*n(idx_E) &
        +2.d0*k(3765)*n(idx_C2H2j)*n(idx_E) &
        +k(3769)*n(idx_C2HOj)*n(idx_E) &
        +k(3774)*n(idx_C2NHj)*n(idx_E) &
        +k(3789)*n(idx_CH3j)*n(idx_E) &
        +k(3790)*n(idx_CH3j)*n(idx_E) &
        +k(3816)*n(idx_HC2Sj)*n(idx_E) &
        +k(3833)*n(idx_PC2Hj)*n(idx_E) &
        +k(3846)*n(idx_SINCHj)*n(idx_E) &
        +k(3850)*n(idx_CH2CNj)*n(idx_E) &
        +k(3861)*n(idx_C2H3j)*n(idx_E) &
        +k(3877)*n(idx_C4Hj)*n(idx_E) &
        +k(3903)*n(idx_HC3Sj)*n(idx_E) &
        +k(3912)*n(idx_PC3Hj)*n(idx_E) &
        +k(3941)*n(idx_C2H4j)*n(idx_E) &
        +k(3948)*n(idx_C3H3j)*n(idx_E) &
        +k(3949)*n(idx_H3C3j)*n(idx_E) &
        +k(3973)*n(idx_CH5j)*n(idx_E) &
        +k(3985)*n(idx_HC4Nj)*n(idx_E) &
        +k(3988)*n(idx_HC4Oj)*n(idx_E) &
        +k(3990)*n(idx_HC4Sj)*n(idx_E) &
        +k(4000)*n(idx_PC4Hj)*n(idx_E) &
        +k(4009)*n(idx_SIC4Hj)*n(idx_E) &
        +k(4029)*n(idx_C3H4j)*n(idx_E) &
        +k(4053)*n(idx_H2C4Nj)*n(idx_E) &
        +k(4106)*n(idx_C4H5j)*n(idx_E) &
        -k(4260)*n(idx_CH) &
        -k(4261)*n(idx_CH) &
        +k(4291)*n(idx_CH2) &
        +k(4319)*n(idx_CH3) &
        +k(4346)*n(idx_CH4) &
        +k(4396)*n(idx_HC4N) &
        +k(4397)*n(idx_HC6N) &
        +k(4398)*n(idx_HC8N) &
        +k(4399)*n(idx_HC10N) &
        +k(4400)*n(idx_HC12N) &
        +k(4401)*n(idx_HC13N) &
        -k(4440)*n(idx_CH) &
        +k(4486)*n(idx_C_DUSTH_DUST)

    !CLO
    !CLO
    dn(idx_CLO) = &
        -k(29)*n(idx_CLO) &
        -k(210)*n(idx_Cj)*n(idx_CLO) &
        -k(637)*n(idx_HEj)*n(idx_CLO) &
        +k(3432)*n(idx_O)*n(idx_CCL) &
        -k(3435)*n(idx_O)*n(idx_CLO) &
        -k(4262)*n(idx_CLO)

    !CN
    !CN
    dn(idx_CN) = &
        -k(30)*n(idx_CN) &
        +k(63)*n(idx_C2N) &
        +k(75)*n(idx_HCN) &
        +k(81)*n(idx_HNC) &
        +k(93)*n(idx_OCN) &
        +k(99)*n(idx_SINC) &
        +k(106)*n(idx_C3N) &
        +k(126)*n(idx_CH2CN) &
        +k(133)*n(idx_C4N) &
        +k(142)*n(idx_HC3N) &
        +k(148)*n(idx_CH3CN) &
        +k(158)*n(idx_C5N) &
        +k(168)*n(idx_C3H3N) &
        +k(176)*n(idx_HC5N) &
        +k(179)*n(idx_C7N) &
        +k(190)*n(idx_HC7N) &
        +k(194)*n(idx_C9N) &
        +k(199)*n(idx_HC9N) &
        +k(263)*n(idx_Cj)*n(idx_OCN) &
        +k(325)*n(idx_Cj)*n(idx_HC2NC) &
        +k(331)*n(idx_Cj)*n(idx_HC3N) &
        +k(344)*n(idx_Cj)*n(idx_CH3CN) &
        +k(365)*n(idx_Cj)*n(idx_NH2CHO) &
        +k(392)*n(idx_Cj)*n(idx_HC5N) &
        +k(398)*n(idx_Cj)*n(idx_CH3C3N) &
        +k(410)*n(idx_Cj)*n(idx_HC7N) &
        +k(415)*n(idx_Cj)*n(idx_CH3C5N) &
        +k(419)*n(idx_Cj)*n(idx_CH3C7N) &
        +k(420)*n(idx_Cj)*n(idx_HC9N) &
        +k(540)*n(idx_Hj)*n(idx_HC2NC) &
        -k(638)*n(idx_HEj)*n(idx_CN) &
        -k(639)*n(idx_HEj)*n(idx_CN) &
        +k(679)*n(idx_HEj)*n(idx_C2N) &
        +k(732)*n(idx_HEj)*n(idx_OCN) &
        +k(754)*n(idx_HEj)*n(idx_C3N) &
        +k(787)*n(idx_HEj)*n(idx_CH2CN) &
        +k(822)*n(idx_HEj)*n(idx_HC2NC) &
        +k(827)*n(idx_HEj)*n(idx_HC3N) &
        +k(838)*n(idx_HEj)*n(idx_NH2CN) &
        +k(850)*n(idx_HEj)*n(idx_CH3CN) &
        +k(865)*n(idx_HEj)*n(idx_C5N) &
        +k(882)*n(idx_HEj)*n(idx_C3H3N) &
        +k(907)*n(idx_HEj)*n(idx_HC5N) &
        +k(913)*n(idx_HEj)*n(idx_C7N) &
        +k(934)*n(idx_HEj)*n(idx_HC7N) &
        +k(941)*n(idx_HEj)*n(idx_C9N) &
        +k(949)*n(idx_HEj)*n(idx_HC9N) &
        -k(959)*n(idx_Nj)*n(idx_CN) &
        -k(1009)*n(idx_Oj)*n(idx_CN) &
        +k(1122)*n(idx_C2j)*n(idx_N) &
        -k(1165)*n(idx_CHj)*n(idx_CN) &
        -k(1166)*n(idx_CHj)*n(idx_CN) &
        +k(1205)*n(idx_CNj)*n(idx_C) &
        +k(1206)*n(idx_CNj)*n(idx_H) &
        +k(1207)*n(idx_CNj)*n(idx_O) &
        +k(1208)*n(idx_CNj)*n(idx_S) &
        +k(1209)*n(idx_CNj)*n(idx_C2) &
        +k(1210)*n(idx_CNj)*n(idx_CH) &
        +k(1211)*n(idx_CNj)*n(idx_CO) &
        +k(1213)*n(idx_CNj)*n(idx_NH) &
        +k(1214)*n(idx_CNj)*n(idx_NO) &
        +k(1217)*n(idx_CNj)*n(idx_O2) &
        +k(1219)*n(idx_CNj)*n(idx_OH) &
        +k(1220)*n(idx_CNj)*n(idx_C2H) &
        +k(1221)*n(idx_CNj)*n(idx_CH2) &
        +k(1223)*n(idx_CNj)*n(idx_CO2) &
        +k(1229)*n(idx_CNj)*n(idx_HCN) &
        +k(1232)*n(idx_CNj)*n(idx_HCO) &
        +k(1233)*n(idx_CNj)*n(idx_NH2) &
        +k(1235)*n(idx_CNj)*n(idx_H2CO) &
        -k(1291)*n(idx_H2j)*n(idx_CN) &
        -k(1292)*n(idx_H2j)*n(idx_CN) &
        -k(1367)*n(idx_N2j)*n(idx_CN) &
        -k(1403)*n(idx_NHj)*n(idx_CN) &
        -k(1479)*n(idx_OHj)*n(idx_CN) &
        +k(1531)*n(idx_SICj)*n(idx_N) &
        +k(1563)*n(idx_C2Hj)*n(idx_N) &
        -k(1569)*n(idx_C2Hj)*n(idx_CN) &
        +k(1577)*n(idx_C2Hj)*n(idx_HCN) &
        -k(1725)*n(idx_H3j)*n(idx_CN) &
        +k(1873)*n(idx_HCNj)*n(idx_C) &
        +k(1877)*n(idx_HCNj)*n(idx_S) &
        +k(1878)*n(idx_HCNj)*n(idx_C2) &
        +k(1879)*n(idx_HCNj)*n(idx_CH) &
        +k(1880)*n(idx_HCNj)*n(idx_CO) &
        +k(1882)*n(idx_HCNj)*n(idx_NH) &
        +k(1885)*n(idx_HCNj)*n(idx_OH) &
        +k(1886)*n(idx_HCNj)*n(idx_C2H) &
        +k(1887)*n(idx_HCNj)*n(idx_CH2) &
        +k(1888)*n(idx_HCNj)*n(idx_CO2) &
        +k(1890)*n(idx_HCNj)*n(idx_H2O) &
        +k(1891)*n(idx_HCNj)*n(idx_HCN) &
        +k(1893)*n(idx_HCNj)*n(idx_HCO) &
        +k(1894)*n(idx_HCNj)*n(idx_HNC) &
        +k(1895)*n(idx_HCNj)*n(idx_NH2) &
        +k(1896)*n(idx_HCNj)*n(idx_H2CO) &
        +k(2040)*n(idx_HNCj)*n(idx_C) &
        +k(2042)*n(idx_HNCj)*n(idx_S) &
        +k(2043)*n(idx_HNCj)*n(idx_C2) &
        +k(2044)*n(idx_HNCj)*n(idx_CH) &
        +k(2046)*n(idx_HNCj)*n(idx_NH) &
        +k(2049)*n(idx_HNCj)*n(idx_OH) &
        +k(2050)*n(idx_HNCj)*n(idx_C2H) &
        +k(2051)*n(idx_HNCj)*n(idx_CH2) &
        +k(2052)*n(idx_HNCj)*n(idx_H2O) &
        +k(2053)*n(idx_HNCj)*n(idx_HCN) &
        +k(2055)*n(idx_HNCj)*n(idx_HCO) &
        +k(2056)*n(idx_HNCj)*n(idx_NH2) &
        +k(2057)*n(idx_HNCj)*n(idx_H2CO) &
        -k(2120)*n(idx_NH2j)*n(idx_CN) &
        -k(2121)*n(idx_NH2j)*n(idx_CN) &
        -k(2154)*n(idx_O2Hj)*n(idx_CN) &
        -k(2205)*n(idx_C2H2j)*n(idx_CN) &
        -k(2328)*n(idx_CH3j)*n(idx_CN) &
        +k(3114)*n(idx_C2N2j)*n(idx_H) &
        -k(3121)*n(idx_Ok)*n(idx_CN) &
        -k(3125)*n(idx_OHk)*n(idx_CN) &
        +k(3210)*n(idx_Ck)*n(idx_N) &
        -k(3225)*n(idx_Hk)*n(idx_CN) &
        +k(3257)*n(idx_C)*n(idx_NH) &
        +k(3258)*n(idx_C)*n(idx_NO) &
        +k(3260)*n(idx_C)*n(idx_NS) &
        +k(3271)*n(idx_C)*n(idx_C2N) &
        +k(3276)*n(idx_C)*n(idx_OCN) &
        +k(3295)*n(idx_C)*n(idx_C3N) &
        +k(3304)*n(idx_C)*n(idx_C5N) &
        +k(3309)*n(idx_C)*n(idx_C7N) &
        +k(3314)*n(idx_C)*n(idx_C9N) &
        -k(3327)*n(idx_C)*n(idx_CN) &
        +k(3328)*n(idx_C)*n(idx_N2) &
        +k(3344)*n(idx_H)*n(idx_HCN) &
        +k(3371)*n(idx_N)*n(idx_C2) &
        +k(3372)*n(idx_N)*n(idx_CH) &
        -k(3373)*n(idx_N)*n(idx_CN) &
        +k(3382)*n(idx_N)*n(idx_SIC) &
        +2.d0*k(3396)*n(idx_N)*n(idx_C2N) &
        +k(3397)*n(idx_N)*n(idx_CCO) &
        +k(3398)*n(idx_N)*n(idx_C3) &
        +k(3401)*n(idx_N)*n(idx_C3N) &
        +k(3411)*n(idx_N)*n(idx_C4) &
        +k(3412)*n(idx_N)*n(idx_C5) &
        +k(3414)*n(idx_N)*n(idx_C4N) &
        +k(3416)*n(idx_N)*n(idx_C5N) &
        +k(3420)*n(idx_N)*n(idx_C6) &
        +k(3421)*n(idx_N)*n(idx_C6H) &
        +k(3422)*n(idx_N)*n(idx_C7) &
        +k(3426)*n(idx_N)*n(idx_C8) &
        +k(3427)*n(idx_N)*n(idx_C8H) &
        +k(3428)*n(idx_N)*n(idx_C9) &
        -k(3436)*n(idx_O)*n(idx_CN) &
        +k(3453)*n(idx_O)*n(idx_C2N) &
        +k(3475)*n(idx_O)*n(idx_OCN) &
        -k(3571)*n(idx_CN)*n(idx_NO) &
        -k(3572)*n(idx_CN)*n(idx_O2) &
        -k(3573)*n(idx_CN)*n(idx_HCO) &
        -k(3574)*n(idx_CN)*n(idx_OH) &
        -k(3575)*n(idx_CN)*n(idx_OH) &
        -k(3576)*n(idx_CN)*n(idx_HNO) &
        -k(3577)*n(idx_CN)*n(idx_C2H2) &
        -k(3578)*n(idx_CN)*n(idx_NH3) &
        -k(3579)*n(idx_CN)*n(idx_NH3) &
        -k(3580)*n(idx_CN)*n(idx_C2H4) &
        -k(3581)*n(idx_CN)*n(idx_C4H2) &
        -k(3582)*n(idx_CN)*n(idx_C6H2) &
        -k(3583)*n(idx_CN)*n(idx_C8H2) &
        -k(3584)*n(idx_CN)*n(idx_HC3N) &
        -k(3585)*n(idx_CN)*n(idx_HC5N) &
        -k(3586)*n(idx_CN)*n(idx_HC7N) &
        -k(3587)*n(idx_CN)*n(idx_HC9N) &
        -k(3588)*n(idx_CN)*n(idx_HC11N) &
        +k(3643)*n(idx_C)*n(idx_N) &
        -k(3651)*n(idx_CN)*n(idx_C2H) &
        -k(3652)*n(idx_CN)*n(idx_CH3) &
        +k(3691)*n(idx_C2Nj)*n(idx_E) &
        +k(3704)*n(idx_CNCj)*n(idx_E) &
        +k(3717)*n(idx_HCNj)*n(idx_E) &
        +k(3725)*n(idx_HNCj)*n(idx_E) &
        +k(3761)*n(idx_SINCj)*n(idx_E) &
        +2.d0*k(3772)*n(idx_C2N2j)*n(idx_E) &
        +k(3774)*n(idx_C2NHj)*n(idx_E) &
        +k(3778)*n(idx_C3Nj)*n(idx_E) &
        +k(3793)*n(idx_HCNHj)*n(idx_E) &
        +k(3800)*n(idx_H2NCj)*n(idx_E) &
        +k(3851)*n(idx_CH2CNj)*n(idx_E) &
        +k(3873)*n(idx_C3HNj)*n(idx_E) &
        +k(3932)*n(idx_CH3CNj)*n(idx_E) &
        +k(3963)*n(idx_CH4Nj)*n(idx_E) &
        +k(3980)*n(idx_HC2NCHj)*n(idx_E) &
        +k(4038)*n(idx_C5HNj)*n(idx_E) &
        +k(4118)*n(idx_C7HNj)*n(idx_E) &
        +k(4172)*n(idx_C9HNj)*n(idx_E) &
        -k(4263)*n(idx_CN) &
        +k(4288)*n(idx_C2N) &
        +k(4297)*n(idx_HCN) &
        +k(4300)*n(idx_HNC) &
        +k(4306)*n(idx_OCN) &
        +k(4314)*n(idx_C3N) &
        +k(4340)*n(idx_C4N) &
        +k(4349)*n(idx_HC3N) &
        +k(4350)*n(idx_CH3CN) &
        +k(4365)*n(idx_C5N) &
        +k(4383)*n(idx_CH5N) &
        +k(4389)*n(idx_HC5N) &
        +2.d0*k(4391)*n(idx_NC4N) &
        +2.d0*k(4392)*n(idx_NC6N) &
        +2.d0*k(4393)*n(idx_NC8N) &
        +2.d0*k(4394)*n(idx_NC10N) &
        +2.d0*k(4395)*n(idx_NC12N) &
        +k(4396)*n(idx_HC4N) &
        +k(4397)*n(idx_HC6N) &
        +k(4398)*n(idx_HC8N) &
        +k(4399)*n(idx_HC10N) &
        +k(4400)*n(idx_HC12N) &
        +k(4401)*n(idx_HC13N) &
        +k(4428)*n(idx_CNk) &
        -k(4443)*n(idx_CN) &
        +k(4489)*n(idx_C_DUSTN_DUST)

    !CP
    !CP
    dn(idx_CP) = &
        -k(33)*n(idx_CP) &
        +k(69)*n(idx_CCP) &
        +k(78)*n(idx_HCP) &
        -k(211)*n(idx_Cj)*n(idx_CP) &
        -k(434)*n(idx_Hj)*n(idx_CP) &
        -k(641)*n(idx_HEj)*n(idx_CP) &
        -k(642)*n(idx_HEj)*n(idx_CP) &
        +k(687)*n(idx_HEj)*n(idx_CCP) &
        +k(775)*n(idx_HEj)*n(idx_HCCP) &
        -k(1728)*n(idx_H3j)*n(idx_CP) &
        -k(1910)*n(idx_HCOj)*n(idx_CP) &
        -k(2432)*n(idx_H3Oj)*n(idx_CP) &
        +k(3263)*n(idx_C)*n(idx_PH) &
        -k(3437)*n(idx_O)*n(idx_CP) &
        +k(3455)*n(idx_O)*n(idx_CCP) &
        +k(3698)*n(idx_CCPj)*n(idx_E) &
        +k(3722)*n(idx_HCPj)*n(idx_E) &
        +k(3833)*n(idx_PC2Hj)*n(idx_E) &
        +k(3835)*n(idx_PCH2j)*n(idx_E) &
        +k(3915)*n(idx_PCH3j)*n(idx_E) &
        +k(3997)*n(idx_PC4Hj)*n(idx_E) &
        +k(3998)*n(idx_PC4Hj)*n(idx_E)

    !CS
    !CS
    dn(idx_CS) = &
        -k(34)*n(idx_CS) &
        +k(64)*n(idx_C2S) &
        +k(109)*n(idx_C3S) &
        +k(114)*n(idx_H2CS) &
        +k(135)*n(idx_C4S) &
        +k(286)*n(idx_Cj)*n(idx_H2CS) &
        -k(435)*n(idx_Hj)*n(idx_CS) &
        -k(643)*n(idx_HEj)*n(idx_CS) &
        -k(644)*n(idx_HEj)*n(idx_CS) &
        +k(680)*n(idx_HEj)*n(idx_C2S) &
        +k(711)*n(idx_HEj)*n(idx_HCS) &
        +k(734)*n(idx_HEj)*n(idx_OCS) &
        +k(760)*n(idx_HEj)*n(idx_C3S) &
        +k(801)*n(idx_HEj)*n(idx_C4S) &
        +k(1090)*n(idx_Sj)*n(idx_C4H2) &
        +k(1091)*n(idx_Sj)*n(idx_C4H2) &
        +k(1274)*n(idx_CSj)*n(idx_C) &
        +k(1275)*n(idx_CSj)*n(idx_FE) &
        +k(1276)*n(idx_CSj)*n(idx_MG) &
        +k(1277)*n(idx_CSj)*n(idx_NA) &
        +k(1279)*n(idx_CSj)*n(idx_SI) &
        -k(1729)*n(idx_H3j)*n(idx_CS) &
        -k(1911)*n(idx_HCOj)*n(idx_CS) &
        +k(2039)*n(idx_HCSj)*n(idx_NH3) &
        +k(2285)*n(idx_C3Hj)*n(idx_H2S) &
        +k(2288)*n(idx_C3Hj)*n(idx_OCS) &
        -k(2433)*n(idx_H3Oj)*n(idx_CS) &
        +k(3242)*n(idx_Sk)*n(idx_C) &
        +k(3256)*n(idx_C)*n(idx_HS) &
        +k(3264)*n(idx_C)*n(idx_S2) &
        +k(3267)*n(idx_C)*n(idx_SO) &
        -k(3438)*n(idx_O)*n(idx_CS) &
        +k(3463)*n(idx_O)*n(idx_HCS) &
        +k(3519)*n(idx_S)*n(idx_C2) &
        +k(3520)*n(idx_S)*n(idx_CH) &
        +k(3526)*n(idx_S)*n(idx_CH2) &
        -k(3611)*n(idx_C2H)*n(idx_CS) &
        +k(3695)*n(idx_C2Sj)*n(idx_E) &
        +k(3723)*n(idx_HCSj)*n(idx_E) &
        +k(3750)*n(idx_OCSj)*n(idx_E) &
        +k(3780)*n(idx_C3Sj)*n(idx_E) &
        +k(3798)*n(idx_H2CSj)*n(idx_E) &
        +k(3816)*n(idx_HC2Sj)*n(idx_E) &
        +k(3822)*n(idx_HOCSj)*n(idx_E) &
        +k(3884)*n(idx_C4Sj)*n(idx_E) &
        +k(3894)*n(idx_H3CSj)*n(idx_E) &
        -k(4265)*n(idx_CS) &
        +k(4316)*n(idx_C3S) &
        +k(4326)*n(idx_H2CS) &
        +k(4341)*n(idx_C4S)

    !HCL
    !HCL
    dn(idx_HCL) = &
        -k(39)*n(idx_HCL) &
        -k(212)*n(idx_Cj)*n(idx_HCL) &
        -k(436)*n(idx_Hj)*n(idx_HCL) &
        -k(647)*n(idx_HEj)*n(idx_HCL) &
        +k(1654)*n(idx_H2CLj)*n(idx_CO) &
        +k(1655)*n(idx_H2CLj)*n(idx_H2O) &
        -k(1730)*n(idx_H3j)*n(idx_HCL) &
        -k(2329)*n(idx_CH3j)*n(idx_HCL) &
        +k(3707)*n(idx_H2CLj)*n(idx_E) &
        -k(4267)*n(idx_HCL)

    !HF
    !HF
    dn(idx_HF) = &
        -k(40)*n(idx_HF) &
        -k(213)*n(idx_Cj)*n(idx_HF) &
        -k(648)*n(idx_HEj)*n(idx_HF) &
        -k(1101)*n(idx_SIj)*n(idx_HF) &
        -k(1731)*n(idx_H3j)*n(idx_HF) &
        +k(3540)*n(idx_F)*n(idx_H2) &
        +k(3541)*n(idx_F)*n(idx_CH) &
        +k(3542)*n(idx_F)*n(idx_OH) &
        +k(3543)*n(idx_F)*n(idx_H2O) &
        +k(3709)*n(idx_H2Fj)*n(idx_E) &
        -k(4268)*n(idx_HF)

    !F
    !F
    dn(idx_F) = &
        +k(40)*n(idx_HF) &
        -k(1717)*n(idx_H3j)*n(idx_F) &
        -k(3540)*n(idx_F)*n(idx_H2) &
        -k(3541)*n(idx_F)*n(idx_CH) &
        -k(3542)*n(idx_F)*n(idx_OH) &
        -k(3543)*n(idx_F)*n(idx_H2O) &
        +k(3659)*n(idx_CFj)*n(idx_E) &
        +k(3668)*n(idx_HFj)*n(idx_E) &
        +k(3686)*n(idx_SIFj)*n(idx_E) &
        +k(3708)*n(idx_H2Fj)*n(idx_E) &
        +k(4268)*n(idx_HF)

    !HS
    !HS
    dn(idx_HS) = &
        -k(41)*n(idx_HS) &
        +k(85)*n(idx_HS2) &
        +2.d0*k(116)*n(idx_H2S2) &
        -k(214)*n(idx_Cj)*n(idx_HS) &
        -k(437)*n(idx_Hj)*n(idx_HS) &
        -k(438)*n(idx_Hj)*n(idx_HS) &
        -k(649)*n(idx_HEj)*n(idx_HS) &
        +k(723)*n(idx_HEj)*n(idx_HS2) &
        +k(772)*n(idx_HEj)*n(idx_H2S2) &
        +k(1083)*n(idx_Sj)*n(idx_H2CO) &
        +k(1092)*n(idx_Sj)*n(idx_C4H2) &
        +k(1259)*n(idx_COj)*n(idx_H2S) &
        +k(1337)*n(idx_HSj)*n(idx_FE) &
        +k(1339)*n(idx_HSj)*n(idx_MG) &
        +k(1341)*n(idx_HSj)*n(idx_NA) &
        +k(1344)*n(idx_HSj)*n(idx_S) &
        +k(1345)*n(idx_HSj)*n(idx_SI) &
        +k(1347)*n(idx_HSj)*n(idx_NO) &
        +k(1353)*n(idx_HSj)*n(idx_NH3) &
        +k(1554)*n(idx_SISj)*n(idx_H) &
        +k(1682)*n(idx_H2Oj)*n(idx_H2S) &
        +k(1707)*n(idx_H2Sj)*n(idx_H2O) &
        +k(1708)*n(idx_H2Sj)*n(idx_H2S) &
        +k(1711)*n(idx_H2Sj)*n(idx_NH3) &
        -k(1732)*n(idx_H3j)*n(idx_HS) &
        -k(1912)*n(idx_HCOj)*n(idx_HS) &
        +k(2136)*n(idx_NH2j)*n(idx_H2S) &
        +k(2214)*n(idx_C2H2j)*n(idx_H2S) &
        -k(2330)*n(idx_CH3j)*n(idx_HS) &
        +k(2523)*n(idx_NH3j)*n(idx_H2S) &
        +k(3243)*n(idx_Sk)*n(idx_H) &
        -k(3256)*n(idx_C)*n(idx_HS) &
        -k(3330)*n(idx_H)*n(idx_HS) &
        +k(3356)*n(idx_H)*n(idx_H2S) &
        +k(3360)*n(idx_H)*n(idx_OCS) &
        -k(3374)*n(idx_N)*n(idx_HS) &
        -k(3439)*n(idx_O)*n(idx_HS) &
        +k(3465)*n(idx_O)*n(idx_H2S) &
        -k(3522)*n(idx_S)*n(idx_HS) &
        -2.d0*k(3591)*n(idx_HS)*n(idx_HS) &
        +k(3599)*n(idx_OH)*n(idx_H2S) &
        +k(3714)*n(idx_H2Sj)*n(idx_E) &
        +k(3737)*n(idx_HSISj)*n(idx_E) &
        +k(3754)*n(idx_S2Hj)*n(idx_E) &
        +2.d0*k(3806)*n(idx_H2S2j)*n(idx_E) &
        +k(3814)*n(idx_H3Sj)*n(idx_E) &
        -k(4269)*n(idx_HS) &
        +k(4296)*n(idx_H2S)

    !MGH
    !MGH
    dn(idx_MGH) = &
        -k(42)*n(idx_MGH) &
        -k(215)*n(idx_Cj)*n(idx_MGH) &
        -k(439)*n(idx_Hj)*n(idx_MGH) &
        -k(650)*n(idx_HEj)*n(idx_MGH) &
        +k(953)*n(idx_MGj)*n(idx_NAH) &
        -k(1733)*n(idx_H3j)*n(idx_MGH) &
        -k(1913)*n(idx_HCOj)*n(idx_MGH)

    !N2
    !N2
    dn(idx_N2) = &
        -k(43)*n(idx_N2) &
        -k(651)*n(idx_HEj)*n(idx_N2) &
        -k(652)*n(idx_HEj)*n(idx_N2) &
        +k(726)*n(idx_HEj)*n(idx_N2O) &
        -k(1011)*n(idx_Oj)*n(idx_N2) &
        -k(1296)*n(idx_H2j)*n(idx_N2) &
        +k(1356)*n(idx_N2j)*n(idx_C) &
        +k(1357)*n(idx_N2j)*n(idx_FE) &
        +k(1358)*n(idx_N2j)*n(idx_H) &
        +k(1359)*n(idx_N2j)*n(idx_MG) &
        +k(1360)*n(idx_N2j)*n(idx_N) &
        +k(1361)*n(idx_N2j)*n(idx_NA) &
        +k(1362)*n(idx_N2j)*n(idx_O) &
        +k(1364)*n(idx_N2j)*n(idx_S) &
        +k(1365)*n(idx_N2j)*n(idx_C2) &
        +k(1366)*n(idx_N2j)*n(idx_CH) &
        +k(1367)*n(idx_N2j)*n(idx_CN) &
        +k(1368)*n(idx_N2j)*n(idx_CO) &
        +k(1370)*n(idx_N2j)*n(idx_NH) &
        +k(1371)*n(idx_N2j)*n(idx_NO) &
        +k(1372)*n(idx_N2j)*n(idx_O2) &
        +k(1373)*n(idx_N2j)*n(idx_OH) &
        +k(1374)*n(idx_N2j)*n(idx_C2H) &
        +k(1375)*n(idx_N2j)*n(idx_CH2) &
        +k(1376)*n(idx_N2j)*n(idx_CO2) &
        +k(1377)*n(idx_N2j)*n(idx_H2O) &
        +k(1379)*n(idx_N2j)*n(idx_H2S) &
        +k(1380)*n(idx_N2j)*n(idx_H2S) &
        +k(1381)*n(idx_N2j)*n(idx_H2S) &
        +k(1382)*n(idx_N2j)*n(idx_HCN) &
        +k(1383)*n(idx_N2j)*n(idx_HCO) &
        +k(1385)*n(idx_N2j)*n(idx_NH2) &
        +k(1386)*n(idx_N2j)*n(idx_OCS) &
        +k(1387)*n(idx_N2j)*n(idx_OCS) &
        +k(1388)*n(idx_N2j)*n(idx_H2CO) &
        +k(1389)*n(idx_N2j)*n(idx_H2CO) &
        +k(1390)*n(idx_N2j)*n(idx_NH3) &
        +k(1391)*n(idx_N2j)*n(idx_CH4) &
        +k(1392)*n(idx_N2j)*n(idx_CH4) &
        -k(1408)*n(idx_NHj)*n(idx_N2) &
        -k(1482)*n(idx_OHj)*n(idx_N2) &
        -k(1734)*n(idx_H3j)*n(idx_N2) &
        -k(2084)*n(idx_HOCj)*n(idx_N2) &
        +k(2086)*n(idx_N2Hj)*n(idx_C) &
        +k(2087)*n(idx_N2Hj)*n(idx_S) &
        +k(2088)*n(idx_N2Hj)*n(idx_C2) &
        +k(2089)*n(idx_N2Hj)*n(idx_CH) &
        +k(2090)*n(idx_N2Hj)*n(idx_CO) &
        +k(2091)*n(idx_N2Hj)*n(idx_NH) &
        +k(2092)*n(idx_N2Hj)*n(idx_OH) &
        +k(2093)*n(idx_N2Hj)*n(idx_C2H) &
        +k(2094)*n(idx_N2Hj)*n(idx_CH2) &
        +k(2095)*n(idx_N2Hj)*n(idx_CO2) &
        +k(2096)*n(idx_N2Hj)*n(idx_H2O) &
        +k(2097)*n(idx_N2Hj)*n(idx_HCN) &
        +k(2098)*n(idx_N2Hj)*n(idx_HCO) &
        +k(2099)*n(idx_N2Hj)*n(idx_HNC) &
        +k(2100)*n(idx_N2Hj)*n(idx_NH2) &
        +k(2101)*n(idx_N2Hj)*n(idx_C2H2) &
        +k(2102)*n(idx_N2Hj)*n(idx_H2CO) &
        +k(2103)*n(idx_N2Hj)*n(idx_NH3) &
        +k(2104)*n(idx_N2Hj)*n(idx_CH4) &
        +k(2105)*n(idx_N2Hj)*n(idx_HCNC2) &
        +k(2106)*n(idx_N2Hj)*n(idx_HC2NC) &
        +k(2107)*n(idx_N2Hj)*n(idx_HC3N) &
        +k(2108)*n(idx_N2Hj)*n(idx_HNC3) &
        +k(2109)*n(idx_N2Hj)*n(idx_NH2CHO) &
        +k(2110)*n(idx_N2Hj)*n(idx_C6H6) &
        -k(2157)*n(idx_O2Hj)*n(idx_N2) &
        +k(3115)*n(idx_C2N2j)*n(idx_H) &
        -k(3328)*n(idx_C)*n(idx_N2) &
        +k(3358)*n(idx_H)*n(idx_N2O) &
        +k(3373)*n(idx_N)*n(idx_CN) &
        +k(3375)*n(idx_N)*n(idx_NH) &
        +k(3376)*n(idx_N)*n(idx_NO) &
        +k(3377)*n(idx_N)*n(idx_NS) &
        +k(3390)*n(idx_N)*n(idx_NO2) &
        +k(3571)*n(idx_CN)*n(idx_NO) &
        +k(3592)*n(idx_NH)*n(idx_NH) &
        +k(3594)*n(idx_NO)*n(idx_NH2) &
        +k(3740)*n(idx_N2Hj)*n(idx_E) &
        -k(4270)*n(idx_N2) &
        -k(4438)*n(idx_N2) &
        +k(4484)*n(idx_N_DUSTN_DUST)

    !NAH
    !NAH
    dn(idx_NAH) = &
        -k(44)*n(idx_NAH) &
        -k(216)*n(idx_Cj)*n(idx_NAH) &
        -k(440)*n(idx_Hj)*n(idx_NAH) &
        -k(653)*n(idx_HEj)*n(idx_NAH) &
        -k(953)*n(idx_MGj)*n(idx_NAH) &
        -k(1735)*n(idx_H3j)*n(idx_NAH) &
        -k(1914)*n(idx_HCOj)*n(idx_NAH) &
        +k(3743)*n(idx_NAH2j)*n(idx_E)

    !NH
    !NH
    dn(idx_NH) = &
        -k(45)*n(idx_NH) &
        +k(88)*n(idx_NH2) &
        +k(119)*n(idx_NH3) &
        -k(217)*n(idx_Cj)*n(idx_NH) &
        -k(441)*n(idx_Hj)*n(idx_NH) &
        +k(545)*n(idx_Hj)*n(idx_HNC3) &
        -k(654)*n(idx_HEj)*n(idx_NH) &
        +k(809)*n(idx_HEj)*n(idx_CH3N) &
        +k(829)*n(idx_HEj)*n(idx_HC3N) &
        +k(833)*n(idx_HEj)*n(idx_HNC3) &
        +k(871)*n(idx_HEj)*n(idx_NH2CHO) &
        -k(963)*n(idx_Nj)*n(idx_NH) &
        -k(964)*n(idx_Nj)*n(idx_NH) &
        +k(977)*n(idx_Nj)*n(idx_H2S) &
        +k(987)*n(idx_Nj)*n(idx_H2CO) &
        +k(990)*n(idx_Nj)*n(idx_NH3) &
        +k(994)*n(idx_Nj)*n(idx_CH4) &
        +k(1000)*n(idx_Nj)*n(idx_CH3OH) &
        +k(1001)*n(idx_Nj)*n(idx_CH3OH) &
        -k(1012)*n(idx_Oj)*n(idx_NH) &
        -k(1013)*n(idx_Oj)*n(idx_NH) &
        +k(1026)*n(idx_Oj)*n(idx_HCN) &
        -k(1062)*n(idx_Sj)*n(idx_NH) &
        -k(1099)*n(idx_SIj)*n(idx_NH) &
        -k(1130)*n(idx_C2j)*n(idx_NH) &
        -k(1131)*n(idx_C2j)*n(idx_NH) &
        -k(1168)*n(idx_CHj)*n(idx_NH) &
        -k(1213)*n(idx_CNj)*n(idx_NH) &
        +k(1226)*n(idx_CNj)*n(idx_H2O) &
        -k(1245)*n(idx_COj)*n(idx_NH) &
        -k(1246)*n(idx_COj)*n(idx_NH) &
        +k(1262)*n(idx_COj)*n(idx_NH2) &
        -k(1297)*n(idx_H2j)*n(idx_NH) &
        -k(1298)*n(idx_H2j)*n(idx_NH) &
        -k(1370)*n(idx_N2j)*n(idx_NH) &
        +k(1396)*n(idx_NHj)*n(idx_S) &
        -k(1409)*n(idx_NHj)*n(idx_NH) &
        +k(1410)*n(idx_NHj)*n(idx_NO) &
        +k(1413)*n(idx_NHj)*n(idx_O2) &
        +k(1421)*n(idx_NHj)*n(idx_H2O) &
        +k(1431)*n(idx_NHj)*n(idx_H2CO) &
        +k(1433)*n(idx_NHj)*n(idx_NH3) &
        -k(1452)*n(idx_O2j)*n(idx_NH) &
        -k(1453)*n(idx_O2j)*n(idx_NH) &
        -k(1483)*n(idx_OHj)*n(idx_NH) &
        -k(1611)*n(idx_CH2j)*n(idx_NH) &
        -k(1672)*n(idx_H2Oj)*n(idx_NH) &
        -k(1736)*n(idx_H3j)*n(idx_NH) &
        -k(1882)*n(idx_HCNj)*n(idx_NH) &
        -k(1915)*n(idx_HCOj)*n(idx_NH) &
        -k(2046)*n(idx_HNCj)*n(idx_NH) &
        -k(2065)*n(idx_HNOj)*n(idx_NH) &
        -k(2091)*n(idx_N2Hj)*n(idx_NH) &
        +k(2115)*n(idx_NH2j)*n(idx_S) &
        +k(2117)*n(idx_NH2j)*n(idx_C2) &
        +k(2119)*n(idx_NH2j)*n(idx_CH) &
        -k(2123)*n(idx_NH2j)*n(idx_NH) &
        +k(2127)*n(idx_NH2j)*n(idx_C2H) &
        +k(2129)*n(idx_NH2j)*n(idx_CH2) &
        +k(2130)*n(idx_NH2j)*n(idx_H2O) &
        +k(2135)*n(idx_NH2j)*n(idx_H2S) &
        +k(2138)*n(idx_NH2j)*n(idx_HCN) &
        +k(2140)*n(idx_NH2j)*n(idx_HNC) &
        +k(2141)*n(idx_NH2j)*n(idx_NH2) &
        +k(2143)*n(idx_NH2j)*n(idx_H2CO) &
        +k(2145)*n(idx_NH2j)*n(idx_NH3) &
        -k(2158)*n(idx_O2Hj)*n(idx_NH) &
        -k(2206)*n(idx_C2H2j)*n(idx_NH) &
        -k(2331)*n(idx_CH3j)*n(idx_NH) &
        -k(2409)*n(idx_H2COj)*n(idx_NH) &
        +k(2515)*n(idx_NH3j)*n(idx_C2) &
        -k(2518)*n(idx_NH3j)*n(idx_NH) &
        +k(2526)*n(idx_NH3j)*n(idx_NH2) &
        -k(2919)*n(idx_CH5j)*n(idx_NH) &
        -k(3214)*n(idx_Ck)*n(idx_NH) &
        +k(3221)*n(idx_Hk)*n(idx_N) &
        -k(3227)*n(idx_Hk)*n(idx_NH) &
        -k(3257)*n(idx_C)*n(idx_NH) &
        +k(3326)*n(idx_C)*n(idx_NH2) &
        +k(3345)*n(idx_H)*n(idx_NO) &
        +k(3349)*n(idx_H)*n(idx_HNO) &
        +k(3367)*n(idx_H2)*n(idx_N) &
        -k(3368)*n(idx_H2)*n(idx_NH) &
        -k(3375)*n(idx_N)*n(idx_NH) &
        +k(3393)*n(idx_N)*n(idx_O2H) &
        +k(3404)*n(idx_N)*n(idx_H2CN) &
        +k(3407)*n(idx_N)*n(idx_C2H3) &
        +k(3418)*n(idx_N)*n(idx_C2H5) &
        -k(3440)*n(idx_O)*n(idx_NH) &
        -k(3441)*n(idx_O)*n(idx_NH) &
        +k(3469)*n(idx_O)*n(idx_NH2) &
        -k(3521)*n(idx_S)*n(idx_NH) &
        +k(3590)*n(idx_CO)*n(idx_HNO) &
        -2.d0*k(3592)*n(idx_NH)*n(idx_NH) &
        -k(3593)*n(idx_NH)*n(idx_NO) &
        +k(3602)*n(idx_OH)*n(idx_NH2) &
        +k(3728)*n(idx_HNSIj)*n(idx_E) &
        +k(3741)*n(idx_N2Hj)*n(idx_E) &
        +k(3746)*n(idx_NH2j)*n(idx_E) &
        +k(3821)*n(idx_HNCOj)*n(idx_E) &
        +k(3831)*n(idx_NH3j)*n(idx_E) &
        -k(4271)*n(idx_NH) &
        -k(4272)*n(idx_NH) &
        +k(4303)*n(idx_NH2) &
        +k(4327)*n(idx_NH3) &
        -k(4441)*n(idx_NH) &
        +k(4487)*n(idx_N_DUSTH_DUST)

    !NO
    !NO
    dn(idx_NO) = &
        -k(46)*n(idx_NO) &
        -k(47)*n(idx_NO) &
        +k(86)*n(idx_N2O) &
        +k(90)*n(idx_NO2) &
        -k(218)*n(idx_Cj)*n(idx_NO) &
        -k(442)*n(idx_Hj)*n(idx_NO) &
        -k(655)*n(idx_HEj)*n(idx_NO) &
        -k(656)*n(idx_HEj)*n(idx_NO) &
        +k(718)*n(idx_HEj)*n(idx_HNO) &
        +k(725)*n(idx_HEj)*n(idx_N2O) &
        -k(965)*n(idx_Nj)*n(idx_NO) &
        -k(966)*n(idx_Nj)*n(idx_NO) &
        +k(967)*n(idx_Nj)*n(idx_O2) &
        +k(974)*n(idx_Nj)*n(idx_CO2) &
        +k(984)*n(idx_Nj)*n(idx_OCS) &
        +k(999)*n(idx_Nj)*n(idx_CH3OH) &
        -k(1014)*n(idx_Oj)*n(idx_NO) &
        +k(1031)*n(idx_Oj)*n(idx_N2O) &
        -k(1063)*n(idx_Sj)*n(idx_NO) &
        -k(1132)*n(idx_C2j)*n(idx_NO) &
        -k(1169)*n(idx_CHj)*n(idx_NO) &
        -k(1214)*n(idx_CNj)*n(idx_NO) &
        -k(1215)*n(idx_CNj)*n(idx_NO) &
        +k(1222)*n(idx_CNj)*n(idx_CO2) &
        -k(1247)*n(idx_COj)*n(idx_NO) &
        -k(1299)*n(idx_H2j)*n(idx_NO) &
        -k(1300)*n(idx_H2j)*n(idx_NO) &
        -k(1347)*n(idx_HSj)*n(idx_NO) &
        -k(1371)*n(idx_N2j)*n(idx_NO) &
        -k(1410)*n(idx_NHj)*n(idx_NO) &
        -k(1411)*n(idx_NHj)*n(idx_NO) &
        +k(1435)*n(idx_NOj)*n(idx_FE) &
        +k(1436)*n(idx_NOj)*n(idx_MG) &
        +k(1437)*n(idx_NOj)*n(idx_NA) &
        +k(1438)*n(idx_NOj)*n(idx_SI) &
        -k(1454)*n(idx_O2j)*n(idx_NO) &
        -k(1484)*n(idx_OHj)*n(idx_NO) &
        -k(1485)*n(idx_OHj)*n(idx_NO) &
        -k(1527)*n(idx_S2j)*n(idx_NO) &
        +k(1543)*n(idx_SIOj)*n(idx_N) &
        -k(1551)*n(idx_SIOj)*n(idx_NO) &
        -k(1571)*n(idx_C2Hj)*n(idx_NO) &
        -k(1612)*n(idx_CH2j)*n(idx_NO) &
        -k(1646)*n(idx_CO2j)*n(idx_NO) &
        -k(1673)*n(idx_H2Oj)*n(idx_NO) &
        -k(1706)*n(idx_H2Sj)*n(idx_NO) &
        -k(1737)*n(idx_H3j)*n(idx_NO) &
        -k(1883)*n(idx_HCNj)*n(idx_NO) &
        -k(2047)*n(idx_HNCj)*n(idx_NO) &
        +k(2059)*n(idx_HNOj)*n(idx_C) &
        +k(2061)*n(idx_HNOj)*n(idx_S) &
        +k(2062)*n(idx_HNOj)*n(idx_C2) &
        +k(2063)*n(idx_HNOj)*n(idx_CH) &
        +k(2064)*n(idx_HNOj)*n(idx_CO) &
        +k(2065)*n(idx_HNOj)*n(idx_NH) &
        -k(2066)*n(idx_HNOj)*n(idx_NO) &
        +k(2067)*n(idx_HNOj)*n(idx_OH) &
        +k(2068)*n(idx_HNOj)*n(idx_C2H) &
        +k(2069)*n(idx_HNOj)*n(idx_CH2) &
        +k(2070)*n(idx_HNOj)*n(idx_CO2) &
        +k(2071)*n(idx_HNOj)*n(idx_H2O) &
        +k(2072)*n(idx_HNOj)*n(idx_HCN) &
        +k(2073)*n(idx_HNOj)*n(idx_HCO) &
        +k(2074)*n(idx_HNOj)*n(idx_HNC) &
        +k(2075)*n(idx_HNOj)*n(idx_NH2) &
        +k(2076)*n(idx_HNOj)*n(idx_H2CO) &
        +k(2077)*n(idx_HNOj)*n(idx_NH3) &
        +k(2078)*n(idx_HNOj)*n(idx_CH4) &
        -k(2124)*n(idx_NH2j)*n(idx_NO) &
        -k(2159)*n(idx_O2Hj)*n(idx_NO) &
        -k(2207)*n(idx_C2H2j)*n(idx_NO) &
        -k(2274)*n(idx_C3Hj)*n(idx_NO) &
        -k(2275)*n(idx_C3Hj)*n(idx_NO) &
        -k(2276)*n(idx_C3Hj)*n(idx_NO) &
        -k(2332)*n(idx_CH3j)*n(idx_NO) &
        -k(2410)*n(idx_H2COj)*n(idx_NO) &
        -k(2519)*n(idx_NH3j)*n(idx_NO) &
        -k(3116)*n(idx_Ck)*n(idx_NO) &
        +k(3236)*n(idx_Ok)*n(idx_N) &
        -k(3258)*n(idx_C)*n(idx_NO) &
        -k(3259)*n(idx_C)*n(idx_NO) &
        -k(3345)*n(idx_H)*n(idx_NO) &
        -k(3346)*n(idx_H)*n(idx_NO) &
        +k(3359)*n(idx_H)*n(idx_NO2) &
        -k(3376)*n(idx_N)*n(idx_NO) &
        +k(3378)*n(idx_N)*n(idx_OH) &
        +k(3379)*n(idx_N)*n(idx_O2) &
        +k(3385)*n(idx_N)*n(idx_SO) &
        +2.d0*k(3391)*n(idx_N)*n(idx_NO2) &
        +k(3440)*n(idx_O)*n(idx_NH) &
        +k(3442)*n(idx_O)*n(idx_NS) &
        +k(3450)*n(idx_O)*n(idx_SIN) &
        +k(3466)*n(idx_O)*n(idx_HNO) &
        +k(3471)*n(idx_O)*n(idx_NH2) &
        +k(3472)*n(idx_O)*n(idx_NO2) &
        +k(3474)*n(idx_O)*n(idx_OCN) &
        -k(3529)*n(idx_SI)*n(idx_NO) &
        -k(3544)*n(idx_CH)*n(idx_NO) &
        +k(3546)*n(idx_CH)*n(idx_HNO) &
        -k(3571)*n(idx_CN)*n(idx_NO) &
        +k(3576)*n(idx_CN)*n(idx_HNO) &
        -k(3593)*n(idx_NH)*n(idx_NO) &
        -k(3594)*n(idx_NO)*n(idx_NH2) &
        +k(3601)*n(idx_OH)*n(idx_HNO) &
        +k(3635)*n(idx_CH2)*n(idx_HNO) &
        +k(3637)*n(idx_HCO)*n(idx_HNO) &
        +k(3639)*n(idx_HNO)*n(idx_CH3) &
        +k(3726)*n(idx_HNOj)*n(idx_E) &
        +k(3747)*n(idx_NO2j)*n(idx_E) &
        +k(3802)*n(idx_H2NOj)*n(idx_E) &
        -k(4273)*n(idx_NO) &
        -k(4274)*n(idx_NO) &
        +k(4301)*n(idx_HNO) &
        +k(4305)*n(idx_NO2) &
        -k(4445)*n(idx_NO) &
        +k(4491)*n(idx_N_DUSTO_DUST)

    !NS
    !NS
    dn(idx_NS) = &
        -k(48)*n(idx_NS) &
        -k(219)*n(idx_Cj)*n(idx_NS) &
        -k(220)*n(idx_Cj)*n(idx_NS) &
        -k(443)*n(idx_Hj)*n(idx_NS) &
        -k(657)*n(idx_HEj)*n(idx_NS) &
        -k(658)*n(idx_HEj)*n(idx_NS) &
        -k(1738)*n(idx_H3j)*n(idx_NS) &
        -k(1916)*n(idx_HCOj)*n(idx_NS) &
        +k(3244)*n(idx_Sk)*n(idx_N) &
        -k(3260)*n(idx_C)*n(idx_NS) &
        +k(3374)*n(idx_N)*n(idx_HS) &
        -k(3377)*n(idx_N)*n(idx_NS) &
        -k(3442)*n(idx_O)*n(idx_NS) &
        -k(3443)*n(idx_O)*n(idx_NS) &
        +k(3521)*n(idx_S)*n(idx_NH) &
        +k(3727)*n(idx_HNSj)*n(idx_E) &
        -k(4275)*n(idx_NS)

    !O2
    !O2
    dn(idx_O2) = &
        -k(49)*n(idx_O2) &
        -k(50)*n(idx_O2) &
        +k(92)*n(idx_O2H) &
        -k(221)*n(idx_Cj)*n(idx_O2) &
        -k(222)*n(idx_Cj)*n(idx_O2) &
        -k(422)*n(idx_CLj)*n(idx_O2) &
        -k(444)*n(idx_Hj)*n(idx_O2) &
        -k(659)*n(idx_HEj)*n(idx_O2) &
        -k(660)*n(idx_HEj)*n(idx_O2) &
        +k(691)*n(idx_HEj)*n(idx_CO2) &
        +k(743)*n(idx_HEj)*n(idx_SIO2) &
        +k(744)*n(idx_HEj)*n(idx_SO2) &
        -k(967)*n(idx_Nj)*n(idx_O2) &
        -k(968)*n(idx_Nj)*n(idx_O2) &
        -k(969)*n(idx_Nj)*n(idx_O2) &
        -k(1015)*n(idx_Oj)*n(idx_O2) &
        -k(1046)*n(idx_Pj)*n(idx_O2) &
        -k(1064)*n(idx_Sj)*n(idx_O2) &
        -k(1133)*n(idx_C2j)*n(idx_O2) &
        -k(1170)*n(idx_CHj)*n(idx_O2) &
        -k(1171)*n(idx_CHj)*n(idx_O2) &
        -k(1172)*n(idx_CHj)*n(idx_O2) &
        -k(1216)*n(idx_CNj)*n(idx_O2) &
        -k(1217)*n(idx_CNj)*n(idx_O2) &
        -k(1218)*n(idx_CNj)*n(idx_O2) &
        -k(1248)*n(idx_COj)*n(idx_O2) &
        -k(1281)*n(idx_CSj)*n(idx_O2) &
        -k(1301)*n(idx_H2j)*n(idx_O2) &
        -k(1302)*n(idx_H2j)*n(idx_O2) &
        -k(1372)*n(idx_N2j)*n(idx_O2) &
        -k(1412)*n(idx_NHj)*n(idx_O2) &
        -k(1413)*n(idx_NHj)*n(idx_O2) &
        -k(1414)*n(idx_NHj)*n(idx_O2) &
        +k(1440)*n(idx_O2j)*n(idx_C) &
        +k(1442)*n(idx_O2j)*n(idx_FE) &
        +k(1443)*n(idx_O2j)*n(idx_MG) &
        +k(1445)*n(idx_O2j)*n(idx_NA) &
        +k(1446)*n(idx_O2j)*n(idx_S) &
        +k(1448)*n(idx_O2j)*n(idx_SI) &
        +k(1450)*n(idx_O2j)*n(idx_CH) &
        +k(1454)*n(idx_O2j)*n(idx_NO) &
        +k(1455)*n(idx_O2j)*n(idx_CH2) &
        +k(1457)*n(idx_O2j)*n(idx_H2S) &
        +k(1458)*n(idx_O2j)*n(idx_HCO) &
        +k(1460)*n(idx_O2j)*n(idx_NH2) &
        +k(1461)*n(idx_O2j)*n(idx_NO2) &
        +k(1462)*n(idx_O2j)*n(idx_H2CO) &
        +k(1463)*n(idx_O2j)*n(idx_H2CO) &
        +k(1464)*n(idx_O2j)*n(idx_NH3) &
        +k(1466)*n(idx_O2j)*n(idx_CH3OH) &
        +k(1467)*n(idx_O2j)*n(idx_CH3OH) &
        -k(1486)*n(idx_OHj)*n(idx_O2) &
        -k(1514)*n(idx_PHj)*n(idx_O2) &
        +k(1545)*n(idx_SIOj)*n(idx_O) &
        -k(1613)*n(idx_CH2j)*n(idx_O2) &
        -k(1614)*n(idx_CH2j)*n(idx_O2) &
        -k(1647)*n(idx_CO2j)*n(idx_O2) &
        -k(1674)*n(idx_H2Oj)*n(idx_O2) &
        -k(1739)*n(idx_H3j)*n(idx_O2) &
        -k(1884)*n(idx_HCNj)*n(idx_O2) &
        -k(2048)*n(idx_HNCj)*n(idx_O2) &
        -k(2125)*n(idx_NH2j)*n(idx_O2) &
        -k(2126)*n(idx_NH2j)*n(idx_O2) &
        +k(2148)*n(idx_O2Hj)*n(idx_C) &
        +k(2150)*n(idx_O2Hj)*n(idx_O) &
        +k(2151)*n(idx_O2Hj)*n(idx_S) &
        +k(2152)*n(idx_O2Hj)*n(idx_C2) &
        +k(2153)*n(idx_O2Hj)*n(idx_CH) &
        +k(2154)*n(idx_O2Hj)*n(idx_CN) &
        +k(2155)*n(idx_O2Hj)*n(idx_CO) &
        +k(2156)*n(idx_O2Hj)*n(idx_H2) &
        +k(2157)*n(idx_O2Hj)*n(idx_N2) &
        +k(2158)*n(idx_O2Hj)*n(idx_NH) &
        +k(2159)*n(idx_O2Hj)*n(idx_NO) &
        +k(2160)*n(idx_O2Hj)*n(idx_OH) &
        +k(2161)*n(idx_O2Hj)*n(idx_C2H) &
        +k(2162)*n(idx_O2Hj)*n(idx_CH2) &
        +k(2163)*n(idx_O2Hj)*n(idx_CO2) &
        +k(2164)*n(idx_O2Hj)*n(idx_H2O) &
        +k(2165)*n(idx_O2Hj)*n(idx_HCN) &
        +k(2166)*n(idx_O2Hj)*n(idx_HCO) &
        +k(2167)*n(idx_O2Hj)*n(idx_HNC) &
        +k(2168)*n(idx_O2Hj)*n(idx_NH2) &
        +k(2169)*n(idx_O2Hj)*n(idx_H2CO) &
        +k(2170)*n(idx_O2Hj)*n(idx_NH3) &
        -k(2182)*n(idx_SIH2j)*n(idx_O2) &
        -k(2186)*n(idx_SO2j)*n(idx_O2) &
        -k(2209)*n(idx_C2H2j)*n(idx_O2) &
        -k(2277)*n(idx_C3Hj)*n(idx_O2) &
        -k(2278)*n(idx_C3Hj)*n(idx_O2) &
        -k(2279)*n(idx_C3Hj)*n(idx_O2) &
        -k(2333)*n(idx_CH3j)*n(idx_O2) &
        -k(2411)*n(idx_H2COj)*n(idx_O2) &
        +k(2500)*n(idx_HCO2j)*n(idx_O) &
        -k(2539)*n(idx_SIH3j)*n(idx_O2) &
        -k(2720)*n(idx_CH4j)*n(idx_O2) &
        -k(3097)*n(idx_C6H5j)*n(idx_O2) &
        -k(3117)*n(idx_Ck)*n(idx_O2) &
        -k(3215)*n(idx_Ck)*n(idx_O2) &
        +k(3237)*n(idx_Ok)*n(idx_O) &
        -k(3247)*n(idx_Sk)*n(idx_O2) &
        -k(3261)*n(idx_C)*n(idx_O2) &
        -k(3350)*n(idx_H)*n(idx_O2) &
        +k(3351)*n(idx_H)*n(idx_O2H) &
        -k(3379)*n(idx_N)*n(idx_O2) &
        +k(3390)*n(idx_N)*n(idx_NO2) &
        +k(3393)*n(idx_N)*n(idx_O2H) &
        +k(3435)*n(idx_O)*n(idx_CLO) &
        +k(3444)*n(idx_O)*n(idx_OH) &
        +k(3472)*n(idx_O)*n(idx_NO2) &
        +k(3473)*n(idx_O)*n(idx_O2H) &
        +k(3475)*n(idx_O)*n(idx_OCN) &
        -k(3523)*n(idx_S)*n(idx_O2) &
        -k(3528)*n(idx_SI)*n(idx_O2) &
        -k(3545)*n(idx_CH)*n(idx_O2) &
        -k(3572)*n(idx_CN)*n(idx_O2) &
        +k(3604)*n(idx_OH)*n(idx_O2H) &
        -k(3612)*n(idx_C2H)*n(idx_O2) &
        +k(3647)*n(idx_O)*n(idx_O) &
        +k(3748)*n(idx_O2Hj)*n(idx_E) &
        -k(4276)*n(idx_O2) &
        -k(4277)*n(idx_O2) &
        -k(4439)*n(idx_O2) &
        +k(4485)*n(idx_O_DUSTO_DUST)

    !OH
    !OH
    dn(idx_OH) = &
        -k(51)*n(idx_OH) &
        +k(72)*n(idx_H2O) &
        +k(87)*n(idx_NAOH) &
        +k(91)*n(idx_O2H) &
        +2.d0*k(115)*n(idx_H2O2) &
        +k(137)*n(idx_CH2O2) &
        +k(160)*n(idx_CH3OH) &
        -k(223)*n(idx_Cj)*n(idx_OH) &
        +k(368)*n(idx_Cj)*n(idx_NH2CHO) &
        -k(445)*n(idx_Hj)*n(idx_OH) &
        -k(661)*n(idx_HEj)*n(idx_OH) &
        +k(696)*n(idx_HEj)*n(idx_H2O) &
        +k(729)*n(idx_HEj)*n(idx_NAOH) &
        +k(869)*n(idx_HEj)*n(idx_CH3OH) &
        +k(921)*n(idx_HEj)*n(idx_C2H5OH) &
        -k(970)*n(idx_Nj)*n(idx_OH) &
        -k(971)*n(idx_Nj)*n(idx_OH) &
        -k(1016)*n(idx_Oj)*n(idx_OH) &
        -k(1017)*n(idx_Oj)*n(idx_OH) &
        +k(1024)*n(idx_Oj)*n(idx_H2S) &
        +k(1037)*n(idx_Oj)*n(idx_H2CO) &
        +k(1040)*n(idx_Oj)*n(idx_CH4) &
        +k(1043)*n(idx_Oj)*n(idx_CH3OH) &
        -k(1047)*n(idx_Pj)*n(idx_OH) &
        -k(1065)*n(idx_Sj)*n(idx_OH) &
        -k(1100)*n(idx_SIj)*n(idx_OH) &
        +k(1136)*n(idx_C2j)*n(idx_H2O) &
        +k(1171)*n(idx_CHj)*n(idx_O2) &
        -k(1173)*n(idx_CHj)*n(idx_OH) &
        -k(1219)*n(idx_CNj)*n(idx_OH) &
        +k(1225)*n(idx_CNj)*n(idx_H2O) &
        -k(1249)*n(idx_COj)*n(idx_OH) &
        -k(1250)*n(idx_COj)*n(idx_OH) &
        +k(1257)*n(idx_COj)*n(idx_H2O) &
        -k(1303)*n(idx_H2j)*n(idx_OH) &
        -k(1304)*n(idx_H2j)*n(idx_OH) &
        +k(1342)*n(idx_HSj)*n(idx_O) &
        -k(1373)*n(idx_N2j)*n(idx_OH) &
        +k(1378)*n(idx_N2j)*n(idx_H2O) &
        +k(1412)*n(idx_NHj)*n(idx_O2) &
        -k(1415)*n(idx_NHj)*n(idx_OH) &
        +k(1423)*n(idx_NHj)*n(idx_H2O) &
        +k(1471)*n(idx_OHj)*n(idx_S) &
        +k(1475)*n(idx_OHj)*n(idx_C2) &
        +k(1477)*n(idx_OHj)*n(idx_CH) &
        +k(1484)*n(idx_OHj)*n(idx_NO) &
        +k(1486)*n(idx_OHj)*n(idx_O2) &
        -k(1487)*n(idx_OHj)*n(idx_OH) &
        +k(1491)*n(idx_OHj)*n(idx_C2H) &
        +k(1493)*n(idx_OHj)*n(idx_CH2) &
        +k(1496)*n(idx_OHj)*n(idx_H2O) &
        +k(1498)*n(idx_OHj)*n(idx_H2S) &
        +k(1502)*n(idx_OHj)*n(idx_HCO) &
        +k(1505)*n(idx_OHj)*n(idx_NH2) &
        +k(1507)*n(idx_OHj)*n(idx_H2CO) &
        +k(1509)*n(idx_OHj)*n(idx_NH3) &
        +k(1514)*n(idx_PHj)*n(idx_O2) &
        +k(1613)*n(idx_CH2j)*n(idx_O2) &
        -k(1615)*n(idx_CH2j)*n(idx_OH) &
        +k(1649)*n(idx_CO2j)*n(idx_H2O) &
        +k(1656)*n(idx_H2Oj)*n(idx_C) &
        +k(1663)*n(idx_H2Oj)*n(idx_S) &
        +k(1667)*n(idx_H2Oj)*n(idx_C2) &
        +k(1669)*n(idx_H2Oj)*n(idx_CH) &
        +k(1670)*n(idx_H2Oj)*n(idx_CO) &
        -k(1675)*n(idx_H2Oj)*n(idx_OH) &
        +k(1677)*n(idx_H2Oj)*n(idx_C2H) &
        +k(1679)*n(idx_H2Oj)*n(idx_CH2) &
        +k(1680)*n(idx_H2Oj)*n(idx_H2O) &
        +k(1683)*n(idx_H2Oj)*n(idx_H2S) &
        +k(1684)*n(idx_H2Oj)*n(idx_HCN) &
        +k(1686)*n(idx_H2Oj)*n(idx_HCO) &
        +k(1688)*n(idx_H2Oj)*n(idx_HNC) &
        +k(1690)*n(idx_H2Oj)*n(idx_NH2) &
        +k(1692)*n(idx_H2Oj)*n(idx_H2CO) &
        +k(1694)*n(idx_H2Oj)*n(idx_NH3) &
        +k(1702)*n(idx_H2Sj)*n(idx_O) &
        -k(1740)*n(idx_H3j)*n(idx_OH) &
        +k(1773)*n(idx_H3j)*n(idx_NO2) &
        -k(1885)*n(idx_HCNj)*n(idx_OH) &
        -k(1917)*n(idx_HCOj)*n(idx_OH) &
        -k(1918)*n(idx_HCOj)*n(idx_OH) &
        -k(2049)*n(idx_HNCj)*n(idx_OH) &
        -k(2067)*n(idx_HNOj)*n(idx_OH) &
        -k(2092)*n(idx_N2Hj)*n(idx_OH) &
        +k(2125)*n(idx_NH2j)*n(idx_O2) &
        +k(2131)*n(idx_NH2j)*n(idx_H2O) &
        +k(2146)*n(idx_NO2j)*n(idx_H) &
        -k(2160)*n(idx_O2Hj)*n(idx_OH) &
        +k(2182)*n(idx_SIH2j)*n(idx_O2) &
        -k(2208)*n(idx_C2H2j)*n(idx_OH) &
        -k(2334)*n(idx_CH3j)*n(idx_OH) &
        -k(2520)*n(idx_NH3j)*n(idx_OH) &
        +k(2522)*n(idx_NH3j)*n(idx_H2O) &
        +k(2717)*n(idx_CH4j)*n(idx_O) &
        -k(2920)*n(idx_CH5j)*n(idx_OH) &
        +k(3112)*n(idx_SO2j)*n(idx_H) &
        +k(3123)*n(idx_Ok)*n(idx_HCN) &
        +k(3125)*n(idx_OHk)*n(idx_CN) &
        -k(3216)*n(idx_Ck)*n(idx_OH) &
        +k(3222)*n(idx_Hk)*n(idx_O) &
        -k(3228)*n(idx_Hk)*n(idx_OH) &
        +k(3235)*n(idx_Ok)*n(idx_H) &
        -k(3262)*n(idx_C)*n(idx_OH) &
        -k(3341)*n(idx_H)*n(idx_OH) &
        +k(3343)*n(idx_H)*n(idx_H2O) &
        +k(3346)*n(idx_H)*n(idx_NO) &
        +k(3349)*n(idx_H)*n(idx_HNO) &
        +k(3350)*n(idx_H)*n(idx_O2) &
        +2.d0*k(3352)*n(idx_H)*n(idx_O2H) &
        +k(3354)*n(idx_H)*n(idx_H2O2) &
        +k(3357)*n(idx_H)*n(idx_CO2) &
        +k(3358)*n(idx_H)*n(idx_N2O) &
        +k(3359)*n(idx_H)*n(idx_NO2) &
        +k(3365)*n(idx_H2)*n(idx_O) &
        -k(3366)*n(idx_H2)*n(idx_OH) &
        -k(3378)*n(idx_N)*n(idx_OH) &
        +k(3441)*n(idx_O)*n(idx_NH) &
        -k(3444)*n(idx_O)*n(idx_OH) &
        +k(3459)*n(idx_O)*n(idx_HCO) &
        +k(3463)*n(idx_O)*n(idx_HCS) &
        +k(3465)*n(idx_O)*n(idx_H2S) &
        +k(3466)*n(idx_O)*n(idx_HNO) &
        +k(3468)*n(idx_O)*n(idx_HPO) &
        +k(3469)*n(idx_O)*n(idx_NH2) &
        +k(3473)*n(idx_O)*n(idx_O2H) &
        +k(3477)*n(idx_O)*n(idx_PH2) &
        -k(3524)*n(idx_S)*n(idx_OH) &
        -k(3530)*n(idx_SI)*n(idx_OH) &
        -k(3542)*n(idx_F)*n(idx_OH) &
        +k(3543)*n(idx_F)*n(idx_H2O) &
        +k(3545)*n(idx_CH)*n(idx_O2) &
        -k(3574)*n(idx_CN)*n(idx_OH) &
        -k(3575)*n(idx_CN)*n(idx_OH) &
        -k(3589)*n(idx_CO)*n(idx_OH) &
        -k(3595)*n(idx_OH)*n(idx_SIO) &
        -k(3596)*n(idx_OH)*n(idx_SO) &
        -2.d0*k(3597)*n(idx_OH)*n(idx_OH) &
        -k(3598)*n(idx_OH)*n(idx_CH2) &
        -k(3599)*n(idx_OH)*n(idx_H2S) &
        -k(3600)*n(idx_OH)*n(idx_HCO) &
        -k(3601)*n(idx_OH)*n(idx_HNO) &
        -k(3602)*n(idx_OH)*n(idx_NH2) &
        -k(3603)*n(idx_OH)*n(idx_NH2) &
        -k(3604)*n(idx_OH)*n(idx_O2H) &
        -k(3605)*n(idx_OH)*n(idx_H2CO) &
        -k(3606)*n(idx_OH)*n(idx_H2CO) &
        -k(3607)*n(idx_OH)*n(idx_H2O2) &
        -k(3608)*n(idx_OH)*n(idx_C2H3) &
        -k(3609)*n(idx_OH)*n(idx_C2H5) &
        +k(3646)*n(idx_H)*n(idx_O) &
        -k(3655)*n(idx_H)*n(idx_OH) &
        -2.d0*k(3656)*n(idx_OH)*n(idx_OH) &
        +k(3711)*n(idx_H2Oj)*n(idx_E) &
        +k(3719)*n(idx_HCOj)*n(idx_E) &
        +k(3735)*n(idx_HSIOj)*n(idx_E) &
        +k(3804)*n(idx_H2POj)*n(idx_E) &
        +k(3808)*n(idx_H2SIOj)*n(idx_E) &
        +k(3810)*n(idx_H3Oj)*n(idx_E) &
        +k(3812)*n(idx_H3Oj)*n(idx_E) &
        +k(3819)*n(idx_HCO2j)*n(idx_E) &
        +k(3822)*n(idx_HOCSj)*n(idx_E) &
        +k(3824)*n(idx_HSIO2j)*n(idx_E) &
        +k(3827)*n(idx_HSO2j)*n(idx_E) &
        +k(3967)*n(idx_CH4Oj)*n(idx_E) &
        +k(3975)*n(idx_H2C3Oj)*n(idx_E) &
        +k(3976)*n(idx_H2C3Oj)*n(idx_E) &
        +k(4050)*n(idx_CH5Oj)*n(idx_E) &
        +k(4101)*n(idx_C2H5OHj)*n(idx_E) &
        +k(4243)*n(idx_H3Oj)*n(idx_Hk) &
        -k(4278)*n(idx_OH) &
        -k(4279)*n(idx_OH) &
        +k(4294)*n(idx_H2O) &
        +k(4302)*n(idx_NAOH) &
        +k(4343)*n(idx_CH2O2) &
        +k(4429)*n(idx_OHk) &
        -k(4442)*n(idx_OH) &
        +k(4488)*n(idx_O_DUSTH_DUST)

    !PH
    !PH
    dn(idx_PH) = &
        -k(52)*n(idx_PH) &
        +k(96)*n(idx_PH2) &
        -k(224)*n(idx_Cj)*n(idx_PH) &
        -k(446)*n(idx_Hj)*n(idx_PH) &
        -k(662)*n(idx_HEj)*n(idx_PH) &
        +k(709)*n(idx_HEj)*n(idx_HCP) &
        +k(807)*n(idx_HEj)*n(idx_CH2PH) &
        -k(1741)*n(idx_H3j)*n(idx_PH) &
        -k(1919)*n(idx_HCOj)*n(idx_PH) &
        -k(3263)*n(idx_C)*n(idx_PH) &
        -k(3380)*n(idx_N)*n(idx_PH) &
        -k(3445)*n(idx_O)*n(idx_PH) &
        +k(3461)*n(idx_O)*n(idx_HCP) &
        +k(3477)*n(idx_O)*n(idx_PH2) &
        +k(3731)*n(idx_HPNj)*n(idx_E) &
        +k(3733)*n(idx_HPOj)*n(idx_E) &
        +k(3753)*n(idx_PH2j)*n(idx_E) &
        +k(3804)*n(idx_H2POj)*n(idx_E) &
        +k(3837)*n(idx_PH3j)*n(idx_E) &
        +k(3994)*n(idx_PC2H3j)*n(idx_E)

    !PN
    !PN
    dn(idx_PN) = &
        -k(53)*n(idx_PN) &
        -k(447)*n(idx_Hj)*n(idx_PN) &
        -k(663)*n(idx_HEj)*n(idx_PN) &
        -k(1742)*n(idx_H3j)*n(idx_PN) &
        -k(1920)*n(idx_HCOj)*n(idx_PN) &
        -k(2434)*n(idx_H3Oj)*n(idx_PN) &
        +k(3380)*n(idx_N)*n(idx_PH) &
        +k(3381)*n(idx_N)*n(idx_PO) &
        +k(3732)*n(idx_HPNj)*n(idx_E)

    !PO
    !PO
    dn(idx_PO) = &
        -k(54)*n(idx_PO) &
        +k(84)*n(idx_HPO) &
        -k(225)*n(idx_Cj)*n(idx_PO) &
        -k(448)*n(idx_Hj)*n(idx_PO) &
        -k(664)*n(idx_HEj)*n(idx_PO) &
        -k(1743)*n(idx_H3j)*n(idx_PO) &
        -k(1921)*n(idx_HCOj)*n(idx_PO) &
        +k(2085)*n(idx_HPOj)*n(idx_H2O) &
        -k(3381)*n(idx_N)*n(idx_PO) &
        +k(3445)*n(idx_O)*n(idx_PH) &
        +k(3468)*n(idx_O)*n(idx_HPO) &
        +k(3734)*n(idx_HPOj)*n(idx_E)

    !S2
    !S2
    dn(idx_S2) = &
        -k(55)*n(idx_S2) &
        -k(449)*n(idx_Hj)*n(idx_S2) &
        -k(665)*n(idx_HEj)*n(idx_S2) &
        +k(1527)*n(idx_S2j)*n(idx_NO) &
        -k(1744)*n(idx_H3j)*n(idx_S2) &
        -k(1922)*n(idx_HCOj)*n(idx_S2) &
        +k(2176)*n(idx_S2Hj)*n(idx_H2S) &
        -k(2435)*n(idx_H3Oj)*n(idx_S2) &
        -k(3264)*n(idx_C)*n(idx_S2) &
        -k(3446)*n(idx_O)*n(idx_S2) &
        +k(3522)*n(idx_S)*n(idx_HS) &
        +k(3755)*n(idx_S2Hj)*n(idx_E)

    !SIC
    !SIC
    dn(idx_SIC) = &
        -k(56)*n(idx_SIC) &
        +k(97)*n(idx_SIC2) &
        +k(124)*n(idx_SICH2) &
        -k(226)*n(idx_Cj)*n(idx_SIC) &
        -k(227)*n(idx_Cj)*n(idx_SIC) &
        -k(450)*n(idx_Hj)*n(idx_SIC) &
        -k(666)*n(idx_HEj)*n(idx_SIC) &
        -k(667)*n(idx_HEj)*n(idx_SIC) &
        -k(1066)*n(idx_Sj)*n(idx_SIC) &
        -k(1488)*n(idx_OHj)*n(idx_SIC) &
        -k(1745)*n(idx_H3j)*n(idx_SIC) &
        -k(1923)*n(idx_HCOj)*n(idx_SIC) &
        -k(2436)*n(idx_H3Oj)*n(idx_SIC) &
        +k(3265)*n(idx_C)*n(idx_SIH) &
        -k(3382)*n(idx_N)*n(idx_SIC) &
        -k(3383)*n(idx_N)*n(idx_SIC) &
        -k(3447)*n(idx_O)*n(idx_SIC) &
        -k(3448)*n(idx_O)*n(idx_SIC) &
        +k(3479)*n(idx_O)*n(idx_SIC2) &
        +k(3703)*n(idx_CHSIj)*n(idx_E) &
        +k(3757)*n(idx_SIC2j)*n(idx_E) &
        +k(3786)*n(idx_CH2SIj)*n(idx_E) &
        +k(3842)*n(idx_SIC3j)*n(idx_E) &
        -k(4280)*n(idx_SIC)

    !SIH
    !SIH
    dn(idx_SIH) = &
        -k(57)*n(idx_SIH) &
        +k(98)*n(idx_SIH2) &
        -k(228)*n(idx_Cj)*n(idx_SIH) &
        -k(451)*n(idx_Hj)*n(idx_SIH) &
        -k(452)*n(idx_Hj)*n(idx_SIH) &
        -k(668)*n(idx_HEj)*n(idx_SIH) &
        -k(1067)*n(idx_Sj)*n(idx_SIH) &
        -k(1068)*n(idx_Sj)*n(idx_SIH) &
        +k(1119)*n(idx_SIj)*n(idx_C4H2) &
        -k(1489)*n(idx_OHj)*n(idx_SIH) &
        -k(1746)*n(idx_H3j)*n(idx_SIH) &
        -k(1924)*n(idx_HCOj)*n(idx_SIH) &
        +k(2309)*n(idx_CH2SIj)*n(idx_O) &
        -k(2335)*n(idx_CH3j)*n(idx_SIH) &
        -k(2437)*n(idx_H3Oj)*n(idx_SIH) &
        -k(3265)*n(idx_C)*n(idx_SIH) &
        -k(3384)*n(idx_N)*n(idx_SIH) &
        -k(3449)*n(idx_O)*n(idx_SIH) &
        +k(3760)*n(idx_SIH2j)*n(idx_E) &
        +k(3808)*n(idx_H2SIOj)*n(idx_E) &
        +k(3844)*n(idx_SIH3j)*n(idx_E) &
        -k(4281)*n(idx_SIH)

    !SIN
    !SIN
    dn(idx_SIN) = &
        -k(58)*n(idx_SIN) &
        +k(83)*n(idx_HNSI) &
        -k(229)*n(idx_Cj)*n(idx_SIN) &
        -k(230)*n(idx_Cj)*n(idx_SIN) &
        -k(453)*n(idx_Hj)*n(idx_SIN) &
        -k(669)*n(idx_HEj)*n(idx_SIN) &
        -k(1747)*n(idx_H3j)*n(idx_SIN) &
        +k(2079)*n(idx_HNSIj)*n(idx_CO) &
        +k(2081)*n(idx_HNSIj)*n(idx_H2O) &
        +k(2540)*n(idx_SINCHj)*n(idx_O) &
        +k(3383)*n(idx_N)*n(idx_SIC) &
        +k(3384)*n(idx_N)*n(idx_SIH) &
        -k(3450)*n(idx_O)*n(idx_SIN) &
        -k(3451)*n(idx_O)*n(idx_SIN) &
        +k(3482)*n(idx_O)*n(idx_SINC) &
        +k(3729)*n(idx_HNSIj)*n(idx_E) &
        +k(3846)*n(idx_SINCHj)*n(idx_E) &
        +k(3848)*n(idx_SINH2j)*n(idx_E)

    !SIO
    !SIO
    dn(idx_SIO) = &
        -k(59)*n(idx_SIO) &
        +k(100)*n(idx_SIO2) &
        +k(117)*n(idx_H2SIO) &
        -k(231)*n(idx_Cj)*n(idx_SIO) &
        -k(454)*n(idx_Hj)*n(idx_SIO) &
        -k(670)*n(idx_HEj)*n(idx_SIO) &
        -k(671)*n(idx_HEj)*n(idx_SIO) &
        -k(1490)*n(idx_OHj)*n(idx_SIO) &
        +k(1541)*n(idx_SIOj)*n(idx_FE) &
        +k(1542)*n(idx_SIOj)*n(idx_MG) &
        +k(1551)*n(idx_SIOj)*n(idx_NO) &
        +k(1553)*n(idx_SIOj)*n(idx_HCO) &
        -k(1748)*n(idx_H3j)*n(idx_SIO) &
        -k(1925)*n(idx_HCOj)*n(idx_SIO) &
        -k(2438)*n(idx_H3Oj)*n(idx_SIO) &
        +k(3448)*n(idx_O)*n(idx_SIC) &
        +k(3449)*n(idx_O)*n(idx_SIH) &
        +k(3451)*n(idx_O)*n(idx_SIN) &
        +k(3464)*n(idx_O)*n(idx_HCSI) &
        +k(3480)*n(idx_O)*n(idx_SIH2) &
        +k(3481)*n(idx_O)*n(idx_SIH2) &
        +k(3528)*n(idx_SI)*n(idx_O2) &
        +k(3529)*n(idx_SI)*n(idx_NO) &
        +k(3530)*n(idx_SI)*n(idx_OH) &
        -k(3595)*n(idx_OH)*n(idx_SIO) &
        +k(3736)*n(idx_HSIOj)*n(idx_E) &
        +k(3809)*n(idx_H2SIOj)*n(idx_E) &
        +k(3824)*n(idx_HSIO2j)*n(idx_E) &
        +k(3898)*n(idx_H3SIOj)*n(idx_E) &
        -k(4282)*n(idx_SIO)

    !SIS
    !SIS
    dn(idx_SIS) = &
        -k(60)*n(idx_SIS) &
        -k(232)*n(idx_Cj)*n(idx_SIS) &
        -k(233)*n(idx_Cj)*n(idx_SIS) &
        -k(455)*n(idx_Hj)*n(idx_SIS) &
        -k(672)*n(idx_HEj)*n(idx_SIS) &
        -k(673)*n(idx_HEj)*n(idx_SIS) &
        -k(1069)*n(idx_Sj)*n(idx_SIS) &
        -k(1749)*n(idx_H3j)*n(idx_SIS) &
        -k(1926)*n(idx_HCOj)*n(idx_SIS) &
        +k(3738)*n(idx_HSISj)*n(idx_E) &
        -k(4283)*n(idx_SIS)

    !SO
    !SO
    dn(idx_SO) = &
        -k(61)*n(idx_SO) &
        +k(101)*n(idx_SO2) &
        -k(234)*n(idx_Cj)*n(idx_SO) &
        -k(235)*n(idx_Cj)*n(idx_SO) &
        -k(236)*n(idx_Cj)*n(idx_SO) &
        -k(237)*n(idx_Cj)*n(idx_SO) &
        -k(456)*n(idx_Hj)*n(idx_SO) &
        -k(674)*n(idx_HEj)*n(idx_SO) &
        -k(675)*n(idx_HEj)*n(idx_SO) &
        +k(1036)*n(idx_Oj)*n(idx_SO2) &
        +k(1546)*n(idx_SIOj)*n(idx_S) &
        +k(1556)*n(idx_SOj)*n(idx_FE) &
        +k(1557)*n(idx_SOj)*n(idx_MG) &
        +k(1559)*n(idx_SOj)*n(idx_NA) &
        +k(1561)*n(idx_SOj)*n(idx_NH3) &
        -k(1750)*n(idx_H3j)*n(idx_SO) &
        -k(1927)*n(idx_HCOj)*n(idx_SO) &
        -k(2336)*n(idx_CH3j)*n(idx_SO) &
        +k(3245)*n(idx_Sk)*n(idx_O) &
        -k(3266)*n(idx_C)*n(idx_SO) &
        -k(3267)*n(idx_C)*n(idx_SO) &
        +k(3278)*n(idx_C)*n(idx_SO2) &
        -k(3385)*n(idx_N)*n(idx_SO) &
        +k(3439)*n(idx_O)*n(idx_HS) &
        +k(3443)*n(idx_O)*n(idx_NS) &
        +k(3446)*n(idx_O)*n(idx_S2) &
        +k(3523)*n(idx_S)*n(idx_O2) &
        +k(3524)*n(idx_S)*n(idx_OH) &
        -k(3596)*n(idx_OH)*n(idx_SO) &
        -k(3648)*n(idx_O)*n(idx_SO) &
        +k(3739)*n(idx_HSOj)*n(idx_E) &
        +k(3751)*n(idx_OCSj)*n(idx_E) &
        +k(3762)*n(idx_SO2j)*n(idx_E) &
        +k(3826)*n(idx_HSO2j)*n(idx_E) &
        +k(3827)*n(idx_HSO2j)*n(idx_E) &
        -k(4284)*n(idx_SO) &
        +k(4309)*n(idx_SO2)

    !C2H
    !C2H
    dn(idx_C2H) = &
        -k(62)*n(idx_C2H) &
        +k(102)*n(idx_C2H2) &
        +k(142)*n(idx_HC3N) &
        +2.d0*k(154)*n(idx_C4H2) &
        -k(238)*n(idx_Cj)*n(idx_C2H) &
        +k(288)*n(idx_Cj)*n(idx_HCCP) &
        +k(324)*n(idx_Cj)*n(idx_HCNC2) &
        +k(327)*n(idx_Cj)*n(idx_HC2NC) &
        +k(356)*n(idx_Cj)*n(idx_C4H2) &
        +k(377)*n(idx_Cj)*n(idx_C3H4) &
        +k(385)*n(idx_Cj)*n(idx_C4H3) &
        +k(386)*n(idx_Cj)*n(idx_C4H3) &
        -k(457)*n(idx_Hj)*n(idx_C2H) &
        -k(458)*n(idx_Hj)*n(idx_C2H) &
        +k(535)*n(idx_Hj)*n(idx_HCNC2) &
        +k(547)*n(idx_Hj)*n(idx_HNC3) &
        -k(676)*n(idx_HEj)*n(idx_C2H) &
        -k(677)*n(idx_HEj)*n(idx_C2H) &
        -k(678)*n(idx_HEj)*n(idx_C2H) &
        +k(780)*n(idx_HEj)*n(idx_SIC2H) &
        +k(821)*n(idx_HEj)*n(idx_HC2NC) &
        +k(826)*n(idx_HEj)*n(idx_HC3N) &
        +k(839)*n(idx_HEj)*n(idx_SIC2H2) &
        +k(860)*n(idx_HEj)*n(idx_C4H2) &
        +k(894)*n(idx_HEj)*n(idx_C5H2) &
        +k(908)*n(idx_HEj)*n(idx_C6H2) &
        +k(923)*n(idx_HEj)*n(idx_C7H2) &
        +k(936)*n(idx_HEj)*n(idx_C8H2) &
        +k(943)*n(idx_HEj)*n(idx_C9H2) &
        -k(972)*n(idx_Nj)*n(idx_C2H) &
        -k(1018)*n(idx_Oj)*n(idx_C2H) &
        -k(1019)*n(idx_Oj)*n(idx_C2H) &
        -k(1070)*n(idx_Sj)*n(idx_C2H) &
        -k(1174)*n(idx_CHj)*n(idx_C2H) &
        -k(1220)*n(idx_CNj)*n(idx_C2H) &
        -k(1251)*n(idx_COj)*n(idx_C2H) &
        -k(1252)*n(idx_COj)*n(idx_C2H) &
        -k(1305)*n(idx_H2j)*n(idx_C2H) &
        -k(1306)*n(idx_H2j)*n(idx_C2H) &
        -k(1374)*n(idx_N2j)*n(idx_C2H) &
        -k(1416)*n(idx_NHj)*n(idx_C2H) &
        -k(1491)*n(idx_OHj)*n(idx_C2H) &
        -k(1492)*n(idx_OHj)*n(idx_C2H) &
        +k(1566)*n(idx_C2Hj)*n(idx_S) &
        +k(1571)*n(idx_C2Hj)*n(idx_NO) &
        -k(1616)*n(idx_CH2j)*n(idx_C2H) &
        -k(1617)*n(idx_CH2j)*n(idx_C2H) &
        -k(1676)*n(idx_H2Oj)*n(idx_C2H) &
        -k(1677)*n(idx_H2Oj)*n(idx_C2H) &
        -k(1751)*n(idx_H3j)*n(idx_C2H) &
        -k(1886)*n(idx_HCNj)*n(idx_C2H) &
        -k(1928)*n(idx_HCOj)*n(idx_C2H) &
        -k(2050)*n(idx_HNCj)*n(idx_C2H) &
        -k(2068)*n(idx_HNOj)*n(idx_C2H) &
        -k(2093)*n(idx_N2Hj)*n(idx_C2H) &
        -k(2127)*n(idx_NH2j)*n(idx_C2H) &
        -k(2161)*n(idx_O2Hj)*n(idx_C2H) &
        -k(2210)*n(idx_C2H2j)*n(idx_C2H) &
        +k(2218)*n(idx_C2H2j)*n(idx_HNC) &
        +k(2220)*n(idx_C2H2j)*n(idx_NH2) &
        +k(2230)*n(idx_C2H2j)*n(idx_NH3) &
        +k(2301)*n(idx_C3Hj)*n(idx_C4H2) &
        -k(2337)*n(idx_CH3j)*n(idx_C2H) &
        -k(2338)*n(idx_CH3j)*n(idx_C2H) &
        -k(2339)*n(idx_CH3j)*n(idx_C2H) &
        -k(2340)*n(idx_CH3j)*n(idx_C2H) &
        -k(2412)*n(idx_H2COj)*n(idx_C2H) &
        -k(2553)*n(idx_C2H3j)*n(idx_C2H) &
        -k(2554)*n(idx_C2H3j)*n(idx_C2H) &
        -k(2555)*n(idx_C2H3j)*n(idx_C2H) &
        +k(2616)*n(idx_C3H2j)*n(idx_O) &
        +k(2617)*n(idx_H2C3j)*n(idx_O) &
        -k(2626)*n(idx_C3H2j)*n(idx_C2H) &
        -k(2627)*n(idx_H2C3j)*n(idx_C2H) &
        -k(2690)*n(idx_C4Hj)*n(idx_C2H) &
        -k(2691)*n(idx_C4Hj)*n(idx_C2H) &
        -k(2769)*n(idx_C2H4j)*n(idx_C2H) &
        -k(2770)*n(idx_C2H4j)*n(idx_C2H) &
        -k(2771)*n(idx_C2H4j)*n(idx_C2H) &
        -k(2824)*n(idx_C3H3j)*n(idx_C2H) &
        -k(2825)*n(idx_H3C3j)*n(idx_C2H) &
        -k(2826)*n(idx_C3H3j)*n(idx_C2H) &
        -k(2827)*n(idx_H3C3j)*n(idx_C2H) &
        -k(2880)*n(idx_C4H2j)*n(idx_C2H) &
        -k(2921)*n(idx_CH5j)*n(idx_C2H) &
        -k(2971)*n(idx_C4H3j)*n(idx_C2H) &
        -k(2992)*n(idx_C5H2j)*n(idx_C2H) &
        +k(3010)*n(idx_C5H2j)*n(idx_C4H2) &
        -k(3037)*n(idx_C6H2j)*n(idx_C2H) &
        -k(3069)*n(idx_C7H2j)*n(idx_C2H) &
        +k(3212)*n(idx_Ck)*n(idx_CH) &
        +k(3223)*n(idx_Hk)*n(idx_C2) &
        -k(3229)*n(idx_Hk)*n(idx_C2H) &
        +k(3268)*n(idx_C)*n(idx_CH2) &
        -k(3272)*n(idx_C)*n(idx_C2H) &
        -k(3395)*n(idx_N)*n(idx_C2H) &
        -k(3452)*n(idx_O)*n(idx_C2H) &
        +k(3486)*n(idx_O)*n(idx_C3H) &
        +k(3487)*n(idx_O)*n(idx_HC3) &
        -k(3610)*n(idx_C2H)*n(idx_S) &
        -k(3611)*n(idx_C2H)*n(idx_CS) &
        -k(3612)*n(idx_C2H)*n(idx_O2) &
        -k(3613)*n(idx_C2H)*n(idx_HCN) &
        -k(3614)*n(idx_C2H)*n(idx_HNC) &
        -k(3615)*n(idx_C2H)*n(idx_C2H2) &
        -k(3616)*n(idx_C2H)*n(idx_C3H2) &
        -k(3617)*n(idx_C2H)*n(idx_H2C3) &
        -k(3618)*n(idx_C2H)*n(idx_C4H2) &
        -k(3619)*n(idx_C2H)*n(idx_C5H2) &
        -k(3620)*n(idx_C2H)*n(idx_C6H2) &
        -k(3621)*n(idx_C2H)*n(idx_C7H2) &
        -k(3622)*n(idx_C2H)*n(idx_C3) &
        -k(3623)*n(idx_C2H)*n(idx_C5) &
        -k(3624)*n(idx_C2H)*n(idx_C7) &
        -k(3625)*n(idx_C2H)*n(idx_C9) &
        -k(3626)*n(idx_C2H)*n(idx_C2) &
        -k(3627)*n(idx_C2H)*n(idx_C4) &
        -k(3628)*n(idx_C2H)*n(idx_C6) &
        -k(3629)*n(idx_C2H)*n(idx_C8) &
        -k(3630)*n(idx_C2H)*n(idx_HC3N) &
        -k(3631)*n(idx_C2H)*n(idx_HC5N) &
        -k(3632)*n(idx_C2H)*n(idx_HC7N) &
        -k(3633)*n(idx_C2H)*n(idx_HC9N) &
        -k(3634)*n(idx_C2H)*n(idx_HC11N) &
        -k(3651)*n(idx_CN)*n(idx_C2H) &
        +k(3763)*n(idx_C2H2j)*n(idx_E) &
        +k(3770)*n(idx_C2HOj)*n(idx_E) &
        +k(3776)*n(idx_C3Hj)*n(idx_E) &
        +k(3840)*n(idx_SIC2Hj)*n(idx_E) &
        +k(3856)*n(idx_C2H3j)*n(idx_E) &
        +k(3857)*n(idx_C2H3j)*n(idx_E) &
        +k(3873)*n(idx_C3HNj)*n(idx_E) &
        +k(3875)*n(idx_C4Hj)*n(idx_E) &
        +k(3939)*n(idx_C2H4j)*n(idx_E) &
        +k(3943)*n(idx_C3H2Nj)*n(idx_E) &
        +k(3979)*n(idx_HC2NCHj)*n(idx_E) &
        +k(3989)*n(idx_HC4Sj)*n(idx_E) &
        +k(3999)*n(idx_PC4Hj)*n(idx_E) &
        +k(4020)*n(idx_C2H5j)*n(idx_E) &
        +k(4031)*n(idx_C3H4j)*n(idx_E) &
        +k(4039)*n(idx_C5HNj)*n(idx_E) &
        +k(4108)*n(idx_C4H5j)*n(idx_E) &
        -k(4285)*n(idx_C2H) &
        -k(4286)*n(idx_C2H) &
        +k(4310)*n(idx_C2H2) &
        +k(4338)*n(idx_C4H) &
        +k(4349)*n(idx_HC3N) &
        +2.d0*k(4358)*n(idx_C4H2) &
        +k(4361)*n(idx_C5H) &
        +k(4377)*n(idx_C5H2) &
        +k(4378)*n(idx_C5H2) &
        +k(4380)*n(idx_C6H) &
        -k(4447)*n(idx_C2H) &
        +k(4493)*n(idx_C_DUSTC_DUSTH_DUST)

    !C2N
    !C2N
    dn(idx_C2N) = &
        -k(63)*n(idx_C2N) &
        +k(321)*n(idx_Cj)*n(idx_HCNC2) &
        +k(326)*n(idx_Cj)*n(idx_HC2NC) &
        -k(459)*n(idx_Hj)*n(idx_C2N) &
        -k(679)*n(idx_HEj)*n(idx_C2N) &
        -k(1752)*n(idx_H3j)*n(idx_C2N) &
        -k(3271)*n(idx_C)*n(idx_C2N) &
        +k(3283)*n(idx_C)*n(idx_H2CN) &
        +k(3395)*n(idx_N)*n(idx_C2H) &
        -k(3396)*n(idx_N)*n(idx_C2N) &
        +k(3401)*n(idx_N)*n(idx_C3N) &
        +k(3425)*n(idx_N)*n(idx_C7N) &
        +k(3430)*n(idx_N)*n(idx_C9N) &
        -k(3453)*n(idx_O)*n(idx_C2N) &
        +k(3488)*n(idx_O)*n(idx_C3N) &
        +k(3773)*n(idx_C2N2j)*n(idx_E) &
        +k(3775)*n(idx_C2NHj)*n(idx_E) &
        +k(3852)*n(idx_CH2CNj)*n(idx_E) &
        +k(3879)*n(idx_C4Nj)*n(idx_E) &
        +k(3930)*n(idx_CH3CNj)*n(idx_E) &
        -k(4287)*n(idx_C2N) &
        -k(4288)*n(idx_C2N) &
        -k(4453)*n(idx_C2N) &
        +k(4499)*n(idx_C_DUSTC_DUSTN_DUST)

    !C2S
    !C2S
    dn(idx_C2S) = &
        -k(64)*n(idx_C2S) &
        -k(239)*n(idx_Cj)*n(idx_C2S) &
        -k(240)*n(idx_Cj)*n(idx_C2S) &
        -k(460)*n(idx_Hj)*n(idx_C2S) &
        -k(680)*n(idx_HEj)*n(idx_C2S) &
        -k(681)*n(idx_HEj)*n(idx_C2S) &
        -k(682)*n(idx_HEj)*n(idx_C2S) &
        -k(683)*n(idx_HEj)*n(idx_C2S) &
        -k(1753)*n(idx_H3j)*n(idx_C2S) &
        -k(1929)*n(idx_HCOj)*n(idx_C2S) &
        -k(2439)*n(idx_H3Oj)*n(idx_C2S) &
        +k(3610)*n(idx_C2H)*n(idx_S) &
        +k(3781)*n(idx_C3Sj)*n(idx_E) &
        +k(3817)*n(idx_HC2Sj)*n(idx_E) &
        +k(3883)*n(idx_C4Sj)*n(idx_E) &
        +k(3903)*n(idx_HC3Sj)*n(idx_E) &
        +k(3989)*n(idx_HC4Sj)*n(idx_E) &
        -k(4289)*n(idx_C2S)

    !C3
    !C3
    dn(idx_C3) = &
        -k(65)*n(idx_C3) &
        +k(104)*n(idx_C3H) &
        +k(105)*n(idx_HC3) &
        +k(110)*n(idx_C4) &
        +k(133)*n(idx_C4N) &
        +k(135)*n(idx_C4S) &
        +k(322)*n(idx_Cj)*n(idx_HCNC2) &
        +k(334)*n(idx_Cj)*n(idx_HNC3) &
        -k(461)*n(idx_Hj)*n(idx_C3) &
        -k(684)*n(idx_HEj)*n(idx_C3) &
        -k(685)*n(idx_HEj)*n(idx_C3) &
        +k(758)*n(idx_HEj)*n(idx_C3P) &
        +k(762)*n(idx_HEj)*n(idx_C4) &
        +k(800)*n(idx_HEj)*n(idx_C4S) &
        +k(835)*n(idx_HEj)*n(idx_HNC3) &
        +k(1600)*n(idx_C2Nj)*n(idx_C2H2) &
        +k(1640)*n(idx_CNCj)*n(idx_C2H2) &
        -k(1754)*n(idx_H3j)*n(idx_C3) &
        -k(1930)*n(idx_HCOj)*n(idx_C3) &
        +k(2294)*n(idx_C3Hj)*n(idx_NH3) &
        -k(2440)*n(idx_H3Oj)*n(idx_C3) &
        +k(2688)*n(idx_C4Hj)*n(idx_O) &
        -k(3130)*n(idx_Cj)*n(idx_C3) &
        +k(3272)*n(idx_C)*n(idx_C2H) &
        +k(3282)*n(idx_C)*n(idx_C2H2) &
        +k(3286)*n(idx_C)*n(idx_HCNC2) &
        +k(3287)*n(idx_C)*n(idx_HNC3) &
        +k(3295)*n(idx_C)*n(idx_C3N) &
        +k(3296)*n(idx_C)*n(idx_C3O) &
        +k(3317)*n(idx_C)*n(idx_C4) &
        +2.d0*k(3318)*n(idx_C)*n(idx_C5) &
        +k(3320)*n(idx_C)*n(idx_C6) &
        +k(3321)*n(idx_C)*n(idx_C7) &
        +k(3323)*n(idx_C)*n(idx_C8) &
        -k(3398)*n(idx_N)*n(idx_C3) &
        +k(3411)*n(idx_N)*n(idx_C4) &
        -k(3478)*n(idx_O)*n(idx_C3) &
        +k(3491)*n(idx_O)*n(idx_C4) &
        -k(3554)*n(idx_CH)*n(idx_C3) &
        +k(3558)*n(idx_CH)*n(idx_C2) &
        -k(3622)*n(idx_C2H)*n(idx_C3) &
        +k(3653)*n(idx_C)*n(idx_C2) &
        -k(3654)*n(idx_C)*n(idx_C3) &
        +k(3777)*n(idx_C3Hj)*n(idx_E) &
        +k(3782)*n(idx_C3Sj)*n(idx_E) &
        +k(3784)*n(idx_C4j)*n(idx_E) &
        +k(3864)*n(idx_C3H2j)*n(idx_E) &
        +k(3865)*n(idx_H2C3j)*n(idx_E) &
        +k(3866)*n(idx_C3H2j)*n(idx_E) &
        +k(3867)*n(idx_H2C3j)*n(idx_E) &
        +k(3877)*n(idx_C4Hj)*n(idx_E) &
        +k(3884)*n(idx_C4Sj)*n(idx_E) &
        +k(3886)*n(idx_C5j)*n(idx_E) &
        +k(4043)*n(idx_C7j)*n(idx_E) &
        -k(4290)*n(idx_C3) &
        +k(4312)*n(idx_C3H) &
        +k(4313)*n(idx_HC3) &
        +k(4318)*n(idx_C4) &
        +k(4334)*n(idx_C3H2) &
        +k(4335)*n(idx_H2C3) &
        +k(4340)*n(idx_C4N) &
        +k(4341)*n(idx_C4S) &
        +k(4342)*n(idx_C5) &
        +k(4361)*n(idx_C5H) &
        +k(4381)*n(idx_C6H) &
        +k(4382)*n(idx_C6H)

    !CCO
    !CCO
    dn(idx_CCO) = &
        -k(66)*n(idx_CCO) &
        -k(67)*n(idx_CCO) &
        -k(241)*n(idx_Cj)*n(idx_CCO) &
        -k(462)*n(idx_Hj)*n(idx_CCO) &
        -k(686)*n(idx_HEj)*n(idx_CCO) &
        -k(1755)*n(idx_H3j)*n(idx_CCO) &
        -k(1931)*n(idx_HCOj)*n(idx_CCO) &
        +k(2277)*n(idx_C3Hj)*n(idx_O2) &
        -k(2441)*n(idx_H3Oj)*n(idx_CCO) &
        +k(3270)*n(idx_C)*n(idx_HCO) &
        -k(3273)*n(idx_C)*n(idx_CCO) &
        -k(3397)*n(idx_N)*n(idx_CCO) &
        -k(3454)*n(idx_O)*n(idx_CCO) &
        +k(3489)*n(idx_O)*n(idx_C3O) &
        +k(3771)*n(idx_C2HOj)*n(idx_E)

    !CCP
    !CCP
    dn(idx_CCP) = &
        -k(68)*n(idx_CCP) &
        -k(69)*n(idx_CCP) &
        +k(108)*n(idx_C3P) &
        +k(118)*n(idx_HCCP) &
        -k(242)*n(idx_Cj)*n(idx_CCP) &
        -k(243)*n(idx_Cj)*n(idx_CCP) &
        -k(463)*n(idx_Hj)*n(idx_CCP) &
        -k(687)*n(idx_HEj)*n(idx_CCP) &
        -k(688)*n(idx_HEj)*n(idx_CCP) &
        +k(798)*n(idx_HEj)*n(idx_C4P) &
        -k(1756)*n(idx_H3j)*n(idx_CCP) &
        -k(1932)*n(idx_HCOj)*n(idx_CCP) &
        -k(2442)*n(idx_H3Oj)*n(idx_CCP) &
        -k(3455)*n(idx_O)*n(idx_CCP) &
        +k(3490)*n(idx_O)*n(idx_C3P) &
        +k(3834)*n(idx_PC2Hj)*n(idx_E) &
        +k(3881)*n(idx_C4Pj)*n(idx_E) &
        +k(3910)*n(idx_PC2H2j)*n(idx_E) &
        +k(3912)*n(idx_PC3Hj)*n(idx_E) &
        +k(3995)*n(idx_PC2H3j)*n(idx_E) &
        +k(3999)*n(idx_PC4Hj)*n(idx_E) &
        +k(4063)*n(idx_PC2H4j)*n(idx_E) &
        +k(4065)*n(idx_PC4H2j)*n(idx_E)

    !CH2
    !CH2
    dn(idx_CH2) = &
        -k(70)*n(idx_CH2) &
        +k(111)*n(idx_CH3) &
        +k(126)*n(idx_CH2CN) &
        +k(127)*n(idx_C2H2O) &
        +k(141)*n(idx_CH4) &
        -k(244)*n(idx_Cj)*n(idx_CH2) &
        -k(245)*n(idx_Cj)*n(idx_CH2) &
        -k(464)*n(idx_Hj)*n(idx_CH2) &
        -k(465)*n(idx_Hj)*n(idx_CH2) &
        -k(689)*n(idx_HEj)*n(idx_CH2) &
        -k(690)*n(idx_HEj)*n(idx_CH2) &
        +k(769)*n(idx_HEj)*n(idx_H2CS) &
        +k(788)*n(idx_HEj)*n(idx_C2H2O) &
        +k(806)*n(idx_HEj)*n(idx_CH2PH) &
        +k(808)*n(idx_HEj)*n(idx_CH3N) &
        +k(845)*n(idx_HEj)*n(idx_SICH3) &
        +k(852)*n(idx_HEj)*n(idx_C2H4) &
        -k(973)*n(idx_Nj)*n(idx_CH2) &
        +k(986)*n(idx_Nj)*n(idx_H2CO) &
        -k(1020)*n(idx_Oj)*n(idx_CH2) &
        -k(1071)*n(idx_Sj)*n(idx_CH2) &
        -k(1102)*n(idx_SIj)*n(idx_CH2) &
        -k(1134)*n(idx_C2j)*n(idx_CH2) &
        -k(1135)*n(idx_C2j)*n(idx_CH2) &
        +k(1146)*n(idx_C2j)*n(idx_CH4) &
        -k(1175)*n(idx_CHj)*n(idx_CH2) &
        +k(1193)*n(idx_CHj)*n(idx_H2CO) &
        +k(1203)*n(idx_CHj)*n(idx_CH3OH) &
        -k(1221)*n(idx_CNj)*n(idx_CH2) &
        -k(1253)*n(idx_COj)*n(idx_CH2) &
        -k(1254)*n(idx_COj)*n(idx_CH2) &
        -k(1307)*n(idx_H2j)*n(idx_CH2) &
        -k(1308)*n(idx_H2j)*n(idx_CH2) &
        -k(1375)*n(idx_N2j)*n(idx_CH2) &
        -k(1417)*n(idx_NHj)*n(idx_CH2) &
        -k(1455)*n(idx_O2j)*n(idx_CH2) &
        -k(1456)*n(idx_O2j)*n(idx_CH2) &
        -k(1493)*n(idx_OHj)*n(idx_CH2) &
        -k(1494)*n(idx_OHj)*n(idx_CH2) &
        +k(1511)*n(idx_OHj)*n(idx_CH4) &
        -k(1552)*n(idx_SIOj)*n(idx_CH2) &
        -k(1572)*n(idx_C2Hj)*n(idx_CH2) &
        -k(1573)*n(idx_C2Hj)*n(idx_CH2) &
        -k(1574)*n(idx_C2Hj)*n(idx_CH2) &
        +k(1612)*n(idx_CH2j)*n(idx_NO) &
        -k(1618)*n(idx_CH2j)*n(idx_CH2) &
        -k(1678)*n(idx_H2Oj)*n(idx_CH2) &
        -k(1679)*n(idx_H2Oj)*n(idx_CH2) &
        -k(1757)*n(idx_H3j)*n(idx_CH2) &
        -k(1887)*n(idx_HCNj)*n(idx_CH2) &
        -k(1933)*n(idx_HCOj)*n(idx_CH2) &
        -k(2051)*n(idx_HNCj)*n(idx_CH2) &
        -k(2069)*n(idx_HNOj)*n(idx_CH2) &
        -k(2094)*n(idx_N2Hj)*n(idx_CH2) &
        -k(2128)*n(idx_NH2j)*n(idx_CH2) &
        -k(2129)*n(idx_NH2j)*n(idx_CH2) &
        -k(2162)*n(idx_O2Hj)*n(idx_CH2) &
        -k(2211)*n(idx_C2H2j)*n(idx_CH2) &
        -k(2212)*n(idx_C2H2j)*n(idx_CH2) &
        +k(2232)*n(idx_C2H2j)*n(idx_C2H3) &
        +k(2233)*n(idx_C2H2j)*n(idx_C2H3) &
        -k(2341)*n(idx_CH3j)*n(idx_CH2) &
        +k(2353)*n(idx_CH3j)*n(idx_NH3) &
        -k(2393)*n(idx_HCNHj)*n(idx_CH2) &
        -k(2394)*n(idx_HCNHj)*n(idx_CH2) &
        -k(2413)*n(idx_H2COj)*n(idx_CH2) &
        -k(2414)*n(idx_H2COj)*n(idx_CH2) &
        -k(2443)*n(idx_H3Oj)*n(idx_CH2) &
        -k(2521)*n(idx_NH3j)*n(idx_CH2) &
        +k(2769)*n(idx_C2H4j)*n(idx_C2H) &
        +k(2770)*n(idx_C2H4j)*n(idx_C2H) &
        +k(2911)*n(idx_CH5j)*n(idx_O) &
        -k(2922)*n(idx_CH5j)*n(idx_CH2) &
        +k(3213)*n(idx_Ck)*n(idx_H2) &
        -k(3217)*n(idx_Ck)*n(idx_CH2) &
        +k(3224)*n(idx_Hk)*n(idx_CH) &
        -k(3230)*n(idx_Hk)*n(idx_CH2) &
        -k(3241)*n(idx_Ok)*n(idx_CH2) &
        -k(3268)*n(idx_C)*n(idx_CH2) &
        -k(3325)*n(idx_C)*n(idx_CH2) &
        +k(3332)*n(idx_H)*n(idx_HCO) &
        -k(3338)*n(idx_H)*n(idx_CH2) &
        +k(3339)*n(idx_H)*n(idx_CH3) &
        +k(3362)*n(idx_H2)*n(idx_CH) &
        -k(3363)*n(idx_H2)*n(idx_CH2) &
        -k(3386)*n(idx_N)*n(idx_CH2) &
        -k(3387)*n(idx_N)*n(idx_CH2) &
        -k(3456)*n(idx_O)*n(idx_CH2) &
        -k(3457)*n(idx_O)*n(idx_CH2) &
        -k(3525)*n(idx_S)*n(idx_CH2) &
        -k(3526)*n(idx_S)*n(idx_CH2) &
        -k(3531)*n(idx_SI)*n(idx_CH2) &
        +k(3546)*n(idx_CH)*n(idx_HNO) &
        -k(3598)*n(idx_OH)*n(idx_CH2) &
        -k(3635)*n(idx_CH2)*n(idx_HNO) &
        +k(3645)*n(idx_C)*n(idx_H2) &
        +k(3766)*n(idx_C2H2j)*n(idx_E) &
        +k(3785)*n(idx_CH2SIj)*n(idx_E) &
        +k(3791)*n(idx_CH3j)*n(idx_E) &
        +k(3851)*n(idx_CH2CNj)*n(idx_E) &
        +k(3854)*n(idx_C2H2Oj)*n(idx_E) &
        +k(3861)*n(idx_C2H3j)*n(idx_E) &
        +k(3862)*n(idx_C3H2j)*n(idx_E) &
        +k(3863)*n(idx_H2C3j)*n(idx_E) &
        +k(3889)*n(idx_CH4j)*n(idx_E) &
        +k(3931)*n(idx_CH3CNj)*n(idx_E) &
        +2.d0*k(3942)*n(idx_C2H4j)*n(idx_E) &
        +k(3964)*n(idx_CH4Nj)*n(idx_E) &
        +k(3972)*n(idx_CH5j)*n(idx_E) &
        +k(4030)*n(idx_C3H4j)*n(idx_E) &
        +k(4051)*n(idx_CH5Oj)*n(idx_E) &
        +k(4097)*n(idx_H3C4Nj)*n(idx_E) &
        +k(4126)*n(idx_CH3OCH3j)*n(idx_E) &
        +k(4135)*n(idx_C2H6COj)*n(idx_E) &
        -k(4291)*n(idx_CH2) &
        -k(4292)*n(idx_CH2) &
        +k(4320)*n(idx_CH3) &
        +k(4330)*n(idx_C2H2O) &
        +k(4347)*n(idx_CH4) &
        -k(4450)*n(idx_CH2) &
        +k(4496)*n(idx_C_DUSTH_DUSTH_DUST)

    !CO2
    !CO2
    dn(idx_CO2) = &
        -k(71)*n(idx_CO2) &
        -k(246)*n(idx_Cj)*n(idx_CO2) &
        -k(466)*n(idx_Hj)*n(idx_CO2) &
        -k(691)*n(idx_HEj)*n(idx_CO2) &
        -k(692)*n(idx_HEj)*n(idx_CO2) &
        -k(693)*n(idx_HEj)*n(idx_CO2) &
        -k(694)*n(idx_HEj)*n(idx_CO2) &
        -k(695)*n(idx_HEj)*n(idx_CO2) &
        -k(974)*n(idx_Nj)*n(idx_CO2) &
        -k(975)*n(idx_Nj)*n(idx_CO2) &
        -k(1021)*n(idx_Oj)*n(idx_CO2) &
        +k(1034)*n(idx_Oj)*n(idx_OCS) &
        -k(1176)*n(idx_CHj)*n(idx_CO2) &
        -k(1222)*n(idx_CNj)*n(idx_CO2) &
        -k(1223)*n(idx_CNj)*n(idx_CO2) &
        -k(1224)*n(idx_CNj)*n(idx_CO2) &
        -k(1255)*n(idx_COj)*n(idx_CO2) &
        +k(1264)*n(idx_COj)*n(idx_SO2) &
        -k(1309)*n(idx_H2j)*n(idx_CO2) &
        -k(1310)*n(idx_H2j)*n(idx_CO2) &
        -k(1311)*n(idx_H2j)*n(idx_CO2) &
        -k(1376)*n(idx_N2j)*n(idx_CO2) &
        -k(1418)*n(idx_NHj)*n(idx_CO2) &
        -k(1419)*n(idx_NHj)*n(idx_CO2) &
        -k(1420)*n(idx_NHj)*n(idx_CO2) &
        -k(1495)*n(idx_OHj)*n(idx_CO2) &
        +k(1549)*n(idx_SIOj)*n(idx_CO) &
        -k(1575)*n(idx_C2Hj)*n(idx_CO2) &
        -k(1619)*n(idx_CH2j)*n(idx_CO2) &
        +k(1641)*n(idx_CO2j)*n(idx_H) &
        +k(1643)*n(idx_CO2j)*n(idx_O) &
        +k(1646)*n(idx_CO2j)*n(idx_NO) &
        +k(1647)*n(idx_CO2j)*n(idx_O2) &
        +k(1648)*n(idx_CO2j)*n(idx_H2O) &
        +k(1650)*n(idx_CO2j)*n(idx_H2S) &
        +k(1651)*n(idx_CO2j)*n(idx_NH3) &
        +k(1653)*n(idx_CO2j)*n(idx_CH4) &
        -k(1758)*n(idx_H3j)*n(idx_CO2) &
        -k(1888)*n(idx_HCNj)*n(idx_CO2) &
        -k(2070)*n(idx_HNOj)*n(idx_CO2) &
        -k(2095)*n(idx_N2Hj)*n(idx_CO2) &
        -k(2163)*n(idx_O2Hj)*n(idx_CO2) &
        +k(2184)*n(idx_SO2j)*n(idx_CO) &
        -k(2280)*n(idx_C3Hj)*n(idx_CO2) &
        +k(2499)*n(idx_HCO2j)*n(idx_C) &
        +k(2501)*n(idx_HCO2j)*n(idx_CO) &
        +k(2502)*n(idx_HCO2j)*n(idx_H2O) &
        +k(2503)*n(idx_HCO2j)*n(idx_C2H2) &
        +k(2504)*n(idx_HCO2j)*n(idx_NH3) &
        +k(2505)*n(idx_HCO2j)*n(idx_CH4) &
        +k(2506)*n(idx_HCO2j)*n(idx_CH3CN) &
        -k(2721)*n(idx_CH4j)*n(idx_CO2) &
        -k(3118)*n(idx_Ck)*n(idx_CO2) &
        +k(3215)*n(idx_Ck)*n(idx_O2) &
        +k(3239)*n(idx_Ok)*n(idx_CO) &
        -k(3357)*n(idx_H)*n(idx_CO2) &
        +k(3458)*n(idx_O)*n(idx_HCO) &
        +k(3589)*n(idx_CO)*n(idx_OH) &
        +k(3590)*n(idx_CO)*n(idx_HNO) &
        +k(3820)*n(idx_HCO2j)*n(idx_E) &
        +k(3888)*n(idx_CH2O2j)*n(idx_E) &
        +k(3961)*n(idx_CH3O2j)*n(idx_E) &
        +k(4095)*n(idx_COOCH4j)*n(idx_E) &
        -k(4293)*n(idx_CO2) &
        -k(4454)*n(idx_CO2) &
        +k(4500)*n(idx_C_DUSTO_DUSTO_DUST)

    !H2O
    !H2O
    dn(idx_H2O) = &
        -k(72)*n(idx_H2O) &
        -k(247)*n(idx_Cj)*n(idx_H2O) &
        -k(248)*n(idx_Cj)*n(idx_H2O) &
        -k(467)*n(idx_Hj)*n(idx_H2O) &
        +k(483)*n(idx_Hj)*n(idx_NAOH) &
        +k(577)*n(idx_Hj)*n(idx_NH2CHO) &
        -k(696)*n(idx_HEj)*n(idx_H2O) &
        -k(697)*n(idx_HEj)*n(idx_H2O) &
        -k(698)*n(idx_HEj)*n(idx_H2O) &
        -k(976)*n(idx_Nj)*n(idx_H2O) &
        -k(1022)*n(idx_Oj)*n(idx_H2O) &
        +k(1023)*n(idx_Oj)*n(idx_H2S) &
        +k(1042)*n(idx_Oj)*n(idx_CH3OH) &
        -k(1048)*n(idx_Pj)*n(idx_H2O) &
        -k(1049)*n(idx_Pj)*n(idx_H2O) &
        -k(1103)*n(idx_SIj)*n(idx_H2O) &
        -k(1136)*n(idx_C2j)*n(idx_H2O) &
        -k(1137)*n(idx_C2j)*n(idx_H2O) &
        -k(1177)*n(idx_CHj)*n(idx_H2O) &
        -k(1178)*n(idx_CHj)*n(idx_H2O) &
        -k(1179)*n(idx_CHj)*n(idx_H2O) &
        -k(1225)*n(idx_CNj)*n(idx_H2O) &
        -k(1226)*n(idx_CNj)*n(idx_H2O) &
        -k(1227)*n(idx_CNj)*n(idx_H2O) &
        -k(1228)*n(idx_CNj)*n(idx_H2O) &
        -k(1256)*n(idx_COj)*n(idx_H2O) &
        -k(1257)*n(idx_COj)*n(idx_H2O) &
        +k(1309)*n(idx_H2j)*n(idx_CO2) &
        -k(1312)*n(idx_H2j)*n(idx_H2O) &
        -k(1313)*n(idx_H2j)*n(idx_H2O) &
        -k(1348)*n(idx_HSj)*n(idx_H2O) &
        -k(1377)*n(idx_N2j)*n(idx_H2O) &
        -k(1378)*n(idx_N2j)*n(idx_H2O) &
        -k(1421)*n(idx_NHj)*n(idx_H2O) &
        -k(1422)*n(idx_NHj)*n(idx_H2O) &
        -k(1423)*n(idx_NHj)*n(idx_H2O) &
        -k(1424)*n(idx_NHj)*n(idx_H2O) &
        -k(1425)*n(idx_NHj)*n(idx_H2O) &
        -k(1496)*n(idx_OHj)*n(idx_H2O) &
        -k(1497)*n(idx_OHj)*n(idx_H2O) &
        -k(1515)*n(idx_PHj)*n(idx_H2O) &
        -k(1516)*n(idx_PHj)*n(idx_H2O) &
        -k(1517)*n(idx_PHj)*n(idx_H2O) &
        +k(1560)*n(idx_SOj)*n(idx_H2S) &
        -k(1576)*n(idx_C2Hj)*n(idx_H2O) &
        -k(1597)*n(idx_C2Nj)*n(idx_H2O) &
        -k(1598)*n(idx_C2Nj)*n(idx_H2O) &
        -k(1620)*n(idx_CH2j)*n(idx_H2O) &
        -k(1638)*n(idx_CNCj)*n(idx_H2O) &
        -k(1648)*n(idx_CO2j)*n(idx_H2O) &
        -k(1649)*n(idx_CO2j)*n(idx_H2O) &
        -k(1655)*n(idx_H2CLj)*n(idx_H2O) &
        +k(1657)*n(idx_H2Oj)*n(idx_FE) &
        +k(1658)*n(idx_H2Oj)*n(idx_MG) &
        +k(1660)*n(idx_H2Oj)*n(idx_NA) &
        +k(1662)*n(idx_H2Oj)*n(idx_S) &
        +k(1665)*n(idx_H2Oj)*n(idx_SI) &
        +k(1666)*n(idx_H2Oj)*n(idx_C2) &
        +k(1668)*n(idx_H2Oj)*n(idx_CH) &
        +k(1673)*n(idx_H2Oj)*n(idx_NO) &
        +k(1674)*n(idx_H2Oj)*n(idx_O2) &
        +k(1676)*n(idx_H2Oj)*n(idx_C2H) &
        +k(1678)*n(idx_H2Oj)*n(idx_CH2) &
        -k(1680)*n(idx_H2Oj)*n(idx_H2O) &
        +k(1681)*n(idx_H2Oj)*n(idx_H2S) &
        +k(1685)*n(idx_H2Oj)*n(idx_HCO) &
        +k(1689)*n(idx_H2Oj)*n(idx_NH2) &
        +k(1691)*n(idx_H2Oj)*n(idx_H2CO) &
        +k(1693)*n(idx_H2Oj)*n(idx_NH3) &
        -k(1707)*n(idx_H2Sj)*n(idx_H2O) &
        -k(1759)*n(idx_H3j)*n(idx_H2O) &
        +k(1809)*n(idx_H3j)*n(idx_CH2O2) &
        +k(1832)*n(idx_H3j)*n(idx_CH3OH) &
        +k(1855)*n(idx_H3j)*n(idx_C2H5OH) &
        -k(1889)*n(idx_HCNj)*n(idx_H2O) &
        -k(1890)*n(idx_HCNj)*n(idx_H2O) &
        -k(1934)*n(idx_HCOj)*n(idx_H2O) &
        -k(2052)*n(idx_HNCj)*n(idx_H2O) &
        -k(2071)*n(idx_HNOj)*n(idx_H2O) &
        -k(2081)*n(idx_HNSIj)*n(idx_H2O) &
        -k(2085)*n(idx_HPOj)*n(idx_H2O) &
        -k(2096)*n(idx_N2Hj)*n(idx_H2O) &
        -k(2111)*n(idx_NAH2j)*n(idx_H2O) &
        -k(2130)*n(idx_NH2j)*n(idx_H2O) &
        -k(2131)*n(idx_NH2j)*n(idx_H2O) &
        -k(2132)*n(idx_NH2j)*n(idx_H2O) &
        +k(2147)*n(idx_NO2j)*n(idx_H2) &
        -k(2164)*n(idx_O2Hj)*n(idx_H2O) &
        -k(2281)*n(idx_C3Hj)*n(idx_H2O) &
        -k(2282)*n(idx_C3Hj)*n(idx_H2O) &
        -k(2283)*n(idx_C3Hj)*n(idx_H2O) &
        -k(2415)*n(idx_H2COj)*n(idx_H2O) &
        +k(2428)*n(idx_H3Oj)*n(idx_NA) &
        +k(2430)*n(idx_H3Oj)*n(idx_SI) &
        +k(2431)*n(idx_H3Oj)*n(idx_CH) &
        +k(2432)*n(idx_H3Oj)*n(idx_CP) &
        +k(2433)*n(idx_H3Oj)*n(idx_CS) &
        +k(2434)*n(idx_H3Oj)*n(idx_PN) &
        +k(2435)*n(idx_H3Oj)*n(idx_S2) &
        +k(2436)*n(idx_H3Oj)*n(idx_SIC) &
        +k(2437)*n(idx_H3Oj)*n(idx_SIH) &
        +k(2438)*n(idx_H3Oj)*n(idx_SIO) &
        +k(2439)*n(idx_H3Oj)*n(idx_C2S) &
        +k(2440)*n(idx_H3Oj)*n(idx_C3) &
        +k(2441)*n(idx_H3Oj)*n(idx_CCO) &
        +k(2442)*n(idx_H3Oj)*n(idx_CCP) &
        +k(2443)*n(idx_H3Oj)*n(idx_CH2) &
        +k(2444)*n(idx_H3Oj)*n(idx_H2S) &
        +k(2445)*n(idx_H3Oj)*n(idx_HCN) &
        +k(2446)*n(idx_H3Oj)*n(idx_HCP) &
        +k(2447)*n(idx_H3Oj)*n(idx_HCSI) &
        +k(2448)*n(idx_H3Oj)*n(idx_HNC) &
        +k(2449)*n(idx_H3Oj)*n(idx_HNSI) &
        +k(2450)*n(idx_H3Oj)*n(idx_HS2) &
        +k(2451)*n(idx_H3Oj)*n(idx_NH2) &
        +k(2452)*n(idx_H3Oj)*n(idx_SIC2) &
        +k(2453)*n(idx_H3Oj)*n(idx_SIH2) &
        +k(2454)*n(idx_H3Oj)*n(idx_SINC) &
        +k(2455)*n(idx_H3Oj)*n(idx_C3H) &
        +k(2456)*n(idx_H3Oj)*n(idx_HC3) &
        +k(2457)*n(idx_H3Oj)*n(idx_C3N) &
        +k(2458)*n(idx_H3Oj)*n(idx_C3O) &
        +k(2459)*n(idx_H3Oj)*n(idx_C3P) &
        +k(2460)*n(idx_H3Oj)*n(idx_C3S) &
        +k(2461)*n(idx_H3Oj)*n(idx_C4) &
        +k(2462)*n(idx_H3Oj)*n(idx_H2CO) &
        +k(2463)*n(idx_H3Oj)*n(idx_H2S2) &
        +k(2464)*n(idx_H3Oj)*n(idx_H2SIO) &
        +k(2465)*n(idx_H3Oj)*n(idx_HCCP) &
        +k(2466)*n(idx_H3Oj)*n(idx_NH3) &
        +k(2467)*n(idx_H3Oj)*n(idx_SIC2H) &
        +k(2468)*n(idx_H3Oj)*n(idx_C2H2O) &
        +k(2469)*n(idx_H3Oj)*n(idx_C2H3) &
        +k(2470)*n(idx_H3Oj)*n(idx_C3H2) &
        +k(2471)*n(idx_H3Oj)*n(idx_H2C3) &
        +k(2472)*n(idx_H3Oj)*n(idx_C4H) &
        +k(2473)*n(idx_H3Oj)*n(idx_C4P) &
        +k(2474)*n(idx_H3Oj)*n(idx_C4S) &
        +k(2475)*n(idx_H3Oj)*n(idx_CH2PH) &
        +k(2476)*n(idx_H3Oj)*n(idx_HCNC2) &
        +k(2477)*n(idx_H3Oj)*n(idx_HC2NC) &
        +k(2478)*n(idx_H3Oj)*n(idx_HC3N) &
        +k(2479)*n(idx_H3Oj)*n(idx_HNC3) &
        +k(2480)*n(idx_H3Oj)*n(idx_SICH3) &
        +k(2481)*n(idx_H3Oj)*n(idx_CH3CN) &
        +k(2482)*n(idx_H3Oj)*n(idx_C3H3) &
        +k(2483)*n(idx_H3Oj)*n(idx_C4H2) &
        +k(2484)*n(idx_H3Oj)*n(idx_CH3OH) &
        +k(2485)*n(idx_H3Oj)*n(idx_NH2CHO) &
        +k(2486)*n(idx_H3Oj)*n(idx_C2H4O) &
        +k(2487)*n(idx_H3Oj)*n(idx_C3H4) &
        +k(2488)*n(idx_H3Oj)*n(idx_C4H3) &
        +k(2489)*n(idx_H3Oj)*n(idx_HCOOCH3) &
        +k(2490)*n(idx_H3Oj)*n(idx_C2H5OH) &
        +k(2491)*n(idx_H3Oj)*n(idx_CH3OCH3) &
        +k(2492)*n(idx_H3Oj)*n(idx_C2H6CO) &
        +k(2493)*n(idx_H3Oj)*n(idx_C6H6) &
        -k(2502)*n(idx_HCO2j)*n(idx_H2O) &
        -k(2507)*n(idx_HSO2j)*n(idx_H2O) &
        -k(2522)*n(idx_NH3j)*n(idx_H2O) &
        -k(2556)*n(idx_C2H3j)*n(idx_H2O) &
        -k(2711)*n(idx_C4Nj)*n(idx_H2O) &
        -k(2712)*n(idx_C4Nj)*n(idx_H2O) &
        -k(2722)*n(idx_CH4j)*n(idx_H2O) &
        -k(2751)*n(idx_SICH3j)*n(idx_H2O) &
        -k(2755)*n(idx_SIH4j)*n(idx_H2O) &
        -k(2923)*n(idx_CH5j)*n(idx_H2O) &
        -k(2939)*n(idx_SIH5j)*n(idx_H2O) &
        -k(2946)*n(idx_C2H5j)*n(idx_H2O) &
        +k(3019)*n(idx_CH5Oj)*n(idx_CH3OH) &
        -k(3119)*n(idx_Hk)*n(idx_H2O) &
        +k(3126)*n(idx_OHk)*n(idx_HCN) &
        -k(3139)*n(idx_NAj)*n(idx_H2O) &
        -k(3153)*n(idx_HCOj)*n(idx_H2O) &
        -k(3170)*n(idx_CH3j)*n(idx_H2O) &
        -k(3199)*n(idx_C2H5j)*n(idx_H2O) &
        -k(3218)*n(idx_Ck)*n(idx_H2O) &
        +k(3228)*n(idx_Hk)*n(idx_OH) &
        +k(3240)*n(idx_Ok)*n(idx_H2) &
        +k(3251)*n(idx_OHk)*n(idx_H) &
        -k(3343)*n(idx_H)*n(idx_H2O) &
        +k(3353)*n(idx_H)*n(idx_O2H) &
        +k(3354)*n(idx_H)*n(idx_H2O2) &
        +k(3366)*n(idx_H2)*n(idx_OH) &
        -k(3543)*n(idx_F)*n(idx_H2O) &
        +k(3594)*n(idx_NO)*n(idx_NH2) &
        +k(3597)*n(idx_OH)*n(idx_OH) &
        +k(3599)*n(idx_OH)*n(idx_H2S) &
        +k(3600)*n(idx_OH)*n(idx_HCO) &
        +k(3601)*n(idx_OH)*n(idx_HNO) &
        +k(3602)*n(idx_OH)*n(idx_NH2) &
        +k(3604)*n(idx_OH)*n(idx_O2H) &
        +k(3605)*n(idx_OH)*n(idx_H2CO) &
        +k(3607)*n(idx_OH)*n(idx_H2O2) &
        +k(3608)*n(idx_OH)*n(idx_C2H3) &
        +k(3609)*n(idx_OH)*n(idx_C2H5) &
        +k(3655)*n(idx_H)*n(idx_OH) &
        +k(3811)*n(idx_H3Oj)*n(idx_E) &
        +k(3829)*n(idx_NAH2Oj)*n(idx_E) &
        +k(3853)*n(idx_C2H2Oj)*n(idx_E) &
        +k(4049)*n(idx_CH5Oj)*n(idx_E) &
        +k(4051)*n(idx_CH5Oj)*n(idx_E) &
        +k(4054)*n(idx_H3C3Oj)*n(idx_E) &
        +k(4055)*n(idx_H3C3Oj)*n(idx_E) &
        +k(4059)*n(idx_NH2CH2Oj)*n(idx_E) &
        +k(4131)*n(idx_C2H5OH2j)*n(idx_E) &
        +k(4244)*n(idx_H3Oj)*n(idx_Hk) &
        -k(4294)*n(idx_H2O) &
        -k(4295)*n(idx_H2O) &
        +k(4408)*n(idx_C2H5OH) &
        -k(4452)*n(idx_H2O) &
        +k(4498)*n(idx_H_DUSTH_DUSTO_DUST)

    !H2S
    !H2S
    dn(idx_H2S) = &
        -k(73)*n(idx_H2S) &
        -k(74)*n(idx_H2S) &
        -k(249)*n(idx_Cj)*n(idx_H2S) &
        -k(250)*n(idx_Cj)*n(idx_H2S) &
        -k(468)*n(idx_Hj)*n(idx_H2S) &
        -k(699)*n(idx_HEj)*n(idx_H2S) &
        -k(700)*n(idx_HEj)*n(idx_H2S) &
        -k(701)*n(idx_HEj)*n(idx_H2S) &
        -k(977)*n(idx_Nj)*n(idx_H2S) &
        -k(978)*n(idx_Nj)*n(idx_H2S) &
        -k(1023)*n(idx_Oj)*n(idx_H2S) &
        -k(1024)*n(idx_Oj)*n(idx_H2S) &
        -k(1025)*n(idx_Oj)*n(idx_H2S) &
        -k(1072)*n(idx_Sj)*n(idx_H2S) &
        -k(1073)*n(idx_Sj)*n(idx_H2S) &
        -k(1074)*n(idx_Sj)*n(idx_H2S) &
        -k(1180)*n(idx_CHj)*n(idx_H2S) &
        -k(1181)*n(idx_CHj)*n(idx_H2S) &
        -k(1258)*n(idx_COj)*n(idx_H2S) &
        -k(1259)*n(idx_COj)*n(idx_H2S) &
        -k(1314)*n(idx_H2j)*n(idx_H2S) &
        -k(1315)*n(idx_H2j)*n(idx_H2S) &
        -k(1316)*n(idx_H2j)*n(idx_H2S) &
        -k(1349)*n(idx_HSj)*n(idx_H2S) &
        -k(1350)*n(idx_HSj)*n(idx_H2S) &
        -k(1379)*n(idx_N2j)*n(idx_H2S) &
        -k(1380)*n(idx_N2j)*n(idx_H2S) &
        -k(1381)*n(idx_N2j)*n(idx_H2S) &
        -k(1457)*n(idx_O2j)*n(idx_H2S) &
        -k(1498)*n(idx_OHj)*n(idx_H2S) &
        -k(1499)*n(idx_OHj)*n(idx_H2S) &
        -k(1560)*n(idx_SOj)*n(idx_H2S) &
        -k(1601)*n(idx_C2Nj)*n(idx_H2S) &
        -k(1621)*n(idx_CH2j)*n(idx_H2S) &
        -k(1622)*n(idx_CH2j)*n(idx_H2S) &
        -k(1650)*n(idx_CO2j)*n(idx_H2S) &
        -k(1681)*n(idx_H2Oj)*n(idx_H2S) &
        -k(1682)*n(idx_H2Oj)*n(idx_H2S) &
        -k(1683)*n(idx_H2Oj)*n(idx_H2S) &
        +k(1697)*n(idx_H2Sj)*n(idx_FE) &
        +k(1699)*n(idx_H2Sj)*n(idx_MG) &
        +k(1701)*n(idx_H2Sj)*n(idx_NA) &
        +k(1704)*n(idx_H2Sj)*n(idx_S) &
        +k(1705)*n(idx_H2Sj)*n(idx_SI) &
        +k(1706)*n(idx_H2Sj)*n(idx_NO) &
        -k(1708)*n(idx_H2Sj)*n(idx_H2S) &
        +k(1709)*n(idx_H2Sj)*n(idx_HCO) &
        +k(1710)*n(idx_H2Sj)*n(idx_NH3) &
        -k(1760)*n(idx_H3j)*n(idx_H2S) &
        -k(1935)*n(idx_HCOj)*n(idx_H2S) &
        -k(2133)*n(idx_NH2j)*n(idx_H2S) &
        -k(2134)*n(idx_NH2j)*n(idx_H2S) &
        -k(2135)*n(idx_NH2j)*n(idx_H2S) &
        -k(2136)*n(idx_NH2j)*n(idx_H2S) &
        -k(2137)*n(idx_NH2j)*n(idx_H2S) &
        -k(2176)*n(idx_S2Hj)*n(idx_H2S) &
        -k(2213)*n(idx_C2H2j)*n(idx_H2S) &
        -k(2214)*n(idx_C2H2j)*n(idx_H2S) &
        -k(2284)*n(idx_C3Hj)*n(idx_H2S) &
        -k(2285)*n(idx_C3Hj)*n(idx_H2S) &
        -k(2286)*n(idx_C3Hj)*n(idx_H2S) &
        -k(2342)*n(idx_CH3j)*n(idx_H2S) &
        -k(2444)*n(idx_H3Oj)*n(idx_H2S) &
        +k(2495)*n(idx_H3Sj)*n(idx_HCN) &
        +k(2496)*n(idx_H3Sj)*n(idx_HNC) &
        +k(2497)*n(idx_H3Sj)*n(idx_H2CO) &
        +k(2498)*n(idx_H3Sj)*n(idx_NH3) &
        -k(2523)*n(idx_NH3j)*n(idx_H2S) &
        -k(2557)*n(idx_C2H3j)*n(idx_H2S) &
        -k(2723)*n(idx_CH4j)*n(idx_H2S) &
        -k(2724)*n(idx_CH4j)*n(idx_H2S) &
        -k(2947)*n(idx_C2H5j)*n(idx_H2S) &
        -k(3356)*n(idx_H)*n(idx_H2S) &
        -k(3465)*n(idx_O)*n(idx_H2S) &
        +k(3591)*n(idx_HS)*n(idx_HS) &
        -k(3599)*n(idx_OH)*n(idx_H2S) &
        +k(3815)*n(idx_H3Sj)*n(idx_E) &
        +k(4206)*n(idx_H2Sj)*n(idx_E) &
        -k(4296)*n(idx_H2S)

    !HCN
    !HCN
    dn(idx_HCN) = &
        -k(75)*n(idx_HCN) &
        +k(140)*n(idx_CH3N) &
        +k(174)*n(idx_CH5N) &
        -k(251)*n(idx_Cj)*n(idx_HCN) &
        -k(252)*n(idx_Cj)*n(idx_HCN) &
        +k(330)*n(idx_Cj)*n(idx_HC3N) &
        +k(366)*n(idx_Cj)*n(idx_NH2CHO) &
        -k(469)*n(idx_Hj)*n(idx_HCN) &
        +k(477)*n(idx_Hj)*n(idx_HNC) &
        +k(536)*n(idx_Hj)*n(idx_HCNC2) &
        -k(702)*n(idx_HEj)*n(idx_HCN) &
        -k(703)*n(idx_HEj)*n(idx_HCN) &
        -k(704)*n(idx_HEj)*n(idx_HCN) &
        -k(705)*n(idx_HEj)*n(idx_HCN) &
        +k(817)*n(idx_HEj)*n(idx_HCNC2) &
        +k(825)*n(idx_HEj)*n(idx_HC3N) &
        -k(979)*n(idx_Nj)*n(idx_HCN) &
        -k(1026)*n(idx_Oj)*n(idx_HCN) &
        -k(1027)*n(idx_Oj)*n(idx_HCN) &
        -k(1028)*n(idx_Oj)*n(idx_HCN) &
        -k(1104)*n(idx_SIj)*n(idx_HCN) &
        -k(1138)*n(idx_C2j)*n(idx_HCN) &
        -k(1139)*n(idx_C2j)*n(idx_HCN) &
        -k(1182)*n(idx_CHj)*n(idx_HCN) &
        -k(1183)*n(idx_CHj)*n(idx_HCN) &
        -k(1184)*n(idx_CHj)*n(idx_HCN) &
        -k(1229)*n(idx_CNj)*n(idx_HCN) &
        -k(1230)*n(idx_CNj)*n(idx_HCN) &
        +k(1234)*n(idx_CNj)*n(idx_H2CO) &
        -k(1260)*n(idx_COj)*n(idx_HCN) &
        -k(1317)*n(idx_H2j)*n(idx_HCN) &
        -k(1351)*n(idx_HSj)*n(idx_HCN) &
        -k(1382)*n(idx_N2j)*n(idx_HCN) &
        -k(1426)*n(idx_NHj)*n(idx_HCN) &
        -k(1500)*n(idx_OHj)*n(idx_HCN) &
        -k(1518)*n(idx_PHj)*n(idx_HCN) &
        -k(1577)*n(idx_C2Hj)*n(idx_HCN) &
        -k(1578)*n(idx_C2Hj)*n(idx_HCN) &
        -k(1579)*n(idx_C2Hj)*n(idx_HCN) &
        +k(1593)*n(idx_C2Nj)*n(idx_CH4) &
        +k(1596)*n(idx_C2Nj)*n(idx_NH3) &
        +k(1597)*n(idx_C2Nj)*n(idx_H2O) &
        +k(1599)*n(idx_C2Nj)*n(idx_C2H2) &
        +k(1601)*n(idx_C2Nj)*n(idx_H2S) &
        -k(1623)*n(idx_CH2j)*n(idx_HCN) &
        +k(1637)*n(idx_CNCj)*n(idx_NH3) &
        +k(1638)*n(idx_CNCj)*n(idx_H2O) &
        +k(1639)*n(idx_CNCj)*n(idx_C2H2) &
        -k(1684)*n(idx_H2Oj)*n(idx_HCN) &
        -k(1761)*n(idx_H3j)*n(idx_HCN) &
        +k(1874)*n(idx_HCNj)*n(idx_H) &
        +k(1875)*n(idx_HCNj)*n(idx_O) &
        +k(1876)*n(idx_HCNj)*n(idx_S) &
        +k(1883)*n(idx_HCNj)*n(idx_NO) &
        +k(1884)*n(idx_HCNj)*n(idx_O2) &
        +k(1889)*n(idx_HCNj)*n(idx_H2O) &
        -k(1891)*n(idx_HCNj)*n(idx_HCN) &
        +k(1898)*n(idx_HCNj)*n(idx_NH3) &
        -k(1936)*n(idx_HCOj)*n(idx_HCN) &
        -k(2053)*n(idx_HNCj)*n(idx_HCN) &
        -k(2072)*n(idx_HNOj)*n(idx_HCN) &
        -k(2097)*n(idx_N2Hj)*n(idx_HCN) &
        -k(2138)*n(idx_NH2j)*n(idx_HCN) &
        -k(2165)*n(idx_O2Hj)*n(idx_HCN) &
        +k(2192)*n(idx_C2H2j)*n(idx_N) &
        -k(2215)*n(idx_C2H2j)*n(idx_HCN) &
        +k(2307)*n(idx_CH2SIj)*n(idx_N) &
        +k(2363)*n(idx_CH3j)*n(idx_HCNC2) &
        +k(2364)*n(idx_CH3j)*n(idx_HCNC2) &
        +k(2365)*n(idx_CH3j)*n(idx_HC2NC) &
        +k(2366)*n(idx_CH3j)*n(idx_HC2NC) &
        +k(2367)*n(idx_CH3j)*n(idx_HC3N) &
        +k(2368)*n(idx_CH3j)*n(idx_HC3N) &
        +k(2389)*n(idx_HCNHj)*n(idx_NA) &
        +k(2392)*n(idx_HCNHj)*n(idx_CH) &
        +k(2393)*n(idx_HCNHj)*n(idx_CH2) &
        +k(2395)*n(idx_HCNHj)*n(idx_NH2) &
        +k(2397)*n(idx_HCNHj)*n(idx_H2CO) &
        +k(2398)*n(idx_HCNHj)*n(idx_NH3) &
        -k(2416)*n(idx_H2COj)*n(idx_HCN) &
        -k(2445)*n(idx_H3Oj)*n(idx_HCN) &
        -k(2495)*n(idx_H3Sj)*n(idx_HCN) &
        -k(2558)*n(idx_C2H3j)*n(idx_HCN) &
        +k(2682)*n(idx_C3HNj)*n(idx_H2) &
        +k(2710)*n(idx_C4Nj)*n(idx_H2) &
        +k(2713)*n(idx_C4Nj)*n(idx_C2H2) &
        -k(2924)*n(idx_CH5j)*n(idx_HCN) &
        -k(2948)*n(idx_C2H5j)*n(idx_HCN) &
        +k(3023)*n(idx_C3H5j)*n(idx_N) &
        -k(3120)*n(idx_Hk)*n(idx_HCN) &
        -k(3123)*n(idx_Ok)*n(idx_HCN) &
        -k(3126)*n(idx_OHk)*n(idx_HCN) &
        -k(3145)*n(idx_SIj)*n(idx_HCN) &
        -k(3171)*n(idx_CH3j)*n(idx_HCN) &
        +k(3214)*n(idx_Ck)*n(idx_NH) &
        +k(3225)*n(idx_Hk)*n(idx_CN) &
        +k(3248)*n(idx_CNk)*n(idx_H) &
        +k(3275)*n(idx_C)*n(idx_NH2) &
        +k(3286)*n(idx_C)*n(idx_HCNC2) &
        +k(3334)*n(idx_H)*n(idx_H2CN) &
        -k(3344)*n(idx_H)*n(idx_HCN) &
        +k(3386)*n(idx_N)*n(idx_CH2) &
        +k(3389)*n(idx_N)*n(idx_HCS) &
        +k(3402)*n(idx_N)*n(idx_CH3) &
        +k(3404)*n(idx_N)*n(idx_H2CN) &
        -k(3460)*n(idx_O)*n(idx_HCN) &
        +k(3544)*n(idx_CH)*n(idx_NO) &
        +k(3573)*n(idx_CN)*n(idx_HCO) &
        +k(3575)*n(idx_CN)*n(idx_OH) &
        +k(3576)*n(idx_CN)*n(idx_HNO) &
        +k(3578)*n(idx_CN)*n(idx_NH3) &
        -k(3613)*n(idx_C2H)*n(idx_HCN) &
        +k(3794)*n(idx_HCNHj)*n(idx_E) &
        +k(3850)*n(idx_CH2CNj)*n(idx_E) &
        +k(3872)*n(idx_C3HNj)*n(idx_E) &
        +k(3931)*n(idx_CH3CNj)*n(idx_E) &
        +k(3965)*n(idx_CH4Nj)*n(idx_E) &
        +k(3979)*n(idx_HC2NCHj)*n(idx_E) &
        -k(4297)*n(idx_HCN) &
        +k(4345)*n(idx_CH3N) &
        +k(4384)*n(idx_CH5N) &
        -k(4455)*n(idx_HCN) &
        +k(4501)*n(idx_H_DUSTC_DUSTN_DUST)

    !HCO
    !HCO
    dn(idx_HCO) = &
        -k(76)*n(idx_HCO) &
        -k(77)*n(idx_HCO) &
        +k(137)*n(idx_CH2O2) &
        +k(164)*n(idx_C2H4O) &
        -k(253)*n(idx_Cj)*n(idx_HCO) &
        -k(254)*n(idx_Cj)*n(idx_HCO) &
        +k(361)*n(idx_Cj)*n(idx_CH3OH) &
        -k(470)*n(idx_Hj)*n(idx_HCO) &
        -k(471)*n(idx_Hj)*n(idx_HCO) &
        -k(472)*n(idx_Hj)*n(idx_HCO) &
        -k(706)*n(idx_HEj)*n(idx_HCO) &
        -k(707)*n(idx_HEj)*n(idx_HCO) &
        -k(708)*n(idx_HEj)*n(idx_HCO) &
        +k(876)*n(idx_HEj)*n(idx_C2H4O) &
        -k(980)*n(idx_Nj)*n(idx_HCO) &
        -k(981)*n(idx_Nj)*n(idx_HCO) &
        -k(1029)*n(idx_Oj)*n(idx_HCO) &
        -k(1030)*n(idx_Oj)*n(idx_HCO) &
        -k(1075)*n(idx_Sj)*n(idx_HCO) &
        -k(1076)*n(idx_Sj)*n(idx_HCO) &
        -k(1140)*n(idx_C2j)*n(idx_HCO) &
        -k(1141)*n(idx_C2j)*n(idx_HCO) &
        +k(1170)*n(idx_CHj)*n(idx_O2) &
        -k(1185)*n(idx_CHj)*n(idx_HCO) &
        -k(1186)*n(idx_CHj)*n(idx_HCO) &
        -k(1231)*n(idx_CNj)*n(idx_HCO) &
        -k(1232)*n(idx_CNj)*n(idx_HCO) &
        -k(1261)*n(idx_COj)*n(idx_HCO) &
        +k(1265)*n(idx_COj)*n(idx_H2CO) &
        -k(1318)*n(idx_H2j)*n(idx_HCO) &
        -k(1319)*n(idx_H2j)*n(idx_HCO) &
        -k(1383)*n(idx_N2j)*n(idx_HCO) &
        -k(1384)*n(idx_N2j)*n(idx_HCO) &
        +k(1418)*n(idx_NHj)*n(idx_CO2) &
        -k(1427)*n(idx_NHj)*n(idx_HCO) &
        -k(1458)*n(idx_O2j)*n(idx_HCO) &
        -k(1459)*n(idx_O2j)*n(idx_HCO) &
        -k(1501)*n(idx_OHj)*n(idx_HCO) &
        -k(1502)*n(idx_OHj)*n(idx_HCO) &
        -k(1503)*n(idx_OHj)*n(idx_HCO) &
        -k(1553)*n(idx_SIOj)*n(idx_HCO) &
        -k(1580)*n(idx_C2Hj)*n(idx_HCO) &
        -k(1624)*n(idx_CH2j)*n(idx_HCO) &
        -k(1625)*n(idx_CH2j)*n(idx_HCO) &
        +k(1627)*n(idx_CH2j)*n(idx_OCS) &
        -k(1685)*n(idx_H2Oj)*n(idx_HCO) &
        -k(1686)*n(idx_H2Oj)*n(idx_HCO) &
        -k(1687)*n(idx_H2Oj)*n(idx_HCO) &
        -k(1709)*n(idx_H2Sj)*n(idx_HCO) &
        -k(1762)*n(idx_H3j)*n(idx_HCO) &
        -k(1892)*n(idx_HCNj)*n(idx_HCO) &
        -k(1893)*n(idx_HCNj)*n(idx_HCO) &
        +k(1902)*n(idx_HCOj)*n(idx_FE) &
        +k(1903)*n(idx_HCOj)*n(idx_MG) &
        +k(1904)*n(idx_HCOj)*n(idx_NA) &
        -k(1937)*n(idx_HCOj)*n(idx_HCO) &
        +k(2048)*n(idx_HNCj)*n(idx_O2) &
        -k(2054)*n(idx_HNCj)*n(idx_HCO) &
        -k(2055)*n(idx_HNCj)*n(idx_HCO) &
        -k(2073)*n(idx_HNOj)*n(idx_HCO) &
        -k(2098)*n(idx_N2Hj)*n(idx_HCO) &
        -k(2139)*n(idx_NH2j)*n(idx_HCO) &
        +k(2142)*n(idx_NH2j)*n(idx_H2CO) &
        -k(2166)*n(idx_O2Hj)*n(idx_HCO) &
        +k(2209)*n(idx_C2H2j)*n(idx_O2) &
        -k(2216)*n(idx_C2H2j)*n(idx_HCO) &
        -k(2217)*n(idx_C2H2j)*n(idx_HCO) &
        -k(2343)*n(idx_CH3j)*n(idx_HCO) &
        -k(2344)*n(idx_CH3j)*n(idx_HCO) &
        +k(2381)*n(idx_CH3j)*n(idx_NH2CHO) &
        +k(2404)*n(idx_H2COj)*n(idx_S) &
        +k(2406)*n(idx_H2COj)*n(idx_C2) &
        +k(2408)*n(idx_H2COj)*n(idx_CH) &
        +k(2412)*n(idx_H2COj)*n(idx_C2H) &
        +k(2414)*n(idx_H2COj)*n(idx_CH2) &
        +k(2415)*n(idx_H2COj)*n(idx_H2O) &
        +k(2416)*n(idx_H2COj)*n(idx_HCN) &
        -k(2417)*n(idx_H2COj)*n(idx_HCO) &
        -k(2418)*n(idx_H2COj)*n(idx_HCO) &
        +k(2419)*n(idx_H2COj)*n(idx_HNC) &
        +k(2420)*n(idx_H2COj)*n(idx_NH2) &
        +k(2421)*n(idx_H2COj)*n(idx_H2CO) &
        +k(2423)*n(idx_H2COj)*n(idx_NH3) &
        -k(2524)*n(idx_NH3j)*n(idx_HCO) &
        -k(2525)*n(idx_NH3j)*n(idx_HCO) &
        +k(2527)*n(idx_NH3j)*n(idx_H2CO) &
        +k(2765)*n(idx_C2H4j)*n(idx_O) &
        -k(2925)*n(idx_CH5j)*n(idx_HCO) &
        +k(3216)*n(idx_Ck)*n(idx_OH) &
        +k(3226)*n(idx_Hk)*n(idx_CO) &
        -k(3231)*n(idx_Hk)*n(idx_HCO) &
        +k(3238)*n(idx_Ok)*n(idx_CH) &
        +k(3250)*n(idx_OHk)*n(idx_C) &
        -k(3269)*n(idx_C)*n(idx_HCO) &
        -k(3270)*n(idx_C)*n(idx_HCO) &
        -k(3331)*n(idx_H)*n(idx_HCO) &
        -k(3332)*n(idx_H)*n(idx_HCO) &
        +k(3347)*n(idx_H)*n(idx_H2CO) &
        -k(3388)*n(idx_N)*n(idx_HCO) &
        -k(3458)*n(idx_O)*n(idx_HCO) &
        -k(3459)*n(idx_O)*n(idx_HCO) &
        -k(3573)*n(idx_CN)*n(idx_HCO) &
        -k(3600)*n(idx_OH)*n(idx_HCO) &
        +k(3605)*n(idx_OH)*n(idx_H2CO) &
        +k(3612)*n(idx_C2H)*n(idx_O2) &
        -2.d0*k(3636)*n(idx_HCO)*n(idx_HCO) &
        -k(3637)*n(idx_HCO)*n(idx_HNO) &
        -k(3638)*n(idx_HCO)*n(idx_CH3) &
        +k(3797)*n(idx_H2COj)*n(idx_E) &
        +k(3892)*n(idx_H3COj)*n(idx_E) &
        +k(4017)*n(idx_C2H4Oj)*n(idx_E) &
        +k(4127)*n(idx_H5C2O2j)*n(idx_E) &
        -k(4298)*n(idx_HCO) &
        -k(4299)*n(idx_HCO) &
        +k(4343)*n(idx_CH2O2) &
        +k(4368)*n(idx_C2H4O) &
        -k(4457)*n(idx_HCO) &
        +k(4503)*n(idx_H_DUSTC_DUSTO_DUST)

    !HCP
    !HCP
    dn(idx_HCP) = &
        -k(78)*n(idx_HCP) &
        +k(139)*n(idx_CH2PH) &
        -k(255)*n(idx_Cj)*n(idx_HCP) &
        -k(256)*n(idx_Cj)*n(idx_HCP) &
        -k(473)*n(idx_Hj)*n(idx_HCP) &
        -k(709)*n(idx_HEj)*n(idx_HCP) &
        -k(710)*n(idx_HEj)*n(idx_HCP) &
        -k(1763)*n(idx_H3j)*n(idx_HCP) &
        -k(1938)*n(idx_HCOj)*n(idx_HCP) &
        -k(2446)*n(idx_H3Oj)*n(idx_HCP) &
        -k(3461)*n(idx_O)*n(idx_HCP) &
        +k(3494)*n(idx_O)*n(idx_HCCP) &
        +k(3836)*n(idx_PCH2j)*n(idx_E) &
        +k(3916)*n(idx_PCH3j)*n(idx_E) &
        +k(4002)*n(idx_PCH4j)*n(idx_E)

    !HCS
    !HCS
    dn(idx_HCS) = &
        -k(79)*n(idx_HCS) &
        -k(474)*n(idx_Hj)*n(idx_HCS) &
        -k(711)*n(idx_HEj)*n(idx_HCS) &
        -k(712)*n(idx_HEj)*n(idx_HCS) &
        -k(1764)*n(idx_H3j)*n(idx_HCS) &
        -k(3389)*n(idx_N)*n(idx_HCS) &
        -k(3462)*n(idx_O)*n(idx_HCS) &
        -k(3463)*n(idx_O)*n(idx_HCS) &
        +k(3525)*n(idx_S)*n(idx_CH2) &
        +k(3799)*n(idx_H2CSj)*n(idx_E)

    !HCSI
    !HCSI
    dn(idx_HCSI) = &
        -k(80)*n(idx_HCSI) &
        -k(257)*n(idx_Cj)*n(idx_HCSI) &
        -k(475)*n(idx_Hj)*n(idx_HCSI) &
        -k(476)*n(idx_Hj)*n(idx_HCSI) &
        -k(713)*n(idx_HEj)*n(idx_HCSI) &
        -k(714)*n(idx_HEj)*n(idx_HCSI) &
        -k(1765)*n(idx_H3j)*n(idx_HCSI) &
        -k(1939)*n(idx_HCOj)*n(idx_HCSI) &
        -k(2447)*n(idx_H3Oj)*n(idx_HCSI) &
        +k(3277)*n(idx_C)*n(idx_SIH2) &
        -k(3464)*n(idx_O)*n(idx_HCSI) &
        +k(3531)*n(idx_SI)*n(idx_CH2) &
        +k(3787)*n(idx_CH2SIj)*n(idx_E) &
        +k(3926)*n(idx_SICH3j)*n(idx_E)

    !HNC
    !HNC
    dn(idx_HNC) = &
        -k(81)*n(idx_HNC) &
        -k(258)*n(idx_Cj)*n(idx_HNC) &
        +k(333)*n(idx_Cj)*n(idx_HNC3) &
        -k(477)*n(idx_Hj)*n(idx_HNC) &
        +k(548)*n(idx_Hj)*n(idx_HNC3) &
        +k(550)*n(idx_Hj)*n(idx_NH2CN) &
        -k(715)*n(idx_HEj)*n(idx_HNC) &
        -k(716)*n(idx_HEj)*n(idx_HNC) &
        -k(717)*n(idx_HEj)*n(idx_HNC) &
        +k(832)*n(idx_HEj)*n(idx_HNC3) &
        -k(1105)*n(idx_SIj)*n(idx_HNC) &
        -k(1187)*n(idx_CHj)*n(idx_HNC) &
        -k(1352)*n(idx_HSj)*n(idx_HNC) &
        -k(1428)*n(idx_NHj)*n(idx_HNC) &
        -k(1504)*n(idx_OHj)*n(idx_HNC) &
        -k(1581)*n(idx_C2Hj)*n(idx_HNC) &
        -k(1688)*n(idx_H2Oj)*n(idx_HNC) &
        -k(1766)*n(idx_H3j)*n(idx_HNC) &
        -k(1894)*n(idx_HCNj)*n(idx_HNC) &
        -k(1940)*n(idx_HCOj)*n(idx_HNC) &
        +k(2041)*n(idx_HNCj)*n(idx_S) &
        +k(2047)*n(idx_HNCj)*n(idx_NO) &
        +k(2058)*n(idx_HNCj)*n(idx_NH3) &
        -k(2074)*n(idx_HNOj)*n(idx_HNC) &
        -k(2099)*n(idx_N2Hj)*n(idx_HNC) &
        -k(2140)*n(idx_NH2j)*n(idx_HNC) &
        -k(2167)*n(idx_O2Hj)*n(idx_HNC) &
        -k(2218)*n(idx_C2H2j)*n(idx_HNC) &
        -k(2219)*n(idx_C2H2j)*n(idx_HNC) &
        +k(2369)*n(idx_CH3j)*n(idx_HNC3) &
        +k(2370)*n(idx_CH3j)*n(idx_HNC3) &
        +k(2390)*n(idx_HCNHj)*n(idx_NA) &
        +k(2394)*n(idx_HCNHj)*n(idx_CH2) &
        +k(2396)*n(idx_HCNHj)*n(idx_NH2) &
        +k(2399)*n(idx_HCNHj)*n(idx_NH3) &
        -k(2419)*n(idx_H2COj)*n(idx_HNC) &
        -k(2448)*n(idx_H3Oj)*n(idx_HNC) &
        -k(2496)*n(idx_H3Sj)*n(idx_HNC) &
        -k(2559)*n(idx_C2H3j)*n(idx_HNC) &
        -k(2743)*n(idx_H3COj)*n(idx_HNC) &
        -k(2926)*n(idx_CH5j)*n(idx_HNC) &
        -k(2949)*n(idx_C2H5j)*n(idx_HNC) &
        +k(3274)*n(idx_C)*n(idx_NH2) &
        +k(3287)*n(idx_C)*n(idx_HNC3) &
        +k(3387)*n(idx_N)*n(idx_CH2) &
        -k(3614)*n(idx_C2H)*n(idx_HNC) &
        +k(3795)*n(idx_HCNHj)*n(idx_E) &
        +k(3801)*n(idx_H2NCj)*n(idx_E) &
        +k(3943)*n(idx_C3H2Nj)*n(idx_E) &
        +k(3992)*n(idx_NH2CNHj)*n(idx_E) &
        -k(4300)*n(idx_HNC) &
        -k(4456)*n(idx_HNC) &
        +k(4502)*n(idx_H_DUSTN_DUSTC_DUST)

    !HNO
    !HNO
    dn(idx_HNO) = &
        -k(82)*n(idx_HNO) &
        -k(478)*n(idx_Hj)*n(idx_HNO) &
        -k(718)*n(idx_HEj)*n(idx_HNO) &
        -k(719)*n(idx_HEj)*n(idx_HNO) &
        -k(1767)*n(idx_H3j)*n(idx_HNO) &
        -k(1941)*n(idx_HCOj)*n(idx_HNO) &
        +k(2066)*n(idx_HNOj)*n(idx_NO) &
        -k(3348)*n(idx_H)*n(idx_HNO) &
        -k(3349)*n(idx_H)*n(idx_HNO) &
        -k(3466)*n(idx_O)*n(idx_HNO) &
        -k(3467)*n(idx_O)*n(idx_HNO) &
        +k(3470)*n(idx_O)*n(idx_NH2) &
        -k(3546)*n(idx_CH)*n(idx_HNO) &
        -k(3576)*n(idx_CN)*n(idx_HNO) &
        -k(3590)*n(idx_CO)*n(idx_HNO) &
        -k(3601)*n(idx_OH)*n(idx_HNO) &
        -k(3635)*n(idx_CH2)*n(idx_HNO) &
        -k(3637)*n(idx_HCO)*n(idx_HNO) &
        -k(3639)*n(idx_HNO)*n(idx_CH3) &
        +k(3803)*n(idx_H2NOj)*n(idx_E) &
        -k(4301)*n(idx_HNO) &
        -k(4459)*n(idx_HNO) &
        +k(4505)*n(idx_H_DUSTN_DUSTO_DUST)

    !HNSI
    !HNSI
    dn(idx_HNSI) = &
        -k(83)*n(idx_HNSI) &
        -k(259)*n(idx_Cj)*n(idx_HNSI) &
        -k(479)*n(idx_Hj)*n(idx_HNSI) &
        -k(480)*n(idx_Hj)*n(idx_HNSI) &
        -k(720)*n(idx_HEj)*n(idx_HNSI) &
        -k(1768)*n(idx_H3j)*n(idx_HNSI) &
        -k(1942)*n(idx_HCOj)*n(idx_HNSI) &
        -k(2449)*n(idx_H3Oj)*n(idx_HNSI) &
        +k(3394)*n(idx_N)*n(idx_SIH2) &
        +k(3405)*n(idx_N)*n(idx_SIH3) &
        +k(3849)*n(idx_SINH2j)*n(idx_E)

    !HPO
    !HPO
    dn(idx_HPO) = &
        -k(84)*n(idx_HPO) &
        -k(260)*n(idx_Cj)*n(idx_HPO) &
        -k(481)*n(idx_Hj)*n(idx_HPO) &
        -k(721)*n(idx_HEj)*n(idx_HPO) &
        -k(722)*n(idx_HEj)*n(idx_HPO) &
        -k(1769)*n(idx_H3j)*n(idx_HPO) &
        -k(1943)*n(idx_HCOj)*n(idx_HPO) &
        -k(3468)*n(idx_O)*n(idx_HPO) &
        +k(3476)*n(idx_O)*n(idx_PH2) &
        +k(3805)*n(idx_H2POj)*n(idx_E)

    !HS2
    !HS2
    dn(idx_HS2) = &
        -k(85)*n(idx_HS2) &
        -k(482)*n(idx_Hj)*n(idx_HS2) &
        -k(723)*n(idx_HEj)*n(idx_HS2) &
        -k(724)*n(idx_HEj)*n(idx_HS2) &
        +k(1528)*n(idx_S2j)*n(idx_C2H5OH) &
        +k(1530)*n(idx_S2j)*n(idx_CH3OCH3) &
        -k(1770)*n(idx_H3j)*n(idx_HS2) &
        -k(1944)*n(idx_HCOj)*n(idx_HS2) &
        -k(2450)*n(idx_H3Oj)*n(idx_HS2) &
        +k(3807)*n(idx_H2S2j)*n(idx_E) &
        +k(3896)*n(idx_H3S2j)*n(idx_E)

    !N2O
    !N2O
    dn(idx_N2O) = &
        -k(86)*n(idx_N2O) &
        -k(725)*n(idx_HEj)*n(idx_N2O) &
        -k(726)*n(idx_HEj)*n(idx_N2O) &
        -k(727)*n(idx_HEj)*n(idx_N2O) &
        -k(728)*n(idx_HEj)*n(idx_N2O) &
        -k(1031)*n(idx_Oj)*n(idx_N2O) &
        -k(3358)*n(idx_H)*n(idx_N2O) &
        +k(3392)*n(idx_N)*n(idx_NO2) &
        +k(3593)*n(idx_NH)*n(idx_NO)

    !NAOH
    !NAOH
    dn(idx_NAOH) = &
        -k(87)*n(idx_NAOH) &
        -k(261)*n(idx_Cj)*n(idx_NAOH) &
        -k(483)*n(idx_Hj)*n(idx_NAOH) &
        -k(729)*n(idx_HEj)*n(idx_NAOH) &
        -k(1771)*n(idx_H3j)*n(idx_NAOH) &
        -k(1945)*n(idx_HCOj)*n(idx_NAOH) &
        +k(3830)*n(idx_NAH2Oj)*n(idx_E) &
        -k(4302)*n(idx_NAOH)

    !NH2
    !NH2
    dn(idx_NH2) = &
        -k(88)*n(idx_NH2) &
        -k(89)*n(idx_NH2) &
        +k(120)*n(idx_NH3) &
        -k(262)*n(idx_Cj)*n(idx_NH2) &
        -k(484)*n(idx_Hj)*n(idx_NH2) &
        +k(549)*n(idx_Hj)*n(idx_NH2CN) &
        -k(730)*n(idx_HEj)*n(idx_NH2) &
        -k(731)*n(idx_HEj)*n(idx_NH2) &
        +k(837)*n(idx_HEj)*n(idx_NH2CN) &
        +k(870)*n(idx_HEj)*n(idx_NH2CHO) &
        +k(902)*n(idx_HEj)*n(idx_CH5N) &
        -k(982)*n(idx_Nj)*n(idx_NH2) &
        -k(1032)*n(idx_Oj)*n(idx_NH2) &
        -k(1142)*n(idx_C2j)*n(idx_NH2) &
        -k(1143)*n(idx_C2j)*n(idx_NH2) &
        -k(1188)*n(idx_CHj)*n(idx_NH2) &
        -k(1233)*n(idx_CNj)*n(idx_NH2) &
        -k(1262)*n(idx_COj)*n(idx_NH2) &
        -k(1263)*n(idx_COj)*n(idx_NH2) &
        +k(1267)*n(idx_COj)*n(idx_NH3) &
        -k(1320)*n(idx_H2j)*n(idx_NH2) &
        -k(1385)*n(idx_N2j)*n(idx_NH2) &
        -k(1429)*n(idx_NHj)*n(idx_NH2) &
        +k(1430)*n(idx_NHj)*n(idx_H2CO) &
        -k(1460)*n(idx_O2j)*n(idx_NH2) &
        -k(1505)*n(idx_OHj)*n(idx_NH2) &
        -k(1506)*n(idx_OHj)*n(idx_NH2) &
        -k(1582)*n(idx_C2Hj)*n(idx_NH2) &
        -k(1583)*n(idx_C2Hj)*n(idx_NH2) &
        -k(1626)*n(idx_CH2j)*n(idx_NH2) &
        -k(1689)*n(idx_H2Oj)*n(idx_NH2) &
        -k(1690)*n(idx_H2Oj)*n(idx_NH2) &
        -k(1772)*n(idx_H3j)*n(idx_NH2) &
        -k(1895)*n(idx_HCNj)*n(idx_NH2) &
        +k(1897)*n(idx_HCNj)*n(idx_NH3) &
        +k(1900)*n(idx_HCNj)*n(idx_CH4) &
        -k(1946)*n(idx_HCOj)*n(idx_NH2) &
        -k(2056)*n(idx_HNCj)*n(idx_NH2) &
        -k(2075)*n(idx_HNOj)*n(idx_NH2) &
        -k(2100)*n(idx_N2Hj)*n(idx_NH2) &
        +k(2114)*n(idx_NH2j)*n(idx_S) &
        +k(2118)*n(idx_NH2j)*n(idx_CH) &
        +k(2124)*n(idx_NH2j)*n(idx_NO) &
        +k(2128)*n(idx_NH2j)*n(idx_CH2) &
        +k(2134)*n(idx_NH2j)*n(idx_H2S) &
        +k(2139)*n(idx_NH2j)*n(idx_HCO) &
        -k(2141)*n(idx_NH2j)*n(idx_NH2) &
        +k(2144)*n(idx_NH2j)*n(idx_NH3) &
        -k(2168)*n(idx_O2Hj)*n(idx_NH2) &
        -k(2220)*n(idx_C2H2j)*n(idx_NH2) &
        -k(2221)*n(idx_C2H2j)*n(idx_NH2) &
        -k(2345)*n(idx_CH3j)*n(idx_NH2) &
        -k(2395)*n(idx_HCNHj)*n(idx_NH2) &
        -k(2396)*n(idx_HCNHj)*n(idx_NH2) &
        -k(2420)*n(idx_H2COj)*n(idx_NH2) &
        -k(2451)*n(idx_H3Oj)*n(idx_NH2) &
        +k(2521)*n(idx_NH3j)*n(idx_CH2) &
        -k(2526)*n(idx_NH3j)*n(idx_NH2) &
        +k(2528)*n(idx_NH3j)*n(idx_NH3) &
        +k(2735)*n(idx_CH4j)*n(idx_NH3) &
        -k(2744)*n(idx_H3COj)*n(idx_NH2) &
        -k(2927)*n(idx_CH5j)*n(idx_NH2) &
        +k(3227)*n(idx_Hk)*n(idx_NH) &
        -k(3232)*n(idx_Hk)*n(idx_NH2) &
        -k(3274)*n(idx_C)*n(idx_NH2) &
        -k(3275)*n(idx_C)*n(idx_NH2) &
        -k(3326)*n(idx_C)*n(idx_NH2) &
        +k(3342)*n(idx_H)*n(idx_NH3) &
        +k(3348)*n(idx_H)*n(idx_HNO) &
        +k(3368)*n(idx_H2)*n(idx_NH) &
        -k(3369)*n(idx_H2)*n(idx_NH2) &
        -k(3469)*n(idx_O)*n(idx_NH2) &
        -k(3470)*n(idx_O)*n(idx_NH2) &
        -k(3471)*n(idx_O)*n(idx_NH2) &
        +k(3578)*n(idx_CN)*n(idx_NH3) &
        -k(3594)*n(idx_NO)*n(idx_NH2) &
        -k(3602)*n(idx_OH)*n(idx_NH2) &
        -k(3603)*n(idx_OH)*n(idx_NH2) &
        -k(3640)*n(idx_NH2)*n(idx_H2CO) &
        +k(3832)*n(idx_NH3j)*n(idx_E) &
        +k(3839)*n(idx_PNH2j)*n(idx_E) &
        +k(3905)*n(idx_NH4j)*n(idx_E) &
        +k(3906)*n(idx_NH4j)*n(idx_E) &
        +k(3964)*n(idx_CH4Nj)*n(idx_E) &
        +k(3992)*n(idx_NH2CNHj)*n(idx_E) &
        +k(4046)*n(idx_CH5Nj)*n(idx_E) &
        +k(4061)*n(idx_NH2CH2Oj)*n(idx_E) &
        -k(4303)*n(idx_NH2) &
        -k(4304)*n(idx_NH2) &
        +k(4328)*n(idx_NH3) &
        +k(4385)*n(idx_CH5N) &
        -k(4451)*n(idx_NH2) &
        +k(4497)*n(idx_N_DUSTH_DUSTH_DUST)

    !NO2
    !NO2
    dn(idx_NO2) = &
        -k(90)*n(idx_NO2) &
        -k(1033)*n(idx_Oj)*n(idx_NO2) &
        -k(1461)*n(idx_O2j)*n(idx_NO2) &
        -k(1773)*n(idx_H3j)*n(idx_NO2) &
        -k(3359)*n(idx_H)*n(idx_NO2) &
        -k(3390)*n(idx_N)*n(idx_NO2) &
        -k(3391)*n(idx_N)*n(idx_NO2) &
        -k(3392)*n(idx_N)*n(idx_NO2) &
        +k(3467)*n(idx_O)*n(idx_HNO) &
        -k(3472)*n(idx_O)*n(idx_NO2) &
        -k(4305)*n(idx_NO2)

    !O2H
    !O2H
    dn(idx_O2H) = &
        -k(91)*n(idx_O2H) &
        -k(92)*n(idx_O2H) &
        +k(2411)*n(idx_H2COj)*n(idx_O2) &
        -k(3351)*n(idx_H)*n(idx_O2H) &
        -k(3352)*n(idx_H)*n(idx_O2H) &
        -k(3353)*n(idx_H)*n(idx_O2H) &
        +k(3355)*n(idx_H)*n(idx_H2O2) &
        -k(3370)*n(idx_H2)*n(idx_O2H) &
        -k(3393)*n(idx_N)*n(idx_O2H) &
        -k(3473)*n(idx_O)*n(idx_O2H) &
        -k(3604)*n(idx_OH)*n(idx_O2H) &
        +k(3607)*n(idx_OH)*n(idx_H2O2) &
        -k(4449)*n(idx_O2H) &
        +k(4495)*n(idx_O_DUSTO_DUSTH_DUST)

    !OCN
    !OCN
    dn(idx_OCN) = &
        -k(93)*n(idx_OCN) &
        -k(263)*n(idx_Cj)*n(idx_OCN) &
        -k(732)*n(idx_HEj)*n(idx_OCN) &
        -k(733)*n(idx_HEj)*n(idx_OCN) &
        -k(3276)*n(idx_C)*n(idx_OCN) &
        +k(3388)*n(idx_N)*n(idx_HCO) &
        +k(3460)*n(idx_O)*n(idx_HCN) &
        -k(3474)*n(idx_O)*n(idx_OCN) &
        -k(3475)*n(idx_O)*n(idx_OCN) &
        +k(3493)*n(idx_O)*n(idx_H2CN) &
        +k(3511)*n(idx_O)*n(idx_C7N) &
        +k(3516)*n(idx_O)*n(idx_C9N) &
        +k(3572)*n(idx_CN)*n(idx_O2) &
        +k(3574)*n(idx_CN)*n(idx_OH) &
        +k(4060)*n(idx_NH2CH2Oj)*n(idx_E) &
        -k(4306)*n(idx_OCN) &
        -k(4460)*n(idx_OCN) &
        +k(4506)*n(idx_O_DUSTC_DUSTN_DUST)

    !OCS
    !OCS
    dn(idx_OCS) = &
        -k(94)*n(idx_OCS) &
        -k(95)*n(idx_OCS) &
        -k(264)*n(idx_Cj)*n(idx_OCS) &
        -k(265)*n(idx_Cj)*n(idx_OCS) &
        -k(485)*n(idx_Hj)*n(idx_OCS) &
        -k(734)*n(idx_HEj)*n(idx_OCS) &
        -k(735)*n(idx_HEj)*n(idx_OCS) &
        -k(736)*n(idx_HEj)*n(idx_OCS) &
        -k(737)*n(idx_HEj)*n(idx_OCS) &
        -k(983)*n(idx_Nj)*n(idx_OCS) &
        -k(984)*n(idx_Nj)*n(idx_OCS) &
        -k(985)*n(idx_Nj)*n(idx_OCS) &
        -k(1034)*n(idx_Oj)*n(idx_OCS) &
        -k(1035)*n(idx_Oj)*n(idx_OCS) &
        -k(1077)*n(idx_Sj)*n(idx_OCS) &
        -k(1106)*n(idx_SIj)*n(idx_OCS) &
        -k(1189)*n(idx_CHj)*n(idx_OCS) &
        -k(1190)*n(idx_CHj)*n(idx_OCS) &
        -k(1386)*n(idx_N2j)*n(idx_OCS) &
        -k(1387)*n(idx_N2j)*n(idx_OCS) &
        -k(1627)*n(idx_CH2j)*n(idx_OCS) &
        -k(1628)*n(idx_CH2j)*n(idx_OCS) &
        -k(1774)*n(idx_H3j)*n(idx_OCS) &
        -k(1947)*n(idx_HCOj)*n(idx_OCS) &
        +k(2171)*n(idx_OCSj)*n(idx_NH3) &
        -k(2287)*n(idx_C3Hj)*n(idx_OCS) &
        -k(2288)*n(idx_C3Hj)*n(idx_OCS) &
        -k(2289)*n(idx_C3Hj)*n(idx_OCS) &
        -k(2346)*n(idx_CH3j)*n(idx_OCS) &
        -k(2725)*n(idx_CH4j)*n(idx_OCS) &
        -k(2726)*n(idx_CH4j)*n(idx_OCS) &
        +k(3246)*n(idx_Sk)*n(idx_CO) &
        -k(3360)*n(idx_H)*n(idx_OCS) &
        +k(3462)*n(idx_O)*n(idx_HCS) &
        +k(3649)*n(idx_S)*n(idx_CO) &
        +k(3823)*n(idx_HOCSj)*n(idx_E) &
        +k(3908)*n(idx_OCSjH2)*n(idx_E) &
        -k(4307)*n(idx_OCS) &
        -k(4308)*n(idx_OCS)

    !PH2
    !PH2
    dn(idx_PH2) = &
        -k(96)*n(idx_PH2) &
        -k(486)*n(idx_Hj)*n(idx_PH2) &
        -k(738)*n(idx_HEj)*n(idx_PH2) &
        -k(1775)*n(idx_H3j)*n(idx_PH2) &
        -k(1948)*n(idx_HCOj)*n(idx_PH2) &
        -k(3476)*n(idx_O)*n(idx_PH2) &
        -k(3477)*n(idx_O)*n(idx_PH2) &
        +k(3503)*n(idx_O)*n(idx_CH2PH) &
        +k(3838)*n(idx_PH3j)*n(idx_E)

    !SIC2
    !SIC2
    dn(idx_SIC2) = &
        -k(97)*n(idx_SIC2) &
        +k(122)*n(idx_SIC2H) &
        +k(123)*n(idx_SIC3) &
        +k(143)*n(idx_SIC2H2) &
        +k(145)*n(idx_SIC4) &
        -k(266)*n(idx_Cj)*n(idx_SIC2) &
        -k(487)*n(idx_Hj)*n(idx_SIC2) &
        -k(739)*n(idx_HEj)*n(idx_SIC2) &
        -k(1776)*n(idx_H3j)*n(idx_SIC2) &
        -k(1949)*n(idx_HCOj)*n(idx_SIC2) &
        -k(2452)*n(idx_H3Oj)*n(idx_SIC2) &
        -k(3479)*n(idx_O)*n(idx_SIC2) &
        +k(3495)*n(idx_O)*n(idx_SIC3) &
        +k(3841)*n(idx_SIC2Hj)*n(idx_E) &
        +k(3843)*n(idx_SIC3j)*n(idx_E) &
        +k(3919)*n(idx_SIC2H2j)*n(idx_E) &
        +k(3924)*n(idx_SIC4j)*n(idx_E)

    !SIH2
    !SIH2
    dn(idx_SIH2) = &
        -k(98)*n(idx_SIH2) &
        +k(125)*n(idx_SIH3) &
        +k(147)*n(idx_SIH4) &
        -k(267)*n(idx_Cj)*n(idx_SIH2) &
        -k(268)*n(idx_Cj)*n(idx_SIH2) &
        -k(269)*n(idx_Cj)*n(idx_SIH2) &
        -k(488)*n(idx_Hj)*n(idx_SIH2) &
        -k(489)*n(idx_Hj)*n(idx_SIH2) &
        -k(740)*n(idx_HEj)*n(idx_SIH2) &
        -k(741)*n(idx_HEj)*n(idx_SIH2) &
        -k(1777)*n(idx_H3j)*n(idx_SIH2) &
        -k(1950)*n(idx_HCOj)*n(idx_SIH2) &
        -k(2453)*n(idx_H3Oj)*n(idx_SIH2) &
        -k(3277)*n(idx_C)*n(idx_SIH2) &
        -k(3394)*n(idx_N)*n(idx_SIH2) &
        -k(3480)*n(idx_O)*n(idx_SIH2) &
        -k(3481)*n(idx_O)*n(idx_SIH2) &
        +k(3845)*n(idx_SIH3j)*n(idx_E) &
        +k(3928)*n(idx_SIH4j)*n(idx_E)

    !SINC
    !SINC
    dn(idx_SINC) = &
        -k(99)*n(idx_SINC) &
        -k(490)*n(idx_Hj)*n(idx_SINC) &
        -k(742)*n(idx_HEj)*n(idx_SINC) &
        -k(1778)*n(idx_H3j)*n(idx_SINC) &
        -k(1951)*n(idx_HCOj)*n(idx_SINC) &
        -k(2454)*n(idx_H3Oj)*n(idx_SINC) &
        -k(3482)*n(idx_O)*n(idx_SINC) &
        +k(3847)*n(idx_SINCHj)*n(idx_E)

    !SIO2
    !SIO2
    dn(idx_SIO2) = &
        -k(100)*n(idx_SIO2) &
        -k(743)*n(idx_HEj)*n(idx_SIO2) &
        -k(1779)*n(idx_H3j)*n(idx_SIO2) &
        -k(1952)*n(idx_HCOj)*n(idx_SIO2) &
        +k(3595)*n(idx_OH)*n(idx_SIO) &
        +k(3825)*n(idx_HSIO2j)*n(idx_E)

    !SO2
    !SO2
    dn(idx_SO2) = &
        -k(101)*n(idx_SO2) &
        -k(270)*n(idx_Cj)*n(idx_SO2) &
        -k(744)*n(idx_HEj)*n(idx_SO2) &
        -k(745)*n(idx_HEj)*n(idx_SO2) &
        -k(746)*n(idx_HEj)*n(idx_SO2) &
        -k(747)*n(idx_HEj)*n(idx_SO2) &
        -k(1036)*n(idx_Oj)*n(idx_SO2) &
        -k(1264)*n(idx_COj)*n(idx_SO2) &
        -k(1780)*n(idx_H3j)*n(idx_SO2) &
        +k(2186)*n(idx_SO2j)*n(idx_O2) &
        +k(2507)*n(idx_HSO2j)*n(idx_H2O) &
        +k(2508)*n(idx_HSO2j)*n(idx_NH3) &
        +k(3247)*n(idx_Sk)*n(idx_O2) &
        -k(3278)*n(idx_C)*n(idx_SO2) &
        +k(3596)*n(idx_OH)*n(idx_SO) &
        +k(3648)*n(idx_O)*n(idx_SO) &
        +k(3828)*n(idx_HSO2j)*n(idx_E) &
        -k(4309)*n(idx_SO2)

    !C2H2
    !C2H2
    dn(idx_C2H2) = &
        -k(102)*n(idx_C2H2) &
        -k(103)*n(idx_C2H2) &
        +k(129)*n(idx_C2H3) &
        +k(150)*n(idx_C2H4) &
        -k(271)*n(idx_Cj)*n(idx_C2H2) &
        +k(376)*n(idx_Cj)*n(idx_C3H4) &
        -k(491)*n(idx_Hj)*n(idx_C2H2) &
        -k(492)*n(idx_Hj)*n(idx_C2H2) &
        -k(748)*n(idx_HEj)*n(idx_C2H2) &
        -k(749)*n(idx_HEj)*n(idx_C2H2) &
        -k(750)*n(idx_HEj)*n(idx_C2H2) &
        -k(751)*n(idx_HEj)*n(idx_C2H2) &
        -k(1050)*n(idx_Pj)*n(idx_C2H2) &
        -k(1051)*n(idx_Pj)*n(idx_C2H2) &
        -k(1078)*n(idx_Sj)*n(idx_C2H2) &
        -k(1107)*n(idx_SIj)*n(idx_C2H2) &
        -k(1144)*n(idx_C2j)*n(idx_C2H2) &
        -k(1191)*n(idx_CHj)*n(idx_C2H2) &
        -k(1192)*n(idx_CHj)*n(idx_C2H2) &
        -k(1321)*n(idx_H2j)*n(idx_C2H2) &
        -k(1322)*n(idx_H2j)*n(idx_C2H2) &
        -k(1519)*n(idx_PHj)*n(idx_C2H2) &
        -k(1584)*n(idx_C2Hj)*n(idx_C2H2) &
        +k(1595)*n(idx_C2Nj)*n(idx_CH4) &
        -k(1599)*n(idx_C2Nj)*n(idx_C2H2) &
        -k(1600)*n(idx_C2Nj)*n(idx_C2H2) &
        -k(1603)*n(idx_C3j)*n(idx_C2H2) &
        -k(1639)*n(idx_CNCj)*n(idx_C2H2) &
        -k(1640)*n(idx_CNCj)*n(idx_C2H2) &
        -k(1781)*n(idx_H3j)*n(idx_C2H2) &
        -k(1953)*n(idx_HCOj)*n(idx_C2H2) &
        -k(2101)*n(idx_N2Hj)*n(idx_C2H2) &
        -k(2172)*n(idx_PH2j)*n(idx_C2H2) &
        +k(2187)*n(idx_C2H2j)*n(idx_C) &
        +k(2190)*n(idx_C2H2j)*n(idx_FE) &
        +k(2191)*n(idx_C2H2j)*n(idx_MG) &
        +k(2195)*n(idx_C2H2j)*n(idx_NA) &
        +k(2200)*n(idx_C2H2j)*n(idx_SI) &
        +k(2207)*n(idx_C2H2j)*n(idx_NO) &
        +k(2213)*n(idx_C2H2j)*n(idx_H2S) &
        +k(2216)*n(idx_C2H2j)*n(idx_HCO) &
        -k(2222)*n(idx_C2H2j)*n(idx_C2H2) &
        -k(2223)*n(idx_C2H2j)*n(idx_C2H2) &
        +k(2228)*n(idx_C2H2j)*n(idx_H2CO) &
        +k(2229)*n(idx_C2H2j)*n(idx_NH3) &
        +k(2231)*n(idx_C2H2j)*n(idx_C2H3) &
        +k(2243)*n(idx_C2H2j)*n(idx_C2H4) &
        +k(2247)*n(idx_C2H2j)*n(idx_C3H3) &
        +k(2248)*n(idx_C2H2j)*n(idx_C3H3) &
        +k(2251)*n(idx_C2H2j)*n(idx_C4H2) &
        +k(2256)*n(idx_C2H2j)*n(idx_C3H4) &
        +k(2259)*n(idx_C2H2j)*n(idx_C5H2) &
        +k(2264)*n(idx_C2H2j)*n(idx_C6H2) &
        +k(2269)*n(idx_C2H2j)*n(idx_C7H2) &
        +k(2281)*n(idx_C3Hj)*n(idx_H2O) &
        +k(2284)*n(idx_C3Hj)*n(idx_H2S) &
        -k(2290)*n(idx_C3Hj)*n(idx_C2H2) &
        +k(2291)*n(idx_C3Hj)*n(idx_NH3) &
        +k(2295)*n(idx_C3Hj)*n(idx_CH4) &
        +k(2297)*n(idx_C3Hj)*n(idx_C2H4) &
        +k(2298)*n(idx_C3Hj)*n(idx_C2H4) &
        +k(2300)*n(idx_C3Hj)*n(idx_C4H2) &
        +k(2304)*n(idx_CH2SIj)*n(idx_C) &
        -k(2347)*n(idx_CH3j)*n(idx_C2H2) &
        +k(2376)*n(idx_CH3j)*n(idx_C4H2) &
        +k(2377)*n(idx_CH3j)*n(idx_C4H2) &
        -k(2503)*n(idx_HCO2j)*n(idx_C2H2) &
        -k(2530)*n(idx_PC2Hj)*n(idx_C2H2) &
        -k(2531)*n(idx_PH3j)*n(idx_C2H2) &
        -k(2533)*n(idx_SIC2Hj)*n(idx_C2H2) &
        +k(2553)*n(idx_C2H3j)*n(idx_C2H) &
        +k(2556)*n(idx_C2H3j)*n(idx_H2O) &
        +k(2557)*n(idx_C2H3j)*n(idx_H2S) &
        +k(2558)*n(idx_C2H3j)*n(idx_HCN) &
        +k(2559)*n(idx_C2H3j)*n(idx_HNC) &
        -k(2560)*n(idx_C2H3j)*n(idx_C2H2) &
        +k(2561)*n(idx_C2H3j)*n(idx_C3H) &
        +k(2562)*n(idx_C2H3j)*n(idx_HC3) &
        +k(2567)*n(idx_C2H3j)*n(idx_NH3) &
        +k(2571)*n(idx_C2H3j)*n(idx_C3H2) &
        +k(2572)*n(idx_C2H3j)*n(idx_H2C3) &
        +k(2577)*n(idx_C2H3j)*n(idx_C4H) &
        +k(2581)*n(idx_C2H3j)*n(idx_HC3N) &
        +k(2582)*n(idx_C2H3j)*n(idx_C2H4) &
        +k(2583)*n(idx_C2H3j)*n(idx_C3H3) &
        +k(2586)*n(idx_C2H3j)*n(idx_C4H2) &
        +k(2589)*n(idx_C2H3j)*n(idx_C5H) &
        +k(2592)*n(idx_C2H3j)*n(idx_C3H4) &
        +k(2594)*n(idx_C2H3j)*n(idx_C5H2) &
        +k(2597)*n(idx_C2H3j)*n(idx_C6H) &
        +k(2600)*n(idx_C2H3j)*n(idx_C6H2) &
        +k(2603)*n(idx_C2H3j)*n(idx_C7H) &
        +k(2606)*n(idx_C2H3j)*n(idx_C7H2) &
        +k(2609)*n(idx_C2H3j)*n(idx_C6H6) &
        -k(2628)*n(idx_C3H2j)*n(idx_C2H2) &
        -k(2629)*n(idx_H2C3j)*n(idx_C2H2) &
        +k(2664)*n(idx_C3H2j)*n(idx_C3H4) &
        +k(2665)*n(idx_H2C3j)*n(idx_C3H4) &
        -k(2692)*n(idx_C4Hj)*n(idx_C2H2) &
        +k(2703)*n(idx_C4Hj)*n(idx_C2H4) &
        -k(2713)*n(idx_C4Nj)*n(idx_C2H2) &
        -k(2727)*n(idx_CH4j)*n(idx_C2H2) &
        -k(2728)*n(idx_CH4j)*n(idx_C2H2) &
        -k(2729)*n(idx_CH4j)*n(idx_C2H2) &
        -k(2730)*n(idx_CH4j)*n(idx_C2H2) &
        -k(2772)*n(idx_C2H4j)*n(idx_C2H2) &
        -k(2773)*n(idx_C2H4j)*n(idx_C2H2) &
        -k(2774)*n(idx_C2H4j)*n(idx_C2H2) &
        +k(2782)*n(idx_C2H4j)*n(idx_C2H3) &
        -k(2828)*n(idx_C3H3j)*n(idx_C2H2) &
        -k(2829)*n(idx_H3C3j)*n(idx_C2H2) &
        -k(2881)*n(idx_C4H2j)*n(idx_C2H2) &
        +k(2895)*n(idx_C4H2j)*n(idx_C4H2) &
        -k(2928)*n(idx_CH5j)*n(idx_C2H2) &
        -k(2950)*n(idx_C2H5j)*n(idx_C2H2) &
        -k(2951)*n(idx_C2H5j)*n(idx_C2H2) &
        -k(2952)*n(idx_C2H5j)*n(idx_C2H2) &
        -k(2963)*n(idx_C3H4j)*n(idx_C2H2) &
        +k(2982)*n(idx_C4H3j)*n(idx_C4H2) &
        +k(2985)*n(idx_C4H3j)*n(idx_C3H4) &
        -k(2993)*n(idx_C5H2j)*n(idx_C2H2) &
        -k(2994)*n(idx_C5H2j)*n(idx_C2H2) &
        -k(3027)*n(idx_C4H4j)*n(idx_C2H2) &
        -k(3028)*n(idx_C4H4j)*n(idx_C2H2) &
        +k(3029)*n(idx_C4H4j)*n(idx_C4H2) &
        -k(3070)*n(idx_C7H2j)*n(idx_C2H2) &
        -k(3071)*n(idx_C7H2j)*n(idx_C2H2) &
        +k(3095)*n(idx_C6H5j)*n(idx_C2H4) &
        -k(3146)*n(idx_SIj)*n(idx_C2H2) &
        -k(3167)*n(idx_C3Hj)*n(idx_C2H2) &
        -k(3178)*n(idx_HCNHj)*n(idx_C2H2) &
        -k(3179)*n(idx_H3Oj)*n(idx_C2H2) &
        -k(3188)*n(idx_C3H2Nj)*n(idx_C2H2) &
        -k(3192)*n(idx_C4H2j)*n(idx_C2H2) &
        -k(3201)*n(idx_C4H3j)*n(idx_C2H2) &
        -k(3205)*n(idx_C6H2j)*n(idx_C2H2) &
        +k(3217)*n(idx_Ck)*n(idx_CH2) &
        +k(3229)*n(idx_Hk)*n(idx_C2H) &
        +k(3279)*n(idx_C)*n(idx_CH3) &
        -k(3280)*n(idx_C)*n(idx_C2H2) &
        -k(3281)*n(idx_C)*n(idx_C2H2) &
        -k(3282)*n(idx_C)*n(idx_C2H2) &
        +k(3333)*n(idx_H)*n(idx_C2H3) &
        +k(3407)*n(idx_N)*n(idx_C2H3) &
        +k(3497)*n(idx_O)*n(idx_H2C3) &
        -k(3533)*n(idx_SI)*n(idx_C2H2) &
        -k(3548)*n(idx_CH)*n(idx_C2H2) &
        -k(3567)*n(idx_C2)*n(idx_C2H2) &
        -k(3577)*n(idx_CN)*n(idx_C2H2) &
        +k(3608)*n(idx_OH)*n(idx_C2H3) &
        -k(3615)*n(idx_C2H)*n(idx_C2H2) &
        +k(3855)*n(idx_C2H2Oj)*n(idx_E) &
        +k(3858)*n(idx_C2H3j)*n(idx_E) &
        +k(3868)*n(idx_C3H2j)*n(idx_E) &
        +k(3869)*n(idx_H2C3j)*n(idx_E) &
        +k(3909)*n(idx_PC2H2j)*n(idx_E) &
        +k(3936)*n(idx_C2H4j)*n(idx_E) &
        +k(3937)*n(idx_C2H4j)*n(idx_E) &
        +k(3948)*n(idx_C3H3j)*n(idx_E) &
        +k(3949)*n(idx_H3C3j)*n(idx_E) &
        +k(3974)*n(idx_H2C3Oj)*n(idx_E) &
        +k(3980)*n(idx_HC2NCHj)*n(idx_E) &
        +k(3994)*n(idx_PC2H3j)*n(idx_E) &
        +k(4021)*n(idx_C2H5j)*n(idx_E) &
        +k(4030)*n(idx_C3H4j)*n(idx_E) &
        +k(4065)*n(idx_PC4H2j)*n(idx_E) &
        +k(4107)*n(idx_C4H5j)*n(idx_E) &
        +k(4159)*n(idx_C4H7j)*n(idx_E) &
        -k(4310)*n(idx_C2H2) &
        -k(4311)*n(idx_C2H2) &
        +k(4332)*n(idx_C2H3) &
        +k(4352)*n(idx_C2H4) &
        -k(4463)*n(idx_C2H2) &
        +k(4509)*n(idx_C_DUSTC_DUSTH_DUSTH_DUST)

    !C3H
    !C3H
    dn(idx_C3H) = &
        -k(104)*n(idx_C3H) &
        +k(130)*n(idx_C3H2) &
        -k(272)*n(idx_Cj)*n(idx_C3H) &
        -k(493)*n(idx_Hj)*n(idx_C3H) &
        -k(495)*n(idx_Hj)*n(idx_C3H) &
        -k(752)*n(idx_HEj)*n(idx_C3H) &
        +k(841)*n(idx_HEj)*n(idx_SIC3H) &
        -k(1079)*n(idx_Sj)*n(idx_C3H) &
        -k(1108)*n(idx_SIj)*n(idx_C3H) &
        -k(1782)*n(idx_H3j)*n(idx_C3H) &
        -k(1954)*n(idx_HCOj)*n(idx_C3H) &
        -k(2224)*n(idx_C2H2j)*n(idx_C3H) &
        -k(2226)*n(idx_C2H2j)*n(idx_C3H) &
        +k(2274)*n(idx_C3Hj)*n(idx_NO) &
        +k(2292)*n(idx_C3Hj)*n(idx_NH3) &
        -k(2348)*n(idx_CH3j)*n(idx_C3H) &
        -k(2350)*n(idx_CH3j)*n(idx_C3H) &
        -k(2455)*n(idx_H3Oj)*n(idx_C3H) &
        -k(2561)*n(idx_C2H3j)*n(idx_C3H) &
        -k(2563)*n(idx_C2H3j)*n(idx_C3H) &
        -k(2565)*n(idx_C2H3j)*n(idx_C3H) &
        -k(2630)*n(idx_C3H2j)*n(idx_C3H) &
        -k(2693)*n(idx_C4Hj)*n(idx_C3H) &
        -k(2695)*n(idx_C4Hj)*n(idx_C3H) &
        -k(2775)*n(idx_C2H4j)*n(idx_C3H) &
        -k(2777)*n(idx_C2H4j)*n(idx_C3H) &
        -k(2830)*n(idx_C3H3j)*n(idx_C3H) &
        -k(2832)*n(idx_C3H3j)*n(idx_C3H) &
        -k(2882)*n(idx_C4H2j)*n(idx_C3H) &
        -k(2972)*n(idx_C4H3j)*n(idx_C3H) &
        -k(2995)*n(idx_C5H2j)*n(idx_C3H) &
        -k(3039)*n(idx_C6H2j)*n(idx_C3H) &
        +k(3280)*n(idx_C)*n(idx_C2H2) &
        -k(3291)*n(idx_C)*n(idx_C3H) &
        -k(3399)*n(idx_N)*n(idx_C3H) &
        -k(3486)*n(idx_O)*n(idx_C3H) &
        +k(3499)*n(idx_O)*n(idx_C4H) &
        +k(3870)*n(idx_C3H2j)*n(idx_E) &
        +k(3876)*n(idx_C4Hj)*n(idx_E) &
        +k(3900)*n(idx_HC3Oj)*n(idx_E) &
        +k(3921)*n(idx_SIC3Hj)*n(idx_E) &
        +k(3950)*n(idx_C3H3j)*n(idx_E) &
        +k(3975)*n(idx_H2C3Oj)*n(idx_E) &
        +k(3986)*n(idx_HC4Oj)*n(idx_E) &
        +k(3997)*n(idx_PC4Hj)*n(idx_E) &
        +k(4054)*n(idx_H3C3Oj)*n(idx_E) &
        -k(4312)*n(idx_C3H) &
        +k(4336)*n(idx_C3H2) &
        +k(4354)*n(idx_C3H3) &
        +k(4362)*n(idx_C5H) &
        +k(4377)*n(idx_C5H2) &
        +k(4381)*n(idx_C6H)

    !HC3
    !HC3
    dn(idx_HC3) = &
        -k(105)*n(idx_HC3) &
        +k(131)*n(idx_H2C3) &
        -k(273)*n(idx_Cj)*n(idx_HC3) &
        -k(494)*n(idx_Hj)*n(idx_HC3) &
        -k(496)*n(idx_Hj)*n(idx_HC3) &
        -k(753)*n(idx_HEj)*n(idx_HC3) &
        +k(842)*n(idx_HEj)*n(idx_SIC3H) &
        -k(1080)*n(idx_Sj)*n(idx_HC3) &
        -k(1109)*n(idx_SIj)*n(idx_HC3) &
        -k(1783)*n(idx_H3j)*n(idx_HC3) &
        -k(1955)*n(idx_HCOj)*n(idx_HC3) &
        -k(2225)*n(idx_C2H2j)*n(idx_HC3) &
        -k(2227)*n(idx_C2H2j)*n(idx_HC3) &
        +k(2275)*n(idx_C3Hj)*n(idx_NO) &
        +k(2293)*n(idx_C3Hj)*n(idx_NH3) &
        -k(2349)*n(idx_CH3j)*n(idx_HC3) &
        -k(2351)*n(idx_CH3j)*n(idx_HC3) &
        -k(2456)*n(idx_H3Oj)*n(idx_HC3) &
        -k(2562)*n(idx_C2H3j)*n(idx_HC3) &
        -k(2564)*n(idx_C2H3j)*n(idx_HC3) &
        -k(2566)*n(idx_C2H3j)*n(idx_HC3) &
        -k(2631)*n(idx_H2C3j)*n(idx_HC3) &
        -k(2694)*n(idx_C4Hj)*n(idx_HC3) &
        -k(2696)*n(idx_C4Hj)*n(idx_HC3) &
        -k(2776)*n(idx_C2H4j)*n(idx_HC3) &
        -k(2778)*n(idx_C2H4j)*n(idx_HC3) &
        -k(2831)*n(idx_H3C3j)*n(idx_HC3) &
        -k(2833)*n(idx_H3C3j)*n(idx_HC3) &
        -k(2883)*n(idx_C4H2j)*n(idx_HC3) &
        -k(2973)*n(idx_C4H3j)*n(idx_HC3) &
        -k(2996)*n(idx_C5H2j)*n(idx_HC3) &
        -k(3038)*n(idx_C6H2j)*n(idx_HC3) &
        +k(3281)*n(idx_C)*n(idx_C2H2) &
        -k(3292)*n(idx_C)*n(idx_HC3) &
        -k(3400)*n(idx_N)*n(idx_HC3) &
        -k(3487)*n(idx_O)*n(idx_HC3) &
        +k(3500)*n(idx_O)*n(idx_C4H) &
        +k(3871)*n(idx_H2C3j)*n(idx_E) &
        +k(3901)*n(idx_HC3Oj)*n(idx_E) &
        +k(3922)*n(idx_SIC3Hj)*n(idx_E) &
        +k(3951)*n(idx_H3C3j)*n(idx_E) &
        +k(3976)*n(idx_H2C3Oj)*n(idx_E) &
        +k(3987)*n(idx_HC4Oj)*n(idx_E) &
        +k(3998)*n(idx_PC4Hj)*n(idx_E) &
        +k(4055)*n(idx_H3C3Oj)*n(idx_E) &
        -k(4313)*n(idx_HC3) &
        +k(4337)*n(idx_H2C3) &
        +k(4355)*n(idx_C3H3) &
        +k(4363)*n(idx_C5H) &
        +k(4378)*n(idx_C5H2) &
        +k(4382)*n(idx_C6H)

    !C3N
    !C3N
    dn(idx_C3N) = &
        -k(106)*n(idx_C3N) &
        +k(181)*n(idx_CH3C3N) &
        +k(397)*n(idx_Cj)*n(idx_CH3C3N) &
        -k(754)*n(idx_HEj)*n(idx_C3N) &
        -k(755)*n(idx_HEj)*n(idx_C3N) &
        +k(906)*n(idx_HEj)*n(idx_HC5N) &
        +k(916)*n(idx_HEj)*n(idx_CH3C3N) &
        -k(1784)*n(idx_H3j)*n(idx_C3N) &
        -k(1956)*n(idx_HCOj)*n(idx_C3N) &
        -k(2457)*n(idx_H3Oj)*n(idx_C3N) &
        -k(3295)*n(idx_C)*n(idx_C3N) &
        +k(3399)*n(idx_N)*n(idx_C3H) &
        +k(3400)*n(idx_N)*n(idx_HC3) &
        -k(3401)*n(idx_N)*n(idx_C3N) &
        +k(3414)*n(idx_N)*n(idx_C4N) &
        -k(3488)*n(idx_O)*n(idx_C3N) &
        +k(3501)*n(idx_O)*n(idx_C4N) &
        +k(3874)*n(idx_C3HNj)*n(idx_E) &
        +k(3880)*n(idx_C4Nj)*n(idx_E) &
        +k(3958)*n(idx_C5Nj)*n(idx_E) &
        +k(3985)*n(idx_HC4Nj)*n(idx_E) &
        +k(4024)*n(idx_C3H3Nj)*n(idx_E) &
        +k(4039)*n(idx_C5HNj)*n(idx_E) &
        +k(4073)*n(idx_C3H4Nj)*n(idx_E) &
        -k(4314)*n(idx_C3N) &
        +k(4390)*n(idx_CH3C3N)

    !C3O
    !C3O
    dn(idx_C3O) = &
        -k(107)*n(idx_C3O) &
        -k(274)*n(idx_Cj)*n(idx_C3O) &
        -k(275)*n(idx_Cj)*n(idx_C3O) &
        -k(276)*n(idx_Cj)*n(idx_C3O) &
        -k(497)*n(idx_Hj)*n(idx_C3O) &
        -k(756)*n(idx_HEj)*n(idx_C3O) &
        -k(757)*n(idx_HEj)*n(idx_C3O) &
        -k(1785)*n(idx_H3j)*n(idx_C3O) &
        -k(1957)*n(idx_HCOj)*n(idx_C3O) &
        +k(2287)*n(idx_C3Hj)*n(idx_OCS) &
        -k(2458)*n(idx_H3Oj)*n(idx_C3O) &
        -k(3296)*n(idx_C)*n(idx_C3O) &
        -k(3489)*n(idx_O)*n(idx_C3O) &
        +k(3902)*n(idx_HC3Oj)*n(idx_E) &
        +k(3977)*n(idx_H2C3Oj)*n(idx_E) &
        +k(3978)*n(idx_H2C3Oj)*n(idx_E) &
        +k(3988)*n(idx_HC4Oj)*n(idx_E) &
        +k(4056)*n(idx_H3C3Oj)*n(idx_E) &
        -k(4315)*n(idx_C3O)

    !C3P
    !C3P
    dn(idx_C3P) = &
        -k(108)*n(idx_C3P) &
        +k(134)*n(idx_C4P) &
        -k(277)*n(idx_Cj)*n(idx_C3P) &
        -k(758)*n(idx_HEj)*n(idx_C3P) &
        -k(759)*n(idx_HEj)*n(idx_C3P) &
        -k(1786)*n(idx_H3j)*n(idx_C3P) &
        -k(1958)*n(idx_HCOj)*n(idx_C3P) &
        -k(2459)*n(idx_H3Oj)*n(idx_C3P) &
        -k(3490)*n(idx_O)*n(idx_C3P) &
        +k(3502)*n(idx_O)*n(idx_C4P) &
        +k(3882)*n(idx_C4Pj)*n(idx_E) &
        +k(3913)*n(idx_PC3Hj)*n(idx_E) &
        +k(4000)*n(idx_PC4Hj)*n(idx_E)

    !C3S
    !C3S
    dn(idx_C3S) = &
        -k(109)*n(idx_C3S) &
        -k(278)*n(idx_Cj)*n(idx_C3S) &
        -k(279)*n(idx_Cj)*n(idx_C3S) &
        -k(498)*n(idx_Hj)*n(idx_C3S) &
        -k(760)*n(idx_HEj)*n(idx_C3S) &
        -k(761)*n(idx_HEj)*n(idx_C3S) &
        -k(1787)*n(idx_H3j)*n(idx_C3S) &
        -k(1959)*n(idx_HCOj)*n(idx_C3S) &
        -k(2460)*n(idx_H3Oj)*n(idx_C3S) &
        +k(3611)*n(idx_C2H)*n(idx_CS) &
        +k(3885)*n(idx_C4Sj)*n(idx_E) &
        +k(3904)*n(idx_HC3Sj)*n(idx_E) &
        +k(3990)*n(idx_HC4Sj)*n(idx_E) &
        -k(4316)*n(idx_C3S)

    !C4
    !C4
    dn(idx_C4) = &
        -k(110)*n(idx_C4) &
        +k(132)*n(idx_C4H) &
        +k(136)*n(idx_C5) &
        +k(158)*n(idx_C5N) &
        -k(499)*n(idx_Hj)*n(idx_C4) &
        -k(762)*n(idx_HEj)*n(idx_C4) &
        -k(763)*n(idx_HEj)*n(idx_C4) &
        -k(764)*n(idx_HEj)*n(idx_C4) &
        -k(1788)*n(idx_H3j)*n(idx_C4) &
        -k(1960)*n(idx_HCOj)*n(idx_C4) &
        -k(2461)*n(idx_H3Oj)*n(idx_C4) &
        +k(2700)*n(idx_C4Hj)*n(idx_C4H) &
        +k(2902)*n(idx_C5Hj)*n(idx_O) &
        -k(3131)*n(idx_Cj)*n(idx_C4) &
        +k(3291)*n(idx_C)*n(idx_C3H) &
        +k(3292)*n(idx_C)*n(idx_HC3) &
        -k(3317)*n(idx_C)*n(idx_C4) &
        +k(3320)*n(idx_C)*n(idx_C6) &
        +k(3322)*n(idx_C)*n(idx_C8) &
        -k(3411)*n(idx_N)*n(idx_C4) &
        +k(3412)*n(idx_N)*n(idx_C5) &
        -k(3491)*n(idx_O)*n(idx_C4) &
        +k(3498)*n(idx_O)*n(idx_C5) &
        +k(3554)*n(idx_CH)*n(idx_C3) &
        -k(3559)*n(idx_CH)*n(idx_C4) &
        +k(3626)*n(idx_C2H)*n(idx_C2) &
        -k(3627)*n(idx_C2H)*n(idx_C4) &
        +k(3654)*n(idx_C)*n(idx_C3) &
        +k(3878)*n(idx_C4Hj)*n(idx_E) &
        +k(3887)*n(idx_C5j)*n(idx_E) &
        +k(3954)*n(idx_C4H2j)*n(idx_E) &
        +k(3959)*n(idx_C6j)*n(idx_E) &
        +k(4043)*n(idx_C7j)*n(idx_E) &
        -k(4317)*n(idx_C4) &
        -k(4318)*n(idx_C4) &
        +k(4339)*n(idx_C4H) &
        +k(4365)*n(idx_C5N) &
        +k(4380)*n(idx_C6H) &
        +k(4392)*n(idx_NC6N) &
        +k(4397)*n(idx_HC6N)

    !CH3
    !CH3
    dn(idx_CH3) = &
        -k(111)*n(idx_CH3) &
        -k(112)*n(idx_CH3) &
        +k(148)*n(idx_CH3CN) &
        +k(160)*n(idx_CH3OH) &
        +k(164)*n(idx_C2H4O) &
        +k(181)*n(idx_CH3C3N) &
        +k(187)*n(idx_CH3C4H) &
        +k(195)*n(idx_CH3C5N) &
        +k(197)*n(idx_CH3C6H) &
        +k(198)*n(idx_CH3C7N) &
        -k(280)*n(idx_Cj)*n(idx_CH3) &
        -k(281)*n(idx_Cj)*n(idx_CH3) &
        -k(282)*n(idx_Cj)*n(idx_CH3) &
        -k(500)*n(idx_Hj)*n(idx_CH3) &
        -k(765)*n(idx_HEj)*n(idx_CH3) &
        -k(766)*n(idx_HEj)*n(idx_CH3) &
        +k(812)*n(idx_HEj)*n(idx_CH4) &
        +k(849)*n(idx_HEj)*n(idx_CH3CN) &
        +k(868)*n(idx_HEj)*n(idx_CH3OH) &
        +k(875)*n(idx_HEj)*n(idx_C2H4O) &
        +k(901)*n(idx_HEj)*n(idx_CH5N) &
        +k(917)*n(idx_HEj)*n(idx_HCOOCH3) &
        +k(933)*n(idx_HEj)*n(idx_CH3OCH3) &
        +k(935)*n(idx_HEj)*n(idx_C2H6CO) &
        +k(998)*n(idx_Nj)*n(idx_CH3OH) &
        -k(1081)*n(idx_Sj)*n(idx_CH3) &
        -k(1110)*n(idx_SIj)*n(idx_CH3) &
        -k(1111)*n(idx_SIj)*n(idx_CH3) &
        +k(1145)*n(idx_C2j)*n(idx_CH4) &
        +k(1269)*n(idx_COj)*n(idx_CH4) &
        +k(1282)*n(idx_CSj)*n(idx_CH4) &
        +k(1525)*n(idx_PHj)*n(idx_C2H4) &
        +k(1588)*n(idx_C2Hj)*n(idx_CH4) &
        +k(1629)*n(idx_CH2j)*n(idx_H2CO) &
        +k(1652)*n(idx_CO2j)*n(idx_CH4) &
        +k(1695)*n(idx_H2Oj)*n(idx_CH4) &
        -k(1789)*n(idx_H3j)*n(idx_CH3) &
        +k(1899)*n(idx_HCNj)*n(idx_CH4) &
        +k(2244)*n(idx_C2H2j)*n(idx_C2H4) &
        +k(2245)*n(idx_C2H2j)*n(idx_C2H4) &
        +k(2313)*n(idx_CH3j)*n(idx_FE) &
        +k(2314)*n(idx_CH3j)*n(idx_MG) &
        +k(2317)*n(idx_CH3j)*n(idx_NA) &
        +k(2323)*n(idx_CH3j)*n(idx_SI) &
        +k(2332)*n(idx_CH3j)*n(idx_NO) &
        +k(2343)*n(idx_CH3j)*n(idx_HCO) &
        +k(2348)*n(idx_CH3j)*n(idx_C3H) &
        +k(2349)*n(idx_CH3j)*n(idx_HC3) &
        +k(2355)*n(idx_CH3j)*n(idx_C2H3) &
        +k(2424)*n(idx_H2COj)*n(idx_CH4) &
        +k(2529)*n(idx_NH3j)*n(idx_CH4) &
        +k(2568)*n(idx_C2H3j)*n(idx_C2H3) &
        +k(2569)*n(idx_C2H3j)*n(idx_C2H3) &
        +k(2646)*n(idx_C3H2j)*n(idx_C2H4) &
        +k(2647)*n(idx_H2C3j)*n(idx_C2H4) &
        +k(2666)*n(idx_H2C3j)*n(idx_C3H4) &
        +k(2667)*n(idx_C3H2j)*n(idx_C3H4) &
        +k(2718)*n(idx_CH4j)*n(idx_CO) &
        +k(2721)*n(idx_CH4j)*n(idx_CO2) &
        +k(2722)*n(idx_CH4j)*n(idx_H2O) &
        +k(2724)*n(idx_CH4j)*n(idx_H2S) &
        +k(2726)*n(idx_CH4j)*n(idx_OCS) &
        +k(2728)*n(idx_CH4j)*n(idx_C2H2) &
        +k(2732)*n(idx_CH4j)*n(idx_H2CO) &
        +k(2734)*n(idx_CH4j)*n(idx_NH3) &
        +k(2736)*n(idx_CH4j)*n(idx_CH4) &
        +k(2738)*n(idx_CH4j)*n(idx_C2H4) &
        +k(2740)*n(idx_CH4j)*n(idx_CH3OH) &
        +k(2764)*n(idx_C2H4j)*n(idx_O) &
        +k(2772)*n(idx_C2H4j)*n(idx_C2H2) &
        +k(2773)*n(idx_C2H4j)*n(idx_C2H2) &
        +k(2775)*n(idx_C2H4j)*n(idx_C3H) &
        +k(2776)*n(idx_C2H4j)*n(idx_HC3) &
        +k(2784)*n(idx_C2H4j)*n(idx_C3H2) &
        +k(2785)*n(idx_C2H4j)*n(idx_H2C3) &
        +k(2788)*n(idx_C2H4j)*n(idx_C4H) &
        +k(2791)*n(idx_C2H4j)*n(idx_C2H4) &
        +k(2797)*n(idx_C2H4j)*n(idx_C4H2) &
        +k(2799)*n(idx_C2H4j)*n(idx_C5H) &
        +k(2801)*n(idx_C2H4j)*n(idx_C3H4) &
        +k(2802)*n(idx_C2H4j)*n(idx_C5H2) &
        +k(2804)*n(idx_C2H4j)*n(idx_C6H) &
        +k(2806)*n(idx_C2H4j)*n(idx_C6H2) &
        +k(2808)*n(idx_C2H4j)*n(idx_C7H) &
        +k(2810)*n(idx_C2H4j)*n(idx_C7H2) &
        +k(3124)*n(idx_Ok)*n(idx_CH4) &
        +k(3230)*n(idx_Hk)*n(idx_CH2) &
        -k(3233)*n(idx_Hk)*n(idx_CH3) &
        -k(3249)*n(idx_CNk)*n(idx_CH3) &
        -k(3253)*n(idx_OHk)*n(idx_CH3) &
        -k(3279)*n(idx_C)*n(idx_CH3) &
        -k(3339)*n(idx_H)*n(idx_CH3) &
        +k(3340)*n(idx_H)*n(idx_CH4) &
        +k(3363)*n(idx_H2)*n(idx_CH2) &
        -k(3364)*n(idx_H2)*n(idx_CH3) &
        -k(3402)*n(idx_N)*n(idx_CH3) &
        -k(3403)*n(idx_N)*n(idx_CH3) &
        +k(3417)*n(idx_N)*n(idx_C2H5) &
        +k(3485)*n(idx_O)*n(idx_C2H5) &
        -k(3492)*n(idx_O)*n(idx_CH3) &
        -k(3527)*n(idx_S)*n(idx_CH3) &
        -k(3532)*n(idx_SI)*n(idx_CH3) &
        +k(3635)*n(idx_CH2)*n(idx_HNO) &
        -k(3638)*n(idx_HCO)*n(idx_CH3) &
        -k(3639)*n(idx_HNO)*n(idx_CH3) &
        +k(3650)*n(idx_CH)*n(idx_H2) &
        -k(3652)*n(idx_CN)*n(idx_CH3) &
        +k(3860)*n(idx_C2H3j)*n(idx_E) &
        +k(3890)*n(idx_CH4j)*n(idx_E) &
        +k(3917)*n(idx_PCH3j)*n(idx_E) &
        +k(3932)*n(idx_CH3CNj)*n(idx_E) &
        +k(3934)*n(idx_C2H3Oj)*n(idx_E) &
        +k(3941)*n(idx_C2H4j)*n(idx_E) &
        +k(3967)*n(idx_CH4Oj)*n(idx_E) &
        +k(3969)*n(idx_CH5j)*n(idx_E) &
        +k(3971)*n(idx_CH5j)*n(idx_E) &
        +k(4017)*n(idx_C2H4Oj)*n(idx_E) &
        +k(4031)*n(idx_C3H4j)*n(idx_E) &
        +k(4046)*n(idx_CH5Nj)*n(idx_E) &
        +k(4049)*n(idx_CH5Oj)*n(idx_E) &
        +k(4050)*n(idx_CH5Oj)*n(idx_E) &
        +k(4067)*n(idx_C2H5Oj)*n(idx_E) &
        +k(4095)*n(idx_COOCH4j)*n(idx_E) &
        +k(4102)*n(idx_C4H4Nj)*n(idx_E) &
        +2.d0*k(4124)*n(idx_CH3OCH3j)*n(idx_E) &
        +2.d0*k(4134)*n(idx_C2H6COj)*n(idx_E) &
        +k(4151)*n(idx_CH3OCH4j)*n(idx_E) &
        +k(4152)*n(idx_CH3OCH4j)*n(idx_E) &
        +k(4154)*n(idx_C3H6OHj)*n(idx_E) &
        +k(4160)*n(idx_C6H4Nj)*n(idx_E) &
        +k(4184)*n(idx_C8H4Nj)*n(idx_E) &
        +k(4207)*n(idx_CH3j)*n(idx_E) &
        -k(4319)*n(idx_CH3) &
        -k(4320)*n(idx_CH3) &
        -k(4321)*n(idx_CH3) &
        +k(4348)*n(idx_CH4) &
        +k(4350)*n(idx_CH3CN) &
        +k(4368)*n(idx_C2H4O) &
        +k(4385)*n(idx_CH5N) &
        +k(4390)*n(idx_CH3C3N) &
        +k(4410)*n(idx_CH3C4H) &
        -k(4461)*n(idx_CH3) &
        +k(4507)*n(idx_C_DUSTH_DUSTH_DUSTH_DUST)

    !H2CO
    !H2CO
    dn(idx_H2CO) = &
        -k(113)*n(idx_H2CO) &
        +k(161)*n(idx_CH3OH) &
        +2.d0*k(182)*n(idx_HCOOCH3) &
        +k(188)*n(idx_CH3OCH3) &
        -k(283)*n(idx_Cj)*n(idx_H2CO) &
        -k(284)*n(idx_Cj)*n(idx_H2CO) &
        -k(285)*n(idx_Cj)*n(idx_H2CO) &
        +k(367)*n(idx_Cj)*n(idx_NH2CHO) &
        -k(501)*n(idx_Hj)*n(idx_H2CO) &
        -k(502)*n(idx_Hj)*n(idx_H2CO) &
        +k(578)*n(idx_Hj)*n(idx_NH2CHO) &
        -k(767)*n(idx_HEj)*n(idx_H2CO) &
        -k(768)*n(idx_HEj)*n(idx_H2CO) &
        +k(872)*n(idx_HEj)*n(idx_NH2CHO) &
        +k(932)*n(idx_HEj)*n(idx_CH3OCH3) &
        -k(986)*n(idx_Nj)*n(idx_H2CO) &
        -k(987)*n(idx_Nj)*n(idx_H2CO) &
        -k(988)*n(idx_Nj)*n(idx_H2CO) &
        -k(1037)*n(idx_Oj)*n(idx_H2CO) &
        -k(1038)*n(idx_Oj)*n(idx_H2CO) &
        -k(1082)*n(idx_Sj)*n(idx_H2CO) &
        -k(1083)*n(idx_Sj)*n(idx_H2CO) &
        -k(1193)*n(idx_CHj)*n(idx_H2CO) &
        -k(1194)*n(idx_CHj)*n(idx_H2CO) &
        -k(1195)*n(idx_CHj)*n(idx_H2CO) &
        +k(1202)*n(idx_CHj)*n(idx_CH3OH) &
        -k(1234)*n(idx_CNj)*n(idx_H2CO) &
        -k(1235)*n(idx_CNj)*n(idx_H2CO) &
        -k(1265)*n(idx_COj)*n(idx_H2CO) &
        -k(1266)*n(idx_COj)*n(idx_H2CO) &
        -k(1323)*n(idx_H2j)*n(idx_H2CO) &
        -k(1324)*n(idx_H2j)*n(idx_H2CO) &
        -k(1388)*n(idx_N2j)*n(idx_H2CO) &
        -k(1389)*n(idx_N2j)*n(idx_H2CO) &
        -k(1430)*n(idx_NHj)*n(idx_H2CO) &
        -k(1431)*n(idx_NHj)*n(idx_H2CO) &
        -k(1432)*n(idx_NHj)*n(idx_H2CO) &
        -k(1462)*n(idx_O2j)*n(idx_H2CO) &
        -k(1463)*n(idx_O2j)*n(idx_H2CO) &
        -k(1507)*n(idx_OHj)*n(idx_H2CO) &
        -k(1508)*n(idx_OHj)*n(idx_H2CO) &
        +k(1552)*n(idx_SIOj)*n(idx_CH2) &
        -k(1585)*n(idx_C2Hj)*n(idx_H2CO) &
        -k(1629)*n(idx_CH2j)*n(idx_H2CO) &
        -k(1630)*n(idx_CH2j)*n(idx_H2CO) &
        -k(1631)*n(idx_CH2j)*n(idx_H2CO) &
        -k(1691)*n(idx_H2Oj)*n(idx_H2CO) &
        -k(1692)*n(idx_H2Oj)*n(idx_H2CO) &
        -k(1790)*n(idx_H3j)*n(idx_H2CO) &
        -k(1896)*n(idx_HCNj)*n(idx_H2CO) &
        -k(1961)*n(idx_HCOj)*n(idx_H2CO) &
        -k(2057)*n(idx_HNCj)*n(idx_H2CO) &
        -k(2076)*n(idx_HNOj)*n(idx_H2CO) &
        -k(2102)*n(idx_N2Hj)*n(idx_H2CO) &
        -k(2142)*n(idx_NH2j)*n(idx_H2CO) &
        -k(2143)*n(idx_NH2j)*n(idx_H2CO) &
        -k(2169)*n(idx_O2Hj)*n(idx_H2CO) &
        -k(2228)*n(idx_C2H2j)*n(idx_H2CO) &
        +k(2308)*n(idx_CH2SIj)*n(idx_O) &
        -k(2352)*n(idx_CH3j)*n(idx_H2CO) &
        -k(2397)*n(idx_HCNHj)*n(idx_H2CO) &
        +k(2400)*n(idx_H2COj)*n(idx_FE) &
        +k(2401)*n(idx_H2COj)*n(idx_MG) &
        +k(2402)*n(idx_H2COj)*n(idx_NA) &
        +k(2403)*n(idx_H2COj)*n(idx_S) &
        +k(2405)*n(idx_H2COj)*n(idx_SI) &
        +k(2407)*n(idx_H2COj)*n(idx_CH) &
        +k(2410)*n(idx_H2COj)*n(idx_NO) &
        +k(2413)*n(idx_H2COj)*n(idx_CH2) &
        +k(2417)*n(idx_H2COj)*n(idx_HCO) &
        -k(2421)*n(idx_H2COj)*n(idx_H2CO) &
        +k(2422)*n(idx_H2COj)*n(idx_NH3) &
        -k(2462)*n(idx_H3Oj)*n(idx_H2CO) &
        -k(2497)*n(idx_H3Sj)*n(idx_H2CO) &
        -k(2527)*n(idx_NH3j)*n(idx_H2CO) &
        -k(2731)*n(idx_CH4j)*n(idx_H2CO) &
        -k(2732)*n(idx_CH4j)*n(idx_H2CO) &
        +k(2741)*n(idx_H3COj)*n(idx_NA) &
        +k(2742)*n(idx_H3COj)*n(idx_CH) &
        +k(2743)*n(idx_H3COj)*n(idx_HNC) &
        +k(2744)*n(idx_H3COj)*n(idx_NH2) &
        +k(2745)*n(idx_H3COj)*n(idx_NH3) &
        -k(2929)*n(idx_CH5j)*n(idx_H2CO) &
        -k(2953)*n(idx_C2H5j)*n(idx_H2CO) &
        -k(3018)*n(idx_CH5Oj)*n(idx_H2CO) &
        +k(3218)*n(idx_Ck)*n(idx_H2O) &
        +k(3231)*n(idx_Hk)*n(idx_HCO) &
        +k(3241)*n(idx_Ok)*n(idx_CH2) &
        +k(3252)*n(idx_OHk)*n(idx_CH) &
        -k(3347)*n(idx_H)*n(idx_H2CO) &
        +k(3485)*n(idx_O)*n(idx_C2H5) &
        +k(3492)*n(idx_O)*n(idx_CH3) &
        +k(3598)*n(idx_OH)*n(idx_CH2) &
        -k(3605)*n(idx_OH)*n(idx_H2CO) &
        -k(3606)*n(idx_OH)*n(idx_H2CO) &
        +k(3636)*n(idx_HCO)*n(idx_HCO) &
        +k(3637)*n(idx_HCO)*n(idx_HNO) &
        -k(3640)*n(idx_NH2)*n(idx_H2CO) &
        +k(3893)*n(idx_H3COj)*n(idx_E) &
        +k(3968)*n(idx_CH4Oj)*n(idx_E) &
        +k(4048)*n(idx_CH5Oj)*n(idx_E) &
        +k(4061)*n(idx_NH2CH2Oj)*n(idx_E) &
        +k(4067)*n(idx_C2H5Oj)*n(idx_E) &
        +k(4099)*n(idx_C2H5OHj)*n(idx_E) &
        +k(4125)*n(idx_CH3OCH3j)*n(idx_E) &
        +k(4208)*n(idx_H2COj)*n(idx_E) &
        -k(4322)*n(idx_H2CO) &
        -k(4323)*n(idx_H2CO) &
        -k(4324)*n(idx_H2CO) &
        -k(4325)*n(idx_H2CO) &
        +k(4366)*n(idx_CH3OH) &
        +k(4411)*n(idx_CH3OCH3) &
        -k(4466)*n(idx_H2CO) &
        +k(4512)*n(idx_H_DUSTH_DUSTC_DUSTO_DUST)

    !H2CS
    !H2CS
    dn(idx_H2CS) = &
        -k(114)*n(idx_H2CS) &
        -k(286)*n(idx_Cj)*n(idx_H2CS) &
        -k(503)*n(idx_Hj)*n(idx_H2CS) &
        -k(769)*n(idx_HEj)*n(idx_H2CS) &
        -k(770)*n(idx_HEj)*n(idx_H2CS) &
        -k(771)*n(idx_HEj)*n(idx_H2CS) &
        -k(1791)*n(idx_H3j)*n(idx_H2CS) &
        -k(1962)*n(idx_HCOj)*n(idx_H2CS) &
        +k(2310)*n(idx_CH2SIj)*n(idx_S) &
        +k(3527)*n(idx_S)*n(idx_CH3) &
        +k(3895)*n(idx_H3CSj)*n(idx_E) &
        +k(4209)*n(idx_H2CSj)*n(idx_E) &
        -k(4326)*n(idx_H2CS)

    !H2O2
    !H2O2
    dn(idx_H2O2) = &
        -k(115)*n(idx_H2O2) &
        -k(3354)*n(idx_H)*n(idx_H2O2) &
        -k(3355)*n(idx_H)*n(idx_H2O2) &
        +k(3370)*n(idx_H2)*n(idx_O2H) &
        -k(3607)*n(idx_OH)*n(idx_H2O2) &
        +k(3656)*n(idx_OH)*n(idx_OH) &
        -k(4465)*n(idx_H2O2) &
        +k(4511)*n(idx_H_DUSTH_DUSTO_DUSTO_DUST)

    !H2S2
    !H2S2
    dn(idx_H2S2) = &
        -k(116)*n(idx_H2S2) &
        -k(504)*n(idx_Hj)*n(idx_H2S2) &
        -k(772)*n(idx_HEj)*n(idx_H2S2) &
        -k(773)*n(idx_HEj)*n(idx_H2S2) &
        -k(1792)*n(idx_H3j)*n(idx_H2S2) &
        -k(1963)*n(idx_HCOj)*n(idx_H2S2) &
        -k(2463)*n(idx_H3Oj)*n(idx_H2S2) &
        +k(3897)*n(idx_H3S2j)*n(idx_E)

    !H2SIO
    !H2SIO
    dn(idx_H2SIO) = &
        -k(117)*n(idx_H2SIO) &
        -k(287)*n(idx_Cj)*n(idx_H2SIO) &
        -k(505)*n(idx_Hj)*n(idx_H2SIO) &
        -k(506)*n(idx_Hj)*n(idx_H2SIO) &
        -k(774)*n(idx_HEj)*n(idx_H2SIO) &
        -k(1793)*n(idx_H3j)*n(idx_H2SIO) &
        -k(1964)*n(idx_HCOj)*n(idx_H2SIO) &
        -k(2464)*n(idx_H3Oj)*n(idx_H2SIO) &
        +k(3496)*n(idx_O)*n(idx_SIH3) &
        +k(3899)*n(idx_H3SIOj)*n(idx_E)

    !HCCP
    !HCCP
    dn(idx_HCCP) = &
        -k(118)*n(idx_HCCP) &
        -k(288)*n(idx_Cj)*n(idx_HCCP) &
        -k(289)*n(idx_Cj)*n(idx_HCCP) &
        -k(507)*n(idx_Hj)*n(idx_HCCP) &
        -k(775)*n(idx_HEj)*n(idx_HCCP) &
        -k(776)*n(idx_HEj)*n(idx_HCCP) &
        -k(1794)*n(idx_H3j)*n(idx_HCCP) &
        -k(1965)*n(idx_HCOj)*n(idx_HCCP) &
        -k(2465)*n(idx_H3Oj)*n(idx_HCCP) &
        -k(3494)*n(idx_O)*n(idx_HCCP) &
        +k(3911)*n(idx_PC2H2j)*n(idx_E) &
        +k(3914)*n(idx_PC3Hj)*n(idx_E) &
        +k(3996)*n(idx_PC2H3j)*n(idx_E) &
        +k(4064)*n(idx_PC2H4j)*n(idx_E)

    !NH3
    !NH3
    dn(idx_NH3) = &
        -k(119)*n(idx_NH3) &
        -k(120)*n(idx_NH3) &
        -k(121)*n(idx_NH3) &
        -k(290)*n(idx_Cj)*n(idx_NH3) &
        -k(291)*n(idx_Cj)*n(idx_NH3) &
        -k(292)*n(idx_Cj)*n(idx_NH3) &
        -k(508)*n(idx_Hj)*n(idx_NH3) &
        +k(576)*n(idx_Hj)*n(idx_NH2CHO) &
        -k(777)*n(idx_HEj)*n(idx_NH3) &
        -k(778)*n(idx_HEj)*n(idx_NH3) &
        -k(779)*n(idx_HEj)*n(idx_NH3) &
        +k(874)*n(idx_HEj)*n(idx_NH2CHO) &
        -k(989)*n(idx_Nj)*n(idx_NH3) &
        -k(990)*n(idx_Nj)*n(idx_NH3) &
        -k(991)*n(idx_Nj)*n(idx_NH3) &
        -k(1039)*n(idx_Oj)*n(idx_NH3) &
        -k(1052)*n(idx_Pj)*n(idx_NH3) &
        -k(1053)*n(idx_Pj)*n(idx_NH3) &
        -k(1084)*n(idx_Sj)*n(idx_NH3) &
        -k(1112)*n(idx_SIj)*n(idx_NH3) &
        -k(1196)*n(idx_CHj)*n(idx_NH3) &
        -k(1197)*n(idx_CHj)*n(idx_NH3) &
        -k(1198)*n(idx_CHj)*n(idx_NH3) &
        -k(1267)*n(idx_COj)*n(idx_NH3) &
        -k(1268)*n(idx_COj)*n(idx_NH3) &
        -k(1325)*n(idx_H2j)*n(idx_NH3) &
        -k(1353)*n(idx_HSj)*n(idx_NH3) &
        -k(1354)*n(idx_HSj)*n(idx_NH3) &
        -k(1390)*n(idx_N2j)*n(idx_NH3) &
        -k(1433)*n(idx_NHj)*n(idx_NH3) &
        -k(1434)*n(idx_NHj)*n(idx_NH3) &
        -k(1464)*n(idx_O2j)*n(idx_NH3) &
        -k(1509)*n(idx_OHj)*n(idx_NH3) &
        -k(1510)*n(idx_OHj)*n(idx_NH3) &
        -k(1520)*n(idx_PHj)*n(idx_NH3) &
        -k(1521)*n(idx_PHj)*n(idx_NH3) &
        -k(1522)*n(idx_PHj)*n(idx_NH3) &
        -k(1538)*n(idx_SIHj)*n(idx_NH3) &
        -k(1561)*n(idx_SOj)*n(idx_NH3) &
        -k(1586)*n(idx_C2Hj)*n(idx_NH3) &
        -k(1587)*n(idx_C2Hj)*n(idx_NH3) &
        -k(1596)*n(idx_C2Nj)*n(idx_NH3) &
        -k(1632)*n(idx_CH2j)*n(idx_NH3) &
        -k(1633)*n(idx_CH2j)*n(idx_NH3) &
        -k(1637)*n(idx_CNCj)*n(idx_NH3) &
        -k(1651)*n(idx_CO2j)*n(idx_NH3) &
        -k(1693)*n(idx_H2Oj)*n(idx_NH3) &
        -k(1694)*n(idx_H2Oj)*n(idx_NH3) &
        -k(1710)*n(idx_H2Sj)*n(idx_NH3) &
        -k(1711)*n(idx_H2Sj)*n(idx_NH3) &
        -k(1795)*n(idx_H3j)*n(idx_NH3) &
        -k(1897)*n(idx_HCNj)*n(idx_NH3) &
        -k(1898)*n(idx_HCNj)*n(idx_NH3) &
        -k(1966)*n(idx_HCOj)*n(idx_NH3) &
        -k(2039)*n(idx_HCSj)*n(idx_NH3) &
        -k(2058)*n(idx_HNCj)*n(idx_NH3) &
        -k(2077)*n(idx_HNOj)*n(idx_NH3) &
        -k(2103)*n(idx_N2Hj)*n(idx_NH3) &
        +k(2133)*n(idx_NH2j)*n(idx_H2S) &
        -k(2144)*n(idx_NH2j)*n(idx_NH3) &
        -k(2145)*n(idx_NH2j)*n(idx_NH3) &
        -k(2170)*n(idx_O2Hj)*n(idx_NH3) &
        -k(2171)*n(idx_OCSj)*n(idx_NH3) &
        -k(2229)*n(idx_C2H2j)*n(idx_NH3) &
        -k(2230)*n(idx_C2H2j)*n(idx_NH3) &
        -k(2291)*n(idx_C3Hj)*n(idx_NH3) &
        -k(2292)*n(idx_C3Hj)*n(idx_NH3) &
        -k(2293)*n(idx_C3Hj)*n(idx_NH3) &
        -k(2294)*n(idx_C3Hj)*n(idx_NH3) &
        -k(2353)*n(idx_CH3j)*n(idx_NH3) &
        -k(2354)*n(idx_CH3j)*n(idx_NH3) &
        -k(2398)*n(idx_HCNHj)*n(idx_NH3) &
        -k(2399)*n(idx_HCNHj)*n(idx_NH3) &
        -k(2422)*n(idx_H2COj)*n(idx_NH3) &
        -k(2423)*n(idx_H2COj)*n(idx_NH3) &
        -k(2466)*n(idx_H3Oj)*n(idx_NH3) &
        -k(2498)*n(idx_H3Sj)*n(idx_NH3) &
        -k(2504)*n(idx_HCO2j)*n(idx_NH3) &
        -k(2508)*n(idx_HSO2j)*n(idx_NH3) &
        +k(2509)*n(idx_NH3j)*n(idx_FE) &
        +k(2510)*n(idx_NH3j)*n(idx_MG) &
        +k(2511)*n(idx_NH3j)*n(idx_NA) &
        +k(2514)*n(idx_NH3j)*n(idx_SI) &
        +k(2519)*n(idx_NH3j)*n(idx_NO) &
        +k(2524)*n(idx_NH3j)*n(idx_HCO) &
        -k(2528)*n(idx_NH3j)*n(idx_NH3) &
        -k(2567)*n(idx_C2H3j)*n(idx_NH3) &
        -k(2733)*n(idx_CH4j)*n(idx_NH3) &
        -k(2734)*n(idx_CH4j)*n(idx_NH3) &
        -k(2735)*n(idx_CH4j)*n(idx_NH3) &
        -k(2745)*n(idx_H3COj)*n(idx_NH3) &
        -k(2779)*n(idx_C2H4j)*n(idx_NH3) &
        -k(2780)*n(idx_C2H4j)*n(idx_NH3) &
        -k(2930)*n(idx_CH5j)*n(idx_NH3) &
        -k(2954)*n(idx_C2H5j)*n(idx_NH3) &
        -k(3172)*n(idx_CH3j)*n(idx_NH3) &
        +k(3232)*n(idx_Hk)*n(idx_NH2) &
        -k(3342)*n(idx_H)*n(idx_NH3) &
        +k(3369)*n(idx_H2)*n(idx_NH2) &
        -k(3578)*n(idx_CN)*n(idx_NH3) &
        -k(3579)*n(idx_CN)*n(idx_NH3) &
        +k(3603)*n(idx_OH)*n(idx_NH2) &
        +k(3907)*n(idx_NH4j)*n(idx_E) &
        +k(3918)*n(idx_PNH3j)*n(idx_E) &
        +k(4058)*n(idx_NH2CH2Oj)*n(idx_E) &
        +k(4245)*n(idx_NH4j)*n(idx_Hk) &
        -k(4327)*n(idx_NH3) &
        -k(4328)*n(idx_NH3) &
        -k(4329)*n(idx_NH3) &
        -k(4462)*n(idx_NH3) &
        +k(4508)*n(idx_N_DUSTH_DUSTH_DUSTH_DUST)

    !SIC2H
    !SIC2H
    dn(idx_SIC2H) = &
        -k(122)*n(idx_SIC2H) &
        -k(293)*n(idx_Cj)*n(idx_SIC2H) &
        -k(294)*n(idx_Cj)*n(idx_SIC2H) &
        -k(509)*n(idx_Hj)*n(idx_SIC2H) &
        -k(510)*n(idx_Hj)*n(idx_SIC2H) &
        -k(780)*n(idx_HEj)*n(idx_SIC2H) &
        -k(781)*n(idx_HEj)*n(idx_SIC2H) &
        -k(1796)*n(idx_H3j)*n(idx_SIC2H) &
        -k(1967)*n(idx_HCOj)*n(idx_SIC2H) &
        -k(2467)*n(idx_H3Oj)*n(idx_SIC2H) &
        +k(3533)*n(idx_SI)*n(idx_C2H2) &
        +k(3920)*n(idx_SIC2H2j)*n(idx_E) &
        +k(4005)*n(idx_SIC2H3j)*n(idx_E)

    !SIC3
    !SIC3
    dn(idx_SIC3) = &
        -k(123)*n(idx_SIC3) &
        +k(144)*n(idx_SIC3H) &
        -k(295)*n(idx_Cj)*n(idx_SIC3) &
        -k(511)*n(idx_Hj)*n(idx_SIC3) &
        -k(782)*n(idx_HEj)*n(idx_SIC3) &
        -k(1797)*n(idx_H3j)*n(idx_SIC3) &
        -k(1968)*n(idx_HCOj)*n(idx_SIC3) &
        -k(3495)*n(idx_O)*n(idx_SIC3) &
        +k(3504)*n(idx_O)*n(idx_SIC4) &
        +k(3923)*n(idx_SIC3Hj)*n(idx_E) &
        +k(3925)*n(idx_SIC4j)*n(idx_E) &
        +k(4007)*n(idx_SIC3H2j)*n(idx_E) &
        +k(4009)*n(idx_SIC4Hj)*n(idx_E)

    !SICH2
    !SICH2
    dn(idx_SICH2) = &
        -k(124)*n(idx_SICH2) &
        +k(146)*n(idx_SICH3) &
        -k(296)*n(idx_Cj)*n(idx_SICH2) &
        -k(297)*n(idx_Cj)*n(idx_SICH2) &
        -k(298)*n(idx_Cj)*n(idx_SICH2) &
        -k(512)*n(idx_Hj)*n(idx_SICH2) &
        -k(513)*n(idx_Hj)*n(idx_SICH2) &
        -k(783)*n(idx_HEj)*n(idx_SICH2) &
        -k(784)*n(idx_HEj)*n(idx_SICH2) &
        -k(1798)*n(idx_H3j)*n(idx_SICH2) &
        -k(1969)*n(idx_HCOj)*n(idx_SICH2) &
        +k(2751)*n(idx_SICH3j)*n(idx_H2O) &
        +k(3284)*n(idx_C)*n(idx_SIH3) &
        +k(3532)*n(idx_SI)*n(idx_CH3) &
        +k(3927)*n(idx_SICH3j)*n(idx_E) &
        +k(4011)*n(idx_SICH4j)*n(idx_E)

    !SIH3
    !SIH3
    dn(idx_SIH3) = &
        -k(125)*n(idx_SIH3) &
        -k(299)*n(idx_Cj)*n(idx_SIH3) &
        -k(300)*n(idx_Cj)*n(idx_SIH3) &
        -k(301)*n(idx_Cj)*n(idx_SIH3) &
        -k(514)*n(idx_Hj)*n(idx_SIH3) &
        -k(515)*n(idx_Hj)*n(idx_SIH3) &
        -k(785)*n(idx_HEj)*n(idx_SIH3) &
        -k(786)*n(idx_HEj)*n(idx_SIH3) &
        -k(1799)*n(idx_H3j)*n(idx_SIH3) &
        +k(2753)*n(idx_SIH4j)*n(idx_CO) &
        +k(2755)*n(idx_SIH4j)*n(idx_H2O) &
        -k(3284)*n(idx_C)*n(idx_SIH3) &
        -k(3405)*n(idx_N)*n(idx_SIH3) &
        -k(3496)*n(idx_O)*n(idx_SIH3) &
        +k(3929)*n(idx_SIH4j)*n(idx_E) &
        +k(4013)*n(idx_SIH5j)*n(idx_E)

    !CH2CN
    !CH2CN
    dn(idx_CH2CN) = &
        -k(126)*n(idx_CH2CN) &
        -k(302)*n(idx_Cj)*n(idx_CH2CN) &
        -k(516)*n(idx_Hj)*n(idx_CH2CN) &
        -k(787)*n(idx_HEj)*n(idx_CH2CN) &
        -k(1800)*n(idx_H3j)*n(idx_CH2CN) &
        +k(2756)*n(idx_CH3CNj)*n(idx_CO) &
        -k(3288)*n(idx_C)*n(idx_CH2CN) &
        +k(3406)*n(idx_N)*n(idx_C2H3) &
        +k(3933)*n(idx_CH3CNj)*n(idx_E) &
        +k(4015)*n(idx_C2H4Nj)*n(idx_E) &
        -k(4472)*n(idx_CH2CN) &
        +k(4518)*n(idx_C_DUSTH_DUSTH_DUSTC_DUSTN_DUST)

    !C2H2O
    !C2H2O
    dn(idx_C2H2O) = &
        -k(127)*n(idx_C2H2O) &
        -k(128)*n(idx_C2H2O) &
        +k(191)*n(idx_C2H6CO) &
        -k(303)*n(idx_Cj)*n(idx_C2H2O) &
        -k(517)*n(idx_Hj)*n(idx_C2H2O) &
        -k(788)*n(idx_HEj)*n(idx_C2H2O) &
        -k(789)*n(idx_HEj)*n(idx_C2H2O) &
        -k(1801)*n(idx_H3j)*n(idx_C2H2O) &
        -k(1970)*n(idx_HCOj)*n(idx_C2H2O) &
        -k(2468)*n(idx_H3Oj)*n(idx_C2H2O) &
        +k(3483)*n(idx_O)*n(idx_C2H3) &
        +k(3935)*n(idx_C2H3Oj)*n(idx_E) &
        +k(4018)*n(idx_C2H4Oj)*n(idx_E) &
        +k(4019)*n(idx_C2H4Oj)*n(idx_E) &
        +k(4068)*n(idx_C2H5Oj)*n(idx_E) &
        +k(4098)*n(idx_C2H5OHj)*n(idx_E) &
        -k(4330)*n(idx_C2H2O) &
        -k(4331)*n(idx_C2H2O)

    !C2H3
    !C2H3
    dn(idx_C2H3) = &
        -k(129)*n(idx_C2H3) &
        +k(168)*n(idx_C3H3N) &
        -k(304)*n(idx_Cj)*n(idx_C2H3) &
        -k(305)*n(idx_Cj)*n(idx_C2H3) &
        -k(306)*n(idx_Cj)*n(idx_C2H3) &
        -k(307)*n(idx_Cj)*n(idx_C2H3) &
        +k(400)*n(idx_Cj)*n(idx_C2H5OH) &
        -k(518)*n(idx_Hj)*n(idx_C2H3) &
        -k(519)*n(idx_Hj)*n(idx_C2H3) &
        -k(790)*n(idx_HEj)*n(idx_C2H3) &
        -k(791)*n(idx_HEj)*n(idx_C2H3) &
        -k(1085)*n(idx_Sj)*n(idx_C2H3) &
        -k(1113)*n(idx_SIj)*n(idx_C2H3) &
        -k(1802)*n(idx_H3j)*n(idx_C2H3) &
        -k(1971)*n(idx_HCOj)*n(idx_C2H3) &
        -k(2231)*n(idx_C2H2j)*n(idx_C2H3) &
        -k(2232)*n(idx_C2H2j)*n(idx_C2H3) &
        -k(2233)*n(idx_C2H2j)*n(idx_C2H3) &
        -k(2234)*n(idx_C2H2j)*n(idx_C2H3) &
        -k(2355)*n(idx_CH3j)*n(idx_C2H3) &
        -k(2356)*n(idx_CH3j)*n(idx_C2H3) &
        -k(2357)*n(idx_CH3j)*n(idx_C2H3) &
        -k(2358)*n(idx_CH3j)*n(idx_C2H3) &
        -k(2469)*n(idx_H3Oj)*n(idx_C2H3) &
        -k(2568)*n(idx_C2H3j)*n(idx_C2H3) &
        -k(2569)*n(idx_C2H3j)*n(idx_C2H3) &
        -k(2570)*n(idx_C2H3j)*n(idx_C2H3) &
        -k(2632)*n(idx_C3H2j)*n(idx_C2H3) &
        -k(2633)*n(idx_H2C3j)*n(idx_C2H3) &
        -k(2634)*n(idx_C3H2j)*n(idx_C2H3) &
        -k(2635)*n(idx_H2C3j)*n(idx_C2H3) &
        +k(2662)*n(idx_C3H2j)*n(idx_C3H4) &
        +k(2663)*n(idx_H2C3j)*n(idx_C3H4) &
        -k(2697)*n(idx_C4Hj)*n(idx_C2H3) &
        +k(2780)*n(idx_C2H4j)*n(idx_NH3) &
        -k(2781)*n(idx_C2H4j)*n(idx_C2H3) &
        -k(2782)*n(idx_C2H4j)*n(idx_C2H3) &
        -k(2783)*n(idx_C2H4j)*n(idx_C2H3) &
        +k(2790)*n(idx_C2H4j)*n(idx_HC3N) &
        -k(2834)*n(idx_C3H3j)*n(idx_C2H3) &
        -k(2835)*n(idx_H3C3j)*n(idx_C2H3) &
        -k(2884)*n(idx_C4H2j)*n(idx_C2H3) &
        -k(2885)*n(idx_C4H2j)*n(idx_C2H3) &
        +k(2962)*n(idx_C3H4j)*n(idx_O) &
        -k(2974)*n(idx_C4H3j)*n(idx_C2H3) &
        -k(2975)*n(idx_C4H3j)*n(idx_C2H3) &
        -k(2997)*n(idx_C5H2j)*n(idx_C2H3) &
        -k(2998)*n(idx_C5H2j)*n(idx_C2H3) &
        -k(3040)*n(idx_C6H2j)*n(idx_C2H3) &
        -k(3041)*n(idx_C6H2j)*n(idx_C2H3) &
        -k(3072)*n(idx_C7H2j)*n(idx_C2H3) &
        -k(3073)*n(idx_C7H2j)*n(idx_C2H3) &
        -k(3289)*n(idx_C)*n(idx_C2H3) &
        -k(3290)*n(idx_C)*n(idx_C2H3) &
        -k(3333)*n(idx_H)*n(idx_C2H3) &
        -k(3406)*n(idx_N)*n(idx_C2H3) &
        -k(3407)*n(idx_N)*n(idx_C2H3) &
        -k(3483)*n(idx_O)*n(idx_C2H3) &
        -k(3608)*n(idx_OH)*n(idx_C2H3) &
        +k(3938)*n(idx_C2H4j)*n(idx_E) &
        +k(4022)*n(idx_C2H5j)*n(idx_E) &
        +k(4029)*n(idx_C3H4j)*n(idx_E) &
        +k(4107)*n(idx_C4H5j)*n(idx_E) &
        +k(4158)*n(idx_C4H7j)*n(idx_E) &
        -k(4332)*n(idx_C2H3) &
        -k(4333)*n(idx_C2H3) &
        -k(4470)*n(idx_C2H3) &
        +k(4516)*n(idx_C_DUSTC_DUSTH_DUSTH_DUSTH_DUST)

    !C3H2
    !C3H2
    dn(idx_C3H2) = &
        -k(130)*n(idx_C3H2) &
        +k(152)*n(idx_C3H3) &
        -k(308)*n(idx_Cj)*n(idx_C3H2) &
        -k(310)*n(idx_Cj)*n(idx_C3H2) &
        -k(520)*n(idx_Hj)*n(idx_C3H2) &
        -k(522)*n(idx_Hj)*n(idx_C3H2) &
        -k(792)*n(idx_HEj)*n(idx_C3H2) &
        -k(794)*n(idx_HEj)*n(idx_C3H2) &
        -k(1086)*n(idx_Sj)*n(idx_C3H2) &
        -k(1114)*n(idx_SIj)*n(idx_C3H2) &
        -k(1803)*n(idx_H3j)*n(idx_C3H2) &
        -k(1972)*n(idx_HCOj)*n(idx_C3H2) &
        -k(2235)*n(idx_C2H2j)*n(idx_C3H2) &
        -k(2237)*n(idx_C2H2j)*n(idx_C3H2) &
        -k(2359)*n(idx_CH3j)*n(idx_C3H2) &
        -k(2470)*n(idx_H3Oj)*n(idx_C3H2) &
        -k(2571)*n(idx_C2H3j)*n(idx_C3H2) &
        -k(2573)*n(idx_C2H3j)*n(idx_C3H2) &
        -k(2575)*n(idx_C2H3j)*n(idx_C3H2) &
        -k(2636)*n(idx_C3H2j)*n(idx_C3H2) &
        -k(2638)*n(idx_C3H2j)*n(idx_C3H2) &
        -k(2698)*n(idx_C4Hj)*n(idx_C3H2) &
        -k(2784)*n(idx_C2H4j)*n(idx_C3H2) &
        -k(2786)*n(idx_C2H4j)*n(idx_C3H2) &
        -k(2836)*n(idx_C3H3j)*n(idx_C3H2) &
        -k(2838)*n(idx_C3H3j)*n(idx_C3H2) &
        -k(2886)*n(idx_C4H2j)*n(idx_C3H2) &
        +k(2968)*n(idx_C4H3j)*n(idx_O) &
        -k(2976)*n(idx_C4H3j)*n(idx_C3H2) &
        -k(2999)*n(idx_C5H2j)*n(idx_C3H2) &
        -k(3001)*n(idx_C5H2j)*n(idx_C3H2) &
        -k(3042)*n(idx_C6H2j)*n(idx_C3H2) &
        -k(3044)*n(idx_C6H2j)*n(idx_C3H2) &
        +k(3289)*n(idx_C)*n(idx_C2H3) &
        -k(3293)*n(idx_C)*n(idx_C3H2) &
        -k(3408)*n(idx_N)*n(idx_C3H2) &
        +k(3548)*n(idx_CH)*n(idx_C2H2) &
        -k(3616)*n(idx_C2H)*n(idx_C3H2) &
        +k(3952)*n(idx_C3H3j)*n(idx_E) &
        +k(4026)*n(idx_C3H4j)*n(idx_E) &
        +k(4032)*n(idx_C3H4j)*n(idx_E) &
        -k(4334)*n(idx_C3H2) &
        -k(4336)*n(idx_C3H2) &
        +k(4356)*n(idx_C3H3) &
        +k(4371)*n(idx_C3H4)

    !H2C3
    !H2C3
    dn(idx_H2C3) = &
        -k(131)*n(idx_H2C3) &
        +k(153)*n(idx_C3H3) &
        -k(309)*n(idx_Cj)*n(idx_H2C3) &
        -k(311)*n(idx_Cj)*n(idx_H2C3) &
        -k(521)*n(idx_Hj)*n(idx_H2C3) &
        -k(523)*n(idx_Hj)*n(idx_H2C3) &
        -k(793)*n(idx_HEj)*n(idx_H2C3) &
        -k(795)*n(idx_HEj)*n(idx_H2C3) &
        -k(1087)*n(idx_Sj)*n(idx_H2C3) &
        -k(1115)*n(idx_SIj)*n(idx_H2C3) &
        -k(1804)*n(idx_H3j)*n(idx_H2C3) &
        -k(1973)*n(idx_HCOj)*n(idx_H2C3) &
        -k(2236)*n(idx_C2H2j)*n(idx_H2C3) &
        -k(2238)*n(idx_C2H2j)*n(idx_H2C3) &
        -k(2360)*n(idx_CH3j)*n(idx_H2C3) &
        -k(2471)*n(idx_H3Oj)*n(idx_H2C3) &
        -k(2572)*n(idx_C2H3j)*n(idx_H2C3) &
        -k(2574)*n(idx_C2H3j)*n(idx_H2C3) &
        -k(2576)*n(idx_C2H3j)*n(idx_H2C3) &
        -k(2637)*n(idx_H2C3j)*n(idx_H2C3) &
        -k(2639)*n(idx_H2C3j)*n(idx_H2C3) &
        -k(2699)*n(idx_C4Hj)*n(idx_H2C3) &
        -k(2785)*n(idx_C2H4j)*n(idx_H2C3) &
        -k(2787)*n(idx_C2H4j)*n(idx_H2C3) &
        -k(2837)*n(idx_H3C3j)*n(idx_H2C3) &
        -k(2839)*n(idx_H3C3j)*n(idx_H2C3) &
        -k(2887)*n(idx_C4H2j)*n(idx_H2C3) &
        +k(2969)*n(idx_C4H3j)*n(idx_O) &
        -k(2977)*n(idx_C4H3j)*n(idx_H2C3) &
        -k(3000)*n(idx_C5H2j)*n(idx_H2C3) &
        -k(3002)*n(idx_C5H2j)*n(idx_H2C3) &
        -k(3043)*n(idx_C6H2j)*n(idx_H2C3) &
        -k(3045)*n(idx_C6H2j)*n(idx_H2C3) &
        +k(3290)*n(idx_C)*n(idx_C2H3) &
        -k(3294)*n(idx_C)*n(idx_H2C3) &
        -k(3409)*n(idx_N)*n(idx_H2C3) &
        -k(3497)*n(idx_O)*n(idx_H2C3) &
        -k(3617)*n(idx_C2H)*n(idx_H2C3) &
        +k(3953)*n(idx_H3C3j)*n(idx_E) &
        +k(4027)*n(idx_C3H4j)*n(idx_E) &
        +k(4033)*n(idx_C3H4j)*n(idx_E) &
        -k(4335)*n(idx_H2C3) &
        -k(4337)*n(idx_H2C3) &
        +k(4357)*n(idx_C3H3) &
        +k(4372)*n(idx_C3H4)

    !C4H
    !C4H
    dn(idx_C4H) = &
        -k(132)*n(idx_C4H) &
        +k(155)*n(idx_C4H2) &
        +k(176)*n(idx_HC5N) &
        +k(187)*n(idx_CH3C4H) &
        -k(312)*n(idx_Cj)*n(idx_C4H) &
        -k(524)*n(idx_Hj)*n(idx_C4H) &
        -k(525)*n(idx_Hj)*n(idx_C4H) &
        -k(796)*n(idx_HEj)*n(idx_C4H) &
        -k(797)*n(idx_HEj)*n(idx_C4H) &
        +k(905)*n(idx_HEj)*n(idx_HC5N) &
        -k(1088)*n(idx_Sj)*n(idx_C4H) &
        -k(1116)*n(idx_SIj)*n(idx_C4H) &
        -k(1805)*n(idx_H3j)*n(idx_C4H) &
        -k(1974)*n(idx_HCOj)*n(idx_C4H) &
        -k(2239)*n(idx_C2H2j)*n(idx_C4H) &
        -k(2240)*n(idx_C2H2j)*n(idx_C4H) &
        -k(2361)*n(idx_CH3j)*n(idx_C4H) &
        -k(2472)*n(idx_H3Oj)*n(idx_C4H) &
        -k(2577)*n(idx_C2H3j)*n(idx_C4H) &
        -k(2578)*n(idx_C2H3j)*n(idx_C4H) &
        -k(2579)*n(idx_C2H3j)*n(idx_C4H) &
        -k(2640)*n(idx_C3H2j)*n(idx_C4H) &
        -k(2641)*n(idx_H2C3j)*n(idx_C4H) &
        -k(2642)*n(idx_C3H2j)*n(idx_C4H) &
        -k(2643)*n(idx_H2C3j)*n(idx_C4H) &
        +k(2685)*n(idx_C4Hj)*n(idx_FE) &
        +k(2686)*n(idx_C4Hj)*n(idx_MG) &
        +k(2687)*n(idx_C4Hj)*n(idx_NA) &
        -k(2700)*n(idx_C4Hj)*n(idx_C4H) &
        -k(2701)*n(idx_C4Hj)*n(idx_C4H) &
        -k(2788)*n(idx_C2H4j)*n(idx_C4H) &
        -k(2789)*n(idx_C2H4j)*n(idx_C4H) &
        -k(2840)*n(idx_C3H3j)*n(idx_C4H) &
        -k(2841)*n(idx_H3C3j)*n(idx_C4H) &
        -k(2842)*n(idx_C3H3j)*n(idx_C4H) &
        -k(2843)*n(idx_H3C3j)*n(idx_C4H) &
        -k(2888)*n(idx_C4H2j)*n(idx_C4H) &
        -k(2978)*n(idx_C4H3j)*n(idx_C4H) &
        +k(2991)*n(idx_C5H2j)*n(idx_O) &
        -k(3003)*n(idx_C5H2j)*n(idx_C4H) &
        +k(3293)*n(idx_C)*n(idx_C3H2) &
        +k(3294)*n(idx_C)*n(idx_H2C3) &
        -k(3300)*n(idx_C)*n(idx_C4H) &
        -k(3413)*n(idx_N)*n(idx_C4H) &
        -k(3499)*n(idx_O)*n(idx_C4H) &
        -k(3500)*n(idx_O)*n(idx_C4H) &
        +k(3505)*n(idx_O)*n(idx_C5H) &
        +k(3567)*n(idx_C2)*n(idx_C2H2) &
        +k(3955)*n(idx_C4H2j)*n(idx_E) &
        +k(3956)*n(idx_C5Hj)*n(idx_E) &
        +k(4034)*n(idx_C4H3j)*n(idx_E) &
        +k(4038)*n(idx_C5HNj)*n(idx_E) &
        +k(4078)*n(idx_C4H4j)*n(idx_E) &
        +k(4104)*n(idx_C4H5j)*n(idx_E) &
        +k(4156)*n(idx_C4H7j)*n(idx_E) &
        -k(4338)*n(idx_C4H) &
        -k(4339)*n(idx_C4H) &
        +k(4359)*n(idx_C4H2) &
        +k(4389)*n(idx_HC5N) &
        +k(4405)*n(idx_SIC4H) &
        +k(4410)*n(idx_CH3C4H)

    !C4N
    !C4N
    dn(idx_C4N) = &
        -k(133)*n(idx_C4N) &
        +k(3413)*n(idx_N)*n(idx_C4H) &
        -k(3414)*n(idx_N)*n(idx_C4N) &
        +k(3416)*n(idx_N)*n(idx_C5N) &
        -k(3501)*n(idx_O)*n(idx_C4N) &
        +k(3506)*n(idx_O)*n(idx_C5N) &
        -k(4340)*n(idx_C4N)

    !C4P
    !C4P
    dn(idx_C4P) = &
        -k(134)*n(idx_C4P) &
        -k(313)*n(idx_Cj)*n(idx_C4P) &
        -k(526)*n(idx_Hj)*n(idx_C4P) &
        -k(798)*n(idx_HEj)*n(idx_C4P) &
        -k(799)*n(idx_HEj)*n(idx_C4P) &
        -k(1806)*n(idx_H3j)*n(idx_C4P) &
        -k(1975)*n(idx_HCOj)*n(idx_C4P) &
        -k(2473)*n(idx_H3Oj)*n(idx_C4P) &
        -k(3502)*n(idx_O)*n(idx_C4P) &
        +k(4001)*n(idx_PC4Hj)*n(idx_E) &
        +k(4066)*n(idx_PC4H2j)*n(idx_E)

    !C4S
    !C4S
    dn(idx_C4S) = &
        -k(135)*n(idx_C4S) &
        -k(314)*n(idx_Cj)*n(idx_C4S) &
        -k(315)*n(idx_Cj)*n(idx_C4S) &
        -k(527)*n(idx_Hj)*n(idx_C4S) &
        -k(800)*n(idx_HEj)*n(idx_C4S) &
        -k(801)*n(idx_HEj)*n(idx_C4S) &
        -k(1807)*n(idx_H3j)*n(idx_C4S) &
        -k(1976)*n(idx_HCOj)*n(idx_C4S) &
        -k(2474)*n(idx_H3Oj)*n(idx_C4S) &
        +k(3991)*n(idx_HC4Sj)*n(idx_E) &
        -k(4341)*n(idx_C4S)

    !C5
    !C5
    dn(idx_C5) = &
        -k(136)*n(idx_C5) &
        +k(157)*n(idx_C5H) &
        +k(159)*n(idx_C6) &
        -k(528)*n(idx_Hj)*n(idx_C5) &
        -k(802)*n(idx_HEj)*n(idx_C5) &
        -k(803)*n(idx_HEj)*n(idx_C5) &
        -k(1808)*n(idx_H3j)*n(idx_C5) &
        -k(1977)*n(idx_HCOj)*n(idx_C5) &
        +k(3015)*n(idx_C6Hj)*n(idx_O) &
        -k(3132)*n(idx_Cj)*n(idx_C5) &
        +k(3300)*n(idx_C)*n(idx_C4H) &
        +k(3304)*n(idx_C)*n(idx_C5N) &
        -k(3318)*n(idx_C)*n(idx_C5) &
        +k(3319)*n(idx_C)*n(idx_C6) &
        +k(3321)*n(idx_C)*n(idx_C7) &
        +k(3322)*n(idx_C)*n(idx_C8) &
        -k(3412)*n(idx_N)*n(idx_C5) &
        +k(3420)*n(idx_N)*n(idx_C6) &
        -k(3498)*n(idx_O)*n(idx_C5) &
        +k(3507)*n(idx_O)*n(idx_C6) &
        -k(3555)*n(idx_CH)*n(idx_C5) &
        +k(3559)*n(idx_CH)*n(idx_C4) &
        +k(3622)*n(idx_C2H)*n(idx_C3) &
        -k(3623)*n(idx_C2H)*n(idx_C5) &
        +k(3957)*n(idx_C5Hj)*n(idx_E) &
        +k(3960)*n(idx_C6j)*n(idx_E) &
        +k(4036)*n(idx_C5H2j)*n(idx_E) &
        +k(4044)*n(idx_C7j)*n(idx_E) &
        -k(4342)*n(idx_C5) &
        +k(4364)*n(idx_C5H)

    !CH2O2
    !CH2O2
    dn(idx_CH2O2) = &
        -k(137)*n(idx_CH2O2) &
        -k(138)*n(idx_CH2O2) &
        -k(529)*n(idx_Hj)*n(idx_CH2O2) &
        -k(530)*n(idx_Hj)*n(idx_CH2O2) &
        -k(804)*n(idx_HEj)*n(idx_CH2O2) &
        -k(805)*n(idx_HEj)*n(idx_CH2O2) &
        -k(1809)*n(idx_H3j)*n(idx_CH2O2) &
        -k(1810)*n(idx_H3j)*n(idx_CH2O2) &
        -k(1978)*n(idx_HCOj)*n(idx_CH2O2) &
        +k(3606)*n(idx_OH)*n(idx_H2CO) &
        +k(3962)*n(idx_CH3O2j)*n(idx_E) &
        -k(4343)*n(idx_CH2O2) &
        -k(4344)*n(idx_CH2O2)

    !CH2PH
    !CH2PH
    dn(idx_CH2PH) = &
        -k(139)*n(idx_CH2PH) &
        -k(316)*n(idx_Cj)*n(idx_CH2PH) &
        -k(531)*n(idx_Hj)*n(idx_CH2PH) &
        -k(806)*n(idx_HEj)*n(idx_CH2PH) &
        -k(807)*n(idx_HEj)*n(idx_CH2PH) &
        -k(1811)*n(idx_H3j)*n(idx_CH2PH) &
        -k(1979)*n(idx_HCOj)*n(idx_CH2PH) &
        -k(2475)*n(idx_H3Oj)*n(idx_CH2PH) &
        -k(3503)*n(idx_O)*n(idx_CH2PH) &
        +k(4003)*n(idx_PCH4j)*n(idx_E)

    !CH3N
    !CH3N
    dn(idx_CH3N) = &
        -k(140)*n(idx_CH3N) &
        -k(317)*n(idx_Cj)*n(idx_CH3N) &
        -k(532)*n(idx_Hj)*n(idx_CH3N) &
        -k(808)*n(idx_HEj)*n(idx_CH3N) &
        -k(809)*n(idx_HEj)*n(idx_CH3N) &
        -k(810)*n(idx_HEj)*n(idx_CH3N) &
        -k(811)*n(idx_HEj)*n(idx_CH3N) &
        -k(1812)*n(idx_H3j)*n(idx_CH3N) &
        -k(1980)*n(idx_HCOj)*n(idx_CH3N) &
        +k(3966)*n(idx_CH4Nj)*n(idx_E) &
        +k(4047)*n(idx_CH5Nj)*n(idx_E) &
        +k(4093)*n(idx_CH6Nj)*n(idx_E) &
        -k(4345)*n(idx_CH3N) &
        +k(4386)*n(idx_CH5N)

    !CH4
    !CH4
    dn(idx_CH4) = &
        -k(141)*n(idx_CH4) &
        +k(165)*n(idx_C2H4O) &
        +k(188)*n(idx_CH3OCH3) &
        +k(191)*n(idx_C2H6CO) &
        -k(318)*n(idx_Cj)*n(idx_CH4) &
        -k(319)*n(idx_Cj)*n(idx_CH4) &
        -k(533)*n(idx_Hj)*n(idx_CH4) &
        -k(534)*n(idx_Hj)*n(idx_CH4) &
        -k(812)*n(idx_HEj)*n(idx_CH4) &
        -k(813)*n(idx_HEj)*n(idx_CH4) &
        -k(814)*n(idx_HEj)*n(idx_CH4) &
        -k(815)*n(idx_HEj)*n(idx_CH4) &
        -k(816)*n(idx_HEj)*n(idx_CH4) &
        -k(992)*n(idx_Nj)*n(idx_CH4) &
        -k(993)*n(idx_Nj)*n(idx_CH4) &
        -k(994)*n(idx_Nj)*n(idx_CH4) &
        -k(995)*n(idx_Nj)*n(idx_CH4) &
        -k(996)*n(idx_Nj)*n(idx_CH4) &
        -k(997)*n(idx_Nj)*n(idx_CH4) &
        -k(1040)*n(idx_Oj)*n(idx_CH4) &
        -k(1041)*n(idx_Oj)*n(idx_CH4) &
        -k(1054)*n(idx_Pj)*n(idx_CH4) &
        -k(1089)*n(idx_Sj)*n(idx_CH4) &
        -k(1145)*n(idx_C2j)*n(idx_CH4) &
        -k(1146)*n(idx_C2j)*n(idx_CH4) &
        -k(1147)*n(idx_C2j)*n(idx_CH4) &
        -k(1148)*n(idx_C2j)*n(idx_CH4) &
        -k(1149)*n(idx_C2j)*n(idx_CH4) &
        -k(1150)*n(idx_C2j)*n(idx_CH4) &
        -k(1151)*n(idx_C2j)*n(idx_CH4) &
        -k(1199)*n(idx_CHj)*n(idx_CH4) &
        -k(1200)*n(idx_CHj)*n(idx_CH4) &
        -k(1201)*n(idx_CHj)*n(idx_CH4) &
        -k(1269)*n(idx_COj)*n(idx_CH4) &
        -k(1270)*n(idx_COj)*n(idx_CH4) &
        -k(1271)*n(idx_COj)*n(idx_CH4) &
        -k(1282)*n(idx_CSj)*n(idx_CH4) &
        -k(1326)*n(idx_H2j)*n(idx_CH4) &
        -k(1327)*n(idx_H2j)*n(idx_CH4) &
        -k(1328)*n(idx_H2j)*n(idx_CH4) &
        -k(1355)*n(idx_HSj)*n(idx_CH4) &
        -k(1391)*n(idx_N2j)*n(idx_CH4) &
        -k(1392)*n(idx_N2j)*n(idx_CH4) &
        -k(1465)*n(idx_O2j)*n(idx_CH4) &
        -k(1511)*n(idx_OHj)*n(idx_CH4) &
        -k(1512)*n(idx_OHj)*n(idx_CH4) &
        -k(1523)*n(idx_PHj)*n(idx_CH4) &
        -k(1524)*n(idx_PHj)*n(idx_CH4) &
        -k(1588)*n(idx_C2Hj)*n(idx_CH4) &
        -k(1589)*n(idx_C2Hj)*n(idx_CH4) &
        -k(1590)*n(idx_C2Hj)*n(idx_CH4) &
        -k(1591)*n(idx_C2Hj)*n(idx_CH4) &
        -k(1593)*n(idx_C2Nj)*n(idx_CH4) &
        -k(1594)*n(idx_C2Nj)*n(idx_CH4) &
        -k(1595)*n(idx_C2Nj)*n(idx_CH4) &
        -k(1634)*n(idx_CH2j)*n(idx_CH4) &
        -k(1635)*n(idx_CH2j)*n(idx_CH4) &
        -k(1652)*n(idx_CO2j)*n(idx_CH4) &
        -k(1653)*n(idx_CO2j)*n(idx_CH4) &
        -k(1695)*n(idx_H2Oj)*n(idx_CH4) &
        -k(1813)*n(idx_H3j)*n(idx_CH4) &
        -k(1899)*n(idx_HCNj)*n(idx_CH4) &
        -k(1900)*n(idx_HCNj)*n(idx_CH4) &
        -k(2078)*n(idx_HNOj)*n(idx_CH4) &
        -k(2104)*n(idx_N2Hj)*n(idx_CH4) &
        +k(2173)*n(idx_PH2j)*n(idx_C2H4) &
        -k(2241)*n(idx_C2H2j)*n(idx_CH4) &
        -k(2242)*n(idx_C2H2j)*n(idx_CH4) &
        -k(2295)*n(idx_C3Hj)*n(idx_CH4) &
        -k(2296)*n(idx_C3Hj)*n(idx_CH4) &
        +k(2352)*n(idx_CH3j)*n(idx_H2CO) &
        -k(2362)*n(idx_CH3j)*n(idx_CH4) &
        +k(2371)*n(idx_CH3j)*n(idx_C2H4) &
        +k(2380)*n(idx_CH3j)*n(idx_CH3OH) &
        -k(2424)*n(idx_H2COj)*n(idx_CH4) &
        -k(2425)*n(idx_H2COj)*n(idx_CH4) &
        -k(2505)*n(idx_HCO2j)*n(idx_CH4) &
        -k(2529)*n(idx_NH3j)*n(idx_CH4) &
        -k(2580)*n(idx_C2H3j)*n(idx_CH4) &
        -k(2644)*n(idx_C3H2j)*n(idx_CH4) &
        -k(2645)*n(idx_H2C3j)*n(idx_CH4) &
        -k(2702)*n(idx_C4Hj)*n(idx_CH4) &
        -k(2714)*n(idx_C4Nj)*n(idx_CH4) &
        +k(2720)*n(idx_CH4j)*n(idx_O2) &
        +k(2723)*n(idx_CH4j)*n(idx_H2S) &
        +k(2725)*n(idx_CH4j)*n(idx_OCS) &
        +k(2727)*n(idx_CH4j)*n(idx_C2H2) &
        +k(2731)*n(idx_CH4j)*n(idx_H2CO) &
        +k(2733)*n(idx_CH4j)*n(idx_NH3) &
        -k(2736)*n(idx_CH4j)*n(idx_CH4) &
        +k(2737)*n(idx_CH4j)*n(idx_C2H4) &
        +k(2739)*n(idx_CH4j)*n(idx_CH3OH) &
        +k(2795)*n(idx_C2H4j)*n(idx_C3H3) &
        -k(2844)*n(idx_C3H3j)*n(idx_CH4) &
        -k(2845)*n(idx_H3C3j)*n(idx_CH4) &
        -k(2889)*n(idx_C4H2j)*n(idx_CH4) &
        -k(2890)*n(idx_C4H2j)*n(idx_CH4) &
        +k(2906)*n(idx_CH5j)*n(idx_C) &
        +k(2910)*n(idx_CH5j)*n(idx_MG) &
        +k(2913)*n(idx_CH5j)*n(idx_S) &
        +k(2916)*n(idx_CH5j)*n(idx_C2) &
        +k(2917)*n(idx_CH5j)*n(idx_CH) &
        +k(2918)*n(idx_CH5j)*n(idx_CO) &
        +k(2919)*n(idx_CH5j)*n(idx_NH) &
        +k(2920)*n(idx_CH5j)*n(idx_OH) &
        +k(2921)*n(idx_CH5j)*n(idx_C2H) &
        +k(2922)*n(idx_CH5j)*n(idx_CH2) &
        +k(2923)*n(idx_CH5j)*n(idx_H2O) &
        +k(2924)*n(idx_CH5j)*n(idx_HCN) &
        +k(2925)*n(idx_CH5j)*n(idx_HCO) &
        +k(2926)*n(idx_CH5j)*n(idx_HNC) &
        +k(2927)*n(idx_CH5j)*n(idx_NH2) &
        +k(2928)*n(idx_CH5j)*n(idx_C2H2) &
        +k(2929)*n(idx_CH5j)*n(idx_H2CO) &
        +k(2930)*n(idx_CH5j)*n(idx_NH3) &
        +k(2931)*n(idx_CH5j)*n(idx_HC3N) &
        +k(2932)*n(idx_CH5j)*n(idx_C6H6) &
        +k(2944)*n(idx_C2H5j)*n(idx_O) &
        +k(2950)*n(idx_C2H5j)*n(idx_C2H2) &
        +k(2951)*n(idx_C2H5j)*n(idx_C2H2) &
        +k(2955)*n(idx_C2H5j)*n(idx_C2H4) &
        -k(2979)*n(idx_C4H3j)*n(idx_CH4) &
        -k(3004)*n(idx_C5H2j)*n(idx_CH4) &
        -k(3005)*n(idx_C5H2j)*n(idx_CH4) &
        -k(3046)*n(idx_C6H2j)*n(idx_CH4) &
        -k(3047)*n(idx_C6H2j)*n(idx_CH4) &
        -k(3074)*n(idx_C7H2j)*n(idx_CH4) &
        -k(3087)*n(idx_C8H2j)*n(idx_CH4) &
        -k(3124)*n(idx_Ok)*n(idx_CH4) &
        -k(3147)*n(idx_SIj)*n(idx_CH4) &
        -k(3154)*n(idx_HCOj)*n(idx_CH4) &
        -k(3187)*n(idx_H3COj)*n(idx_CH4) &
        +k(3233)*n(idx_Hk)*n(idx_CH3) &
        -k(3340)*n(idx_H)*n(idx_CH4) &
        +k(3364)*n(idx_H2)*n(idx_CH3) &
        -k(3547)*n(idx_CH)*n(idx_CH4) &
        +k(3638)*n(idx_HCO)*n(idx_CH3) &
        +k(3639)*n(idx_HNO)*n(idx_CH3) &
        +k(3940)*n(idx_C2H4j)*n(idx_E) &
        +k(3970)*n(idx_CH5j)*n(idx_E) &
        +k(4004)*n(idx_PCH4j)*n(idx_E) &
        +k(4069)*n(idx_C2H5Oj)*n(idx_E) &
        +k(4099)*n(idx_C2H5OHj)*n(idx_E) &
        +k(4125)*n(idx_CH3OCH3j)*n(idx_E) &
        +k(4151)*n(idx_CH3OCH4j)*n(idx_E) &
        +k(4157)*n(idx_C4H7j)*n(idx_E) &
        -k(4346)*n(idx_CH4) &
        -k(4347)*n(idx_CH4) &
        -k(4348)*n(idx_CH4) &
        +k(4369)*n(idx_C2H4O) &
        +k(4411)*n(idx_CH3OCH3) &
        -k(4469)*n(idx_CH4) &
        +k(4515)*n(idx_C_DUSTH_DUSTH_DUSTH_DUSTH_DUST)

    !HC3N
    !HC3N
    dn(idx_HC3N) = &
        -k(142)*n(idx_HC3N) &
        -k(330)*n(idx_Cj)*n(idx_HC3N) &
        -k(331)*n(idx_Cj)*n(idx_HC3N) &
        -k(332)*n(idx_Cj)*n(idx_HC3N) &
        -k(542)*n(idx_Hj)*n(idx_HC3N) &
        +k(543)*n(idx_Hj)*n(idx_HNC3) &
        +k(603)*n(idx_Hj)*n(idx_CH3C3N) &
        -k(825)*n(idx_HEj)*n(idx_HC3N) &
        -k(826)*n(idx_HEj)*n(idx_HC3N) &
        -k(827)*n(idx_HEj)*n(idx_HC3N) &
        -k(828)*n(idx_HEj)*n(idx_HC3N) &
        -k(829)*n(idx_HEj)*n(idx_HC3N) &
        -k(830)*n(idx_HEj)*n(idx_HC3N) &
        -k(831)*n(idx_HEj)*n(idx_HC3N) &
        -k(1816)*n(idx_H3j)*n(idx_HC3N) &
        -k(1983)*n(idx_HCOj)*n(idx_HC3N) &
        -k(2107)*n(idx_N2Hj)*n(idx_HC3N) &
        -k(2367)*n(idx_CH3j)*n(idx_HC3N) &
        -k(2368)*n(idx_CH3j)*n(idx_HC3N) &
        -k(2478)*n(idx_H3Oj)*n(idx_HC3N) &
        -k(2581)*n(idx_C2H3j)*n(idx_HC3N) &
        +k(2711)*n(idx_C4Nj)*n(idx_H2O) &
        -k(2790)*n(idx_C2H4j)*n(idx_HC3N) &
        -k(2931)*n(idx_CH5j)*n(idx_HC3N) &
        -k(3159)*n(idx_C2H2j)*n(idx_HC3N) &
        -k(3173)*n(idx_CH3j)*n(idx_HC3N) &
        -k(3193)*n(idx_C4H2j)*n(idx_HC3N) &
        +k(3288)*n(idx_C)*n(idx_CH2CN) &
        +k(3336)*n(idx_H)*n(idx_HNC3) &
        +k(3408)*n(idx_N)*n(idx_C3H2) &
        +k(3409)*n(idx_N)*n(idx_H2C3) &
        +k(3410)*n(idx_N)*n(idx_C3H3) &
        -k(3562)*n(idx_CH)*n(idx_HC3N) &
        +k(3577)*n(idx_CN)*n(idx_C2H2) &
        -k(3584)*n(idx_CN)*n(idx_HC3N) &
        +k(3613)*n(idx_C2H)*n(idx_HCN) &
        +k(3614)*n(idx_C2H)*n(idx_HNC) &
        -k(3630)*n(idx_C2H)*n(idx_HC3N) &
        +k(3651)*n(idx_CN)*n(idx_C2H) &
        +k(3946)*n(idx_C3H2Nj)*n(idx_E) &
        +k(3983)*n(idx_HC2NCHj)*n(idx_E) &
        +k(4025)*n(idx_C3H3Nj)*n(idx_E) &
        +k(4053)*n(idx_H2C4Nj)*n(idx_E) &
        +k(4074)*n(idx_C3H4Nj)*n(idx_E) &
        +k(4097)*n(idx_H3C4Nj)*n(idx_E) &
        +k(4102)*n(idx_C4H4Nj)*n(idx_E) &
        -k(4349)*n(idx_HC3N)

    !SIC2H2
    !SIC2H2
    dn(idx_SIC2H2) = &
        -k(143)*n(idx_SIC2H2) &
        -k(337)*n(idx_Cj)*n(idx_SIC2H2) &
        -k(551)*n(idx_Hj)*n(idx_SIC2H2) &
        -k(552)*n(idx_Hj)*n(idx_SIC2H2) &
        -k(839)*n(idx_HEj)*n(idx_SIC2H2) &
        -k(840)*n(idx_HEj)*n(idx_SIC2H2) &
        -k(1819)*n(idx_H3j)*n(idx_SIC2H2) &
        -k(1986)*n(idx_HCOj)*n(idx_SIC2H2) &
        +k(4006)*n(idx_SIC2H3j)*n(idx_E) &
        +k(4402)*n(idx_SIC2H3)

    !SIC3H
    !SIC3H
    dn(idx_SIC3H) = &
        -k(144)*n(idx_SIC3H) &
        -k(338)*n(idx_Cj)*n(idx_SIC3H) &
        -k(553)*n(idx_Hj)*n(idx_SIC3H) &
        -k(554)*n(idx_Hj)*n(idx_SIC3H) &
        -k(841)*n(idx_HEj)*n(idx_SIC3H) &
        -k(842)*n(idx_HEj)*n(idx_SIC3H) &
        -k(843)*n(idx_HEj)*n(idx_SIC3H) &
        -k(1820)*n(idx_H3j)*n(idx_SIC3H) &
        -k(1987)*n(idx_HCOj)*n(idx_SIC3H) &
        +k(4008)*n(idx_SIC3H2j)*n(idx_E) &
        +k(4403)*n(idx_SIC3H3) &
        +k(4404)*n(idx_SIC3H5)

    !SIC4
    !SIC4
    dn(idx_SIC4) = &
        -k(145)*n(idx_SIC4) &
        -k(555)*n(idx_Hj)*n(idx_SIC4) &
        -k(844)*n(idx_HEj)*n(idx_SIC4) &
        -k(1821)*n(idx_H3j)*n(idx_SIC4) &
        -k(1988)*n(idx_HCOj)*n(idx_SIC4) &
        -k(3504)*n(idx_O)*n(idx_SIC4) &
        +k(4010)*n(idx_SIC4Hj)*n(idx_E)

    !SICH3
    !SICH3
    dn(idx_SICH3) = &
        -k(146)*n(idx_SICH3) &
        -k(339)*n(idx_Cj)*n(idx_SICH3) &
        -k(340)*n(idx_Cj)*n(idx_SICH3) &
        -k(341)*n(idx_Cj)*n(idx_SICH3) &
        -k(556)*n(idx_Hj)*n(idx_SICH3) &
        -k(557)*n(idx_Hj)*n(idx_SICH3) &
        -k(845)*n(idx_HEj)*n(idx_SICH3) &
        -k(846)*n(idx_HEj)*n(idx_SICH3) &
        -k(1822)*n(idx_H3j)*n(idx_SICH3) &
        -k(1989)*n(idx_HCOj)*n(idx_SICH3) &
        -k(2480)*n(idx_H3Oj)*n(idx_SICH3) &
        +k(4012)*n(idx_SICH4j)*n(idx_E)

    !SIH4
    !SIH4
    dn(idx_SIH4) = &
        -k(147)*n(idx_SIH4) &
        -k(342)*n(idx_Cj)*n(idx_SIH4) &
        -k(343)*n(idx_Cj)*n(idx_SIH4) &
        -k(558)*n(idx_Hj)*n(idx_SIH4) &
        -k(559)*n(idx_Hj)*n(idx_SIH4) &
        -k(847)*n(idx_HEj)*n(idx_SIH4) &
        -k(848)*n(idx_HEj)*n(idx_SIH4) &
        -k(1823)*n(idx_H3j)*n(idx_SIH4) &
        -k(1990)*n(idx_HCOj)*n(idx_SIH4) &
        +k(2939)*n(idx_SIH5j)*n(idx_H2O) &
        +k(4014)*n(idx_SIH5j)*n(idx_E)

    !CH3CN
    !CH3CN
    dn(idx_CH3CN) = &
        -k(148)*n(idx_CH3CN) &
        -k(149)*n(idx_CH3CN) &
        -k(344)*n(idx_Cj)*n(idx_CH3CN) &
        -k(345)*n(idx_Cj)*n(idx_CH3CN) &
        -k(560)*n(idx_Hj)*n(idx_CH3CN) &
        -k(561)*n(idx_Hj)*n(idx_CH3CN) &
        -k(849)*n(idx_HEj)*n(idx_CH3CN) &
        -k(850)*n(idx_HEj)*n(idx_CH3CN) &
        -k(1824)*n(idx_H3j)*n(idx_CH3CN) &
        -k(1991)*n(idx_HCOj)*n(idx_CH3CN) &
        -k(2481)*n(idx_H3Oj)*n(idx_CH3CN) &
        -k(2506)*n(idx_HCO2j)*n(idx_CH3CN) &
        +k(3249)*n(idx_CNk)*n(idx_CH3) &
        +k(3652)*n(idx_CN)*n(idx_CH3) &
        +k(4016)*n(idx_C2H4Nj)*n(idx_E) &
        -k(4350)*n(idx_CH3CN) &
        -k(4351)*n(idx_CH3CN) &
        -k(4475)*n(idx_CH3CN) &
        +k(4521)*n(idx_C_DUSTH_DUSTH_DUSTH_DUSTC_DUSTN_DUST)

    !C2H4
    !C2H4
    dn(idx_C2H4) = &
        -k(150)*n(idx_C2H4) &
        -k(151)*n(idx_C2H4) &
        +k(167)*n(idx_C2H5) &
        -k(346)*n(idx_Cj)*n(idx_C2H4) &
        -k(347)*n(idx_Cj)*n(idx_C2H4) &
        -k(348)*n(idx_Cj)*n(idx_C2H4) &
        -k(349)*n(idx_Cj)*n(idx_C2H4) &
        -k(350)*n(idx_Cj)*n(idx_C2H4) &
        -k(351)*n(idx_Cj)*n(idx_C2H4) &
        -k(562)*n(idx_Hj)*n(idx_C2H4) &
        -k(563)*n(idx_Hj)*n(idx_C2H4) &
        -k(851)*n(idx_HEj)*n(idx_C2H4) &
        -k(852)*n(idx_HEj)*n(idx_C2H4) &
        -k(853)*n(idx_HEj)*n(idx_C2H4) &
        -k(854)*n(idx_HEj)*n(idx_C2H4) &
        -k(855)*n(idx_HEj)*n(idx_C2H4) &
        -k(1055)*n(idx_Pj)*n(idx_C2H4) &
        -k(1117)*n(idx_SIj)*n(idx_C2H4) &
        -k(1329)*n(idx_H2j)*n(idx_C2H4) &
        -k(1330)*n(idx_H2j)*n(idx_C2H4) &
        -k(1331)*n(idx_H2j)*n(idx_C2H4) &
        -k(1525)*n(idx_PHj)*n(idx_C2H4) &
        -k(1526)*n(idx_PHj)*n(idx_C2H4) &
        -k(1825)*n(idx_H3j)*n(idx_C2H4) &
        -k(1826)*n(idx_H3j)*n(idx_C2H4) &
        +k(1854)*n(idx_H3j)*n(idx_C2H5OH) &
        -k(1992)*n(idx_HCOj)*n(idx_C2H4) &
        +k(2016)*n(idx_HCOj)*n(idx_C2H5OH) &
        -k(2173)*n(idx_PH2j)*n(idx_C2H4) &
        -k(2174)*n(idx_PH2j)*n(idx_C2H4) &
        -k(2243)*n(idx_C2H2j)*n(idx_C2H4) &
        -k(2244)*n(idx_C2H2j)*n(idx_C2H4) &
        -k(2245)*n(idx_C2H2j)*n(idx_C2H4) &
        -k(2246)*n(idx_C2H2j)*n(idx_C2H4) &
        -k(2297)*n(idx_C3Hj)*n(idx_C2H4) &
        -k(2298)*n(idx_C3Hj)*n(idx_C2H4) &
        -k(2299)*n(idx_C3Hj)*n(idx_C2H4) &
        -k(2371)*n(idx_CH3j)*n(idx_C2H4) &
        -k(2372)*n(idx_CH3j)*n(idx_C2H4) &
        -k(2373)*n(idx_CH3j)*n(idx_C2H4) &
        -k(2374)*n(idx_CH3j)*n(idx_C2H4) &
        -k(2582)*n(idx_C2H3j)*n(idx_C2H4) &
        -k(2646)*n(idx_C3H2j)*n(idx_C2H4) &
        -k(2647)*n(idx_H2C3j)*n(idx_C2H4) &
        -k(2648)*n(idx_C3H2j)*n(idx_C2H4) &
        -k(2649)*n(idx_H2C3j)*n(idx_C2H4) &
        +k(2660)*n(idx_C3H2j)*n(idx_C3H4) &
        +k(2661)*n(idx_H2C3j)*n(idx_C3H4) &
        -k(2703)*n(idx_C4Hj)*n(idx_C2H4) &
        -k(2704)*n(idx_C4Hj)*n(idx_C2H4) &
        -k(2737)*n(idx_CH4j)*n(idx_C2H4) &
        -k(2738)*n(idx_CH4j)*n(idx_C2H4) &
        +k(2779)*n(idx_C2H4j)*n(idx_NH3) &
        +k(2781)*n(idx_C2H4j)*n(idx_C2H3) &
        -k(2791)*n(idx_C2H4j)*n(idx_C2H4) &
        -k(2792)*n(idx_C2H4j)*n(idx_C2H4) &
        +k(2793)*n(idx_C2H4j)*n(idx_C3H3) &
        +k(2794)*n(idx_C2H4j)*n(idx_C3H3) &
        -k(2846)*n(idx_C3H3j)*n(idx_C2H4) &
        -k(2847)*n(idx_H3C3j)*n(idx_C2H4) &
        -k(2891)*n(idx_C4H2j)*n(idx_C2H4) &
        -k(2892)*n(idx_C4H2j)*n(idx_C2H4) &
        +k(2946)*n(idx_C2H5j)*n(idx_H2O) &
        +k(2947)*n(idx_C2H5j)*n(idx_H2S) &
        +k(2948)*n(idx_C2H5j)*n(idx_HCN) &
        +k(2949)*n(idx_C2H5j)*n(idx_HNC) &
        +k(2953)*n(idx_C2H5j)*n(idx_H2CO) &
        +k(2954)*n(idx_C2H5j)*n(idx_NH3) &
        -k(2955)*n(idx_C2H5j)*n(idx_C2H4) &
        -k(3006)*n(idx_C5H2j)*n(idx_C2H4) &
        -k(3007)*n(idx_C5H2j)*n(idx_C2H4) &
        +k(3025)*n(idx_C3H5j)*n(idx_O) &
        -k(3048)*n(idx_C6H2j)*n(idx_C2H4) &
        -k(3075)*n(idx_C7H2j)*n(idx_C2H4) &
        -k(3095)*n(idx_C6H5j)*n(idx_C2H4) &
        -k(3180)*n(idx_H3Oj)*n(idx_C2H4) &
        -k(3285)*n(idx_C)*n(idx_C2H4) &
        +k(3418)*n(idx_N)*n(idx_C2H5) &
        -k(3538)*n(idx_SI)*n(idx_C2H4) &
        +k(3547)*n(idx_CH)*n(idx_CH4) &
        -k(3552)*n(idx_CH)*n(idx_C2H4) &
        -k(3568)*n(idx_C2)*n(idx_C2H4) &
        -k(3580)*n(idx_CN)*n(idx_C2H4) &
        +k(3609)*n(idx_OH)*n(idx_C2H5) &
        +k(4023)*n(idx_C2H5j)*n(idx_E) &
        +k(4062)*n(idx_PC2H4j)*n(idx_E) &
        +k(4071)*n(idx_C2H6j)*n(idx_E) &
        +k(4108)*n(idx_C4H5j)*n(idx_E) &
        +k(4131)*n(idx_C2H5OH2j)*n(idx_E) &
        +k(4158)*n(idx_C4H7j)*n(idx_E) &
        -k(4352)*n(idx_C2H4) &
        -k(4353)*n(idx_C2H4) &
        +k(4408)*n(idx_C2H5OH) &
        -k(4473)*n(idx_C2H4) &
        +k(4519)*n(idx_C_DUSTC_DUSTH_DUSTH_DUSTH_DUSTH_DUST)

    !C3H3
    !C3H3
    dn(idx_C3H3) = &
        -k(152)*n(idx_C3H3) &
        -k(153)*n(idx_C3H3) &
        +k(169)*n(idx_C3H4) &
        -k(352)*n(idx_Cj)*n(idx_C3H3) &
        -k(353)*n(idx_Cj)*n(idx_C3H3) &
        -k(354)*n(idx_Cj)*n(idx_C3H3) &
        -k(355)*n(idx_Cj)*n(idx_C3H3) &
        -k(564)*n(idx_Hj)*n(idx_C3H3) &
        -k(565)*n(idx_Hj)*n(idx_C3H3) &
        -k(566)*n(idx_Hj)*n(idx_C3H3) &
        -k(567)*n(idx_Hj)*n(idx_C3H3) &
        -k(856)*n(idx_HEj)*n(idx_C3H3) &
        -k(857)*n(idx_HEj)*n(idx_C3H3) &
        -k(858)*n(idx_HEj)*n(idx_C3H3) &
        -k(859)*n(idx_HEj)*n(idx_C3H3) &
        -k(1118)*n(idx_SIj)*n(idx_C3H3) &
        -k(1827)*n(idx_H3j)*n(idx_C3H3) &
        -k(1993)*n(idx_HCOj)*n(idx_C3H3) &
        -k(2247)*n(idx_C2H2j)*n(idx_C3H3) &
        -k(2248)*n(idx_C2H2j)*n(idx_C3H3) &
        -k(2249)*n(idx_C2H2j)*n(idx_C3H3) &
        -k(2250)*n(idx_C2H2j)*n(idx_C3H3) &
        -k(2375)*n(idx_CH3j)*n(idx_C3H3) &
        -k(2482)*n(idx_H3Oj)*n(idx_C3H3) &
        -k(2583)*n(idx_C2H3j)*n(idx_C3H3) &
        -k(2584)*n(idx_C2H3j)*n(idx_C3H3) &
        -k(2585)*n(idx_C2H3j)*n(idx_C3H3) &
        -k(2650)*n(idx_C3H2j)*n(idx_C3H3) &
        -k(2651)*n(idx_H2C3j)*n(idx_C3H3) &
        -k(2705)*n(idx_C4Hj)*n(idx_C3H3) &
        -k(2793)*n(idx_C2H4j)*n(idx_C3H3) &
        -k(2794)*n(idx_C2H4j)*n(idx_C3H3) &
        -k(2795)*n(idx_C2H4j)*n(idx_C3H3) &
        -k(2796)*n(idx_C2H4j)*n(idx_C3H3) &
        -k(2848)*n(idx_C3H3j)*n(idx_C3H3) &
        -k(2849)*n(idx_H3C3j)*n(idx_C3H3) &
        -k(2850)*n(idx_C3H3j)*n(idx_C3H3) &
        -k(2851)*n(idx_H3C3j)*n(idx_C3H3) &
        -k(2893)*n(idx_C4H2j)*n(idx_C3H3) &
        -k(2894)*n(idx_C4H2j)*n(idx_C3H3) &
        -k(2980)*n(idx_C4H3j)*n(idx_C3H3) &
        -k(2981)*n(idx_C4H3j)*n(idx_C3H3) &
        -k(3008)*n(idx_C5H2j)*n(idx_C3H3) &
        -k(3009)*n(idx_C5H2j)*n(idx_C3H3) &
        -k(3049)*n(idx_C6H2j)*n(idx_C3H3) &
        -k(3050)*n(idx_C6H2j)*n(idx_C3H3) &
        +k(3285)*n(idx_C)*n(idx_C2H4) &
        -k(3297)*n(idx_C)*n(idx_C3H3) &
        -k(3410)*n(idx_N)*n(idx_C3H3) &
        +k(4028)*n(idx_C3H4j)*n(idx_E) &
        +k(4076)*n(idx_C3H5j)*n(idx_E) &
        +k(4157)*n(idx_C4H7j)*n(idx_E) &
        -k(4354)*n(idx_C3H3) &
        -k(4355)*n(idx_C3H3) &
        -k(4356)*n(idx_C3H3) &
        -k(4357)*n(idx_C3H3) &
        +k(4373)*n(idx_C3H4)

    !C4H2
    !C4H2
    dn(idx_C4H2) = &
        -k(154)*n(idx_C4H2) &
        -k(155)*n(idx_C4H2) &
        -k(156)*n(idx_C4H2) &
        -k(356)*n(idx_Cj)*n(idx_C4H2) &
        -k(357)*n(idx_Cj)*n(idx_C4H2) &
        -k(358)*n(idx_Cj)*n(idx_C4H2) &
        -k(359)*n(idx_Cj)*n(idx_C4H2) &
        -k(568)*n(idx_Hj)*n(idx_C4H2) &
        -k(569)*n(idx_Hj)*n(idx_C4H2) &
        -k(860)*n(idx_HEj)*n(idx_C4H2) &
        -k(861)*n(idx_HEj)*n(idx_C4H2) &
        -k(862)*n(idx_HEj)*n(idx_C4H2) &
        -k(1090)*n(idx_Sj)*n(idx_C4H2) &
        -k(1091)*n(idx_Sj)*n(idx_C4H2) &
        -k(1092)*n(idx_Sj)*n(idx_C4H2) &
        -k(1093)*n(idx_Sj)*n(idx_C4H2) &
        -k(1094)*n(idx_Sj)*n(idx_C4H2) &
        -k(1119)*n(idx_SIj)*n(idx_C4H2) &
        -k(1828)*n(idx_H3j)*n(idx_C4H2) &
        -k(1994)*n(idx_HCOj)*n(idx_C4H2) &
        -k(2251)*n(idx_C2H2j)*n(idx_C4H2) &
        -k(2252)*n(idx_C2H2j)*n(idx_C4H2) &
        -k(2253)*n(idx_C2H2j)*n(idx_C4H2) &
        -k(2300)*n(idx_C3Hj)*n(idx_C4H2) &
        -k(2301)*n(idx_C3Hj)*n(idx_C4H2) &
        -k(2376)*n(idx_CH3j)*n(idx_C4H2) &
        -k(2377)*n(idx_CH3j)*n(idx_C4H2) &
        -k(2378)*n(idx_CH3j)*n(idx_C4H2) &
        -k(2483)*n(idx_H3Oj)*n(idx_C4H2) &
        -k(2586)*n(idx_C2H3j)*n(idx_C4H2) &
        -k(2587)*n(idx_C2H3j)*n(idx_C4H2) &
        -k(2588)*n(idx_C2H3j)*n(idx_C4H2) &
        -k(2652)*n(idx_C3H2j)*n(idx_C4H2) &
        -k(2653)*n(idx_H2C3j)*n(idx_C4H2) &
        -k(2654)*n(idx_C3H2j)*n(idx_C4H2) &
        -k(2655)*n(idx_H2C3j)*n(idx_C4H2) &
        -k(2706)*n(idx_C4Hj)*n(idx_C4H2) &
        -k(2797)*n(idx_C2H4j)*n(idx_C4H2) &
        -k(2798)*n(idx_C2H4j)*n(idx_C4H2) &
        -k(2852)*n(idx_C3H3j)*n(idx_C4H2) &
        -k(2853)*n(idx_H3C3j)*n(idx_C4H2) &
        -k(2895)*n(idx_C4H2j)*n(idx_C4H2) &
        -k(2896)*n(idx_C4H2j)*n(idx_C4H2) &
        -k(2982)*n(idx_C4H3j)*n(idx_C4H2) &
        -k(2983)*n(idx_C4H3j)*n(idx_C4H2) &
        -k(3010)*n(idx_C5H2j)*n(idx_C4H2) &
        -k(3011)*n(idx_C5H2j)*n(idx_C4H2) &
        -k(3029)*n(idx_C4H4j)*n(idx_C4H2) &
        +k(3033)*n(idx_C5H3j)*n(idx_O) &
        -k(3189)*n(idx_C3H3j)*n(idx_C4H2) &
        -k(3190)*n(idx_H3C3j)*n(idx_C4H2) &
        -k(3194)*n(idx_C4H2j)*n(idx_C4H2) &
        -k(3196)*n(idx_C5Hj)*n(idx_C4H2) &
        -k(3202)*n(idx_C4H3j)*n(idx_C4H2) &
        -k(3203)*n(idx_C5H2j)*n(idx_C4H2) &
        -k(3204)*n(idx_C5H3j)*n(idx_C4H2) &
        +k(3297)*n(idx_C)*n(idx_C3H3) &
        -k(3301)*n(idx_C)*n(idx_C4H2) &
        -k(3535)*n(idx_SI)*n(idx_C4H2) &
        -k(3550)*n(idx_CH)*n(idx_C4H2) &
        -k(3569)*n(idx_C2)*n(idx_C4H2) &
        -k(3581)*n(idx_CN)*n(idx_C4H2) &
        +k(3615)*n(idx_C2H)*n(idx_C2H2) &
        -k(3618)*n(idx_C2H)*n(idx_C4H2) &
        +k(4035)*n(idx_C4H3j)*n(idx_E) &
        +k(4079)*n(idx_C4H4j)*n(idx_E) &
        +k(4105)*n(idx_C4H5j)*n(idx_E) &
        -k(4358)*n(idx_C4H2) &
        -k(4359)*n(idx_C4H2) &
        -k(4360)*n(idx_C4H2)

    !C5H
    !C5H
    dn(idx_C5H) = &
        -k(157)*n(idx_C5H) &
        +k(171)*n(idx_C5H2) &
        -k(360)*n(idx_Cj)*n(idx_C5H) &
        -k(570)*n(idx_Hj)*n(idx_C5H) &
        -k(571)*n(idx_Hj)*n(idx_C5H) &
        -k(863)*n(idx_HEj)*n(idx_C5H) &
        -k(864)*n(idx_HEj)*n(idx_C5H) &
        -k(1829)*n(idx_H3j)*n(idx_C5H) &
        -k(1995)*n(idx_HCOj)*n(idx_C5H) &
        -k(2254)*n(idx_C2H2j)*n(idx_C5H) &
        -k(2255)*n(idx_C2H2j)*n(idx_C5H) &
        -k(2379)*n(idx_CH3j)*n(idx_C5H) &
        -k(2589)*n(idx_C2H3j)*n(idx_C5H) &
        -k(2590)*n(idx_C2H3j)*n(idx_C5H) &
        -k(2591)*n(idx_C2H3j)*n(idx_C5H) &
        -k(2656)*n(idx_C3H2j)*n(idx_C5H) &
        -k(2657)*n(idx_H2C3j)*n(idx_C5H) &
        -k(2658)*n(idx_C3H2j)*n(idx_C5H) &
        -k(2659)*n(idx_H2C3j)*n(idx_C5H) &
        -k(2707)*n(idx_C4Hj)*n(idx_C5H) &
        -k(2799)*n(idx_C2H4j)*n(idx_C5H) &
        -k(2800)*n(idx_C2H4j)*n(idx_C5H) &
        -k(2854)*n(idx_C3H3j)*n(idx_C5H) &
        -k(2855)*n(idx_H3C3j)*n(idx_C5H) &
        -k(2856)*n(idx_C3H3j)*n(idx_C5H) &
        -k(2857)*n(idx_H3C3j)*n(idx_C5H) &
        -k(2897)*n(idx_C4H2j)*n(idx_C5H) &
        -k(2984)*n(idx_C4H3j)*n(idx_C5H) &
        +k(3036)*n(idx_C6H2j)*n(idx_O) &
        +k(3301)*n(idx_C)*n(idx_C4H2) &
        -k(3303)*n(idx_C)*n(idx_C5H) &
        -k(3415)*n(idx_N)*n(idx_C5H) &
        +k(3421)*n(idx_N)*n(idx_C6H) &
        -k(3505)*n(idx_O)*n(idx_C5H) &
        +k(3508)*n(idx_O)*n(idx_C6H) &
        +k(4037)*n(idx_C5H2j)*n(idx_E) &
        +k(4041)*n(idx_C6Hj)*n(idx_E) &
        +k(4083)*n(idx_C5H3j)*n(idx_E) &
        +k(4111)*n(idx_C5H4j)*n(idx_E) &
        -k(4361)*n(idx_C5H) &
        -k(4362)*n(idx_C5H) &
        -k(4363)*n(idx_C5H) &
        -k(4364)*n(idx_C5H) &
        +k(4379)*n(idx_C5H2)

    !C5N
    !C5N
    dn(idx_C5N) = &
        -k(158)*n(idx_C5N) &
        +k(195)*n(idx_CH3C5N) &
        -k(865)*n(idx_HEj)*n(idx_C5N) &
        +k(942)*n(idx_HEj)*n(idx_CH3C5N) &
        -k(1830)*n(idx_H3j)*n(idx_C5N) &
        -k(1996)*n(idx_HCOj)*n(idx_C5N) &
        -k(3304)*n(idx_C)*n(idx_C5N) &
        +k(3415)*n(idx_N)*n(idx_C5H) &
        -k(3416)*n(idx_N)*n(idx_C5N) &
        +k(3425)*n(idx_N)*n(idx_C7N) &
        -k(3506)*n(idx_O)*n(idx_C5N) &
        +k(4040)*n(idx_C5HNj)*n(idx_E) &
        +k(4081)*n(idx_C5H2Nj)*n(idx_E) &
        +k(4090)*n(idx_C7Nj)*n(idx_E) &
        +k(4109)*n(idx_C5H3Nj)*n(idx_E) &
        +k(4136)*n(idx_C5H4Nj)*n(idx_E) &
        -k(4365)*n(idx_C5N) &
        +k(4388)*n(idx_HC5N)

    !C6
    !C6
    dn(idx_C6) = &
        -k(159)*n(idx_C6) &
        +k(172)*n(idx_C6H) &
        +k(173)*n(idx_C7) &
        +k(179)*n(idx_C7N) &
        -k(572)*n(idx_Hj)*n(idx_C6) &
        -k(866)*n(idx_HEj)*n(idx_C6) &
        -k(867)*n(idx_HEj)*n(idx_C6) &
        -k(1831)*n(idx_H3j)*n(idx_C6) &
        -k(1997)*n(idx_HCOj)*n(idx_C6) &
        +k(3054)*n(idx_C7Hj)*n(idx_O) &
        -k(3133)*n(idx_Cj)*n(idx_C6) &
        +k(3303)*n(idx_C)*n(idx_C5H) &
        -k(3319)*n(idx_C)*n(idx_C6) &
        -k(3320)*n(idx_C)*n(idx_C6) &
        +k(3323)*n(idx_C)*n(idx_C8) &
        -k(3420)*n(idx_N)*n(idx_C6) &
        +k(3422)*n(idx_N)*n(idx_C7) &
        -k(3507)*n(idx_O)*n(idx_C6) &
        +k(3509)*n(idx_O)*n(idx_C7) &
        +k(3511)*n(idx_O)*n(idx_C7N) &
        +k(3555)*n(idx_CH)*n(idx_C5) &
        -k(3560)*n(idx_CH)*n(idx_C6) &
        +k(3627)*n(idx_C2H)*n(idx_C4) &
        -k(3628)*n(idx_C2H)*n(idx_C6) &
        +k(4042)*n(idx_C6Hj)*n(idx_E) &
        +k(4045)*n(idx_C7j)*n(idx_E) &
        +k(4085)*n(idx_C6H2j)*n(idx_E) &
        +k(4086)*n(idx_C6H2j)*n(idx_E) &
        +k(4091)*n(idx_C8j)*n(idx_E) &
        +k(4393)*n(idx_NC8N) &
        +k(4398)*n(idx_HC8N)

    !CH3OH
    !CH3OH
    dn(idx_CH3OH) = &
        -k(160)*n(idx_CH3OH) &
        -k(161)*n(idx_CH3OH) &
        -k(162)*n(idx_CH3OH) &
        -k(163)*n(idx_CH3OH) &
        -k(361)*n(idx_Cj)*n(idx_CH3OH) &
        -k(362)*n(idx_Cj)*n(idx_CH3OH) &
        -k(363)*n(idx_Cj)*n(idx_CH3OH) &
        -k(573)*n(idx_Hj)*n(idx_CH3OH) &
        -k(574)*n(idx_Hj)*n(idx_CH3OH) &
        -k(868)*n(idx_HEj)*n(idx_CH3OH) &
        -k(869)*n(idx_HEj)*n(idx_CH3OH) &
        -k(998)*n(idx_Nj)*n(idx_CH3OH) &
        -k(999)*n(idx_Nj)*n(idx_CH3OH) &
        -k(1000)*n(idx_Nj)*n(idx_CH3OH) &
        -k(1001)*n(idx_Nj)*n(idx_CH3OH) &
        -k(1002)*n(idx_Nj)*n(idx_CH3OH) &
        -k(1042)*n(idx_Oj)*n(idx_CH3OH) &
        -k(1043)*n(idx_Oj)*n(idx_CH3OH) &
        -k(1044)*n(idx_Oj)*n(idx_CH3OH) &
        -k(1202)*n(idx_CHj)*n(idx_CH3OH) &
        -k(1203)*n(idx_CHj)*n(idx_CH3OH) &
        -k(1204)*n(idx_CHj)*n(idx_CH3OH) &
        -k(1466)*n(idx_O2j)*n(idx_CH3OH) &
        -k(1467)*n(idx_O2j)*n(idx_CH3OH) &
        -k(1832)*n(idx_H3j)*n(idx_CH3OH) &
        -k(1833)*n(idx_H3j)*n(idx_CH3OH) &
        -k(1834)*n(idx_H3j)*n(idx_CH3OH) &
        -k(1998)*n(idx_HCOj)*n(idx_CH3OH) &
        -k(2380)*n(idx_CH3j)*n(idx_CH3OH) &
        -k(2484)*n(idx_H3Oj)*n(idx_CH3OH) &
        -k(2739)*n(idx_CH4j)*n(idx_CH3OH) &
        -k(2740)*n(idx_CH4j)*n(idx_CH3OH) &
        -k(3019)*n(idx_CH5Oj)*n(idx_CH3OH) &
        -k(3174)*n(idx_CH3j)*n(idx_CH3OH) &
        +k(3253)*n(idx_OHk)*n(idx_CH3) &
        +k(4052)*n(idx_CH5Oj)*n(idx_E) &
        +k(4096)*n(idx_COOCH4j)*n(idx_E) &
        +k(4126)*n(idx_CH3OCH3j)*n(idx_E) &
        +k(4127)*n(idx_H5C2O2j)*n(idx_E) &
        +k(4152)*n(idx_CH3OCH4j)*n(idx_E) &
        -k(4366)*n(idx_CH3OH) &
        -k(4367)*n(idx_CH3OH) &
        -k(4474)*n(idx_CH3OH) &
        +k(4520)*n(idx_C_DUSTH_DUSTH_DUSTH_DUSTO_DUSTH_DUST)

    !C2H4O
    !C2H4O
    dn(idx_C2H4O) = &
        -k(164)*n(idx_C2H4O) &
        -k(165)*n(idx_C2H4O) &
        -k(166)*n(idx_C2H4O) &
        -k(370)*n(idx_Cj)*n(idx_C2H4O) &
        -k(371)*n(idx_Cj)*n(idx_C2H4O) &
        -k(579)*n(idx_Hj)*n(idx_C2H4O) &
        -k(580)*n(idx_Hj)*n(idx_C2H4O) &
        -k(875)*n(idx_HEj)*n(idx_C2H4O) &
        -k(876)*n(idx_HEj)*n(idx_C2H4O) &
        -k(877)*n(idx_HEj)*n(idx_C2H4O) &
        -k(878)*n(idx_HEj)*n(idx_C2H4O) &
        +k(1529)*n(idx_S2j)*n(idx_C2H5OH) &
        -k(1836)*n(idx_H3j)*n(idx_C2H4O) &
        -k(2000)*n(idx_HCOj)*n(idx_C2H4O) &
        -k(2486)*n(idx_H3Oj)*n(idx_C2H4O) &
        -k(3175)*n(idx_CH3j)*n(idx_C2H4O) &
        +k(3484)*n(idx_O)*n(idx_C2H5) &
        +k(4070)*n(idx_C2H5Oj)*n(idx_E) &
        +k(4100)*n(idx_C2H5OHj)*n(idx_E) &
        +k(4132)*n(idx_C2H5OH2j)*n(idx_E) &
        +k(4135)*n(idx_C2H6COj)*n(idx_E) &
        +k(4154)*n(idx_C3H6OHj)*n(idx_E) &
        -k(4368)*n(idx_C2H4O) &
        -k(4369)*n(idx_C2H4O) &
        -k(4370)*n(idx_C2H4O)

    !C2H5
    !C2H5
    dn(idx_C2H5) = &
        -k(167)*n(idx_C2H5) &
        -k(372)*n(idx_Cj)*n(idx_C2H5) &
        -k(373)*n(idx_Cj)*n(idx_C2H5) &
        -k(374)*n(idx_Cj)*n(idx_C2H5) &
        -k(581)*n(idx_Hj)*n(idx_C2H5) &
        -k(582)*n(idx_Hj)*n(idx_C2H5) &
        -k(879)*n(idx_HEj)*n(idx_C2H5) &
        -k(880)*n(idx_HEj)*n(idx_C2H5) &
        -k(881)*n(idx_HEj)*n(idx_C2H5) &
        -k(1837)*n(idx_H3j)*n(idx_C2H5) &
        -k(2001)*n(idx_HCOj)*n(idx_C2H5) &
        -k(3299)*n(idx_C)*n(idx_C2H5) &
        -k(3417)*n(idx_N)*n(idx_C2H5) &
        -k(3418)*n(idx_N)*n(idx_C2H5) &
        -k(3484)*n(idx_O)*n(idx_C2H5) &
        -k(3485)*n(idx_O)*n(idx_C2H5) &
        -k(3609)*n(idx_OH)*n(idx_C2H5) &
        +k(4072)*n(idx_C2H6j)*n(idx_E) &
        +k(4101)*n(idx_C2H5OHj)*n(idx_E) &
        +k(4159)*n(idx_C4H7j)*n(idx_E) &
        -k(4476)*n(idx_C2H5) &
        +k(4522)*n(idx_C_DUSTC_DUSTH_DUSTH_DUSTH_DUSTH_DUSTH_DUST)

    !C3H3N
    !C3H3N
    dn(idx_C3H3N) = &
        -k(168)*n(idx_C3H3N) &
        -k(375)*n(idx_Cj)*n(idx_C3H3N) &
        -k(583)*n(idx_Hj)*n(idx_C3H3N) &
        -k(584)*n(idx_Hj)*n(idx_C3H3N) &
        -k(882)*n(idx_HEj)*n(idx_C3H3N) &
        -k(1838)*n(idx_H3j)*n(idx_C3H3N) &
        -k(2002)*n(idx_HCOj)*n(idx_C3H3N) &
        +k(3580)*n(idx_CN)*n(idx_C2H4) &
        +k(4075)*n(idx_C3H4Nj)*n(idx_E)

    !C3H4
    !C3H4
    dn(idx_C3H4) = &
        -k(169)*n(idx_C3H4) &
        -k(170)*n(idx_C3H4) &
        -k(376)*n(idx_Cj)*n(idx_C3H4) &
        -k(377)*n(idx_Cj)*n(idx_C3H4) &
        -k(378)*n(idx_Cj)*n(idx_C3H4) &
        -k(379)*n(idx_Cj)*n(idx_C3H4) &
        -k(380)*n(idx_Cj)*n(idx_C3H4) &
        -k(381)*n(idx_Cj)*n(idx_C3H4) &
        -k(585)*n(idx_Hj)*n(idx_C3H4) &
        -k(586)*n(idx_Hj)*n(idx_C3H4) &
        -k(587)*n(idx_Hj)*n(idx_C3H4) &
        -k(883)*n(idx_HEj)*n(idx_C3H4) &
        -k(884)*n(idx_HEj)*n(idx_C3H4) &
        -k(885)*n(idx_HEj)*n(idx_C3H4) &
        -k(886)*n(idx_HEj)*n(idx_C3H4) &
        -k(887)*n(idx_HEj)*n(idx_C3H4) &
        -k(888)*n(idx_HEj)*n(idx_C3H4) &
        -k(1120)*n(idx_SIj)*n(idx_C3H4) &
        -k(1839)*n(idx_H3j)*n(idx_C3H4) &
        -k(1840)*n(idx_H3j)*n(idx_C3H4) &
        -k(1841)*n(idx_H3j)*n(idx_C3H4) &
        -k(2003)*n(idx_HCOj)*n(idx_C3H4) &
        -k(2256)*n(idx_C2H2j)*n(idx_C3H4) &
        -k(2257)*n(idx_C2H2j)*n(idx_C3H4) &
        -k(2258)*n(idx_C2H2j)*n(idx_C3H4) &
        -k(2487)*n(idx_H3Oj)*n(idx_C3H4) &
        -k(2592)*n(idx_C2H3j)*n(idx_C3H4) &
        -k(2593)*n(idx_C2H3j)*n(idx_C3H4) &
        -k(2660)*n(idx_C3H2j)*n(idx_C3H4) &
        -k(2661)*n(idx_H2C3j)*n(idx_C3H4) &
        -k(2662)*n(idx_C3H2j)*n(idx_C3H4) &
        -k(2663)*n(idx_H2C3j)*n(idx_C3H4) &
        -k(2664)*n(idx_C3H2j)*n(idx_C3H4) &
        -k(2665)*n(idx_H2C3j)*n(idx_C3H4) &
        -k(2666)*n(idx_H2C3j)*n(idx_C3H4) &
        -k(2667)*n(idx_C3H2j)*n(idx_C3H4) &
        -k(2668)*n(idx_C3H2j)*n(idx_C3H4) &
        -k(2669)*n(idx_H2C3j)*n(idx_C3H4) &
        -k(2708)*n(idx_C4Hj)*n(idx_C3H4) &
        -k(2801)*n(idx_C2H4j)*n(idx_C3H4) &
        -k(2858)*n(idx_C3H3j)*n(idx_C3H4) &
        -k(2859)*n(idx_H3C3j)*n(idx_C3H4) &
        -k(2898)*n(idx_C4H2j)*n(idx_C3H4) &
        -k(2964)*n(idx_C3H4j)*n(idx_C3H4) &
        -k(2985)*n(idx_C4H3j)*n(idx_C3H4) &
        -k(3012)*n(idx_C5H2j)*n(idx_C3H4) &
        +k(3026)*n(idx_C3H5j)*n(idx_C6H6) &
        -k(3051)*n(idx_C6H2j)*n(idx_C3H4) &
        -k(3298)*n(idx_C)*n(idx_C3H4) &
        +k(3299)*n(idx_C)*n(idx_C2H5) &
        -k(3534)*n(idx_SI)*n(idx_C3H4) &
        -k(3549)*n(idx_CH)*n(idx_C3H4) &
        +k(3552)*n(idx_CH)*n(idx_C2H4) &
        +k(4077)*n(idx_C3H5j)*n(idx_E) &
        +k(4106)*n(idx_C4H5j)*n(idx_E) &
        -k(4371)*n(idx_C3H4) &
        -k(4372)*n(idx_C3H4) &
        -k(4373)*n(idx_C3H4) &
        -k(4374)*n(idx_C3H4) &
        +k(4375)*n(idx_C4H4)

    !C5H2
    !C5H2
    dn(idx_C5H2) = &
        -k(171)*n(idx_C5H2) &
        -k(387)*n(idx_Cj)*n(idx_C5H2) &
        -k(388)*n(idx_Cj)*n(idx_C5H2) &
        -k(590)*n(idx_Hj)*n(idx_C5H2) &
        -k(591)*n(idx_Hj)*n(idx_C5H2) &
        -k(894)*n(idx_HEj)*n(idx_C5H2) &
        -k(895)*n(idx_HEj)*n(idx_C5H2) &
        -k(896)*n(idx_HEj)*n(idx_C5H2) &
        -k(1843)*n(idx_H3j)*n(idx_C5H2) &
        -k(2005)*n(idx_HCOj)*n(idx_C5H2) &
        -k(2259)*n(idx_C2H2j)*n(idx_C5H2) &
        -k(2260)*n(idx_C2H2j)*n(idx_C5H2) &
        -k(2261)*n(idx_C2H2j)*n(idx_C5H2) &
        -k(2382)*n(idx_CH3j)*n(idx_C5H2) &
        -k(2594)*n(idx_C2H3j)*n(idx_C5H2) &
        -k(2595)*n(idx_C2H3j)*n(idx_C5H2) &
        -k(2596)*n(idx_C2H3j)*n(idx_C5H2) &
        -k(2670)*n(idx_C3H2j)*n(idx_C5H2) &
        -k(2671)*n(idx_H2C3j)*n(idx_C5H2) &
        -k(2672)*n(idx_C3H2j)*n(idx_C5H2) &
        -k(2673)*n(idx_H2C3j)*n(idx_C5H2) &
        -k(2709)*n(idx_C4Hj)*n(idx_C5H2) &
        -k(2802)*n(idx_C2H4j)*n(idx_C5H2) &
        -k(2803)*n(idx_C2H4j)*n(idx_C5H2) &
        -k(2860)*n(idx_C3H3j)*n(idx_C5H2) &
        -k(2861)*n(idx_H3C3j)*n(idx_C5H2) &
        -k(2862)*n(idx_C3H3j)*n(idx_C5H2) &
        -k(2863)*n(idx_H3C3j)*n(idx_C5H2) &
        -k(2899)*n(idx_C4H2j)*n(idx_C5H2) &
        -k(2986)*n(idx_C4H3j)*n(idx_C5H2) &
        -k(2987)*n(idx_C4H3j)*n(idx_C5H2) &
        +k(3064)*n(idx_C6H3j)*n(idx_O) &
        +k(3302)*n(idx_C)*n(idx_C4H3) &
        -k(3305)*n(idx_C)*n(idx_C5H2) &
        -k(3419)*n(idx_N)*n(idx_C5H2) &
        +k(3550)*n(idx_CH)*n(idx_C4H2) &
        +k(3616)*n(idx_C2H)*n(idx_C3H2) &
        +k(3617)*n(idx_C2H)*n(idx_H2C3) &
        -k(3619)*n(idx_C2H)*n(idx_C5H2) &
        +k(4084)*n(idx_C5H3j)*n(idx_E) &
        +k(4112)*n(idx_C5H4j)*n(idx_E) &
        +k(4138)*n(idx_C5H5j)*n(idx_E) &
        -k(4377)*n(idx_C5H2) &
        -k(4378)*n(idx_C5H2) &
        -k(4379)*n(idx_C5H2)

    !C6H
    !C6H
    dn(idx_C6H) = &
        -k(172)*n(idx_C6H) &
        +k(177)*n(idx_C6H2) &
        +k(190)*n(idx_HC7N) &
        +k(197)*n(idx_CH3C6H) &
        -k(389)*n(idx_Cj)*n(idx_C6H) &
        -k(592)*n(idx_Hj)*n(idx_C6H) &
        -k(593)*n(idx_Hj)*n(idx_C6H) &
        -k(897)*n(idx_HEj)*n(idx_C6H) &
        -k(898)*n(idx_HEj)*n(idx_C6H) &
        -k(1844)*n(idx_H3j)*n(idx_C6H) &
        -k(2006)*n(idx_HCOj)*n(idx_C6H) &
        -k(2262)*n(idx_C2H2j)*n(idx_C6H) &
        -k(2263)*n(idx_C2H2j)*n(idx_C6H) &
        -k(2383)*n(idx_CH3j)*n(idx_C6H) &
        -k(2597)*n(idx_C2H3j)*n(idx_C6H) &
        -k(2598)*n(idx_C2H3j)*n(idx_C6H) &
        -k(2599)*n(idx_C2H3j)*n(idx_C6H) &
        -k(2674)*n(idx_C3H2j)*n(idx_C6H) &
        -k(2675)*n(idx_H2C3j)*n(idx_C6H) &
        -k(2676)*n(idx_C3H2j)*n(idx_C6H) &
        -k(2677)*n(idx_H2C3j)*n(idx_C6H) &
        -k(2804)*n(idx_C2H4j)*n(idx_C6H) &
        -k(2805)*n(idx_C2H4j)*n(idx_C6H) &
        -k(2864)*n(idx_C3H3j)*n(idx_C6H) &
        -k(2865)*n(idx_H3C3j)*n(idx_C6H) &
        -k(2866)*n(idx_C3H3j)*n(idx_C6H) &
        -k(2867)*n(idx_H3C3j)*n(idx_C6H) &
        +k(3068)*n(idx_C7H2j)*n(idx_O) &
        +k(3305)*n(idx_C)*n(idx_C5H2) &
        -k(3306)*n(idx_C)*n(idx_C6H) &
        -k(3421)*n(idx_N)*n(idx_C6H) &
        -k(3508)*n(idx_O)*n(idx_C6H) &
        +k(3510)*n(idx_O)*n(idx_C7H) &
        +k(3569)*n(idx_C2)*n(idx_C4H2) &
        +k(4087)*n(idx_C6H2j)*n(idx_E) &
        +k(4088)*n(idx_C7Hj)*n(idx_E) &
        +k(4113)*n(idx_C6H3j)*n(idx_E) &
        +k(4114)*n(idx_C6H3j)*n(idx_E) &
        +k(4118)*n(idx_C7HNj)*n(idx_E) &
        +k(4140)*n(idx_C6H4j)*n(idx_E) &
        +k(4162)*n(idx_C6H5j)*n(idx_E) &
        -k(4380)*n(idx_C6H) &
        -k(4381)*n(idx_C6H) &
        -k(4382)*n(idx_C6H) &
        +k(4406)*n(idx_SIC6H)

    !C7
    !C7
    dn(idx_C7) = &
        -k(173)*n(idx_C7) &
        +k(178)*n(idx_C7H) &
        +k(180)*n(idx_C8) &
        -k(594)*n(idx_Hj)*n(idx_C7) &
        -k(899)*n(idx_HEj)*n(idx_C7) &
        -k(900)*n(idx_HEj)*n(idx_C7) &
        -k(1845)*n(idx_H3j)*n(idx_C7) &
        -k(2007)*n(idx_HCOj)*n(idx_C7) &
        -k(3134)*n(idx_Cj)*n(idx_C7) &
        +k(3306)*n(idx_C)*n(idx_C6H) &
        +k(3309)*n(idx_C)*n(idx_C7N) &
        -k(3321)*n(idx_C)*n(idx_C7) &
        +k(3324)*n(idx_C)*n(idx_C8) &
        -k(3422)*n(idx_N)*n(idx_C7) &
        +k(3426)*n(idx_N)*n(idx_C8) &
        -k(3509)*n(idx_O)*n(idx_C7) &
        +k(3512)*n(idx_O)*n(idx_C8) &
        -k(3556)*n(idx_CH)*n(idx_C7) &
        +k(3560)*n(idx_CH)*n(idx_C6) &
        +k(3623)*n(idx_C2H)*n(idx_C5) &
        -k(3624)*n(idx_C2H)*n(idx_C7) &
        +k(4089)*n(idx_C7Hj)*n(idx_E) &
        +k(4092)*n(idx_C8j)*n(idx_E) &
        +k(4116)*n(idx_C7H2j)*n(idx_E) &
        +k(4122)*n(idx_C9j)*n(idx_E)

    !CH5N
    !CH5N
    dn(idx_CH5N) = &
        -k(174)*n(idx_CH5N) &
        -k(175)*n(idx_CH5N) &
        -k(390)*n(idx_Cj)*n(idx_CH5N) &
        -k(391)*n(idx_Cj)*n(idx_CH5N) &
        -k(595)*n(idx_Hj)*n(idx_CH5N) &
        -k(596)*n(idx_Hj)*n(idx_CH5N) &
        -k(901)*n(idx_HEj)*n(idx_CH5N) &
        -k(902)*n(idx_HEj)*n(idx_CH5N) &
        -k(903)*n(idx_HEj)*n(idx_CH5N) &
        -k(904)*n(idx_HEj)*n(idx_CH5N) &
        -k(1846)*n(idx_H3j)*n(idx_CH5N) &
        -k(2008)*n(idx_HCOj)*n(idx_CH5N) &
        +k(4094)*n(idx_CH6Nj)*n(idx_E) &
        -k(4383)*n(idx_CH5N) &
        -k(4384)*n(idx_CH5N) &
        -k(4385)*n(idx_CH5N) &
        -k(4386)*n(idx_CH5N) &
        -k(4387)*n(idx_CH5N)

    !HC5N
    !HC5N
    dn(idx_HC5N) = &
        -k(176)*n(idx_HC5N) &
        -k(392)*n(idx_Cj)*n(idx_HC5N) &
        -k(393)*n(idx_Cj)*n(idx_HC5N) &
        -k(597)*n(idx_Hj)*n(idx_HC5N) &
        +k(622)*n(idx_Hj)*n(idx_CH3C5N) &
        -k(905)*n(idx_HEj)*n(idx_HC5N) &
        -k(906)*n(idx_HEj)*n(idx_HC5N) &
        -k(907)*n(idx_HEj)*n(idx_HC5N) &
        -k(1847)*n(idx_H3j)*n(idx_HC5N) &
        -k(2009)*n(idx_HCOj)*n(idx_HC5N) &
        -k(3160)*n(idx_C2H2j)*n(idx_HC5N) &
        -k(3176)*n(idx_CH3j)*n(idx_HC5N) &
        -k(3195)*n(idx_C4H2j)*n(idx_HC5N) &
        +k(3419)*n(idx_N)*n(idx_C5H2) &
        -k(3563)*n(idx_CH)*n(idx_HC5N) &
        +k(3581)*n(idx_CN)*n(idx_C4H2) &
        -k(3585)*n(idx_CN)*n(idx_HC5N) &
        +k(3630)*n(idx_C2H)*n(idx_HC3N) &
        -k(3631)*n(idx_C2H)*n(idx_HC5N) &
        +k(4082)*n(idx_C5H2Nj)*n(idx_E) &
        +k(4110)*n(idx_C5H3Nj)*n(idx_E) &
        +k(4137)*n(idx_C5H4Nj)*n(idx_E) &
        +k(4160)*n(idx_C6H4Nj)*n(idx_E) &
        -k(4388)*n(idx_HC5N) &
        -k(4389)*n(idx_HC5N)

    !C6H2
    !C6H2
    dn(idx_C6H2) = &
        -k(177)*n(idx_C6H2) &
        -k(394)*n(idx_Cj)*n(idx_C6H2) &
        -k(395)*n(idx_Cj)*n(idx_C6H2) &
        -k(598)*n(idx_Hj)*n(idx_C6H2) &
        -k(599)*n(idx_Hj)*n(idx_C6H2) &
        -k(908)*n(idx_HEj)*n(idx_C6H2) &
        -k(909)*n(idx_HEj)*n(idx_C6H2) &
        -k(910)*n(idx_HEj)*n(idx_C6H2) &
        -k(1848)*n(idx_H3j)*n(idx_C6H2) &
        -k(2010)*n(idx_HCOj)*n(idx_C6H2) &
        -k(2264)*n(idx_C2H2j)*n(idx_C6H2) &
        -k(2265)*n(idx_C2H2j)*n(idx_C6H2) &
        -k(2266)*n(idx_C2H2j)*n(idx_C6H2) &
        -k(2384)*n(idx_CH3j)*n(idx_C6H2) &
        -k(2600)*n(idx_C2H3j)*n(idx_C6H2) &
        -k(2601)*n(idx_C2H3j)*n(idx_C6H2) &
        -k(2602)*n(idx_C2H3j)*n(idx_C6H2) &
        -k(2678)*n(idx_C3H2j)*n(idx_C6H2) &
        -k(2679)*n(idx_H2C3j)*n(idx_C6H2) &
        -k(2680)*n(idx_C3H2j)*n(idx_C6H2) &
        -k(2681)*n(idx_H2C3j)*n(idx_C6H2) &
        -k(2806)*n(idx_C2H4j)*n(idx_C6H2) &
        -k(2807)*n(idx_C2H4j)*n(idx_C6H2) &
        -k(2868)*n(idx_C3H3j)*n(idx_C6H2) &
        -k(2869)*n(idx_H3C3j)*n(idx_C6H2) &
        +k(3083)*n(idx_C7H3j)*n(idx_O) &
        -k(3307)*n(idx_C)*n(idx_C6H2) &
        +k(3315)*n(idx_C)*n(idx_CH3C4H) &
        -k(3536)*n(idx_SI)*n(idx_C6H2) &
        -k(3551)*n(idx_CH)*n(idx_C6H2) &
        -k(3570)*n(idx_C2)*n(idx_C6H2) &
        -k(3582)*n(idx_CN)*n(idx_C6H2) &
        +k(3618)*n(idx_C2H)*n(idx_C4H2) &
        -k(3620)*n(idx_C2H)*n(idx_C6H2) &
        +k(4115)*n(idx_C6H3j)*n(idx_E) &
        +k(4141)*n(idx_C6H4j)*n(idx_E) &
        +k(4163)*n(idx_C6H5j)*n(idx_E) &
        +k(4183)*n(idx_C6H7j)*n(idx_E)

    !C7H
    !C7H
    dn(idx_C7H) = &
        -k(178)*n(idx_C7H) &
        +k(184)*n(idx_C7H2) &
        -k(396)*n(idx_Cj)*n(idx_C7H) &
        -k(600)*n(idx_Hj)*n(idx_C7H) &
        -k(601)*n(idx_Hj)*n(idx_C7H) &
        -k(911)*n(idx_HEj)*n(idx_C7H) &
        -k(912)*n(idx_HEj)*n(idx_C7H) &
        -k(1849)*n(idx_H3j)*n(idx_C7H) &
        -k(2011)*n(idx_HCOj)*n(idx_C7H) &
        -k(2267)*n(idx_C2H2j)*n(idx_C7H) &
        -k(2268)*n(idx_C2H2j)*n(idx_C7H) &
        -k(2385)*n(idx_CH3j)*n(idx_C7H) &
        -k(2603)*n(idx_C2H3j)*n(idx_C7H) &
        -k(2604)*n(idx_C2H3j)*n(idx_C7H) &
        -k(2605)*n(idx_C2H3j)*n(idx_C7H) &
        -k(2808)*n(idx_C2H4j)*n(idx_C7H) &
        -k(2809)*n(idx_C2H4j)*n(idx_C7H) &
        +k(3086)*n(idx_C8H2j)*n(idx_O) &
        +k(3307)*n(idx_C)*n(idx_C6H2) &
        -k(3308)*n(idx_C)*n(idx_C7H) &
        -k(3423)*n(idx_N)*n(idx_C7H) &
        +k(3427)*n(idx_N)*n(idx_C8H) &
        -k(3510)*n(idx_O)*n(idx_C7H) &
        +k(3513)*n(idx_O)*n(idx_C8H) &
        +k(4117)*n(idx_C7H2j)*n(idx_E) &
        +k(4120)*n(idx_C8Hj)*n(idx_E) &
        +k(4144)*n(idx_C7H3j)*n(idx_E) &
        +k(4166)*n(idx_C7H4j)*n(idx_E)

    !C7N
    !C7N
    dn(idx_C7N) = &
        -k(179)*n(idx_C7N) &
        +k(198)*n(idx_CH3C7N) &
        -k(913)*n(idx_HEj)*n(idx_C7N) &
        +k(948)*n(idx_HEj)*n(idx_CH3C7N) &
        -k(1850)*n(idx_H3j)*n(idx_C7N) &
        -k(2012)*n(idx_HCOj)*n(idx_C7N) &
        -k(3309)*n(idx_C)*n(idx_C7N) &
        +k(3423)*n(idx_N)*n(idx_C7H) &
        -k(3425)*n(idx_N)*n(idx_C7N) &
        +k(3430)*n(idx_N)*n(idx_C9N) &
        -k(3511)*n(idx_O)*n(idx_C7N) &
        +k(4119)*n(idx_C7HNj)*n(idx_E) &
        +k(4142)*n(idx_C7H2Nj)*n(idx_E) &
        +k(4150)*n(idx_C9Nj)*n(idx_E) &
        +k(4164)*n(idx_C7H3Nj)*n(idx_E)

    !C8
    !C8
    dn(idx_C8) = &
        -k(180)*n(idx_C8) &
        +k(185)*n(idx_C8H) &
        +k(186)*n(idx_C9) &
        +k(194)*n(idx_C9N) &
        -k(602)*n(idx_Hj)*n(idx_C8) &
        -k(914)*n(idx_HEj)*n(idx_C8) &
        -k(915)*n(idx_HEj)*n(idx_C8) &
        -k(1851)*n(idx_H3j)*n(idx_C8) &
        -k(2013)*n(idx_HCOj)*n(idx_C8) &
        +k(3090)*n(idx_C9Hj)*n(idx_O) &
        -k(3135)*n(idx_Cj)*n(idx_C8) &
        +k(3308)*n(idx_C)*n(idx_C7H) &
        -k(3322)*n(idx_C)*n(idx_C8) &
        -k(3323)*n(idx_C)*n(idx_C8) &
        -k(3324)*n(idx_C)*n(idx_C8) &
        -k(3426)*n(idx_N)*n(idx_C8) &
        +k(3428)*n(idx_N)*n(idx_C9) &
        -k(3512)*n(idx_O)*n(idx_C8) &
        +k(3514)*n(idx_O)*n(idx_C9) &
        +k(3516)*n(idx_O)*n(idx_C9N) &
        +k(3556)*n(idx_CH)*n(idx_C7) &
        -k(3561)*n(idx_CH)*n(idx_C8) &
        +k(3628)*n(idx_C2H)*n(idx_C6) &
        -k(3629)*n(idx_C2H)*n(idx_C8) &
        +k(4121)*n(idx_C8Hj)*n(idx_E) &
        +k(4123)*n(idx_C9j)*n(idx_E) &
        +k(4129)*n(idx_C10j)*n(idx_E) &
        +k(4146)*n(idx_C8H2j)*n(idx_E) &
        +k(4394)*n(idx_NC10N) &
        +k(4399)*n(idx_HC10N)

    !CH3C3N
    !CH3C3N
    dn(idx_CH3C3N) = &
        -k(181)*n(idx_CH3C3N) &
        -k(397)*n(idx_Cj)*n(idx_CH3C3N) &
        -k(398)*n(idx_Cj)*n(idx_CH3C3N) &
        -k(603)*n(idx_Hj)*n(idx_CH3C3N) &
        -k(916)*n(idx_HEj)*n(idx_CH3C3N) &
        -k(1852)*n(idx_H3j)*n(idx_CH3C3N) &
        -k(2014)*n(idx_HCOj)*n(idx_CH3C3N) &
        +k(4103)*n(idx_C4H4Nj)*n(idx_E) &
        -k(4390)*n(idx_CH3C3N)

    !HCOOCH3
    !HCOOCH3
    dn(idx_HCOOCH3) = &
        -k(182)*n(idx_HCOOCH3) &
        -k(399)*n(idx_Cj)*n(idx_HCOOCH3) &
        -k(604)*n(idx_Hj)*n(idx_HCOOCH3) &
        -k(917)*n(idx_HEj)*n(idx_HCOOCH3) &
        -k(1853)*n(idx_H3j)*n(idx_HCOOCH3) &
        -k(2015)*n(idx_HCOj)*n(idx_HCOOCH3) &
        -k(2489)*n(idx_H3Oj)*n(idx_HCOOCH3) &
        +k(4128)*n(idx_H5C2O2j)*n(idx_E)

    !C2H5OH
    !C2H5OH
    dn(idx_C2H5OH) = &
        -k(183)*n(idx_C2H5OH) &
        -k(400)*n(idx_Cj)*n(idx_C2H5OH) &
        -k(401)*n(idx_Cj)*n(idx_C2H5OH) &
        -k(402)*n(idx_Cj)*n(idx_C2H5OH) &
        -k(605)*n(idx_Hj)*n(idx_C2H5OH) &
        -k(606)*n(idx_Hj)*n(idx_C2H5OH) &
        -k(918)*n(idx_HEj)*n(idx_C2H5OH) &
        -k(919)*n(idx_HEj)*n(idx_C2H5OH) &
        -k(920)*n(idx_HEj)*n(idx_C2H5OH) &
        -k(921)*n(idx_HEj)*n(idx_C2H5OH) &
        -k(922)*n(idx_HEj)*n(idx_C2H5OH) &
        -k(1528)*n(idx_S2j)*n(idx_C2H5OH) &
        -k(1529)*n(idx_S2j)*n(idx_C2H5OH) &
        -k(1854)*n(idx_H3j)*n(idx_C2H5OH) &
        -k(1855)*n(idx_H3j)*n(idx_C2H5OH) &
        -k(1856)*n(idx_H3j)*n(idx_C2H5OH) &
        -k(2016)*n(idx_HCOj)*n(idx_C2H5OH) &
        -k(2017)*n(idx_HCOj)*n(idx_C2H5OH) &
        -k(2490)*n(idx_H3Oj)*n(idx_C2H5OH) &
        +k(4133)*n(idx_C2H5OH2j)*n(idx_E) &
        -k(4408)*n(idx_C2H5OH) &
        -k(4409)*n(idx_C2H5OH)

    !C7H2
    !C7H2
    dn(idx_C7H2) = &
        -k(184)*n(idx_C7H2) &
        -k(403)*n(idx_Cj)*n(idx_C7H2) &
        -k(404)*n(idx_Cj)*n(idx_C7H2) &
        -k(607)*n(idx_Hj)*n(idx_C7H2) &
        -k(608)*n(idx_Hj)*n(idx_C7H2) &
        -k(923)*n(idx_HEj)*n(idx_C7H2) &
        -k(924)*n(idx_HEj)*n(idx_C7H2) &
        -k(925)*n(idx_HEj)*n(idx_C7H2) &
        -k(1857)*n(idx_H3j)*n(idx_C7H2) &
        -k(2018)*n(idx_HCOj)*n(idx_C7H2) &
        -k(2269)*n(idx_C2H2j)*n(idx_C7H2) &
        -k(2270)*n(idx_C2H2j)*n(idx_C7H2) &
        -k(2271)*n(idx_C2H2j)*n(idx_C7H2) &
        -k(2386)*n(idx_CH3j)*n(idx_C7H2) &
        -k(2606)*n(idx_C2H3j)*n(idx_C7H2) &
        -k(2607)*n(idx_C2H3j)*n(idx_C7H2) &
        -k(2608)*n(idx_C2H3j)*n(idx_C7H2) &
        -k(2810)*n(idx_C2H4j)*n(idx_C7H2) &
        -k(2811)*n(idx_C2H4j)*n(idx_C7H2) &
        +k(3101)*n(idx_C8H3j)*n(idx_O) &
        -k(3310)*n(idx_C)*n(idx_C7H2) &
        -k(3424)*n(idx_N)*n(idx_C7H2) &
        +k(3551)*n(idx_CH)*n(idx_C6H2) &
        +k(3619)*n(idx_C2H)*n(idx_C5H2) &
        -k(3621)*n(idx_C2H)*n(idx_C7H2) &
        +k(4145)*n(idx_C7H3j)*n(idx_E) &
        +k(4167)*n(idx_C7H4j)*n(idx_E) &
        +k(4174)*n(idx_C7H5j)*n(idx_E)

    !C8H
    !C8H
    dn(idx_C8H) = &
        -k(185)*n(idx_C8H) &
        +k(192)*n(idx_C8H2) &
        +k(199)*n(idx_HC9N) &
        -k(405)*n(idx_Cj)*n(idx_C8H) &
        -k(609)*n(idx_Hj)*n(idx_C8H) &
        -k(610)*n(idx_Hj)*n(idx_C8H) &
        -k(926)*n(idx_HEj)*n(idx_C8H) &
        -k(927)*n(idx_HEj)*n(idx_C8H) &
        -k(1858)*n(idx_H3j)*n(idx_C8H) &
        -k(2019)*n(idx_HCOj)*n(idx_C8H) &
        -k(2387)*n(idx_CH3j)*n(idx_C8H) &
        +k(3104)*n(idx_C9H2j)*n(idx_O) &
        +k(3310)*n(idx_C)*n(idx_C7H2) &
        -k(3311)*n(idx_C)*n(idx_C8H) &
        -k(3427)*n(idx_N)*n(idx_C8H) &
        -k(3513)*n(idx_O)*n(idx_C8H) &
        +k(3515)*n(idx_O)*n(idx_C9H) &
        +k(3570)*n(idx_C2)*n(idx_C6H2) &
        +k(4147)*n(idx_C8H2j)*n(idx_E) &
        +k(4148)*n(idx_C9Hj)*n(idx_E) &
        +k(4168)*n(idx_C8H3j)*n(idx_E) &
        +k(4172)*n(idx_C9HNj)*n(idx_E) &
        +k(4176)*n(idx_C8H4j)*n(idx_E) &
        +k(4186)*n(idx_C8H5j)*n(idx_E) &
        +k(4407)*n(idx_SIC8H)

    !C9
    !C9
    dn(idx_C9) = &
        -k(186)*n(idx_C9) &
        +k(193)*n(idx_C9H) &
        -k(611)*n(idx_Hj)*n(idx_C9) &
        -k(928)*n(idx_HEj)*n(idx_C9) &
        -k(929)*n(idx_HEj)*n(idx_C9) &
        -k(1859)*n(idx_H3j)*n(idx_C9) &
        -k(2020)*n(idx_HCOj)*n(idx_C9) &
        -k(3136)*n(idx_Cj)*n(idx_C9) &
        +k(3311)*n(idx_C)*n(idx_C8H) &
        +k(3314)*n(idx_C)*n(idx_C9N) &
        -k(3428)*n(idx_N)*n(idx_C9) &
        -k(3514)*n(idx_O)*n(idx_C9) &
        +k(3517)*n(idx_O)*n(idx_C10) &
        -k(3557)*n(idx_CH)*n(idx_C9) &
        +k(3561)*n(idx_CH)*n(idx_C8) &
        +k(3624)*n(idx_C2H)*n(idx_C7) &
        -k(3625)*n(idx_C2H)*n(idx_C9) &
        +k(4130)*n(idx_C10j)*n(idx_E) &
        +k(4149)*n(idx_C9Hj)*n(idx_E) &
        +k(4170)*n(idx_C9H2j)*n(idx_E)

    !CH3C4H
    !CH3C4H
    dn(idx_CH3C4H) = &
        -k(187)*n(idx_CH3C4H) &
        -k(406)*n(idx_Cj)*n(idx_CH3C4H) &
        -k(407)*n(idx_Cj)*n(idx_CH3C4H) &
        -k(408)*n(idx_Cj)*n(idx_CH3C4H) &
        -k(612)*n(idx_Hj)*n(idx_CH3C4H) &
        -k(613)*n(idx_Hj)*n(idx_CH3C4H) &
        -k(930)*n(idx_HEj)*n(idx_CH3C4H) &
        -k(931)*n(idx_HEj)*n(idx_CH3C4H) &
        -k(1860)*n(idx_H3j)*n(idx_CH3C4H) &
        -k(2021)*n(idx_HCOj)*n(idx_CH3C4H) &
        -k(3315)*n(idx_C)*n(idx_CH3C4H) &
        +k(4139)*n(idx_C5H5j)*n(idx_E) &
        -k(4410)*n(idx_CH3C4H)

    !CH3OCH3
    !CH3OCH3
    dn(idx_CH3OCH3) = &
        -k(188)*n(idx_CH3OCH3) &
        -k(189)*n(idx_CH3OCH3) &
        -k(409)*n(idx_Cj)*n(idx_CH3OCH3) &
        -k(614)*n(idx_Hj)*n(idx_CH3OCH3) &
        -k(615)*n(idx_Hj)*n(idx_CH3OCH3) &
        -k(932)*n(idx_HEj)*n(idx_CH3OCH3) &
        -k(933)*n(idx_HEj)*n(idx_CH3OCH3) &
        -k(1530)*n(idx_S2j)*n(idx_CH3OCH3) &
        -k(1861)*n(idx_H3j)*n(idx_CH3OCH3) &
        -k(2022)*n(idx_HCOj)*n(idx_CH3OCH3) &
        -k(2491)*n(idx_H3Oj)*n(idx_CH3OCH3) &
        +k(4153)*n(idx_CH3OCH4j)*n(idx_E) &
        -k(4411)*n(idx_CH3OCH3) &
        -k(4412)*n(idx_CH3OCH3)

    !HC7N
    !HC7N
    dn(idx_HC7N) = &
        -k(190)*n(idx_HC7N) &
        -k(410)*n(idx_Cj)*n(idx_HC7N) &
        -k(616)*n(idx_Hj)*n(idx_HC7N) &
        +k(627)*n(idx_Hj)*n(idx_CH3C7N) &
        -k(934)*n(idx_HEj)*n(idx_HC7N) &
        -k(1862)*n(idx_H3j)*n(idx_HC7N) &
        -k(2023)*n(idx_HCOj)*n(idx_HC7N) &
        -k(3161)*n(idx_C2H2j)*n(idx_HC7N) &
        -k(3177)*n(idx_CH3j)*n(idx_HC7N) &
        +k(3424)*n(idx_N)*n(idx_C7H2) &
        -k(3564)*n(idx_CH)*n(idx_HC7N) &
        +k(3582)*n(idx_CN)*n(idx_C6H2) &
        -k(3586)*n(idx_CN)*n(idx_HC7N) &
        +k(3631)*n(idx_C2H)*n(idx_HC5N) &
        -k(3632)*n(idx_C2H)*n(idx_HC7N) &
        +k(4143)*n(idx_C7H2Nj)*n(idx_E) &
        +k(4165)*n(idx_C7H3Nj)*n(idx_E) &
        +k(4184)*n(idx_C8H4Nj)*n(idx_E)

    !C2H6CO
    !C2H6CO
    dn(idx_C2H6CO) = &
        -k(191)*n(idx_C2H6CO) &
        -k(411)*n(idx_Cj)*n(idx_C2H6CO) &
        -k(617)*n(idx_Hj)*n(idx_C2H6CO) &
        -k(935)*n(idx_HEj)*n(idx_C2H6CO) &
        -k(1863)*n(idx_H3j)*n(idx_C2H6CO) &
        -k(2024)*n(idx_HCOj)*n(idx_C2H6CO) &
        -k(2492)*n(idx_H3Oj)*n(idx_C2H6CO) &
        +k(4155)*n(idx_C3H6OHj)*n(idx_E)

    !C8H2
    !C8H2
    dn(idx_C8H2) = &
        -k(192)*n(idx_C8H2) &
        -k(412)*n(idx_Cj)*n(idx_C8H2) &
        -k(413)*n(idx_Cj)*n(idx_C8H2) &
        -k(618)*n(idx_Hj)*n(idx_C8H2) &
        -k(619)*n(idx_Hj)*n(idx_C8H2) &
        -k(936)*n(idx_HEj)*n(idx_C8H2) &
        -k(937)*n(idx_HEj)*n(idx_C8H2) &
        -k(938)*n(idx_HEj)*n(idx_C8H2) &
        -k(1864)*n(idx_H3j)*n(idx_C8H2) &
        -k(2025)*n(idx_HCOj)*n(idx_C8H2) &
        -k(2388)*n(idx_CH3j)*n(idx_C8H2) &
        +k(3108)*n(idx_C9H3j)*n(idx_O) &
        -k(3312)*n(idx_C)*n(idx_C8H2) &
        +k(3316)*n(idx_C)*n(idx_CH3C6H) &
        -k(3537)*n(idx_SI)*n(idx_C8H2) &
        -k(3583)*n(idx_CN)*n(idx_C8H2) &
        +k(3620)*n(idx_C2H)*n(idx_C6H2) &
        +k(4169)*n(idx_C8H3j)*n(idx_E) &
        +k(4177)*n(idx_C8H4j)*n(idx_E) &
        +k(4187)*n(idx_C8H5j)*n(idx_E)

    !C9H
    !C9H
    dn(idx_C9H) = &
        -k(193)*n(idx_C9H) &
        +k(196)*n(idx_C9H2) &
        -k(414)*n(idx_Cj)*n(idx_C9H) &
        -k(620)*n(idx_Hj)*n(idx_C9H) &
        -k(621)*n(idx_Hj)*n(idx_C9H) &
        -k(939)*n(idx_HEj)*n(idx_C9H) &
        -k(940)*n(idx_HEj)*n(idx_C9H) &
        -k(1865)*n(idx_H3j)*n(idx_C9H) &
        -k(2026)*n(idx_HCOj)*n(idx_C9H) &
        +k(3312)*n(idx_C)*n(idx_C8H2) &
        -k(3313)*n(idx_C)*n(idx_C9H) &
        -k(3429)*n(idx_N)*n(idx_C9H) &
        -k(3515)*n(idx_O)*n(idx_C9H) &
        +k(4171)*n(idx_C9H2j)*n(idx_E) &
        +k(4180)*n(idx_C9H3j)*n(idx_E) &
        +k(4190)*n(idx_C9H4j)*n(idx_E) &
        +k(4192)*n(idx_C9H5j)*n(idx_E)

    !C9N
    !C9N
    dn(idx_C9N) = &
        -k(194)*n(idx_C9N) &
        -k(941)*n(idx_HEj)*n(idx_C9N) &
        -k(1866)*n(idx_H3j)*n(idx_C9N) &
        -k(2027)*n(idx_HCOj)*n(idx_C9N) &
        -k(3314)*n(idx_C)*n(idx_C9N) &
        +k(3429)*n(idx_N)*n(idx_C9H) &
        -k(3430)*n(idx_N)*n(idx_C9N) &
        -k(3516)*n(idx_O)*n(idx_C9N) &
        +k(4173)*n(idx_C9HNj)*n(idx_E) &
        +k(4178)*n(idx_C9H2Nj)*n(idx_E) &
        +k(4188)*n(idx_C9H3Nj)*n(idx_E)

    !CH3C5N
    !CH3C5N
    dn(idx_CH3C5N) = &
        -k(195)*n(idx_CH3C5N) &
        -k(415)*n(idx_Cj)*n(idx_CH3C5N) &
        -k(622)*n(idx_Hj)*n(idx_CH3C5N) &
        -k(942)*n(idx_HEj)*n(idx_CH3C5N) &
        -k(1867)*n(idx_H3j)*n(idx_CH3C5N) &
        -k(2028)*n(idx_HCOj)*n(idx_CH3C5N) &
        +k(4161)*n(idx_C6H4Nj)*n(idx_E)

    !C9H2
    !C9H2
    dn(idx_C9H2) = &
        -k(196)*n(idx_C9H2) &
        -k(416)*n(idx_Cj)*n(idx_C9H2) &
        -k(623)*n(idx_Hj)*n(idx_C9H2) &
        -k(624)*n(idx_Hj)*n(idx_C9H2) &
        -k(943)*n(idx_HEj)*n(idx_C9H2) &
        -k(944)*n(idx_HEj)*n(idx_C9H2) &
        -k(945)*n(idx_HEj)*n(idx_C9H2) &
        -k(1868)*n(idx_H3j)*n(idx_C9H2) &
        -k(2029)*n(idx_HCOj)*n(idx_C9H2) &
        +k(3621)*n(idx_C2H)*n(idx_C7H2) &
        +k(4181)*n(idx_C9H3j)*n(idx_E) &
        +k(4191)*n(idx_C9H4j)*n(idx_E) &
        +k(4193)*n(idx_C9H5j)*n(idx_E)

    !CH3C6H
    !CH3C6H
    dn(idx_CH3C6H) = &
        -k(197)*n(idx_CH3C6H) &
        -k(417)*n(idx_Cj)*n(idx_CH3C6H) &
        -k(418)*n(idx_Cj)*n(idx_CH3C6H) &
        -k(625)*n(idx_Hj)*n(idx_CH3C6H) &
        -k(626)*n(idx_Hj)*n(idx_CH3C6H) &
        -k(946)*n(idx_HEj)*n(idx_CH3C6H) &
        -k(947)*n(idx_HEj)*n(idx_CH3C6H) &
        -k(1869)*n(idx_H3j)*n(idx_CH3C6H) &
        -k(2030)*n(idx_HCOj)*n(idx_CH3C6H) &
        -k(3316)*n(idx_C)*n(idx_CH3C6H) &
        +k(4175)*n(idx_C7H5j)*n(idx_E)

    !CH3C7N
    !CH3C7N
    dn(idx_CH3C7N) = &
        -k(198)*n(idx_CH3C7N) &
        -k(419)*n(idx_Cj)*n(idx_CH3C7N) &
        -k(627)*n(idx_Hj)*n(idx_CH3C7N) &
        -k(948)*n(idx_HEj)*n(idx_CH3C7N) &
        -k(1870)*n(idx_H3j)*n(idx_CH3C7N) &
        -k(2031)*n(idx_HCOj)*n(idx_CH3C7N) &
        +k(4185)*n(idx_C8H4Nj)*n(idx_E)

    !HC9N
    !HC9N
    dn(idx_HC9N) = &
        -k(199)*n(idx_HC9N) &
        -k(420)*n(idx_Cj)*n(idx_HC9N) &
        -k(628)*n(idx_Hj)*n(idx_HC9N) &
        -k(949)*n(idx_HEj)*n(idx_HC9N) &
        -k(1871)*n(idx_H3j)*n(idx_HC9N) &
        -k(2032)*n(idx_HCOj)*n(idx_HC9N) &
        -k(3565)*n(idx_CH)*n(idx_HC9N) &
        +k(3583)*n(idx_CN)*n(idx_C8H2) &
        -k(3587)*n(idx_CN)*n(idx_HC9N) &
        +k(3632)*n(idx_C2H)*n(idx_HC7N) &
        -k(3633)*n(idx_C2H)*n(idx_HC9N) &
        +k(4179)*n(idx_C9H2Nj)*n(idx_E) &
        +k(4189)*n(idx_C9H3Nj)*n(idx_E)

    !HCNC2
    !HCNC2
    dn(idx_HCNC2) = &
        -k(320)*n(idx_Cj)*n(idx_HCNC2) &
        -k(321)*n(idx_Cj)*n(idx_HCNC2) &
        -k(322)*n(idx_Cj)*n(idx_HCNC2) &
        -k(323)*n(idx_Cj)*n(idx_HCNC2) &
        -k(324)*n(idx_Cj)*n(idx_HCNC2) &
        -k(535)*n(idx_Hj)*n(idx_HCNC2) &
        -k(536)*n(idx_Hj)*n(idx_HCNC2) &
        -k(537)*n(idx_Hj)*n(idx_HCNC2) &
        -k(538)*n(idx_Hj)*n(idx_HCNC2) &
        -k(817)*n(idx_HEj)*n(idx_HCNC2) &
        -k(818)*n(idx_HEj)*n(idx_HCNC2) &
        -k(819)*n(idx_HEj)*n(idx_HCNC2) &
        -k(820)*n(idx_HEj)*n(idx_HCNC2) &
        -k(1814)*n(idx_H3j)*n(idx_HCNC2) &
        -k(1981)*n(idx_HCOj)*n(idx_HCNC2) &
        -k(2105)*n(idx_N2Hj)*n(idx_HCNC2) &
        -k(2363)*n(idx_CH3j)*n(idx_HCNC2) &
        -k(2364)*n(idx_CH3j)*n(idx_HCNC2) &
        -k(2476)*n(idx_H3Oj)*n(idx_HCNC2) &
        -k(3286)*n(idx_C)*n(idx_HCNC2) &
        -k(3335)*n(idx_H)*n(idx_HCNC2) &
        +k(3944)*n(idx_C3H2Nj)*n(idx_E) &
        +k(3981)*n(idx_HC2NCHj)*n(idx_E)

    !HC2NC
    !HC2NC
    dn(idx_HC2NC) = &
        -k(325)*n(idx_Cj)*n(idx_HC2NC) &
        -k(326)*n(idx_Cj)*n(idx_HC2NC) &
        -k(327)*n(idx_Cj)*n(idx_HC2NC) &
        -k(328)*n(idx_Cj)*n(idx_HC2NC) &
        -k(329)*n(idx_Cj)*n(idx_HC2NC) &
        -k(539)*n(idx_Hj)*n(idx_HC2NC) &
        -k(540)*n(idx_Hj)*n(idx_HC2NC) &
        -k(541)*n(idx_Hj)*n(idx_HC2NC) &
        -k(821)*n(idx_HEj)*n(idx_HC2NC) &
        -k(822)*n(idx_HEj)*n(idx_HC2NC) &
        -k(823)*n(idx_HEj)*n(idx_HC2NC) &
        -k(824)*n(idx_HEj)*n(idx_HC2NC) &
        -k(1815)*n(idx_H3j)*n(idx_HC2NC) &
        -k(1982)*n(idx_HCOj)*n(idx_HC2NC) &
        -k(2106)*n(idx_N2Hj)*n(idx_HC2NC) &
        -k(2365)*n(idx_CH3j)*n(idx_HC2NC) &
        -k(2366)*n(idx_CH3j)*n(idx_HC2NC) &
        -k(2477)*n(idx_H3Oj)*n(idx_HC2NC) &
        +k(3335)*n(idx_H)*n(idx_HCNC2) &
        +k(3945)*n(idx_C3H2Nj)*n(idx_E) &
        +k(3982)*n(idx_HC2NCHj)*n(idx_E)

    !HNC3
    !HNC3
    dn(idx_HNC3) = &
        -k(333)*n(idx_Cj)*n(idx_HNC3) &
        -k(334)*n(idx_Cj)*n(idx_HNC3) &
        -k(335)*n(idx_Cj)*n(idx_HNC3) &
        -k(336)*n(idx_Cj)*n(idx_HNC3) &
        -k(543)*n(idx_Hj)*n(idx_HNC3) &
        -k(544)*n(idx_Hj)*n(idx_HNC3) &
        -k(545)*n(idx_Hj)*n(idx_HNC3) &
        -k(546)*n(idx_Hj)*n(idx_HNC3) &
        -k(547)*n(idx_Hj)*n(idx_HNC3) &
        -k(548)*n(idx_Hj)*n(idx_HNC3) &
        -k(832)*n(idx_HEj)*n(idx_HNC3) &
        -k(833)*n(idx_HEj)*n(idx_HNC3) &
        -k(834)*n(idx_HEj)*n(idx_HNC3) &
        -k(835)*n(idx_HEj)*n(idx_HNC3) &
        -k(836)*n(idx_HEj)*n(idx_HNC3) &
        -k(1817)*n(idx_H3j)*n(idx_HNC3) &
        -k(1984)*n(idx_HCOj)*n(idx_HNC3) &
        -k(2108)*n(idx_N2Hj)*n(idx_HNC3) &
        -k(2369)*n(idx_CH3j)*n(idx_HNC3) &
        -k(2370)*n(idx_CH3j)*n(idx_HNC3) &
        -k(2479)*n(idx_H3Oj)*n(idx_HNC3) &
        -k(3287)*n(idx_C)*n(idx_HNC3) &
        -k(3336)*n(idx_H)*n(idx_HNC3) &
        +k(3947)*n(idx_C3H2Nj)*n(idx_E) &
        +k(3984)*n(idx_HC2NCHj)*n(idx_E)

    !NH2CHO
    !NH2CHO
    dn(idx_NH2CHO) = &
        -k(364)*n(idx_Cj)*n(idx_NH2CHO) &
        -k(365)*n(idx_Cj)*n(idx_NH2CHO) &
        -k(366)*n(idx_Cj)*n(idx_NH2CHO) &
        -k(367)*n(idx_Cj)*n(idx_NH2CHO) &
        -k(368)*n(idx_Cj)*n(idx_NH2CHO) &
        -k(369)*n(idx_Cj)*n(idx_NH2CHO) &
        -k(575)*n(idx_Hj)*n(idx_NH2CHO) &
        -k(576)*n(idx_Hj)*n(idx_NH2CHO) &
        -k(577)*n(idx_Hj)*n(idx_NH2CHO) &
        -k(578)*n(idx_Hj)*n(idx_NH2CHO) &
        -k(870)*n(idx_HEj)*n(idx_NH2CHO) &
        -k(871)*n(idx_HEj)*n(idx_NH2CHO) &
        -k(872)*n(idx_HEj)*n(idx_NH2CHO) &
        -k(873)*n(idx_HEj)*n(idx_NH2CHO) &
        -k(874)*n(idx_HEj)*n(idx_NH2CHO) &
        -k(1835)*n(idx_H3j)*n(idx_NH2CHO) &
        -k(1999)*n(idx_HCOj)*n(idx_NH2CHO) &
        -k(2109)*n(idx_N2Hj)*n(idx_NH2CHO) &
        -k(2381)*n(idx_CH3j)*n(idx_NH2CHO) &
        -k(2485)*n(idx_H3Oj)*n(idx_NH2CHO) &
        +k(3640)*n(idx_NH2)*n(idx_H2CO) &
        +k(4057)*n(idx_NH2CH2Oj)*n(idx_E)

    !C4H3
    !C4H3
    dn(idx_C4H3) = &
        -k(382)*n(idx_Cj)*n(idx_C4H3) &
        -k(383)*n(idx_Cj)*n(idx_C4H3) &
        -k(384)*n(idx_Cj)*n(idx_C4H3) &
        -k(385)*n(idx_Cj)*n(idx_C4H3) &
        -k(386)*n(idx_Cj)*n(idx_C4H3) &
        -k(588)*n(idx_Hj)*n(idx_C4H3) &
        -k(589)*n(idx_Hj)*n(idx_C4H3) &
        -k(889)*n(idx_HEj)*n(idx_C4H3) &
        -k(890)*n(idx_HEj)*n(idx_C4H3) &
        -k(891)*n(idx_HEj)*n(idx_C4H3) &
        -k(892)*n(idx_HEj)*n(idx_C4H3) &
        -k(893)*n(idx_HEj)*n(idx_C4H3) &
        -k(1842)*n(idx_H3j)*n(idx_C4H3) &
        -k(2004)*n(idx_HCOj)*n(idx_C4H3) &
        -k(2488)*n(idx_H3Oj)*n(idx_C4H3) &
        +k(3298)*n(idx_C)*n(idx_C3H4) &
        -k(3302)*n(idx_C)*n(idx_C4H3) &
        +k(3568)*n(idx_C2)*n(idx_C2H4) &
        +k(4080)*n(idx_C4H4j)*n(idx_E)

    !NH2CN
    !NH2CN
    dn(idx_NH2CN) = &
        -k(549)*n(idx_Hj)*n(idx_NH2CN) &
        -k(550)*n(idx_Hj)*n(idx_NH2CN) &
        -k(837)*n(idx_HEj)*n(idx_NH2CN) &
        -k(838)*n(idx_HEj)*n(idx_NH2CN) &
        -k(1818)*n(idx_H3j)*n(idx_NH2CN) &
        -k(1985)*n(idx_HCOj)*n(idx_NH2CN) &
        +k(3579)*n(idx_CN)*n(idx_NH3) &
        +k(3993)*n(idx_NH2CNHj)*n(idx_E)

    !C6H6
    !C6H6
    dn(idx_C6H6) = &
        -k(950)*n(idx_HEj)*n(idx_C6H6) &
        -k(951)*n(idx_HEj)*n(idx_C6H6) &
        -k(1872)*n(idx_H3j)*n(idx_C6H6) &
        -k(2033)*n(idx_HCOj)*n(idx_C6H6) &
        -k(2110)*n(idx_N2Hj)*n(idx_C6H6) &
        -k(2493)*n(idx_H3Oj)*n(idx_C6H6) &
        -k(2609)*n(idx_C2H3j)*n(idx_C6H6) &
        -k(2932)*n(idx_CH5j)*n(idx_C6H6) &
        -k(3026)*n(idx_C3H5j)*n(idx_C6H6) &
        +k(4182)*n(idx_C6H7j)*n(idx_E)

    !H2CN
    !H2CN
    dn(idx_H2CN) = &
        -k(3283)*n(idx_C)*n(idx_H2CN) &
        -k(3334)*n(idx_H)*n(idx_H2CN) &
        +k(3403)*n(idx_N)*n(idx_CH3) &
        -k(3404)*n(idx_N)*n(idx_H2CN) &
        +k(3417)*n(idx_N)*n(idx_C2H5) &
        -k(3493)*n(idx_O)*n(idx_H2CN) &
        +k(4059)*n(idx_NH2CH2Oj)*n(idx_E)

    !C10
    !C10
    dn(idx_C10) = &
        +k(3313)*n(idx_C)*n(idx_C9H) &
        -k(3517)*n(idx_O)*n(idx_C10) &
        +k(3518)*n(idx_O)*n(idx_C11) &
        +k(3557)*n(idx_CH)*n(idx_C9) &
        +k(3629)*n(idx_C2H)*n(idx_C8) &
        +k(4395)*n(idx_NC12N) &
        +k(4400)*n(idx_HC12N)

    !C11
    !C11
    dn(idx_C11) = &
        -k(3518)*n(idx_O)*n(idx_C11) &
        +k(3625)*n(idx_C2H)*n(idx_C9) &
        +k(4401)*n(idx_HC13N)

    !SIC3H3
    !SIC3H3
    dn(idx_SIC3H3) = &
        +k(3534)*n(idx_SI)*n(idx_C3H4) &
        -k(4403)*n(idx_SIC3H3)

    !SIC4H
    !SIC4H
    dn(idx_SIC4H) = &
        +k(3535)*n(idx_SI)*n(idx_C4H2) &
        -k(4405)*n(idx_SIC4H)

    !SIC6H
    !SIC6H
    dn(idx_SIC6H) = &
        +k(3536)*n(idx_SI)*n(idx_C6H2) &
        -k(4406)*n(idx_SIC6H)

    !SIC8H
    !SIC8H
    dn(idx_SIC8H) = &
        +k(3537)*n(idx_SI)*n(idx_C8H2) &
        -k(4407)*n(idx_SIC8H)

    !SIC2H3
    !SIC2H3
    dn(idx_SIC2H3) = &
        +k(3538)*n(idx_SI)*n(idx_C2H4) &
        -k(4402)*n(idx_SIC2H3)

    !C3H6
    !C3H6
    dn(idx_C3H6) = &
        -k(3539)*n(idx_SI)*n(idx_C3H6) &
        -k(3553)*n(idx_CH)*n(idx_C3H6) &
        +k(4376)*n(idx_C4H6)

    !SIC3H5
    !SIC3H5
    dn(idx_SIC3H5) = &
        +k(3539)*n(idx_SI)*n(idx_C3H6) &
        -k(4404)*n(idx_SIC3H5)

    !C4H4
    !C4H4
    dn(idx_C4H4) = &
        +k(3549)*n(idx_CH)*n(idx_C3H4) &
        -k(4375)*n(idx_C4H4)

    !C4H6
    !C4H6
    dn(idx_C4H6) = &
        +k(3553)*n(idx_CH)*n(idx_C3H6) &
        -k(4376)*n(idx_C4H6)

    !HC4N
    !HC4N
    dn(idx_HC4N) = &
        +k(3562)*n(idx_CH)*n(idx_HC3N) &
        -k(4396)*n(idx_HC4N)

    !HC6N
    !HC6N
    dn(idx_HC6N) = &
        +k(3563)*n(idx_CH)*n(idx_HC5N) &
        -k(4397)*n(idx_HC6N)

    !HC8N
    !HC8N
    dn(idx_HC8N) = &
        +k(3564)*n(idx_CH)*n(idx_HC7N) &
        -k(4398)*n(idx_HC8N)

    !HC10N
    !HC10N
    dn(idx_HC10N) = &
        +k(3565)*n(idx_CH)*n(idx_HC9N) &
        -k(4399)*n(idx_HC10N)

    !HC11N
    !HC11N
    dn(idx_HC11N) = &
        -k(3566)*n(idx_CH)*n(idx_HC11N) &
        -k(3588)*n(idx_CN)*n(idx_HC11N) &
        +k(3633)*n(idx_C2H)*n(idx_HC9N) &
        -k(3634)*n(idx_C2H)*n(idx_HC11N)

    !HC12N
    !HC12N
    dn(idx_HC12N) = &
        +k(3566)*n(idx_CH)*n(idx_HC11N) &
        -k(4400)*n(idx_HC12N)

    !NC4N
    !NC4N
    dn(idx_NC4N) = &
        +k(3584)*n(idx_CN)*n(idx_HC3N) &
        -k(4391)*n(idx_NC4N)

    !NC6N
    !NC6N
    dn(idx_NC6N) = &
        +k(3585)*n(idx_CN)*n(idx_HC5N) &
        -k(4392)*n(idx_NC6N)

    !NC8N
    !NC8N
    dn(idx_NC8N) = &
        +k(3586)*n(idx_CN)*n(idx_HC7N) &
        -k(4393)*n(idx_NC8N)

    !NC10N
    !NC10N
    dn(idx_NC10N) = &
        +k(3587)*n(idx_CN)*n(idx_HC9N) &
        -k(4394)*n(idx_NC10N)

    !NC12N
    !NC12N
    dn(idx_NC12N) = &
        +k(3588)*n(idx_CN)*n(idx_HC11N) &
        -k(4395)*n(idx_NC12N)

    !HC13N
    !HC13N
    dn(idx_HC13N) = &
        +k(3634)*n(idx_C2H)*n(idx_HC11N) &
        -k(4401)*n(idx_HC13N)

    !H_DUST
    !H_DUST
    dn(idx_H_DUST) = &
        +k(4432)*n(idx_H) &
        -k(4478)*n(idx_H_DUST) &
        -2.d0*k(4524)*n(idx_H_DUST)*n(idx_H_DUST) &
        -k(4525)*n(idx_H_DUST)*n(idx_C_DUST) &
        -k(4526)*n(idx_H_DUST)*n(idx_N_DUST) &
        -k(4527)*n(idx_H_DUST)*n(idx_O_DUST) &
        -k(4528)*n(idx_H_DUST)*n(idx_C_DUSTH_DUST) &
        -k(4529)*n(idx_H_DUST)*n(idx_N_DUSTH_DUST) &
        -k(4530)*n(idx_H_DUST)*n(idx_O_DUSTH_DUST) &
        -k(4531)*n(idx_H_DUST)*n(idx_C_DUSTC_DUST) &
        -k(4532)*n(idx_H_DUST)*n(idx_C_DUSTN_DUST) &
        -k(4533)*n(idx_H_DUST)*n(idx_C_DUSTO_DUST) &
        -k(4534)*n(idx_H_DUST)*n(idx_C_DUSTO_DUST) &
        -k(4535)*n(idx_H_DUST)*n(idx_N_DUSTO_DUST) &
        -k(4536)*n(idx_H_DUST)*n(idx_O_DUSTO_DUST) &
        -k(4537)*n(idx_H_DUST)*n(idx_N_DUSTN_DUST) &
        -k(4538)*n(idx_H_DUST)*n(idx_C_DUSTH_DUSTH_DUST) &
        -k(4539)*n(idx_H_DUST)*n(idx_N_DUSTH_DUSTH_DUST) &
        -k(4540)*n(idx_H_DUST)*n(idx_C_DUSTC_DUSTH_DUST) &
        -k(4541)*n(idx_H_DUST)*n(idx_H_DUSTO_DUSTC_DUST) &
        -k(4542)*n(idx_H_DUST)*n(idx_H_DUSTC_DUSTO_DUST) &
        -k(4543)*n(idx_H_DUST)*n(idx_O_DUSTO_DUSTH_DUST) &
        -k(4544)*n(idx_H_DUST)*n(idx_O_DUSTO_DUSTO_DUST) &
        -k(4545)*n(idx_H_DUST)*n(idx_C_DUSTC_DUSTN_DUST) &
        -k(4546)*n(idx_H_DUST)*n(idx_N_DUSTN_DUSTH_DUST) &
        -k(4547)*n(idx_H_DUST)*n(idx_C_DUSTH_DUSTH_DUSTH_DUST) &
        -k(4548)*n(idx_H_DUST)*n(idx_H_DUSTH_DUSTC_DUSTO_DUST) &
        -k(4549)*n(idx_H_DUST)*n(idx_C_DUSTH_DUSTO_DUSTH_DUST) &
        -k(4550)*n(idx_H_DUST)*n(idx_H_DUSTH_DUSTO_DUSTO_DUST) &
        -k(4551)*n(idx_H_DUST)*n(idx_N_DUSTN_DUSTH_DUSTH_DUST) &
        -k(4552)*n(idx_H_DUST)*n(idx_H_DUSTC_DUSTC_DUSTN_DUST) &
        -k(4553)*n(idx_H_DUST)*n(idx_C_DUSTC_DUSTH_DUSTH_DUST) &
        -k(4554)*n(idx_H_DUST)*n(idx_C_DUSTC_DUSTH_DUSTH_DUSTH_DUST) &
        -k(4555)*n(idx_H_DUST)*n(idx_C_DUSTH_DUSTH_DUSTO_DUSTH_DUST) &
        -k(4556)*n(idx_H_DUST)*n(idx_C_DUSTH_DUSTH_DUSTC_DUSTN_DUST) &
        -k(4557)*n(idx_H_DUST)*n(idx_C_DUSTC_DUSTH_DUSTH_DUSTH_DUSTH_DUST) &
        -k(4558)*n(idx_H_DUST)*n(idx_C_DUSTC_DUSTH_DUSTH_DUSTH_DUSTH_DUSTH_DUST) &
        +k(4559)*n(idx_H_DUSTH_DUST)*n(idx_O_DUSTH_DUST) &
        +k(4566)*n(idx_C_DUST)*n(idx_O_DUSTH_DUST) &
        +k(4571)*n(idx_C_DUST)*n(idx_N_DUSTH_DUSTH_DUST) &
        +k(4587)*n(idx_O_DUST)*n(idx_H_DUSTC_DUSTO_DUST)

    !C_DUST
    !C_DUST
    dn(idx_C_DUST) = &
        +k(4433)*n(idx_C) &
        -k(4479)*n(idx_C_DUST) &
        -k(4525)*n(idx_H_DUST)*n(idx_C_DUST) &
        -2.d0*k(4560)*n(idx_C_DUST)*n(idx_C_DUST) &
        -k(4561)*n(idx_C_DUST)*n(idx_N_DUST) &
        -k(4562)*n(idx_C_DUST)*n(idx_O_DUST) &
        -k(4563)*n(idx_C_DUST)*n(idx_C_DUSTH_DUST) &
        -k(4564)*n(idx_C_DUST)*n(idx_N_DUSTH_DUST) &
        -k(4565)*n(idx_C_DUST)*n(idx_O_DUSTH_DUST) &
        -k(4566)*n(idx_C_DUST)*n(idx_O_DUSTH_DUST) &
        -k(4567)*n(idx_C_DUST)*n(idx_C_DUSTN_DUST) &
        -k(4568)*n(idx_C_DUST)*n(idx_N_DUSTO_DUST) &
        -k(4569)*n(idx_C_DUST)*n(idx_O_DUSTO_DUST) &
        -k(4570)*n(idx_C_DUST)*n(idx_C_DUSTH_DUSTH_DUST) &
        -k(4571)*n(idx_C_DUST)*n(idx_N_DUSTH_DUSTH_DUST) &
        -k(4572)*n(idx_C_DUST)*n(idx_O_DUSTC_DUSTN_DUST) &
        -k(4573)*n(idx_C_DUST)*n(idx_C_DUSTH_DUSTH_DUSTH_DUST)

    !N_DUST
    !N_DUST
    dn(idx_N_DUST) = &
        +k(4434)*n(idx_N) &
        -k(4480)*n(idx_N_DUST) &
        -k(4526)*n(idx_H_DUST)*n(idx_N_DUST) &
        -k(4561)*n(idx_C_DUST)*n(idx_N_DUST) &
        -2.d0*k(4574)*n(idx_N_DUST)*n(idx_N_DUST) &
        -k(4575)*n(idx_N_DUST)*n(idx_O_DUST) &
        -k(4576)*n(idx_N_DUST)*n(idx_C_DUSTH_DUST) &
        -k(4577)*n(idx_N_DUST)*n(idx_N_DUSTH_DUST) &
        -k(4578)*n(idx_N_DUST)*n(idx_C_DUSTC_DUST) &
        -k(4579)*n(idx_N_DUST)*n(idx_N_DUSTH_DUSTH_DUST)

    !O_DUST
    !O_DUST
    dn(idx_O_DUST) = &
        +k(4435)*n(idx_O) &
        -k(4481)*n(idx_O_DUST) &
        -k(4527)*n(idx_H_DUST)*n(idx_O_DUST) &
        -k(4562)*n(idx_C_DUST)*n(idx_O_DUST) &
        +k(4569)*n(idx_C_DUST)*n(idx_O_DUSTO_DUST) &
        -k(4575)*n(idx_N_DUST)*n(idx_O_DUST) &
        -2.d0*k(4580)*n(idx_O_DUST)*n(idx_O_DUST) &
        -k(4581)*n(idx_O_DUST)*n(idx_C_DUSTH_DUST) &
        -k(4582)*n(idx_O_DUST)*n(idx_N_DUSTH_DUST) &
        -k(4583)*n(idx_O_DUST)*n(idx_O_DUSTH_DUST) &
        -k(4584)*n(idx_O_DUST)*n(idx_C_DUSTN_DUST) &
        -k(4585)*n(idx_O_DUST)*n(idx_O_DUSTO_DUST) &
        -k(4586)*n(idx_O_DUST)*n(idx_C_DUSTO_DUST) &
        -k(4587)*n(idx_O_DUST)*n(idx_H_DUSTC_DUSTO_DUST) &
        -k(4588)*n(idx_O_DUST)*n(idx_C_DUSTH_DUSTH_DUST) &
        -k(4589)*n(idx_O_DUST)*n(idx_C_DUSTH_DUSTH_DUSTH_DUST)

    !H_DUSTH_DUST
    !H_DUSTH_DUST
    dn(idx_H_DUSTH_DUST) = &
        +k(4436)*n(idx_H2) &
        -k(4482)*n(idx_H_DUSTH_DUST) &
        +k(4524)*n(idx_H_DUST)*n(idx_H_DUST) &
        +k(4548)*n(idx_H_DUST)*n(idx_H_DUSTH_DUSTC_DUSTO_DUST) &
        +k(4551)*n(idx_H_DUST)*n(idx_N_DUSTN_DUSTH_DUSTH_DUST) &
        -k(4559)*n(idx_H_DUSTH_DUST)*n(idx_O_DUSTH_DUST)

    !C_DUSTC_DUST
    !C_DUSTC_DUST
    dn(idx_C_DUSTC_DUST) = &
        +k(4437)*n(idx_C2) &
        -k(4483)*n(idx_C_DUSTC_DUST) &
        -k(4531)*n(idx_H_DUST)*n(idx_C_DUSTC_DUST) &
        +k(4560)*n(idx_C_DUST)*n(idx_C_DUST) &
        -k(4578)*n(idx_N_DUST)*n(idx_C_DUSTC_DUST)

    !N_DUSTN_DUST
    !N_DUSTN_DUST
    dn(idx_N_DUSTN_DUST) = &
        +k(4438)*n(idx_N2) &
        -k(4484)*n(idx_N_DUSTN_DUST) &
        -k(4537)*n(idx_H_DUST)*n(idx_N_DUSTN_DUST) &
        +k(4574)*n(idx_N_DUST)*n(idx_N_DUST)

    !O_DUSTO_DUST
    !O_DUSTO_DUST
    dn(idx_O_DUSTO_DUST) = &
        +k(4439)*n(idx_O2) &
        -k(4485)*n(idx_O_DUSTO_DUST) &
        -k(4536)*n(idx_H_DUST)*n(idx_O_DUSTO_DUST) &
        +k(4544)*n(idx_H_DUST)*n(idx_O_DUSTO_DUSTO_DUST) &
        -k(4569)*n(idx_C_DUST)*n(idx_O_DUSTO_DUST) &
        +k(4580)*n(idx_O_DUST)*n(idx_O_DUST) &
        -k(4585)*n(idx_O_DUST)*n(idx_O_DUSTO_DUST)

    !C_DUSTH_DUST
    !C_DUSTH_DUST
    dn(idx_C_DUSTH_DUST) = &
        +k(4440)*n(idx_CH) &
        -k(4486)*n(idx_C_DUSTH_DUST) &
        +k(4525)*n(idx_H_DUST)*n(idx_C_DUST) &
        -k(4528)*n(idx_H_DUST)*n(idx_C_DUSTH_DUST) &
        -k(4563)*n(idx_C_DUST)*n(idx_C_DUSTH_DUST) &
        -k(4576)*n(idx_N_DUST)*n(idx_C_DUSTH_DUST) &
        -k(4581)*n(idx_O_DUST)*n(idx_C_DUSTH_DUST) &
        -2.d0*k(4590)*n(idx_C_DUSTH_DUST)*n(idx_C_DUSTH_DUST) &
        -k(4591)*n(idx_C_DUSTH_DUST)*n(idx_O_DUSTH_DUST) &
        -k(4592)*n(idx_C_DUSTH_DUST)*n(idx_H_DUSTN_DUSTO_DUST) &
        -k(4593)*n(idx_C_DUSTH_DUST)*n(idx_C_DUSTH_DUSTH_DUSTH_DUST)

    !N_DUSTH_DUST
    !N_DUSTH_DUST
    dn(idx_N_DUSTH_DUST) = &
        +k(4441)*n(idx_NH) &
        -k(4487)*n(idx_N_DUSTH_DUST) &
        +k(4526)*n(idx_H_DUST)*n(idx_N_DUST) &
        -k(4529)*n(idx_H_DUST)*n(idx_N_DUSTH_DUST) &
        -k(4564)*n(idx_C_DUST)*n(idx_N_DUSTH_DUST) &
        -k(4577)*n(idx_N_DUST)*n(idx_N_DUSTH_DUST) &
        -k(4582)*n(idx_O_DUST)*n(idx_N_DUSTH_DUST)

    !O_DUSTH_DUST
    !O_DUSTH_DUST
    dn(idx_O_DUSTH_DUST) = &
        +k(4442)*n(idx_OH) &
        -k(4488)*n(idx_O_DUSTH_DUST) &
        +k(4527)*n(idx_H_DUST)*n(idx_O_DUST) &
        -k(4530)*n(idx_H_DUST)*n(idx_O_DUSTH_DUST) &
        +k(4544)*n(idx_H_DUST)*n(idx_O_DUSTO_DUSTO_DUST) &
        +k(4550)*n(idx_H_DUST)*n(idx_H_DUSTH_DUSTO_DUSTO_DUST) &
        -k(4559)*n(idx_H_DUSTH_DUST)*n(idx_O_DUSTH_DUST) &
        -k(4565)*n(idx_C_DUST)*n(idx_O_DUSTH_DUST) &
        -k(4566)*n(idx_C_DUST)*n(idx_O_DUSTH_DUST) &
        -k(4583)*n(idx_O_DUST)*n(idx_O_DUSTH_DUST) &
        -k(4591)*n(idx_C_DUSTH_DUST)*n(idx_O_DUSTH_DUST) &
        -2.d0*k(4594)*n(idx_O_DUSTH_DUST)*n(idx_O_DUSTH_DUST) &
        -k(4595)*n(idx_O_DUSTH_DUST)*n(idx_C_DUSTH_DUSTH_DUST)

    !C_DUSTN_DUST
    !C_DUSTN_DUST
    dn(idx_C_DUSTN_DUST) = &
        +k(4443)*n(idx_CN) &
        -k(4489)*n(idx_C_DUSTN_DUST) &
        -k(4532)*n(idx_H_DUST)*n(idx_C_DUSTN_DUST) &
        +k(4561)*n(idx_C_DUST)*n(idx_N_DUST) &
        -k(4567)*n(idx_C_DUST)*n(idx_C_DUSTN_DUST) &
        +k(4572)*n(idx_C_DUST)*n(idx_O_DUSTC_DUSTN_DUST) &
        -k(4584)*n(idx_O_DUST)*n(idx_C_DUSTN_DUST)

    !C_DUSTO_DUST
    !C_DUSTO_DUST
    dn(idx_C_DUSTO_DUST) = &
        +k(4444)*n(idx_CO) &
        -k(4490)*n(idx_C_DUSTO_DUST) &
        -k(4533)*n(idx_H_DUST)*n(idx_C_DUSTO_DUST) &
        -k(4534)*n(idx_H_DUST)*n(idx_C_DUSTO_DUST) &
        +k(4562)*n(idx_C_DUST)*n(idx_O_DUST) &
        +k(4566)*n(idx_C_DUST)*n(idx_O_DUSTH_DUST) &
        +k(4569)*n(idx_C_DUST)*n(idx_O_DUSTO_DUST) &
        +k(4572)*n(idx_C_DUST)*n(idx_O_DUSTC_DUSTN_DUST) &
        -k(4586)*n(idx_O_DUST)*n(idx_C_DUSTO_DUST)

    !N_DUSTO_DUST
    !N_DUSTO_DUST
    dn(idx_N_DUSTO_DUST) = &
        +k(4445)*n(idx_NO) &
        -k(4491)*n(idx_N_DUSTO_DUST) &
        -k(4535)*n(idx_H_DUST)*n(idx_N_DUSTO_DUST) &
        -k(4568)*n(idx_C_DUST)*n(idx_N_DUSTO_DUST) &
        +k(4575)*n(idx_N_DUST)*n(idx_O_DUST) &
        +k(4592)*n(idx_C_DUSTH_DUST)*n(idx_H_DUSTN_DUSTO_DUST)

    !O3
    !O3
    dn(idx_O3) = &
        -k(4446)*n(idx_O3) &
        +k(4492)*n(idx_O_DUSTO_DUSTO_DUST)

    !O_DUSTO_DUSTO_DUST
    !O_DUSTO_DUSTO_DUST
    dn(idx_O_DUSTO_DUSTO_DUST) = &
        +k(4446)*n(idx_O3) &
        -k(4492)*n(idx_O_DUSTO_DUSTO_DUST) &
        -k(4544)*n(idx_H_DUST)*n(idx_O_DUSTO_DUSTO_DUST) &
        +k(4585)*n(idx_O_DUST)*n(idx_O_DUSTO_DUST)

    !C_DUSTC_DUSTH_DUST
    !C_DUSTC_DUSTH_DUST
    dn(idx_C_DUSTC_DUSTH_DUST) = &
        +k(4447)*n(idx_C2H) &
        -k(4493)*n(idx_C_DUSTC_DUSTH_DUST) &
        +k(4531)*n(idx_H_DUST)*n(idx_C_DUSTC_DUST) &
        -k(4540)*n(idx_H_DUST)*n(idx_C_DUSTC_DUSTH_DUST) &
        +k(4563)*n(idx_C_DUST)*n(idx_C_DUSTH_DUST)

    !N2H
    !N2H
    dn(idx_N2H) = &
        -k(4448)*n(idx_N2H) &
        +k(4494)*n(idx_N_DUSTN_DUSTH_DUST)

    !N_DUSTN_DUSTH_DUST
    !N_DUSTN_DUSTH_DUST
    dn(idx_N_DUSTN_DUSTH_DUST) = &
        +k(4448)*n(idx_N2H) &
        -k(4494)*n(idx_N_DUSTN_DUSTH_DUST) &
        +k(4537)*n(idx_H_DUST)*n(idx_N_DUSTN_DUST) &
        -k(4546)*n(idx_H_DUST)*n(idx_N_DUSTN_DUSTH_DUST) &
        +k(4551)*n(idx_H_DUST)*n(idx_N_DUSTN_DUSTH_DUSTH_DUST) &
        +k(4577)*n(idx_N_DUST)*n(idx_N_DUSTH_DUST)

    !O_DUSTO_DUSTH_DUST
    !O_DUSTO_DUSTH_DUST
    dn(idx_O_DUSTO_DUSTH_DUST) = &
        +k(4449)*n(idx_O2H) &
        -k(4495)*n(idx_O_DUSTO_DUSTH_DUST) &
        +k(4536)*n(idx_H_DUST)*n(idx_O_DUSTO_DUST) &
        -k(4543)*n(idx_H_DUST)*n(idx_O_DUSTO_DUSTH_DUST) &
        +k(4583)*n(idx_O_DUST)*n(idx_O_DUSTH_DUST)

    !C_DUSTH_DUSTH_DUST
    !C_DUSTH_DUSTH_DUST
    dn(idx_C_DUSTH_DUSTH_DUST) = &
        +k(4450)*n(idx_CH2) &
        -k(4496)*n(idx_C_DUSTH_DUSTH_DUST) &
        +k(4528)*n(idx_H_DUST)*n(idx_C_DUSTH_DUST) &
        -k(4538)*n(idx_H_DUST)*n(idx_C_DUSTH_DUSTH_DUST) &
        -k(4570)*n(idx_C_DUST)*n(idx_C_DUSTH_DUSTH_DUST) &
        -k(4588)*n(idx_O_DUST)*n(idx_C_DUSTH_DUSTH_DUST) &
        +k(4592)*n(idx_C_DUSTH_DUST)*n(idx_H_DUSTN_DUSTO_DUST) &
        -k(4595)*n(idx_O_DUSTH_DUST)*n(idx_C_DUSTH_DUSTH_DUST)

    !N_DUSTH_DUSTH_DUST
    !N_DUSTH_DUSTH_DUST
    dn(idx_N_DUSTH_DUSTH_DUST) = &
        +k(4451)*n(idx_NH2) &
        -k(4497)*n(idx_N_DUSTH_DUSTH_DUST) &
        +k(4529)*n(idx_H_DUST)*n(idx_N_DUSTH_DUST) &
        -k(4539)*n(idx_H_DUST)*n(idx_N_DUSTH_DUSTH_DUST) &
        -k(4571)*n(idx_C_DUST)*n(idx_N_DUSTH_DUSTH_DUST) &
        -k(4579)*n(idx_N_DUST)*n(idx_N_DUSTH_DUSTH_DUST)

    !H_DUSTH_DUSTO_DUST
    !H_DUSTH_DUSTO_DUST
    dn(idx_H_DUSTH_DUSTO_DUST) = &
        +k(4452)*n(idx_H2O) &
        -k(4498)*n(idx_H_DUSTH_DUSTO_DUST) &
        +k(4530)*n(idx_H_DUST)*n(idx_O_DUSTH_DUST) &
        +k(4550)*n(idx_H_DUST)*n(idx_H_DUSTH_DUSTO_DUSTO_DUST) &
        +k(4559)*n(idx_H_DUSTH_DUST)*n(idx_O_DUSTH_DUST)

    !C_DUSTC_DUSTN_DUST
    !C_DUSTC_DUSTN_DUST
    dn(idx_C_DUSTC_DUSTN_DUST) = &
        +k(4453)*n(idx_C2N) &
        -k(4499)*n(idx_C_DUSTC_DUSTN_DUST) &
        -k(4545)*n(idx_H_DUST)*n(idx_C_DUSTC_DUSTN_DUST) &
        +k(4567)*n(idx_C_DUST)*n(idx_C_DUSTN_DUST) &
        +k(4578)*n(idx_N_DUST)*n(idx_C_DUSTC_DUST)

    !C_DUSTO_DUSTO_DUST
    !C_DUSTO_DUSTO_DUST
    dn(idx_C_DUSTO_DUSTO_DUST) = &
        +k(4454)*n(idx_CO2) &
        -k(4500)*n(idx_C_DUSTO_DUSTO_DUST) &
        +k(4586)*n(idx_O_DUST)*n(idx_C_DUSTO_DUST) &
        +k(4587)*n(idx_O_DUST)*n(idx_H_DUSTC_DUSTO_DUST)

    !H_DUSTC_DUSTN_DUST
    !H_DUSTC_DUSTN_DUST
    dn(idx_H_DUSTC_DUSTN_DUST) = &
        +k(4455)*n(idx_HCN) &
        -k(4501)*n(idx_H_DUSTC_DUSTN_DUST) &
        +k(4532)*n(idx_H_DUST)*n(idx_C_DUSTN_DUST) &
        +k(4576)*n(idx_N_DUST)*n(idx_C_DUSTH_DUST)

    !H_DUSTN_DUSTC_DUST
    !H_DUSTN_DUSTC_DUST
    dn(idx_H_DUSTN_DUSTC_DUST) = &
        +k(4456)*n(idx_HNC) &
        -k(4502)*n(idx_H_DUSTN_DUSTC_DUST) &
        +k(4564)*n(idx_C_DUST)*n(idx_N_DUSTH_DUST) &
        +k(4571)*n(idx_C_DUST)*n(idx_N_DUSTH_DUSTH_DUST)

    !H_DUSTC_DUSTO_DUST
    !H_DUSTC_DUSTO_DUST
    dn(idx_H_DUSTC_DUSTO_DUST) = &
        +k(4457)*n(idx_HCO) &
        -k(4503)*n(idx_H_DUSTC_DUSTO_DUST) &
        +k(4534)*n(idx_H_DUST)*n(idx_C_DUSTO_DUST) &
        -k(4542)*n(idx_H_DUST)*n(idx_H_DUSTC_DUSTO_DUST) &
        +k(4548)*n(idx_H_DUST)*n(idx_H_DUSTH_DUSTC_DUSTO_DUST) &
        +k(4581)*n(idx_O_DUST)*n(idx_C_DUSTH_DUST) &
        -k(4587)*n(idx_O_DUST)*n(idx_H_DUSTC_DUSTO_DUST)

    !HOC
    !HOC
    dn(idx_HOC) = &
        -k(4458)*n(idx_HOC) &
        +k(4504)*n(idx_H_DUSTO_DUSTC_DUST)

    !H_DUSTO_DUSTC_DUST
    !H_DUSTO_DUSTC_DUST
    dn(idx_H_DUSTO_DUSTC_DUST) = &
        +k(4458)*n(idx_HOC) &
        -k(4504)*n(idx_H_DUSTO_DUSTC_DUST) &
        +k(4533)*n(idx_H_DUST)*n(idx_C_DUSTO_DUST) &
        -k(4541)*n(idx_H_DUST)*n(idx_H_DUSTO_DUSTC_DUST) &
        +k(4565)*n(idx_C_DUST)*n(idx_O_DUSTH_DUST)

    !H_DUSTN_DUSTO_DUST
    !H_DUSTN_DUSTO_DUST
    dn(idx_H_DUSTN_DUSTO_DUST) = &
        +k(4459)*n(idx_HNO) &
        -k(4505)*n(idx_H_DUSTN_DUSTO_DUST) &
        +k(4535)*n(idx_H_DUST)*n(idx_N_DUSTO_DUST) &
        +k(4582)*n(idx_O_DUST)*n(idx_N_DUSTH_DUST) &
        -k(4592)*n(idx_C_DUSTH_DUST)*n(idx_H_DUSTN_DUSTO_DUST)

    !O_DUSTC_DUSTN_DUST
    !O_DUSTC_DUSTN_DUST
    dn(idx_O_DUSTC_DUSTN_DUST) = &
        +k(4460)*n(idx_OCN) &
        -k(4506)*n(idx_O_DUSTC_DUSTN_DUST) &
        +k(4568)*n(idx_C_DUST)*n(idx_N_DUSTO_DUST) &
        -k(4572)*n(idx_C_DUST)*n(idx_O_DUSTC_DUSTN_DUST) &
        +k(4584)*n(idx_O_DUST)*n(idx_C_DUSTN_DUST)

    !C_DUSTH_DUSTH_DUSTH_DUST
    !C_DUSTH_DUSTH_DUSTH_DUST
    dn(idx_C_DUSTH_DUSTH_DUSTH_DUST) = &
        +k(4461)*n(idx_CH3) &
        -k(4507)*n(idx_C_DUSTH_DUSTH_DUSTH_DUST) &
        +k(4538)*n(idx_H_DUST)*n(idx_C_DUSTH_DUSTH_DUST) &
        -k(4547)*n(idx_H_DUST)*n(idx_C_DUSTH_DUSTH_DUSTH_DUST) &
        -k(4573)*n(idx_C_DUST)*n(idx_C_DUSTH_DUSTH_DUSTH_DUST) &
        -k(4589)*n(idx_O_DUST)*n(idx_C_DUSTH_DUSTH_DUSTH_DUST) &
        -k(4593)*n(idx_C_DUSTH_DUST)*n(idx_C_DUSTH_DUSTH_DUSTH_DUST)

    !N_DUSTH_DUSTH_DUSTH_DUST
    !N_DUSTH_DUSTH_DUSTH_DUST
    dn(idx_N_DUSTH_DUSTH_DUSTH_DUST) = &
        +k(4462)*n(idx_NH3) &
        -k(4508)*n(idx_N_DUSTH_DUSTH_DUSTH_DUST) &
        +k(4539)*n(idx_H_DUST)*n(idx_N_DUSTH_DUSTH_DUST)

    !C_DUSTC_DUSTH_DUSTH_DUST
    !C_DUSTC_DUSTH_DUSTH_DUST
    dn(idx_C_DUSTC_DUSTH_DUSTH_DUST) = &
        +k(4463)*n(idx_C2H2) &
        -k(4509)*n(idx_C_DUSTC_DUSTH_DUSTH_DUST) &
        +k(4540)*n(idx_H_DUST)*n(idx_C_DUSTC_DUSTH_DUST) &
        -k(4553)*n(idx_H_DUST)*n(idx_C_DUSTC_DUSTH_DUSTH_DUST) &
        +k(4570)*n(idx_C_DUST)*n(idx_C_DUSTH_DUSTH_DUST) &
        +k(4590)*n(idx_C_DUSTH_DUST)*n(idx_C_DUSTH_DUST)

    !N2H2
    !N2H2
    dn(idx_N2H2) = &
        -k(4464)*n(idx_N2H2) &
        +k(4510)*n(idx_N_DUSTN_DUSTH_DUSTH_DUST)

    !N_DUSTN_DUSTH_DUSTH_DUST
    !N_DUSTN_DUSTH_DUSTH_DUST
    dn(idx_N_DUSTN_DUSTH_DUSTH_DUST) = &
        +k(4464)*n(idx_N2H2) &
        -k(4510)*n(idx_N_DUSTN_DUSTH_DUSTH_DUST) &
        +k(4546)*n(idx_H_DUST)*n(idx_N_DUSTN_DUSTH_DUST) &
        -k(4551)*n(idx_H_DUST)*n(idx_N_DUSTN_DUSTH_DUSTH_DUST) &
        +k(4579)*n(idx_N_DUST)*n(idx_N_DUSTH_DUSTH_DUST)

    !H_DUSTH_DUSTO_DUSTO_DUST
    !H_DUSTH_DUSTO_DUSTO_DUST
    dn(idx_H_DUSTH_DUSTO_DUSTO_DUST) = &
        +k(4465)*n(idx_H2O2) &
        -k(4511)*n(idx_H_DUSTH_DUSTO_DUSTO_DUST) &
        +k(4543)*n(idx_H_DUST)*n(idx_O_DUSTO_DUSTH_DUST) &
        -k(4550)*n(idx_H_DUST)*n(idx_H_DUSTH_DUSTO_DUSTO_DUST) &
        +k(4594)*n(idx_O_DUSTH_DUST)*n(idx_O_DUSTH_DUST)

    !H_DUSTH_DUSTC_DUSTO_DUST
    !H_DUSTH_DUSTC_DUSTO_DUST
    dn(idx_H_DUSTH_DUSTC_DUSTO_DUST) = &
        +k(4466)*n(idx_H2CO) &
        -k(4512)*n(idx_H_DUSTH_DUSTC_DUSTO_DUST) &
        +k(4542)*n(idx_H_DUST)*n(idx_H_DUSTC_DUSTO_DUST) &
        -k(4548)*n(idx_H_DUST)*n(idx_H_DUSTH_DUSTC_DUSTO_DUST) &
        +k(4588)*n(idx_O_DUST)*n(idx_C_DUSTH_DUSTH_DUST)

    !CHOH
    !CHOH
    dn(idx_CHOH) = &
        -k(4467)*n(idx_CHOH) &
        +k(4513)*n(idx_C_DUSTH_DUSTO_DUSTH_DUST)

    !C_DUSTH_DUSTO_DUSTH_DUST
    !C_DUSTH_DUSTO_DUSTH_DUST
    dn(idx_C_DUSTH_DUSTO_DUSTH_DUST) = &
        +k(4467)*n(idx_CHOH) &
        -k(4513)*n(idx_C_DUSTH_DUSTO_DUSTH_DUST) &
        +k(4541)*n(idx_H_DUST)*n(idx_H_DUSTO_DUSTC_DUST) &
        -k(4549)*n(idx_H_DUST)*n(idx_C_DUSTH_DUSTO_DUSTH_DUST) &
        +k(4591)*n(idx_C_DUSTH_DUST)*n(idx_O_DUSTH_DUST)

    !HCCN
    !HCCN
    dn(idx_HCCN) = &
        -k(4468)*n(idx_HCCN) &
        +k(4514)*n(idx_H_DUSTC_DUSTC_DUSTN_DUST)

    !H_DUSTC_DUSTC_DUSTN_DUST
    !H_DUSTC_DUSTC_DUSTN_DUST
    dn(idx_H_DUSTC_DUSTC_DUSTN_DUST) = &
        +k(4468)*n(idx_HCCN) &
        -k(4514)*n(idx_H_DUSTC_DUSTC_DUSTN_DUST) &
        +k(4545)*n(idx_H_DUST)*n(idx_C_DUSTC_DUSTN_DUST) &
        -k(4552)*n(idx_H_DUST)*n(idx_H_DUSTC_DUSTC_DUSTN_DUST)

    !C_DUSTH_DUSTH_DUSTH_DUSTH_DUST
    !C_DUSTH_DUSTH_DUSTH_DUSTH_DUST
    dn(idx_C_DUSTH_DUSTH_DUSTH_DUSTH_DUST) = &
        +k(4469)*n(idx_CH4) &
        -k(4515)*n(idx_C_DUSTH_DUSTH_DUSTH_DUSTH_DUST) &
        +k(4547)*n(idx_H_DUST)*n(idx_C_DUSTH_DUSTH_DUSTH_DUST)

    !C_DUSTC_DUSTH_DUSTH_DUSTH_DUST
    !C_DUSTC_DUSTH_DUSTH_DUSTH_DUST
    dn(idx_C_DUSTC_DUSTH_DUSTH_DUSTH_DUST) = &
        +k(4470)*n(idx_C2H3) &
        -k(4516)*n(idx_C_DUSTC_DUSTH_DUSTH_DUSTH_DUST) &
        +k(4553)*n(idx_H_DUST)*n(idx_C_DUSTC_DUSTH_DUSTH_DUST) &
        -k(4554)*n(idx_H_DUST)*n(idx_C_DUSTC_DUSTH_DUSTH_DUSTH_DUST) &
        +k(4573)*n(idx_C_DUST)*n(idx_C_DUSTH_DUSTH_DUSTH_DUST)

    !CH2OH
    !CH2OH
    dn(idx_CH2OH) = &
        -k(4471)*n(idx_CH2OH) &
        +k(4517)*n(idx_C_DUSTH_DUSTH_DUSTO_DUSTH_DUST)

    !C_DUSTH_DUSTH_DUSTO_DUSTH_DUST
    !C_DUSTH_DUSTH_DUSTO_DUSTH_DUST
    dn(idx_C_DUSTH_DUSTH_DUSTO_DUSTH_DUST) = &
        +k(4471)*n(idx_CH2OH) &
        -k(4517)*n(idx_C_DUSTH_DUSTH_DUSTO_DUSTH_DUST) &
        +k(4549)*n(idx_H_DUST)*n(idx_C_DUSTH_DUSTO_DUSTH_DUST) &
        -k(4555)*n(idx_H_DUST)*n(idx_C_DUSTH_DUSTH_DUSTO_DUSTH_DUST) &
        +k(4589)*n(idx_O_DUST)*n(idx_C_DUSTH_DUSTH_DUSTH_DUST) &
        +k(4595)*n(idx_O_DUSTH_DUST)*n(idx_C_DUSTH_DUSTH_DUST)

    !C_DUSTH_DUSTH_DUSTC_DUSTN_DUST
    !C_DUSTH_DUSTH_DUSTC_DUSTN_DUST
    dn(idx_C_DUSTH_DUSTH_DUSTC_DUSTN_DUST) = &
        +k(4472)*n(idx_CH2CN) &
        -k(4518)*n(idx_C_DUSTH_DUSTH_DUSTC_DUSTN_DUST) &
        +k(4552)*n(idx_H_DUST)*n(idx_H_DUSTC_DUSTC_DUSTN_DUST) &
        -k(4556)*n(idx_H_DUST)*n(idx_C_DUSTH_DUSTH_DUSTC_DUSTN_DUST)

    !C_DUSTC_DUSTH_DUSTH_DUSTH_DUSTH_DUST
    !C_DUSTC_DUSTH_DUSTH_DUSTH_DUSTH_DUST
    dn(idx_C_DUSTC_DUSTH_DUSTH_DUSTH_DUSTH_DUST) = &
        +k(4473)*n(idx_C2H4) &
        -k(4519)*n(idx_C_DUSTC_DUSTH_DUSTH_DUSTH_DUSTH_DUST) &
        +k(4554)*n(idx_H_DUST)*n(idx_C_DUSTC_DUSTH_DUSTH_DUSTH_DUST) &
        -k(4557)*n(idx_H_DUST)*n(idx_C_DUSTC_DUSTH_DUSTH_DUSTH_DUSTH_DUST) &
        +k(4593)*n(idx_C_DUSTH_DUST)*n(idx_C_DUSTH_DUSTH_DUSTH_DUST)

    !C_DUSTH_DUSTH_DUSTH_DUSTO_DUSTH_DUST
    !C_DUSTH_DUSTH_DUSTH_DUSTO_DUSTH_DUST
    dn(idx_C_DUSTH_DUSTH_DUSTH_DUSTO_DUSTH_DUST) = &
        +k(4474)*n(idx_CH3OH) &
        -k(4520)*n(idx_C_DUSTH_DUSTH_DUSTH_DUSTO_DUSTH_DUST) &
        +k(4555)*n(idx_H_DUST)*n(idx_C_DUSTH_DUSTH_DUSTO_DUSTH_DUST)

    !C_DUSTH_DUSTH_DUSTH_DUSTC_DUSTN_DUST
    !C_DUSTH_DUSTH_DUSTH_DUSTC_DUSTN_DUST
    dn(idx_C_DUSTH_DUSTH_DUSTH_DUSTC_DUSTN_DUST) = &
        +k(4475)*n(idx_CH3CN) &
        -k(4521)*n(idx_C_DUSTH_DUSTH_DUSTH_DUSTC_DUSTN_DUST) &
        +k(4556)*n(idx_H_DUST)*n(idx_C_DUSTH_DUSTH_DUSTC_DUSTN_DUST)

    !C_DUSTC_DUSTH_DUSTH_DUSTH_DUSTH_DUSTH_DUST
    !C_DUSTC_DUSTH_DUSTH_DUSTH_DUSTH_DUSTH_DUST
    dn(idx_C_DUSTC_DUSTH_DUSTH_DUSTH_DUSTH_DUSTH_DUST) = &
        +k(4476)*n(idx_C2H5) &
        -k(4522)*n(idx_C_DUSTC_DUSTH_DUSTH_DUSTH_DUSTH_DUSTH_DUST) &
        +k(4557)*n(idx_H_DUST)*n(idx_C_DUSTC_DUSTH_DUSTH_DUSTH_DUSTH_DUST) &
        -k(4558)*n(idx_H_DUST)*n(idx_C_DUSTC_DUSTH_DUSTH_DUSTH_DUSTH_DUSTH_DUST)

    !C2H6
    !C2H6
    dn(idx_C2H6) = &
        -k(4477)*n(idx_C2H6) &
        +k(4523)*n(idx_C_DUSTC_DUSTH_DUSTH_DUSTH_DUSTH_DUSTH_DUSTH_DUST)

    !C_DUSTC_DUSTH_DUSTH_DUSTH_DUSTH_DUSTH_DUSTH_DUST
    !C_DUSTC_DUSTH_DUSTH_DUSTH_DUSTH_DUSTH_DUSTH_DUST
    dn(idx_C_DUSTC_DUSTH_DUSTH_DUSTH_DUSTH_DUSTH_DUSTH_DUST) = &
        +k(4477)*n(idx_C2H6) &
        -k(4523)*n(idx_C_DUSTC_DUSTH_DUSTH_DUSTH_DUSTH_DUSTH_DUSTH_DUST) &
        +k(4558)*n(idx_H_DUST)*n(idx_C_DUSTC_DUSTH_DUSTH_DUSTH_DUSTH_DUSTH_DUST)

    !C+
    !C+
    dn(idx_Cj) = &
        -k(2)*n(idx_Cj)*n(idx_GRAINk) &
        +k(14)*n(idx_C) &
        -k(201)*n(idx_Cj)*n(idx_FE) &
        -k(202)*n(idx_Cj)*n(idx_MG) &
        -k(203)*n(idx_Cj)*n(idx_NA) &
        -k(204)*n(idx_Cj)*n(idx_P) &
        -k(205)*n(idx_Cj)*n(idx_S) &
        -k(206)*n(idx_Cj)*n(idx_SI) &
        -k(207)*n(idx_Cj)*n(idx_CCL) &
        -k(208)*n(idx_Cj)*n(idx_CH) &
        -k(209)*n(idx_Cj)*n(idx_CH) &
        -k(210)*n(idx_Cj)*n(idx_CLO) &
        -k(211)*n(idx_Cj)*n(idx_CP) &
        -k(212)*n(idx_Cj)*n(idx_HCL) &
        -k(213)*n(idx_Cj)*n(idx_HF) &
        -k(214)*n(idx_Cj)*n(idx_HS) &
        -k(215)*n(idx_Cj)*n(idx_MGH) &
        -k(216)*n(idx_Cj)*n(idx_NAH) &
        -k(217)*n(idx_Cj)*n(idx_NH) &
        -k(218)*n(idx_Cj)*n(idx_NO) &
        -k(219)*n(idx_Cj)*n(idx_NS) &
        -k(220)*n(idx_Cj)*n(idx_NS) &
        -k(221)*n(idx_Cj)*n(idx_O2) &
        -k(222)*n(idx_Cj)*n(idx_O2) &
        -k(223)*n(idx_Cj)*n(idx_OH) &
        -k(224)*n(idx_Cj)*n(idx_PH) &
        -k(225)*n(idx_Cj)*n(idx_PO) &
        -k(226)*n(idx_Cj)*n(idx_SIC) &
        -k(227)*n(idx_Cj)*n(idx_SIC) &
        -k(228)*n(idx_Cj)*n(idx_SIH) &
        -k(229)*n(idx_Cj)*n(idx_SIN) &
        -k(230)*n(idx_Cj)*n(idx_SIN) &
        -k(231)*n(idx_Cj)*n(idx_SIO) &
        -k(232)*n(idx_Cj)*n(idx_SIS) &
        -k(233)*n(idx_Cj)*n(idx_SIS) &
        -k(234)*n(idx_Cj)*n(idx_SO) &
        -k(235)*n(idx_Cj)*n(idx_SO) &
        -k(236)*n(idx_Cj)*n(idx_SO) &
        -k(237)*n(idx_Cj)*n(idx_SO) &
        -k(238)*n(idx_Cj)*n(idx_C2H) &
        -k(239)*n(idx_Cj)*n(idx_C2S) &
        -k(240)*n(idx_Cj)*n(idx_C2S) &
        -k(241)*n(idx_Cj)*n(idx_CCO) &
        -k(242)*n(idx_Cj)*n(idx_CCP) &
        -k(243)*n(idx_Cj)*n(idx_CCP) &
        -k(244)*n(idx_Cj)*n(idx_CH2) &
        -k(245)*n(idx_Cj)*n(idx_CH2) &
        -k(246)*n(idx_Cj)*n(idx_CO2) &
        -k(247)*n(idx_Cj)*n(idx_H2O) &
        -k(248)*n(idx_Cj)*n(idx_H2O) &
        -k(249)*n(idx_Cj)*n(idx_H2S) &
        -k(250)*n(idx_Cj)*n(idx_H2S) &
        -k(251)*n(idx_Cj)*n(idx_HCN) &
        -k(252)*n(idx_Cj)*n(idx_HCN) &
        -k(253)*n(idx_Cj)*n(idx_HCO) &
        -k(254)*n(idx_Cj)*n(idx_HCO) &
        -k(255)*n(idx_Cj)*n(idx_HCP) &
        -k(256)*n(idx_Cj)*n(idx_HCP) &
        -k(257)*n(idx_Cj)*n(idx_HCSI) &
        -k(258)*n(idx_Cj)*n(idx_HNC) &
        -k(259)*n(idx_Cj)*n(idx_HNSI) &
        -k(260)*n(idx_Cj)*n(idx_HPO) &
        -k(261)*n(idx_Cj)*n(idx_NAOH) &
        -k(262)*n(idx_Cj)*n(idx_NH2) &
        -k(263)*n(idx_Cj)*n(idx_OCN) &
        -k(264)*n(idx_Cj)*n(idx_OCS) &
        -k(265)*n(idx_Cj)*n(idx_OCS) &
        -k(266)*n(idx_Cj)*n(idx_SIC2) &
        -k(267)*n(idx_Cj)*n(idx_SIH2) &
        -k(268)*n(idx_Cj)*n(idx_SIH2) &
        -k(269)*n(idx_Cj)*n(idx_SIH2) &
        -k(270)*n(idx_Cj)*n(idx_SO2) &
        -k(271)*n(idx_Cj)*n(idx_C2H2) &
        -k(272)*n(idx_Cj)*n(idx_C3H) &
        -k(273)*n(idx_Cj)*n(idx_HC3) &
        -k(274)*n(idx_Cj)*n(idx_C3O) &
        -k(275)*n(idx_Cj)*n(idx_C3O) &
        -k(276)*n(idx_Cj)*n(idx_C3O) &
        -k(277)*n(idx_Cj)*n(idx_C3P) &
        -k(278)*n(idx_Cj)*n(idx_C3S) &
        -k(279)*n(idx_Cj)*n(idx_C3S) &
        -k(280)*n(idx_Cj)*n(idx_CH3) &
        -k(281)*n(idx_Cj)*n(idx_CH3) &
        -k(282)*n(idx_Cj)*n(idx_CH3) &
        -k(283)*n(idx_Cj)*n(idx_H2CO) &
        -k(284)*n(idx_Cj)*n(idx_H2CO) &
        -k(285)*n(idx_Cj)*n(idx_H2CO) &
        -k(286)*n(idx_Cj)*n(idx_H2CS) &
        -k(287)*n(idx_Cj)*n(idx_H2SIO) &
        -k(288)*n(idx_Cj)*n(idx_HCCP) &
        -k(289)*n(idx_Cj)*n(idx_HCCP) &
        -k(290)*n(idx_Cj)*n(idx_NH3) &
        -k(291)*n(idx_Cj)*n(idx_NH3) &
        -k(292)*n(idx_Cj)*n(idx_NH3) &
        -k(293)*n(idx_Cj)*n(idx_SIC2H) &
        -k(294)*n(idx_Cj)*n(idx_SIC2H) &
        -k(295)*n(idx_Cj)*n(idx_SIC3) &
        -k(296)*n(idx_Cj)*n(idx_SICH2) &
        -k(297)*n(idx_Cj)*n(idx_SICH2) &
        -k(298)*n(idx_Cj)*n(idx_SICH2) &
        -k(299)*n(idx_Cj)*n(idx_SIH3) &
        -k(300)*n(idx_Cj)*n(idx_SIH3) &
        -k(301)*n(idx_Cj)*n(idx_SIH3) &
        -k(302)*n(idx_Cj)*n(idx_CH2CN) &
        -k(303)*n(idx_Cj)*n(idx_C2H2O) &
        -k(304)*n(idx_Cj)*n(idx_C2H3) &
        -k(305)*n(idx_Cj)*n(idx_C2H3) &
        -k(306)*n(idx_Cj)*n(idx_C2H3) &
        -k(307)*n(idx_Cj)*n(idx_C2H3) &
        -k(308)*n(idx_Cj)*n(idx_C3H2) &
        -k(309)*n(idx_Cj)*n(idx_H2C3) &
        -k(310)*n(idx_Cj)*n(idx_C3H2) &
        -k(311)*n(idx_Cj)*n(idx_H2C3) &
        -k(312)*n(idx_Cj)*n(idx_C4H) &
        -k(313)*n(idx_Cj)*n(idx_C4P) &
        -k(314)*n(idx_Cj)*n(idx_C4S) &
        -k(315)*n(idx_Cj)*n(idx_C4S) &
        -k(316)*n(idx_Cj)*n(idx_CH2PH) &
        -k(317)*n(idx_Cj)*n(idx_CH3N) &
        -k(318)*n(idx_Cj)*n(idx_CH4) &
        -k(319)*n(idx_Cj)*n(idx_CH4) &
        -k(320)*n(idx_Cj)*n(idx_HCNC2) &
        -k(321)*n(idx_Cj)*n(idx_HCNC2) &
        -k(322)*n(idx_Cj)*n(idx_HCNC2) &
        -k(323)*n(idx_Cj)*n(idx_HCNC2) &
        -k(324)*n(idx_Cj)*n(idx_HCNC2) &
        -k(325)*n(idx_Cj)*n(idx_HC2NC) &
        -k(326)*n(idx_Cj)*n(idx_HC2NC) &
        -k(327)*n(idx_Cj)*n(idx_HC2NC) &
        -k(328)*n(idx_Cj)*n(idx_HC2NC) &
        -k(329)*n(idx_Cj)*n(idx_HC2NC) &
        -k(330)*n(idx_Cj)*n(idx_HC3N) &
        -k(331)*n(idx_Cj)*n(idx_HC3N) &
        -k(332)*n(idx_Cj)*n(idx_HC3N) &
        -k(333)*n(idx_Cj)*n(idx_HNC3) &
        -k(334)*n(idx_Cj)*n(idx_HNC3) &
        -k(335)*n(idx_Cj)*n(idx_HNC3) &
        -k(336)*n(idx_Cj)*n(idx_HNC3) &
        -k(337)*n(idx_Cj)*n(idx_SIC2H2) &
        -k(338)*n(idx_Cj)*n(idx_SIC3H) &
        -k(339)*n(idx_Cj)*n(idx_SICH3) &
        -k(340)*n(idx_Cj)*n(idx_SICH3) &
        -k(341)*n(idx_Cj)*n(idx_SICH3) &
        -k(342)*n(idx_Cj)*n(idx_SIH4) &
        -k(343)*n(idx_Cj)*n(idx_SIH4) &
        -k(344)*n(idx_Cj)*n(idx_CH3CN) &
        -k(345)*n(idx_Cj)*n(idx_CH3CN) &
        -k(346)*n(idx_Cj)*n(idx_C2H4) &
        -k(347)*n(idx_Cj)*n(idx_C2H4) &
        -k(348)*n(idx_Cj)*n(idx_C2H4) &
        -k(349)*n(idx_Cj)*n(idx_C2H4) &
        -k(350)*n(idx_Cj)*n(idx_C2H4) &
        -k(351)*n(idx_Cj)*n(idx_C2H4) &
        -k(352)*n(idx_Cj)*n(idx_C3H3) &
        -k(353)*n(idx_Cj)*n(idx_C3H3) &
        -k(354)*n(idx_Cj)*n(idx_C3H3) &
        -k(355)*n(idx_Cj)*n(idx_C3H3) &
        -k(356)*n(idx_Cj)*n(idx_C4H2) &
        -k(357)*n(idx_Cj)*n(idx_C4H2) &
        -k(358)*n(idx_Cj)*n(idx_C4H2) &
        -k(359)*n(idx_Cj)*n(idx_C4H2) &
        -k(360)*n(idx_Cj)*n(idx_C5H) &
        -k(361)*n(idx_Cj)*n(idx_CH3OH) &
        -k(362)*n(idx_Cj)*n(idx_CH3OH) &
        -k(363)*n(idx_Cj)*n(idx_CH3OH) &
        -k(364)*n(idx_Cj)*n(idx_NH2CHO) &
        -k(365)*n(idx_Cj)*n(idx_NH2CHO) &
        -k(366)*n(idx_Cj)*n(idx_NH2CHO) &
        -k(367)*n(idx_Cj)*n(idx_NH2CHO) &
        -k(368)*n(idx_Cj)*n(idx_NH2CHO) &
        -k(369)*n(idx_Cj)*n(idx_NH2CHO) &
        -k(370)*n(idx_Cj)*n(idx_C2H4O) &
        -k(371)*n(idx_Cj)*n(idx_C2H4O) &
        -k(372)*n(idx_Cj)*n(idx_C2H5) &
        -k(373)*n(idx_Cj)*n(idx_C2H5) &
        -k(374)*n(idx_Cj)*n(idx_C2H5) &
        -k(375)*n(idx_Cj)*n(idx_C3H3N) &
        -k(376)*n(idx_Cj)*n(idx_C3H4) &
        -k(377)*n(idx_Cj)*n(idx_C3H4) &
        -k(378)*n(idx_Cj)*n(idx_C3H4) &
        -k(379)*n(idx_Cj)*n(idx_C3H4) &
        -k(380)*n(idx_Cj)*n(idx_C3H4) &
        -k(381)*n(idx_Cj)*n(idx_C3H4) &
        -k(382)*n(idx_Cj)*n(idx_C4H3) &
        -k(383)*n(idx_Cj)*n(idx_C4H3) &
        -k(384)*n(idx_Cj)*n(idx_C4H3) &
        -k(385)*n(idx_Cj)*n(idx_C4H3) &
        -k(386)*n(idx_Cj)*n(idx_C4H3) &
        -k(387)*n(idx_Cj)*n(idx_C5H2) &
        -k(388)*n(idx_Cj)*n(idx_C5H2) &
        -k(389)*n(idx_Cj)*n(idx_C6H) &
        -k(390)*n(idx_Cj)*n(idx_CH5N) &
        -k(391)*n(idx_Cj)*n(idx_CH5N) &
        -k(392)*n(idx_Cj)*n(idx_HC5N) &
        -k(393)*n(idx_Cj)*n(idx_HC5N) &
        -k(394)*n(idx_Cj)*n(idx_C6H2) &
        -k(395)*n(idx_Cj)*n(idx_C6H2) &
        -k(396)*n(idx_Cj)*n(idx_C7H) &
        -k(397)*n(idx_Cj)*n(idx_CH3C3N) &
        -k(398)*n(idx_Cj)*n(idx_CH3C3N) &
        -k(399)*n(idx_Cj)*n(idx_HCOOCH3) &
        -k(400)*n(idx_Cj)*n(idx_C2H5OH) &
        -k(401)*n(idx_Cj)*n(idx_C2H5OH) &
        -k(402)*n(idx_Cj)*n(idx_C2H5OH) &
        -k(403)*n(idx_Cj)*n(idx_C7H2) &
        -k(404)*n(idx_Cj)*n(idx_C7H2) &
        -k(405)*n(idx_Cj)*n(idx_C8H) &
        -k(406)*n(idx_Cj)*n(idx_CH3C4H) &
        -k(407)*n(idx_Cj)*n(idx_CH3C4H) &
        -k(408)*n(idx_Cj)*n(idx_CH3C4H) &
        -k(409)*n(idx_Cj)*n(idx_CH3OCH3) &
        -k(410)*n(idx_Cj)*n(idx_HC7N) &
        -k(411)*n(idx_Cj)*n(idx_C2H6CO) &
        -k(412)*n(idx_Cj)*n(idx_C8H2) &
        -k(413)*n(idx_Cj)*n(idx_C8H2) &
        -k(414)*n(idx_Cj)*n(idx_C9H) &
        -k(415)*n(idx_Cj)*n(idx_CH3C5N) &
        -k(416)*n(idx_Cj)*n(idx_C9H2) &
        -k(417)*n(idx_Cj)*n(idx_CH3C6H) &
        -k(418)*n(idx_Cj)*n(idx_CH3C6H) &
        -k(419)*n(idx_Cj)*n(idx_CH3C7N) &
        -k(420)*n(idx_Cj)*n(idx_HC9N) &
        +k(632)*n(idx_HEj)*n(idx_C2) &
        +k(634)*n(idx_HEj)*n(idx_CCL) &
        +k(635)*n(idx_HEj)*n(idx_CH) &
        +k(638)*n(idx_HEj)*n(idx_CN) &
        +k(640)*n(idx_HEj)*n(idx_CO) &
        +k(641)*n(idx_HEj)*n(idx_CP) &
        +k(643)*n(idx_HEj)*n(idx_CS) &
        +k(666)*n(idx_HEj)*n(idx_SIC) &
        +k(676)*n(idx_HEj)*n(idx_C2H) &
        +k(679)*n(idx_HEj)*n(idx_C2N) &
        +k(680)*n(idx_HEj)*n(idx_C2S) &
        +k(684)*n(idx_HEj)*n(idx_C3) &
        +k(686)*n(idx_HEj)*n(idx_CCO) &
        +k(687)*n(idx_HEj)*n(idx_CCP) &
        +k(689)*n(idx_HEj)*n(idx_CH2) &
        +k(691)*n(idx_HEj)*n(idx_CO2) &
        +k(702)*n(idx_HEj)*n(idx_HCN) &
        +k(709)*n(idx_HEj)*n(idx_HCP) &
        +k(715)*n(idx_HEj)*n(idx_HNC) &
        +k(762)*n(idx_HEj)*n(idx_C4) &
        +k(1121)*n(idx_C2j)*n(idx_C) &
        +k(1122)*n(idx_C2j)*n(idx_N) &
        +k(1154)*n(idx_CHj)*n(idx_H) &
        +k(1205)*n(idx_CNj)*n(idx_C) &
        +k(1236)*n(idx_COj)*n(idx_C) &
        +k(1274)*n(idx_CSj)*n(idx_C) &
        +k(1356)*n(idx_N2j)*n(idx_C) &
        +k(1440)*n(idx_O2j)*n(idx_C) &
        +k(2187)*n(idx_C2H2j)*n(idx_C) &
        -k(3127)*n(idx_Cj)*n(idx_H) &
        -k(3128)*n(idx_Cj)*n(idx_O) &
        -k(3129)*n(idx_Cj)*n(idx_H2) &
        -k(3130)*n(idx_Cj)*n(idx_C3) &
        -k(3131)*n(idx_Cj)*n(idx_C4) &
        -k(3132)*n(idx_Cj)*n(idx_C5) &
        -k(3133)*n(idx_Cj)*n(idx_C6) &
        -k(3134)*n(idx_Cj)*n(idx_C7) &
        -k(3135)*n(idx_Cj)*n(idx_C8) &
        -k(3136)*n(idx_Cj)*n(idx_C9) &
        -k(4194)*n(idx_Cj)*n(idx_E) &
        -k(4210)*n(idx_Cj)*n(idx_Ck) &
        -k(4211)*n(idx_Cj)*n(idx_Hk) &
        -k(4212)*n(idx_Cj)*n(idx_Sk) &
        +k(4250)*n(idx_C) &
        +k(4413)*n(idx_C2j) &
        +k(4414)*n(idx_CHj)

    !FE+
    !FE+
    dn(idx_FEj) = &
        -k(3)*n(idx_FEj)*n(idx_GRAINk) &
        +k(16)*n(idx_FE) &
        +k(201)*n(idx_Cj)*n(idx_FE) &
        -k(423)*n(idx_FEj)*n(idx_NA) &
        +k(425)*n(idx_Hj)*n(idx_FE) &
        +k(954)*n(idx_Nj)*n(idx_FE) &
        +k(1003)*n(idx_Oj)*n(idx_FE) &
        +k(1056)*n(idx_Sj)*n(idx_FE) &
        +k(1095)*n(idx_SIj)*n(idx_FE) &
        +k(1153)*n(idx_CHj)*n(idx_FE) &
        +k(1275)*n(idx_CSj)*n(idx_FE) &
        +k(1337)*n(idx_HSj)*n(idx_FE) &
        +k(1357)*n(idx_N2j)*n(idx_FE) &
        +k(1435)*n(idx_NOj)*n(idx_FE) &
        +k(1442)*n(idx_O2j)*n(idx_FE) &
        +k(1541)*n(idx_SIOj)*n(idx_FE) &
        +k(1556)*n(idx_SOj)*n(idx_FE) &
        +k(1657)*n(idx_H2Oj)*n(idx_FE) &
        +k(1697)*n(idx_H2Sj)*n(idx_FE) &
        +k(1714)*n(idx_H3j)*n(idx_FE) &
        +k(1902)*n(idx_HCOj)*n(idx_FE) &
        +k(2190)*n(idx_C2H2j)*n(idx_FE) &
        +k(2313)*n(idx_CH3j)*n(idx_FE) &
        +k(2400)*n(idx_H2COj)*n(idx_FE) &
        +k(2509)*n(idx_NH3j)*n(idx_FE) &
        +k(2685)*n(idx_C4Hj)*n(idx_FE) &
        -k(4196)*n(idx_FEj)*n(idx_E) &
        -k(4213)*n(idx_FEj)*n(idx_Ck) &
        -k(4214)*n(idx_FEj)*n(idx_Hk) &
        -k(4215)*n(idx_FEj)*n(idx_Sk) &
        +k(4252)*n(idx_FE)

    !H+
    !H+
    dn(idx_Hj) = &
        -k(4)*n(idx_Hj)*n(idx_GRAINk) &
        +k(17)*n(idx_H) &
        +k(36)*n(idx_H2) &
        +k(37)*n(idx_H2) &
        +k(200)*n(idx_CHj) &
        -k(425)*n(idx_Hj)*n(idx_FE) &
        -k(426)*n(idx_Hj)*n(idx_MG) &
        -k(427)*n(idx_Hj)*n(idx_NA) &
        -k(428)*n(idx_Hj)*n(idx_O) &
        -k(429)*n(idx_Hj)*n(idx_P) &
        -k(430)*n(idx_Hj)*n(idx_S) &
        -k(431)*n(idx_Hj)*n(idx_SI) &
        -k(432)*n(idx_Hj)*n(idx_C2) &
        -k(433)*n(idx_Hj)*n(idx_CH) &
        -k(434)*n(idx_Hj)*n(idx_CP) &
        -k(435)*n(idx_Hj)*n(idx_CS) &
        -k(436)*n(idx_Hj)*n(idx_HCL) &
        -k(437)*n(idx_Hj)*n(idx_HS) &
        -k(438)*n(idx_Hj)*n(idx_HS) &
        -k(439)*n(idx_Hj)*n(idx_MGH) &
        -k(440)*n(idx_Hj)*n(idx_NAH) &
        -k(441)*n(idx_Hj)*n(idx_NH) &
        -k(442)*n(idx_Hj)*n(idx_NO) &
        -k(443)*n(idx_Hj)*n(idx_NS) &
        -k(444)*n(idx_Hj)*n(idx_O2) &
        -k(445)*n(idx_Hj)*n(idx_OH) &
        -k(446)*n(idx_Hj)*n(idx_PH) &
        -k(447)*n(idx_Hj)*n(idx_PN) &
        -k(448)*n(idx_Hj)*n(idx_PO) &
        -k(449)*n(idx_Hj)*n(idx_S2) &
        -k(450)*n(idx_Hj)*n(idx_SIC) &
        -k(451)*n(idx_Hj)*n(idx_SIH) &
        -k(452)*n(idx_Hj)*n(idx_SIH) &
        -k(453)*n(idx_Hj)*n(idx_SIN) &
        -k(454)*n(idx_Hj)*n(idx_SIO) &
        -k(455)*n(idx_Hj)*n(idx_SIS) &
        -k(456)*n(idx_Hj)*n(idx_SO) &
        -k(457)*n(idx_Hj)*n(idx_C2H) &
        -k(458)*n(idx_Hj)*n(idx_C2H) &
        -k(459)*n(idx_Hj)*n(idx_C2N) &
        -k(460)*n(idx_Hj)*n(idx_C2S) &
        -k(461)*n(idx_Hj)*n(idx_C3) &
        -k(462)*n(idx_Hj)*n(idx_CCO) &
        -k(463)*n(idx_Hj)*n(idx_CCP) &
        -k(464)*n(idx_Hj)*n(idx_CH2) &
        -k(465)*n(idx_Hj)*n(idx_CH2) &
        -k(466)*n(idx_Hj)*n(idx_CO2) &
        -k(467)*n(idx_Hj)*n(idx_H2O) &
        -k(468)*n(idx_Hj)*n(idx_H2S) &
        -k(469)*n(idx_Hj)*n(idx_HCN) &
        -k(470)*n(idx_Hj)*n(idx_HCO) &
        -k(471)*n(idx_Hj)*n(idx_HCO) &
        -k(472)*n(idx_Hj)*n(idx_HCO) &
        -k(473)*n(idx_Hj)*n(idx_HCP) &
        -k(474)*n(idx_Hj)*n(idx_HCS) &
        -k(475)*n(idx_Hj)*n(idx_HCSI) &
        -k(476)*n(idx_Hj)*n(idx_HCSI) &
        -k(477)*n(idx_Hj)*n(idx_HNC) &
        +k(477)*n(idx_Hj)*n(idx_HNC) &
        -k(478)*n(idx_Hj)*n(idx_HNO) &
        -k(479)*n(idx_Hj)*n(idx_HNSI) &
        -k(480)*n(idx_Hj)*n(idx_HNSI) &
        -k(481)*n(idx_Hj)*n(idx_HPO) &
        -k(482)*n(idx_Hj)*n(idx_HS2) &
        -k(483)*n(idx_Hj)*n(idx_NAOH) &
        -k(484)*n(idx_Hj)*n(idx_NH2) &
        -k(485)*n(idx_Hj)*n(idx_OCS) &
        -k(486)*n(idx_Hj)*n(idx_PH2) &
        -k(487)*n(idx_Hj)*n(idx_SIC2) &
        -k(488)*n(idx_Hj)*n(idx_SIH2) &
        -k(489)*n(idx_Hj)*n(idx_SIH2) &
        -k(490)*n(idx_Hj)*n(idx_SINC) &
        -k(491)*n(idx_Hj)*n(idx_C2H2) &
        -k(492)*n(idx_Hj)*n(idx_C2H2) &
        -k(493)*n(idx_Hj)*n(idx_C3H) &
        -k(494)*n(idx_Hj)*n(idx_HC3) &
        -k(495)*n(idx_Hj)*n(idx_C3H) &
        -k(496)*n(idx_Hj)*n(idx_HC3) &
        -k(497)*n(idx_Hj)*n(idx_C3O) &
        -k(498)*n(idx_Hj)*n(idx_C3S) &
        -k(499)*n(idx_Hj)*n(idx_C4) &
        -k(500)*n(idx_Hj)*n(idx_CH3) &
        -k(501)*n(idx_Hj)*n(idx_H2CO) &
        -k(502)*n(idx_Hj)*n(idx_H2CO) &
        -k(503)*n(idx_Hj)*n(idx_H2CS) &
        -k(504)*n(idx_Hj)*n(idx_H2S2) &
        -k(505)*n(idx_Hj)*n(idx_H2SIO) &
        -k(506)*n(idx_Hj)*n(idx_H2SIO) &
        -k(507)*n(idx_Hj)*n(idx_HCCP) &
        -k(508)*n(idx_Hj)*n(idx_NH3) &
        -k(509)*n(idx_Hj)*n(idx_SIC2H) &
        -k(510)*n(idx_Hj)*n(idx_SIC2H) &
        -k(511)*n(idx_Hj)*n(idx_SIC3) &
        -k(512)*n(idx_Hj)*n(idx_SICH2) &
        -k(513)*n(idx_Hj)*n(idx_SICH2) &
        -k(514)*n(idx_Hj)*n(idx_SIH3) &
        -k(515)*n(idx_Hj)*n(idx_SIH3) &
        -k(516)*n(idx_Hj)*n(idx_CH2CN) &
        -k(517)*n(idx_Hj)*n(idx_C2H2O) &
        -k(518)*n(idx_Hj)*n(idx_C2H3) &
        -k(519)*n(idx_Hj)*n(idx_C2H3) &
        -k(520)*n(idx_Hj)*n(idx_C3H2) &
        -k(521)*n(idx_Hj)*n(idx_H2C3) &
        -k(522)*n(idx_Hj)*n(idx_C3H2) &
        -k(523)*n(idx_Hj)*n(idx_H2C3) &
        -k(524)*n(idx_Hj)*n(idx_C4H) &
        -k(525)*n(idx_Hj)*n(idx_C4H) &
        -k(526)*n(idx_Hj)*n(idx_C4P) &
        -k(527)*n(idx_Hj)*n(idx_C4S) &
        -k(528)*n(idx_Hj)*n(idx_C5) &
        -k(529)*n(idx_Hj)*n(idx_CH2O2) &
        -k(530)*n(idx_Hj)*n(idx_CH2O2) &
        -k(531)*n(idx_Hj)*n(idx_CH2PH) &
        -k(532)*n(idx_Hj)*n(idx_CH3N) &
        -k(533)*n(idx_Hj)*n(idx_CH4) &
        -k(534)*n(idx_Hj)*n(idx_CH4) &
        -k(535)*n(idx_Hj)*n(idx_HCNC2) &
        -k(536)*n(idx_Hj)*n(idx_HCNC2) &
        -k(537)*n(idx_Hj)*n(idx_HCNC2) &
        -k(538)*n(idx_Hj)*n(idx_HCNC2) &
        -k(539)*n(idx_Hj)*n(idx_HC2NC) &
        -k(540)*n(idx_Hj)*n(idx_HC2NC) &
        -k(541)*n(idx_Hj)*n(idx_HC2NC) &
        -k(542)*n(idx_Hj)*n(idx_HC3N) &
        -k(543)*n(idx_Hj)*n(idx_HNC3) &
        +k(543)*n(idx_Hj)*n(idx_HNC3) &
        -k(544)*n(idx_Hj)*n(idx_HNC3) &
        -k(545)*n(idx_Hj)*n(idx_HNC3) &
        -k(546)*n(idx_Hj)*n(idx_HNC3) &
        -k(547)*n(idx_Hj)*n(idx_HNC3) &
        -k(548)*n(idx_Hj)*n(idx_HNC3) &
        -k(549)*n(idx_Hj)*n(idx_NH2CN) &
        -k(550)*n(idx_Hj)*n(idx_NH2CN) &
        -k(551)*n(idx_Hj)*n(idx_SIC2H2) &
        -k(552)*n(idx_Hj)*n(idx_SIC2H2) &
        -k(553)*n(idx_Hj)*n(idx_SIC3H) &
        -k(554)*n(idx_Hj)*n(idx_SIC3H) &
        -k(555)*n(idx_Hj)*n(idx_SIC4) &
        -k(556)*n(idx_Hj)*n(idx_SICH3) &
        -k(557)*n(idx_Hj)*n(idx_SICH3) &
        -k(558)*n(idx_Hj)*n(idx_SIH4) &
        -k(559)*n(idx_Hj)*n(idx_SIH4) &
        -k(560)*n(idx_Hj)*n(idx_CH3CN) &
        -k(561)*n(idx_Hj)*n(idx_CH3CN) &
        -k(562)*n(idx_Hj)*n(idx_C2H4) &
        -k(563)*n(idx_Hj)*n(idx_C2H4) &
        -k(564)*n(idx_Hj)*n(idx_C3H3) &
        -k(565)*n(idx_Hj)*n(idx_C3H3) &
        -k(566)*n(idx_Hj)*n(idx_C3H3) &
        -k(567)*n(idx_Hj)*n(idx_C3H3) &
        -k(568)*n(idx_Hj)*n(idx_C4H2) &
        -k(569)*n(idx_Hj)*n(idx_C4H2) &
        -k(570)*n(idx_Hj)*n(idx_C5H) &
        -k(571)*n(idx_Hj)*n(idx_C5H) &
        -k(572)*n(idx_Hj)*n(idx_C6) &
        -k(573)*n(idx_Hj)*n(idx_CH3OH) &
        -k(574)*n(idx_Hj)*n(idx_CH3OH) &
        -k(575)*n(idx_Hj)*n(idx_NH2CHO) &
        -k(576)*n(idx_Hj)*n(idx_NH2CHO) &
        -k(577)*n(idx_Hj)*n(idx_NH2CHO) &
        -k(578)*n(idx_Hj)*n(idx_NH2CHO) &
        -k(579)*n(idx_Hj)*n(idx_C2H4O) &
        -k(580)*n(idx_Hj)*n(idx_C2H4O) &
        -k(581)*n(idx_Hj)*n(idx_C2H5) &
        -k(582)*n(idx_Hj)*n(idx_C2H5) &
        -k(583)*n(idx_Hj)*n(idx_C3H3N) &
        -k(584)*n(idx_Hj)*n(idx_C3H3N) &
        -k(585)*n(idx_Hj)*n(idx_C3H4) &
        -k(586)*n(idx_Hj)*n(idx_C3H4) &
        -k(587)*n(idx_Hj)*n(idx_C3H4) &
        -k(588)*n(idx_Hj)*n(idx_C4H3) &
        -k(589)*n(idx_Hj)*n(idx_C4H3) &
        -k(590)*n(idx_Hj)*n(idx_C5H2) &
        -k(591)*n(idx_Hj)*n(idx_C5H2) &
        -k(592)*n(idx_Hj)*n(idx_C6H) &
        -k(593)*n(idx_Hj)*n(idx_C6H) &
        -k(594)*n(idx_Hj)*n(idx_C7) &
        -k(595)*n(idx_Hj)*n(idx_CH5N) &
        -k(596)*n(idx_Hj)*n(idx_CH5N) &
        -k(597)*n(idx_Hj)*n(idx_HC5N) &
        -k(598)*n(idx_Hj)*n(idx_C6H2) &
        -k(599)*n(idx_Hj)*n(idx_C6H2) &
        -k(600)*n(idx_Hj)*n(idx_C7H) &
        -k(601)*n(idx_Hj)*n(idx_C7H) &
        -k(602)*n(idx_Hj)*n(idx_C8) &
        -k(603)*n(idx_Hj)*n(idx_CH3C3N) &
        -k(604)*n(idx_Hj)*n(idx_HCOOCH3) &
        -k(605)*n(idx_Hj)*n(idx_C2H5OH) &
        -k(606)*n(idx_Hj)*n(idx_C2H5OH) &
        -k(607)*n(idx_Hj)*n(idx_C7H2) &
        -k(608)*n(idx_Hj)*n(idx_C7H2) &
        -k(609)*n(idx_Hj)*n(idx_C8H) &
        -k(610)*n(idx_Hj)*n(idx_C8H) &
        -k(611)*n(idx_Hj)*n(idx_C9) &
        -k(612)*n(idx_Hj)*n(idx_CH3C4H) &
        -k(613)*n(idx_Hj)*n(idx_CH3C4H) &
        -k(614)*n(idx_Hj)*n(idx_CH3OCH3) &
        -k(615)*n(idx_Hj)*n(idx_CH3OCH3) &
        -k(616)*n(idx_Hj)*n(idx_HC7N) &
        -k(617)*n(idx_Hj)*n(idx_C2H6CO) &
        -k(618)*n(idx_Hj)*n(idx_C8H2) &
        -k(619)*n(idx_Hj)*n(idx_C8H2) &
        -k(620)*n(idx_Hj)*n(idx_C9H) &
        -k(621)*n(idx_Hj)*n(idx_C9H) &
        -k(622)*n(idx_Hj)*n(idx_CH3C5N) &
        -k(623)*n(idx_Hj)*n(idx_C9H2) &
        -k(624)*n(idx_Hj)*n(idx_C9H2) &
        -k(625)*n(idx_Hj)*n(idx_CH3C6H) &
        -k(626)*n(idx_Hj)*n(idx_CH3C6H) &
        -k(627)*n(idx_Hj)*n(idx_CH3C7N) &
        -k(628)*n(idx_Hj)*n(idx_HC9N) &
        +k(629)*n(idx_HEj)*n(idx_H) &
        +k(645)*n(idx_HEj)*n(idx_H2) &
        +k(696)*n(idx_HEj)*n(idx_H2O) &
        +k(711)*n(idx_HEj)*n(idx_HCS) &
        +k(718)*n(idx_HEj)*n(idx_HNO) &
        +k(812)*n(idx_HEj)*n(idx_CH4) &
        +k(1004)*n(idx_Oj)*n(idx_H) &
        +k(1206)*n(idx_CNj)*n(idx_H) &
        +k(1237)*n(idx_COj)*n(idx_H) &
        +k(1284)*n(idx_H2j)*n(idx_H) &
        +k(1358)*n(idx_N2j)*n(idx_H) &
        +k(1641)*n(idx_CO2j)*n(idx_H) &
        +k(1874)*n(idx_HCNj)*n(idx_H) &
        -k(3137)*n(idx_Hj)*n(idx_H) &
        -k(4197)*n(idx_Hj)*n(idx_E) &
        -k(4216)*n(idx_Hj)*n(idx_Ck) &
        -k(4217)*n(idx_Hj)*n(idx_Hk) &
        -k(4218)*n(idx_Hj)*n(idx_Sk) &
        +k(4415)*n(idx_H2j) &
        +k(4416)*n(idx_OHj) &
        +k(4420)*n(idx_H3j) &
        +k(4430)*n(idx_H)

    !HE+
    !HE+
    dn(idx_HEj) = &
        -k(5)*n(idx_HEj)*n(idx_GRAINk) &
        +k(18)*n(idx_HE) &
        -k(629)*n(idx_HEj)*n(idx_H) &
        -k(630)*n(idx_HEj)*n(idx_P) &
        -k(631)*n(idx_HEj)*n(idx_SI) &
        -k(632)*n(idx_HEj)*n(idx_C2) &
        -k(633)*n(idx_HEj)*n(idx_C2) &
        -k(634)*n(idx_HEj)*n(idx_CCL) &
        -k(635)*n(idx_HEj)*n(idx_CH) &
        -k(636)*n(idx_HEj)*n(idx_CH) &
        -k(637)*n(idx_HEj)*n(idx_CLO) &
        -k(638)*n(idx_HEj)*n(idx_CN) &
        -k(639)*n(idx_HEj)*n(idx_CN) &
        -k(640)*n(idx_HEj)*n(idx_CO) &
        -k(641)*n(idx_HEj)*n(idx_CP) &
        -k(642)*n(idx_HEj)*n(idx_CP) &
        -k(643)*n(idx_HEj)*n(idx_CS) &
        -k(644)*n(idx_HEj)*n(idx_CS) &
        -k(645)*n(idx_HEj)*n(idx_H2) &
        -k(646)*n(idx_HEj)*n(idx_H2) &
        -k(647)*n(idx_HEj)*n(idx_HCL) &
        -k(648)*n(idx_HEj)*n(idx_HF) &
        -k(649)*n(idx_HEj)*n(idx_HS) &
        -k(650)*n(idx_HEj)*n(idx_MGH) &
        -k(651)*n(idx_HEj)*n(idx_N2) &
        -k(652)*n(idx_HEj)*n(idx_N2) &
        -k(653)*n(idx_HEj)*n(idx_NAH) &
        -k(654)*n(idx_HEj)*n(idx_NH) &
        -k(655)*n(idx_HEj)*n(idx_NO) &
        -k(656)*n(idx_HEj)*n(idx_NO) &
        -k(657)*n(idx_HEj)*n(idx_NS) &
        -k(658)*n(idx_HEj)*n(idx_NS) &
        -k(659)*n(idx_HEj)*n(idx_O2) &
        -k(660)*n(idx_HEj)*n(idx_O2) &
        -k(661)*n(idx_HEj)*n(idx_OH) &
        -k(662)*n(idx_HEj)*n(idx_PH) &
        -k(663)*n(idx_HEj)*n(idx_PN) &
        -k(664)*n(idx_HEj)*n(idx_PO) &
        -k(665)*n(idx_HEj)*n(idx_S2) &
        -k(666)*n(idx_HEj)*n(idx_SIC) &
        -k(667)*n(idx_HEj)*n(idx_SIC) &
        -k(668)*n(idx_HEj)*n(idx_SIH) &
        -k(669)*n(idx_HEj)*n(idx_SIN) &
        -k(670)*n(idx_HEj)*n(idx_SIO) &
        -k(671)*n(idx_HEj)*n(idx_SIO) &
        -k(672)*n(idx_HEj)*n(idx_SIS) &
        -k(673)*n(idx_HEj)*n(idx_SIS) &
        -k(674)*n(idx_HEj)*n(idx_SO) &
        -k(675)*n(idx_HEj)*n(idx_SO) &
        -k(676)*n(idx_HEj)*n(idx_C2H) &
        -k(677)*n(idx_HEj)*n(idx_C2H) &
        -k(678)*n(idx_HEj)*n(idx_C2H) &
        -k(679)*n(idx_HEj)*n(idx_C2N) &
        -k(680)*n(idx_HEj)*n(idx_C2S) &
        -k(681)*n(idx_HEj)*n(idx_C2S) &
        -k(682)*n(idx_HEj)*n(idx_C2S) &
        -k(683)*n(idx_HEj)*n(idx_C2S) &
        -k(684)*n(idx_HEj)*n(idx_C3) &
        -k(685)*n(idx_HEj)*n(idx_C3) &
        -k(686)*n(idx_HEj)*n(idx_CCO) &
        -k(687)*n(idx_HEj)*n(idx_CCP) &
        -k(688)*n(idx_HEj)*n(idx_CCP) &
        -k(689)*n(idx_HEj)*n(idx_CH2) &
        -k(690)*n(idx_HEj)*n(idx_CH2) &
        -k(691)*n(idx_HEj)*n(idx_CO2) &
        -k(692)*n(idx_HEj)*n(idx_CO2) &
        -k(693)*n(idx_HEj)*n(idx_CO2) &
        -k(694)*n(idx_HEj)*n(idx_CO2) &
        -k(695)*n(idx_HEj)*n(idx_CO2) &
        -k(696)*n(idx_HEj)*n(idx_H2O) &
        -k(697)*n(idx_HEj)*n(idx_H2O) &
        -k(698)*n(idx_HEj)*n(idx_H2O) &
        -k(699)*n(idx_HEj)*n(idx_H2S) &
        -k(700)*n(idx_HEj)*n(idx_H2S) &
        -k(701)*n(idx_HEj)*n(idx_H2S) &
        -k(702)*n(idx_HEj)*n(idx_HCN) &
        -k(703)*n(idx_HEj)*n(idx_HCN) &
        -k(704)*n(idx_HEj)*n(idx_HCN) &
        -k(705)*n(idx_HEj)*n(idx_HCN) &
        -k(706)*n(idx_HEj)*n(idx_HCO) &
        -k(707)*n(idx_HEj)*n(idx_HCO) &
        -k(708)*n(idx_HEj)*n(idx_HCO) &
        -k(709)*n(idx_HEj)*n(idx_HCP) &
        -k(710)*n(idx_HEj)*n(idx_HCP) &
        -k(711)*n(idx_HEj)*n(idx_HCS) &
        -k(712)*n(idx_HEj)*n(idx_HCS) &
        -k(713)*n(idx_HEj)*n(idx_HCSI) &
        -k(714)*n(idx_HEj)*n(idx_HCSI) &
        -k(715)*n(idx_HEj)*n(idx_HNC) &
        -k(716)*n(idx_HEj)*n(idx_HNC) &
        -k(717)*n(idx_HEj)*n(idx_HNC) &
        -k(718)*n(idx_HEj)*n(idx_HNO) &
        -k(719)*n(idx_HEj)*n(idx_HNO) &
        -k(720)*n(idx_HEj)*n(idx_HNSI) &
        -k(721)*n(idx_HEj)*n(idx_HPO) &
        -k(722)*n(idx_HEj)*n(idx_HPO) &
        -k(723)*n(idx_HEj)*n(idx_HS2) &
        -k(724)*n(idx_HEj)*n(idx_HS2) &
        -k(725)*n(idx_HEj)*n(idx_N2O) &
        -k(726)*n(idx_HEj)*n(idx_N2O) &
        -k(727)*n(idx_HEj)*n(idx_N2O) &
        -k(728)*n(idx_HEj)*n(idx_N2O) &
        -k(729)*n(idx_HEj)*n(idx_NAOH) &
        -k(730)*n(idx_HEj)*n(idx_NH2) &
        -k(731)*n(idx_HEj)*n(idx_NH2) &
        -k(732)*n(idx_HEj)*n(idx_OCN) &
        -k(733)*n(idx_HEj)*n(idx_OCN) &
        -k(734)*n(idx_HEj)*n(idx_OCS) &
        -k(735)*n(idx_HEj)*n(idx_OCS) &
        -k(736)*n(idx_HEj)*n(idx_OCS) &
        -k(737)*n(idx_HEj)*n(idx_OCS) &
        -k(738)*n(idx_HEj)*n(idx_PH2) &
        -k(739)*n(idx_HEj)*n(idx_SIC2) &
        -k(740)*n(idx_HEj)*n(idx_SIH2) &
        -k(741)*n(idx_HEj)*n(idx_SIH2) &
        -k(742)*n(idx_HEj)*n(idx_SINC) &
        -k(743)*n(idx_HEj)*n(idx_SIO2) &
        -k(744)*n(idx_HEj)*n(idx_SO2) &
        -k(745)*n(idx_HEj)*n(idx_SO2) &
        -k(746)*n(idx_HEj)*n(idx_SO2) &
        -k(747)*n(idx_HEj)*n(idx_SO2) &
        -k(748)*n(idx_HEj)*n(idx_C2H2) &
        -k(749)*n(idx_HEj)*n(idx_C2H2) &
        -k(750)*n(idx_HEj)*n(idx_C2H2) &
        -k(751)*n(idx_HEj)*n(idx_C2H2) &
        -k(752)*n(idx_HEj)*n(idx_C3H) &
        -k(753)*n(idx_HEj)*n(idx_HC3) &
        -k(754)*n(idx_HEj)*n(idx_C3N) &
        -k(755)*n(idx_HEj)*n(idx_C3N) &
        -k(756)*n(idx_HEj)*n(idx_C3O) &
        -k(757)*n(idx_HEj)*n(idx_C3O) &
        -k(758)*n(idx_HEj)*n(idx_C3P) &
        -k(759)*n(idx_HEj)*n(idx_C3P) &
        -k(760)*n(idx_HEj)*n(idx_C3S) &
        -k(761)*n(idx_HEj)*n(idx_C3S) &
        -k(762)*n(idx_HEj)*n(idx_C4) &
        -k(763)*n(idx_HEj)*n(idx_C4) &
        -k(764)*n(idx_HEj)*n(idx_C4) &
        -k(765)*n(idx_HEj)*n(idx_CH3) &
        -k(766)*n(idx_HEj)*n(idx_CH3) &
        -k(767)*n(idx_HEj)*n(idx_H2CO) &
        -k(768)*n(idx_HEj)*n(idx_H2CO) &
        -k(769)*n(idx_HEj)*n(idx_H2CS) &
        -k(770)*n(idx_HEj)*n(idx_H2CS) &
        -k(771)*n(idx_HEj)*n(idx_H2CS) &
        -k(772)*n(idx_HEj)*n(idx_H2S2) &
        -k(773)*n(idx_HEj)*n(idx_H2S2) &
        -k(774)*n(idx_HEj)*n(idx_H2SIO) &
        -k(775)*n(idx_HEj)*n(idx_HCCP) &
        -k(776)*n(idx_HEj)*n(idx_HCCP) &
        -k(777)*n(idx_HEj)*n(idx_NH3) &
        -k(778)*n(idx_HEj)*n(idx_NH3) &
        -k(779)*n(idx_HEj)*n(idx_NH3) &
        -k(780)*n(idx_HEj)*n(idx_SIC2H) &
        -k(781)*n(idx_HEj)*n(idx_SIC2H) &
        -k(782)*n(idx_HEj)*n(idx_SIC3) &
        -k(783)*n(idx_HEj)*n(idx_SICH2) &
        -k(784)*n(idx_HEj)*n(idx_SICH2) &
        -k(785)*n(idx_HEj)*n(idx_SIH3) &
        -k(786)*n(idx_HEj)*n(idx_SIH3) &
        -k(787)*n(idx_HEj)*n(idx_CH2CN) &
        -k(788)*n(idx_HEj)*n(idx_C2H2O) &
        -k(789)*n(idx_HEj)*n(idx_C2H2O) &
        -k(790)*n(idx_HEj)*n(idx_C2H3) &
        -k(791)*n(idx_HEj)*n(idx_C2H3) &
        -k(792)*n(idx_HEj)*n(idx_C3H2) &
        -k(793)*n(idx_HEj)*n(idx_H2C3) &
        -k(794)*n(idx_HEj)*n(idx_C3H2) &
        -k(795)*n(idx_HEj)*n(idx_H2C3) &
        -k(796)*n(idx_HEj)*n(idx_C4H) &
        -k(797)*n(idx_HEj)*n(idx_C4H) &
        -k(798)*n(idx_HEj)*n(idx_C4P) &
        -k(799)*n(idx_HEj)*n(idx_C4P) &
        -k(800)*n(idx_HEj)*n(idx_C4S) &
        -k(801)*n(idx_HEj)*n(idx_C4S) &
        -k(802)*n(idx_HEj)*n(idx_C5) &
        -k(803)*n(idx_HEj)*n(idx_C5) &
        -k(804)*n(idx_HEj)*n(idx_CH2O2) &
        -k(805)*n(idx_HEj)*n(idx_CH2O2) &
        -k(806)*n(idx_HEj)*n(idx_CH2PH) &
        -k(807)*n(idx_HEj)*n(idx_CH2PH) &
        -k(808)*n(idx_HEj)*n(idx_CH3N) &
        -k(809)*n(idx_HEj)*n(idx_CH3N) &
        -k(810)*n(idx_HEj)*n(idx_CH3N) &
        -k(811)*n(idx_HEj)*n(idx_CH3N) &
        -k(812)*n(idx_HEj)*n(idx_CH4) &
        -k(813)*n(idx_HEj)*n(idx_CH4) &
        -k(814)*n(idx_HEj)*n(idx_CH4) &
        -k(815)*n(idx_HEj)*n(idx_CH4) &
        -k(816)*n(idx_HEj)*n(idx_CH4) &
        -k(817)*n(idx_HEj)*n(idx_HCNC2) &
        -k(818)*n(idx_HEj)*n(idx_HCNC2) &
        -k(819)*n(idx_HEj)*n(idx_HCNC2) &
        -k(820)*n(idx_HEj)*n(idx_HCNC2) &
        -k(821)*n(idx_HEj)*n(idx_HC2NC) &
        -k(822)*n(idx_HEj)*n(idx_HC2NC) &
        -k(823)*n(idx_HEj)*n(idx_HC2NC) &
        -k(824)*n(idx_HEj)*n(idx_HC2NC) &
        -k(825)*n(idx_HEj)*n(idx_HC3N) &
        -k(826)*n(idx_HEj)*n(idx_HC3N) &
        -k(827)*n(idx_HEj)*n(idx_HC3N) &
        -k(828)*n(idx_HEj)*n(idx_HC3N) &
        -k(829)*n(idx_HEj)*n(idx_HC3N) &
        -k(830)*n(idx_HEj)*n(idx_HC3N) &
        -k(831)*n(idx_HEj)*n(idx_HC3N) &
        -k(832)*n(idx_HEj)*n(idx_HNC3) &
        -k(833)*n(idx_HEj)*n(idx_HNC3) &
        -k(834)*n(idx_HEj)*n(idx_HNC3) &
        -k(835)*n(idx_HEj)*n(idx_HNC3) &
        -k(836)*n(idx_HEj)*n(idx_HNC3) &
        -k(837)*n(idx_HEj)*n(idx_NH2CN) &
        -k(838)*n(idx_HEj)*n(idx_NH2CN) &
        -k(839)*n(idx_HEj)*n(idx_SIC2H2) &
        -k(840)*n(idx_HEj)*n(idx_SIC2H2) &
        -k(841)*n(idx_HEj)*n(idx_SIC3H) &
        -k(842)*n(idx_HEj)*n(idx_SIC3H) &
        -k(843)*n(idx_HEj)*n(idx_SIC3H) &
        -k(844)*n(idx_HEj)*n(idx_SIC4) &
        -k(845)*n(idx_HEj)*n(idx_SICH3) &
        -k(846)*n(idx_HEj)*n(idx_SICH3) &
        -k(847)*n(idx_HEj)*n(idx_SIH4) &
        -k(848)*n(idx_HEj)*n(idx_SIH4) &
        -k(849)*n(idx_HEj)*n(idx_CH3CN) &
        -k(850)*n(idx_HEj)*n(idx_CH3CN) &
        -k(851)*n(idx_HEj)*n(idx_C2H4) &
        -k(852)*n(idx_HEj)*n(idx_C2H4) &
        -k(853)*n(idx_HEj)*n(idx_C2H4) &
        -k(854)*n(idx_HEj)*n(idx_C2H4) &
        -k(855)*n(idx_HEj)*n(idx_C2H4) &
        -k(856)*n(idx_HEj)*n(idx_C3H3) &
        -k(857)*n(idx_HEj)*n(idx_C3H3) &
        -k(858)*n(idx_HEj)*n(idx_C3H3) &
        -k(859)*n(idx_HEj)*n(idx_C3H3) &
        -k(860)*n(idx_HEj)*n(idx_C4H2) &
        -k(861)*n(idx_HEj)*n(idx_C4H2) &
        -k(862)*n(idx_HEj)*n(idx_C4H2) &
        -k(863)*n(idx_HEj)*n(idx_C5H) &
        -k(864)*n(idx_HEj)*n(idx_C5H) &
        -k(865)*n(idx_HEj)*n(idx_C5N) &
        -k(866)*n(idx_HEj)*n(idx_C6) &
        -k(867)*n(idx_HEj)*n(idx_C6) &
        -k(868)*n(idx_HEj)*n(idx_CH3OH) &
        -k(869)*n(idx_HEj)*n(idx_CH3OH) &
        -k(870)*n(idx_HEj)*n(idx_NH2CHO) &
        -k(871)*n(idx_HEj)*n(idx_NH2CHO) &
        -k(872)*n(idx_HEj)*n(idx_NH2CHO) &
        -k(873)*n(idx_HEj)*n(idx_NH2CHO) &
        -k(874)*n(idx_HEj)*n(idx_NH2CHO) &
        -k(875)*n(idx_HEj)*n(idx_C2H4O) &
        -k(876)*n(idx_HEj)*n(idx_C2H4O) &
        -k(877)*n(idx_HEj)*n(idx_C2H4O) &
        -k(878)*n(idx_HEj)*n(idx_C2H4O) &
        -k(879)*n(idx_HEj)*n(idx_C2H5) &
        -k(880)*n(idx_HEj)*n(idx_C2H5) &
        -k(881)*n(idx_HEj)*n(idx_C2H5) &
        -k(882)*n(idx_HEj)*n(idx_C3H3N) &
        -k(883)*n(idx_HEj)*n(idx_C3H4) &
        -k(884)*n(idx_HEj)*n(idx_C3H4) &
        -k(885)*n(idx_HEj)*n(idx_C3H4) &
        -k(886)*n(idx_HEj)*n(idx_C3H4) &
        -k(887)*n(idx_HEj)*n(idx_C3H4) &
        -k(888)*n(idx_HEj)*n(idx_C3H4) &
        -k(889)*n(idx_HEj)*n(idx_C4H3) &
        -k(890)*n(idx_HEj)*n(idx_C4H3) &
        -k(891)*n(idx_HEj)*n(idx_C4H3) &
        -k(892)*n(idx_HEj)*n(idx_C4H3) &
        -k(893)*n(idx_HEj)*n(idx_C4H3) &
        -k(894)*n(idx_HEj)*n(idx_C5H2) &
        -k(895)*n(idx_HEj)*n(idx_C5H2) &
        -k(896)*n(idx_HEj)*n(idx_C5H2) &
        -k(897)*n(idx_HEj)*n(idx_C6H) &
        -k(898)*n(idx_HEj)*n(idx_C6H) &
        -k(899)*n(idx_HEj)*n(idx_C7) &
        -k(900)*n(idx_HEj)*n(idx_C7) &
        -k(901)*n(idx_HEj)*n(idx_CH5N) &
        -k(902)*n(idx_HEj)*n(idx_CH5N) &
        -k(903)*n(idx_HEj)*n(idx_CH5N) &
        -k(904)*n(idx_HEj)*n(idx_CH5N) &
        -k(905)*n(idx_HEj)*n(idx_HC5N) &
        -k(906)*n(idx_HEj)*n(idx_HC5N) &
        -k(907)*n(idx_HEj)*n(idx_HC5N) &
        -k(908)*n(idx_HEj)*n(idx_C6H2) &
        -k(909)*n(idx_HEj)*n(idx_C6H2) &
        -k(910)*n(idx_HEj)*n(idx_C6H2) &
        -k(911)*n(idx_HEj)*n(idx_C7H) &
        -k(912)*n(idx_HEj)*n(idx_C7H) &
        -k(913)*n(idx_HEj)*n(idx_C7N) &
        -k(914)*n(idx_HEj)*n(idx_C8) &
        -k(915)*n(idx_HEj)*n(idx_C8) &
        -k(916)*n(idx_HEj)*n(idx_CH3C3N) &
        -k(917)*n(idx_HEj)*n(idx_HCOOCH3) &
        -k(918)*n(idx_HEj)*n(idx_C2H5OH) &
        -k(919)*n(idx_HEj)*n(idx_C2H5OH) &
        -k(920)*n(idx_HEj)*n(idx_C2H5OH) &
        -k(921)*n(idx_HEj)*n(idx_C2H5OH) &
        -k(922)*n(idx_HEj)*n(idx_C2H5OH) &
        -k(923)*n(idx_HEj)*n(idx_C7H2) &
        -k(924)*n(idx_HEj)*n(idx_C7H2) &
        -k(925)*n(idx_HEj)*n(idx_C7H2) &
        -k(926)*n(idx_HEj)*n(idx_C8H) &
        -k(927)*n(idx_HEj)*n(idx_C8H) &
        -k(928)*n(idx_HEj)*n(idx_C9) &
        -k(929)*n(idx_HEj)*n(idx_C9) &
        -k(930)*n(idx_HEj)*n(idx_CH3C4H) &
        -k(931)*n(idx_HEj)*n(idx_CH3C4H) &
        -k(932)*n(idx_HEj)*n(idx_CH3OCH3) &
        -k(933)*n(idx_HEj)*n(idx_CH3OCH3) &
        -k(934)*n(idx_HEj)*n(idx_HC7N) &
        -k(935)*n(idx_HEj)*n(idx_C2H6CO) &
        -k(936)*n(idx_HEj)*n(idx_C8H2) &
        -k(937)*n(idx_HEj)*n(idx_C8H2) &
        -k(938)*n(idx_HEj)*n(idx_C8H2) &
        -k(939)*n(idx_HEj)*n(idx_C9H) &
        -k(940)*n(idx_HEj)*n(idx_C9H) &
        -k(941)*n(idx_HEj)*n(idx_C9N) &
        -k(942)*n(idx_HEj)*n(idx_CH3C5N) &
        -k(943)*n(idx_HEj)*n(idx_C9H2) &
        -k(944)*n(idx_HEj)*n(idx_C9H2) &
        -k(945)*n(idx_HEj)*n(idx_C9H2) &
        -k(946)*n(idx_HEj)*n(idx_CH3C6H) &
        -k(947)*n(idx_HEj)*n(idx_CH3C6H) &
        -k(948)*n(idx_HEj)*n(idx_CH3C7N) &
        -k(949)*n(idx_HEj)*n(idx_HC9N) &
        -k(950)*n(idx_HEj)*n(idx_C6H6) &
        -k(951)*n(idx_HEj)*n(idx_C6H6) &
        -k(4198)*n(idx_HEj)*n(idx_E) &
        -k(4219)*n(idx_HEj)*n(idx_Ck) &
        -k(4220)*n(idx_HEj)*n(idx_Hk) &
        -k(4221)*n(idx_HEj)*n(idx_Sk) &
        +k(4431)*n(idx_HE)

    !MG+
    !MG+
    dn(idx_MGj) = &
        -k(6)*n(idx_MGj)*n(idx_GRAINk) &
        +k(19)*n(idx_MG) &
        +k(202)*n(idx_Cj)*n(idx_MG) &
        +k(215)*n(idx_Cj)*n(idx_MGH) &
        +k(426)*n(idx_Hj)*n(idx_MG) &
        +k(439)*n(idx_Hj)*n(idx_MGH) &
        +k(650)*n(idx_HEj)*n(idx_MGH) &
        -k(952)*n(idx_MGj)*n(idx_NA) &
        -k(953)*n(idx_MGj)*n(idx_NAH) &
        +k(955)*n(idx_Nj)*n(idx_MG) &
        +k(1057)*n(idx_Sj)*n(idx_MG) &
        +k(1096)*n(idx_SIj)*n(idx_MG) &
        +k(1155)*n(idx_CHj)*n(idx_MG) &
        +k(1276)*n(idx_CSj)*n(idx_MG) &
        +k(1339)*n(idx_HSj)*n(idx_MG) &
        +k(1359)*n(idx_N2j)*n(idx_MG) &
        +k(1436)*n(idx_NOj)*n(idx_MG) &
        +k(1443)*n(idx_O2j)*n(idx_MG) &
        +k(1542)*n(idx_SIOj)*n(idx_MG) &
        +k(1557)*n(idx_SOj)*n(idx_MG) &
        +k(1658)*n(idx_H2Oj)*n(idx_MG) &
        +k(1699)*n(idx_H2Sj)*n(idx_MG) &
        +k(1715)*n(idx_H3j)*n(idx_MG) &
        +k(1733)*n(idx_H3j)*n(idx_MGH) &
        +k(1903)*n(idx_HCOj)*n(idx_MG) &
        +k(1913)*n(idx_HCOj)*n(idx_MGH) &
        +k(2191)*n(idx_C2H2j)*n(idx_MG) &
        +k(2314)*n(idx_CH3j)*n(idx_MG) &
        +k(2401)*n(idx_H2COj)*n(idx_MG) &
        +k(2510)*n(idx_NH3j)*n(idx_MG) &
        +k(2686)*n(idx_C4Hj)*n(idx_MG) &
        +k(2910)*n(idx_CH5j)*n(idx_MG) &
        -k(4199)*n(idx_MGj)*n(idx_E) &
        -k(4222)*n(idx_MGj)*n(idx_Ck) &
        -k(4223)*n(idx_MGj)*n(idx_Hk) &
        -k(4224)*n(idx_MGj)*n(idx_Sk) &
        +k(4253)*n(idx_MG)

    !N+
    !N+
    dn(idx_Nj) = &
        -k(7)*n(idx_Nj)*n(idx_GRAINk) &
        +k(20)*n(idx_N) &
        +k(639)*n(idx_HEj)*n(idx_CN) &
        +k(651)*n(idx_HEj)*n(idx_N2) &
        +k(654)*n(idx_HEj)*n(idx_NH) &
        +k(655)*n(idx_HEj)*n(idx_NO) &
        +k(657)*n(idx_HEj)*n(idx_NS) &
        +k(703)*n(idx_HEj)*n(idx_HCN) &
        +k(725)*n(idx_HEj)*n(idx_N2O) &
        +k(730)*n(idx_HEj)*n(idx_NH2) &
        -k(954)*n(idx_Nj)*n(idx_FE) &
        -k(955)*n(idx_Nj)*n(idx_MG) &
        -k(956)*n(idx_Nj)*n(idx_C2) &
        -k(957)*n(idx_Nj)*n(idx_CH) &
        -k(958)*n(idx_Nj)*n(idx_CH) &
        -k(959)*n(idx_Nj)*n(idx_CN) &
        -k(960)*n(idx_Nj)*n(idx_CO) &
        -k(961)*n(idx_Nj)*n(idx_CO) &
        -k(962)*n(idx_Nj)*n(idx_H2) &
        -k(963)*n(idx_Nj)*n(idx_NH) &
        -k(964)*n(idx_Nj)*n(idx_NH) &
        -k(965)*n(idx_Nj)*n(idx_NO) &
        -k(966)*n(idx_Nj)*n(idx_NO) &
        -k(967)*n(idx_Nj)*n(idx_O2) &
        -k(968)*n(idx_Nj)*n(idx_O2) &
        -k(969)*n(idx_Nj)*n(idx_O2) &
        -k(970)*n(idx_Nj)*n(idx_OH) &
        -k(971)*n(idx_Nj)*n(idx_OH) &
        -k(972)*n(idx_Nj)*n(idx_C2H) &
        -k(973)*n(idx_Nj)*n(idx_CH2) &
        -k(974)*n(idx_Nj)*n(idx_CO2) &
        -k(975)*n(idx_Nj)*n(idx_CO2) &
        -k(976)*n(idx_Nj)*n(idx_H2O) &
        -k(977)*n(idx_Nj)*n(idx_H2S) &
        -k(978)*n(idx_Nj)*n(idx_H2S) &
        -k(979)*n(idx_Nj)*n(idx_HCN) &
        -k(980)*n(idx_Nj)*n(idx_HCO) &
        -k(981)*n(idx_Nj)*n(idx_HCO) &
        -k(982)*n(idx_Nj)*n(idx_NH2) &
        -k(983)*n(idx_Nj)*n(idx_OCS) &
        -k(984)*n(idx_Nj)*n(idx_OCS) &
        -k(985)*n(idx_Nj)*n(idx_OCS) &
        -k(986)*n(idx_Nj)*n(idx_H2CO) &
        -k(987)*n(idx_Nj)*n(idx_H2CO) &
        -k(988)*n(idx_Nj)*n(idx_H2CO) &
        -k(989)*n(idx_Nj)*n(idx_NH3) &
        -k(990)*n(idx_Nj)*n(idx_NH3) &
        -k(991)*n(idx_Nj)*n(idx_NH3) &
        -k(992)*n(idx_Nj)*n(idx_CH4) &
        -k(993)*n(idx_Nj)*n(idx_CH4) &
        -k(994)*n(idx_Nj)*n(idx_CH4) &
        -k(995)*n(idx_Nj)*n(idx_CH4) &
        -k(996)*n(idx_Nj)*n(idx_CH4) &
        -k(997)*n(idx_Nj)*n(idx_CH4) &
        -k(998)*n(idx_Nj)*n(idx_CH3OH) &
        -k(999)*n(idx_Nj)*n(idx_CH3OH) &
        -k(1000)*n(idx_Nj)*n(idx_CH3OH) &
        -k(1001)*n(idx_Nj)*n(idx_CH3OH) &
        -k(1002)*n(idx_Nj)*n(idx_CH3OH) &
        +k(1360)*n(idx_N2j)*n(idx_N) &
        -k(4200)*n(idx_Nj)*n(idx_E) &
        -k(4225)*n(idx_Nj)*n(idx_Ck) &
        -k(4226)*n(idx_Nj)*n(idx_Hk) &
        -k(4227)*n(idx_Nj)*n(idx_Sk)

    !NA+
    !NA+
    dn(idx_NAj) = &
        -k(8)*n(idx_NAj)*n(idx_GRAINk) &
        +k(21)*n(idx_NA) &
        +k(203)*n(idx_Cj)*n(idx_NA) &
        +k(216)*n(idx_Cj)*n(idx_NAH) &
        +k(423)*n(idx_FEj)*n(idx_NA) &
        +k(427)*n(idx_Hj)*n(idx_NA) &
        +k(440)*n(idx_Hj)*n(idx_NAH) &
        +k(483)*n(idx_Hj)*n(idx_NAOH) &
        +k(653)*n(idx_HEj)*n(idx_NAH) &
        +k(729)*n(idx_HEj)*n(idx_NAOH) &
        +k(952)*n(idx_MGj)*n(idx_NA) &
        +k(953)*n(idx_MGj)*n(idx_NAH) &
        +k(1058)*n(idx_Sj)*n(idx_NA) &
        +k(1097)*n(idx_SIj)*n(idx_NA) &
        +k(1157)*n(idx_CHj)*n(idx_NA) &
        +k(1277)*n(idx_CSj)*n(idx_NA) &
        +k(1341)*n(idx_HSj)*n(idx_NA) &
        +k(1361)*n(idx_N2j)*n(idx_NA) &
        +k(1437)*n(idx_NOj)*n(idx_NA) &
        +k(1445)*n(idx_O2j)*n(idx_NA) &
        +k(1559)*n(idx_SOj)*n(idx_NA) &
        +k(1660)*n(idx_H2Oj)*n(idx_NA) &
        +k(1701)*n(idx_H2Sj)*n(idx_NA) &
        +k(1718)*n(idx_H3j)*n(idx_NA) &
        +k(1735)*n(idx_H3j)*n(idx_NAH) &
        +k(1904)*n(idx_HCOj)*n(idx_NA) &
        +k(1914)*n(idx_HCOj)*n(idx_NAH) &
        +k(2195)*n(idx_C2H2j)*n(idx_NA) &
        +k(2317)*n(idx_CH3j)*n(idx_NA) &
        +k(2389)*n(idx_HCNHj)*n(idx_NA) &
        +k(2390)*n(idx_HCNHj)*n(idx_NA) &
        +k(2402)*n(idx_H2COj)*n(idx_NA) &
        +k(2428)*n(idx_H3Oj)*n(idx_NA) &
        +k(2511)*n(idx_NH3j)*n(idx_NA) &
        +k(2687)*n(idx_C4Hj)*n(idx_NA) &
        +k(2741)*n(idx_H3COj)*n(idx_NA) &
        -k(3138)*n(idx_NAj)*n(idx_H2) &
        -k(3139)*n(idx_NAj)*n(idx_H2O) &
        -k(4201)*n(idx_NAj)*n(idx_E) &
        -k(4228)*n(idx_NAj)*n(idx_Ck) &
        -k(4229)*n(idx_NAj)*n(idx_Hk) &
        -k(4230)*n(idx_NAj)*n(idx_Sk) &
        +k(4254)*n(idx_NA)

    !O+
    !O+
    dn(idx_Oj) = &
        -k(9)*n(idx_Oj)*n(idx_GRAINk) &
        +k(22)*n(idx_O) &
        +k(221)*n(idx_Cj)*n(idx_O2) &
        +k(428)*n(idx_Hj)*n(idx_O) &
        +k(656)*n(idx_HEj)*n(idx_NO) &
        +k(659)*n(idx_HEj)*n(idx_O2) &
        +k(661)*n(idx_HEj)*n(idx_OH) &
        +k(670)*n(idx_HEj)*n(idx_SIO) &
        +k(674)*n(idx_HEj)*n(idx_SO) &
        +k(692)*n(idx_HEj)*n(idx_CO2) &
        +k(726)*n(idx_HEj)*n(idx_N2O) &
        +k(732)*n(idx_HEj)*n(idx_OCN) &
        +k(734)*n(idx_HEj)*n(idx_OCS) &
        +k(967)*n(idx_Nj)*n(idx_O2) &
        -k(1003)*n(idx_Oj)*n(idx_FE) &
        -k(1004)*n(idx_Oj)*n(idx_H) &
        -k(1005)*n(idx_Oj)*n(idx_C2) &
        -k(1006)*n(idx_Oj)*n(idx_C2) &
        -k(1007)*n(idx_Oj)*n(idx_CH) &
        -k(1008)*n(idx_Oj)*n(idx_CH) &
        -k(1009)*n(idx_Oj)*n(idx_CN) &
        -k(1010)*n(idx_Oj)*n(idx_H2) &
        -k(1011)*n(idx_Oj)*n(idx_N2) &
        -k(1012)*n(idx_Oj)*n(idx_NH) &
        -k(1013)*n(idx_Oj)*n(idx_NH) &
        -k(1014)*n(idx_Oj)*n(idx_NO) &
        -k(1015)*n(idx_Oj)*n(idx_O2) &
        -k(1016)*n(idx_Oj)*n(idx_OH) &
        -k(1017)*n(idx_Oj)*n(idx_OH) &
        -k(1018)*n(idx_Oj)*n(idx_C2H) &
        -k(1019)*n(idx_Oj)*n(idx_C2H) &
        -k(1020)*n(idx_Oj)*n(idx_CH2) &
        -k(1021)*n(idx_Oj)*n(idx_CO2) &
        -k(1022)*n(idx_Oj)*n(idx_H2O) &
        -k(1023)*n(idx_Oj)*n(idx_H2S) &
        -k(1024)*n(idx_Oj)*n(idx_H2S) &
        -k(1025)*n(idx_Oj)*n(idx_H2S) &
        -k(1026)*n(idx_Oj)*n(idx_HCN) &
        -k(1027)*n(idx_Oj)*n(idx_HCN) &
        -k(1028)*n(idx_Oj)*n(idx_HCN) &
        -k(1029)*n(idx_Oj)*n(idx_HCO) &
        -k(1030)*n(idx_Oj)*n(idx_HCO) &
        -k(1031)*n(idx_Oj)*n(idx_N2O) &
        -k(1032)*n(idx_Oj)*n(idx_NH2) &
        -k(1033)*n(idx_Oj)*n(idx_NO2) &
        -k(1034)*n(idx_Oj)*n(idx_OCS) &
        -k(1035)*n(idx_Oj)*n(idx_OCS) &
        -k(1036)*n(idx_Oj)*n(idx_SO2) &
        -k(1037)*n(idx_Oj)*n(idx_H2CO) &
        -k(1038)*n(idx_Oj)*n(idx_H2CO) &
        -k(1039)*n(idx_Oj)*n(idx_NH3) &
        -k(1040)*n(idx_Oj)*n(idx_CH4) &
        -k(1041)*n(idx_Oj)*n(idx_CH4) &
        -k(1042)*n(idx_Oj)*n(idx_CH3OH) &
        -k(1043)*n(idx_Oj)*n(idx_CH3OH) &
        -k(1044)*n(idx_Oj)*n(idx_CH3OH) &
        +k(1170)*n(idx_CHj)*n(idx_O2) &
        +k(1207)*n(idx_CNj)*n(idx_O) &
        +k(1239)*n(idx_COj)*n(idx_O) &
        +k(1362)*n(idx_N2j)*n(idx_O) &
        +k(1643)*n(idx_CO2j)*n(idx_O) &
        +k(1875)*n(idx_HCNj)*n(idx_O) &
        -k(4202)*n(idx_Oj)*n(idx_E) &
        -k(4231)*n(idx_Oj)*n(idx_Ck) &
        -k(4232)*n(idx_Oj)*n(idx_Hk) &
        -k(4233)*n(idx_Oj)*n(idx_Sk)

    !S+
    !S+
    dn(idx_Sj) = &
        -k(10)*n(idx_Sj)*n(idx_GRAINk) &
        +k(24)*n(idx_S) &
        +k(205)*n(idx_Cj)*n(idx_S) &
        +k(234)*n(idx_Cj)*n(idx_SO) &
        +k(430)*n(idx_Hj)*n(idx_S) &
        +k(437)*n(idx_Hj)*n(idx_HS) &
        +k(644)*n(idx_HEj)*n(idx_CS) &
        +k(649)*n(idx_HEj)*n(idx_HS) &
        +k(658)*n(idx_HEj)*n(idx_NS) &
        +k(665)*n(idx_HEj)*n(idx_S2) &
        +k(672)*n(idx_HEj)*n(idx_SIS) &
        +k(675)*n(idx_HEj)*n(idx_SO) &
        +k(681)*n(idx_HEj)*n(idx_C2S) &
        +k(699)*n(idx_HEj)*n(idx_H2S) &
        +k(723)*n(idx_HEj)*n(idx_HS2) &
        +k(735)*n(idx_HEj)*n(idx_OCS) &
        +k(744)*n(idx_HEj)*n(idx_SO2) &
        +k(769)*n(idx_HEj)*n(idx_H2CS) &
        +k(983)*n(idx_Nj)*n(idx_OCS) &
        +k(1023)*n(idx_Oj)*n(idx_H2S) &
        +k(1034)*n(idx_Oj)*n(idx_OCS) &
        -k(1056)*n(idx_Sj)*n(idx_FE) &
        -k(1057)*n(idx_Sj)*n(idx_MG) &
        -k(1058)*n(idx_Sj)*n(idx_NA) &
        -k(1059)*n(idx_Sj)*n(idx_SI) &
        -k(1060)*n(idx_Sj)*n(idx_C2) &
        -k(1061)*n(idx_Sj)*n(idx_CH) &
        -k(1062)*n(idx_Sj)*n(idx_NH) &
        -k(1063)*n(idx_Sj)*n(idx_NO) &
        -k(1064)*n(idx_Sj)*n(idx_O2) &
        -k(1065)*n(idx_Sj)*n(idx_OH) &
        -k(1066)*n(idx_Sj)*n(idx_SIC) &
        -k(1067)*n(idx_Sj)*n(idx_SIH) &
        -k(1068)*n(idx_Sj)*n(idx_SIH) &
        -k(1069)*n(idx_Sj)*n(idx_SIS) &
        -k(1070)*n(idx_Sj)*n(idx_C2H) &
        -k(1071)*n(idx_Sj)*n(idx_CH2) &
        -k(1072)*n(idx_Sj)*n(idx_H2S) &
        -k(1073)*n(idx_Sj)*n(idx_H2S) &
        -k(1074)*n(idx_Sj)*n(idx_H2S) &
        -k(1075)*n(idx_Sj)*n(idx_HCO) &
        -k(1076)*n(idx_Sj)*n(idx_HCO) &
        -k(1077)*n(idx_Sj)*n(idx_OCS) &
        -k(1078)*n(idx_Sj)*n(idx_C2H2) &
        -k(1079)*n(idx_Sj)*n(idx_C3H) &
        -k(1080)*n(idx_Sj)*n(idx_HC3) &
        -k(1081)*n(idx_Sj)*n(idx_CH3) &
        -k(1082)*n(idx_Sj)*n(idx_H2CO) &
        -k(1083)*n(idx_Sj)*n(idx_H2CO) &
        -k(1084)*n(idx_Sj)*n(idx_NH3) &
        -k(1085)*n(idx_Sj)*n(idx_C2H3) &
        -k(1086)*n(idx_Sj)*n(idx_C3H2) &
        -k(1087)*n(idx_Sj)*n(idx_H2C3) &
        -k(1088)*n(idx_Sj)*n(idx_C4H) &
        -k(1089)*n(idx_Sj)*n(idx_CH4) &
        -k(1090)*n(idx_Sj)*n(idx_C4H2) &
        -k(1091)*n(idx_Sj)*n(idx_C4H2) &
        -k(1092)*n(idx_Sj)*n(idx_C4H2) &
        -k(1093)*n(idx_Sj)*n(idx_C4H2) &
        -k(1094)*n(idx_Sj)*n(idx_C4H2) &
        +k(1124)*n(idx_C2j)*n(idx_S) &
        +k(1159)*n(idx_CHj)*n(idx_S) &
        +k(1208)*n(idx_CNj)*n(idx_S) &
        +k(1240)*n(idx_COj)*n(idx_S) &
        +k(1314)*n(idx_H2j)*n(idx_H2S) &
        +k(1338)*n(idx_HSj)*n(idx_H) &
        +k(1342)*n(idx_HSj)*n(idx_O) &
        +k(1344)*n(idx_HSj)*n(idx_S) &
        +k(1364)*n(idx_N2j)*n(idx_S) &
        +k(1379)*n(idx_N2j)*n(idx_H2S) &
        +k(1386)*n(idx_N2j)*n(idx_OCS) &
        +k(1396)*n(idx_NHj)*n(idx_S) &
        +k(1446)*n(idx_O2j)*n(idx_S) &
        +k(1471)*n(idx_OHj)*n(idx_S) &
        +k(1566)*n(idx_C2Hj)*n(idx_S) &
        +k(1662)*n(idx_H2Oj)*n(idx_S) &
        +k(1704)*n(idx_H2Sj)*n(idx_S) &
        +k(1876)*n(idx_HCNj)*n(idx_S) &
        +k(2041)*n(idx_HNCj)*n(idx_S) &
        +k(2114)*n(idx_NH2j)*n(idx_S) &
        +k(2403)*n(idx_H2COj)*n(idx_S) &
        -k(3141)*n(idx_Sj)*n(idx_H2) &
        -k(4203)*n(idx_Sj)*n(idx_E) &
        -k(4234)*n(idx_Sj)*n(idx_Ck) &
        -k(4235)*n(idx_Sj)*n(idx_Hk) &
        -k(4236)*n(idx_Sj)*n(idx_Sk) &
        +k(4255)*n(idx_S)

    !SI+
    !SI+
    dn(idx_SIj) = &
        -k(11)*n(idx_SIj)*n(idx_GRAINk) &
        +k(25)*n(idx_SI) &
        +k(206)*n(idx_Cj)*n(idx_SI) &
        +k(226)*n(idx_Cj)*n(idx_SIC) &
        +k(231)*n(idx_Cj)*n(idx_SIO) &
        +k(431)*n(idx_Hj)*n(idx_SI) &
        +k(451)*n(idx_Hj)*n(idx_SIH) &
        +k(631)*n(idx_HEj)*n(idx_SI) &
        +k(667)*n(idx_HEj)*n(idx_SIC) &
        +k(668)*n(idx_HEj)*n(idx_SIH) &
        +k(669)*n(idx_HEj)*n(idx_SIN) &
        +k(671)*n(idx_HEj)*n(idx_SIO) &
        +k(673)*n(idx_HEj)*n(idx_SIS) &
        +k(713)*n(idx_HEj)*n(idx_HCSI) &
        +k(739)*n(idx_HEj)*n(idx_SIC2) &
        +k(740)*n(idx_HEj)*n(idx_SIH2) &
        +k(743)*n(idx_HEj)*n(idx_SIO2) &
        +k(780)*n(idx_HEj)*n(idx_SIC2H) &
        +k(841)*n(idx_HEj)*n(idx_SIC3H) &
        +k(842)*n(idx_HEj)*n(idx_SIC3H) &
        +k(1045)*n(idx_Pj)*n(idx_SI) &
        +k(1059)*n(idx_Sj)*n(idx_SI) &
        -k(1095)*n(idx_SIj)*n(idx_FE) &
        -k(1096)*n(idx_SIj)*n(idx_MG) &
        -k(1097)*n(idx_SIj)*n(idx_NA) &
        -k(1098)*n(idx_SIj)*n(idx_CH) &
        -k(1099)*n(idx_SIj)*n(idx_NH) &
        -k(1100)*n(idx_SIj)*n(idx_OH) &
        -k(1101)*n(idx_SIj)*n(idx_HF) &
        -k(1102)*n(idx_SIj)*n(idx_CH2) &
        -k(1103)*n(idx_SIj)*n(idx_H2O) &
        -k(1104)*n(idx_SIj)*n(idx_HCN) &
        -k(1105)*n(idx_SIj)*n(idx_HNC) &
        -k(1106)*n(idx_SIj)*n(idx_OCS) &
        -k(1107)*n(idx_SIj)*n(idx_C2H2) &
        -k(1108)*n(idx_SIj)*n(idx_C3H) &
        -k(1109)*n(idx_SIj)*n(idx_HC3) &
        -k(1110)*n(idx_SIj)*n(idx_CH3) &
        -k(1111)*n(idx_SIj)*n(idx_CH3) &
        -k(1112)*n(idx_SIj)*n(idx_NH3) &
        -k(1113)*n(idx_SIj)*n(idx_C2H3) &
        -k(1114)*n(idx_SIj)*n(idx_C3H2) &
        -k(1115)*n(idx_SIj)*n(idx_H2C3) &
        -k(1116)*n(idx_SIj)*n(idx_C4H) &
        -k(1117)*n(idx_SIj)*n(idx_C2H4) &
        -k(1118)*n(idx_SIj)*n(idx_C3H3) &
        -k(1119)*n(idx_SIj)*n(idx_C4H2) &
        -k(1120)*n(idx_SIj)*n(idx_C3H4) &
        +k(1162)*n(idx_CHj)*n(idx_SI) &
        +k(1279)*n(idx_CSj)*n(idx_SI) &
        +k(1345)*n(idx_HSj)*n(idx_SI) &
        +k(1438)*n(idx_NOj)*n(idx_SI) &
        +k(1448)*n(idx_O2j)*n(idx_SI) &
        +k(1531)*n(idx_SICj)*n(idx_N) &
        +k(1535)*n(idx_SIHj)*n(idx_H) &
        +k(1540)*n(idx_SIOj)*n(idx_C) &
        +k(1543)*n(idx_SIOj)*n(idx_N) &
        +k(1545)*n(idx_SIOj)*n(idx_O) &
        +k(1546)*n(idx_SIOj)*n(idx_S) &
        +k(1549)*n(idx_SIOj)*n(idx_CO) &
        +k(1552)*n(idx_SIOj)*n(idx_CH2) &
        +k(1554)*n(idx_SISj)*n(idx_H) &
        +k(1665)*n(idx_H2Oj)*n(idx_SI) &
        +k(1705)*n(idx_H2Sj)*n(idx_SI) &
        +k(2200)*n(idx_C2H2j)*n(idx_SI) &
        +k(2304)*n(idx_CH2SIj)*n(idx_C) &
        +k(2307)*n(idx_CH2SIj)*n(idx_N) &
        +k(2308)*n(idx_CH2SIj)*n(idx_O) &
        +k(2310)*n(idx_CH2SIj)*n(idx_S) &
        +k(2323)*n(idx_CH3j)*n(idx_SI) &
        +k(2405)*n(idx_H2COj)*n(idx_SI) &
        +k(2514)*n(idx_NH3j)*n(idx_SI) &
        -k(3142)*n(idx_SIj)*n(idx_H) &
        -k(3143)*n(idx_SIj)*n(idx_O) &
        -k(3144)*n(idx_SIj)*n(idx_H2) &
        -k(3145)*n(idx_SIj)*n(idx_HCN) &
        -k(3146)*n(idx_SIj)*n(idx_C2H2) &
        -k(3147)*n(idx_SIj)*n(idx_CH4) &
        -k(4204)*n(idx_SIj)*n(idx_E) &
        -k(4237)*n(idx_SIj)*n(idx_Ck) &
        -k(4238)*n(idx_SIj)*n(idx_Hk) &
        -k(4239)*n(idx_SIj)*n(idx_Sk) &
        +k(4256)*n(idx_SI) &
        +k(4417)*n(idx_SIHj)

    !H3+
    !H3+
    dn(idx_H3j) = &
        -k(12)*n(idx_H3j)*n(idx_GRAINk) &
        +k(1295)*n(idx_H2j)*n(idx_H2) &
        +k(1318)*n(idx_H2j)*n(idx_HCO) &
        +k(1335)*n(idx_HEHj)*n(idx_H2) &
        +k(1406)*n(idx_NHj)*n(idx_H2) &
        -k(1712)*n(idx_H3j)*n(idx_C) &
        -k(1713)*n(idx_H3j)*n(idx_CL) &
        -k(1714)*n(idx_H3j)*n(idx_FE) &
        -k(1715)*n(idx_H3j)*n(idx_MG) &
        -k(1716)*n(idx_H3j)*n(idx_N) &
        -k(1717)*n(idx_H3j)*n(idx_F) &
        -k(1718)*n(idx_H3j)*n(idx_NA) &
        -k(1719)*n(idx_H3j)*n(idx_O) &
        -k(1720)*n(idx_H3j)*n(idx_P) &
        -k(1721)*n(idx_H3j)*n(idx_S) &
        -k(1722)*n(idx_H3j)*n(idx_SI) &
        -k(1723)*n(idx_H3j)*n(idx_C2) &
        -k(1724)*n(idx_H3j)*n(idx_CH) &
        -k(1725)*n(idx_H3j)*n(idx_CN) &
        -k(1726)*n(idx_H3j)*n(idx_CO) &
        -k(1727)*n(idx_H3j)*n(idx_CO) &
        -k(1728)*n(idx_H3j)*n(idx_CP) &
        -k(1729)*n(idx_H3j)*n(idx_CS) &
        -k(1730)*n(idx_H3j)*n(idx_HCL) &
        -k(1731)*n(idx_H3j)*n(idx_HF) &
        -k(1732)*n(idx_H3j)*n(idx_HS) &
        -k(1733)*n(idx_H3j)*n(idx_MGH) &
        -k(1734)*n(idx_H3j)*n(idx_N2) &
        -k(1735)*n(idx_H3j)*n(idx_NAH) &
        -k(1736)*n(idx_H3j)*n(idx_NH) &
        -k(1737)*n(idx_H3j)*n(idx_NO) &
        -k(1738)*n(idx_H3j)*n(idx_NS) &
        -k(1739)*n(idx_H3j)*n(idx_O2) &
        -k(1740)*n(idx_H3j)*n(idx_OH) &
        -k(1741)*n(idx_H3j)*n(idx_PH) &
        -k(1742)*n(idx_H3j)*n(idx_PN) &
        -k(1743)*n(idx_H3j)*n(idx_PO) &
        -k(1744)*n(idx_H3j)*n(idx_S2) &
        -k(1745)*n(idx_H3j)*n(idx_SIC) &
        -k(1746)*n(idx_H3j)*n(idx_SIH) &
        -k(1747)*n(idx_H3j)*n(idx_SIN) &
        -k(1748)*n(idx_H3j)*n(idx_SIO) &
        -k(1749)*n(idx_H3j)*n(idx_SIS) &
        -k(1750)*n(idx_H3j)*n(idx_SO) &
        -k(1751)*n(idx_H3j)*n(idx_C2H) &
        -k(1752)*n(idx_H3j)*n(idx_C2N) &
        -k(1753)*n(idx_H3j)*n(idx_C2S) &
        -k(1754)*n(idx_H3j)*n(idx_C3) &
        -k(1755)*n(idx_H3j)*n(idx_CCO) &
        -k(1756)*n(idx_H3j)*n(idx_CCP) &
        -k(1757)*n(idx_H3j)*n(idx_CH2) &
        -k(1758)*n(idx_H3j)*n(idx_CO2) &
        -k(1759)*n(idx_H3j)*n(idx_H2O) &
        -k(1760)*n(idx_H3j)*n(idx_H2S) &
        -k(1761)*n(idx_H3j)*n(idx_HCN) &
        -k(1762)*n(idx_H3j)*n(idx_HCO) &
        -k(1763)*n(idx_H3j)*n(idx_HCP) &
        -k(1764)*n(idx_H3j)*n(idx_HCS) &
        -k(1765)*n(idx_H3j)*n(idx_HCSI) &
        -k(1766)*n(idx_H3j)*n(idx_HNC) &
        -k(1767)*n(idx_H3j)*n(idx_HNO) &
        -k(1768)*n(idx_H3j)*n(idx_HNSI) &
        -k(1769)*n(idx_H3j)*n(idx_HPO) &
        -k(1770)*n(idx_H3j)*n(idx_HS2) &
        -k(1771)*n(idx_H3j)*n(idx_NAOH) &
        -k(1772)*n(idx_H3j)*n(idx_NH2) &
        -k(1773)*n(idx_H3j)*n(idx_NO2) &
        -k(1774)*n(idx_H3j)*n(idx_OCS) &
        -k(1775)*n(idx_H3j)*n(idx_PH2) &
        -k(1776)*n(idx_H3j)*n(idx_SIC2) &
        -k(1777)*n(idx_H3j)*n(idx_SIH2) &
        -k(1778)*n(idx_H3j)*n(idx_SINC) &
        -k(1779)*n(idx_H3j)*n(idx_SIO2) &
        -k(1780)*n(idx_H3j)*n(idx_SO2) &
        -k(1781)*n(idx_H3j)*n(idx_C2H2) &
        -k(1782)*n(idx_H3j)*n(idx_C3H) &
        -k(1783)*n(idx_H3j)*n(idx_HC3) &
        -k(1784)*n(idx_H3j)*n(idx_C3N) &
        -k(1785)*n(idx_H3j)*n(idx_C3O) &
        -k(1786)*n(idx_H3j)*n(idx_C3P) &
        -k(1787)*n(idx_H3j)*n(idx_C3S) &
        -k(1788)*n(idx_H3j)*n(idx_C4) &
        -k(1789)*n(idx_H3j)*n(idx_CH3) &
        -k(1790)*n(idx_H3j)*n(idx_H2CO) &
        -k(1791)*n(idx_H3j)*n(idx_H2CS) &
        -k(1792)*n(idx_H3j)*n(idx_H2S2) &
        -k(1793)*n(idx_H3j)*n(idx_H2SIO) &
        -k(1794)*n(idx_H3j)*n(idx_HCCP) &
        -k(1795)*n(idx_H3j)*n(idx_NH3) &
        -k(1796)*n(idx_H3j)*n(idx_SIC2H) &
        -k(1797)*n(idx_H3j)*n(idx_SIC3) &
        -k(1798)*n(idx_H3j)*n(idx_SICH2) &
        -k(1799)*n(idx_H3j)*n(idx_SIH3) &
        -k(1800)*n(idx_H3j)*n(idx_CH2CN) &
        -k(1801)*n(idx_H3j)*n(idx_C2H2O) &
        -k(1802)*n(idx_H3j)*n(idx_C2H3) &
        -k(1803)*n(idx_H3j)*n(idx_C3H2) &
        -k(1804)*n(idx_H3j)*n(idx_H2C3) &
        -k(1805)*n(idx_H3j)*n(idx_C4H) &
        -k(1806)*n(idx_H3j)*n(idx_C4P) &
        -k(1807)*n(idx_H3j)*n(idx_C4S) &
        -k(1808)*n(idx_H3j)*n(idx_C5) &
        -k(1809)*n(idx_H3j)*n(idx_CH2O2) &
        -k(1810)*n(idx_H3j)*n(idx_CH2O2) &
        -k(1811)*n(idx_H3j)*n(idx_CH2PH) &
        -k(1812)*n(idx_H3j)*n(idx_CH3N) &
        -k(1813)*n(idx_H3j)*n(idx_CH4) &
        -k(1814)*n(idx_H3j)*n(idx_HCNC2) &
        -k(1815)*n(idx_H3j)*n(idx_HC2NC) &
        -k(1816)*n(idx_H3j)*n(idx_HC3N) &
        -k(1817)*n(idx_H3j)*n(idx_HNC3) &
        -k(1818)*n(idx_H3j)*n(idx_NH2CN) &
        -k(1819)*n(idx_H3j)*n(idx_SIC2H2) &
        -k(1820)*n(idx_H3j)*n(idx_SIC3H) &
        -k(1821)*n(idx_H3j)*n(idx_SIC4) &
        -k(1822)*n(idx_H3j)*n(idx_SICH3) &
        -k(1823)*n(idx_H3j)*n(idx_SIH4) &
        -k(1824)*n(idx_H3j)*n(idx_CH3CN) &
        -k(1825)*n(idx_H3j)*n(idx_C2H4) &
        -k(1826)*n(idx_H3j)*n(idx_C2H4) &
        -k(1827)*n(idx_H3j)*n(idx_C3H3) &
        -k(1828)*n(idx_H3j)*n(idx_C4H2) &
        -k(1829)*n(idx_H3j)*n(idx_C5H) &
        -k(1830)*n(idx_H3j)*n(idx_C5N) &
        -k(1831)*n(idx_H3j)*n(idx_C6) &
        -k(1832)*n(idx_H3j)*n(idx_CH3OH) &
        -k(1833)*n(idx_H3j)*n(idx_CH3OH) &
        -k(1834)*n(idx_H3j)*n(idx_CH3OH) &
        -k(1835)*n(idx_H3j)*n(idx_NH2CHO) &
        -k(1836)*n(idx_H3j)*n(idx_C2H4O) &
        -k(1837)*n(idx_H3j)*n(idx_C2H5) &
        -k(1838)*n(idx_H3j)*n(idx_C3H3N) &
        -k(1839)*n(idx_H3j)*n(idx_C3H4) &
        -k(1840)*n(idx_H3j)*n(idx_C3H4) &
        -k(1841)*n(idx_H3j)*n(idx_C3H4) &
        -k(1842)*n(idx_H3j)*n(idx_C4H3) &
        -k(1843)*n(idx_H3j)*n(idx_C5H2) &
        -k(1844)*n(idx_H3j)*n(idx_C6H) &
        -k(1845)*n(idx_H3j)*n(idx_C7) &
        -k(1846)*n(idx_H3j)*n(idx_CH5N) &
        -k(1847)*n(idx_H3j)*n(idx_HC5N) &
        -k(1848)*n(idx_H3j)*n(idx_C6H2) &
        -k(1849)*n(idx_H3j)*n(idx_C7H) &
        -k(1850)*n(idx_H3j)*n(idx_C7N) &
        -k(1851)*n(idx_H3j)*n(idx_C8) &
        -k(1852)*n(idx_H3j)*n(idx_CH3C3N) &
        -k(1853)*n(idx_H3j)*n(idx_HCOOCH3) &
        -k(1854)*n(idx_H3j)*n(idx_C2H5OH) &
        -k(1855)*n(idx_H3j)*n(idx_C2H5OH) &
        -k(1856)*n(idx_H3j)*n(idx_C2H5OH) &
        -k(1857)*n(idx_H3j)*n(idx_C7H2) &
        -k(1858)*n(idx_H3j)*n(idx_C8H) &
        -k(1859)*n(idx_H3j)*n(idx_C9) &
        -k(1860)*n(idx_H3j)*n(idx_CH3C4H) &
        -k(1861)*n(idx_H3j)*n(idx_CH3OCH3) &
        -k(1862)*n(idx_H3j)*n(idx_HC7N) &
        -k(1863)*n(idx_H3j)*n(idx_C2H6CO) &
        -k(1864)*n(idx_H3j)*n(idx_C8H2) &
        -k(1865)*n(idx_H3j)*n(idx_C9H) &
        -k(1866)*n(idx_H3j)*n(idx_C9N) &
        -k(1867)*n(idx_H3j)*n(idx_CH3C5N) &
        -k(1868)*n(idx_H3j)*n(idx_C9H2) &
        -k(1869)*n(idx_H3j)*n(idx_CH3C6H) &
        -k(1870)*n(idx_H3j)*n(idx_CH3C7N) &
        -k(1871)*n(idx_H3j)*n(idx_HC9N) &
        -k(1872)*n(idx_H3j)*n(idx_C6H6) &
        +k(2156)*n(idx_O2Hj)*n(idx_H2) &
        -k(3715)*n(idx_H3j)*n(idx_E) &
        -k(3716)*n(idx_H3j)*n(idx_E) &
        -k(4241)*n(idx_H3j)*n(idx_Hk) &
        -k(4420)*n(idx_H3j) &
        -k(4421)*n(idx_H3j)

    !HCO+
    !HCO+
    dn(idx_HCOj) = &
        -k(13)*n(idx_HCOj)*n(idx_GRAINk) &
        +k(77)*n(idx_HCO) &
        +k(247)*n(idx_Cj)*n(idx_H2O) &
        +k(254)*n(idx_Cj)*n(idx_HCO) &
        +k(261)*n(idx_Cj)*n(idx_NAOH) &
        +k(284)*n(idx_Cj)*n(idx_H2CO) &
        +k(466)*n(idx_Hj)*n(idx_CO2) &
        +k(472)*n(idx_Hj)*n(idx_HCO) &
        +k(501)*n(idx_Hj)*n(idx_H2CO) &
        +k(576)*n(idx_Hj)*n(idx_NH2CHO) &
        +k(768)*n(idx_HEj)*n(idx_H2CO) &
        +k(870)*n(idx_HEj)*n(idx_NH2CHO) &
        +k(875)*n(idx_HEj)*n(idx_C2H4O) &
        +k(981)*n(idx_Nj)*n(idx_HCO) &
        +k(987)*n(idx_Nj)*n(idx_H2CO) &
        +k(1028)*n(idx_Oj)*n(idx_HCN) &
        +k(1030)*n(idx_Oj)*n(idx_HCO) &
        +k(1037)*n(idx_Oj)*n(idx_H2CO) &
        +k(1076)*n(idx_Sj)*n(idx_HCO) &
        +k(1083)*n(idx_Sj)*n(idx_H2CO) &
        +k(1141)*n(idx_C2j)*n(idx_HCO) &
        +k(1172)*n(idx_CHj)*n(idx_O2) &
        +k(1176)*n(idx_CHj)*n(idx_CO2) &
        +k(1177)*n(idx_CHj)*n(idx_H2O) &
        +k(1186)*n(idx_CHj)*n(idx_HCO) &
        +k(1193)*n(idx_CHj)*n(idx_H2CO) &
        +k(1226)*n(idx_CNj)*n(idx_H2O) &
        +k(1232)*n(idx_CNj)*n(idx_HCO) &
        +k(1234)*n(idx_CNj)*n(idx_H2CO) &
        +k(1243)*n(idx_COj)*n(idx_CH) &
        +k(1244)*n(idx_COj)*n(idx_H2) &
        +k(1246)*n(idx_COj)*n(idx_NH) &
        +k(1250)*n(idx_COj)*n(idx_OH) &
        +k(1252)*n(idx_COj)*n(idx_C2H) &
        +k(1254)*n(idx_COj)*n(idx_CH2) &
        +k(1257)*n(idx_COj)*n(idx_H2O) &
        +k(1259)*n(idx_COj)*n(idx_H2S) &
        +k(1261)*n(idx_COj)*n(idx_HCO) &
        +k(1262)*n(idx_COj)*n(idx_NH2) &
        +k(1265)*n(idx_COj)*n(idx_H2CO) &
        +k(1267)*n(idx_COj)*n(idx_NH3) &
        +k(1269)*n(idx_COj)*n(idx_CH4) &
        +k(1294)*n(idx_H2j)*n(idx_CO) &
        +k(1319)*n(idx_H2j)*n(idx_HCO) &
        +k(1323)*n(idx_H2j)*n(idx_H2CO) &
        +k(1383)*n(idx_N2j)*n(idx_HCO) &
        +k(1388)*n(idx_N2j)*n(idx_H2CO) &
        +k(1404)*n(idx_NHj)*n(idx_CO) &
        +k(1430)*n(idx_NHj)*n(idx_H2CO) &
        +k(1451)*n(idx_O2j)*n(idx_CH) &
        +k(1458)*n(idx_O2j)*n(idx_HCO) &
        +k(1462)*n(idx_O2j)*n(idx_H2CO) &
        +k(1480)*n(idx_OHj)*n(idx_CO) &
        +k(1502)*n(idx_OHj)*n(idx_HCO) &
        +k(1548)*n(idx_SIOj)*n(idx_CH) &
        +k(1553)*n(idx_SIOj)*n(idx_HCO) &
        +k(1565)*n(idx_C2Hj)*n(idx_O) &
        +k(1597)*n(idx_C2Nj)*n(idx_H2O) &
        +k(1606)*n(idx_CH2j)*n(idx_O) &
        +k(1613)*n(idx_CH2j)*n(idx_O2) &
        +k(1629)*n(idx_CH2j)*n(idx_H2CO) &
        +k(1638)*n(idx_CNCj)*n(idx_H2O) &
        +k(1642)*n(idx_CO2j)*n(idx_H) &
        +k(1654)*n(idx_H2CLj)*n(idx_CO) &
        +k(1670)*n(idx_H2Oj)*n(idx_CO) &
        +k(1685)*n(idx_H2Oj)*n(idx_HCO) &
        +k(1709)*n(idx_H2Sj)*n(idx_HCO) &
        +k(1726)*n(idx_H3j)*n(idx_CO) &
        +k(1809)*n(idx_H3j)*n(idx_CH2O2) &
        +k(1880)*n(idx_HCNj)*n(idx_CO) &
        -k(1901)*n(idx_HCOj)*n(idx_C) &
        -k(1902)*n(idx_HCOj)*n(idx_FE) &
        -k(1903)*n(idx_HCOj)*n(idx_MG) &
        -k(1904)*n(idx_HCOj)*n(idx_NA) &
        -k(1905)*n(idx_HCOj)*n(idx_P) &
        -k(1906)*n(idx_HCOj)*n(idx_S) &
        -k(1907)*n(idx_HCOj)*n(idx_SI) &
        -k(1908)*n(idx_HCOj)*n(idx_C2) &
        -k(1909)*n(idx_HCOj)*n(idx_CH) &
        -k(1910)*n(idx_HCOj)*n(idx_CP) &
        -k(1911)*n(idx_HCOj)*n(idx_CS) &
        -k(1912)*n(idx_HCOj)*n(idx_HS) &
        -k(1913)*n(idx_HCOj)*n(idx_MGH) &
        -k(1914)*n(idx_HCOj)*n(idx_NAH) &
        -k(1915)*n(idx_HCOj)*n(idx_NH) &
        -k(1916)*n(idx_HCOj)*n(idx_NS) &
        -k(1917)*n(idx_HCOj)*n(idx_OH) &
        -k(1918)*n(idx_HCOj)*n(idx_OH) &
        -k(1919)*n(idx_HCOj)*n(idx_PH) &
        -k(1920)*n(idx_HCOj)*n(idx_PN) &
        -k(1921)*n(idx_HCOj)*n(idx_PO) &
        -k(1922)*n(idx_HCOj)*n(idx_S2) &
        -k(1923)*n(idx_HCOj)*n(idx_SIC) &
        -k(1924)*n(idx_HCOj)*n(idx_SIH) &
        -k(1925)*n(idx_HCOj)*n(idx_SIO) &
        -k(1926)*n(idx_HCOj)*n(idx_SIS) &
        -k(1927)*n(idx_HCOj)*n(idx_SO) &
        -k(1928)*n(idx_HCOj)*n(idx_C2H) &
        -k(1929)*n(idx_HCOj)*n(idx_C2S) &
        -k(1930)*n(idx_HCOj)*n(idx_C3) &
        -k(1931)*n(idx_HCOj)*n(idx_CCO) &
        -k(1932)*n(idx_HCOj)*n(idx_CCP) &
        -k(1933)*n(idx_HCOj)*n(idx_CH2) &
        -k(1934)*n(idx_HCOj)*n(idx_H2O) &
        -k(1935)*n(idx_HCOj)*n(idx_H2S) &
        -k(1936)*n(idx_HCOj)*n(idx_HCN) &
        -k(1937)*n(idx_HCOj)*n(idx_HCO) &
        -k(1938)*n(idx_HCOj)*n(idx_HCP) &
        -k(1939)*n(idx_HCOj)*n(idx_HCSI) &
        -k(1940)*n(idx_HCOj)*n(idx_HNC) &
        -k(1941)*n(idx_HCOj)*n(idx_HNO) &
        -k(1942)*n(idx_HCOj)*n(idx_HNSI) &
        -k(1943)*n(idx_HCOj)*n(idx_HPO) &
        -k(1944)*n(idx_HCOj)*n(idx_HS2) &
        -k(1945)*n(idx_HCOj)*n(idx_NAOH) &
        -k(1946)*n(idx_HCOj)*n(idx_NH2) &
        -k(1947)*n(idx_HCOj)*n(idx_OCS) &
        -k(1948)*n(idx_HCOj)*n(idx_PH2) &
        -k(1949)*n(idx_HCOj)*n(idx_SIC2) &
        -k(1950)*n(idx_HCOj)*n(idx_SIH2) &
        -k(1951)*n(idx_HCOj)*n(idx_SINC) &
        -k(1952)*n(idx_HCOj)*n(idx_SIO2) &
        -k(1953)*n(idx_HCOj)*n(idx_C2H2) &
        -k(1954)*n(idx_HCOj)*n(idx_C3H) &
        -k(1955)*n(idx_HCOj)*n(idx_HC3) &
        -k(1956)*n(idx_HCOj)*n(idx_C3N) &
        -k(1957)*n(idx_HCOj)*n(idx_C3O) &
        -k(1958)*n(idx_HCOj)*n(idx_C3P) &
        -k(1959)*n(idx_HCOj)*n(idx_C3S) &
        -k(1960)*n(idx_HCOj)*n(idx_C4) &
        -k(1961)*n(idx_HCOj)*n(idx_H2CO) &
        -k(1962)*n(idx_HCOj)*n(idx_H2CS) &
        -k(1963)*n(idx_HCOj)*n(idx_H2S2) &
        -k(1964)*n(idx_HCOj)*n(idx_H2SIO) &
        -k(1965)*n(idx_HCOj)*n(idx_HCCP) &
        -k(1966)*n(idx_HCOj)*n(idx_NH3) &
        -k(1967)*n(idx_HCOj)*n(idx_SIC2H) &
        -k(1968)*n(idx_HCOj)*n(idx_SIC3) &
        -k(1969)*n(idx_HCOj)*n(idx_SICH2) &
        -k(1970)*n(idx_HCOj)*n(idx_C2H2O) &
        -k(1971)*n(idx_HCOj)*n(idx_C2H3) &
        -k(1972)*n(idx_HCOj)*n(idx_C3H2) &
        -k(1973)*n(idx_HCOj)*n(idx_H2C3) &
        -k(1974)*n(idx_HCOj)*n(idx_C4H) &
        -k(1975)*n(idx_HCOj)*n(idx_C4P) &
        -k(1976)*n(idx_HCOj)*n(idx_C4S) &
        -k(1977)*n(idx_HCOj)*n(idx_C5) &
        -k(1978)*n(idx_HCOj)*n(idx_CH2O2) &
        -k(1979)*n(idx_HCOj)*n(idx_CH2PH) &
        -k(1980)*n(idx_HCOj)*n(idx_CH3N) &
        -k(1981)*n(idx_HCOj)*n(idx_HCNC2) &
        -k(1982)*n(idx_HCOj)*n(idx_HC2NC) &
        -k(1983)*n(idx_HCOj)*n(idx_HC3N) &
        -k(1984)*n(idx_HCOj)*n(idx_HNC3) &
        -k(1985)*n(idx_HCOj)*n(idx_NH2CN) &
        -k(1986)*n(idx_HCOj)*n(idx_SIC2H2) &
        -k(1987)*n(idx_HCOj)*n(idx_SIC3H) &
        -k(1988)*n(idx_HCOj)*n(idx_SIC4) &
        -k(1989)*n(idx_HCOj)*n(idx_SICH3) &
        -k(1990)*n(idx_HCOj)*n(idx_SIH4) &
        -k(1991)*n(idx_HCOj)*n(idx_CH3CN) &
        -k(1992)*n(idx_HCOj)*n(idx_C2H4) &
        -k(1993)*n(idx_HCOj)*n(idx_C3H3) &
        -k(1994)*n(idx_HCOj)*n(idx_C4H2) &
        -k(1995)*n(idx_HCOj)*n(idx_C5H) &
        -k(1996)*n(idx_HCOj)*n(idx_C5N) &
        -k(1997)*n(idx_HCOj)*n(idx_C6) &
        -k(1998)*n(idx_HCOj)*n(idx_CH3OH) &
        -k(1999)*n(idx_HCOj)*n(idx_NH2CHO) &
        -k(2000)*n(idx_HCOj)*n(idx_C2H4O) &
        -k(2001)*n(idx_HCOj)*n(idx_C2H5) &
        -k(2002)*n(idx_HCOj)*n(idx_C3H3N) &
        -k(2003)*n(idx_HCOj)*n(idx_C3H4) &
        -k(2004)*n(idx_HCOj)*n(idx_C4H3) &
        -k(2005)*n(idx_HCOj)*n(idx_C5H2) &
        -k(2006)*n(idx_HCOj)*n(idx_C6H) &
        -k(2007)*n(idx_HCOj)*n(idx_C7) &
        -k(2008)*n(idx_HCOj)*n(idx_CH5N) &
        -k(2009)*n(idx_HCOj)*n(idx_HC5N) &
        -k(2010)*n(idx_HCOj)*n(idx_C6H2) &
        -k(2011)*n(idx_HCOj)*n(idx_C7H) &
        -k(2012)*n(idx_HCOj)*n(idx_C7N) &
        -k(2013)*n(idx_HCOj)*n(idx_C8) &
        -k(2014)*n(idx_HCOj)*n(idx_CH3C3N) &
        -k(2015)*n(idx_HCOj)*n(idx_HCOOCH3) &
        -k(2016)*n(idx_HCOj)*n(idx_C2H5OH) &
        -k(2017)*n(idx_HCOj)*n(idx_C2H5OH) &
        -k(2018)*n(idx_HCOj)*n(idx_C7H2) &
        -k(2019)*n(idx_HCOj)*n(idx_C8H) &
        -k(2020)*n(idx_HCOj)*n(idx_C9) &
        -k(2021)*n(idx_HCOj)*n(idx_CH3C4H) &
        -k(2022)*n(idx_HCOj)*n(idx_CH3OCH3) &
        -k(2023)*n(idx_HCOj)*n(idx_HC7N) &
        -k(2024)*n(idx_HCOj)*n(idx_C2H6CO) &
        -k(2025)*n(idx_HCOj)*n(idx_C8H2) &
        -k(2026)*n(idx_HCOj)*n(idx_C9H) &
        -k(2027)*n(idx_HCOj)*n(idx_C9N) &
        -k(2028)*n(idx_HCOj)*n(idx_CH3C5N) &
        -k(2029)*n(idx_HCOj)*n(idx_C9H2) &
        -k(2030)*n(idx_HCOj)*n(idx_CH3C6H) &
        -k(2031)*n(idx_HCOj)*n(idx_CH3C7N) &
        -k(2032)*n(idx_HCOj)*n(idx_HC9N) &
        -k(2033)*n(idx_HCOj)*n(idx_C6H6) &
        +k(2037)*n(idx_HCSj)*n(idx_O) &
        +k(2064)*n(idx_HNOj)*n(idx_CO) &
        +k(2079)*n(idx_HNSIj)*n(idx_CO) &
        +k(2082)*n(idx_HOCj)*n(idx_CO) &
        +k(2083)*n(idx_HOCj)*n(idx_H2) &
        +k(2090)*n(idx_N2Hj)*n(idx_CO) &
        +k(2139)*n(idx_NH2j)*n(idx_HCO) &
        +k(2155)*n(idx_O2Hj)*n(idx_CO) &
        +k(2196)*n(idx_C2H2j)*n(idx_O) &
        +k(2209)*n(idx_C2H2j)*n(idx_O2) &
        +k(2216)*n(idx_C2H2j)*n(idx_HCO) &
        +k(2277)*n(idx_C3Hj)*n(idx_O2) &
        +k(2281)*n(idx_C3Hj)*n(idx_H2O) &
        +k(2309)*n(idx_CH2SIj)*n(idx_O) &
        +k(2319)*n(idx_CH3j)*n(idx_O) &
        +k(2343)*n(idx_CH3j)*n(idx_HCO) &
        +k(2352)*n(idx_CH3j)*n(idx_H2CO) &
        +k(2411)*n(idx_H2COj)*n(idx_O2) &
        +k(2417)*n(idx_H2COj)*n(idx_HCO) &
        +k(2427)*n(idx_H3Oj)*n(idx_C) &
        +k(2500)*n(idx_HCO2j)*n(idx_O) &
        +k(2501)*n(idx_HCO2j)*n(idx_CO) &
        +k(2524)*n(idx_NH3j)*n(idx_HCO) &
        +k(2540)*n(idx_SINCHj)*n(idx_O) &
        +k(2616)*n(idx_C3H2j)*n(idx_O) &
        +k(2617)*n(idx_H2C3j)*n(idx_O) &
        +k(2688)*n(idx_C4Hj)*n(idx_O) &
        +k(2711)*n(idx_C4Nj)*n(idx_H2O) &
        +k(2718)*n(idx_CH4j)*n(idx_CO) &
        +k(2753)*n(idx_SIH4j)*n(idx_CO) &
        +k(2756)*n(idx_CH3CNj)*n(idx_CO) &
        +k(2764)*n(idx_C2H4j)*n(idx_O) &
        +k(2902)*n(idx_C5Hj)*n(idx_O) &
        +k(2918)*n(idx_CH5j)*n(idx_CO) &
        +k(2944)*n(idx_C2H5j)*n(idx_O) &
        +k(2962)*n(idx_C3H4j)*n(idx_O) &
        +k(2968)*n(idx_C4H3j)*n(idx_O) &
        +k(2969)*n(idx_C4H3j)*n(idx_O) &
        +k(2991)*n(idx_C5H2j)*n(idx_O) &
        +k(3015)*n(idx_C6Hj)*n(idx_O) &
        +k(3025)*n(idx_C3H5j)*n(idx_O) &
        +k(3033)*n(idx_C5H3j)*n(idx_O) &
        +k(3036)*n(idx_C6H2j)*n(idx_O) &
        +k(3054)*n(idx_C7Hj)*n(idx_O) &
        +k(3064)*n(idx_C6H3j)*n(idx_O) &
        +k(3068)*n(idx_C7H2j)*n(idx_O) &
        +k(3083)*n(idx_C7H3j)*n(idx_O) &
        +k(3086)*n(idx_C8H2j)*n(idx_O) &
        +k(3090)*n(idx_C9Hj)*n(idx_O) &
        +k(3101)*n(idx_C8H3j)*n(idx_O) &
        +k(3104)*n(idx_C9H2j)*n(idx_O) &
        +k(3108)*n(idx_C9H3j)*n(idx_O) &
        -k(3153)*n(idx_HCOj)*n(idx_H2O) &
        -k(3154)*n(idx_HCOj)*n(idx_CH4) &
        +k(3254)*n(idx_O)*n(idx_CH) &
        -k(3718)*n(idx_HCOj)*n(idx_E) &
        -k(3719)*n(idx_HCOj)*n(idx_E) &
        -k(3720)*n(idx_HCOj)*n(idx_E) &
        -k(4242)*n(idx_HCOj)*n(idx_Hk) &
        +k(4299)*n(idx_HCO) &
        +k(4324)*n(idx_H2CO)

    !CL+
    !CL+
    dn(idx_CLj) = &
        +k(15)*n(idx_CL) &
        -k(421)*n(idx_CLj)*n(idx_H2) &
        -k(422)*n(idx_CLj)*n(idx_O2) &
        +k(637)*n(idx_HEj)*n(idx_CLO) &
        +k(647)*n(idx_HEj)*n(idx_HCL) &
        -k(4195)*n(idx_CLj)*n(idx_E) &
        +k(4251)*n(idx_CL)

    !P+
    !P+
    dn(idx_Pj) = &
        +k(23)*n(idx_P) &
        +k(204)*n(idx_Cj)*n(idx_P) &
        +k(429)*n(idx_Hj)*n(idx_P) &
        +k(630)*n(idx_HEj)*n(idx_P) &
        +k(642)*n(idx_HEj)*n(idx_CP) &
        +k(662)*n(idx_HEj)*n(idx_PH) &
        +k(663)*n(idx_HEj)*n(idx_PN) &
        +k(664)*n(idx_HEj)*n(idx_PO) &
        +k(688)*n(idx_HEj)*n(idx_CCP) &
        +k(710)*n(idx_HEj)*n(idx_HCP) &
        +k(738)*n(idx_HEj)*n(idx_PH2) &
        +k(758)*n(idx_HEj)*n(idx_C3P) &
        -k(1045)*n(idx_Pj)*n(idx_SI) &
        -k(1046)*n(idx_Pj)*n(idx_O2) &
        -k(1047)*n(idx_Pj)*n(idx_OH) &
        -k(1048)*n(idx_Pj)*n(idx_H2O) &
        -k(1049)*n(idx_Pj)*n(idx_H2O) &
        -k(1050)*n(idx_Pj)*n(idx_C2H2) &
        -k(1051)*n(idx_Pj)*n(idx_C2H2) &
        -k(1052)*n(idx_Pj)*n(idx_NH3) &
        -k(1053)*n(idx_Pj)*n(idx_NH3) &
        -k(1054)*n(idx_Pj)*n(idx_CH4) &
        -k(1055)*n(idx_Pj)*n(idx_C2H4) &
        +k(1272)*n(idx_CPj)*n(idx_O) &
        -k(3140)*n(idx_Pj)*n(idx_H2)

    !CO+
    !CO+
    dn(idx_COj) = &
        +k(32)*n(idx_CO) &
        +k(222)*n(idx_Cj)*n(idx_O2) &
        +k(223)*n(idx_Cj)*n(idx_OH) &
        +k(235)*n(idx_Cj)*n(idx_SO) &
        +k(246)*n(idx_Cj)*n(idx_CO2) &
        +k(263)*n(idx_Cj)*n(idx_OCN) &
        +k(470)*n(idx_Hj)*n(idx_HCO) &
        +k(693)*n(idx_HEj)*n(idx_CO2) &
        +k(707)*n(idx_HEj)*n(idx_HCO) &
        +k(736)*n(idx_HEj)*n(idx_OCS) &
        +k(767)*n(idx_HEj)*n(idx_H2CO) &
        +k(788)*n(idx_HEj)*n(idx_C2H2O) &
        +k(874)*n(idx_HEj)*n(idx_NH2CHO) &
        +k(960)*n(idx_Nj)*n(idx_CO) &
        +k(974)*n(idx_Nj)*n(idx_CO2) &
        +k(1006)*n(idx_Oj)*n(idx_C2) &
        +k(1008)*n(idx_Oj)*n(idx_CH) &
        +k(1018)*n(idx_Oj)*n(idx_C2H) &
        +k(1026)*n(idx_Oj)*n(idx_HCN) &
        +k(1123)*n(idx_C2j)*n(idx_O) &
        +k(1133)*n(idx_C2j)*n(idx_O2) &
        +k(1158)*n(idx_CHj)*n(idx_O) &
        +k(1171)*n(idx_CHj)*n(idx_O2) &
        +k(1173)*n(idx_CHj)*n(idx_OH) &
        +k(1211)*n(idx_CNj)*n(idx_CO) &
        -k(1236)*n(idx_COj)*n(idx_C) &
        -k(1237)*n(idx_COj)*n(idx_H) &
        -k(1238)*n(idx_COj)*n(idx_N) &
        -k(1239)*n(idx_COj)*n(idx_O) &
        -k(1240)*n(idx_COj)*n(idx_S) &
        -k(1241)*n(idx_COj)*n(idx_C2) &
        -k(1242)*n(idx_COj)*n(idx_CH) &
        -k(1243)*n(idx_COj)*n(idx_CH) &
        -k(1244)*n(idx_COj)*n(idx_H2) &
        -k(1245)*n(idx_COj)*n(idx_NH) &
        -k(1246)*n(idx_COj)*n(idx_NH) &
        -k(1247)*n(idx_COj)*n(idx_NO) &
        -k(1248)*n(idx_COj)*n(idx_O2) &
        -k(1249)*n(idx_COj)*n(idx_OH) &
        -k(1250)*n(idx_COj)*n(idx_OH) &
        -k(1251)*n(idx_COj)*n(idx_C2H) &
        -k(1252)*n(idx_COj)*n(idx_C2H) &
        -k(1253)*n(idx_COj)*n(idx_CH2) &
        -k(1254)*n(idx_COj)*n(idx_CH2) &
        -k(1255)*n(idx_COj)*n(idx_CO2) &
        -k(1256)*n(idx_COj)*n(idx_H2O) &
        -k(1257)*n(idx_COj)*n(idx_H2O) &
        -k(1258)*n(idx_COj)*n(idx_H2S) &
        -k(1259)*n(idx_COj)*n(idx_H2S) &
        -k(1260)*n(idx_COj)*n(idx_HCN) &
        -k(1261)*n(idx_COj)*n(idx_HCO) &
        -k(1262)*n(idx_COj)*n(idx_NH2) &
        -k(1263)*n(idx_COj)*n(idx_NH2) &
        -k(1264)*n(idx_COj)*n(idx_SO2) &
        -k(1265)*n(idx_COj)*n(idx_H2CO) &
        -k(1266)*n(idx_COj)*n(idx_H2CO) &
        -k(1267)*n(idx_COj)*n(idx_NH3) &
        -k(1268)*n(idx_COj)*n(idx_NH3) &
        -k(1269)*n(idx_COj)*n(idx_CH4) &
        -k(1270)*n(idx_COj)*n(idx_CH4) &
        -k(1271)*n(idx_COj)*n(idx_CH4) &
        +k(1278)*n(idx_CSj)*n(idx_O) &
        +k(1293)*n(idx_H2j)*n(idx_CO) &
        +k(1309)*n(idx_H2j)*n(idx_CO2) &
        +k(1368)*n(idx_N2j)*n(idx_CO) &
        +k(1441)*n(idx_O2j)*n(idx_C) &
        +k(1449)*n(idx_O2j)*n(idx_C2) &
        -k(3111)*n(idx_COj)*n(idx_H2) &
        +k(3128)*n(idx_Cj)*n(idx_O) &
        -k(3663)*n(idx_COj)*n(idx_E)

    !H2+
    !H2+
    dn(idx_H2j) = &
        +k(38)*n(idx_H2) &
        +k(471)*n(idx_Hj)*n(idx_HCO) &
        +k(646)*n(idx_HEj)*n(idx_H2) &
        -k(1283)*n(idx_H2j)*n(idx_C) &
        -k(1284)*n(idx_H2j)*n(idx_H) &
        -k(1285)*n(idx_H2j)*n(idx_N) &
        -k(1286)*n(idx_H2j)*n(idx_O) &
        -k(1287)*n(idx_H2j)*n(idx_C2) &
        -k(1288)*n(idx_H2j)*n(idx_C2) &
        -k(1289)*n(idx_H2j)*n(idx_CH) &
        -k(1290)*n(idx_H2j)*n(idx_CH) &
        -k(1291)*n(idx_H2j)*n(idx_CN) &
        -k(1292)*n(idx_H2j)*n(idx_CN) &
        -k(1293)*n(idx_H2j)*n(idx_CO) &
        -k(1294)*n(idx_H2j)*n(idx_CO) &
        -k(1295)*n(idx_H2j)*n(idx_H2) &
        -k(1296)*n(idx_H2j)*n(idx_N2) &
        -k(1297)*n(idx_H2j)*n(idx_NH) &
        -k(1298)*n(idx_H2j)*n(idx_NH) &
        -k(1299)*n(idx_H2j)*n(idx_NO) &
        -k(1300)*n(idx_H2j)*n(idx_NO) &
        -k(1301)*n(idx_H2j)*n(idx_O2) &
        -k(1302)*n(idx_H2j)*n(idx_O2) &
        -k(1303)*n(idx_H2j)*n(idx_OH) &
        -k(1304)*n(idx_H2j)*n(idx_OH) &
        -k(1305)*n(idx_H2j)*n(idx_C2H) &
        -k(1306)*n(idx_H2j)*n(idx_C2H) &
        -k(1307)*n(idx_H2j)*n(idx_CH2) &
        -k(1308)*n(idx_H2j)*n(idx_CH2) &
        -k(1309)*n(idx_H2j)*n(idx_CO2) &
        -k(1310)*n(idx_H2j)*n(idx_CO2) &
        -k(1311)*n(idx_H2j)*n(idx_CO2) &
        -k(1312)*n(idx_H2j)*n(idx_H2O) &
        -k(1313)*n(idx_H2j)*n(idx_H2O) &
        -k(1314)*n(idx_H2j)*n(idx_H2S) &
        -k(1315)*n(idx_H2j)*n(idx_H2S) &
        -k(1316)*n(idx_H2j)*n(idx_H2S) &
        -k(1317)*n(idx_H2j)*n(idx_HCN) &
        -k(1318)*n(idx_H2j)*n(idx_HCO) &
        -k(1319)*n(idx_H2j)*n(idx_HCO) &
        -k(1320)*n(idx_H2j)*n(idx_NH2) &
        -k(1321)*n(idx_H2j)*n(idx_C2H2) &
        -k(1322)*n(idx_H2j)*n(idx_C2H2) &
        -k(1323)*n(idx_H2j)*n(idx_H2CO) &
        -k(1324)*n(idx_H2j)*n(idx_H2CO) &
        -k(1325)*n(idx_H2j)*n(idx_NH3) &
        -k(1326)*n(idx_H2j)*n(idx_CH4) &
        -k(1327)*n(idx_H2j)*n(idx_CH4) &
        -k(1328)*n(idx_H2j)*n(idx_CH4) &
        -k(1329)*n(idx_H2j)*n(idx_C2H4) &
        -k(1330)*n(idx_H2j)*n(idx_C2H4) &
        -k(1331)*n(idx_H2j)*n(idx_C2H4) &
        +k(1334)*n(idx_HEHj)*n(idx_H) &
        +k(3137)*n(idx_Hj)*n(idx_H) &
        -k(3666)*n(idx_H2j)*n(idx_E) &
        -k(4205)*n(idx_H2j)*n(idx_E) &
        -k(4240)*n(idx_H2j)*n(idx_Hk) &
        -k(4415)*n(idx_H2j) &
        +k(4421)*n(idx_H3j)

    !NO+
    !NO+
    dn(idx_NOj) = &
        +k(47)*n(idx_NO) &
        +k(218)*n(idx_Cj)*n(idx_NO) &
        +k(442)*n(idx_Hj)*n(idx_NO) &
        +k(478)*n(idx_Hj)*n(idx_HNO) &
        +k(719)*n(idx_HEj)*n(idx_HNO) &
        +k(728)*n(idx_HEj)*n(idx_N2O) &
        +k(961)*n(idx_Nj)*n(idx_CO) &
        +k(966)*n(idx_Nj)*n(idx_NO) &
        +k(968)*n(idx_Nj)*n(idx_O2) &
        +k(970)*n(idx_Nj)*n(idx_OH) &
        +k(986)*n(idx_Nj)*n(idx_H2CO) &
        +k(998)*n(idx_Nj)*n(idx_CH3OH) &
        +k(1009)*n(idx_Oj)*n(idx_CN) &
        +k(1011)*n(idx_Oj)*n(idx_N2) &
        +k(1013)*n(idx_Oj)*n(idx_NH) &
        +k(1014)*n(idx_Oj)*n(idx_NO) &
        +k(1027)*n(idx_Oj)*n(idx_HCN) &
        +k(1031)*n(idx_Oj)*n(idx_N2O) &
        +k(1063)*n(idx_Sj)*n(idx_NO) &
        +k(1132)*n(idx_C2j)*n(idx_NO) &
        +k(1169)*n(idx_CHj)*n(idx_NO) &
        +k(1214)*n(idx_CNj)*n(idx_NO) &
        +k(1216)*n(idx_CNj)*n(idx_O2) &
        +k(1238)*n(idx_COj)*n(idx_N) &
        +k(1247)*n(idx_COj)*n(idx_NO) &
        +k(1299)*n(idx_H2j)*n(idx_NO) &
        +k(1347)*n(idx_HSj)*n(idx_NO) &
        +k(1363)*n(idx_N2j)*n(idx_O) &
        +k(1371)*n(idx_N2j)*n(idx_NO) &
        +k(1410)*n(idx_NHj)*n(idx_NO) &
        +k(1412)*n(idx_NHj)*n(idx_O2) &
        +k(1418)*n(idx_NHj)*n(idx_CO2) &
        -k(1435)*n(idx_NOj)*n(idx_FE) &
        -k(1436)*n(idx_NOj)*n(idx_MG) &
        -k(1437)*n(idx_NOj)*n(idx_NA) &
        -k(1438)*n(idx_NOj)*n(idx_SI) &
        +k(1439)*n(idx_NSj)*n(idx_O) &
        +k(1444)*n(idx_O2j)*n(idx_N) &
        +k(1454)*n(idx_O2j)*n(idx_NO) &
        +k(1469)*n(idx_OHj)*n(idx_N) &
        +k(1484)*n(idx_OHj)*n(idx_NO) &
        +k(1527)*n(idx_S2j)*n(idx_NO) &
        +k(1544)*n(idx_SIOj)*n(idx_N) &
        +k(1551)*n(idx_SIOj)*n(idx_NO) &
        +k(1571)*n(idx_C2Hj)*n(idx_NO) &
        +k(1612)*n(idx_CH2j)*n(idx_NO) &
        +k(1646)*n(idx_CO2j)*n(idx_NO) &
        +k(1673)*n(idx_H2Oj)*n(idx_NO) &
        +k(1706)*n(idx_H2Sj)*n(idx_NO) &
        +k(1773)*n(idx_H3j)*n(idx_NO2) &
        +k(1883)*n(idx_HCNj)*n(idx_NO) &
        +k(2047)*n(idx_HNCj)*n(idx_NO) &
        +k(2048)*n(idx_HNCj)*n(idx_O2) &
        +k(2066)*n(idx_HNOj)*n(idx_NO) &
        +k(2124)*n(idx_NH2j)*n(idx_NO) &
        +k(2146)*n(idx_NO2j)*n(idx_H) &
        +k(2147)*n(idx_NO2j)*n(idx_H2) &
        +k(2207)*n(idx_C2H2j)*n(idx_NO) &
        +k(2274)*n(idx_C3Hj)*n(idx_NO) &
        +k(2275)*n(idx_C3Hj)*n(idx_NO) &
        +k(2332)*n(idx_CH3j)*n(idx_NO) &
        +k(2410)*n(idx_H2COj)*n(idx_NO) &
        +k(2519)*n(idx_NH3j)*n(idx_NO) &
        -k(3149)*n(idx_NOj)*n(idx_H2) &
        -k(3673)*n(idx_NOj)*n(idx_E) &
        +k(4274)*n(idx_NO)

    !O2+
    !O2+
    dn(idx_O2j) = &
        +k(50)*n(idx_O2) &
        +k(422)*n(idx_CLj)*n(idx_O2) &
        +k(444)*n(idx_Hj)*n(idx_O2) &
        +k(660)*n(idx_HEj)*n(idx_O2) &
        +k(694)*n(idx_HEj)*n(idx_CO2) &
        +k(745)*n(idx_HEj)*n(idx_SO2) &
        +k(969)*n(idx_Nj)*n(idx_O2) &
        +k(1015)*n(idx_Oj)*n(idx_O2) &
        +k(1016)*n(idx_Oj)*n(idx_OH) &
        +k(1021)*n(idx_Oj)*n(idx_CO2) &
        +k(1036)*n(idx_Oj)*n(idx_SO2) &
        +k(1217)*n(idx_CNj)*n(idx_O2) &
        +k(1248)*n(idx_COj)*n(idx_O2) &
        +k(1301)*n(idx_H2j)*n(idx_O2) &
        +k(1372)*n(idx_N2j)*n(idx_O2) &
        +k(1413)*n(idx_NHj)*n(idx_O2) &
        -k(1440)*n(idx_O2j)*n(idx_C) &
        -k(1441)*n(idx_O2j)*n(idx_C) &
        -k(1442)*n(idx_O2j)*n(idx_FE) &
        -k(1443)*n(idx_O2j)*n(idx_MG) &
        -k(1444)*n(idx_O2j)*n(idx_N) &
        -k(1445)*n(idx_O2j)*n(idx_NA) &
        -k(1446)*n(idx_O2j)*n(idx_S) &
        -k(1447)*n(idx_O2j)*n(idx_S) &
        -k(1448)*n(idx_O2j)*n(idx_SI) &
        -k(1449)*n(idx_O2j)*n(idx_C2) &
        -k(1450)*n(idx_O2j)*n(idx_CH) &
        -k(1451)*n(idx_O2j)*n(idx_CH) &
        -k(1452)*n(idx_O2j)*n(idx_NH) &
        -k(1453)*n(idx_O2j)*n(idx_NH) &
        -k(1454)*n(idx_O2j)*n(idx_NO) &
        -k(1455)*n(idx_O2j)*n(idx_CH2) &
        -k(1456)*n(idx_O2j)*n(idx_CH2) &
        -k(1457)*n(idx_O2j)*n(idx_H2S) &
        -k(1458)*n(idx_O2j)*n(idx_HCO) &
        -k(1459)*n(idx_O2j)*n(idx_HCO) &
        -k(1460)*n(idx_O2j)*n(idx_NH2) &
        -k(1461)*n(idx_O2j)*n(idx_NO2) &
        -k(1462)*n(idx_O2j)*n(idx_H2CO) &
        -k(1463)*n(idx_O2j)*n(idx_H2CO) &
        -k(1464)*n(idx_O2j)*n(idx_NH3) &
        -k(1465)*n(idx_O2j)*n(idx_CH4) &
        -k(1466)*n(idx_O2j)*n(idx_CH3OH) &
        -k(1467)*n(idx_O2j)*n(idx_CH3OH) &
        +k(1470)*n(idx_OHj)*n(idx_O) &
        +k(1486)*n(idx_OHj)*n(idx_O2) &
        +k(1644)*n(idx_CO2j)*n(idx_O) &
        +k(1647)*n(idx_CO2j)*n(idx_O2) &
        +k(1661)*n(idx_H2Oj)*n(idx_O) &
        +k(1674)*n(idx_H2Oj)*n(idx_O2) &
        +k(1884)*n(idx_HCNj)*n(idx_O2) &
        +k(2186)*n(idx_SO2j)*n(idx_O2) &
        +k(2720)*n(idx_CH4j)*n(idx_O2) &
        -k(3675)*n(idx_O2j)*n(idx_E) &
        +k(4277)*n(idx_O2)

    !CH2+
    !CH2+
    dn(idx_CH2j) = &
        +k(70)*n(idx_CH2) &
        +k(245)*n(idx_Cj)*n(idx_CH2) &
        +k(283)*n(idx_Cj)*n(idx_H2CO) &
        +k(286)*n(idx_Cj)*n(idx_H2CS) &
        +k(465)*n(idx_Hj)*n(idx_CH2) &
        +k(766)*n(idx_HEj)*n(idx_CH3) &
        +k(771)*n(idx_HEj)*n(idx_H2CS) &
        +k(787)*n(idx_HEj)*n(idx_CH2CN) &
        +k(789)*n(idx_HEj)*n(idx_C2H2O) &
        +k(807)*n(idx_HEj)*n(idx_CH2PH) &
        +k(809)*n(idx_HEj)*n(idx_CH3N) &
        +k(814)*n(idx_HEj)*n(idx_CH4) &
        +k(852)*n(idx_HEj)*n(idx_C2H4) &
        +k(973)*n(idx_Nj)*n(idx_CH2) &
        +k(1020)*n(idx_Oj)*n(idx_CH2) &
        +k(1134)*n(idx_C2j)*n(idx_CH2) &
        +k(1167)*n(idx_CHj)*n(idx_H2) &
        +k(1185)*n(idx_CHj)*n(idx_HCO) &
        +k(1221)*n(idx_CNj)*n(idx_CH2) &
        +k(1253)*n(idx_COj)*n(idx_CH2) &
        +k(1290)*n(idx_H2j)*n(idx_CH) &
        +k(1307)*n(idx_H2j)*n(idx_CH2) &
        +k(1346)*n(idx_HSj)*n(idx_CH) &
        +k(1375)*n(idx_N2j)*n(idx_CH2) &
        +k(1391)*n(idx_N2j)*n(idx_CH4) &
        +k(1402)*n(idx_NHj)*n(idx_CH) &
        +k(1455)*n(idx_O2j)*n(idx_CH2) &
        +k(1478)*n(idx_OHj)*n(idx_CH) &
        +k(1493)*n(idx_OHj)*n(idx_CH2) &
        +k(1567)*n(idx_C2Hj)*n(idx_CH) &
        -k(1604)*n(idx_CH2j)*n(idx_C) &
        -k(1605)*n(idx_CH2j)*n(idx_N) &
        -k(1606)*n(idx_CH2j)*n(idx_O) &
        -k(1607)*n(idx_CH2j)*n(idx_S) &
        -k(1608)*n(idx_CH2j)*n(idx_C2) &
        -k(1609)*n(idx_CH2j)*n(idx_CH) &
        -k(1610)*n(idx_CH2j)*n(idx_H2) &
        -k(1611)*n(idx_CH2j)*n(idx_NH) &
        -k(1612)*n(idx_CH2j)*n(idx_NO) &
        -k(1613)*n(idx_CH2j)*n(idx_O2) &
        -k(1614)*n(idx_CH2j)*n(idx_O2) &
        -k(1615)*n(idx_CH2j)*n(idx_OH) &
        -k(1616)*n(idx_CH2j)*n(idx_C2H) &
        -k(1617)*n(idx_CH2j)*n(idx_C2H) &
        -k(1618)*n(idx_CH2j)*n(idx_CH2) &
        -k(1619)*n(idx_CH2j)*n(idx_CO2) &
        -k(1620)*n(idx_CH2j)*n(idx_H2O) &
        -k(1621)*n(idx_CH2j)*n(idx_H2S) &
        -k(1622)*n(idx_CH2j)*n(idx_H2S) &
        -k(1623)*n(idx_CH2j)*n(idx_HCN) &
        -k(1624)*n(idx_CH2j)*n(idx_HCO) &
        -k(1625)*n(idx_CH2j)*n(idx_HCO) &
        -k(1626)*n(idx_CH2j)*n(idx_NH2) &
        -k(1627)*n(idx_CH2j)*n(idx_OCS) &
        -k(1628)*n(idx_CH2j)*n(idx_OCS) &
        -k(1629)*n(idx_CH2j)*n(idx_H2CO) &
        -k(1630)*n(idx_CH2j)*n(idx_H2CO) &
        -k(1631)*n(idx_CH2j)*n(idx_H2CO) &
        -k(1632)*n(idx_CH2j)*n(idx_NH3) &
        -k(1633)*n(idx_CH2j)*n(idx_NH3) &
        -k(1634)*n(idx_CH2j)*n(idx_CH4) &
        -k(1635)*n(idx_CH2j)*n(idx_CH4) &
        +k(1669)*n(idx_H2Oj)*n(idx_CH) &
        +k(1678)*n(idx_H2Oj)*n(idx_CH2) &
        +k(1724)*n(idx_H3j)*n(idx_CH) &
        +k(1879)*n(idx_HCNj)*n(idx_CH) &
        +k(1909)*n(idx_HCOj)*n(idx_CH) &
        +k(2044)*n(idx_HNCj)*n(idx_CH) &
        +k(2063)*n(idx_HNOj)*n(idx_CH) &
        +k(2089)*n(idx_N2Hj)*n(idx_CH) &
        +k(2119)*n(idx_NH2j)*n(idx_CH) &
        +k(2128)*n(idx_NH2j)*n(idx_CH2) &
        +k(2153)*n(idx_O2Hj)*n(idx_CH) &
        +k(2392)*n(idx_HCNHj)*n(idx_CH) &
        +k(2408)*n(idx_H2COj)*n(idx_CH) &
        +k(2413)*n(idx_H2COj)*n(idx_CH2) &
        +k(2431)*n(idx_H3Oj)*n(idx_CH) &
        +k(2742)*n(idx_H3COj)*n(idx_CH) &
        +k(2917)*n(idx_CH5j)*n(idx_CH) &
        +k(3129)*n(idx_Cj)*n(idx_H2) &
        -k(3699)*n(idx_CH2j)*n(idx_E) &
        -k(3700)*n(idx_CH2j)*n(idx_E) &
        -k(3701)*n(idx_CH2j)*n(idx_E) &
        +k(4292)*n(idx_CH2) &
        -k(4419)*n(idx_CH2j) &
        +k(4423)*n(idx_CH3j)

    !H2S+
    !H2S+
    dn(idx_H2Sj) = &
        +k(74)*n(idx_H2S) &
        +k(249)*n(idx_Cj)*n(idx_H2S) &
        +k(468)*n(idx_Hj)*n(idx_H2S) &
        +k(701)*n(idx_HEj)*n(idx_H2S) &
        +k(978)*n(idx_Nj)*n(idx_H2S) &
        +k(1025)*n(idx_Oj)*n(idx_H2S) &
        +k(1074)*n(idx_Sj)*n(idx_H2S) &
        +k(1082)*n(idx_Sj)*n(idx_H2CO) &
        +k(1258)*n(idx_COj)*n(idx_H2S) &
        +k(1316)*n(idx_H2j)*n(idx_H2S) &
        +k(1381)*n(idx_N2j)*n(idx_H2S) &
        +k(1457)*n(idx_O2j)*n(idx_H2S) &
        +k(1498)*n(idx_OHj)*n(idx_H2S) &
        +k(1650)*n(idx_CO2j)*n(idx_H2S) &
        +k(1681)*n(idx_H2Oj)*n(idx_H2S) &
        -k(1696)*n(idx_H2Sj)*n(idx_C) &
        -k(1697)*n(idx_H2Sj)*n(idx_FE) &
        -k(1698)*n(idx_H2Sj)*n(idx_H) &
        -k(1699)*n(idx_H2Sj)*n(idx_MG) &
        -k(1700)*n(idx_H2Sj)*n(idx_N) &
        -k(1701)*n(idx_H2Sj)*n(idx_NA) &
        -k(1702)*n(idx_H2Sj)*n(idx_O) &
        -k(1703)*n(idx_H2Sj)*n(idx_O) &
        -k(1704)*n(idx_H2Sj)*n(idx_S) &
        -k(1705)*n(idx_H2Sj)*n(idx_SI) &
        -k(1706)*n(idx_H2Sj)*n(idx_NO) &
        -k(1707)*n(idx_H2Sj)*n(idx_H2O) &
        -k(1708)*n(idx_H2Sj)*n(idx_H2S) &
        -k(1709)*n(idx_H2Sj)*n(idx_HCO) &
        -k(1710)*n(idx_H2Sj)*n(idx_NH3) &
        -k(1711)*n(idx_H2Sj)*n(idx_NH3) &
        +k(1732)*n(idx_H3j)*n(idx_HS) &
        +k(1912)*n(idx_HCOj)*n(idx_HS) &
        +k(2134)*n(idx_NH2j)*n(idx_H2S) &
        +k(2213)*n(idx_C2H2j)*n(idx_H2S) &
        +k(2494)*n(idx_H3Sj)*n(idx_H) &
        +k(2723)*n(idx_CH4j)*n(idx_H2S) &
        +k(3141)*n(idx_Sj)*n(idx_H2) &
        -k(3713)*n(idx_H2Sj)*n(idx_E) &
        -k(3714)*n(idx_H2Sj)*n(idx_E) &
        -k(4206)*n(idx_H2Sj)*n(idx_E)

    !HCS+
    !HCS+
    dn(idx_HCSj) = &
        +k(79)*n(idx_HCS) &
        +k(250)*n(idx_Cj)*n(idx_H2S) &
        +k(1071)*n(idx_Sj)*n(idx_CH2) &
        +k(1180)*n(idx_CHj)*n(idx_H2S) &
        +k(1189)*n(idx_CHj)*n(idx_OCS) &
        +k(1280)*n(idx_CSj)*n(idx_H2) &
        +k(1282)*n(idx_CSj)*n(idx_CH4) &
        +k(1601)*n(idx_C2Nj)*n(idx_H2S) &
        +k(1607)*n(idx_CH2j)*n(idx_S) &
        +k(1621)*n(idx_CH2j)*n(idx_H2S) &
        +k(1627)*n(idx_CH2j)*n(idx_OCS) &
        +k(1696)*n(idx_H2Sj)*n(idx_C) &
        +k(1729)*n(idx_H3j)*n(idx_CS) &
        +k(1911)*n(idx_HCOj)*n(idx_CS) &
        -k(2037)*n(idx_HCSj)*n(idx_O) &
        -k(2038)*n(idx_HCSj)*n(idx_O) &
        -k(2039)*n(idx_HCSj)*n(idx_NH3) &
        +k(2284)*n(idx_C3Hj)*n(idx_H2S) &
        +k(2322)*n(idx_CH3j)*n(idx_S) &
        +k(2433)*n(idx_H3Oj)*n(idx_CS) &
        -k(3723)*n(idx_HCSj)*n(idx_E) &
        -k(3724)*n(idx_HCSj)*n(idx_E)

    !HNO+
    !HNO+
    dn(idx_HNOj) = &
        +k(82)*n(idx_HNO) &
        +k(1300)*n(idx_H2j)*n(idx_NO) &
        +k(1419)*n(idx_NHj)*n(idx_CO2) &
        +k(1422)*n(idx_NHj)*n(idx_H2O) &
        +k(1452)*n(idx_O2j)*n(idx_NH) &
        +k(1485)*n(idx_OHj)*n(idx_NO) &
        +k(1659)*n(idx_H2Oj)*n(idx_N) &
        +k(1737)*n(idx_H3j)*n(idx_NO) &
        -k(2059)*n(idx_HNOj)*n(idx_C) &
        -k(2060)*n(idx_HNOj)*n(idx_O) &
        -k(2061)*n(idx_HNOj)*n(idx_S) &
        -k(2062)*n(idx_HNOj)*n(idx_C2) &
        -k(2063)*n(idx_HNOj)*n(idx_CH) &
        -k(2064)*n(idx_HNOj)*n(idx_CO) &
        -k(2065)*n(idx_HNOj)*n(idx_NH) &
        -k(2066)*n(idx_HNOj)*n(idx_NO) &
        -k(2067)*n(idx_HNOj)*n(idx_OH) &
        -k(2068)*n(idx_HNOj)*n(idx_C2H) &
        -k(2069)*n(idx_HNOj)*n(idx_CH2) &
        -k(2070)*n(idx_HNOj)*n(idx_CO2) &
        -k(2071)*n(idx_HNOj)*n(idx_H2O) &
        -k(2072)*n(idx_HNOj)*n(idx_HCN) &
        -k(2073)*n(idx_HNOj)*n(idx_HCO) &
        -k(2074)*n(idx_HNOj)*n(idx_HNC) &
        -k(2075)*n(idx_HNOj)*n(idx_NH2) &
        -k(2076)*n(idx_HNOj)*n(idx_H2CO) &
        -k(2077)*n(idx_HNOj)*n(idx_NH3) &
        -k(2078)*n(idx_HNOj)*n(idx_CH4) &
        +k(2113)*n(idx_NH2j)*n(idx_O) &
        +k(2125)*n(idx_NH2j)*n(idx_O2) &
        +k(2159)*n(idx_O2Hj)*n(idx_NO) &
        +k(2512)*n(idx_NH3j)*n(idx_O) &
        -k(3726)*n(idx_HNOj)*n(idx_E)

    !NH2+
    !NH2+
    dn(idx_NH2j) = &
        +k(89)*n(idx_NH2) &
        +k(484)*n(idx_Hj)*n(idx_NH2) &
        +k(550)*n(idx_Hj)*n(idx_NH2CN) &
        +k(578)*n(idx_Hj)*n(idx_NH2CHO) &
        +k(778)*n(idx_HEj)*n(idx_NH3) &
        +k(838)*n(idx_HEj)*n(idx_NH2CN) &
        +k(901)*n(idx_HEj)*n(idx_CH5N) &
        +k(982)*n(idx_Nj)*n(idx_NH2) &
        +k(990)*n(idx_Nj)*n(idx_NH3) &
        +k(1032)*n(idx_Oj)*n(idx_NH2) &
        +k(1142)*n(idx_C2j)*n(idx_NH2) &
        +k(1233)*n(idx_CNj)*n(idx_NH2) &
        +k(1263)*n(idx_COj)*n(idx_NH2) &
        +k(1298)*n(idx_H2j)*n(idx_NH) &
        +k(1320)*n(idx_H2j)*n(idx_NH2) &
        +k(1385)*n(idx_N2j)*n(idx_NH2) &
        +k(1407)*n(idx_NHj)*n(idx_H2) &
        +k(1409)*n(idx_NHj)*n(idx_NH) &
        +k(1423)*n(idx_NHj)*n(idx_H2O) &
        +k(1460)*n(idx_O2j)*n(idx_NH2) &
        +k(1483)*n(idx_OHj)*n(idx_NH) &
        +k(1505)*n(idx_OHj)*n(idx_NH2) &
        +k(1689)*n(idx_H2Oj)*n(idx_NH2) &
        +k(1716)*n(idx_H3j)*n(idx_N) &
        +k(1736)*n(idx_H3j)*n(idx_NH) &
        +k(1882)*n(idx_HCNj)*n(idx_NH) &
        +k(1915)*n(idx_HCOj)*n(idx_NH) &
        +k(2046)*n(idx_HNCj)*n(idx_NH) &
        +k(2065)*n(idx_HNOj)*n(idx_NH) &
        +k(2091)*n(idx_N2Hj)*n(idx_NH) &
        -k(2112)*n(idx_NH2j)*n(idx_N) &
        -k(2113)*n(idx_NH2j)*n(idx_O) &
        -k(2114)*n(idx_NH2j)*n(idx_S) &
        -k(2115)*n(idx_NH2j)*n(idx_S) &
        -k(2116)*n(idx_NH2j)*n(idx_S) &
        -k(2117)*n(idx_NH2j)*n(idx_C2) &
        -k(2118)*n(idx_NH2j)*n(idx_CH) &
        -k(2119)*n(idx_NH2j)*n(idx_CH) &
        -k(2120)*n(idx_NH2j)*n(idx_CN) &
        -k(2121)*n(idx_NH2j)*n(idx_CN) &
        -k(2122)*n(idx_NH2j)*n(idx_H2) &
        -k(2123)*n(idx_NH2j)*n(idx_NH) &
        -k(2124)*n(idx_NH2j)*n(idx_NO) &
        -k(2125)*n(idx_NH2j)*n(idx_O2) &
        -k(2126)*n(idx_NH2j)*n(idx_O2) &
        -k(2127)*n(idx_NH2j)*n(idx_C2H) &
        -k(2128)*n(idx_NH2j)*n(idx_CH2) &
        -k(2129)*n(idx_NH2j)*n(idx_CH2) &
        -k(2130)*n(idx_NH2j)*n(idx_H2O) &
        -k(2131)*n(idx_NH2j)*n(idx_H2O) &
        -k(2132)*n(idx_NH2j)*n(idx_H2O) &
        -k(2133)*n(idx_NH2j)*n(idx_H2S) &
        -k(2134)*n(idx_NH2j)*n(idx_H2S) &
        -k(2135)*n(idx_NH2j)*n(idx_H2S) &
        -k(2136)*n(idx_NH2j)*n(idx_H2S) &
        -k(2137)*n(idx_NH2j)*n(idx_H2S) &
        -k(2138)*n(idx_NH2j)*n(idx_HCN) &
        -k(2139)*n(idx_NH2j)*n(idx_HCO) &
        -k(2140)*n(idx_NH2j)*n(idx_HNC) &
        -k(2141)*n(idx_NH2j)*n(idx_NH2) &
        -k(2142)*n(idx_NH2j)*n(idx_H2CO) &
        -k(2143)*n(idx_NH2j)*n(idx_H2CO) &
        -k(2144)*n(idx_NH2j)*n(idx_NH3) &
        -k(2145)*n(idx_NH2j)*n(idx_NH3) &
        +k(2158)*n(idx_O2Hj)*n(idx_NH) &
        +k(2919)*n(idx_CH5j)*n(idx_NH) &
        -k(3745)*n(idx_NH2j)*n(idx_E) &
        -k(3746)*n(idx_NH2j)*n(idx_E) &
        +k(4304)*n(idx_NH2)

    !OCS+
    !OCS+
    dn(idx_OCSj) = &
        +k(95)*n(idx_OCS) &
        +k(265)*n(idx_Cj)*n(idx_OCS) &
        +k(985)*n(idx_Nj)*n(idx_OCS) &
        +k(1035)*n(idx_Oj)*n(idx_OCS) &
        +k(1281)*n(idx_CSj)*n(idx_O2) &
        +k(1387)*n(idx_N2j)*n(idx_OCS) &
        +k(2038)*n(idx_HCSj)*n(idx_O) &
        -k(2171)*n(idx_OCSj)*n(idx_NH3) &
        +k(2725)*n(idx_CH4j)*n(idx_OCS) &
        -k(3155)*n(idx_OCSj)*n(idx_H2) &
        -k(3749)*n(idx_OCSj)*n(idx_E) &
        -k(3750)*n(idx_OCSj)*n(idx_E) &
        -k(3751)*n(idx_OCSj)*n(idx_E) &
        +k(4308)*n(idx_OCS)

    !C2H2+
    !C2H2+
    dn(idx_C2H2j) = &
        +k(103)*n(idx_C2H2) &
        +k(281)*n(idx_Cj)*n(idx_CH3) &
        +k(318)*n(idx_Cj)*n(idx_CH4) &
        +k(376)*n(idx_Cj)*n(idx_C3H4) &
        +k(492)*n(idx_Hj)*n(idx_C2H2) &
        +k(518)*n(idx_Hj)*n(idx_C2H3) &
        +k(540)*n(idx_Hj)*n(idx_HC2NC) &
        +k(751)*n(idx_HEj)*n(idx_C2H2) &
        +k(791)*n(idx_HEj)*n(idx_C2H3) &
        +k(853)*n(idx_HEj)*n(idx_C2H4) &
        +k(1146)*n(idx_C2j)*n(idx_CH4) &
        +k(1199)*n(idx_CHj)*n(idx_CH4) &
        +k(1306)*n(idx_H2j)*n(idx_C2H) &
        +k(1321)*n(idx_H2j)*n(idx_C2H2) &
        +k(1329)*n(idx_H2j)*n(idx_C2H4) &
        +k(1416)*n(idx_NHj)*n(idx_C2H) &
        +k(1492)*n(idx_OHj)*n(idx_C2H) &
        +k(1570)*n(idx_C2Hj)*n(idx_H2) &
        +k(1577)*n(idx_C2Hj)*n(idx_HCN) &
        +k(1580)*n(idx_C2Hj)*n(idx_HCO) &
        +k(1588)*n(idx_C2Hj)*n(idx_CH4) &
        +k(1609)*n(idx_CH2j)*n(idx_CH) &
        +k(1677)*n(idx_H2Oj)*n(idx_C2H) &
        +k(1751)*n(idx_H3j)*n(idx_C2H) &
        +k(1886)*n(idx_HCNj)*n(idx_C2H) &
        +k(1928)*n(idx_HCOj)*n(idx_C2H) &
        +k(2050)*n(idx_HNCj)*n(idx_C2H) &
        +k(2068)*n(idx_HNOj)*n(idx_C2H) &
        +k(2093)*n(idx_N2Hj)*n(idx_C2H) &
        +k(2127)*n(idx_NH2j)*n(idx_C2H) &
        +k(2161)*n(idx_O2Hj)*n(idx_C2H) &
        -k(2187)*n(idx_C2H2j)*n(idx_C) &
        -k(2188)*n(idx_C2H2j)*n(idx_C) &
        -k(2189)*n(idx_C2H2j)*n(idx_C) &
        -k(2190)*n(idx_C2H2j)*n(idx_FE) &
        -k(2191)*n(idx_C2H2j)*n(idx_MG) &
        -k(2192)*n(idx_C2H2j)*n(idx_N) &
        -k(2193)*n(idx_C2H2j)*n(idx_N) &
        -k(2194)*n(idx_C2H2j)*n(idx_N) &
        -k(2195)*n(idx_C2H2j)*n(idx_NA) &
        -k(2196)*n(idx_C2H2j)*n(idx_O) &
        -k(2197)*n(idx_C2H2j)*n(idx_O) &
        -k(2198)*n(idx_C2H2j)*n(idx_O) &
        -k(2199)*n(idx_C2H2j)*n(idx_P) &
        -k(2200)*n(idx_C2H2j)*n(idx_SI) &
        -k(2201)*n(idx_C2H2j)*n(idx_SI) &
        -k(2202)*n(idx_C2H2j)*n(idx_SI) &
        -k(2203)*n(idx_C2H2j)*n(idx_CH) &
        -k(2204)*n(idx_C2H2j)*n(idx_CH) &
        -k(2205)*n(idx_C2H2j)*n(idx_CN) &
        -k(2206)*n(idx_C2H2j)*n(idx_NH) &
        -k(2207)*n(idx_C2H2j)*n(idx_NO) &
        -k(2208)*n(idx_C2H2j)*n(idx_OH) &
        -k(2209)*n(idx_C2H2j)*n(idx_O2) &
        -k(2210)*n(idx_C2H2j)*n(idx_C2H) &
        -k(2211)*n(idx_C2H2j)*n(idx_CH2) &
        -k(2212)*n(idx_C2H2j)*n(idx_CH2) &
        -k(2213)*n(idx_C2H2j)*n(idx_H2S) &
        -k(2214)*n(idx_C2H2j)*n(idx_H2S) &
        -k(2215)*n(idx_C2H2j)*n(idx_HCN) &
        -k(2216)*n(idx_C2H2j)*n(idx_HCO) &
        -k(2217)*n(idx_C2H2j)*n(idx_HCO) &
        -k(2218)*n(idx_C2H2j)*n(idx_HNC) &
        -k(2219)*n(idx_C2H2j)*n(idx_HNC) &
        -k(2220)*n(idx_C2H2j)*n(idx_NH2) &
        -k(2221)*n(idx_C2H2j)*n(idx_NH2) &
        -k(2222)*n(idx_C2H2j)*n(idx_C2H2) &
        -k(2223)*n(idx_C2H2j)*n(idx_C2H2) &
        -k(2224)*n(idx_C2H2j)*n(idx_C3H) &
        -k(2225)*n(idx_C2H2j)*n(idx_HC3) &
        -k(2226)*n(idx_C2H2j)*n(idx_C3H) &
        -k(2227)*n(idx_C2H2j)*n(idx_HC3) &
        -k(2228)*n(idx_C2H2j)*n(idx_H2CO) &
        -k(2229)*n(idx_C2H2j)*n(idx_NH3) &
        -k(2230)*n(idx_C2H2j)*n(idx_NH3) &
        -k(2231)*n(idx_C2H2j)*n(idx_C2H3) &
        -k(2232)*n(idx_C2H2j)*n(idx_C2H3) &
        -k(2233)*n(idx_C2H2j)*n(idx_C2H3) &
        -k(2234)*n(idx_C2H2j)*n(idx_C2H3) &
        -k(2235)*n(idx_C2H2j)*n(idx_C3H2) &
        -k(2236)*n(idx_C2H2j)*n(idx_H2C3) &
        -k(2237)*n(idx_C2H2j)*n(idx_C3H2) &
        -k(2238)*n(idx_C2H2j)*n(idx_H2C3) &
        -k(2239)*n(idx_C2H2j)*n(idx_C4H) &
        -k(2240)*n(idx_C2H2j)*n(idx_C4H) &
        -k(2241)*n(idx_C2H2j)*n(idx_CH4) &
        -k(2242)*n(idx_C2H2j)*n(idx_CH4) &
        -k(2243)*n(idx_C2H2j)*n(idx_C2H4) &
        -k(2244)*n(idx_C2H2j)*n(idx_C2H4) &
        -k(2245)*n(idx_C2H2j)*n(idx_C2H4) &
        -k(2246)*n(idx_C2H2j)*n(idx_C2H4) &
        -k(2247)*n(idx_C2H2j)*n(idx_C3H3) &
        -k(2248)*n(idx_C2H2j)*n(idx_C3H3) &
        -k(2249)*n(idx_C2H2j)*n(idx_C3H3) &
        -k(2250)*n(idx_C2H2j)*n(idx_C3H3) &
        -k(2251)*n(idx_C2H2j)*n(idx_C4H2) &
        -k(2252)*n(idx_C2H2j)*n(idx_C4H2) &
        -k(2253)*n(idx_C2H2j)*n(idx_C4H2) &
        -k(2254)*n(idx_C2H2j)*n(idx_C5H) &
        -k(2255)*n(idx_C2H2j)*n(idx_C5H) &
        -k(2256)*n(idx_C2H2j)*n(idx_C3H4) &
        -k(2257)*n(idx_C2H2j)*n(idx_C3H4) &
        -k(2258)*n(idx_C2H2j)*n(idx_C3H4) &
        -k(2259)*n(idx_C2H2j)*n(idx_C5H2) &
        -k(2260)*n(idx_C2H2j)*n(idx_C5H2) &
        -k(2261)*n(idx_C2H2j)*n(idx_C5H2) &
        -k(2262)*n(idx_C2H2j)*n(idx_C6H) &
        -k(2263)*n(idx_C2H2j)*n(idx_C6H) &
        -k(2264)*n(idx_C2H2j)*n(idx_C6H2) &
        -k(2265)*n(idx_C2H2j)*n(idx_C6H2) &
        -k(2266)*n(idx_C2H2j)*n(idx_C6H2) &
        -k(2267)*n(idx_C2H2j)*n(idx_C7H) &
        -k(2268)*n(idx_C2H2j)*n(idx_C7H) &
        -k(2269)*n(idx_C2H2j)*n(idx_C7H2) &
        -k(2270)*n(idx_C2H2j)*n(idx_C7H2) &
        -k(2271)*n(idx_C2H2j)*n(idx_C7H2) &
        +k(2312)*n(idx_CH3j)*n(idx_C) &
        +k(2327)*n(idx_CH3j)*n(idx_CH) &
        +k(2412)*n(idx_H2COj)*n(idx_C2H) &
        +k(2515)*n(idx_NH3j)*n(idx_C2) &
        +k(2546)*n(idx_C2H3j)*n(idx_H) &
        +k(2553)*n(idx_C2H3j)*n(idx_C2H) &
        +k(2682)*n(idx_C3HNj)*n(idx_H2) &
        +k(2727)*n(idx_CH4j)*n(idx_C2H2) &
        +k(2921)*n(idx_CH5j)*n(idx_C2H) &
        -k(3156)*n(idx_C2H2j)*n(idx_H) &
        -k(3157)*n(idx_C2H2j)*n(idx_CO) &
        -k(3158)*n(idx_C2H2j)*n(idx_H2) &
        -k(3159)*n(idx_C2H2j)*n(idx_HC3N) &
        -k(3160)*n(idx_C2H2j)*n(idx_HC5N) &
        -k(3161)*n(idx_C2H2j)*n(idx_HC7N) &
        -k(3763)*n(idx_C2H2j)*n(idx_E) &
        -k(3764)*n(idx_C2H2j)*n(idx_E) &
        -k(3765)*n(idx_C2H2j)*n(idx_E) &
        -k(3766)*n(idx_C2H2j)*n(idx_E) &
        -k(3767)*n(idx_C2H2j)*n(idx_E) &
        +k(4311)*n(idx_C2H2)

    !CH3+
    !CH3+
    dn(idx_CH3j) = &
        +k(112)*n(idx_CH3) &
        +k(282)*n(idx_Cj)*n(idx_CH3) &
        +k(361)*n(idx_Cj)*n(idx_CH3OH) &
        +k(500)*n(idx_Hj)*n(idx_CH3) &
        +k(533)*n(idx_Hj)*n(idx_CH4) &
        +k(603)*n(idx_Hj)*n(idx_CH3C3N) &
        +k(622)*n(idx_Hj)*n(idx_CH3C5N) &
        +k(627)*n(idx_Hj)*n(idx_CH3C7N) &
        +k(815)*n(idx_HEj)*n(idx_CH4) &
        +k(850)*n(idx_HEj)*n(idx_CH3CN) &
        +k(869)*n(idx_HEj)*n(idx_CH3OH) &
        +k(876)*n(idx_HEj)*n(idx_C2H4O) &
        +k(902)*n(idx_HEj)*n(idx_CH5N) &
        +k(916)*n(idx_HEj)*n(idx_CH3C3N) &
        +k(932)*n(idx_HEj)*n(idx_CH3OCH3) &
        +k(942)*n(idx_HEj)*n(idx_CH3C5N) &
        +k(948)*n(idx_HEj)*n(idx_CH3C7N) &
        +k(993)*n(idx_Nj)*n(idx_CH4) &
        +k(994)*n(idx_Nj)*n(idx_CH4) &
        +k(999)*n(idx_Nj)*n(idx_CH3OH) &
        +k(1040)*n(idx_Oj)*n(idx_CH4) &
        +k(1194)*n(idx_CHj)*n(idx_H2CO) &
        +k(1202)*n(idx_CHj)*n(idx_CH3OH) &
        +k(1308)*n(idx_H2j)*n(idx_CH2) &
        +k(1326)*n(idx_H2j)*n(idx_CH4) &
        +k(1392)*n(idx_N2j)*n(idx_CH4) &
        +k(1417)*n(idx_NHj)*n(idx_CH2) &
        +k(1494)*n(idx_OHj)*n(idx_CH2) &
        +k(1572)*n(idx_C2Hj)*n(idx_CH2) &
        +k(1610)*n(idx_CH2j)*n(idx_H2) &
        +k(1624)*n(idx_CH2j)*n(idx_HCO) &
        +k(1679)*n(idx_H2Oj)*n(idx_CH2) &
        +k(1757)*n(idx_H3j)*n(idx_CH2) &
        +k(1832)*n(idx_H3j)*n(idx_CH3OH) &
        +k(1887)*n(idx_HCNj)*n(idx_CH2) &
        +k(1933)*n(idx_HCOj)*n(idx_CH2) &
        +k(2051)*n(idx_HNCj)*n(idx_CH2) &
        +k(2069)*n(idx_HNOj)*n(idx_CH2) &
        +k(2094)*n(idx_N2Hj)*n(idx_CH2) &
        +k(2129)*n(idx_NH2j)*n(idx_CH2) &
        +k(2162)*n(idx_O2Hj)*n(idx_CH2) &
        -k(2311)*n(idx_CH3j)*n(idx_C) &
        -k(2312)*n(idx_CH3j)*n(idx_C) &
        -k(2313)*n(idx_CH3j)*n(idx_FE) &
        -k(2314)*n(idx_CH3j)*n(idx_MG) &
        -k(2315)*n(idx_CH3j)*n(idx_N) &
        -k(2316)*n(idx_CH3j)*n(idx_N) &
        -k(2317)*n(idx_CH3j)*n(idx_NA) &
        -k(2318)*n(idx_CH3j)*n(idx_O) &
        -k(2319)*n(idx_CH3j)*n(idx_O) &
        -k(2320)*n(idx_CH3j)*n(idx_O) &
        -k(2321)*n(idx_CH3j)*n(idx_P) &
        -k(2322)*n(idx_CH3j)*n(idx_S) &
        -k(2323)*n(idx_CH3j)*n(idx_SI) &
        -k(2324)*n(idx_CH3j)*n(idx_SI) &
        -k(2325)*n(idx_CH3j)*n(idx_SI) &
        -k(2326)*n(idx_CH3j)*n(idx_C2) &
        -k(2327)*n(idx_CH3j)*n(idx_CH) &
        -k(2328)*n(idx_CH3j)*n(idx_CN) &
        -k(2329)*n(idx_CH3j)*n(idx_HCL) &
        -k(2330)*n(idx_CH3j)*n(idx_HS) &
        -k(2331)*n(idx_CH3j)*n(idx_NH) &
        -k(2332)*n(idx_CH3j)*n(idx_NO) &
        -k(2333)*n(idx_CH3j)*n(idx_O2) &
        -k(2334)*n(idx_CH3j)*n(idx_OH) &
        -k(2335)*n(idx_CH3j)*n(idx_SIH) &
        -k(2336)*n(idx_CH3j)*n(idx_SO) &
        -k(2337)*n(idx_CH3j)*n(idx_C2H) &
        -k(2338)*n(idx_CH3j)*n(idx_C2H) &
        -k(2339)*n(idx_CH3j)*n(idx_C2H) &
        -k(2340)*n(idx_CH3j)*n(idx_C2H) &
        -k(2341)*n(idx_CH3j)*n(idx_CH2) &
        -k(2342)*n(idx_CH3j)*n(idx_H2S) &
        -k(2343)*n(idx_CH3j)*n(idx_HCO) &
        -k(2344)*n(idx_CH3j)*n(idx_HCO) &
        -k(2345)*n(idx_CH3j)*n(idx_NH2) &
        -k(2346)*n(idx_CH3j)*n(idx_OCS) &
        -k(2347)*n(idx_CH3j)*n(idx_C2H2) &
        -k(2348)*n(idx_CH3j)*n(idx_C3H) &
        -k(2349)*n(idx_CH3j)*n(idx_HC3) &
        -k(2350)*n(idx_CH3j)*n(idx_C3H) &
        -k(2351)*n(idx_CH3j)*n(idx_HC3) &
        -k(2352)*n(idx_CH3j)*n(idx_H2CO) &
        -k(2353)*n(idx_CH3j)*n(idx_NH3) &
        -k(2354)*n(idx_CH3j)*n(idx_NH3) &
        -k(2355)*n(idx_CH3j)*n(idx_C2H3) &
        -k(2356)*n(idx_CH3j)*n(idx_C2H3) &
        -k(2357)*n(idx_CH3j)*n(idx_C2H3) &
        -k(2358)*n(idx_CH3j)*n(idx_C2H3) &
        -k(2359)*n(idx_CH3j)*n(idx_C3H2) &
        -k(2360)*n(idx_CH3j)*n(idx_H2C3) &
        -k(2361)*n(idx_CH3j)*n(idx_C4H) &
        -k(2362)*n(idx_CH3j)*n(idx_CH4) &
        -k(2363)*n(idx_CH3j)*n(idx_HCNC2) &
        -k(2364)*n(idx_CH3j)*n(idx_HCNC2) &
        -k(2365)*n(idx_CH3j)*n(idx_HC2NC) &
        -k(2366)*n(idx_CH3j)*n(idx_HC2NC) &
        -k(2367)*n(idx_CH3j)*n(idx_HC3N) &
        -k(2368)*n(idx_CH3j)*n(idx_HC3N) &
        -k(2369)*n(idx_CH3j)*n(idx_HNC3) &
        -k(2370)*n(idx_CH3j)*n(idx_HNC3) &
        -k(2371)*n(idx_CH3j)*n(idx_C2H4) &
        -k(2372)*n(idx_CH3j)*n(idx_C2H4) &
        -k(2373)*n(idx_CH3j)*n(idx_C2H4) &
        -k(2374)*n(idx_CH3j)*n(idx_C2H4) &
        -k(2375)*n(idx_CH3j)*n(idx_C3H3) &
        -k(2376)*n(idx_CH3j)*n(idx_C4H2) &
        -k(2377)*n(idx_CH3j)*n(idx_C4H2) &
        -k(2378)*n(idx_CH3j)*n(idx_C4H2) &
        -k(2379)*n(idx_CH3j)*n(idx_C5H) &
        -k(2380)*n(idx_CH3j)*n(idx_CH3OH) &
        -k(2381)*n(idx_CH3j)*n(idx_NH2CHO) &
        -k(2382)*n(idx_CH3j)*n(idx_C5H2) &
        -k(2383)*n(idx_CH3j)*n(idx_C6H) &
        -k(2384)*n(idx_CH3j)*n(idx_C6H2) &
        -k(2385)*n(idx_CH3j)*n(idx_C7H) &
        -k(2386)*n(idx_CH3j)*n(idx_C7H2) &
        -k(2387)*n(idx_CH3j)*n(idx_C8H) &
        -k(2388)*n(idx_CH3j)*n(idx_C8H2) &
        +k(2393)*n(idx_HCNHj)*n(idx_CH2) &
        +k(2394)*n(idx_HCNHj)*n(idx_CH2) &
        +k(2414)*n(idx_H2COj)*n(idx_CH2) &
        +k(2443)*n(idx_H3Oj)*n(idx_CH2) &
        +k(2521)*n(idx_NH3j)*n(idx_CH2) &
        +k(2549)*n(idx_C2H3j)*n(idx_O) &
        +k(2716)*n(idx_CH4j)*n(idx_H) &
        +k(2717)*n(idx_CH4j)*n(idx_O) &
        +k(2765)*n(idx_C2H4j)*n(idx_O) &
        +k(2922)*n(idx_CH5j)*n(idx_CH2) &
        -k(3168)*n(idx_CH3j)*n(idx_CO) &
        -k(3169)*n(idx_CH3j)*n(idx_H2) &
        -k(3170)*n(idx_CH3j)*n(idx_H2O) &
        -k(3171)*n(idx_CH3j)*n(idx_HCN) &
        -k(3172)*n(idx_CH3j)*n(idx_NH3) &
        -k(3173)*n(idx_CH3j)*n(idx_HC3N) &
        -k(3174)*n(idx_CH3j)*n(idx_CH3OH) &
        -k(3175)*n(idx_CH3j)*n(idx_C2H4O) &
        -k(3176)*n(idx_CH3j)*n(idx_HC5N) &
        -k(3177)*n(idx_CH3j)*n(idx_HC7N) &
        -k(3788)*n(idx_CH3j)*n(idx_E) &
        -k(3789)*n(idx_CH3j)*n(idx_E) &
        -k(3790)*n(idx_CH3j)*n(idx_E) &
        -k(3791)*n(idx_CH3j)*n(idx_E) &
        -k(4207)*n(idx_CH3j)*n(idx_E) &
        +k(4321)*n(idx_CH3) &
        -k(4422)*n(idx_CH3j) &
        -k(4423)*n(idx_CH3j)

    !NH3+
    !NH3+
    dn(idx_NH3j) = &
        +k(121)*n(idx_NH3) &
        +k(292)*n(idx_Cj)*n(idx_NH3) &
        +k(508)*n(idx_Hj)*n(idx_NH3) &
        +k(779)*n(idx_HEj)*n(idx_NH3) &
        +k(873)*n(idx_HEj)*n(idx_NH2CHO) &
        +k(991)*n(idx_Nj)*n(idx_NH3) &
        +k(1039)*n(idx_Oj)*n(idx_NH3) &
        +k(1052)*n(idx_Pj)*n(idx_NH3) &
        +k(1084)*n(idx_Sj)*n(idx_NH3) &
        +k(1197)*n(idx_CHj)*n(idx_NH3) &
        +k(1268)*n(idx_COj)*n(idx_NH3) &
        +k(1325)*n(idx_H2j)*n(idx_NH3) &
        +k(1353)*n(idx_HSj)*n(idx_NH3) &
        +k(1390)*n(idx_N2j)*n(idx_NH3) &
        +k(1425)*n(idx_NHj)*n(idx_H2O) &
        +k(1429)*n(idx_NHj)*n(idx_NH2) &
        +k(1433)*n(idx_NHj)*n(idx_NH3) &
        +k(1464)*n(idx_O2j)*n(idx_NH3) &
        +k(1506)*n(idx_OHj)*n(idx_NH2) &
        +k(1509)*n(idx_OHj)*n(idx_NH3) &
        +k(1561)*n(idx_SOj)*n(idx_NH3) &
        +k(1582)*n(idx_C2Hj)*n(idx_NH2) &
        +k(1651)*n(idx_CO2j)*n(idx_NH3) &
        +k(1690)*n(idx_H2Oj)*n(idx_NH2) &
        +k(1693)*n(idx_H2Oj)*n(idx_NH3) &
        +k(1710)*n(idx_H2Sj)*n(idx_NH3) &
        +k(1772)*n(idx_H3j)*n(idx_NH2) &
        +k(1895)*n(idx_HCNj)*n(idx_NH2) &
        +k(1898)*n(idx_HCNj)*n(idx_NH3) &
        +k(1946)*n(idx_HCOj)*n(idx_NH2) &
        +k(2056)*n(idx_HNCj)*n(idx_NH2) &
        +k(2058)*n(idx_HNCj)*n(idx_NH3) &
        +k(2075)*n(idx_HNOj)*n(idx_NH2) &
        +k(2100)*n(idx_N2Hj)*n(idx_NH2) &
        +k(2122)*n(idx_NH2j)*n(idx_H2) &
        +k(2123)*n(idx_NH2j)*n(idx_NH) &
        +k(2131)*n(idx_NH2j)*n(idx_H2O) &
        +k(2136)*n(idx_NH2j)*n(idx_H2S) &
        +k(2141)*n(idx_NH2j)*n(idx_NH2) &
        +k(2142)*n(idx_NH2j)*n(idx_H2CO) &
        +k(2144)*n(idx_NH2j)*n(idx_NH3) &
        +k(2168)*n(idx_O2Hj)*n(idx_NH2) &
        +k(2171)*n(idx_OCSj)*n(idx_NH3) &
        +k(2220)*n(idx_C2H2j)*n(idx_NH2) &
        +k(2229)*n(idx_C2H2j)*n(idx_NH3) &
        +k(2292)*n(idx_C3Hj)*n(idx_NH3) &
        +k(2293)*n(idx_C3Hj)*n(idx_NH3) &
        +k(2395)*n(idx_HCNHj)*n(idx_NH2) &
        +k(2396)*n(idx_HCNHj)*n(idx_NH2) &
        +k(2420)*n(idx_H2COj)*n(idx_NH2) &
        +k(2422)*n(idx_H2COj)*n(idx_NH3) &
        +k(2451)*n(idx_H3Oj)*n(idx_NH2) &
        -k(2509)*n(idx_NH3j)*n(idx_FE) &
        -k(2510)*n(idx_NH3j)*n(idx_MG) &
        -k(2511)*n(idx_NH3j)*n(idx_NA) &
        -k(2512)*n(idx_NH3j)*n(idx_O) &
        -k(2513)*n(idx_NH3j)*n(idx_O) &
        -k(2514)*n(idx_NH3j)*n(idx_SI) &
        -k(2515)*n(idx_NH3j)*n(idx_C2) &
        -k(2516)*n(idx_NH3j)*n(idx_CH) &
        -k(2517)*n(idx_NH3j)*n(idx_H2) &
        -k(2518)*n(idx_NH3j)*n(idx_NH) &
        -k(2519)*n(idx_NH3j)*n(idx_NO) &
        -k(2520)*n(idx_NH3j)*n(idx_OH) &
        -k(2521)*n(idx_NH3j)*n(idx_CH2) &
        -k(2522)*n(idx_NH3j)*n(idx_H2O) &
        -k(2523)*n(idx_NH3j)*n(idx_H2S) &
        -k(2524)*n(idx_NH3j)*n(idx_HCO) &
        -k(2525)*n(idx_NH3j)*n(idx_HCO) &
        -k(2526)*n(idx_NH3j)*n(idx_NH2) &
        -k(2527)*n(idx_NH3j)*n(idx_H2CO) &
        -k(2528)*n(idx_NH3j)*n(idx_NH3) &
        -k(2529)*n(idx_NH3j)*n(idx_CH4) &
        +k(2733)*n(idx_CH4j)*n(idx_NH3) &
        +k(2744)*n(idx_H3COj)*n(idx_NH2) &
        +k(2779)*n(idx_C2H4j)*n(idx_NH3) &
        +k(2927)*n(idx_CH5j)*n(idx_NH2) &
        -k(3831)*n(idx_NH3j)*n(idx_E) &
        -k(3832)*n(idx_NH3j)*n(idx_E) &
        +k(4329)*n(idx_NH3)

    !C2H2O+
    !C2H2O+
    dn(idx_C2H2Oj) = &
        +k(128)*n(idx_C2H2O) &
        +k(303)*n(idx_Cj)*n(idx_C2H2O) &
        +k(517)*n(idx_Hj)*n(idx_C2H2O) &
        +k(877)*n(idx_HEj)*n(idx_C2H4O) &
        +k(918)*n(idx_HEj)*n(idx_C2H5OH) &
        +k(1576)*n(idx_C2Hj)*n(idx_H2O) &
        +k(1625)*n(idx_CH2j)*n(idx_HCO) &
        +k(1630)*n(idx_CH2j)*n(idx_H2CO) &
        +k(2208)*n(idx_C2H2j)*n(idx_OH) &
        +k(2548)*n(idx_C2H3j)*n(idx_O) &
        -k(3853)*n(idx_C2H2Oj)*n(idx_E) &
        -k(3854)*n(idx_C2H2Oj)*n(idx_E) &
        -k(3855)*n(idx_C2H2Oj)*n(idx_E) &
        +k(4331)*n(idx_C2H2O)

    !CH2O2+
    !CH2O2+
    dn(idx_CH2O2j) = &
        +k(138)*n(idx_CH2O2) &
        +k(530)*n(idx_Hj)*n(idx_CH2O2) &
        -k(3888)*n(idx_CH2O2j)*n(idx_E) &
        +k(4344)*n(idx_CH2O2)

    !CH3CN+
    !CH3CN+
    dn(idx_CH3CNj) = &
        +k(149)*n(idx_CH3CN) &
        +k(369)*n(idx_Cj)*n(idx_NH2CHO) &
        +k(561)*n(idx_Hj)*n(idx_CH3CN) &
        +k(1800)*n(idx_H3j)*n(idx_CH2CN) &
        +k(2221)*n(idx_C2H2j)*n(idx_NH2) &
        -k(2756)*n(idx_CH3CNj)*n(idx_CO) &
        +k(2763)*n(idx_C2H4j)*n(idx_N) &
        -k(3930)*n(idx_CH3CNj)*n(idx_E) &
        -k(3931)*n(idx_CH3CNj)*n(idx_E) &
        -k(3932)*n(idx_CH3CNj)*n(idx_E) &
        -k(3933)*n(idx_CH3CNj)*n(idx_E) &
        +k(4351)*n(idx_CH3CN)

    !C2H4+
    !C2H4+
    dn(idx_C2H4j) = &
        +k(151)*n(idx_C2H4) &
        +k(350)*n(idx_Cj)*n(idx_C2H4) &
        +k(563)*n(idx_Hj)*n(idx_C2H4) &
        +k(581)*n(idx_Hj)*n(idx_C2H5) &
        +k(855)*n(idx_HEj)*n(idx_C2H4) &
        +k(880)*n(idx_HEj)*n(idx_C2H5) &
        +k(1201)*n(idx_CHj)*n(idx_CH4) &
        +k(1331)*n(idx_H2j)*n(idx_C2H4) &
        +k(1634)*n(idx_CH2j)*n(idx_CH4) &
        +k(1802)*n(idx_H3j)*n(idx_C2H3) &
        +k(1971)*n(idx_HCOj)*n(idx_C2H3) &
        +k(2243)*n(idx_C2H2j)*n(idx_C2H4) &
        +k(2469)*n(idx_H3Oj)*n(idx_C2H3) &
        +k(2737)*n(idx_CH4j)*n(idx_C2H4) &
        -k(2757)*n(idx_C2H4j)*n(idx_C) &
        -k(2758)*n(idx_C2H4j)*n(idx_C) &
        -k(2759)*n(idx_C2H4j)*n(idx_C) &
        -k(2760)*n(idx_C2H4j)*n(idx_C) &
        -k(2761)*n(idx_C2H4j)*n(idx_H) &
        -k(2762)*n(idx_C2H4j)*n(idx_N) &
        -k(2763)*n(idx_C2H4j)*n(idx_N) &
        -k(2764)*n(idx_C2H4j)*n(idx_O) &
        -k(2765)*n(idx_C2H4j)*n(idx_O) &
        -k(2766)*n(idx_C2H4j)*n(idx_S) &
        -k(2767)*n(idx_C2H4j)*n(idx_SI) &
        -k(2768)*n(idx_C2H4j)*n(idx_SI) &
        -k(2769)*n(idx_C2H4j)*n(idx_C2H) &
        -k(2770)*n(idx_C2H4j)*n(idx_C2H) &
        -k(2771)*n(idx_C2H4j)*n(idx_C2H) &
        -k(2772)*n(idx_C2H4j)*n(idx_C2H2) &
        -k(2773)*n(idx_C2H4j)*n(idx_C2H2) &
        -k(2774)*n(idx_C2H4j)*n(idx_C2H2) &
        -k(2775)*n(idx_C2H4j)*n(idx_C3H) &
        -k(2776)*n(idx_C2H4j)*n(idx_HC3) &
        -k(2777)*n(idx_C2H4j)*n(idx_C3H) &
        -k(2778)*n(idx_C2H4j)*n(idx_HC3) &
        -k(2779)*n(idx_C2H4j)*n(idx_NH3) &
        -k(2780)*n(idx_C2H4j)*n(idx_NH3) &
        -k(2781)*n(idx_C2H4j)*n(idx_C2H3) &
        -k(2782)*n(idx_C2H4j)*n(idx_C2H3) &
        -k(2783)*n(idx_C2H4j)*n(idx_C2H3) &
        -k(2784)*n(idx_C2H4j)*n(idx_C3H2) &
        -k(2785)*n(idx_C2H4j)*n(idx_H2C3) &
        -k(2786)*n(idx_C2H4j)*n(idx_C3H2) &
        -k(2787)*n(idx_C2H4j)*n(idx_H2C3) &
        -k(2788)*n(idx_C2H4j)*n(idx_C4H) &
        -k(2789)*n(idx_C2H4j)*n(idx_C4H) &
        -k(2790)*n(idx_C2H4j)*n(idx_HC3N) &
        -k(2791)*n(idx_C2H4j)*n(idx_C2H4) &
        -k(2792)*n(idx_C2H4j)*n(idx_C2H4) &
        -k(2793)*n(idx_C2H4j)*n(idx_C3H3) &
        -k(2794)*n(idx_C2H4j)*n(idx_C3H3) &
        -k(2795)*n(idx_C2H4j)*n(idx_C3H3) &
        -k(2796)*n(idx_C2H4j)*n(idx_C3H3) &
        -k(2797)*n(idx_C2H4j)*n(idx_C4H2) &
        -k(2798)*n(idx_C2H4j)*n(idx_C4H2) &
        -k(2799)*n(idx_C2H4j)*n(idx_C5H) &
        -k(2800)*n(idx_C2H4j)*n(idx_C5H) &
        -k(2801)*n(idx_C2H4j)*n(idx_C3H4) &
        -k(2802)*n(idx_C2H4j)*n(idx_C5H2) &
        -k(2803)*n(idx_C2H4j)*n(idx_C5H2) &
        -k(2804)*n(idx_C2H4j)*n(idx_C6H) &
        -k(2805)*n(idx_C2H4j)*n(idx_C6H) &
        -k(2806)*n(idx_C2H4j)*n(idx_C6H2) &
        -k(2807)*n(idx_C2H4j)*n(idx_C6H2) &
        -k(2808)*n(idx_C2H4j)*n(idx_C7H) &
        -k(2809)*n(idx_C2H4j)*n(idx_C7H) &
        -k(2810)*n(idx_C2H4j)*n(idx_C7H2) &
        -k(2811)*n(idx_C2H4j)*n(idx_C7H2) &
        +k(2908)*n(idx_CH5j)*n(idx_C) &
        +k(2943)*n(idx_C2H5j)*n(idx_H) &
        +k(3023)*n(idx_C3H5j)*n(idx_N) &
        +k(3158)*n(idx_C2H2j)*n(idx_H2) &
        -k(3936)*n(idx_C2H4j)*n(idx_E) &
        -k(3937)*n(idx_C2H4j)*n(idx_E) &
        -k(3938)*n(idx_C2H4j)*n(idx_E) &
        -k(3939)*n(idx_C2H4j)*n(idx_E) &
        -k(3940)*n(idx_C2H4j)*n(idx_E) &
        -k(3941)*n(idx_C2H4j)*n(idx_E) &
        -k(3942)*n(idx_C2H4j)*n(idx_E) &
        +k(4353)*n(idx_C2H4)

    !C4H2+
    !C4H2+
    dn(idx_C4H2j) = &
        +k(156)*n(idx_C4H2) &
        +k(355)*n(idx_Cj)*n(idx_C3H3) &
        +k(358)*n(idx_Cj)*n(idx_C4H2) &
        +k(380)*n(idx_Cj)*n(idx_C3H4) &
        +k(569)*n(idx_Hj)*n(idx_C4H2) &
        +k(589)*n(idx_Hj)*n(idx_C4H3) &
        +k(889)*n(idx_HEj)*n(idx_C4H3) &
        +k(1093)*n(idx_Sj)*n(idx_C4H2) &
        +k(1584)*n(idx_C2Hj)*n(idx_C2H2) &
        +k(1805)*n(idx_H3j)*n(idx_C4H) &
        +k(1974)*n(idx_HCOj)*n(idx_C4H) &
        +k(2210)*n(idx_C2H2j)*n(idx_C2H) &
        +k(2222)*n(idx_C2H2j)*n(idx_C2H2) &
        +k(2251)*n(idx_C2H2j)*n(idx_C4H2) &
        +k(2350)*n(idx_CH3j)*n(idx_C3H) &
        +k(2351)*n(idx_CH3j)*n(idx_HC3) &
        +k(2472)*n(idx_H3Oj)*n(idx_C4H) &
        +k(2554)*n(idx_C2H3j)*n(idx_C2H) &
        +k(2577)*n(idx_C2H3j)*n(idx_C4H) &
        +k(2660)*n(idx_C3H2j)*n(idx_C3H4) &
        +k(2661)*n(idx_H2C3j)*n(idx_C3H4) &
        +k(2689)*n(idx_C4Hj)*n(idx_H2) &
        +k(2700)*n(idx_C4Hj)*n(idx_C4H) &
        +k(2775)*n(idx_C2H4j)*n(idx_C3H) &
        +k(2776)*n(idx_C2H4j)*n(idx_HC3) &
        +k(2814)*n(idx_C3H3j)*n(idx_C) &
        +k(2815)*n(idx_H3C3j)*n(idx_C) &
        -k(2870)*n(idx_C4H2j)*n(idx_C) &
        -k(2871)*n(idx_C4H2j)*n(idx_C) &
        -k(2872)*n(idx_C4H2j)*n(idx_N) &
        -k(2873)*n(idx_C4H2j)*n(idx_O) &
        -k(2874)*n(idx_C4H2j)*n(idx_O) &
        -k(2875)*n(idx_C4H2j)*n(idx_O) &
        -k(2876)*n(idx_C4H2j)*n(idx_P) &
        -k(2877)*n(idx_C4H2j)*n(idx_S) &
        -k(2878)*n(idx_C4H2j)*n(idx_SI) &
        -k(2879)*n(idx_C4H2j)*n(idx_SI) &
        -k(2880)*n(idx_C4H2j)*n(idx_C2H) &
        -k(2881)*n(idx_C4H2j)*n(idx_C2H2) &
        -k(2882)*n(idx_C4H2j)*n(idx_C3H) &
        -k(2883)*n(idx_C4H2j)*n(idx_HC3) &
        -k(2884)*n(idx_C4H2j)*n(idx_C2H3) &
        -k(2885)*n(idx_C4H2j)*n(idx_C2H3) &
        -k(2886)*n(idx_C4H2j)*n(idx_C3H2) &
        -k(2887)*n(idx_C4H2j)*n(idx_H2C3) &
        -k(2888)*n(idx_C4H2j)*n(idx_C4H) &
        -k(2889)*n(idx_C4H2j)*n(idx_CH4) &
        -k(2890)*n(idx_C4H2j)*n(idx_CH4) &
        -k(2891)*n(idx_C4H2j)*n(idx_C2H4) &
        -k(2892)*n(idx_C4H2j)*n(idx_C2H4) &
        -k(2893)*n(idx_C4H2j)*n(idx_C3H3) &
        -k(2894)*n(idx_C4H2j)*n(idx_C3H3) &
        -k(2895)*n(idx_C4H2j)*n(idx_C4H2) &
        -k(2896)*n(idx_C4H2j)*n(idx_C4H2) &
        -k(2897)*n(idx_C4H2j)*n(idx_C5H) &
        -k(2898)*n(idx_C4H2j)*n(idx_C3H4) &
        -k(2899)*n(idx_C4H2j)*n(idx_C5H2) &
        +k(2956)*n(idx_C3H4j)*n(idx_C) &
        +k(3186)*n(idx_C4Hj)*n(idx_H) &
        -k(3191)*n(idx_C4H2j)*n(idx_H) &
        -k(3192)*n(idx_C4H2j)*n(idx_C2H2) &
        -k(3193)*n(idx_C4H2j)*n(idx_HC3N) &
        -k(3194)*n(idx_C4H2j)*n(idx_C4H2) &
        -k(3195)*n(idx_C4H2j)*n(idx_HC5N) &
        -k(3954)*n(idx_C4H2j)*n(idx_E) &
        -k(3955)*n(idx_C4H2j)*n(idx_E) &
        +k(4360)*n(idx_C4H2)

    !H3CO+
    !H3CO+
    dn(idx_H3COj) = &
        +k(162)*n(idx_CH3OH) &
        +k(362)*n(idx_Cj)*n(idx_CH3OH) &
        +k(365)*n(idx_Cj)*n(idx_NH2CHO) &
        +k(400)*n(idx_Cj)*n(idx_C2H5OH) &
        +k(573)*n(idx_Hj)*n(idx_CH3OH) &
        +k(933)*n(idx_HEj)*n(idx_CH3OCH3) &
        +k(1001)*n(idx_Nj)*n(idx_CH3OH) &
        +k(1043)*n(idx_Oj)*n(idx_CH3OH) &
        +k(1195)*n(idx_CHj)*n(idx_H2CO) &
        +k(1203)*n(idx_CHj)*n(idx_CH3OH) &
        +k(1432)*n(idx_NHj)*n(idx_H2CO) &
        +k(1466)*n(idx_O2j)*n(idx_CH3OH) &
        +k(1508)*n(idx_OHj)*n(idx_H2CO) &
        +k(1585)*n(idx_C2Hj)*n(idx_H2CO) &
        +k(1620)*n(idx_CH2j)*n(idx_H2O) &
        +k(1692)*n(idx_H2Oj)*n(idx_H2CO) &
        +k(1790)*n(idx_H3j)*n(idx_H2CO) &
        +k(1833)*n(idx_H3j)*n(idx_CH3OH) &
        +k(1896)*n(idx_HCNj)*n(idx_H2CO) &
        +k(1961)*n(idx_HCOj)*n(idx_H2CO) &
        +k(2057)*n(idx_HNCj)*n(idx_H2CO) &
        +k(2076)*n(idx_HNOj)*n(idx_H2CO) &
        +k(2102)*n(idx_N2Hj)*n(idx_H2CO) &
        +k(2143)*n(idx_NH2j)*n(idx_H2CO) &
        +k(2169)*n(idx_O2Hj)*n(idx_H2CO) &
        +k(2333)*n(idx_CH3j)*n(idx_O2) &
        +k(2380)*n(idx_CH3j)*n(idx_CH3OH) &
        +k(2397)*n(idx_HCNHj)*n(idx_H2CO) &
        +k(2409)*n(idx_H2COj)*n(idx_NH) &
        +k(2418)*n(idx_H2COj)*n(idx_HCO) &
        +k(2421)*n(idx_H2COj)*n(idx_H2CO) &
        +k(2424)*n(idx_H2COj)*n(idx_CH4) &
        +k(2462)*n(idx_H3Oj)*n(idx_H2CO) &
        +k(2497)*n(idx_H3Sj)*n(idx_H2CO) &
        +k(2732)*n(idx_CH4j)*n(idx_H2CO) &
        -k(2741)*n(idx_H3COj)*n(idx_NA) &
        -k(2742)*n(idx_H3COj)*n(idx_CH) &
        -k(2743)*n(idx_H3COj)*n(idx_HNC) &
        -k(2744)*n(idx_H3COj)*n(idx_NH2) &
        -k(2745)*n(idx_H3COj)*n(idx_NH3) &
        +k(2912)*n(idx_CH5j)*n(idx_O) &
        +k(2929)*n(idx_CH5j)*n(idx_H2CO) &
        +k(2953)*n(idx_C2H5j)*n(idx_H2CO) &
        -k(3187)*n(idx_H3COj)*n(idx_CH4) &
        -k(3891)*n(idx_H3COj)*n(idx_E) &
        -k(3892)*n(idx_H3COj)*n(idx_E) &
        -k(3893)*n(idx_H3COj)*n(idx_E)

    !CH4O+
    !CH4O+
    dn(idx_CH4Oj) = &
        +k(163)*n(idx_CH3OH) &
        +k(363)*n(idx_Cj)*n(idx_CH3OH) &
        +k(574)*n(idx_Hj)*n(idx_CH3OH) &
        +k(1002)*n(idx_Nj)*n(idx_CH3OH) &
        +k(1044)*n(idx_Oj)*n(idx_CH3OH) &
        +k(1467)*n(idx_O2j)*n(idx_CH3OH) &
        +k(2739)*n(idx_CH4j)*n(idx_CH3OH) &
        -k(3967)*n(idx_CH4Oj)*n(idx_E) &
        -k(3968)*n(idx_CH4Oj)*n(idx_E) &
        +k(4367)*n(idx_CH3OH)

    !C2H4O+
    !C2H4O+
    dn(idx_C2H4Oj) = &
        +k(166)*n(idx_C2H4O) &
        +k(371)*n(idx_Cj)*n(idx_C2H4O) &
        +k(580)*n(idx_Hj)*n(idx_C2H4O) &
        +k(920)*n(idx_HEj)*n(idx_C2H5OH) &
        +k(2945)*n(idx_C2H5j)*n(idx_O) &
        -k(4017)*n(idx_C2H4Oj)*n(idx_E) &
        -k(4018)*n(idx_C2H4Oj)*n(idx_E) &
        -k(4019)*n(idx_C2H4Oj)*n(idx_E) &
        +k(4370)*n(idx_C2H4O)

    !C3H4+
    !C3H4+
    dn(idx_C3H4j) = &
        +k(170)*n(idx_C3H4) &
        +k(381)*n(idx_Cj)*n(idx_C3H4) &
        +k(587)*n(idx_Hj)*n(idx_C3H4) &
        +k(1591)*n(idx_C2Hj)*n(idx_CH4) &
        +k(1827)*n(idx_H3j)*n(idx_C3H3) &
        +k(1993)*n(idx_HCOj)*n(idx_C3H3) &
        +k(2241)*n(idx_C2H2j)*n(idx_CH4) &
        +k(2256)*n(idx_C2H2j)*n(idx_C3H4) &
        +k(2358)*n(idx_CH3j)*n(idx_C2H3) &
        +k(2482)*n(idx_H3Oj)*n(idx_C3H3) &
        +k(2583)*n(idx_C2H3j)*n(idx_C3H3) &
        +k(2942)*n(idx_C2H5j)*n(idx_C) &
        -k(2956)*n(idx_C3H4j)*n(idx_C) &
        -k(2957)*n(idx_C3H4j)*n(idx_C) &
        -k(2958)*n(idx_C3H4j)*n(idx_H) &
        -k(2959)*n(idx_C3H4j)*n(idx_H) &
        -k(2960)*n(idx_C3H4j)*n(idx_N) &
        -k(2961)*n(idx_C3H4j)*n(idx_N) &
        -k(2962)*n(idx_C3H4j)*n(idx_O) &
        -k(2963)*n(idx_C3H4j)*n(idx_C2H2) &
        -k(2964)*n(idx_C3H4j)*n(idx_C3H4) &
        -k(4026)*n(idx_C3H4j)*n(idx_E) &
        -k(4027)*n(idx_C3H4j)*n(idx_E) &
        -k(4028)*n(idx_C3H4j)*n(idx_E) &
        -k(4029)*n(idx_C3H4j)*n(idx_E) &
        -k(4030)*n(idx_C3H4j)*n(idx_E) &
        -k(4031)*n(idx_C3H4j)*n(idx_E) &
        -k(4032)*n(idx_C3H4j)*n(idx_E) &
        -k(4033)*n(idx_C3H4j)*n(idx_E) &
        +k(4374)*n(idx_C3H4)

    !CH5N+
    !CH5N+
    dn(idx_CH5Nj) = &
        +k(175)*n(idx_CH5N) &
        +k(391)*n(idx_Cj)*n(idx_CH5N) &
        +k(596)*n(idx_Hj)*n(idx_CH5N) &
        +k(2381)*n(idx_CH3j)*n(idx_NH2CHO) &
        -k(4046)*n(idx_CH5Nj)*n(idx_E) &
        -k(4047)*n(idx_CH5Nj)*n(idx_E) &
        +k(4387)*n(idx_CH5N)

    !C2H5OH+
    !C2H5OH+
    dn(idx_C2H5OHj) = &
        +k(183)*n(idx_C2H5OH) &
        +k(402)*n(idx_Cj)*n(idx_C2H5OH) &
        +k(606)*n(idx_Hj)*n(idx_C2H5OH) &
        -k(4098)*n(idx_C2H5OHj)*n(idx_E) &
        -k(4099)*n(idx_C2H5OHj)*n(idx_E) &
        -k(4100)*n(idx_C2H5OHj)*n(idx_E) &
        -k(4101)*n(idx_C2H5OHj)*n(idx_E) &
        +k(4409)*n(idx_C2H5OH)

    !CH3OCH3+
    !CH3OCH3+
    dn(idx_CH3OCH3j) = &
        +k(189)*n(idx_CH3OCH3) &
        +k(409)*n(idx_Cj)*n(idx_CH3OCH3) &
        +k(615)*n(idx_Hj)*n(idx_CH3OCH3) &
        -k(4124)*n(idx_CH3OCH3j)*n(idx_E) &
        -k(4125)*n(idx_CH3OCH3j)*n(idx_E) &
        -k(4126)*n(idx_CH3OCH3j)*n(idx_E) &
        +k(4412)*n(idx_CH3OCH3)

    !CH+
    !CH+
    dn(idx_CHj) = &
        -k(200)*n(idx_CHj) &
        +k(209)*n(idx_Cj)*n(idx_CH) &
        +k(253)*n(idx_Cj)*n(idx_HCO) &
        +k(433)*n(idx_Hj)*n(idx_CH) &
        +k(464)*n(idx_Hj)*n(idx_CH2) &
        +k(636)*n(idx_HEj)*n(idx_CH) &
        +k(678)*n(idx_HEj)*n(idx_C2H) &
        +k(690)*n(idx_HEj)*n(idx_CH2) &
        +k(704)*n(idx_HEj)*n(idx_HCN) &
        +k(706)*n(idx_HEj)*n(idx_HCO) &
        +k(749)*n(idx_HEj)*n(idx_C2H2) &
        +k(765)*n(idx_HEj)*n(idx_CH3) &
        +k(775)*n(idx_HEj)*n(idx_HCCP) &
        +k(813)*n(idx_HEj)*n(idx_CH4) &
        +k(957)*n(idx_Nj)*n(idx_CH) &
        +k(1007)*n(idx_Oj)*n(idx_CH) &
        +k(1127)*n(idx_C2j)*n(idx_CH) &
        -k(1152)*n(idx_CHj)*n(idx_C) &
        -k(1153)*n(idx_CHj)*n(idx_FE) &
        -k(1154)*n(idx_CHj)*n(idx_H) &
        -k(1155)*n(idx_CHj)*n(idx_MG) &
        -k(1156)*n(idx_CHj)*n(idx_N) &
        -k(1157)*n(idx_CHj)*n(idx_NA) &
        -k(1158)*n(idx_CHj)*n(idx_O) &
        -k(1159)*n(idx_CHj)*n(idx_S) &
        -k(1160)*n(idx_CHj)*n(idx_S) &
        -k(1161)*n(idx_CHj)*n(idx_S) &
        -k(1162)*n(idx_CHj)*n(idx_SI) &
        -k(1163)*n(idx_CHj)*n(idx_C2) &
        -k(1164)*n(idx_CHj)*n(idx_CH) &
        -k(1165)*n(idx_CHj)*n(idx_CN) &
        -k(1166)*n(idx_CHj)*n(idx_CN) &
        -k(1167)*n(idx_CHj)*n(idx_H2) &
        -k(1168)*n(idx_CHj)*n(idx_NH) &
        -k(1169)*n(idx_CHj)*n(idx_NO) &
        -k(1170)*n(idx_CHj)*n(idx_O2) &
        -k(1171)*n(idx_CHj)*n(idx_O2) &
        -k(1172)*n(idx_CHj)*n(idx_O2) &
        -k(1173)*n(idx_CHj)*n(idx_OH) &
        -k(1174)*n(idx_CHj)*n(idx_C2H) &
        -k(1175)*n(idx_CHj)*n(idx_CH2) &
        -k(1176)*n(idx_CHj)*n(idx_CO2) &
        -k(1177)*n(idx_CHj)*n(idx_H2O) &
        -k(1178)*n(idx_CHj)*n(idx_H2O) &
        -k(1179)*n(idx_CHj)*n(idx_H2O) &
        -k(1180)*n(idx_CHj)*n(idx_H2S) &
        -k(1181)*n(idx_CHj)*n(idx_H2S) &
        -k(1182)*n(idx_CHj)*n(idx_HCN) &
        -k(1183)*n(idx_CHj)*n(idx_HCN) &
        -k(1184)*n(idx_CHj)*n(idx_HCN) &
        -k(1185)*n(idx_CHj)*n(idx_HCO) &
        -k(1186)*n(idx_CHj)*n(idx_HCO) &
        -k(1187)*n(idx_CHj)*n(idx_HNC) &
        -k(1188)*n(idx_CHj)*n(idx_NH2) &
        -k(1189)*n(idx_CHj)*n(idx_OCS) &
        -k(1190)*n(idx_CHj)*n(idx_OCS) &
        -k(1191)*n(idx_CHj)*n(idx_C2H2) &
        -k(1192)*n(idx_CHj)*n(idx_C2H2) &
        -k(1193)*n(idx_CHj)*n(idx_H2CO) &
        -k(1194)*n(idx_CHj)*n(idx_H2CO) &
        -k(1195)*n(idx_CHj)*n(idx_H2CO) &
        -k(1196)*n(idx_CHj)*n(idx_NH3) &
        -k(1197)*n(idx_CHj)*n(idx_NH3) &
        -k(1198)*n(idx_CHj)*n(idx_NH3) &
        -k(1199)*n(idx_CHj)*n(idx_CH4) &
        -k(1200)*n(idx_CHj)*n(idx_CH4) &
        -k(1201)*n(idx_CHj)*n(idx_CH4) &
        -k(1202)*n(idx_CHj)*n(idx_CH3OH) &
        -k(1203)*n(idx_CHj)*n(idx_CH3OH) &
        -k(1204)*n(idx_CHj)*n(idx_CH3OH) &
        +k(1210)*n(idx_CNj)*n(idx_CH) &
        +k(1242)*n(idx_COj)*n(idx_CH) &
        +k(1283)*n(idx_H2j)*n(idx_C) &
        +k(1289)*n(idx_H2j)*n(idx_CH) &
        +k(1366)*n(idx_N2j)*n(idx_CH) &
        +k(1393)*n(idx_NHj)*n(idx_C) &
        +k(1450)*n(idx_O2j)*n(idx_CH) &
        +k(1468)*n(idx_OHj)*n(idx_C) &
        +k(1477)*n(idx_OHj)*n(idx_CH) &
        +k(1563)*n(idx_C2Hj)*n(idx_N) &
        +k(1656)*n(idx_H2Oj)*n(idx_C) &
        +k(1668)*n(idx_H2Oj)*n(idx_CH) &
        +k(1712)*n(idx_H3j)*n(idx_C) &
        +k(1873)*n(idx_HCNj)*n(idx_C) &
        +k(1901)*n(idx_HCOj)*n(idx_C) &
        +k(2040)*n(idx_HNCj)*n(idx_C) &
        +k(2059)*n(idx_HNOj)*n(idx_C) &
        +k(2086)*n(idx_N2Hj)*n(idx_C) &
        +k(2118)*n(idx_NH2j)*n(idx_CH) &
        +k(2148)*n(idx_O2Hj)*n(idx_C) &
        +k(2192)*n(idx_C2H2j)*n(idx_N) &
        +k(2407)*n(idx_H2COj)*n(idx_CH) &
        +k(2499)*n(idx_HCO2j)*n(idx_C) &
        +k(2906)*n(idx_CH5j)*n(idx_C) &
        +k(3127)*n(idx_Cj)*n(idx_H) &
        -k(3660)*n(idx_CHj)*n(idx_E) &
        +k(4261)*n(idx_CH) &
        -k(4414)*n(idx_CHj) &
        +k(4419)*n(idx_CH2j) &
        +k(4422)*n(idx_CH3j)

    !CCL+
    !CCL+
    dn(idx_CCLj) = &
        +k(207)*n(idx_Cj)*n(idx_CCL) &
        +k(212)*n(idx_Cj)*n(idx_HCL) &
        -k(3658)*n(idx_CCLj)*n(idx_E)

    !C2+
    !C2+
    dn(idx_C2j) = &
        +k(208)*n(idx_Cj)*n(idx_CH) &
        +k(432)*n(idx_Hj)*n(idx_C2) &
        +k(457)*n(idx_Hj)*n(idx_C2H) &
        +k(633)*n(idx_HEj)*n(idx_C2) &
        +k(677)*n(idx_HEj)*n(idx_C2H) &
        +k(682)*n(idx_HEj)*n(idx_C2S) &
        +k(685)*n(idx_HEj)*n(idx_C3) &
        +k(748)*n(idx_HEj)*n(idx_C2H2) &
        +k(754)*n(idx_HEj)*n(idx_C3N) &
        +k(756)*n(idx_HEj)*n(idx_C3O) &
        +k(760)*n(idx_HEj)*n(idx_C3S) &
        +k(763)*n(idx_HEj)*n(idx_C4) &
        +k(798)*n(idx_HEj)*n(idx_C4P) &
        +k(817)*n(idx_HEj)*n(idx_HCNC2) &
        +k(825)*n(idx_HEj)*n(idx_HC3N) &
        +k(832)*n(idx_HEj)*n(idx_HNC3) &
        +k(956)*n(idx_Nj)*n(idx_C2) &
        +k(1005)*n(idx_Oj)*n(idx_C2) &
        -k(1121)*n(idx_C2j)*n(idx_C) &
        -k(1122)*n(idx_C2j)*n(idx_N) &
        -k(1123)*n(idx_C2j)*n(idx_O) &
        -k(1124)*n(idx_C2j)*n(idx_S) &
        -k(1125)*n(idx_C2j)*n(idx_S) &
        -k(1126)*n(idx_C2j)*n(idx_C2) &
        -k(1127)*n(idx_C2j)*n(idx_CH) &
        -k(1128)*n(idx_C2j)*n(idx_CH) &
        -k(1129)*n(idx_C2j)*n(idx_H2) &
        -k(1130)*n(idx_C2j)*n(idx_NH) &
        -k(1131)*n(idx_C2j)*n(idx_NH) &
        -k(1132)*n(idx_C2j)*n(idx_NO) &
        -k(1133)*n(idx_C2j)*n(idx_O2) &
        -k(1134)*n(idx_C2j)*n(idx_CH2) &
        -k(1135)*n(idx_C2j)*n(idx_CH2) &
        -k(1136)*n(idx_C2j)*n(idx_H2O) &
        -k(1137)*n(idx_C2j)*n(idx_H2O) &
        -k(1138)*n(idx_C2j)*n(idx_HCN) &
        -k(1139)*n(idx_C2j)*n(idx_HCN) &
        -k(1140)*n(idx_C2j)*n(idx_HCO) &
        -k(1141)*n(idx_C2j)*n(idx_HCO) &
        -k(1142)*n(idx_C2j)*n(idx_NH2) &
        -k(1143)*n(idx_C2j)*n(idx_NH2) &
        -k(1144)*n(idx_C2j)*n(idx_C2H2) &
        -k(1145)*n(idx_C2j)*n(idx_CH4) &
        -k(1146)*n(idx_C2j)*n(idx_CH4) &
        -k(1147)*n(idx_C2j)*n(idx_CH4) &
        -k(1148)*n(idx_C2j)*n(idx_CH4) &
        -k(1149)*n(idx_C2j)*n(idx_CH4) &
        -k(1150)*n(idx_C2j)*n(idx_CH4) &
        -k(1151)*n(idx_C2j)*n(idx_CH4) &
        +k(1152)*n(idx_CHj)*n(idx_C) &
        +k(1164)*n(idx_CHj)*n(idx_CH) &
        +k(1209)*n(idx_CNj)*n(idx_C2) &
        +k(1241)*n(idx_COj)*n(idx_C2) &
        +k(1287)*n(idx_H2j)*n(idx_C2) &
        +k(1365)*n(idx_N2j)*n(idx_C2) &
        +k(1475)*n(idx_OHj)*n(idx_C2) &
        +k(1666)*n(idx_H2Oj)*n(idx_C2) &
        -k(3657)*n(idx_C2j)*n(idx_E) &
        +k(4258)*n(idx_C2) &
        -k(4413)*n(idx_C2j) &
        +k(4418)*n(idx_C2Hj)

    !CLO+
    !CLO+
    dn(idx_CLOj) = &
        +k(210)*n(idx_Cj)*n(idx_CLO) &
        -k(3661)*n(idx_CLOj)*n(idx_E)

    !CP+
    !CP+
    dn(idx_CPj) = &
        +k(211)*n(idx_Cj)*n(idx_CP) &
        +k(242)*n(idx_Cj)*n(idx_CCP) &
        +k(288)*n(idx_Cj)*n(idx_HCCP) &
        +k(434)*n(idx_Hj)*n(idx_CP) &
        +k(776)*n(idx_HEj)*n(idx_HCCP) &
        -k(1272)*n(idx_CPj)*n(idx_O) &
        -k(1273)*n(idx_CPj)*n(idx_H2) &
        -k(3664)*n(idx_CPj)*n(idx_E)

    !CF+
    !CF+
    dn(idx_CFj) = &
        +k(213)*n(idx_Cj)*n(idx_HF) &
        -k(3659)*n(idx_CFj)*n(idx_E)

    !CS+
    !CS+
    dn(idx_CSj) = &
        +k(214)*n(idx_Cj)*n(idx_HS) &
        +k(219)*n(idx_Cj)*n(idx_NS) &
        +k(236)*n(idx_Cj)*n(idx_SO) &
        +k(264)*n(idx_Cj)*n(idx_OCS) &
        +k(435)*n(idx_Hj)*n(idx_CS) &
        +k(474)*n(idx_Hj)*n(idx_HCS) &
        +k(683)*n(idx_HEj)*n(idx_C2S) &
        +k(712)*n(idx_HEj)*n(idx_HCS) &
        +k(737)*n(idx_HEj)*n(idx_OCS) &
        +k(761)*n(idx_HEj)*n(idx_C3S) &
        +k(770)*n(idx_HEj)*n(idx_H2CS) &
        +k(800)*n(idx_HEj)*n(idx_C4S) &
        +k(984)*n(idx_Nj)*n(idx_OCS) &
        +k(1060)*n(idx_Sj)*n(idx_C2) &
        +k(1061)*n(idx_Sj)*n(idx_CH) &
        +k(1125)*n(idx_C2j)*n(idx_S) &
        +k(1160)*n(idx_CHj)*n(idx_S) &
        -k(1274)*n(idx_CSj)*n(idx_C) &
        -k(1275)*n(idx_CSj)*n(idx_FE) &
        -k(1276)*n(idx_CSj)*n(idx_MG) &
        -k(1277)*n(idx_CSj)*n(idx_NA) &
        -k(1278)*n(idx_CSj)*n(idx_O) &
        -k(1279)*n(idx_CSj)*n(idx_SI) &
        -k(1280)*n(idx_CSj)*n(idx_H2) &
        -k(1281)*n(idx_CSj)*n(idx_O2) &
        -k(1282)*n(idx_CSj)*n(idx_CH4) &
        +k(1336)*n(idx_HSj)*n(idx_C) &
        +k(2287)*n(idx_C3Hj)*n(idx_OCS) &
        -k(3665)*n(idx_CSj)*n(idx_E)

    !CN+
    !CN+
    dn(idx_CNj) = &
        +k(217)*n(idx_Cj)*n(idx_NH) &
        +k(705)*n(idx_HEj)*n(idx_HCN) &
        +k(716)*n(idx_HEj)*n(idx_HNC) &
        +k(733)*n(idx_HEj)*n(idx_OCN) &
        +k(742)*n(idx_HEj)*n(idx_SINC) &
        +k(821)*n(idx_HEj)*n(idx_HC2NC) &
        +k(826)*n(idx_HEj)*n(idx_HC3N) &
        +k(837)*n(idx_HEj)*n(idx_NH2CN) &
        +k(849)*n(idx_HEj)*n(idx_CH3CN) &
        +k(905)*n(idx_HEj)*n(idx_HC5N) &
        +k(958)*n(idx_Nj)*n(idx_CH) &
        +k(959)*n(idx_Nj)*n(idx_CN) &
        +k(1156)*n(idx_CHj)*n(idx_N) &
        +k(1168)*n(idx_CHj)*n(idx_NH) &
        -k(1205)*n(idx_CNj)*n(idx_C) &
        -k(1206)*n(idx_CNj)*n(idx_H) &
        -k(1207)*n(idx_CNj)*n(idx_O) &
        -k(1208)*n(idx_CNj)*n(idx_S) &
        -k(1209)*n(idx_CNj)*n(idx_C2) &
        -k(1210)*n(idx_CNj)*n(idx_CH) &
        -k(1211)*n(idx_CNj)*n(idx_CO) &
        -k(1212)*n(idx_CNj)*n(idx_H2) &
        -k(1213)*n(idx_CNj)*n(idx_NH) &
        -k(1214)*n(idx_CNj)*n(idx_NO) &
        -k(1215)*n(idx_CNj)*n(idx_NO) &
        -k(1216)*n(idx_CNj)*n(idx_O2) &
        -k(1217)*n(idx_CNj)*n(idx_O2) &
        -k(1218)*n(idx_CNj)*n(idx_O2) &
        -k(1219)*n(idx_CNj)*n(idx_OH) &
        -k(1220)*n(idx_CNj)*n(idx_C2H) &
        -k(1221)*n(idx_CNj)*n(idx_CH2) &
        -k(1222)*n(idx_CNj)*n(idx_CO2) &
        -k(1223)*n(idx_CNj)*n(idx_CO2) &
        -k(1224)*n(idx_CNj)*n(idx_CO2) &
        -k(1225)*n(idx_CNj)*n(idx_H2O) &
        -k(1226)*n(idx_CNj)*n(idx_H2O) &
        -k(1227)*n(idx_CNj)*n(idx_H2O) &
        -k(1228)*n(idx_CNj)*n(idx_H2O) &
        -k(1229)*n(idx_CNj)*n(idx_HCN) &
        -k(1230)*n(idx_CNj)*n(idx_HCN) &
        -k(1231)*n(idx_CNj)*n(idx_HCO) &
        -k(1232)*n(idx_CNj)*n(idx_HCO) &
        -k(1233)*n(idx_CNj)*n(idx_NH2) &
        -k(1234)*n(idx_CNj)*n(idx_H2CO) &
        -k(1235)*n(idx_CNj)*n(idx_H2CO) &
        +k(1291)*n(idx_H2j)*n(idx_CN) &
        +k(1367)*n(idx_N2j)*n(idx_CN) &
        -k(3113)*n(idx_CNj)*n(idx_H2) &
        -k(3662)*n(idx_CNj)*n(idx_E)

    !NS+
    !NS+
    dn(idx_NSj) = &
        +k(220)*n(idx_Cj)*n(idx_NS) &
        +k(443)*n(idx_Hj)*n(idx_NS) &
        +k(1062)*n(idx_Sj)*n(idx_NH) &
        +k(1340)*n(idx_HSj)*n(idx_N) &
        +k(1398)*n(idx_NHj)*n(idx_S) &
        -k(1439)*n(idx_NSj)*n(idx_O) &
        +k(1558)*n(idx_SOj)*n(idx_N) &
        +k(1700)*n(idx_H2Sj)*n(idx_N) &
        -k(3674)*n(idx_NSj)*n(idx_E)

    !PH+
    !PH+
    dn(idx_PHj) = &
        +k(224)*n(idx_Cj)*n(idx_PH) &
        +k(446)*n(idx_Hj)*n(idx_PH) &
        +k(721)*n(idx_HEj)*n(idx_HPO) &
        +k(806)*n(idx_HEj)*n(idx_CH2PH) &
        -k(1513)*n(idx_PHj)*n(idx_O) &
        -k(1514)*n(idx_PHj)*n(idx_O2) &
        -k(1515)*n(idx_PHj)*n(idx_H2O) &
        -k(1516)*n(idx_PHj)*n(idx_H2O) &
        -k(1517)*n(idx_PHj)*n(idx_H2O) &
        -k(1518)*n(idx_PHj)*n(idx_HCN) &
        -k(1519)*n(idx_PHj)*n(idx_C2H2) &
        -k(1520)*n(idx_PHj)*n(idx_NH3) &
        -k(1521)*n(idx_PHj)*n(idx_NH3) &
        -k(1522)*n(idx_PHj)*n(idx_NH3) &
        -k(1523)*n(idx_PHj)*n(idx_CH4) &
        -k(1524)*n(idx_PHj)*n(idx_CH4) &
        -k(1525)*n(idx_PHj)*n(idx_C2H4) &
        -k(1526)*n(idx_PHj)*n(idx_C2H4) &
        +k(1720)*n(idx_H3j)*n(idx_P) &
        +k(1905)*n(idx_HCOj)*n(idx_P) &
        +k(2035)*n(idx_HCPj)*n(idx_O) &
        -k(3150)*n(idx_PHj)*n(idx_H2) &
        -k(3677)*n(idx_PHj)*n(idx_E)

    !PO+
    !PO+
    dn(idx_POj) = &
        +k(225)*n(idx_Cj)*n(idx_PO) &
        +k(448)*n(idx_Hj)*n(idx_PO) &
        +k(722)*n(idx_HEj)*n(idx_HPO) &
        +k(1046)*n(idx_Pj)*n(idx_O2) &
        +k(1047)*n(idx_Pj)*n(idx_OH) &
        +k(1048)*n(idx_Pj)*n(idx_H2O) &
        +k(1513)*n(idx_PHj)*n(idx_O) &
        +k(1514)*n(idx_PHj)*n(idx_O2) &
        -k(3679)*n(idx_POj)*n(idx_E)

    !SIC+
    !SIC+
    dn(idx_SICj) = &
        +k(227)*n(idx_Cj)*n(idx_SIC) &
        +k(228)*n(idx_Cj)*n(idx_SIH) &
        +k(229)*n(idx_Cj)*n(idx_SIN) &
        +k(232)*n(idx_Cj)*n(idx_SIS) &
        +k(267)*n(idx_Cj)*n(idx_SIH2) &
        +k(450)*n(idx_Hj)*n(idx_SIC) &
        +k(475)*n(idx_Hj)*n(idx_HCSI) &
        +k(714)*n(idx_HEj)*n(idx_HCSI) &
        +k(1066)*n(idx_Sj)*n(idx_SIC) &
        +k(1098)*n(idx_SIj)*n(idx_CH) &
        -k(1531)*n(idx_SICj)*n(idx_N) &
        -k(1532)*n(idx_SICj)*n(idx_O) &
        -k(1533)*n(idx_SICj)*n(idx_H2) &
        +k(1534)*n(idx_SIHj)*n(idx_C) &
        +k(1547)*n(idx_SIOj)*n(idx_C2) &
        -k(3681)*n(idx_SICj)*n(idx_E)

    !SIN+
    !SIN+
    dn(idx_SINj) = &
        +k(230)*n(idx_Cj)*n(idx_SIN) &
        +k(453)*n(idx_Hj)*n(idx_SIN) &
        +k(479)*n(idx_Hj)*n(idx_HNSI) &
        +k(720)*n(idx_HEj)*n(idx_HNSI) &
        +k(1099)*n(idx_SIj)*n(idx_NH) &
        +k(1536)*n(idx_SIHj)*n(idx_N) &
        -k(1539)*n(idx_SINj)*n(idx_O) &
        +k(2183)*n(idx_SINCj)*n(idx_O) &
        -k(3683)*n(idx_SINj)*n(idx_E)

    !SIS+
    !SIS+
    dn(idx_SISj) = &
        +k(233)*n(idx_Cj)*n(idx_SIS) &
        +k(455)*n(idx_Hj)*n(idx_SIS) &
        +k(1068)*n(idx_Sj)*n(idx_SIH) &
        +k(1069)*n(idx_Sj)*n(idx_SIS) &
        +k(1106)*n(idx_SIj)*n(idx_OCS) &
        -k(1554)*n(idx_SISj)*n(idx_H) &
        -k(1555)*n(idx_SISj)*n(idx_H2) &
        -k(3685)*n(idx_SISj)*n(idx_E)

    !SO+
    !SO+
    dn(idx_SOj) = &
        +k(237)*n(idx_Cj)*n(idx_SO) &
        +k(270)*n(idx_Cj)*n(idx_SO2) &
        +k(456)*n(idx_Hj)*n(idx_SO) &
        +k(746)*n(idx_HEj)*n(idx_SO2) &
        +k(1064)*n(idx_Sj)*n(idx_O2) &
        +k(1065)*n(idx_Sj)*n(idx_OH) &
        +k(1264)*n(idx_COj)*n(idx_SO2) &
        +k(1343)*n(idx_HSj)*n(idx_O) &
        +k(1447)*n(idx_O2j)*n(idx_S) &
        +k(1473)*n(idx_OHj)*n(idx_S) &
        -k(1556)*n(idx_SOj)*n(idx_FE) &
        -k(1557)*n(idx_SOj)*n(idx_MG) &
        -k(1558)*n(idx_SOj)*n(idx_N) &
        -k(1559)*n(idx_SOj)*n(idx_NA) &
        -k(1560)*n(idx_SOj)*n(idx_H2S) &
        -k(1561)*n(idx_SOj)*n(idx_NH3) &
        +k(1703)*n(idx_H2Sj)*n(idx_O) &
        +k(2184)*n(idx_SO2j)*n(idx_CO) &
        +k(3112)*n(idx_SO2j)*n(idx_H) &
        -k(3687)*n(idx_SOj)*n(idx_E)

    !C3+
    !C3+
    dn(idx_C3j) = &
        +k(238)*n(idx_Cj)*n(idx_C2H) &
        +k(240)*n(idx_Cj)*n(idx_C2S) &
        +k(274)*n(idx_Cj)*n(idx_C3O) &
        +k(330)*n(idx_Cj)*n(idx_HC3N) &
        +k(333)*n(idx_Cj)*n(idx_HNC3) &
        +k(461)*n(idx_Hj)*n(idx_C3) &
        +k(493)*n(idx_Hj)*n(idx_C3H) &
        +k(494)*n(idx_Hj)*n(idx_HC3) &
        +k(752)*n(idx_HEj)*n(idx_C3H) &
        +k(753)*n(idx_HEj)*n(idx_HC3) &
        +k(757)*n(idx_HEj)*n(idx_C3O) &
        +k(759)*n(idx_HEj)*n(idx_C3P) &
        +k(764)*n(idx_HEj)*n(idx_C4) &
        +k(792)*n(idx_HEj)*n(idx_C3H2) &
        +k(793)*n(idx_HEj)*n(idx_H2C3) &
        +k(801)*n(idx_HEj)*n(idx_C4S) &
        +k(802)*n(idx_HEj)*n(idx_C5) &
        +k(829)*n(idx_HEj)*n(idx_HC3N) &
        +k(833)*n(idx_HEj)*n(idx_HNC3) &
        +k(856)*n(idx_HEj)*n(idx_C3H3) &
        +k(883)*n(idx_HEj)*n(idx_C3H4) &
        +k(1126)*n(idx_C2j)*n(idx_C2) &
        +k(1128)*n(idx_C2j)*n(idx_CH) &
        +k(1163)*n(idx_CHj)*n(idx_C2) &
        +k(1174)*n(idx_CHj)*n(idx_C2H) &
        +k(1562)*n(idx_C2Hj)*n(idx_C) &
        -k(1602)*n(idx_C3j)*n(idx_H2) &
        -k(1603)*n(idx_C3j)*n(idx_C2H2) &
        +k(2188)*n(idx_C2H2j)*n(idx_C) &
        -k(3152)*n(idx_C3j)*n(idx_H) &
        -k(3696)*n(idx_C3j)*n(idx_E)

    !C2S+
    !C2S+
    dn(idx_C2Sj) = &
        +k(239)*n(idx_Cj)*n(idx_C2S) &
        +k(460)*n(idx_Hj)*n(idx_C2S) &
        +k(1070)*n(idx_Sj)*n(idx_C2H) &
        -k(3694)*n(idx_C2Sj)*n(idx_E) &
        -k(3695)*n(idx_C2Sj)*n(idx_E)

    !C2O+
    !C2O+
    dn(idx_C2Oj) = &
        +k(241)*n(idx_Cj)*n(idx_CCO) &
        +k(462)*n(idx_Hj)*n(idx_CCO) &
        +k(1222)*n(idx_CNj)*n(idx_CO2) &
        -k(3693)*n(idx_C2Oj)*n(idx_E)

    !CCP+
    !CCP+
    dn(idx_CCPj) = &
        +k(243)*n(idx_Cj)*n(idx_CCP) &
        +k(255)*n(idx_Cj)*n(idx_HCP) &
        +k(289)*n(idx_Cj)*n(idx_HCCP) &
        +k(463)*n(idx_Hj)*n(idx_CCP) &
        +k(799)*n(idx_HEj)*n(idx_C4P) &
        +k(2034)*n(idx_HCPj)*n(idx_C) &
        -k(3697)*n(idx_CCPj)*n(idx_E) &
        -k(3698)*n(idx_CCPj)*n(idx_E)

    !C2H+
    !C2H+
    dn(idx_C2Hj) = &
        +k(244)*n(idx_Cj)*n(idx_CH2) &
        +k(280)*n(idx_Cj)*n(idx_CH3) &
        +k(321)*n(idx_Cj)*n(idx_HCNC2) &
        +k(326)*n(idx_Cj)*n(idx_HC2NC) &
        +k(458)*n(idx_Hj)*n(idx_C2H) &
        +k(491)*n(idx_Hj)*n(idx_C2H2) &
        +k(536)*n(idx_Hj)*n(idx_HCNC2) &
        +k(548)*n(idx_Hj)*n(idx_HNC3) &
        +k(750)*n(idx_HEj)*n(idx_C2H2) &
        +k(790)*n(idx_HEj)*n(idx_C2H3) &
        +k(796)*n(idx_HEj)*n(idx_C4H) &
        +k(822)*n(idx_HEj)*n(idx_HC2NC) &
        +k(827)*n(idx_HEj)*n(idx_HC3N) &
        +k(851)*n(idx_HEj)*n(idx_C2H4) &
        +k(860)*n(idx_HEj)*n(idx_C4H2) &
        +k(906)*n(idx_HEj)*n(idx_HC5N) &
        +k(972)*n(idx_Nj)*n(idx_C2H) &
        +k(1019)*n(idx_Oj)*n(idx_C2H) &
        +k(1129)*n(idx_C2j)*n(idx_H2) &
        +k(1130)*n(idx_C2j)*n(idx_NH) &
        +k(1136)*n(idx_C2j)*n(idx_H2O) &
        +k(1140)*n(idx_C2j)*n(idx_HCO) &
        +k(1145)*n(idx_C2j)*n(idx_CH4) &
        +k(1175)*n(idx_CHj)*n(idx_CH2) &
        +k(1220)*n(idx_CNj)*n(idx_C2H) &
        +k(1251)*n(idx_COj)*n(idx_C2H) &
        +k(1288)*n(idx_H2j)*n(idx_C2) &
        +k(1305)*n(idx_H2j)*n(idx_C2H) &
        +k(1374)*n(idx_N2j)*n(idx_C2H) &
        +k(1399)*n(idx_NHj)*n(idx_C2) &
        +k(1476)*n(idx_OHj)*n(idx_C2) &
        +k(1491)*n(idx_OHj)*n(idx_C2H) &
        -k(1562)*n(idx_C2Hj)*n(idx_C) &
        -k(1563)*n(idx_C2Hj)*n(idx_N) &
        -k(1564)*n(idx_C2Hj)*n(idx_N) &
        -k(1565)*n(idx_C2Hj)*n(idx_O) &
        -k(1566)*n(idx_C2Hj)*n(idx_S) &
        -k(1567)*n(idx_C2Hj)*n(idx_CH) &
        -k(1568)*n(idx_C2Hj)*n(idx_CH) &
        -k(1569)*n(idx_C2Hj)*n(idx_CN) &
        -k(1570)*n(idx_C2Hj)*n(idx_H2) &
        -k(1571)*n(idx_C2Hj)*n(idx_NO) &
        -k(1572)*n(idx_C2Hj)*n(idx_CH2) &
        -k(1573)*n(idx_C2Hj)*n(idx_CH2) &
        -k(1574)*n(idx_C2Hj)*n(idx_CH2) &
        -k(1575)*n(idx_C2Hj)*n(idx_CO2) &
        -k(1576)*n(idx_C2Hj)*n(idx_H2O) &
        -k(1577)*n(idx_C2Hj)*n(idx_HCN) &
        -k(1578)*n(idx_C2Hj)*n(idx_HCN) &
        -k(1579)*n(idx_C2Hj)*n(idx_HCN) &
        -k(1580)*n(idx_C2Hj)*n(idx_HCO) &
        -k(1581)*n(idx_C2Hj)*n(idx_HNC) &
        -k(1582)*n(idx_C2Hj)*n(idx_NH2) &
        -k(1583)*n(idx_C2Hj)*n(idx_NH2) &
        -k(1584)*n(idx_C2Hj)*n(idx_C2H2) &
        -k(1585)*n(idx_C2Hj)*n(idx_H2CO) &
        -k(1586)*n(idx_C2Hj)*n(idx_NH3) &
        -k(1587)*n(idx_C2Hj)*n(idx_NH3) &
        -k(1588)*n(idx_C2Hj)*n(idx_CH4) &
        -k(1589)*n(idx_C2Hj)*n(idx_CH4) &
        -k(1590)*n(idx_C2Hj)*n(idx_CH4) &
        -k(1591)*n(idx_C2Hj)*n(idx_CH4) &
        +k(1604)*n(idx_CH2j)*n(idx_C) &
        +k(1667)*n(idx_H2Oj)*n(idx_C2) &
        +k(1676)*n(idx_H2Oj)*n(idx_C2H) &
        +k(1723)*n(idx_H3j)*n(idx_C2) &
        +k(1878)*n(idx_HCNj)*n(idx_C2) &
        +k(1908)*n(idx_HCOj)*n(idx_C2) &
        +k(2043)*n(idx_HNCj)*n(idx_C2) &
        +k(2062)*n(idx_HNOj)*n(idx_C2) &
        +k(2088)*n(idx_N2Hj)*n(idx_C2) &
        +k(2117)*n(idx_NH2j)*n(idx_C2) &
        +k(2152)*n(idx_O2Hj)*n(idx_C2) &
        +k(2311)*n(idx_CH3j)*n(idx_C) &
        +k(2406)*n(idx_H2COj)*n(idx_C2) &
        +k(2916)*n(idx_CH5j)*n(idx_C2) &
        +k(3115)*n(idx_C2N2j)*n(idx_H) &
        -k(3688)*n(idx_C2Hj)*n(idx_E) &
        -k(3689)*n(idx_C2Hj)*n(idx_E) &
        -k(3690)*n(idx_C2Hj)*n(idx_E) &
        +k(4286)*n(idx_C2H) &
        -k(4418)*n(idx_C2Hj)

    !HOC+
    !HOC+
    dn(idx_HOCj) = &
        +k(248)*n(idx_Cj)*n(idx_H2O) &
        +k(1727)*n(idx_H3j)*n(idx_CO) &
        -k(2082)*n(idx_HOCj)*n(idx_CO) &
        -k(2083)*n(idx_HOCj)*n(idx_H2) &
        -k(2084)*n(idx_HOCj)*n(idx_N2) &
        +k(2197)*n(idx_C2H2j)*n(idx_O) &
        +k(2318)*n(idx_CH3j)*n(idx_O) &
        +k(3111)*n(idx_COj)*n(idx_H2) &
        -k(3730)*n(idx_HOCj)*n(idx_E)

    !C2N+
    !C2N+
    dn(idx_C2Nj) = &
        +k(251)*n(idx_Cj)*n(idx_HCN) &
        +k(258)*n(idx_Cj)*n(idx_HNC) &
        +k(324)*n(idx_Cj)*n(idx_HCNC2) &
        +k(459)*n(idx_Hj)*n(idx_C2N) &
        +k(818)*n(idx_HEj)*n(idx_HCNC2) &
        +k(828)*n(idx_HEj)*n(idx_HC3N) &
        +k(1131)*n(idx_C2j)*n(idx_NH) &
        +k(1165)*n(idx_CHj)*n(idx_CN) &
        +k(1182)*n(idx_CHj)*n(idx_HCN) &
        +k(1400)*n(idx_NHj)*n(idx_C2) &
        +k(1564)*n(idx_C2Hj)*n(idx_N) &
        -k(1592)*n(idx_C2Nj)*n(idx_H2) &
        -k(1593)*n(idx_C2Nj)*n(idx_CH4) &
        -k(1594)*n(idx_C2Nj)*n(idx_CH4) &
        -k(1595)*n(idx_C2Nj)*n(idx_CH4) &
        -k(1596)*n(idx_C2Nj)*n(idx_NH3) &
        -k(1597)*n(idx_C2Nj)*n(idx_H2O) &
        -k(1598)*n(idx_C2Nj)*n(idx_H2O) &
        -k(1599)*n(idx_C2Nj)*n(idx_C2H2) &
        -k(1600)*n(idx_C2Nj)*n(idx_C2H2) &
        -k(1601)*n(idx_C2Nj)*n(idx_H2S) &
        +k(2193)*n(idx_C2H2j)*n(idx_N) &
        -k(3691)*n(idx_C2Nj)*n(idx_E) &
        -k(3692)*n(idx_C2Nj)*n(idx_E)

    !CNC+
    !CNC+
    dn(idx_CNCj) = &
        +k(252)*n(idx_Cj)*n(idx_HCN) &
        +k(327)*n(idx_Cj)*n(idx_HC2NC) &
        +k(824)*n(idx_HEj)*n(idx_HC2NC) &
        +k(1166)*n(idx_CHj)*n(idx_CN) &
        -k(1637)*n(idx_CNCj)*n(idx_NH3) &
        -k(1638)*n(idx_CNCj)*n(idx_H2O) &
        -k(1639)*n(idx_CNCj)*n(idx_C2H2) &
        -k(1640)*n(idx_CNCj)*n(idx_C2H2) &
        -k(3704)*n(idx_CNCj)*n(idx_E)

    !HCP+
    !HCP+
    dn(idx_HCPj) = &
        +k(256)*n(idx_Cj)*n(idx_HCP) &
        +k(473)*n(idx_Hj)*n(idx_HCP) &
        +k(1273)*n(idx_CPj)*n(idx_H2) &
        +k(1728)*n(idx_H3j)*n(idx_CP) &
        +k(1910)*n(idx_HCOj)*n(idx_CP) &
        -k(2034)*n(idx_HCPj)*n(idx_C) &
        -k(2035)*n(idx_HCPj)*n(idx_O) &
        -k(2036)*n(idx_HCPj)*n(idx_H2) &
        +k(2432)*n(idx_H3Oj)*n(idx_CP) &
        -k(3721)*n(idx_HCPj)*n(idx_E) &
        -k(3722)*n(idx_HCPj)*n(idx_E)

    !SIC2+
    !SIC2+
    dn(idx_SIC2j) = &
        +k(257)*n(idx_Cj)*n(idx_HCSI) &
        +k(266)*n(idx_Cj)*n(idx_SIC2) &
        +k(296)*n(idx_Cj)*n(idx_SICH2) &
        +k(487)*n(idx_Hj)*n(idx_SIC2) &
        +k(509)*n(idx_Hj)*n(idx_SIC2H) &
        +k(781)*n(idx_HEj)*n(idx_SIC2H) &
        +k(782)*n(idx_HEj)*n(idx_SIC3) &
        -k(2177)*n(idx_SIC2j)*n(idx_H2) &
        +k(2201)*n(idx_C2H2j)*n(idx_SI) &
        +k(2305)*n(idx_CH2SIj)*n(idx_C) &
        -k(3756)*n(idx_SIC2j)*n(idx_E) &
        -k(3757)*n(idx_SIC2j)*n(idx_E)

    !SINC+
    !SINC+
    dn(idx_SINCj) = &
        +k(259)*n(idx_Cj)*n(idx_HNSI) &
        +k(490)*n(idx_Hj)*n(idx_SINC) &
        +k(1104)*n(idx_SIj)*n(idx_HCN) &
        +k(1105)*n(idx_SIj)*n(idx_HNC) &
        -k(2183)*n(idx_SINCj)*n(idx_O) &
        +k(2391)*n(idx_HCNHj)*n(idx_SI) &
        +k(2426)*n(idx_H2NCj)*n(idx_SI) &
        +k(2541)*n(idx_SINH2j)*n(idx_C) &
        -k(3761)*n(idx_SINCj)*n(idx_E)

    !HPO+
    !HPO+
    dn(idx_HPOj) = &
        +k(260)*n(idx_Cj)*n(idx_HPO) &
        +k(481)*n(idx_Hj)*n(idx_HPO) &
        +k(1049)*n(idx_Pj)*n(idx_H2O) &
        +k(1515)*n(idx_PHj)*n(idx_H2O) &
        +k(1743)*n(idx_H3j)*n(idx_PO) &
        +k(1921)*n(idx_HCOj)*n(idx_PO) &
        -k(2085)*n(idx_HPOj)*n(idx_H2O) &
        +k(2429)*n(idx_H3Oj)*n(idx_P) &
        -k(3733)*n(idx_HPOj)*n(idx_E) &
        -k(3734)*n(idx_HPOj)*n(idx_E)

    !HCN+
    !HCN+
    dn(idx_HCNj) = &
        +k(262)*n(idx_Cj)*n(idx_NH2) &
        +k(290)*n(idx_Cj)*n(idx_NH3) &
        +k(322)*n(idx_Cj)*n(idx_HCNC2) &
        +k(367)*n(idx_Cj)*n(idx_NH2CHO) &
        +k(469)*n(idx_Hj)*n(idx_HCN) &
        +k(535)*n(idx_Hj)*n(idx_HCNC2) &
        +k(810)*n(idx_HEj)*n(idx_CH3N) &
        +k(820)*n(idx_HEj)*n(idx_HCNC2) &
        +k(979)*n(idx_Nj)*n(idx_HCN) &
        +k(992)*n(idx_Nj)*n(idx_CH4) &
        +k(1188)*n(idx_CHj)*n(idx_NH2) &
        +k(1212)*n(idx_CNj)*n(idx_H2) &
        +k(1225)*n(idx_CNj)*n(idx_H2O) &
        +k(1229)*n(idx_CNj)*n(idx_HCN) &
        +k(1231)*n(idx_CNj)*n(idx_HCO) &
        +k(1260)*n(idx_COj)*n(idx_HCN) &
        +k(1292)*n(idx_H2j)*n(idx_CN) &
        +k(1317)*n(idx_H2j)*n(idx_HCN) &
        +k(1382)*n(idx_N2j)*n(idx_HCN) &
        +k(1401)*n(idx_NHj)*n(idx_C2) &
        +k(1403)*n(idx_NHj)*n(idx_CN) &
        +k(1479)*n(idx_OHj)*n(idx_CN) &
        +k(1605)*n(idx_CH2j)*n(idx_N) &
        +k(1725)*n(idx_H3j)*n(idx_CN) &
        -k(1873)*n(idx_HCNj)*n(idx_C) &
        -k(1874)*n(idx_HCNj)*n(idx_H) &
        -k(1875)*n(idx_HCNj)*n(idx_O) &
        -k(1876)*n(idx_HCNj)*n(idx_S) &
        -k(1877)*n(idx_HCNj)*n(idx_S) &
        -k(1878)*n(idx_HCNj)*n(idx_C2) &
        -k(1879)*n(idx_HCNj)*n(idx_CH) &
        -k(1880)*n(idx_HCNj)*n(idx_CO) &
        -k(1881)*n(idx_HCNj)*n(idx_H2) &
        -k(1882)*n(idx_HCNj)*n(idx_NH) &
        -k(1883)*n(idx_HCNj)*n(idx_NO) &
        -k(1884)*n(idx_HCNj)*n(idx_O2) &
        -k(1885)*n(idx_HCNj)*n(idx_OH) &
        -k(1886)*n(idx_HCNj)*n(idx_C2H) &
        -k(1887)*n(idx_HCNj)*n(idx_CH2) &
        -k(1888)*n(idx_HCNj)*n(idx_CO2) &
        -k(1889)*n(idx_HCNj)*n(idx_H2O) &
        -k(1890)*n(idx_HCNj)*n(idx_H2O) &
        -k(1891)*n(idx_HCNj)*n(idx_HCN) &
        -k(1892)*n(idx_HCNj)*n(idx_HCO) &
        -k(1893)*n(idx_HCNj)*n(idx_HCO) &
        -k(1894)*n(idx_HCNj)*n(idx_HNC) &
        -k(1895)*n(idx_HCNj)*n(idx_NH2) &
        -k(1896)*n(idx_HCNj)*n(idx_H2CO) &
        -k(1897)*n(idx_HCNj)*n(idx_NH3) &
        -k(1898)*n(idx_HCNj)*n(idx_NH3) &
        -k(1899)*n(idx_HCNj)*n(idx_CH4) &
        -k(1900)*n(idx_HCNj)*n(idx_CH4) &
        +k(2154)*n(idx_O2Hj)*n(idx_CN) &
        +k(2315)*n(idx_CH3j)*n(idx_N) &
        -k(3717)*n(idx_HCNj)*n(idx_E)

    !CHSI+
    !CHSI+
    dn(idx_CHSIj) = &
        +k(268)*n(idx_Cj)*n(idx_SIH2) &
        +k(299)*n(idx_Cj)*n(idx_SIH3) &
        +k(476)*n(idx_Hj)*n(idx_HCSI) &
        +k(512)*n(idx_Hj)*n(idx_SICH2) &
        +k(784)*n(idx_HEj)*n(idx_SICH2) &
        +k(1102)*n(idx_SIj)*n(idx_CH2) &
        +k(1110)*n(idx_SIj)*n(idx_CH3) &
        +k(1488)*n(idx_OHj)*n(idx_SIC) &
        +k(1533)*n(idx_SICj)*n(idx_H2) &
        -k(1636)*n(idx_CHSIj)*n(idx_H2) &
        +k(1745)*n(idx_H3j)*n(idx_SIC) &
        +k(1923)*n(idx_HCOj)*n(idx_SIC) &
        +k(2178)*n(idx_SIH2j)*n(idx_C) &
        +k(2324)*n(idx_CH3j)*n(idx_SI) &
        +k(2436)*n(idx_H3Oj)*n(idx_SIC) &
        -k(3702)*n(idx_CHSIj)*n(idx_E) &
        -k(3703)*n(idx_CHSIj)*n(idx_E)

    !SIH2+
    !SIH2+
    dn(idx_SIH2j) = &
        +k(269)*n(idx_Cj)*n(idx_SIH2) &
        +k(489)*n(idx_Hj)*n(idx_SIH2) &
        +k(514)*n(idx_Hj)*n(idx_SIH3) &
        +k(786)*n(idx_HEj)*n(idx_SIH3) &
        +k(847)*n(idx_HEj)*n(idx_SIH4) &
        +k(1489)*n(idx_OHj)*n(idx_SIH) &
        +k(1746)*n(idx_H3j)*n(idx_SIH) &
        +k(1924)*n(idx_HCOj)*n(idx_SIH) &
        -k(2178)*n(idx_SIH2j)*n(idx_C) &
        -k(2179)*n(idx_SIH2j)*n(idx_N) &
        -k(2180)*n(idx_SIH2j)*n(idx_O) &
        -k(2181)*n(idx_SIH2j)*n(idx_S) &
        -k(2182)*n(idx_SIH2j)*n(idx_O2) &
        +k(2437)*n(idx_H3Oj)*n(idx_SIH) &
        +k(3144)*n(idx_SIj)*n(idx_H2) &
        -k(3758)*n(idx_SIH2j)*n(idx_E) &
        -k(3759)*n(idx_SIH2j)*n(idx_E) &
        -k(3760)*n(idx_SIH2j)*n(idx_E)

    !C3H+
    !C3H+
    dn(idx_C3Hj) = &
        +k(271)*n(idx_Cj)*n(idx_C2H2) &
        +k(304)*n(idx_Cj)*n(idx_C2H3) &
        +k(325)*n(idx_Cj)*n(idx_HC2NC) &
        +k(331)*n(idx_Cj)*n(idx_HC3N) &
        +k(346)*n(idx_Cj)*n(idx_C2H4) &
        +k(356)*n(idx_Cj)*n(idx_C4H2) &
        +k(495)*n(idx_Hj)*n(idx_C3H) &
        +k(496)*n(idx_Hj)*n(idx_HC3) &
        +k(520)*n(idx_Hj)*n(idx_C3H2) &
        +k(521)*n(idx_Hj)*n(idx_H2C3) &
        +k(545)*n(idx_Hj)*n(idx_HNC3) &
        +k(794)*n(idx_HEj)*n(idx_C3H2) &
        +k(795)*n(idx_HEj)*n(idx_H2C3) &
        +k(830)*n(idx_HEj)*n(idx_HC3N) &
        +k(857)*n(idx_HEj)*n(idx_C3H3) &
        +k(863)*n(idx_HEj)*n(idx_C5H) &
        +k(884)*n(idx_HEj)*n(idx_C3H4) &
        +k(894)*n(idx_HEj)*n(idx_C5H2) &
        +k(1135)*n(idx_C2j)*n(idx_CH2) &
        +k(1138)*n(idx_C2j)*n(idx_HCN) &
        +k(1147)*n(idx_C2j)*n(idx_CH4) &
        +k(1568)*n(idx_C2Hj)*n(idx_CH) &
        +k(1599)*n(idx_C2Nj)*n(idx_C2H2) &
        +k(1602)*n(idx_C3j)*n(idx_H2) &
        +k(1608)*n(idx_CH2j)*n(idx_C2) &
        +k(1639)*n(idx_CNCj)*n(idx_C2H2) &
        +k(1754)*n(idx_H3j)*n(idx_C3) &
        +k(1930)*n(idx_HCOj)*n(idx_C3) &
        +k(2189)*n(idx_C2H2j)*n(idx_C) &
        -k(2272)*n(idx_C3Hj)*n(idx_SI) &
        -k(2273)*n(idx_C3Hj)*n(idx_H2) &
        -k(2274)*n(idx_C3Hj)*n(idx_NO) &
        -k(2275)*n(idx_C3Hj)*n(idx_NO) &
        -k(2276)*n(idx_C3Hj)*n(idx_NO) &
        -k(2277)*n(idx_C3Hj)*n(idx_O2) &
        -k(2278)*n(idx_C3Hj)*n(idx_O2) &
        -k(2279)*n(idx_C3Hj)*n(idx_O2) &
        -k(2280)*n(idx_C3Hj)*n(idx_CO2) &
        -k(2281)*n(idx_C3Hj)*n(idx_H2O) &
        -k(2282)*n(idx_C3Hj)*n(idx_H2O) &
        -k(2283)*n(idx_C3Hj)*n(idx_H2O) &
        -k(2284)*n(idx_C3Hj)*n(idx_H2S) &
        -k(2285)*n(idx_C3Hj)*n(idx_H2S) &
        -k(2286)*n(idx_C3Hj)*n(idx_H2S) &
        -k(2287)*n(idx_C3Hj)*n(idx_OCS) &
        -k(2288)*n(idx_C3Hj)*n(idx_OCS) &
        -k(2289)*n(idx_C3Hj)*n(idx_OCS) &
        -k(2290)*n(idx_C3Hj)*n(idx_C2H2) &
        -k(2291)*n(idx_C3Hj)*n(idx_NH3) &
        -k(2292)*n(idx_C3Hj)*n(idx_NH3) &
        -k(2293)*n(idx_C3Hj)*n(idx_NH3) &
        -k(2294)*n(idx_C3Hj)*n(idx_NH3) &
        -k(2295)*n(idx_C3Hj)*n(idx_CH4) &
        -k(2296)*n(idx_C3Hj)*n(idx_CH4) &
        -k(2297)*n(idx_C3Hj)*n(idx_C2H4) &
        -k(2298)*n(idx_C3Hj)*n(idx_C2H4) &
        -k(2299)*n(idx_C3Hj)*n(idx_C2H4) &
        -k(2300)*n(idx_C3Hj)*n(idx_C4H2) &
        -k(2301)*n(idx_C3Hj)*n(idx_C4H2) &
        +k(2326)*n(idx_CH3j)*n(idx_C2) &
        +k(2348)*n(idx_CH3j)*n(idx_C3H) &
        +k(2349)*n(idx_CH3j)*n(idx_HC3) &
        +k(2440)*n(idx_H3Oj)*n(idx_C3) &
        +k(2543)*n(idx_C2H3j)*n(idx_C) &
        +k(2612)*n(idx_C3H2j)*n(idx_H) &
        +k(2613)*n(idx_H2C3j)*n(idx_H) &
        +k(2710)*n(idx_C4Nj)*n(idx_H2) &
        +k(3152)*n(idx_C3j)*n(idx_H) &
        -k(3162)*n(idx_C3Hj)*n(idx_H) &
        -k(3163)*n(idx_C3Hj)*n(idx_H) &
        -k(3164)*n(idx_C3Hj)*n(idx_CO) &
        -k(3165)*n(idx_C3Hj)*n(idx_H2) &
        -k(3166)*n(idx_C3Hj)*n(idx_H2) &
        -k(3167)*n(idx_C3Hj)*n(idx_C2H2) &
        -k(3776)*n(idx_C3Hj)*n(idx_E) &
        -k(3777)*n(idx_C3Hj)*n(idx_E)

    !C4+
    !C4+
    dn(idx_C4j) = &
        +k(272)*n(idx_Cj)*n(idx_C3H) &
        +k(273)*n(idx_Cj)*n(idx_HC3) &
        +k(276)*n(idx_Cj)*n(idx_C3O) &
        +k(277)*n(idx_Cj)*n(idx_C3P) &
        +k(279)*n(idx_Cj)*n(idx_C3S) &
        +k(308)*n(idx_Cj)*n(idx_C3H2) &
        +k(309)*n(idx_Cj)*n(idx_H2C3) &
        +k(499)*n(idx_Hj)*n(idx_C4) &
        +k(524)*n(idx_Hj)*n(idx_C4H) &
        +k(797)*n(idx_HEj)*n(idx_C4H) &
        +k(803)*n(idx_HEj)*n(idx_C5) &
        +k(861)*n(idx_HEj)*n(idx_C4H2) &
        +k(865)*n(idx_HEj)*n(idx_C5N) &
        +k(866)*n(idx_HEj)*n(idx_C6) &
        -k(2303)*n(idx_C4j)*n(idx_H2) &
        +k(3130)*n(idx_Cj)*n(idx_C3) &
        -k(3783)*n(idx_C4j)*n(idx_E) &
        -k(3784)*n(idx_C4j)*n(idx_E)

    !C3O+
    !C3O+
    dn(idx_C3Oj) = &
        +k(275)*n(idx_Cj)*n(idx_C3O) &
        +k(497)*n(idx_Hj)*n(idx_C3O) &
        -k(3779)*n(idx_C3Oj)*n(idx_E)

    !C3S+
    !C3S+
    dn(idx_C3Sj) = &
        +k(278)*n(idx_Cj)*n(idx_C3S) &
        +k(498)*n(idx_Hj)*n(idx_C3S) &
        +k(1079)*n(idx_Sj)*n(idx_C3H) &
        +k(1080)*n(idx_Sj)*n(idx_HC3) &
        -k(3780)*n(idx_C3Sj)*n(idx_E) &
        -k(3781)*n(idx_C3Sj)*n(idx_E) &
        -k(3782)*n(idx_C3Sj)*n(idx_E)

    !H2CO+
    !H2CO+
    dn(idx_H2COj) = &
        +k(285)*n(idx_Cj)*n(idx_H2CO) &
        +k(366)*n(idx_Cj)*n(idx_NH2CHO) &
        +k(502)*n(idx_Hj)*n(idx_H2CO) &
        +k(871)*n(idx_HEj)*n(idx_NH2CHO) &
        +k(988)*n(idx_Nj)*n(idx_H2CO) &
        +k(1000)*n(idx_Nj)*n(idx_CH3OH) &
        +k(1038)*n(idx_Oj)*n(idx_H2CO) &
        +k(1042)*n(idx_Oj)*n(idx_CH3OH) &
        +k(1178)*n(idx_CHj)*n(idx_H2O) &
        +k(1235)*n(idx_CNj)*n(idx_H2CO) &
        +k(1266)*n(idx_COj)*n(idx_H2CO) &
        +k(1324)*n(idx_H2j)*n(idx_H2CO) &
        +k(1389)*n(idx_N2j)*n(idx_H2CO) &
        +k(1427)*n(idx_NHj)*n(idx_HCO) &
        +k(1431)*n(idx_NHj)*n(idx_H2CO) &
        +k(1456)*n(idx_O2j)*n(idx_CH2) &
        +k(1463)*n(idx_O2j)*n(idx_H2CO) &
        +k(1503)*n(idx_OHj)*n(idx_HCO) &
        +k(1507)*n(idx_OHj)*n(idx_H2CO) &
        +k(1615)*n(idx_CH2j)*n(idx_OH) &
        +k(1619)*n(idx_CH2j)*n(idx_CO2) &
        +k(1686)*n(idx_H2Oj)*n(idx_HCO) &
        +k(1691)*n(idx_H2Oj)*n(idx_H2CO) &
        +k(1762)*n(idx_H3j)*n(idx_HCO) &
        +k(1893)*n(idx_HCNj)*n(idx_HCO) &
        +k(1937)*n(idx_HCOj)*n(idx_HCO) &
        +k(2055)*n(idx_HNCj)*n(idx_HCO) &
        +k(2073)*n(idx_HNOj)*n(idx_HCO) &
        +k(2098)*n(idx_N2Hj)*n(idx_HCO) &
        +k(2166)*n(idx_O2Hj)*n(idx_HCO) &
        +k(2228)*n(idx_C2H2j)*n(idx_H2CO) &
        +k(2320)*n(idx_CH3j)*n(idx_O) &
        +k(2334)*n(idx_CH3j)*n(idx_OH) &
        -k(2400)*n(idx_H2COj)*n(idx_FE) &
        -k(2401)*n(idx_H2COj)*n(idx_MG) &
        -k(2402)*n(idx_H2COj)*n(idx_NA) &
        -k(2403)*n(idx_H2COj)*n(idx_S) &
        -k(2404)*n(idx_H2COj)*n(idx_S) &
        -k(2405)*n(idx_H2COj)*n(idx_SI) &
        -k(2406)*n(idx_H2COj)*n(idx_C2) &
        -k(2407)*n(idx_H2COj)*n(idx_CH) &
        -k(2408)*n(idx_H2COj)*n(idx_CH) &
        -k(2409)*n(idx_H2COj)*n(idx_NH) &
        -k(2410)*n(idx_H2COj)*n(idx_NO) &
        -k(2411)*n(idx_H2COj)*n(idx_O2) &
        -k(2412)*n(idx_H2COj)*n(idx_C2H) &
        -k(2413)*n(idx_H2COj)*n(idx_CH2) &
        -k(2414)*n(idx_H2COj)*n(idx_CH2) &
        -k(2415)*n(idx_H2COj)*n(idx_H2O) &
        -k(2416)*n(idx_H2COj)*n(idx_HCN) &
        -k(2417)*n(idx_H2COj)*n(idx_HCO) &
        -k(2418)*n(idx_H2COj)*n(idx_HCO) &
        -k(2419)*n(idx_H2COj)*n(idx_HNC) &
        -k(2420)*n(idx_H2COj)*n(idx_NH2) &
        -k(2421)*n(idx_H2COj)*n(idx_H2CO) &
        -k(2422)*n(idx_H2COj)*n(idx_NH3) &
        -k(2423)*n(idx_H2COj)*n(idx_NH3) &
        -k(2424)*n(idx_H2COj)*n(idx_CH4) &
        -k(2425)*n(idx_H2COj)*n(idx_CH4) &
        +k(2731)*n(idx_CH4j)*n(idx_H2CO) &
        +k(2925)*n(idx_CH5j)*n(idx_HCO) &
        -k(3796)*n(idx_H2COj)*n(idx_E) &
        -k(3797)*n(idx_H2COj)*n(idx_E) &
        -k(4208)*n(idx_H2COj)*n(idx_E) &
        +k(4325)*n(idx_H2CO)

    !H2SIO+
    !H2SIO+
    dn(idx_H2SIOj) = &
        +k(287)*n(idx_Cj)*n(idx_H2SIO) &
        +k(506)*n(idx_Hj)*n(idx_H2SIO) &
        +k(2538)*n(idx_SIH3j)*n(idx_O) &
        -k(3808)*n(idx_H2SIOj)*n(idx_E) &
        -k(3809)*n(idx_H2SIOj)*n(idx_E)

    !HCNH+
    !HCNH+
    dn(idx_HCNHj) = &
        +k(291)*n(idx_Cj)*n(idx_NH3) &
        +k(532)*n(idx_Hj)*n(idx_CH3N) &
        +k(811)*n(idx_HEj)*n(idx_CH3N) &
        +k(903)*n(idx_HEj)*n(idx_CH5N) &
        +k(995)*n(idx_Nj)*n(idx_CH4) &
        +k(996)*n(idx_Nj)*n(idx_CH4) &
        +k(1184)*n(idx_CHj)*n(idx_HCN) &
        +k(1187)*n(idx_CHj)*n(idx_HNC) &
        +k(1351)*n(idx_HSj)*n(idx_HCN) &
        +k(1352)*n(idx_HSj)*n(idx_HNC) &
        +k(1426)*n(idx_NHj)*n(idx_HCN) &
        +k(1428)*n(idx_NHj)*n(idx_HNC) &
        +k(1500)*n(idx_OHj)*n(idx_HCN) &
        +k(1504)*n(idx_OHj)*n(idx_HNC) &
        +k(1518)*n(idx_PHj)*n(idx_HCN) &
        +k(1578)*n(idx_C2Hj)*n(idx_HCN) &
        +k(1581)*n(idx_C2Hj)*n(idx_HNC) &
        +k(1592)*n(idx_C2Nj)*n(idx_H2) &
        +k(1595)*n(idx_C2Nj)*n(idx_CH4) &
        +k(1596)*n(idx_C2Nj)*n(idx_NH3) &
        +k(1598)*n(idx_C2Nj)*n(idx_H2O) &
        +k(1600)*n(idx_C2Nj)*n(idx_C2H2) &
        +k(1611)*n(idx_CH2j)*n(idx_NH) &
        +k(1626)*n(idx_CH2j)*n(idx_NH2) &
        +k(1637)*n(idx_CNCj)*n(idx_NH3) &
        +k(1640)*n(idx_CNCj)*n(idx_C2H2) &
        +k(1684)*n(idx_H2Oj)*n(idx_HCN) &
        +k(1688)*n(idx_H2Oj)*n(idx_HNC) &
        +k(1761)*n(idx_H3j)*n(idx_HCN) &
        +k(1766)*n(idx_H3j)*n(idx_HNC) &
        +k(1881)*n(idx_HCNj)*n(idx_H2) &
        +k(1891)*n(idx_HCNj)*n(idx_HCN) &
        +k(1892)*n(idx_HCNj)*n(idx_HCO) &
        +k(1894)*n(idx_HCNj)*n(idx_HNC) &
        +k(1897)*n(idx_HCNj)*n(idx_NH3) &
        +k(1899)*n(idx_HCNj)*n(idx_CH4) &
        +k(1936)*n(idx_HCOj)*n(idx_HCN) &
        +k(1940)*n(idx_HCOj)*n(idx_HNC) &
        +k(2045)*n(idx_HNCj)*n(idx_H2) &
        +k(2053)*n(idx_HNCj)*n(idx_HCN) &
        +k(2054)*n(idx_HNCj)*n(idx_HCO) &
        +k(2072)*n(idx_HNOj)*n(idx_HCN) &
        +k(2074)*n(idx_HNOj)*n(idx_HNC) &
        +k(2097)*n(idx_N2Hj)*n(idx_HCN) &
        +k(2099)*n(idx_N2Hj)*n(idx_HNC) &
        +k(2120)*n(idx_NH2j)*n(idx_CN) &
        +k(2138)*n(idx_NH2j)*n(idx_HCN) &
        +k(2140)*n(idx_NH2j)*n(idx_HNC) &
        +k(2165)*n(idx_O2Hj)*n(idx_HCN) &
        +k(2167)*n(idx_O2Hj)*n(idx_HNC) &
        +k(2218)*n(idx_C2H2j)*n(idx_HNC) &
        +k(2331)*n(idx_CH3j)*n(idx_NH) &
        -k(2389)*n(idx_HCNHj)*n(idx_NA) &
        -k(2390)*n(idx_HCNHj)*n(idx_NA) &
        -k(2391)*n(idx_HCNHj)*n(idx_SI) &
        -k(2392)*n(idx_HCNHj)*n(idx_CH) &
        -k(2393)*n(idx_HCNHj)*n(idx_CH2) &
        -k(2394)*n(idx_HCNHj)*n(idx_CH2) &
        -k(2395)*n(idx_HCNHj)*n(idx_NH2) &
        -k(2396)*n(idx_HCNHj)*n(idx_NH2) &
        -k(2397)*n(idx_HCNHj)*n(idx_H2CO) &
        -k(2398)*n(idx_HCNHj)*n(idx_NH3) &
        -k(2399)*n(idx_HCNHj)*n(idx_NH3) &
        +k(2416)*n(idx_H2COj)*n(idx_HCN) &
        +k(2419)*n(idx_H2COj)*n(idx_HNC) &
        +k(2445)*n(idx_H3Oj)*n(idx_HCN) &
        +k(2448)*n(idx_H3Oj)*n(idx_HNC) &
        +k(2495)*n(idx_H3Sj)*n(idx_HCN) &
        +k(2496)*n(idx_H3Sj)*n(idx_HNC) &
        +k(2558)*n(idx_C2H3j)*n(idx_HCN) &
        +k(2559)*n(idx_C2H3j)*n(idx_HNC) &
        +k(2743)*n(idx_H3COj)*n(idx_HNC) &
        +k(2746)*n(idx_NH4j)*n(idx_C) &
        +k(2924)*n(idx_CH5j)*n(idx_HCN) &
        +k(2926)*n(idx_CH5j)*n(idx_HNC) &
        +k(2948)*n(idx_C2H5j)*n(idx_HCN) &
        +k(2949)*n(idx_C2H5j)*n(idx_HNC) &
        -k(3178)*n(idx_HCNHj)*n(idx_C2H2) &
        -k(3793)*n(idx_HCNHj)*n(idx_E) &
        -k(3794)*n(idx_HCNHj)*n(idx_E) &
        -k(3795)*n(idx_HCNHj)*n(idx_E)

    !SIC2H+
    !SIC2H+
    dn(idx_SIC2Hj) = &
        +k(293)*n(idx_Cj)*n(idx_SIC2H) &
        +k(298)*n(idx_Cj)*n(idx_SICH2) &
        +k(339)*n(idx_Cj)*n(idx_SICH3) &
        +k(510)*n(idx_Hj)*n(idx_SIC2H) &
        +k(551)*n(idx_Hj)*n(idx_SIC2H2) &
        +k(840)*n(idx_HEj)*n(idx_SIC2H2) &
        +k(1107)*n(idx_SIj)*n(idx_C2H2) &
        +k(1776)*n(idx_H3j)*n(idx_SIC2) &
        +k(1949)*n(idx_HCOj)*n(idx_SIC2) &
        +k(2177)*n(idx_SIC2j)*n(idx_H2) &
        +k(2202)*n(idx_C2H2j)*n(idx_SI) &
        +k(2306)*n(idx_CH2SIj)*n(idx_C) &
        +k(2452)*n(idx_H3Oj)*n(idx_SIC2) &
        -k(2532)*n(idx_SIC2Hj)*n(idx_C) &
        -k(2533)*n(idx_SIC2Hj)*n(idx_C2H2) &
        +k(2551)*n(idx_C2H3j)*n(idx_SI) &
        -k(3181)*n(idx_SIC2Hj)*n(idx_H2) &
        -k(3840)*n(idx_SIC2Hj)*n(idx_E) &
        -k(3841)*n(idx_SIC2Hj)*n(idx_E)

    !SIC3+
    !SIC3+
    dn(idx_SIC3j) = &
        +k(294)*n(idx_Cj)*n(idx_SIC2H) &
        +k(295)*n(idx_Cj)*n(idx_SIC3) &
        +k(511)*n(idx_Hj)*n(idx_SIC3) &
        +k(553)*n(idx_Hj)*n(idx_SIC3H) &
        +k(843)*n(idx_HEj)*n(idx_SIC3H) &
        +k(844)*n(idx_HEj)*n(idx_SIC4) &
        +k(1108)*n(idx_SIj)*n(idx_C3H) &
        +k(1109)*n(idx_SIj)*n(idx_HC3) &
        +k(2272)*n(idx_C3Hj)*n(idx_SI) &
        +k(2532)*n(idx_SIC2Hj)*n(idx_C) &
        +k(2622)*n(idx_C3H2j)*n(idx_SI) &
        +k(2623)*n(idx_H2C3j)*n(idx_SI) &
        -k(3842)*n(idx_SIC3j)*n(idx_E) &
        -k(3843)*n(idx_SIC3j)*n(idx_E)

    !CH2SI+
    !CH2SI+
    dn(idx_CH2SIj) = &
        +k(297)*n(idx_Cj)*n(idx_SICH2) &
        +k(300)*n(idx_Cj)*n(idx_SIH3) &
        +k(342)*n(idx_Cj)*n(idx_SIH4) &
        +k(513)*n(idx_Hj)*n(idx_SICH2) &
        +k(556)*n(idx_Hj)*n(idx_SICH3) &
        +k(846)*n(idx_HEj)*n(idx_SICH3) &
        +k(1111)*n(idx_SIj)*n(idx_CH3) &
        +k(1636)*n(idx_CHSIj)*n(idx_H2) &
        +k(1765)*n(idx_H3j)*n(idx_HCSI) &
        +k(1939)*n(idx_HCOj)*n(idx_HCSI) &
        -k(2304)*n(idx_CH2SIj)*n(idx_C) &
        -k(2305)*n(idx_CH2SIj)*n(idx_C) &
        -k(2306)*n(idx_CH2SIj)*n(idx_C) &
        -k(2307)*n(idx_CH2SIj)*n(idx_N) &
        -k(2308)*n(idx_CH2SIj)*n(idx_O) &
        -k(2309)*n(idx_CH2SIj)*n(idx_O) &
        -k(2310)*n(idx_CH2SIj)*n(idx_S) &
        +k(2325)*n(idx_CH3j)*n(idx_SI) &
        +k(2335)*n(idx_CH3j)*n(idx_SIH) &
        +k(2447)*n(idx_H3Oj)*n(idx_HCSI) &
        +k(2534)*n(idx_SIH3j)*n(idx_C) &
        +k(2752)*n(idx_SIH4j)*n(idx_C) &
        -k(3785)*n(idx_CH2SIj)*n(idx_E) &
        -k(3786)*n(idx_CH2SIj)*n(idx_E) &
        -k(3787)*n(idx_CH2SIj)*n(idx_E)

    !SIH3+
    !SIH3+
    dn(idx_SIH3j) = &
        +k(301)*n(idx_Cj)*n(idx_SIH3) &
        +k(515)*n(idx_Hj)*n(idx_SIH3) &
        +k(558)*n(idx_Hj)*n(idx_SIH4) &
        +k(848)*n(idx_HEj)*n(idx_SIH4) &
        +k(1777)*n(idx_H3j)*n(idx_SIH2) &
        +k(1950)*n(idx_HCOj)*n(idx_SIH2) &
        +k(2453)*n(idx_H3Oj)*n(idx_SIH2) &
        -k(2534)*n(idx_SIH3j)*n(idx_C) &
        -k(2535)*n(idx_SIH3j)*n(idx_N) &
        -k(2536)*n(idx_SIH3j)*n(idx_N) &
        -k(2537)*n(idx_SIH3j)*n(idx_O) &
        -k(2538)*n(idx_SIH3j)*n(idx_O) &
        -k(2539)*n(idx_SIH3j)*n(idx_O2) &
        +k(3151)*n(idx_SIHj)*n(idx_H2) &
        -k(3182)*n(idx_SIH3j)*n(idx_H2) &
        -k(3844)*n(idx_SIH3j)*n(idx_E) &
        -k(3845)*n(idx_SIH3j)*n(idx_E)

    !CH2CN+
    !CH2CN+
    dn(idx_CH2CNj) = &
        +k(302)*n(idx_Cj)*n(idx_CH2CN) &
        +k(317)*n(idx_Cj)*n(idx_CH3N) &
        +k(368)*n(idx_Cj)*n(idx_NH2CHO) &
        +k(516)*n(idx_Hj)*n(idx_CH2CN) &
        +k(539)*n(idx_Hj)*n(idx_HC2NC) &
        +k(560)*n(idx_Hj)*n(idx_CH3CN) &
        +k(1583)*n(idx_C2Hj)*n(idx_NH2) &
        +k(1586)*n(idx_C2Hj)*n(idx_NH3) &
        +k(1623)*n(idx_CH2j)*n(idx_HCN) &
        +k(2206)*n(idx_C2H2j)*n(idx_NH) &
        +k(2328)*n(idx_CH3j)*n(idx_CN) &
        +k(2762)*n(idx_C2H4j)*n(idx_N) &
        -k(3850)*n(idx_CH2CNj)*n(idx_E) &
        -k(3851)*n(idx_CH2CNj)*n(idx_E) &
        -k(3852)*n(idx_CH2CNj)*n(idx_E)

    !C2H3+
    !C2H3+
    dn(idx_C2H3j) = &
        +k(305)*n(idx_Cj)*n(idx_C2H3) &
        +k(319)*n(idx_Cj)*n(idx_CH4) &
        +k(344)*n(idx_Cj)*n(idx_CH3CN) &
        +k(347)*n(idx_Cj)*n(idx_C2H4) &
        +k(377)*n(idx_Cj)*n(idx_C3H4) &
        +k(397)*n(idx_Cj)*n(idx_CH3C3N) &
        +k(519)*n(idx_Hj)*n(idx_C2H3) &
        +k(562)*n(idx_Hj)*n(idx_C2H4) &
        +k(854)*n(idx_HEj)*n(idx_C2H4) &
        +k(879)*n(idx_HEj)*n(idx_C2H5) &
        +k(882)*n(idx_HEj)*n(idx_C3H3N) &
        +k(1200)*n(idx_CHj)*n(idx_CH4) &
        +k(1322)*n(idx_H2j)*n(idx_C2H2) &
        +k(1330)*n(idx_H2j)*n(idx_C2H4) &
        +k(1593)*n(idx_C2Nj)*n(idx_CH4) &
        +k(1618)*n(idx_CH2j)*n(idx_CH2) &
        +k(1781)*n(idx_H3j)*n(idx_C2H2) &
        +k(1825)*n(idx_H3j)*n(idx_C2H4) &
        +k(1900)*n(idx_HCNj)*n(idx_CH4) &
        +k(1953)*n(idx_HCOj)*n(idx_C2H2) &
        +k(2101)*n(idx_N2Hj)*n(idx_C2H2) &
        +k(2214)*n(idx_C2H2j)*n(idx_H2S) &
        +k(2217)*n(idx_C2H2j)*n(idx_HCO) &
        +k(2231)*n(idx_C2H2j)*n(idx_C2H3) &
        +k(2282)*n(idx_C3Hj)*n(idx_H2O) &
        +k(2285)*n(idx_C3Hj)*n(idx_H2S) &
        +k(2295)*n(idx_C3Hj)*n(idx_CH4) &
        +k(2341)*n(idx_CH3j)*n(idx_CH2) &
        +k(2355)*n(idx_CH3j)*n(idx_C2H3) &
        +k(2371)*n(idx_CH3j)*n(idx_C2H4) &
        +k(2503)*n(idx_HCO2j)*n(idx_C2H2) &
        -k(2543)*n(idx_C2H3j)*n(idx_C) &
        -k(2544)*n(idx_C2H3j)*n(idx_C) &
        -k(2545)*n(idx_C2H3j)*n(idx_C) &
        -k(2546)*n(idx_C2H3j)*n(idx_H) &
        -k(2547)*n(idx_C2H3j)*n(idx_N) &
        -k(2548)*n(idx_C2H3j)*n(idx_O) &
        -k(2549)*n(idx_C2H3j)*n(idx_O) &
        -k(2550)*n(idx_C2H3j)*n(idx_S) &
        -k(2551)*n(idx_C2H3j)*n(idx_SI) &
        -k(2552)*n(idx_C2H3j)*n(idx_SI) &
        -k(2553)*n(idx_C2H3j)*n(idx_C2H) &
        -k(2554)*n(idx_C2H3j)*n(idx_C2H) &
        -k(2555)*n(idx_C2H3j)*n(idx_C2H) &
        -k(2556)*n(idx_C2H3j)*n(idx_H2O) &
        -k(2557)*n(idx_C2H3j)*n(idx_H2S) &
        -k(2558)*n(idx_C2H3j)*n(idx_HCN) &
        -k(2559)*n(idx_C2H3j)*n(idx_HNC) &
        -k(2560)*n(idx_C2H3j)*n(idx_C2H2) &
        -k(2561)*n(idx_C2H3j)*n(idx_C3H) &
        -k(2562)*n(idx_C2H3j)*n(idx_HC3) &
        -k(2563)*n(idx_C2H3j)*n(idx_C3H) &
        -k(2564)*n(idx_C2H3j)*n(idx_HC3) &
        -k(2565)*n(idx_C2H3j)*n(idx_C3H) &
        -k(2566)*n(idx_C2H3j)*n(idx_HC3) &
        -k(2567)*n(idx_C2H3j)*n(idx_NH3) &
        -k(2568)*n(idx_C2H3j)*n(idx_C2H3) &
        -k(2569)*n(idx_C2H3j)*n(idx_C2H3) &
        -k(2570)*n(idx_C2H3j)*n(idx_C2H3) &
        -k(2571)*n(idx_C2H3j)*n(idx_C3H2) &
        -k(2572)*n(idx_C2H3j)*n(idx_H2C3) &
        -k(2573)*n(idx_C2H3j)*n(idx_C3H2) &
        -k(2574)*n(idx_C2H3j)*n(idx_H2C3) &
        -k(2575)*n(idx_C2H3j)*n(idx_C3H2) &
        -k(2576)*n(idx_C2H3j)*n(idx_H2C3) &
        -k(2577)*n(idx_C2H3j)*n(idx_C4H) &
        -k(2578)*n(idx_C2H3j)*n(idx_C4H) &
        -k(2579)*n(idx_C2H3j)*n(idx_C4H) &
        -k(2580)*n(idx_C2H3j)*n(idx_CH4) &
        -k(2581)*n(idx_C2H3j)*n(idx_HC3N) &
        -k(2582)*n(idx_C2H3j)*n(idx_C2H4) &
        -k(2583)*n(idx_C2H3j)*n(idx_C3H3) &
        -k(2584)*n(idx_C2H3j)*n(idx_C3H3) &
        -k(2585)*n(idx_C2H3j)*n(idx_C3H3) &
        -k(2586)*n(idx_C2H3j)*n(idx_C4H2) &
        -k(2587)*n(idx_C2H3j)*n(idx_C4H2) &
        -k(2588)*n(idx_C2H3j)*n(idx_C4H2) &
        -k(2589)*n(idx_C2H3j)*n(idx_C5H) &
        -k(2590)*n(idx_C2H3j)*n(idx_C5H) &
        -k(2591)*n(idx_C2H3j)*n(idx_C5H) &
        -k(2592)*n(idx_C2H3j)*n(idx_C3H4) &
        -k(2593)*n(idx_C2H3j)*n(idx_C3H4) &
        -k(2594)*n(idx_C2H3j)*n(idx_C5H2) &
        -k(2595)*n(idx_C2H3j)*n(idx_C5H2) &
        -k(2596)*n(idx_C2H3j)*n(idx_C5H2) &
        -k(2597)*n(idx_C2H3j)*n(idx_C6H) &
        -k(2598)*n(idx_C2H3j)*n(idx_C6H) &
        -k(2599)*n(idx_C2H3j)*n(idx_C6H) &
        -k(2600)*n(idx_C2H3j)*n(idx_C6H2) &
        -k(2601)*n(idx_C2H3j)*n(idx_C6H2) &
        -k(2602)*n(idx_C2H3j)*n(idx_C6H2) &
        -k(2603)*n(idx_C2H3j)*n(idx_C7H) &
        -k(2604)*n(idx_C2H3j)*n(idx_C7H) &
        -k(2605)*n(idx_C2H3j)*n(idx_C7H) &
        -k(2606)*n(idx_C2H3j)*n(idx_C7H2) &
        -k(2607)*n(idx_C2H3j)*n(idx_C7H2) &
        -k(2608)*n(idx_C2H3j)*n(idx_C7H2) &
        -k(2609)*n(idx_C2H3j)*n(idx_C6H6) &
        +k(2728)*n(idx_CH4j)*n(idx_C2H2) &
        +k(2761)*n(idx_C2H4j)*n(idx_H) &
        +k(2781)*n(idx_C2H4j)*n(idx_C2H3) &
        +k(2816)*n(idx_C3H3j)*n(idx_O) &
        +k(2817)*n(idx_H3C3j)*n(idx_O) &
        +k(2907)*n(idx_CH5j)*n(idx_C) &
        +k(2928)*n(idx_CH5j)*n(idx_C2H2) &
        +k(3156)*n(idx_C2H2j)*n(idx_H) &
        -k(3183)*n(idx_C2H3j)*n(idx_CO) &
        -k(3856)*n(idx_C2H3j)*n(idx_E) &
        -k(3857)*n(idx_C2H3j)*n(idx_E) &
        -k(3858)*n(idx_C2H3j)*n(idx_E) &
        -k(3859)*n(idx_C2H3j)*n(idx_E) &
        -k(3860)*n(idx_C2H3j)*n(idx_E) &
        -k(3861)*n(idx_C2H3j)*n(idx_E) &
        +k(4333)*n(idx_C2H3)

    !C3H2+
    !C3H2+
    dn(idx_C3H2j) = &
        +k(306)*n(idx_Cj)*n(idx_C2H3) &
        +k(348)*n(idx_Cj)*n(idx_C2H4) &
        +k(385)*n(idx_Cj)*n(idx_C4H3) &
        +k(522)*n(idx_Hj)*n(idx_C3H2) &
        +k(564)*n(idx_Hj)*n(idx_C3H3) &
        +k(858)*n(idx_HEj)*n(idx_C3H3) &
        +k(885)*n(idx_HEj)*n(idx_C3H4) &
        +k(892)*n(idx_HEj)*n(idx_C4H3) &
        +k(1090)*n(idx_Sj)*n(idx_C4H2) &
        +k(1148)*n(idx_C2j)*n(idx_CH4) &
        +k(1191)*n(idx_CHj)*n(idx_C2H2) &
        +k(1573)*n(idx_C2Hj)*n(idx_CH2) &
        +k(1616)*n(idx_CH2j)*n(idx_C2H) &
        +k(1782)*n(idx_H3j)*n(idx_C3H) &
        +k(1954)*n(idx_HCOj)*n(idx_C3H) &
        +k(2203)*n(idx_C2H2j)*n(idx_CH) &
        +k(2273)*n(idx_C3Hj)*n(idx_H2) &
        +k(2337)*n(idx_CH3j)*n(idx_C2H) &
        +k(2455)*n(idx_H3Oj)*n(idx_C3H) &
        +k(2544)*n(idx_C2H3j)*n(idx_C) &
        +k(2561)*n(idx_C2H3j)*n(idx_C3H) &
        -k(2610)*n(idx_C3H2j)*n(idx_C) &
        -k(2612)*n(idx_C3H2j)*n(idx_H) &
        -k(2614)*n(idx_C3H2j)*n(idx_N) &
        -k(2616)*n(idx_C3H2j)*n(idx_O) &
        -k(2618)*n(idx_C3H2j)*n(idx_P) &
        -k(2620)*n(idx_C3H2j)*n(idx_S) &
        -k(2622)*n(idx_C3H2j)*n(idx_SI) &
        -k(2624)*n(idx_C3H2j)*n(idx_SI) &
        -k(2626)*n(idx_C3H2j)*n(idx_C2H) &
        -k(2628)*n(idx_C3H2j)*n(idx_C2H2) &
        -k(2630)*n(idx_C3H2j)*n(idx_C3H) &
        -k(2632)*n(idx_C3H2j)*n(idx_C2H3) &
        -k(2634)*n(idx_C3H2j)*n(idx_C2H3) &
        -k(2636)*n(idx_C3H2j)*n(idx_C3H2) &
        -k(2638)*n(idx_C3H2j)*n(idx_C3H2) &
        -k(2640)*n(idx_C3H2j)*n(idx_C4H) &
        -k(2642)*n(idx_C3H2j)*n(idx_C4H) &
        -k(2644)*n(idx_C3H2j)*n(idx_CH4) &
        -k(2646)*n(idx_C3H2j)*n(idx_C2H4) &
        -k(2648)*n(idx_C3H2j)*n(idx_C2H4) &
        -k(2650)*n(idx_C3H2j)*n(idx_C3H3) &
        -k(2652)*n(idx_C3H2j)*n(idx_C4H2) &
        -k(2654)*n(idx_C3H2j)*n(idx_C4H2) &
        -k(2656)*n(idx_C3H2j)*n(idx_C5H) &
        -k(2658)*n(idx_C3H2j)*n(idx_C5H) &
        -k(2660)*n(idx_C3H2j)*n(idx_C3H4) &
        -k(2662)*n(idx_C3H2j)*n(idx_C3H4) &
        -k(2664)*n(idx_C3H2j)*n(idx_C3H4) &
        -k(2667)*n(idx_C3H2j)*n(idx_C3H4) &
        -k(2668)*n(idx_C3H2j)*n(idx_C3H4) &
        -k(2670)*n(idx_C3H2j)*n(idx_C5H2) &
        -k(2672)*n(idx_C3H2j)*n(idx_C5H2) &
        -k(2674)*n(idx_C3H2j)*n(idx_C6H) &
        -k(2676)*n(idx_C3H2j)*n(idx_C6H) &
        -k(2678)*n(idx_C3H2j)*n(idx_C6H2) &
        -k(2680)*n(idx_C3H2j)*n(idx_C6H2) &
        +k(2757)*n(idx_C2H4j)*n(idx_C) &
        +k(2874)*n(idx_C4H2j)*n(idx_O) &
        +k(3162)*n(idx_C3Hj)*n(idx_H) &
        -k(3184)*n(idx_C3H2j)*n(idx_H) &
        -k(3862)*n(idx_C3H2j)*n(idx_E) &
        -k(3864)*n(idx_C3H2j)*n(idx_E) &
        -k(3866)*n(idx_C3H2j)*n(idx_E) &
        -k(3868)*n(idx_C3H2j)*n(idx_E) &
        -k(3870)*n(idx_C3H2j)*n(idx_E)

    !H2C3+
    !H2C3+
    dn(idx_H2C3j) = &
        +k(307)*n(idx_Cj)*n(idx_C2H3) &
        +k(349)*n(idx_Cj)*n(idx_C2H4) &
        +k(386)*n(idx_Cj)*n(idx_C4H3) &
        +k(523)*n(idx_Hj)*n(idx_H2C3) &
        +k(565)*n(idx_Hj)*n(idx_C3H3) &
        +k(859)*n(idx_HEj)*n(idx_C3H3) &
        +k(886)*n(idx_HEj)*n(idx_C3H4) &
        +k(893)*n(idx_HEj)*n(idx_C4H3) &
        +k(1091)*n(idx_Sj)*n(idx_C4H2) &
        +k(1149)*n(idx_C2j)*n(idx_CH4) &
        +k(1192)*n(idx_CHj)*n(idx_C2H2) &
        +k(1574)*n(idx_C2Hj)*n(idx_CH2) &
        +k(1617)*n(idx_CH2j)*n(idx_C2H) &
        +k(1783)*n(idx_H3j)*n(idx_HC3) &
        +k(1955)*n(idx_HCOj)*n(idx_HC3) &
        +k(2204)*n(idx_C2H2j)*n(idx_CH) &
        +k(2338)*n(idx_CH3j)*n(idx_C2H) &
        +k(2456)*n(idx_H3Oj)*n(idx_HC3) &
        +k(2545)*n(idx_C2H3j)*n(idx_C) &
        +k(2562)*n(idx_C2H3j)*n(idx_HC3) &
        -k(2611)*n(idx_H2C3j)*n(idx_C) &
        -k(2613)*n(idx_H2C3j)*n(idx_H) &
        -k(2615)*n(idx_H2C3j)*n(idx_N) &
        -k(2617)*n(idx_H2C3j)*n(idx_O) &
        -k(2619)*n(idx_H2C3j)*n(idx_P) &
        -k(2621)*n(idx_H2C3j)*n(idx_S) &
        -k(2623)*n(idx_H2C3j)*n(idx_SI) &
        -k(2625)*n(idx_H2C3j)*n(idx_SI) &
        -k(2627)*n(idx_H2C3j)*n(idx_C2H) &
        -k(2629)*n(idx_H2C3j)*n(idx_C2H2) &
        -k(2631)*n(idx_H2C3j)*n(idx_HC3) &
        -k(2633)*n(idx_H2C3j)*n(idx_C2H3) &
        -k(2635)*n(idx_H2C3j)*n(idx_C2H3) &
        -k(2637)*n(idx_H2C3j)*n(idx_H2C3) &
        -k(2639)*n(idx_H2C3j)*n(idx_H2C3) &
        -k(2641)*n(idx_H2C3j)*n(idx_C4H) &
        -k(2643)*n(idx_H2C3j)*n(idx_C4H) &
        -k(2645)*n(idx_H2C3j)*n(idx_CH4) &
        -k(2647)*n(idx_H2C3j)*n(idx_C2H4) &
        -k(2649)*n(idx_H2C3j)*n(idx_C2H4) &
        -k(2651)*n(idx_H2C3j)*n(idx_C3H3) &
        -k(2653)*n(idx_H2C3j)*n(idx_C4H2) &
        -k(2655)*n(idx_H2C3j)*n(idx_C4H2) &
        -k(2657)*n(idx_H2C3j)*n(idx_C5H) &
        -k(2659)*n(idx_H2C3j)*n(idx_C5H) &
        -k(2661)*n(idx_H2C3j)*n(idx_C3H4) &
        -k(2663)*n(idx_H2C3j)*n(idx_C3H4) &
        -k(2665)*n(idx_H2C3j)*n(idx_C3H4) &
        -k(2666)*n(idx_H2C3j)*n(idx_C3H4) &
        -k(2669)*n(idx_H2C3j)*n(idx_C3H4) &
        -k(2671)*n(idx_H2C3j)*n(idx_C5H2) &
        -k(2673)*n(idx_H2C3j)*n(idx_C5H2) &
        -k(2675)*n(idx_H2C3j)*n(idx_C6H) &
        -k(2677)*n(idx_H2C3j)*n(idx_C6H) &
        -k(2679)*n(idx_H2C3j)*n(idx_C6H2) &
        -k(2681)*n(idx_H2C3j)*n(idx_C6H2) &
        +k(2758)*n(idx_C2H4j)*n(idx_C) &
        +k(2875)*n(idx_C4H2j)*n(idx_O) &
        +k(3163)*n(idx_C3Hj)*n(idx_H) &
        -k(3185)*n(idx_H2C3j)*n(idx_H) &
        -k(3863)*n(idx_H2C3j)*n(idx_E) &
        -k(3865)*n(idx_H2C3j)*n(idx_E) &
        -k(3867)*n(idx_H2C3j)*n(idx_E) &
        -k(3869)*n(idx_H2C3j)*n(idx_E) &
        -k(3871)*n(idx_H2C3j)*n(idx_E)

    !C4H+
    !C4H+
    dn(idx_C4Hj) = &
        +k(310)*n(idx_Cj)*n(idx_C3H2) &
        +k(311)*n(idx_Cj)*n(idx_H2C3) &
        +k(352)*n(idx_Cj)*n(idx_C3H3) &
        +k(525)*n(idx_Hj)*n(idx_C4H) &
        +k(568)*n(idx_Hj)*n(idx_C4H2) &
        +k(862)*n(idx_HEj)*n(idx_C4H2) &
        +k(897)*n(idx_HEj)*n(idx_C6H) &
        +k(907)*n(idx_HEj)*n(idx_HC5N) &
        +k(908)*n(idx_HEj)*n(idx_C6H2) &
        +k(1092)*n(idx_Sj)*n(idx_C4H2) &
        +k(1119)*n(idx_SIj)*n(idx_C4H2) &
        +k(1144)*n(idx_C2j)*n(idx_C2H2) &
        +k(1788)*n(idx_H3j)*n(idx_C4) &
        +k(1960)*n(idx_HCOj)*n(idx_C4) &
        +k(2303)*n(idx_C4j)*n(idx_H2) &
        +k(2461)*n(idx_H3Oj)*n(idx_C4) &
        +k(2610)*n(idx_C3H2j)*n(idx_C) &
        +k(2611)*n(idx_H2C3j)*n(idx_C) &
        -k(2684)*n(idx_C4Hj)*n(idx_C) &
        -k(2685)*n(idx_C4Hj)*n(idx_FE) &
        -k(2686)*n(idx_C4Hj)*n(idx_MG) &
        -k(2687)*n(idx_C4Hj)*n(idx_NA) &
        -k(2688)*n(idx_C4Hj)*n(idx_O) &
        -k(2689)*n(idx_C4Hj)*n(idx_H2) &
        -k(2690)*n(idx_C4Hj)*n(idx_C2H) &
        -k(2691)*n(idx_C4Hj)*n(idx_C2H) &
        -k(2692)*n(idx_C4Hj)*n(idx_C2H2) &
        -k(2693)*n(idx_C4Hj)*n(idx_C3H) &
        -k(2694)*n(idx_C4Hj)*n(idx_HC3) &
        -k(2695)*n(idx_C4Hj)*n(idx_C3H) &
        -k(2696)*n(idx_C4Hj)*n(idx_HC3) &
        -k(2697)*n(idx_C4Hj)*n(idx_C2H3) &
        -k(2698)*n(idx_C4Hj)*n(idx_C3H2) &
        -k(2699)*n(idx_C4Hj)*n(idx_H2C3) &
        -k(2700)*n(idx_C4Hj)*n(idx_C4H) &
        -k(2701)*n(idx_C4Hj)*n(idx_C4H) &
        -k(2702)*n(idx_C4Hj)*n(idx_CH4) &
        -k(2703)*n(idx_C4Hj)*n(idx_C2H4) &
        -k(2704)*n(idx_C4Hj)*n(idx_C2H4) &
        -k(2705)*n(idx_C4Hj)*n(idx_C3H3) &
        -k(2706)*n(idx_C4Hj)*n(idx_C4H2) &
        -k(2707)*n(idx_C4Hj)*n(idx_C5H) &
        -k(2708)*n(idx_C4Hj)*n(idx_C3H4) &
        -k(2709)*n(idx_C4Hj)*n(idx_C5H2) &
        +k(2812)*n(idx_C3H3j)*n(idx_C) &
        +k(2813)*n(idx_H3C3j)*n(idx_C) &
        -k(3186)*n(idx_C4Hj)*n(idx_H) &
        -k(3875)*n(idx_C4Hj)*n(idx_E) &
        -k(3876)*n(idx_C4Hj)*n(idx_E) &
        -k(3877)*n(idx_C4Hj)*n(idx_E) &
        -k(3878)*n(idx_C4Hj)*n(idx_E)

    !C5+
    !C5+
    dn(idx_C5j) = &
        +k(312)*n(idx_Cj)*n(idx_C4H) &
        +k(313)*n(idx_Cj)*n(idx_C4P) &
        +k(315)*n(idx_Cj)*n(idx_C4S) &
        +k(357)*n(idx_Cj)*n(idx_C4H2) &
        +k(528)*n(idx_Hj)*n(idx_C5) &
        +k(570)*n(idx_Hj)*n(idx_C5H) &
        +k(864)*n(idx_HEj)*n(idx_C5H) &
        +k(867)*n(idx_HEj)*n(idx_C6) &
        +k(895)*n(idx_HEj)*n(idx_C5H2) &
        +k(899)*n(idx_HEj)*n(idx_C7) &
        +k(2684)*n(idx_C4Hj)*n(idx_C) &
        -k(2715)*n(idx_C5j)*n(idx_H2) &
        +k(2870)*n(idx_C4H2j)*n(idx_C) &
        +k(3131)*n(idx_Cj)*n(idx_C4) &
        -k(3886)*n(idx_C5j)*n(idx_E) &
        -k(3887)*n(idx_C5j)*n(idx_E)

    !C4S+
    !C4S+
    dn(idx_C4Sj) = &
        +k(314)*n(idx_Cj)*n(idx_C4S) &
        +k(527)*n(idx_Hj)*n(idx_C4S) &
        +k(1088)*n(idx_Sj)*n(idx_C4H) &
        -k(3883)*n(idx_C4Sj)*n(idx_E) &
        -k(3884)*n(idx_C4Sj)*n(idx_E) &
        -k(3885)*n(idx_C4Sj)*n(idx_E)

    !PC2H+
    !PC2H+
    dn(idx_PC2Hj) = &
        +k(316)*n(idx_Cj)*n(idx_CH2PH) &
        +k(507)*n(idx_Hj)*n(idx_HCCP) &
        +k(1050)*n(idx_Pj)*n(idx_C2H2) &
        +k(1756)*n(idx_H3j)*n(idx_CCP) &
        +k(1932)*n(idx_HCOj)*n(idx_CCP) &
        +k(2199)*n(idx_C2H2j)*n(idx_P) &
        +k(2442)*n(idx_H3Oj)*n(idx_CCP) &
        -k(2530)*n(idx_PC2Hj)*n(idx_C2H2) &
        -k(3833)*n(idx_PC2Hj)*n(idx_E) &
        -k(3834)*n(idx_PC2Hj)*n(idx_E)

    !C3N+
    !C3N+
    dn(idx_C3Nj) = &
        +k(320)*n(idx_Cj)*n(idx_HCNC2) &
        +k(335)*n(idx_Cj)*n(idx_HNC3) &
        +k(537)*n(idx_Hj)*n(idx_HCNC2) &
        +k(541)*n(idx_Hj)*n(idx_HC2NC) &
        +k(546)*n(idx_Hj)*n(idx_HNC3) &
        +k(755)*n(idx_HEj)*n(idx_C3N) &
        +k(819)*n(idx_HEj)*n(idx_HCNC2) &
        +k(823)*n(idx_HEj)*n(idx_HC2NC) &
        +k(831)*n(idx_HEj)*n(idx_HC3N) &
        +k(834)*n(idx_HEj)*n(idx_HNC3) &
        +k(1139)*n(idx_C2j)*n(idx_HCN) &
        +k(1569)*n(idx_C2Hj)*n(idx_CN) &
        -k(2302)*n(idx_C3Nj)*n(idx_H2) &
        -k(3778)*n(idx_C3Nj)*n(idx_E)

    !C4N+
    !C4N+
    dn(idx_C4Nj) = &
        +k(323)*n(idx_Cj)*n(idx_HCNC2) &
        +k(328)*n(idx_Cj)*n(idx_HC2NC) &
        +k(332)*n(idx_Cj)*n(idx_HC3N) &
        +k(336)*n(idx_Cj)*n(idx_HNC3) &
        -k(2710)*n(idx_C4Nj)*n(idx_H2) &
        -k(2711)*n(idx_C4Nj)*n(idx_H2O) &
        -k(2712)*n(idx_C4Nj)*n(idx_H2O) &
        -k(2713)*n(idx_C4Nj)*n(idx_C2H2) &
        -k(2714)*n(idx_C4Nj)*n(idx_CH4) &
        -k(3879)*n(idx_C4Nj)*n(idx_E) &
        -k(3880)*n(idx_C4Nj)*n(idx_E)

    !C3HN+
    !C3HN+
    dn(idx_C3HNj) = &
        +k(329)*n(idx_Cj)*n(idx_HC2NC) &
        +k(542)*n(idx_Hj)*n(idx_HC3N) &
        +k(544)*n(idx_Hj)*n(idx_HNC3) &
        +k(1579)*n(idx_C2Hj)*n(idx_HCN) &
        +k(1784)*n(idx_H3j)*n(idx_C3N) &
        +k(1956)*n(idx_HCOj)*n(idx_C3N) &
        +k(2205)*n(idx_C2H2j)*n(idx_CN) &
        +k(2302)*n(idx_C3Nj)*n(idx_H2) &
        +k(2457)*n(idx_H3Oj)*n(idx_C3N) &
        +k(2614)*n(idx_C3H2j)*n(idx_N) &
        +k(2615)*n(idx_H2C3j)*n(idx_N) &
        -k(2682)*n(idx_C3HNj)*n(idx_H2) &
        -k(2683)*n(idx_C3HNj)*n(idx_H2) &
        -k(3872)*n(idx_C3HNj)*n(idx_E) &
        -k(3873)*n(idx_C3HNj)*n(idx_E) &
        -k(3874)*n(idx_C3HNj)*n(idx_E)

    !HNC+
    !HNC+
    dn(idx_HNCj) = &
        +k(334)*n(idx_Cj)*n(idx_HNC3) &
        +k(547)*n(idx_Hj)*n(idx_HNC3) &
        +k(549)*n(idx_Hj)*n(idx_NH2CN) &
        -k(2040)*n(idx_HNCj)*n(idx_C) &
        -k(2041)*n(idx_HNCj)*n(idx_S) &
        -k(2042)*n(idx_HNCj)*n(idx_S) &
        -k(2043)*n(idx_HNCj)*n(idx_C2) &
        -k(2044)*n(idx_HNCj)*n(idx_CH) &
        -k(2045)*n(idx_HNCj)*n(idx_H2) &
        -k(2046)*n(idx_HNCj)*n(idx_NH) &
        -k(2047)*n(idx_HNCj)*n(idx_NO) &
        -k(2048)*n(idx_HNCj)*n(idx_O2) &
        -k(2049)*n(idx_HNCj)*n(idx_OH) &
        -k(2050)*n(idx_HNCj)*n(idx_C2H) &
        -k(2051)*n(idx_HNCj)*n(idx_CH2) &
        -k(2052)*n(idx_HNCj)*n(idx_H2O) &
        -k(2053)*n(idx_HNCj)*n(idx_HCN) &
        -k(2054)*n(idx_HNCj)*n(idx_HCO) &
        -k(2055)*n(idx_HNCj)*n(idx_HCO) &
        -k(2056)*n(idx_HNCj)*n(idx_NH2) &
        -k(2057)*n(idx_HNCj)*n(idx_H2CO) &
        -k(2058)*n(idx_HNCj)*n(idx_NH3) &
        +k(3113)*n(idx_CNj)*n(idx_H2) &
        +k(3114)*n(idx_C2N2j)*n(idx_H) &
        -k(3725)*n(idx_HNCj)*n(idx_E)

    !SIC3H+
    !SIC3H+
    dn(idx_SIC3Hj) = &
        +k(337)*n(idx_Cj)*n(idx_SIC2H2) &
        +k(554)*n(idx_Hj)*n(idx_SIC3H) &
        +k(1114)*n(idx_SIj)*n(idx_C3H2) &
        +k(1115)*n(idx_SIj)*n(idx_H2C3) &
        +k(1797)*n(idx_H3j)*n(idx_SIC3) &
        +k(1968)*n(idx_HCOj)*n(idx_SIC3) &
        +k(2624)*n(idx_C3H2j)*n(idx_SI) &
        +k(2625)*n(idx_H2C3j)*n(idx_SI) &
        +k(2748)*n(idx_SIC2H2j)*n(idx_C) &
        -k(2749)*n(idx_SIC3Hj)*n(idx_C) &
        +k(2820)*n(idx_C3H3j)*n(idx_SI) &
        +k(2821)*n(idx_H3C3j)*n(idx_SI) &
        -k(3921)*n(idx_SIC3Hj)*n(idx_E) &
        -k(3922)*n(idx_SIC3Hj)*n(idx_E) &
        -k(3923)*n(idx_SIC3Hj)*n(idx_E)

    !SIC4+
    !SIC4+
    dn(idx_SIC4j) = &
        +k(338)*n(idx_Cj)*n(idx_SIC3H) &
        +k(555)*n(idx_Hj)*n(idx_SIC4) &
        +k(1116)*n(idx_SIj)*n(idx_C4H) &
        +k(2749)*n(idx_SIC3Hj)*n(idx_C) &
        +k(2878)*n(idx_C4H2j)*n(idx_SI) &
        -k(3924)*n(idx_SIC4j)*n(idx_E) &
        -k(3925)*n(idx_SIC4j)*n(idx_E)

    !SIC2H2+
    !SIC2H2+
    dn(idx_SIC2H2j) = &
        +k(340)*n(idx_Cj)*n(idx_SICH3) &
        +k(552)*n(idx_Hj)*n(idx_SIC2H2) &
        +k(1113)*n(idx_SIj)*n(idx_C2H3) &
        +k(1796)*n(idx_H3j)*n(idx_SIC2H) &
        +k(1967)*n(idx_HCOj)*n(idx_SIC2H) &
        +k(2467)*n(idx_H3Oj)*n(idx_SIC2H) &
        +k(2552)*n(idx_C2H3j)*n(idx_SI) &
        -k(2748)*n(idx_SIC2H2j)*n(idx_C) &
        +k(2750)*n(idx_SICH3j)*n(idx_C) &
        +k(2767)*n(idx_C2H4j)*n(idx_SI) &
        +k(3146)*n(idx_SIj)*n(idx_C2H2) &
        -k(3919)*n(idx_SIC2H2j)*n(idx_E) &
        -k(3920)*n(idx_SIC2H2j)*n(idx_E)

    !SICH3+
    !SICH3+
    dn(idx_SICH3j) = &
        +k(341)*n(idx_Cj)*n(idx_SICH3) &
        +k(343)*n(idx_Cj)*n(idx_SIH4) &
        +k(557)*n(idx_Hj)*n(idx_SICH3) &
        +k(1798)*n(idx_H3j)*n(idx_SICH2) &
        +k(1969)*n(idx_HCOj)*n(idx_SICH2) &
        -k(2750)*n(idx_SICH3j)*n(idx_C) &
        -k(2751)*n(idx_SICH3j)*n(idx_H2O) &
        +k(2914)*n(idx_CH5j)*n(idx_SI) &
        -k(3926)*n(idx_SICH3j)*n(idx_E) &
        -k(3927)*n(idx_SICH3j)*n(idx_E)

    !HC2NCH+
    !HC2NCH+
    dn(idx_HC2NCHj) = &
        +k(345)*n(idx_Cj)*n(idx_CH3CN) &
        +k(1814)*n(idx_H3j)*n(idx_HCNC2) &
        +k(1815)*n(idx_H3j)*n(idx_HC2NC) &
        +k(1981)*n(idx_HCOj)*n(idx_HCNC2) &
        +k(1982)*n(idx_HCOj)*n(idx_HC2NC) &
        +k(2105)*n(idx_N2Hj)*n(idx_HCNC2) &
        +k(2106)*n(idx_N2Hj)*n(idx_HC2NC) &
        +k(2476)*n(idx_H3Oj)*n(idx_HCNC2) &
        +k(2477)*n(idx_H3Oj)*n(idx_HC2NC) &
        -k(3979)*n(idx_HC2NCHj)*n(idx_E) &
        -k(3980)*n(idx_HC2NCHj)*n(idx_E) &
        -k(3981)*n(idx_HC2NCHj)*n(idx_E) &
        -k(3982)*n(idx_HC2NCHj)*n(idx_E) &
        -k(3983)*n(idx_HC2NCHj)*n(idx_E) &
        -k(3984)*n(idx_HC2NCHj)*n(idx_E)

    !C3H3+
    !C3H3+
    dn(idx_C3H3j) = &
        +k(351)*n(idx_Cj)*n(idx_C2H4) &
        +k(353)*n(idx_Cj)*n(idx_C3H3) &
        +k(372)*n(idx_Cj)*n(idx_C2H5) &
        +k(378)*n(idx_Cj)*n(idx_C3H4) &
        +k(566)*n(idx_Hj)*n(idx_C3H3) &
        +k(585)*n(idx_Hj)*n(idx_C3H4) &
        +k(887)*n(idx_HEj)*n(idx_C3H4) &
        +k(890)*n(idx_HEj)*n(idx_C4H3) &
        +k(1150)*n(idx_C2j)*n(idx_CH4) &
        +k(1589)*n(idx_C2Hj)*n(idx_CH4) &
        +k(1803)*n(idx_H3j)*n(idx_C3H2) &
        +k(1839)*n(idx_H3j)*n(idx_C3H4) &
        +k(1972)*n(idx_HCOj)*n(idx_C3H2) &
        +k(2211)*n(idx_C2H2j)*n(idx_CH2) &
        +k(2232)*n(idx_C2H2j)*n(idx_C2H3) &
        +k(2244)*n(idx_C2H2j)*n(idx_C2H4) &
        +k(2247)*n(idx_C2H2j)*n(idx_C3H3) &
        +k(2297)*n(idx_C3Hj)*n(idx_C2H4) &
        +k(2339)*n(idx_CH3j)*n(idx_C2H) &
        +k(2347)*n(idx_CH3j)*n(idx_C2H2) &
        +k(2356)*n(idx_CH3j)*n(idx_C2H3) &
        +k(2363)*n(idx_CH3j)*n(idx_HCNC2) &
        +k(2365)*n(idx_CH3j)*n(idx_HC2NC) &
        +k(2367)*n(idx_CH3j)*n(idx_HC3N) &
        +k(2369)*n(idx_CH3j)*n(idx_HNC3) &
        +k(2372)*n(idx_CH3j)*n(idx_C2H4) &
        +k(2376)*n(idx_CH3j)*n(idx_C4H2) &
        +k(2470)*n(idx_H3Oj)*n(idx_C3H2) &
        +k(2568)*n(idx_C2H3j)*n(idx_C2H3) &
        +k(2571)*n(idx_C2H3j)*n(idx_C3H2) &
        +k(2729)*n(idx_CH4j)*n(idx_C2H2) &
        +k(2759)*n(idx_C2H4j)*n(idx_C) &
        +k(2769)*n(idx_C2H4j)*n(idx_C2H) &
        +k(2772)*n(idx_C2H4j)*n(idx_C2H2) &
        +k(2793)*n(idx_C2H4j)*n(idx_C3H3) &
        -k(2812)*n(idx_C3H3j)*n(idx_C) &
        -k(2814)*n(idx_C3H3j)*n(idx_C) &
        -k(2816)*n(idx_C3H3j)*n(idx_O) &
        -k(2818)*n(idx_C3H3j)*n(idx_S) &
        -k(2820)*n(idx_C3H3j)*n(idx_SI) &
        -k(2822)*n(idx_C3H3j)*n(idx_SI) &
        -k(2824)*n(idx_C3H3j)*n(idx_C2H) &
        -k(2826)*n(idx_C3H3j)*n(idx_C2H) &
        -k(2828)*n(idx_C3H3j)*n(idx_C2H2) &
        -k(2830)*n(idx_C3H3j)*n(idx_C3H) &
        -k(2832)*n(idx_C3H3j)*n(idx_C3H) &
        -k(2834)*n(idx_C3H3j)*n(idx_C2H3) &
        -k(2836)*n(idx_C3H3j)*n(idx_C3H2) &
        -k(2838)*n(idx_C3H3j)*n(idx_C3H2) &
        -k(2840)*n(idx_C3H3j)*n(idx_C4H) &
        -k(2842)*n(idx_C3H3j)*n(idx_C4H) &
        -k(2844)*n(idx_C3H3j)*n(idx_CH4) &
        -k(2846)*n(idx_C3H3j)*n(idx_C2H4) &
        -k(2848)*n(idx_C3H3j)*n(idx_C3H3) &
        -k(2850)*n(idx_C3H3j)*n(idx_C3H3) &
        -k(2852)*n(idx_C3H3j)*n(idx_C4H2) &
        -k(2854)*n(idx_C3H3j)*n(idx_C5H) &
        -k(2856)*n(idx_C3H3j)*n(idx_C5H) &
        -k(2858)*n(idx_C3H3j)*n(idx_C3H4) &
        -k(2860)*n(idx_C3H3j)*n(idx_C5H2) &
        -k(2862)*n(idx_C3H3j)*n(idx_C5H2) &
        -k(2864)*n(idx_C3H3j)*n(idx_C6H) &
        -k(2866)*n(idx_C3H3j)*n(idx_C6H) &
        -k(2868)*n(idx_C3H3j)*n(idx_C6H2) &
        +k(2940)*n(idx_C2H5j)*n(idx_C) &
        +k(2950)*n(idx_C2H5j)*n(idx_C2H2) &
        +k(2958)*n(idx_C3H4j)*n(idx_H) &
        +k(3166)*n(idx_C3Hj)*n(idx_H2) &
        +k(3184)*n(idx_C3H2j)*n(idx_H) &
        -k(3189)*n(idx_C3H3j)*n(idx_C4H2) &
        -k(3948)*n(idx_C3H3j)*n(idx_E) &
        -k(3950)*n(idx_C3H3j)*n(idx_E) &
        -k(3952)*n(idx_C3H3j)*n(idx_E)

    !H3C3+
    !H3C3+
    dn(idx_H3C3j) = &
        +k(354)*n(idx_Cj)*n(idx_C3H3) &
        +k(373)*n(idx_Cj)*n(idx_C2H5) &
        +k(379)*n(idx_Cj)*n(idx_C3H4) &
        +k(567)*n(idx_Hj)*n(idx_C3H3) &
        +k(586)*n(idx_Hj)*n(idx_C3H4) &
        +k(888)*n(idx_HEj)*n(idx_C3H4) &
        +k(891)*n(idx_HEj)*n(idx_C4H3) &
        +k(1151)*n(idx_C2j)*n(idx_CH4) &
        +k(1590)*n(idx_C2Hj)*n(idx_CH4) &
        +k(1804)*n(idx_H3j)*n(idx_H2C3) &
        +k(1840)*n(idx_H3j)*n(idx_C3H4) &
        +k(1973)*n(idx_HCOj)*n(idx_H2C3) &
        +k(2212)*n(idx_C2H2j)*n(idx_CH2) &
        +k(2233)*n(idx_C2H2j)*n(idx_C2H3) &
        +k(2245)*n(idx_C2H2j)*n(idx_C2H4) &
        +k(2248)*n(idx_C2H2j)*n(idx_C3H3) &
        +k(2298)*n(idx_C3Hj)*n(idx_C2H4) &
        +k(2340)*n(idx_CH3j)*n(idx_C2H) &
        +k(2357)*n(idx_CH3j)*n(idx_C2H3) &
        +k(2364)*n(idx_CH3j)*n(idx_HCNC2) &
        +k(2366)*n(idx_CH3j)*n(idx_HC2NC) &
        +k(2368)*n(idx_CH3j)*n(idx_HC3N) &
        +k(2370)*n(idx_CH3j)*n(idx_HNC3) &
        +k(2373)*n(idx_CH3j)*n(idx_C2H4) &
        +k(2377)*n(idx_CH3j)*n(idx_C4H2) &
        +k(2471)*n(idx_H3Oj)*n(idx_H2C3) &
        +k(2569)*n(idx_C2H3j)*n(idx_C2H3) &
        +k(2572)*n(idx_C2H3j)*n(idx_H2C3) &
        +k(2730)*n(idx_CH4j)*n(idx_C2H2) &
        +k(2760)*n(idx_C2H4j)*n(idx_C) &
        +k(2770)*n(idx_C2H4j)*n(idx_C2H) &
        +k(2773)*n(idx_C2H4j)*n(idx_C2H2) &
        +k(2794)*n(idx_C2H4j)*n(idx_C3H3) &
        -k(2813)*n(idx_H3C3j)*n(idx_C) &
        -k(2815)*n(idx_H3C3j)*n(idx_C) &
        -k(2817)*n(idx_H3C3j)*n(idx_O) &
        -k(2819)*n(idx_H3C3j)*n(idx_S) &
        -k(2821)*n(idx_H3C3j)*n(idx_SI) &
        -k(2823)*n(idx_H3C3j)*n(idx_SI) &
        -k(2825)*n(idx_H3C3j)*n(idx_C2H) &
        -k(2827)*n(idx_H3C3j)*n(idx_C2H) &
        -k(2829)*n(idx_H3C3j)*n(idx_C2H2) &
        -k(2831)*n(idx_H3C3j)*n(idx_HC3) &
        -k(2833)*n(idx_H3C3j)*n(idx_HC3) &
        -k(2835)*n(idx_H3C3j)*n(idx_C2H3) &
        -k(2837)*n(idx_H3C3j)*n(idx_H2C3) &
        -k(2839)*n(idx_H3C3j)*n(idx_H2C3) &
        -k(2841)*n(idx_H3C3j)*n(idx_C4H) &
        -k(2843)*n(idx_H3C3j)*n(idx_C4H) &
        -k(2845)*n(idx_H3C3j)*n(idx_CH4) &
        -k(2847)*n(idx_H3C3j)*n(idx_C2H4) &
        -k(2849)*n(idx_H3C3j)*n(idx_C3H3) &
        -k(2851)*n(idx_H3C3j)*n(idx_C3H3) &
        -k(2853)*n(idx_H3C3j)*n(idx_C4H2) &
        -k(2855)*n(idx_H3C3j)*n(idx_C5H) &
        -k(2857)*n(idx_H3C3j)*n(idx_C5H) &
        -k(2859)*n(idx_H3C3j)*n(idx_C3H4) &
        -k(2861)*n(idx_H3C3j)*n(idx_C5H2) &
        -k(2863)*n(idx_H3C3j)*n(idx_C5H2) &
        -k(2865)*n(idx_H3C3j)*n(idx_C6H) &
        -k(2867)*n(idx_H3C3j)*n(idx_C6H) &
        -k(2869)*n(idx_H3C3j)*n(idx_C6H2) &
        +k(2941)*n(idx_C2H5j)*n(idx_C) &
        +k(2951)*n(idx_C2H5j)*n(idx_C2H2) &
        +k(2959)*n(idx_C3H4j)*n(idx_H) &
        +k(3165)*n(idx_C3Hj)*n(idx_H2) &
        +k(3185)*n(idx_H2C3j)*n(idx_H) &
        -k(3190)*n(idx_H3C3j)*n(idx_C4H2) &
        -k(3949)*n(idx_H3C3j)*n(idx_E) &
        -k(3951)*n(idx_H3C3j)*n(idx_E) &
        -k(3953)*n(idx_H3C3j)*n(idx_E)

    !C5H+
    !C5H+
    dn(idx_C5Hj) = &
        +k(359)*n(idx_Cj)*n(idx_C4H2) &
        +k(383)*n(idx_Cj)*n(idx_C4H3) &
        +k(392)*n(idx_Cj)*n(idx_HC5N) &
        +k(571)*n(idx_Hj)*n(idx_C5H) &
        +k(590)*n(idx_Hj)*n(idx_C5H2) &
        +k(896)*n(idx_HEj)*n(idx_C5H2) &
        +k(911)*n(idx_HEj)*n(idx_C7H) &
        +k(923)*n(idx_HEj)*n(idx_C7H2) &
        +k(1603)*n(idx_C3j)*n(idx_C2H2) &
        +k(1808)*n(idx_H3j)*n(idx_C5) &
        +k(1977)*n(idx_HCOj)*n(idx_C5) &
        +k(2224)*n(idx_C2H2j)*n(idx_C3H) &
        +k(2225)*n(idx_C2H2j)*n(idx_HC3) &
        +k(2300)*n(idx_C3Hj)*n(idx_C4H2) &
        +k(2713)*n(idx_C4Nj)*n(idx_C2H2) &
        +k(2715)*n(idx_C5j)*n(idx_H2) &
        +k(2871)*n(idx_C4H2j)*n(idx_C) &
        -k(2900)*n(idx_C5Hj)*n(idx_C) &
        -k(2901)*n(idx_C5Hj)*n(idx_N) &
        -k(2902)*n(idx_C5Hj)*n(idx_O) &
        -k(2903)*n(idx_C5Hj)*n(idx_H2) &
        +k(2965)*n(idx_C4H3j)*n(idx_C) &
        -k(3196)*n(idx_C5Hj)*n(idx_C4H2) &
        -k(3956)*n(idx_C5Hj)*n(idx_E) &
        -k(3957)*n(idx_C5Hj)*n(idx_E)

    !C6+
    !C6+
    dn(idx_C6j) = &
        +k(360)*n(idx_Cj)*n(idx_C5H) &
        +k(387)*n(idx_Cj)*n(idx_C5H2) &
        +k(572)*n(idx_Hj)*n(idx_C6) &
        +k(592)*n(idx_Hj)*n(idx_C6H) &
        +k(898)*n(idx_HEj)*n(idx_C6H) &
        +k(900)*n(idx_HEj)*n(idx_C7) &
        +k(909)*n(idx_HEj)*n(idx_C6H2) &
        +k(913)*n(idx_HEj)*n(idx_C7N) &
        +k(914)*n(idx_HEj)*n(idx_C8) &
        +k(2690)*n(idx_C4Hj)*n(idx_C2H) &
        +k(2900)*n(idx_C5Hj)*n(idx_C) &
        -k(2905)*n(idx_C6j)*n(idx_H2) &
        +k(2988)*n(idx_C5H2j)*n(idx_C) &
        +k(3132)*n(idx_Cj)*n(idx_C5) &
        -k(3197)*n(idx_C6j)*n(idx_H2) &
        -k(3959)*n(idx_C6j)*n(idx_E) &
        -k(3960)*n(idx_C6j)*n(idx_E)

    !C2H3O+
    !C2H3O+
    dn(idx_C2H3Oj) = &
        +k(364)*n(idx_Cj)*n(idx_NH2CHO) &
        +k(370)*n(idx_Cj)*n(idx_C2H4O) &
        +k(579)*n(idx_Hj)*n(idx_C2H4O) &
        +k(878)*n(idx_HEj)*n(idx_C2H4O) &
        +k(919)*n(idx_HEj)*n(idx_C2H5OH) &
        +k(935)*n(idx_HEj)*n(idx_C2H6CO) &
        +k(1271)*n(idx_COj)*n(idx_CH4) &
        +k(1631)*n(idx_CH2j)*n(idx_H2CO) &
        +k(1801)*n(idx_H3j)*n(idx_C2H2O) &
        +k(1970)*n(idx_HCOj)*n(idx_C2H2O) &
        +k(2468)*n(idx_H3Oj)*n(idx_C2H2O) &
        +k(3168)*n(idx_CH3j)*n(idx_CO) &
        -k(3934)*n(idx_C2H3Oj)*n(idx_E) &
        -k(3935)*n(idx_C2H3Oj)*n(idx_E)

    !C2H5+
    !C2H5+
    dn(idx_C2H5j) = &
        +k(374)*n(idx_Cj)*n(idx_C2H5) &
        +k(582)*n(idx_Hj)*n(idx_C2H5) &
        +k(881)*n(idx_HEj)*n(idx_C2H5) &
        +k(921)*n(idx_HEj)*n(idx_C2H5OH) &
        +k(1635)*n(idx_CH2j)*n(idx_CH4) &
        +k(1826)*n(idx_H3j)*n(idx_C2H4) &
        +k(1855)*n(idx_H3j)*n(idx_C2H5OH) &
        +k(1992)*n(idx_HCOj)*n(idx_C2H4) &
        +k(2362)*n(idx_CH3j)*n(idx_CH4) &
        +k(2582)*n(idx_C2H3j)*n(idx_C2H4) &
        +k(2738)*n(idx_CH4j)*n(idx_C2H4) &
        +k(2782)*n(idx_C2H4j)*n(idx_C2H3) &
        -k(2940)*n(idx_C2H5j)*n(idx_C) &
        -k(2941)*n(idx_C2H5j)*n(idx_C) &
        -k(2942)*n(idx_C2H5j)*n(idx_C) &
        -k(2943)*n(idx_C2H5j)*n(idx_H) &
        -k(2944)*n(idx_C2H5j)*n(idx_O) &
        -k(2945)*n(idx_C2H5j)*n(idx_O) &
        -k(2946)*n(idx_C2H5j)*n(idx_H2O) &
        -k(2947)*n(idx_C2H5j)*n(idx_H2S) &
        -k(2948)*n(idx_C2H5j)*n(idx_HCN) &
        -k(2949)*n(idx_C2H5j)*n(idx_HNC) &
        -k(2950)*n(idx_C2H5j)*n(idx_C2H2) &
        -k(2951)*n(idx_C2H5j)*n(idx_C2H2) &
        -k(2952)*n(idx_C2H5j)*n(idx_C2H2) &
        -k(2953)*n(idx_C2H5j)*n(idx_H2CO) &
        -k(2954)*n(idx_C2H5j)*n(idx_NH3) &
        -k(2955)*n(idx_C2H5j)*n(idx_C2H4) &
        +k(3021)*n(idx_C2H6j)*n(idx_H) &
        -k(3199)*n(idx_C2H5j)*n(idx_H2O) &
        -k(4020)*n(idx_C2H5j)*n(idx_E) &
        -k(4021)*n(idx_C2H5j)*n(idx_E) &
        -k(4022)*n(idx_C2H5j)*n(idx_E) &
        -k(4023)*n(idx_C2H5j)*n(idx_E)

    !C3H3N+
    !C3H3N+
    dn(idx_C3H3Nj) = &
        +k(375)*n(idx_Cj)*n(idx_C3H3N) &
        +k(584)*n(idx_Hj)*n(idx_C3H3N) &
        +k(2961)*n(idx_C3H4j)*n(idx_N) &
        +k(3024)*n(idx_C3H5j)*n(idx_N) &
        -k(4024)*n(idx_C3H3Nj)*n(idx_E) &
        -k(4025)*n(idx_C3H3Nj)*n(idx_E)

    !C5H2+
    !C5H2+
    dn(idx_C5H2j) = &
        +k(382)*n(idx_Cj)*n(idx_C4H3) &
        +k(591)*n(idx_Hj)*n(idx_C5H2) &
        +k(930)*n(idx_HEj)*n(idx_CH3C4H) &
        +k(1829)*n(idx_H3j)*n(idx_C5H) &
        +k(1995)*n(idx_HCOj)*n(idx_C5H) &
        +k(2226)*n(idx_C2H2j)*n(idx_C3H) &
        +k(2227)*n(idx_C2H2j)*n(idx_HC3) &
        +k(2235)*n(idx_C2H2j)*n(idx_C3H2) &
        +k(2236)*n(idx_C2H2j)*n(idx_H2C3) &
        +k(2259)*n(idx_C2H2j)*n(idx_C5H2) &
        +k(2290)*n(idx_C3Hj)*n(idx_C2H2) &
        +k(2301)*n(idx_C3Hj)*n(idx_C4H2) &
        +k(2361)*n(idx_CH3j)*n(idx_C4H) &
        +k(2563)*n(idx_C2H3j)*n(idx_C3H) &
        +k(2564)*n(idx_C2H3j)*n(idx_HC3) &
        +k(2589)*n(idx_C2H3j)*n(idx_C5H) &
        +k(2626)*n(idx_C3H2j)*n(idx_C2H) &
        +k(2627)*n(idx_H2C3j)*n(idx_C2H) &
        +k(2788)*n(idx_C2H4j)*n(idx_C4H) &
        +k(2824)*n(idx_C3H3j)*n(idx_C2H) &
        +k(2825)*n(idx_H3C3j)*n(idx_C2H) &
        +k(2903)*n(idx_C5Hj)*n(idx_H2) &
        +k(2966)*n(idx_C4H3j)*n(idx_C) &
        -k(2988)*n(idx_C5H2j)*n(idx_C) &
        -k(2989)*n(idx_C5H2j)*n(idx_C) &
        -k(2990)*n(idx_C5H2j)*n(idx_N) &
        -k(2991)*n(idx_C5H2j)*n(idx_O) &
        -k(2992)*n(idx_C5H2j)*n(idx_C2H) &
        -k(2993)*n(idx_C5H2j)*n(idx_C2H2) &
        -k(2994)*n(idx_C5H2j)*n(idx_C2H2) &
        -k(2995)*n(idx_C5H2j)*n(idx_C3H) &
        -k(2996)*n(idx_C5H2j)*n(idx_HC3) &
        -k(2997)*n(idx_C5H2j)*n(idx_C2H3) &
        -k(2998)*n(idx_C5H2j)*n(idx_C2H3) &
        -k(2999)*n(idx_C5H2j)*n(idx_C3H2) &
        -k(3000)*n(idx_C5H2j)*n(idx_H2C3) &
        -k(3001)*n(idx_C5H2j)*n(idx_C3H2) &
        -k(3002)*n(idx_C5H2j)*n(idx_H2C3) &
        -k(3003)*n(idx_C5H2j)*n(idx_C4H) &
        -k(3004)*n(idx_C5H2j)*n(idx_CH4) &
        -k(3005)*n(idx_C5H2j)*n(idx_CH4) &
        -k(3006)*n(idx_C5H2j)*n(idx_C2H4) &
        -k(3007)*n(idx_C5H2j)*n(idx_C2H4) &
        -k(3008)*n(idx_C5H2j)*n(idx_C3H3) &
        -k(3009)*n(idx_C5H2j)*n(idx_C3H3) &
        -k(3010)*n(idx_C5H2j)*n(idx_C4H2) &
        -k(3011)*n(idx_C5H2j)*n(idx_C4H2) &
        -k(3012)*n(idx_C5H2j)*n(idx_C3H4) &
        -k(3203)*n(idx_C5H2j)*n(idx_C4H2) &
        -k(4036)*n(idx_C5H2j)*n(idx_E) &
        -k(4037)*n(idx_C5H2j)*n(idx_E)

    !C4H3+
    !C4H3+
    dn(idx_C4H3j) = &
        +k(384)*n(idx_Cj)*n(idx_C4H3) &
        +k(398)*n(idx_Cj)*n(idx_CH3C3N) &
        +k(588)*n(idx_Hj)*n(idx_C4H3) &
        +k(1828)*n(idx_H3j)*n(idx_C4H2) &
        +k(1994)*n(idx_HCOj)*n(idx_C4H2) &
        +k(2223)*n(idx_C2H2j)*n(idx_C2H2) &
        +k(2234)*n(idx_C2H2j)*n(idx_C2H3) &
        +k(2296)*n(idx_C3Hj)*n(idx_CH4) &
        +k(2359)*n(idx_CH3j)*n(idx_C3H2) &
        +k(2360)*n(idx_CH3j)*n(idx_H2C3) &
        +k(2483)*n(idx_H3Oj)*n(idx_C4H2) &
        +k(2555)*n(idx_C2H3j)*n(idx_C2H) &
        +k(2560)*n(idx_C2H3j)*n(idx_C2H2) &
        +k(2586)*n(idx_C2H3j)*n(idx_C4H2) &
        +k(2646)*n(idx_C3H2j)*n(idx_C2H4) &
        +k(2647)*n(idx_H2C3j)*n(idx_C2H4) &
        +k(2662)*n(idx_C3H2j)*n(idx_C3H4) &
        +k(2663)*n(idx_H2C3j)*n(idx_C3H4) &
        +k(2703)*n(idx_C4Hj)*n(idx_C2H4) &
        +k(2771)*n(idx_C2H4j)*n(idx_C2H) &
        +k(2784)*n(idx_C2H4j)*n(idx_C3H2) &
        +k(2785)*n(idx_C2H4j)*n(idx_H2C3) &
        +k(2795)*n(idx_C2H4j)*n(idx_C3H3) &
        +k(2957)*n(idx_C3H4j)*n(idx_C) &
        -k(2965)*n(idx_C4H3j)*n(idx_C) &
        -k(2966)*n(idx_C4H3j)*n(idx_C) &
        -k(2967)*n(idx_C4H3j)*n(idx_N) &
        -k(2968)*n(idx_C4H3j)*n(idx_O) &
        -k(2969)*n(idx_C4H3j)*n(idx_O) &
        -k(2970)*n(idx_C4H3j)*n(idx_S) &
        -k(2971)*n(idx_C4H3j)*n(idx_C2H) &
        -k(2972)*n(idx_C4H3j)*n(idx_C3H) &
        -k(2973)*n(idx_C4H3j)*n(idx_HC3) &
        -k(2974)*n(idx_C4H3j)*n(idx_C2H3) &
        -k(2975)*n(idx_C4H3j)*n(idx_C2H3) &
        -k(2976)*n(idx_C4H3j)*n(idx_C3H2) &
        -k(2977)*n(idx_C4H3j)*n(idx_H2C3) &
        -k(2978)*n(idx_C4H3j)*n(idx_C4H) &
        -k(2979)*n(idx_C4H3j)*n(idx_CH4) &
        -k(2980)*n(idx_C4H3j)*n(idx_C3H3) &
        -k(2981)*n(idx_C4H3j)*n(idx_C3H3) &
        -k(2982)*n(idx_C4H3j)*n(idx_C4H2) &
        -k(2983)*n(idx_C4H3j)*n(idx_C4H2) &
        -k(2984)*n(idx_C4H3j)*n(idx_C5H) &
        -k(2985)*n(idx_C4H3j)*n(idx_C3H4) &
        -k(2986)*n(idx_C4H3j)*n(idx_C5H2) &
        -k(2987)*n(idx_C4H3j)*n(idx_C5H2) &
        +k(3022)*n(idx_C3H5j)*n(idx_C) &
        +k(3191)*n(idx_C4H2j)*n(idx_H) &
        -k(3200)*n(idx_C4H3j)*n(idx_H) &
        -k(3201)*n(idx_C4H3j)*n(idx_C2H2) &
        -k(3202)*n(idx_C4H3j)*n(idx_C4H2) &
        -k(4034)*n(idx_C4H3j)*n(idx_E) &
        -k(4035)*n(idx_C4H3j)*n(idx_E)

    !C6H+
    !C6H+
    dn(idx_C6Hj) = &
        +k(388)*n(idx_Cj)*n(idx_C5H2) &
        +k(593)*n(idx_Hj)*n(idx_C6H) &
        +k(598)*n(idx_Hj)*n(idx_C6H2) &
        +k(910)*n(idx_HEj)*n(idx_C6H2) &
        +k(926)*n(idx_HEj)*n(idx_C8H) &
        +k(934)*n(idx_HEj)*n(idx_HC7N) &
        +k(936)*n(idx_HEj)*n(idx_C8H2) &
        +k(1831)*n(idx_H3j)*n(idx_C6) &
        +k(1997)*n(idx_HCOj)*n(idx_C6) &
        +k(2239)*n(idx_C2H2j)*n(idx_C4H) &
        +k(2691)*n(idx_C4Hj)*n(idx_C2H) &
        +k(2905)*n(idx_C6j)*n(idx_H2) &
        +k(2989)*n(idx_C5H2j)*n(idx_C) &
        -k(3014)*n(idx_C6Hj)*n(idx_C) &
        -k(3015)*n(idx_C6Hj)*n(idx_O) &
        -k(3016)*n(idx_C6Hj)*n(idx_H2) &
        +k(3030)*n(idx_C5H3j)*n(idx_C) &
        -k(4041)*n(idx_C6Hj)*n(idx_E) &
        -k(4042)*n(idx_C6Hj)*n(idx_E)

    !C7+
    !C7+
    dn(idx_C7j) = &
        +k(389)*n(idx_Cj)*n(idx_C6H) &
        +k(394)*n(idx_Cj)*n(idx_C6H2) &
        +k(594)*n(idx_Hj)*n(idx_C7) &
        +k(600)*n(idx_Hj)*n(idx_C7H) &
        +k(912)*n(idx_HEj)*n(idx_C7H) &
        +k(915)*n(idx_HEj)*n(idx_C8) &
        +k(924)*n(idx_HEj)*n(idx_C7H2) &
        +k(928)*n(idx_HEj)*n(idx_C9) &
        +k(2693)*n(idx_C4Hj)*n(idx_C3H) &
        +k(2694)*n(idx_C4Hj)*n(idx_HC3) &
        +k(3014)*n(idx_C6Hj)*n(idx_C) &
        -k(3017)*n(idx_C7j)*n(idx_H2) &
        +k(3034)*n(idx_C6H2j)*n(idx_C) &
        +k(3133)*n(idx_Cj)*n(idx_C6) &
        -k(4043)*n(idx_C7j)*n(idx_E) &
        -k(4044)*n(idx_C7j)*n(idx_E) &
        -k(4045)*n(idx_C7j)*n(idx_E)

    !CH4N+
    !CH4N+
    dn(idx_CH4Nj) = &
        +k(390)*n(idx_Cj)*n(idx_CH5N) &
        +k(595)*n(idx_Hj)*n(idx_CH5N) &
        +k(904)*n(idx_HEj)*n(idx_CH5N) &
        +k(1633)*n(idx_CH2j)*n(idx_NH3) &
        +k(1812)*n(idx_H3j)*n(idx_CH3N) &
        +k(1980)*n(idx_HCOj)*n(idx_CH3N) &
        +k(2345)*n(idx_CH3j)*n(idx_NH2) &
        +k(2354)*n(idx_CH3j)*n(idx_NH3) &
        -k(3963)*n(idx_CH4Nj)*n(idx_E) &
        -k(3964)*n(idx_CH4Nj)*n(idx_E) &
        -k(3965)*n(idx_CH4Nj)*n(idx_E) &
        -k(3966)*n(idx_CH4Nj)*n(idx_E)

    !C5HN+
    !C5HN+
    dn(idx_C5HNj) = &
        +k(393)*n(idx_Cj)*n(idx_HC5N) &
        +k(597)*n(idx_Hj)*n(idx_HC5N) &
        +k(1830)*n(idx_H3j)*n(idx_C5N) &
        +k(1996)*n(idx_HCOj)*n(idx_C5N) &
        +k(2904)*n(idx_C5Nj)*n(idx_H2) &
        +k(2990)*n(idx_C5H2j)*n(idx_N) &
        -k(3013)*n(idx_C5HNj)*n(idx_H2) &
        -k(4038)*n(idx_C5HNj)*n(idx_E) &
        -k(4039)*n(idx_C5HNj)*n(idx_E) &
        -k(4040)*n(idx_C5HNj)*n(idx_E)

    !C7H+
    !C7H+
    dn(idx_C7Hj) = &
        +k(395)*n(idx_Cj)*n(idx_C6H2) &
        +k(410)*n(idx_Cj)*n(idx_HC7N) &
        +k(601)*n(idx_Hj)*n(idx_C7H) &
        +k(607)*n(idx_Hj)*n(idx_C7H2) &
        +k(925)*n(idx_HEj)*n(idx_C7H2) &
        +k(939)*n(idx_HEj)*n(idx_C9H) &
        +k(943)*n(idx_HEj)*n(idx_C9H2) &
        +k(1845)*n(idx_H3j)*n(idx_C7) &
        +k(2007)*n(idx_HCOj)*n(idx_C7) &
        +k(2254)*n(idx_C2H2j)*n(idx_C5H) &
        +k(2640)*n(idx_C3H2j)*n(idx_C4H) &
        +k(2641)*n(idx_H2C3j)*n(idx_C4H) &
        +k(2695)*n(idx_C4Hj)*n(idx_C3H) &
        +k(2696)*n(idx_C4Hj)*n(idx_HC3) &
        +k(3017)*n(idx_C7j)*n(idx_H2) &
        +k(3035)*n(idx_C6H2j)*n(idx_C) &
        -k(3052)*n(idx_C7Hj)*n(idx_C) &
        -k(3053)*n(idx_C7Hj)*n(idx_N) &
        -k(3054)*n(idx_C7Hj)*n(idx_O) &
        -k(3055)*n(idx_C7Hj)*n(idx_H2) &
        +k(3062)*n(idx_C6H3j)*n(idx_C) &
        -k(4088)*n(idx_C7Hj)*n(idx_E) &
        -k(4089)*n(idx_C7Hj)*n(idx_E)

    !C8+
    !C8+
    dn(idx_C8j) = &
        +k(396)*n(idx_Cj)*n(idx_C7H) &
        +k(403)*n(idx_Cj)*n(idx_C7H2) &
        +k(602)*n(idx_Hj)*n(idx_C8) &
        +k(609)*n(idx_Hj)*n(idx_C8H) &
        +k(927)*n(idx_HEj)*n(idx_C8H) &
        +k(929)*n(idx_HEj)*n(idx_C9) &
        +k(937)*n(idx_HEj)*n(idx_C8H2) &
        +k(941)*n(idx_HEj)*n(idx_C9N) &
        +k(3052)*n(idx_C7Hj)*n(idx_C) &
        -k(3057)*n(idx_C8j)*n(idx_H2) &
        +k(3065)*n(idx_C7H2j)*n(idx_C) &
        +k(3134)*n(idx_Cj)*n(idx_C7) &
        -k(4091)*n(idx_C8j)*n(idx_E) &
        -k(4092)*n(idx_C8j)*n(idx_E)

    !COOCH4+
    !COOCH4+
    dn(idx_COOCH4j) = &
        +k(399)*n(idx_Cj)*n(idx_HCOOCH3) &
        +k(604)*n(idx_Hj)*n(idx_HCOOCH3) &
        -k(4095)*n(idx_COOCH4j)*n(idx_E) &
        -k(4096)*n(idx_COOCH4j)*n(idx_E)

    !C2H5O+
    !C2H5O+
    dn(idx_C2H5Oj) = &
        +k(401)*n(idx_Cj)*n(idx_C2H5OH) &
        +k(605)*n(idx_Hj)*n(idx_C2H5OH) &
        +k(614)*n(idx_Hj)*n(idx_CH3OCH3) &
        +k(922)*n(idx_HEj)*n(idx_C2H5OH) &
        +k(1528)*n(idx_S2j)*n(idx_C2H5OH) &
        +k(1530)*n(idx_S2j)*n(idx_CH3OCH3) &
        +k(1836)*n(idx_H3j)*n(idx_C2H4O) &
        +k(2000)*n(idx_HCOj)*n(idx_C2H4O) &
        +k(2425)*n(idx_H2COj)*n(idx_CH4) &
        +k(2486)*n(idx_H3Oj)*n(idx_C2H4O) &
        +k(3154)*n(idx_HCOj)*n(idx_CH4) &
        +k(3179)*n(idx_H3Oj)*n(idx_C2H2) &
        +k(3198)*n(idx_CH5j)*n(idx_CO) &
        -k(4067)*n(idx_C2H5Oj)*n(idx_E) &
        -k(4068)*n(idx_C2H5Oj)*n(idx_E) &
        -k(4069)*n(idx_C2H5Oj)*n(idx_E) &
        -k(4070)*n(idx_C2H5Oj)*n(idx_E)

    !C8H+
    !C8H+
    dn(idx_C8Hj) = &
        +k(404)*n(idx_Cj)*n(idx_C7H2) &
        +k(610)*n(idx_Hj)*n(idx_C8H) &
        +k(618)*n(idx_Hj)*n(idx_C8H2) &
        +k(938)*n(idx_HEj)*n(idx_C8H2) &
        +k(949)*n(idx_HEj)*n(idx_HC9N) &
        +k(1851)*n(idx_H3j)*n(idx_C8) &
        +k(2013)*n(idx_HCOj)*n(idx_C8) &
        +k(2262)*n(idx_C2H2j)*n(idx_C6H) &
        +k(2656)*n(idx_C3H2j)*n(idx_C5H) &
        +k(2657)*n(idx_H2C3j)*n(idx_C5H) &
        +k(2701)*n(idx_C4Hj)*n(idx_C4H) &
        +k(3057)*n(idx_C8j)*n(idx_H2) &
        +k(3066)*n(idx_C7H2j)*n(idx_C) &
        -k(3077)*n(idx_C8Hj)*n(idx_H2) &
        +k(3080)*n(idx_C7H3j)*n(idx_C) &
        -k(4120)*n(idx_C8Hj)*n(idx_E) &
        -k(4121)*n(idx_C8Hj)*n(idx_E)

    !C9+
    !C9+
    dn(idx_C9j) = &
        +k(405)*n(idx_Cj)*n(idx_C8H) &
        +k(412)*n(idx_Cj)*n(idx_C8H2) &
        +k(611)*n(idx_Hj)*n(idx_C9) &
        +k(620)*n(idx_Hj)*n(idx_C9H) &
        +k(940)*n(idx_HEj)*n(idx_C9H) &
        +k(944)*n(idx_HEj)*n(idx_C9H2) &
        -k(3078)*n(idx_C9j)*n(idx_H2) &
        +k(3084)*n(idx_C8H2j)*n(idx_C) &
        +k(3135)*n(idx_Cj)*n(idx_C8) &
        -k(4122)*n(idx_C9j)*n(idx_E) &
        -k(4123)*n(idx_C9j)*n(idx_E)

    !C5H3+
    !C5H3+
    dn(idx_C5H3j) = &
        +k(406)*n(idx_Cj)*n(idx_CH3C4H) &
        +k(612)*n(idx_Hj)*n(idx_CH3C4H) &
        +k(931)*n(idx_HEj)*n(idx_CH3C4H) &
        +k(1843)*n(idx_H3j)*n(idx_C5H2) &
        +k(2005)*n(idx_HCOj)*n(idx_C5H2) &
        +k(2237)*n(idx_C2H2j)*n(idx_C3H2) &
        +k(2238)*n(idx_C2H2j)*n(idx_H2C3) &
        +k(2249)*n(idx_C2H2j)*n(idx_C3H3) &
        +k(2299)*n(idx_C3Hj)*n(idx_C2H4) &
        +k(2378)*n(idx_CH3j)*n(idx_C4H2) &
        +k(2565)*n(idx_C2H3j)*n(idx_C3H) &
        +k(2566)*n(idx_C2H3j)*n(idx_HC3) &
        +k(2573)*n(idx_C2H3j)*n(idx_C3H2) &
        +k(2574)*n(idx_C2H3j)*n(idx_H2C3) &
        +k(2594)*n(idx_C2H3j)*n(idx_C5H2) &
        +k(2628)*n(idx_C3H2j)*n(idx_C2H2) &
        +k(2629)*n(idx_H2C3j)*n(idx_C2H2) &
        +k(2632)*n(idx_C3H2j)*n(idx_C2H3) &
        +k(2633)*n(idx_H2C3j)*n(idx_C2H3) &
        +k(2666)*n(idx_H2C3j)*n(idx_C3H4) &
        +k(2667)*n(idx_C3H2j)*n(idx_C3H4) &
        +k(2702)*n(idx_C4Hj)*n(idx_CH4) &
        +k(2797)*n(idx_C2H4j)*n(idx_C4H2) &
        +k(2826)*n(idx_C3H3j)*n(idx_C2H) &
        +k(2827)*n(idx_H3C3j)*n(idx_C2H) &
        +k(2828)*n(idx_C3H3j)*n(idx_C2H2) &
        +k(2829)*n(idx_H3C3j)*n(idx_C2H2) &
        -k(3030)*n(idx_C5H3j)*n(idx_C) &
        -k(3031)*n(idx_C5H3j)*n(idx_C) &
        -k(3032)*n(idx_C5H3j)*n(idx_N) &
        -k(3033)*n(idx_C5H3j)*n(idx_O) &
        +k(3167)*n(idx_C3Hj)*n(idx_C2H2) &
        -k(3204)*n(idx_C5H3j)*n(idx_C4H2) &
        -k(4083)*n(idx_C5H3j)*n(idx_E) &
        -k(4084)*n(idx_C5H3j)*n(idx_E)

    !C6H2+
    !C6H2+
    dn(idx_C6H2j) = &
        +k(407)*n(idx_Cj)*n(idx_CH3C4H) &
        +k(599)*n(idx_Hj)*n(idx_C6H2) &
        +k(1844)*n(idx_H3j)*n(idx_C6H) &
        +k(2006)*n(idx_HCOj)*n(idx_C6H) &
        +k(2240)*n(idx_C2H2j)*n(idx_C4H) &
        +k(2252)*n(idx_C2H2j)*n(idx_C4H2) &
        +k(2264)*n(idx_C2H2j)*n(idx_C6H2) &
        +k(2379)*n(idx_CH3j)*n(idx_C5H) &
        +k(2578)*n(idx_C2H3j)*n(idx_C4H) &
        +k(2597)*n(idx_C2H3j)*n(idx_C6H) &
        +k(2630)*n(idx_C3H2j)*n(idx_C3H) &
        +k(2631)*n(idx_H2C3j)*n(idx_HC3) &
        +k(2636)*n(idx_C3H2j)*n(idx_C3H2) &
        +k(2637)*n(idx_H2C3j)*n(idx_H2C3) &
        +k(2692)*n(idx_C4Hj)*n(idx_C2H2) &
        +k(2799)*n(idx_C2H4j)*n(idx_C5H) &
        +k(2830)*n(idx_C3H3j)*n(idx_C3H) &
        +k(2831)*n(idx_H3C3j)*n(idx_HC3) &
        +k(2880)*n(idx_C4H2j)*n(idx_C2H) &
        +k(2895)*n(idx_C4H2j)*n(idx_C4H2) &
        +k(3016)*n(idx_C6Hj)*n(idx_H2) &
        +k(3031)*n(idx_C5H3j)*n(idx_C) &
        -k(3034)*n(idx_C6H2j)*n(idx_C) &
        -k(3035)*n(idx_C6H2j)*n(idx_C) &
        -k(3036)*n(idx_C6H2j)*n(idx_O) &
        -k(3037)*n(idx_C6H2j)*n(idx_C2H) &
        -k(3038)*n(idx_C6H2j)*n(idx_HC3) &
        -k(3039)*n(idx_C6H2j)*n(idx_C3H) &
        -k(3040)*n(idx_C6H2j)*n(idx_C2H3) &
        -k(3041)*n(idx_C6H2j)*n(idx_C2H3) &
        -k(3042)*n(idx_C6H2j)*n(idx_C3H2) &
        -k(3043)*n(idx_C6H2j)*n(idx_H2C3) &
        -k(3044)*n(idx_C6H2j)*n(idx_C3H2) &
        -k(3045)*n(idx_C6H2j)*n(idx_H2C3) &
        -k(3046)*n(idx_C6H2j)*n(idx_CH4) &
        -k(3047)*n(idx_C6H2j)*n(idx_CH4) &
        -k(3048)*n(idx_C6H2j)*n(idx_C2H4) &
        -k(3049)*n(idx_C6H2j)*n(idx_C3H3) &
        -k(3050)*n(idx_C6H2j)*n(idx_C3H3) &
        -k(3051)*n(idx_C6H2j)*n(idx_C3H4) &
        +k(3197)*n(idx_C6j)*n(idx_H2) &
        -k(3205)*n(idx_C6H2j)*n(idx_C2H2) &
        -k(4085)*n(idx_C6H2j)*n(idx_E) &
        -k(4086)*n(idx_C6H2j)*n(idx_E) &
        -k(4087)*n(idx_C6H2j)*n(idx_E)

    !C6H3+
    !C6H3+
    dn(idx_C6H3j) = &
        +k(408)*n(idx_Cj)*n(idx_CH3C4H) &
        +k(415)*n(idx_Cj)*n(idx_CH3C5N) &
        +k(1848)*n(idx_H3j)*n(idx_C6H2) &
        +k(2010)*n(idx_HCOj)*n(idx_C6H2) &
        +k(2253)*n(idx_C2H2j)*n(idx_C4H2) &
        +k(2382)*n(idx_CH3j)*n(idx_C5H2) &
        +k(2579)*n(idx_C2H3j)*n(idx_C4H) &
        +k(2587)*n(idx_C2H3j)*n(idx_C4H2) &
        +k(2600)*n(idx_C2H3j)*n(idx_C6H2) &
        +k(2638)*n(idx_C3H2j)*n(idx_C3H2) &
        +k(2639)*n(idx_H2C3j)*n(idx_H2C3) &
        +k(2697)*n(idx_C4Hj)*n(idx_C2H3) &
        +k(2802)*n(idx_C2H4j)*n(idx_C5H2) &
        +k(2832)*n(idx_C3H3j)*n(idx_C3H) &
        +k(2833)*n(idx_H3C3j)*n(idx_HC3) &
        +k(2836)*n(idx_C3H3j)*n(idx_C3H2) &
        +k(2837)*n(idx_H3C3j)*n(idx_H2C3) &
        +k(2881)*n(idx_C4H2j)*n(idx_C2H2) &
        +k(2884)*n(idx_C4H2j)*n(idx_C2H3) &
        +k(2971)*n(idx_C4H3j)*n(idx_C2H) &
        +k(2982)*n(idx_C4H3j)*n(idx_C4H2) &
        -k(3062)*n(idx_C6H3j)*n(idx_C) &
        -k(3063)*n(idx_C6H3j)*n(idx_C) &
        -k(3064)*n(idx_C6H3j)*n(idx_O) &
        -k(4113)*n(idx_C6H3j)*n(idx_E) &
        -k(4114)*n(idx_C6H3j)*n(idx_E) &
        -k(4115)*n(idx_C6H3j)*n(idx_E)

    !C2H6CO+
    !C2H6CO+
    dn(idx_C2H6COj) = &
        +k(411)*n(idx_Cj)*n(idx_C2H6CO) &
        +k(617)*n(idx_Hj)*n(idx_C2H6CO) &
        -k(4134)*n(idx_C2H6COj)*n(idx_E) &
        -k(4135)*n(idx_C2H6COj)*n(idx_E)

    !C9H+
    !C9H+
    dn(idx_C9Hj) = &
        +k(413)*n(idx_Cj)*n(idx_C8H2) &
        +k(420)*n(idx_Cj)*n(idx_HC9N) &
        +k(621)*n(idx_Hj)*n(idx_C9H) &
        +k(623)*n(idx_Hj)*n(idx_C9H2) &
        +k(945)*n(idx_HEj)*n(idx_C9H2) &
        +k(1859)*n(idx_H3j)*n(idx_C9) &
        +k(2020)*n(idx_HCOj)*n(idx_C9) &
        +k(2267)*n(idx_C2H2j)*n(idx_C7H) &
        +k(2674)*n(idx_C3H2j)*n(idx_C6H) &
        +k(2675)*n(idx_H2C3j)*n(idx_C6H) &
        +k(2707)*n(idx_C4Hj)*n(idx_C5H) &
        +k(3078)*n(idx_C9j)*n(idx_H2) &
        +k(3085)*n(idx_C8H2j)*n(idx_C) &
        -k(3088)*n(idx_C9Hj)*n(idx_C) &
        -k(3089)*n(idx_C9Hj)*n(idx_N) &
        -k(3090)*n(idx_C9Hj)*n(idx_O) &
        -k(3091)*n(idx_C9Hj)*n(idx_H2) &
        +k(3099)*n(idx_C8H3j)*n(idx_C) &
        -k(4148)*n(idx_C9Hj)*n(idx_E) &
        -k(4149)*n(idx_C9Hj)*n(idx_E)

    !C10+
    !C10+
    dn(idx_C10j) = &
        +k(414)*n(idx_Cj)*n(idx_C9H) &
        +k(416)*n(idx_Cj)*n(idx_C9H2) &
        +k(3088)*n(idx_C9Hj)*n(idx_C) &
        +k(3102)*n(idx_C9H2j)*n(idx_C) &
        +k(3136)*n(idx_Cj)*n(idx_C9) &
        -k(4129)*n(idx_C10j)*n(idx_E) &
        -k(4130)*n(idx_C10j)*n(idx_E)

    !C7H3+
    !C7H3+
    dn(idx_C7H3j) = &
        +k(417)*n(idx_Cj)*n(idx_CH3C6H) &
        +k(625)*n(idx_Hj)*n(idx_CH3C6H) &
        +k(947)*n(idx_HEj)*n(idx_CH3C6H) &
        +k(1857)*n(idx_H3j)*n(idx_C7H2) &
        +k(2018)*n(idx_HCOj)*n(idx_C7H2) &
        +k(2261)*n(idx_C2H2j)*n(idx_C5H2) &
        +k(2384)*n(idx_CH3j)*n(idx_C6H2) &
        +k(2591)*n(idx_C2H3j)*n(idx_C5H) &
        +k(2595)*n(idx_C2H3j)*n(idx_C5H2) &
        +k(2606)*n(idx_C2H3j)*n(idx_C7H2) &
        +k(2654)*n(idx_C3H2j)*n(idx_C4H2) &
        +k(2655)*n(idx_H2C3j)*n(idx_C4H2) &
        +k(2705)*n(idx_C4Hj)*n(idx_C3H3) &
        +k(2806)*n(idx_C2H4j)*n(idx_C6H2) &
        +k(2842)*n(idx_C3H3j)*n(idx_C4H) &
        +k(2843)*n(idx_H3C3j)*n(idx_C4H) &
        +k(2852)*n(idx_C3H3j)*n(idx_C4H2) &
        +k(2853)*n(idx_H3C3j)*n(idx_C4H2) &
        +k(2886)*n(idx_C4H2j)*n(idx_C3H2) &
        +k(2887)*n(idx_C4H2j)*n(idx_H2C3) &
        +k(2893)*n(idx_C4H2j)*n(idx_C3H3) &
        +k(2972)*n(idx_C4H3j)*n(idx_C3H) &
        +k(2973)*n(idx_C4H3j)*n(idx_HC3) &
        +k(2994)*n(idx_C5H2j)*n(idx_C2H2) &
        +k(2997)*n(idx_C5H2j)*n(idx_C2H3) &
        +k(3010)*n(idx_C5H2j)*n(idx_C4H2) &
        -k(3080)*n(idx_C7H3j)*n(idx_C) &
        -k(3081)*n(idx_C7H3j)*n(idx_C) &
        -k(3082)*n(idx_C7H3j)*n(idx_N) &
        -k(3083)*n(idx_C7H3j)*n(idx_O) &
        -k(4144)*n(idx_C7H3j)*n(idx_E) &
        -k(4145)*n(idx_C7H3j)*n(idx_E)

    !C8H2+
    !C8H2+
    dn(idx_C8H2j) = &
        +k(418)*n(idx_Cj)*n(idx_CH3C6H) &
        +k(619)*n(idx_Hj)*n(idx_C8H2) &
        +k(1858)*n(idx_H3j)*n(idx_C8H) &
        +k(2019)*n(idx_HCOj)*n(idx_C8H) &
        +k(2263)*n(idx_C2H2j)*n(idx_C6H) &
        +k(2265)*n(idx_C2H2j)*n(idx_C6H2) &
        +k(2385)*n(idx_CH3j)*n(idx_C7H) &
        +k(2598)*n(idx_C2H3j)*n(idx_C6H) &
        +k(2658)*n(idx_C3H2j)*n(idx_C5H) &
        +k(2659)*n(idx_H2C3j)*n(idx_C5H) &
        +k(2670)*n(idx_C3H2j)*n(idx_C5H2) &
        +k(2671)*n(idx_H2C3j)*n(idx_C5H2) &
        +k(2706)*n(idx_C4Hj)*n(idx_C4H2) &
        +k(2808)*n(idx_C2H4j)*n(idx_C7H) &
        +k(2854)*n(idx_C3H3j)*n(idx_C5H) &
        +k(2855)*n(idx_H3C3j)*n(idx_C5H) &
        +k(2888)*n(idx_C4H2j)*n(idx_C4H) &
        +k(2896)*n(idx_C4H2j)*n(idx_C4H2) &
        +k(2995)*n(idx_C5H2j)*n(idx_C3H) &
        +k(2996)*n(idx_C5H2j)*n(idx_HC3) &
        +k(2999)*n(idx_C5H2j)*n(idx_C3H2) &
        +k(3000)*n(idx_C5H2j)*n(idx_H2C3) &
        +k(3037)*n(idx_C6H2j)*n(idx_C2H) &
        +k(3077)*n(idx_C8Hj)*n(idx_H2) &
        +k(3081)*n(idx_C7H3j)*n(idx_C) &
        -k(3084)*n(idx_C8H2j)*n(idx_C) &
        -k(3085)*n(idx_C8H2j)*n(idx_C) &
        -k(3086)*n(idx_C8H2j)*n(idx_O) &
        -k(3087)*n(idx_C8H2j)*n(idx_CH4) &
        -k(4146)*n(idx_C8H2j)*n(idx_E) &
        -k(4147)*n(idx_C8H2j)*n(idx_E)

    !C8H3+
    !C8H3+
    dn(idx_C8H3j) = &
        +k(419)*n(idx_Cj)*n(idx_CH3C7N) &
        +k(1864)*n(idx_H3j)*n(idx_C8H2) &
        +k(2025)*n(idx_HCOj)*n(idx_C8H2) &
        +k(2266)*n(idx_C2H2j)*n(idx_C6H2) &
        +k(2386)*n(idx_CH3j)*n(idx_C7H2) &
        +k(2599)*n(idx_C2H3j)*n(idx_C6H) &
        +k(2601)*n(idx_C2H3j)*n(idx_C6H2) &
        +k(2672)*n(idx_C3H2j)*n(idx_C5H2) &
        +k(2673)*n(idx_H2C3j)*n(idx_C5H2) &
        +k(2810)*n(idx_C2H4j)*n(idx_C7H2) &
        +k(2856)*n(idx_C3H3j)*n(idx_C5H) &
        +k(2857)*n(idx_H3C3j)*n(idx_C5H) &
        +k(2860)*n(idx_C3H3j)*n(idx_C5H2) &
        +k(2861)*n(idx_H3C3j)*n(idx_C5H2) &
        +k(2978)*n(idx_C4H3j)*n(idx_C4H) &
        +k(3001)*n(idx_C5H2j)*n(idx_C3H2) &
        +k(3002)*n(idx_C5H2j)*n(idx_H2C3) &
        +k(3008)*n(idx_C5H2j)*n(idx_C3H3) &
        +k(3040)*n(idx_C6H2j)*n(idx_C2H3) &
        -k(3099)*n(idx_C8H3j)*n(idx_C) &
        -k(3100)*n(idx_C8H3j)*n(idx_C) &
        -k(3101)*n(idx_C8H3j)*n(idx_O) &
        -k(4168)*n(idx_C8H3j)*n(idx_E) &
        -k(4169)*n(idx_C8H3j)*n(idx_E)

    !HCL+
    !HCL+
    dn(idx_HCLj) = &
        +k(421)*n(idx_CLj)*n(idx_H2) &
        +k(436)*n(idx_Hj)*n(idx_HCL) &
        -k(1332)*n(idx_HCLj)*n(idx_H2) &
        +k(1713)*n(idx_H3j)*n(idx_CL) &
        -k(3667)*n(idx_HCLj)*n(idx_E)

    !F+
    !F+
    dn(idx_Fj) = &
        -k(424)*n(idx_Fj)*n(idx_H2) &
        +k(648)*n(idx_HEj)*n(idx_HF)

    !HF+
    !HF+
    dn(idx_HFj) = &
        +k(424)*n(idx_Fj)*n(idx_H2) &
        -k(1333)*n(idx_HFj)*n(idx_H2) &
        -k(3668)*n(idx_HFj)*n(idx_E)

    !HS+
    !HS+
    dn(idx_HSj) = &
        +k(438)*n(idx_Hj)*n(idx_HS) &
        +k(485)*n(idx_Hj)*n(idx_OCS) &
        +k(700)*n(idx_HEj)*n(idx_H2S) &
        +k(772)*n(idx_HEj)*n(idx_H2S2) &
        +k(977)*n(idx_Nj)*n(idx_H2S) &
        +k(1024)*n(idx_Oj)*n(idx_H2S) &
        +k(1075)*n(idx_Sj)*n(idx_HCO) &
        +k(1161)*n(idx_CHj)*n(idx_S) &
        +k(1315)*n(idx_H2j)*n(idx_H2S) &
        -k(1336)*n(idx_HSj)*n(idx_C) &
        -k(1337)*n(idx_HSj)*n(idx_FE) &
        -k(1338)*n(idx_HSj)*n(idx_H) &
        -k(1339)*n(idx_HSj)*n(idx_MG) &
        -k(1340)*n(idx_HSj)*n(idx_N) &
        -k(1341)*n(idx_HSj)*n(idx_NA) &
        -k(1342)*n(idx_HSj)*n(idx_O) &
        -k(1343)*n(idx_HSj)*n(idx_O) &
        -k(1344)*n(idx_HSj)*n(idx_S) &
        -k(1345)*n(idx_HSj)*n(idx_SI) &
        -k(1346)*n(idx_HSj)*n(idx_CH) &
        -k(1347)*n(idx_HSj)*n(idx_NO) &
        -k(1348)*n(idx_HSj)*n(idx_H2O) &
        -k(1349)*n(idx_HSj)*n(idx_H2S) &
        -k(1350)*n(idx_HSj)*n(idx_H2S) &
        -k(1351)*n(idx_HSj)*n(idx_HCN) &
        -k(1352)*n(idx_HSj)*n(idx_HNC) &
        -k(1353)*n(idx_HSj)*n(idx_NH3) &
        -k(1354)*n(idx_HSj)*n(idx_NH3) &
        -k(1355)*n(idx_HSj)*n(idx_CH4) &
        +k(1380)*n(idx_N2j)*n(idx_H2S) &
        +k(1397)*n(idx_NHj)*n(idx_S) &
        +k(1472)*n(idx_OHj)*n(idx_S) &
        +k(1663)*n(idx_H2Oj)*n(idx_S) &
        +k(1698)*n(idx_H2Sj)*n(idx_H) &
        +k(1702)*n(idx_H2Sj)*n(idx_O) &
        +k(1721)*n(idx_H3j)*n(idx_S) &
        +k(1877)*n(idx_HCNj)*n(idx_S) &
        +k(1906)*n(idx_HCOj)*n(idx_S) &
        +k(2042)*n(idx_HNCj)*n(idx_S) &
        +k(2061)*n(idx_HNOj)*n(idx_S) &
        +k(2087)*n(idx_N2Hj)*n(idx_S) &
        +k(2115)*n(idx_NH2j)*n(idx_S) &
        +k(2133)*n(idx_NH2j)*n(idx_H2S) &
        +k(2151)*n(idx_O2Hj)*n(idx_S) &
        +k(2404)*n(idx_H2COj)*n(idx_S) &
        +k(2913)*n(idx_CH5j)*n(idx_S) &
        -k(3148)*n(idx_HSj)*n(idx_H2) &
        -k(3670)*n(idx_HSj)*n(idx_E)

    !NH+
    !NH+
    dn(idx_NHj) = &
        +k(441)*n(idx_Hj)*n(idx_NH) &
        +k(717)*n(idx_HEj)*n(idx_HNC) &
        +k(731)*n(idx_HEj)*n(idx_NH2) &
        +k(777)*n(idx_HEj)*n(idx_NH3) &
        +k(808)*n(idx_HEj)*n(idx_CH3N) &
        +k(835)*n(idx_HEj)*n(idx_HNC3) &
        +k(872)*n(idx_HEj)*n(idx_NH2CHO) &
        +k(962)*n(idx_Nj)*n(idx_H2) &
        +k(964)*n(idx_Nj)*n(idx_NH) &
        +k(980)*n(idx_Nj)*n(idx_HCO) &
        +k(1012)*n(idx_Oj)*n(idx_NH) &
        +k(1213)*n(idx_CNj)*n(idx_NH) &
        +k(1245)*n(idx_COj)*n(idx_NH) &
        +k(1285)*n(idx_H2j)*n(idx_N) &
        +k(1297)*n(idx_H2j)*n(idx_NH) &
        +k(1370)*n(idx_N2j)*n(idx_NH) &
        -k(1393)*n(idx_NHj)*n(idx_C) &
        -k(1394)*n(idx_NHj)*n(idx_N) &
        -k(1395)*n(idx_NHj)*n(idx_O) &
        -k(1396)*n(idx_NHj)*n(idx_S) &
        -k(1397)*n(idx_NHj)*n(idx_S) &
        -k(1398)*n(idx_NHj)*n(idx_S) &
        -k(1399)*n(idx_NHj)*n(idx_C2) &
        -k(1400)*n(idx_NHj)*n(idx_C2) &
        -k(1401)*n(idx_NHj)*n(idx_C2) &
        -k(1402)*n(idx_NHj)*n(idx_CH) &
        -k(1403)*n(idx_NHj)*n(idx_CN) &
        -k(1404)*n(idx_NHj)*n(idx_CO) &
        -k(1405)*n(idx_NHj)*n(idx_CO) &
        -k(1406)*n(idx_NHj)*n(idx_H2) &
        -k(1407)*n(idx_NHj)*n(idx_H2) &
        -k(1408)*n(idx_NHj)*n(idx_N2) &
        -k(1409)*n(idx_NHj)*n(idx_NH) &
        -k(1410)*n(idx_NHj)*n(idx_NO) &
        -k(1411)*n(idx_NHj)*n(idx_NO) &
        -k(1412)*n(idx_NHj)*n(idx_O2) &
        -k(1413)*n(idx_NHj)*n(idx_O2) &
        -k(1414)*n(idx_NHj)*n(idx_O2) &
        -k(1415)*n(idx_NHj)*n(idx_OH) &
        -k(1416)*n(idx_NHj)*n(idx_C2H) &
        -k(1417)*n(idx_NHj)*n(idx_CH2) &
        -k(1418)*n(idx_NHj)*n(idx_CO2) &
        -k(1419)*n(idx_NHj)*n(idx_CO2) &
        -k(1420)*n(idx_NHj)*n(idx_CO2) &
        -k(1421)*n(idx_NHj)*n(idx_H2O) &
        -k(1422)*n(idx_NHj)*n(idx_H2O) &
        -k(1423)*n(idx_NHj)*n(idx_H2O) &
        -k(1424)*n(idx_NHj)*n(idx_H2O) &
        -k(1425)*n(idx_NHj)*n(idx_H2O) &
        -k(1426)*n(idx_NHj)*n(idx_HCN) &
        -k(1427)*n(idx_NHj)*n(idx_HCO) &
        -k(1428)*n(idx_NHj)*n(idx_HNC) &
        -k(1429)*n(idx_NHj)*n(idx_NH2) &
        -k(1430)*n(idx_NHj)*n(idx_H2CO) &
        -k(1431)*n(idx_NHj)*n(idx_H2CO) &
        -k(1432)*n(idx_NHj)*n(idx_H2CO) &
        -k(1433)*n(idx_NHj)*n(idx_NH3) &
        -k(1434)*n(idx_NHj)*n(idx_NH3) &
        -k(3672)*n(idx_NHj)*n(idx_E) &
        +k(4272)*n(idx_NH)

    !OH+
    !OH+
    dn(idx_OHj) = &
        +k(445)*n(idx_Hj)*n(idx_OH) &
        +k(697)*n(idx_HEj)*n(idx_H2O) &
        +k(868)*n(idx_HEj)*n(idx_CH3OH) &
        +k(971)*n(idx_Nj)*n(idx_OH) &
        +k(1010)*n(idx_Oj)*n(idx_H2) &
        +k(1017)*n(idx_Oj)*n(idx_OH) &
        +k(1029)*n(idx_Oj)*n(idx_HCO) &
        +k(1219)*n(idx_CNj)*n(idx_OH) &
        +k(1249)*n(idx_COj)*n(idx_OH) &
        +k(1286)*n(idx_H2j)*n(idx_O) &
        +k(1303)*n(idx_H2j)*n(idx_OH) &
        +k(1373)*n(idx_N2j)*n(idx_OH) &
        +k(1395)*n(idx_NHj)*n(idx_O) &
        -k(1468)*n(idx_OHj)*n(idx_C) &
        -k(1469)*n(idx_OHj)*n(idx_N) &
        -k(1470)*n(idx_OHj)*n(idx_O) &
        -k(1471)*n(idx_OHj)*n(idx_S) &
        -k(1472)*n(idx_OHj)*n(idx_S) &
        -k(1473)*n(idx_OHj)*n(idx_S) &
        -k(1474)*n(idx_OHj)*n(idx_SI) &
        -k(1475)*n(idx_OHj)*n(idx_C2) &
        -k(1476)*n(idx_OHj)*n(idx_C2) &
        -k(1477)*n(idx_OHj)*n(idx_CH) &
        -k(1478)*n(idx_OHj)*n(idx_CH) &
        -k(1479)*n(idx_OHj)*n(idx_CN) &
        -k(1480)*n(idx_OHj)*n(idx_CO) &
        -k(1481)*n(idx_OHj)*n(idx_H2) &
        -k(1482)*n(idx_OHj)*n(idx_N2) &
        -k(1483)*n(idx_OHj)*n(idx_NH) &
        -k(1484)*n(idx_OHj)*n(idx_NO) &
        -k(1485)*n(idx_OHj)*n(idx_NO) &
        -k(1486)*n(idx_OHj)*n(idx_O2) &
        -k(1487)*n(idx_OHj)*n(idx_OH) &
        -k(1488)*n(idx_OHj)*n(idx_SIC) &
        -k(1489)*n(idx_OHj)*n(idx_SIH) &
        -k(1490)*n(idx_OHj)*n(idx_SIO) &
        -k(1491)*n(idx_OHj)*n(idx_C2H) &
        -k(1492)*n(idx_OHj)*n(idx_C2H) &
        -k(1493)*n(idx_OHj)*n(idx_CH2) &
        -k(1494)*n(idx_OHj)*n(idx_CH2) &
        -k(1495)*n(idx_OHj)*n(idx_CO2) &
        -k(1496)*n(idx_OHj)*n(idx_H2O) &
        -k(1497)*n(idx_OHj)*n(idx_H2O) &
        -k(1498)*n(idx_OHj)*n(idx_H2S) &
        -k(1499)*n(idx_OHj)*n(idx_H2S) &
        -k(1500)*n(idx_OHj)*n(idx_HCN) &
        -k(1501)*n(idx_OHj)*n(idx_HCO) &
        -k(1502)*n(idx_OHj)*n(idx_HCO) &
        -k(1503)*n(idx_OHj)*n(idx_HCO) &
        -k(1504)*n(idx_OHj)*n(idx_HNC) &
        -k(1505)*n(idx_OHj)*n(idx_NH2) &
        -k(1506)*n(idx_OHj)*n(idx_NH2) &
        -k(1507)*n(idx_OHj)*n(idx_H2CO) &
        -k(1508)*n(idx_OHj)*n(idx_H2CO) &
        -k(1509)*n(idx_OHj)*n(idx_NH3) &
        -k(1510)*n(idx_OHj)*n(idx_NH3) &
        -k(1511)*n(idx_OHj)*n(idx_CH4) &
        -k(1512)*n(idx_OHj)*n(idx_CH4) &
        +k(1719)*n(idx_H3j)*n(idx_O) &
        +k(2150)*n(idx_O2Hj)*n(idx_O) &
        -k(3676)*n(idx_OHj)*n(idx_E) &
        +k(4279)*n(idx_OH) &
        -k(4416)*n(idx_OHj)

    !PN+
    !PN+
    dn(idx_PNj) = &
        +k(447)*n(idx_Hj)*n(idx_PN) &
        -k(3678)*n(idx_PNj)*n(idx_E)

    !S2+
    !S2+
    dn(idx_S2j) = &
        +k(449)*n(idx_Hj)*n(idx_S2) &
        +k(724)*n(idx_HEj)*n(idx_HS2) &
        +k(1072)*n(idx_Sj)*n(idx_H2S) &
        +k(1077)*n(idx_Sj)*n(idx_OCS) &
        -k(1527)*n(idx_S2j)*n(idx_NO) &
        -k(1528)*n(idx_S2j)*n(idx_C2H5OH) &
        -k(1529)*n(idx_S2j)*n(idx_C2H5OH) &
        -k(1530)*n(idx_S2j)*n(idx_CH3OCH3) &
        +k(1560)*n(idx_SOj)*n(idx_H2S) &
        -k(3680)*n(idx_S2j)*n(idx_E)

    !SIH+
    !SIH+
    dn(idx_SIHj) = &
        +k(452)*n(idx_Hj)*n(idx_SIH) &
        +k(488)*n(idx_Hj)*n(idx_SIH2) &
        +k(741)*n(idx_HEj)*n(idx_SIH2) &
        +k(783)*n(idx_HEj)*n(idx_SICH2) &
        +k(785)*n(idx_HEj)*n(idx_SIH3) &
        +k(839)*n(idx_HEj)*n(idx_SIC2H2) &
        +k(845)*n(idx_HEj)*n(idx_SICH3) &
        +k(1067)*n(idx_Sj)*n(idx_SIH) &
        +k(1474)*n(idx_OHj)*n(idx_SI) &
        -k(1534)*n(idx_SIHj)*n(idx_C) &
        -k(1535)*n(idx_SIHj)*n(idx_H) &
        -k(1536)*n(idx_SIHj)*n(idx_N) &
        -k(1537)*n(idx_SIHj)*n(idx_O) &
        -k(1538)*n(idx_SIHj)*n(idx_NH3) &
        +k(1722)*n(idx_H3j)*n(idx_SI) &
        +k(1907)*n(idx_HCOj)*n(idx_SI) &
        +k(2430)*n(idx_H3Oj)*n(idx_SI) &
        +k(3142)*n(idx_SIj)*n(idx_H) &
        -k(3151)*n(idx_SIHj)*n(idx_H2) &
        -k(3682)*n(idx_SIHj)*n(idx_E) &
        -k(4417)*n(idx_SIHj)

    !SIO+
    !SIO+
    dn(idx_SIOj) = &
        +k(454)*n(idx_Hj)*n(idx_SIO) &
        +k(1100)*n(idx_SIj)*n(idx_OH) &
        +k(1532)*n(idx_SICj)*n(idx_O) &
        +k(1537)*n(idx_SIHj)*n(idx_O) &
        +k(1539)*n(idx_SINj)*n(idx_O) &
        -k(1540)*n(idx_SIOj)*n(idx_C) &
        -k(1541)*n(idx_SIOj)*n(idx_FE) &
        -k(1542)*n(idx_SIOj)*n(idx_MG) &
        -k(1543)*n(idx_SIOj)*n(idx_N) &
        -k(1544)*n(idx_SIOj)*n(idx_N) &
        -k(1545)*n(idx_SIOj)*n(idx_O) &
        -k(1546)*n(idx_SIOj)*n(idx_S) &
        -k(1547)*n(idx_SIOj)*n(idx_C2) &
        -k(1548)*n(idx_SIOj)*n(idx_CH) &
        -k(1549)*n(idx_SIOj)*n(idx_CO) &
        -k(1550)*n(idx_SIOj)*n(idx_H2) &
        -k(1551)*n(idx_SIOj)*n(idx_NO) &
        -k(1552)*n(idx_SIOj)*n(idx_CH2) &
        -k(1553)*n(idx_SIOj)*n(idx_HCO) &
        +k(3143)*n(idx_SIj)*n(idx_O) &
        -k(3684)*n(idx_SIOj)*n(idx_E)

    !H2O+
    !H2O+
    dn(idx_H2Oj) = &
        +k(467)*n(idx_Hj)*n(idx_H2O) &
        +k(698)*n(idx_HEj)*n(idx_H2O) &
        +k(976)*n(idx_Nj)*n(idx_H2O) &
        +k(1022)*n(idx_Oj)*n(idx_H2O) &
        +k(1256)*n(idx_COj)*n(idx_H2O) &
        +k(1304)*n(idx_H2j)*n(idx_OH) &
        +k(1312)*n(idx_H2j)*n(idx_H2O) &
        +k(1377)*n(idx_N2j)*n(idx_H2O) &
        +k(1415)*n(idx_NHj)*n(idx_OH) &
        +k(1421)*n(idx_NHj)*n(idx_H2O) &
        +k(1481)*n(idx_OHj)*n(idx_H2) &
        +k(1487)*n(idx_OHj)*n(idx_OH) &
        +k(1496)*n(idx_OHj)*n(idx_H2O) &
        +k(1501)*n(idx_OHj)*n(idx_HCO) &
        +k(1648)*n(idx_CO2j)*n(idx_H2O) &
        -k(1656)*n(idx_H2Oj)*n(idx_C) &
        -k(1657)*n(idx_H2Oj)*n(idx_FE) &
        -k(1658)*n(idx_H2Oj)*n(idx_MG) &
        -k(1659)*n(idx_H2Oj)*n(idx_N) &
        -k(1660)*n(idx_H2Oj)*n(idx_NA) &
        -k(1661)*n(idx_H2Oj)*n(idx_O) &
        -k(1662)*n(idx_H2Oj)*n(idx_S) &
        -k(1663)*n(idx_H2Oj)*n(idx_S) &
        -k(1664)*n(idx_H2Oj)*n(idx_S) &
        -k(1665)*n(idx_H2Oj)*n(idx_SI) &
        -k(1666)*n(idx_H2Oj)*n(idx_C2) &
        -k(1667)*n(idx_H2Oj)*n(idx_C2) &
        -k(1668)*n(idx_H2Oj)*n(idx_CH) &
        -k(1669)*n(idx_H2Oj)*n(idx_CH) &
        -k(1670)*n(idx_H2Oj)*n(idx_CO) &
        -k(1671)*n(idx_H2Oj)*n(idx_H2) &
        -k(1672)*n(idx_H2Oj)*n(idx_NH) &
        -k(1673)*n(idx_H2Oj)*n(idx_NO) &
        -k(1674)*n(idx_H2Oj)*n(idx_O2) &
        -k(1675)*n(idx_H2Oj)*n(idx_OH) &
        -k(1676)*n(idx_H2Oj)*n(idx_C2H) &
        -k(1677)*n(idx_H2Oj)*n(idx_C2H) &
        -k(1678)*n(idx_H2Oj)*n(idx_CH2) &
        -k(1679)*n(idx_H2Oj)*n(idx_CH2) &
        -k(1680)*n(idx_H2Oj)*n(idx_H2O) &
        -k(1681)*n(idx_H2Oj)*n(idx_H2S) &
        -k(1682)*n(idx_H2Oj)*n(idx_H2S) &
        -k(1683)*n(idx_H2Oj)*n(idx_H2S) &
        -k(1684)*n(idx_H2Oj)*n(idx_HCN) &
        -k(1685)*n(idx_H2Oj)*n(idx_HCO) &
        -k(1686)*n(idx_H2Oj)*n(idx_HCO) &
        -k(1687)*n(idx_H2Oj)*n(idx_HCO) &
        -k(1688)*n(idx_H2Oj)*n(idx_HNC) &
        -k(1689)*n(idx_H2Oj)*n(idx_NH2) &
        -k(1690)*n(idx_H2Oj)*n(idx_NH2) &
        -k(1691)*n(idx_H2Oj)*n(idx_H2CO) &
        -k(1692)*n(idx_H2Oj)*n(idx_H2CO) &
        -k(1693)*n(idx_H2Oj)*n(idx_NH3) &
        -k(1694)*n(idx_H2Oj)*n(idx_NH3) &
        -k(1695)*n(idx_H2Oj)*n(idx_CH4) &
        +k(1740)*n(idx_H3j)*n(idx_OH) &
        +k(1885)*n(idx_HCNj)*n(idx_OH) &
        +k(1889)*n(idx_HCNj)*n(idx_H2O) &
        +k(1917)*n(idx_HCOj)*n(idx_OH) &
        +k(2049)*n(idx_HNCj)*n(idx_OH) &
        +k(2067)*n(idx_HNOj)*n(idx_OH) &
        +k(2092)*n(idx_N2Hj)*n(idx_OH) &
        +k(2160)*n(idx_O2Hj)*n(idx_OH) &
        +k(2920)*n(idx_CH5j)*n(idx_OH) &
        -k(3710)*n(idx_H2Oj)*n(idx_E) &
        -k(3711)*n(idx_H2Oj)*n(idx_E) &
        -k(3712)*n(idx_H2Oj)*n(idx_E) &
        +k(4295)*n(idx_H2O)

    !HNSI+
    !HNSI+
    dn(idx_HNSIj) = &
        +k(480)*n(idx_Hj)*n(idx_HNSI) &
        +k(1747)*n(idx_H3j)*n(idx_SIN) &
        -k(2079)*n(idx_HNSIj)*n(idx_CO) &
        -k(2080)*n(idx_HNSIj)*n(idx_H2) &
        -k(2081)*n(idx_HNSIj)*n(idx_H2O) &
        +k(2179)*n(idx_SIH2j)*n(idx_N) &
        +k(2535)*n(idx_SIH3j)*n(idx_N) &
        -k(3728)*n(idx_HNSIj)*n(idx_E) &
        -k(3729)*n(idx_HNSIj)*n(idx_E)

    !S2H+
    !S2H+
    dn(idx_S2Hj) = &
        +k(482)*n(idx_Hj)*n(idx_HS2) &
        +k(773)*n(idx_HEj)*n(idx_H2S2) &
        +k(1073)*n(idx_Sj)*n(idx_H2S) &
        +k(1349)*n(idx_HSj)*n(idx_H2S) &
        +k(1744)*n(idx_H3j)*n(idx_S2) &
        +k(1922)*n(idx_HCOj)*n(idx_S2) &
        -k(2175)*n(idx_S2Hj)*n(idx_H2) &
        -k(2176)*n(idx_S2Hj)*n(idx_H2S) &
        +k(2435)*n(idx_H3Oj)*n(idx_S2) &
        -k(3754)*n(idx_S2Hj)*n(idx_E) &
        -k(3755)*n(idx_S2Hj)*n(idx_E)

    !PH2+
    !PH2+
    dn(idx_PH2j) = &
        +k(486)*n(idx_Hj)*n(idx_PH2) &
        +k(1741)*n(idx_H3j)*n(idx_PH) &
        +k(1919)*n(idx_HCOj)*n(idx_PH) &
        -k(2172)*n(idx_PH2j)*n(idx_C2H2) &
        -k(2173)*n(idx_PH2j)*n(idx_C2H4) &
        -k(2174)*n(idx_PH2j)*n(idx_C2H4) &
        +k(3140)*n(idx_Pj)*n(idx_H2) &
        -k(3752)*n(idx_PH2j)*n(idx_E) &
        -k(3753)*n(idx_PH2j)*n(idx_E)

    !H2CS+
    !H2CS+
    dn(idx_H2CSj) = &
        +k(503)*n(idx_Hj)*n(idx_H2CS) &
        +k(1081)*n(idx_Sj)*n(idx_CH3) &
        +k(1628)*n(idx_CH2j)*n(idx_OCS) &
        +k(1764)*n(idx_H3j)*n(idx_HCS) &
        +k(2330)*n(idx_CH3j)*n(idx_HS) &
        -k(3798)*n(idx_H2CSj)*n(idx_E) &
        -k(3799)*n(idx_H2CSj)*n(idx_E) &
        -k(4209)*n(idx_H2CSj)*n(idx_E)

    !H2S2+
    !H2S2+
    dn(idx_H2S2j) = &
        +k(504)*n(idx_Hj)*n(idx_H2S2) &
        +k(1529)*n(idx_S2j)*n(idx_C2H5OH) &
        +k(1770)*n(idx_H3j)*n(idx_HS2) &
        +k(1944)*n(idx_HCOj)*n(idx_HS2) &
        +k(2450)*n(idx_H3Oj)*n(idx_HS2) &
        -k(3806)*n(idx_H2S2j)*n(idx_E) &
        -k(3807)*n(idx_H2S2j)*n(idx_E)

    !HSIO+
    !HSIO+
    dn(idx_HSIOj) = &
        +k(505)*n(idx_Hj)*n(idx_H2SIO) &
        +k(774)*n(idx_HEj)*n(idx_H2SIO) &
        +k(1103)*n(idx_SIj)*n(idx_H2O) &
        +k(1490)*n(idx_OHj)*n(idx_SIO) &
        +k(1550)*n(idx_SIOj)*n(idx_H2) &
        +k(1748)*n(idx_H3j)*n(idx_SIO) &
        +k(1925)*n(idx_HCOj)*n(idx_SIO) &
        +k(2180)*n(idx_SIH2j)*n(idx_O) &
        +k(2182)*n(idx_SIH2j)*n(idx_O2) &
        +k(2438)*n(idx_H3Oj)*n(idx_SIO) &
        +k(2537)*n(idx_SIH3j)*n(idx_O) &
        -k(3735)*n(idx_HSIOj)*n(idx_E) &
        -k(3736)*n(idx_HSIOj)*n(idx_E)

    !C4P+
    !C4P+
    dn(idx_C4Pj) = &
        +k(526)*n(idx_Hj)*n(idx_C4P) &
        -k(3881)*n(idx_C4Pj)*n(idx_E) &
        -k(3882)*n(idx_C4Pj)*n(idx_E)

    !HCO2+
    !HCO2+
    dn(idx_HCO2j) = &
        +k(529)*n(idx_Hj)*n(idx_CH2O2) &
        +k(805)*n(idx_HEj)*n(idx_CH2O2) &
        +k(917)*n(idx_HEj)*n(idx_HCOOCH3) &
        +k(1311)*n(idx_H2j)*n(idx_CO2) &
        +k(1420)*n(idx_NHj)*n(idx_CO2) &
        +k(1495)*n(idx_OHj)*n(idx_CO2) &
        +k(1614)*n(idx_CH2j)*n(idx_O2) &
        +k(1645)*n(idx_CO2j)*n(idx_H2) &
        +k(1649)*n(idx_CO2j)*n(idx_H2O) &
        +k(1652)*n(idx_CO2j)*n(idx_CH4) &
        +k(1758)*n(idx_H3j)*n(idx_CO2) &
        +k(1888)*n(idx_HCNj)*n(idx_CO2) &
        +k(1918)*n(idx_HCOj)*n(idx_OH) &
        +k(2070)*n(idx_HNOj)*n(idx_CO2) &
        +k(2095)*n(idx_N2Hj)*n(idx_CO2) &
        +k(2163)*n(idx_O2Hj)*n(idx_CO2) &
        -k(2499)*n(idx_HCO2j)*n(idx_C) &
        -k(2500)*n(idx_HCO2j)*n(idx_O) &
        -k(2501)*n(idx_HCO2j)*n(idx_CO) &
        -k(2502)*n(idx_HCO2j)*n(idx_H2O) &
        -k(2503)*n(idx_HCO2j)*n(idx_C2H2) &
        -k(2504)*n(idx_HCO2j)*n(idx_NH3) &
        -k(2505)*n(idx_HCO2j)*n(idx_CH4) &
        -k(2506)*n(idx_HCO2j)*n(idx_CH3CN) &
        +k(2721)*n(idx_CH4j)*n(idx_CO2) &
        -k(3818)*n(idx_HCO2j)*n(idx_E) &
        -k(3819)*n(idx_HCO2j)*n(idx_E) &
        -k(3820)*n(idx_HCO2j)*n(idx_E)

    !PCH3+
    !PCH3+
    dn(idx_PCH3j) = &
        +k(531)*n(idx_Hj)*n(idx_CH2PH) &
        +k(1523)*n(idx_PHj)*n(idx_CH4) &
        -k(3915)*n(idx_PCH3j)*n(idx_E) &
        -k(3916)*n(idx_PCH3j)*n(idx_E) &
        -k(3917)*n(idx_PCH3j)*n(idx_E)

    !CH4+
    !CH4+
    dn(idx_CH4j) = &
        +k(534)*n(idx_Hj)*n(idx_CH4) &
        +k(816)*n(idx_HEj)*n(idx_CH4) &
        +k(997)*n(idx_Nj)*n(idx_CH4) &
        +k(1041)*n(idx_Oj)*n(idx_CH4) &
        +k(1270)*n(idx_COj)*n(idx_CH4) &
        +k(1327)*n(idx_H2j)*n(idx_CH4) &
        +k(1653)*n(idx_CO2j)*n(idx_CH4) &
        +k(1789)*n(idx_H3j)*n(idx_CH3) &
        +k(2344)*n(idx_CH3j)*n(idx_HCO) &
        -k(2716)*n(idx_CH4j)*n(idx_H) &
        -k(2717)*n(idx_CH4j)*n(idx_O) &
        -k(2718)*n(idx_CH4j)*n(idx_CO) &
        -k(2719)*n(idx_CH4j)*n(idx_H2) &
        -k(2720)*n(idx_CH4j)*n(idx_O2) &
        -k(2721)*n(idx_CH4j)*n(idx_CO2) &
        -k(2722)*n(idx_CH4j)*n(idx_H2O) &
        -k(2723)*n(idx_CH4j)*n(idx_H2S) &
        -k(2724)*n(idx_CH4j)*n(idx_H2S) &
        -k(2725)*n(idx_CH4j)*n(idx_OCS) &
        -k(2726)*n(idx_CH4j)*n(idx_OCS) &
        -k(2727)*n(idx_CH4j)*n(idx_C2H2) &
        -k(2728)*n(idx_CH4j)*n(idx_C2H2) &
        -k(2729)*n(idx_CH4j)*n(idx_C2H2) &
        -k(2730)*n(idx_CH4j)*n(idx_C2H2) &
        -k(2731)*n(idx_CH4j)*n(idx_H2CO) &
        -k(2732)*n(idx_CH4j)*n(idx_H2CO) &
        -k(2733)*n(idx_CH4j)*n(idx_NH3) &
        -k(2734)*n(idx_CH4j)*n(idx_NH3) &
        -k(2735)*n(idx_CH4j)*n(idx_NH3) &
        -k(2736)*n(idx_CH4j)*n(idx_CH4) &
        -k(2737)*n(idx_CH4j)*n(idx_C2H4) &
        -k(2738)*n(idx_CH4j)*n(idx_C2H4) &
        -k(2739)*n(idx_CH4j)*n(idx_CH3OH) &
        -k(2740)*n(idx_CH4j)*n(idx_CH3OH) &
        +k(2909)*n(idx_CH5j)*n(idx_H) &
        -k(3889)*n(idx_CH4j)*n(idx_E) &
        -k(3890)*n(idx_CH4j)*n(idx_E)

    !C2NH+
    !C2NH+
    dn(idx_C2NHj) = &
        +k(538)*n(idx_Hj)*n(idx_HCNC2) &
        +k(836)*n(idx_HEj)*n(idx_HNC3) &
        +k(1143)*n(idx_C2j)*n(idx_NH2) &
        +k(1183)*n(idx_CHj)*n(idx_HCN) &
        +k(1752)*n(idx_H3j)*n(idx_C2N) &
        +k(2194)*n(idx_C2H2j)*n(idx_N) &
        +k(2276)*n(idx_C3Hj)*n(idx_NO) &
        +k(2547)*n(idx_C2H3j)*n(idx_N) &
        -k(3774)*n(idx_C2NHj)*n(idx_E) &
        -k(3775)*n(idx_C2NHj)*n(idx_E)

    !SIH4+
    !SIH4+
    dn(idx_SIH4j) = &
        +k(559)*n(idx_Hj)*n(idx_SIH4) &
        +k(1799)*n(idx_H3j)*n(idx_SIH3) &
        -k(2752)*n(idx_SIH4j)*n(idx_C) &
        -k(2753)*n(idx_SIH4j)*n(idx_CO) &
        -k(2754)*n(idx_SIH4j)*n(idx_H2) &
        -k(2755)*n(idx_SIH4j)*n(idx_H2O) &
        -k(3928)*n(idx_SIH4j)*n(idx_E) &
        -k(3929)*n(idx_SIH4j)*n(idx_E)

    !NH4+
    !NH4+
    dn(idx_NH4j) = &
        +k(575)*n(idx_Hj)*n(idx_NH2CHO) &
        +k(1198)*n(idx_CHj)*n(idx_NH3) &
        +k(1354)*n(idx_HSj)*n(idx_NH3) &
        +k(1434)*n(idx_NHj)*n(idx_NH3) &
        +k(1510)*n(idx_OHj)*n(idx_NH3) &
        +k(1521)*n(idx_PHj)*n(idx_NH3) &
        +k(1538)*n(idx_SIHj)*n(idx_NH3) &
        +k(1587)*n(idx_C2Hj)*n(idx_NH3) &
        +k(1632)*n(idx_CH2j)*n(idx_NH3) &
        +k(1694)*n(idx_H2Oj)*n(idx_NH3) &
        +k(1711)*n(idx_H2Sj)*n(idx_NH3) &
        +k(1795)*n(idx_H3j)*n(idx_NH3) &
        +k(1966)*n(idx_HCOj)*n(idx_NH3) &
        +k(2039)*n(idx_HCSj)*n(idx_NH3) &
        +k(2077)*n(idx_HNOj)*n(idx_NH3) &
        +k(2103)*n(idx_N2Hj)*n(idx_NH3) &
        +k(2132)*n(idx_NH2j)*n(idx_H2O) &
        +k(2137)*n(idx_NH2j)*n(idx_H2S) &
        +k(2145)*n(idx_NH2j)*n(idx_NH3) &
        +k(2170)*n(idx_O2Hj)*n(idx_NH3) &
        +k(2230)*n(idx_C2H2j)*n(idx_NH3) &
        +k(2294)*n(idx_C3Hj)*n(idx_NH3) &
        +k(2353)*n(idx_CH3j)*n(idx_NH3) &
        +k(2398)*n(idx_HCNHj)*n(idx_NH3) &
        +k(2399)*n(idx_HCNHj)*n(idx_NH3) &
        +k(2423)*n(idx_H2COj)*n(idx_NH3) &
        +k(2466)*n(idx_H3Oj)*n(idx_NH3) &
        +k(2498)*n(idx_H3Sj)*n(idx_NH3) &
        +k(2504)*n(idx_HCO2j)*n(idx_NH3) &
        +k(2508)*n(idx_HSO2j)*n(idx_NH3) &
        +k(2516)*n(idx_NH3j)*n(idx_CH) &
        +k(2517)*n(idx_NH3j)*n(idx_H2) &
        +k(2518)*n(idx_NH3j)*n(idx_NH) &
        +k(2520)*n(idx_NH3j)*n(idx_OH) &
        +k(2522)*n(idx_NH3j)*n(idx_H2O) &
        +k(2523)*n(idx_NH3j)*n(idx_H2S) &
        +k(2525)*n(idx_NH3j)*n(idx_HCO) &
        +k(2526)*n(idx_NH3j)*n(idx_NH2) &
        +k(2527)*n(idx_NH3j)*n(idx_H2CO) &
        +k(2528)*n(idx_NH3j)*n(idx_NH3) &
        +k(2529)*n(idx_NH3j)*n(idx_CH4) &
        +k(2567)*n(idx_C2H3j)*n(idx_NH3) &
        +k(2734)*n(idx_CH4j)*n(idx_NH3) &
        +k(2745)*n(idx_H3COj)*n(idx_NH3) &
        -k(2746)*n(idx_NH4j)*n(idx_C) &
        -k(2747)*n(idx_NH4j)*n(idx_C) &
        +k(2780)*n(idx_C2H4j)*n(idx_NH3) &
        +k(2930)*n(idx_CH5j)*n(idx_NH3) &
        +k(2954)*n(idx_C2H5j)*n(idx_NH3) &
        -k(3905)*n(idx_NH4j)*n(idx_E) &
        -k(3906)*n(idx_NH4j)*n(idx_E) &
        -k(3907)*n(idx_NH4j)*n(idx_E) &
        -k(4245)*n(idx_NH4j)*n(idx_Hk)

    !H2NC+
    !H2NC+
    dn(idx_H2NCj) = &
        +k(577)*n(idx_Hj)*n(idx_NH2CHO) &
        +k(1196)*n(idx_CHj)*n(idx_NH3) &
        +k(1227)*n(idx_CNj)*n(idx_H2O) &
        +k(2121)*n(idx_NH2j)*n(idx_CN) &
        +k(2291)*n(idx_C3Hj)*n(idx_NH3) &
        +k(2316)*n(idx_CH3j)*n(idx_N) &
        -k(2426)*n(idx_H2NCj)*n(idx_SI) &
        +k(2747)*n(idx_NH4j)*n(idx_C) &
        -k(3800)*n(idx_H2NCj)*n(idx_E) &
        -k(3801)*n(idx_H2NCj)*n(idx_E)

    !C3H2N+
    !C3H2N+
    dn(idx_C3H2Nj) = &
        +k(583)*n(idx_Hj)*n(idx_C3H3N) &
        +k(1594)*n(idx_C2Nj)*n(idx_CH4) &
        +k(1816)*n(idx_H3j)*n(idx_HC3N) &
        +k(1817)*n(idx_H3j)*n(idx_HNC3) &
        +k(1983)*n(idx_HCOj)*n(idx_HC3N) &
        +k(1984)*n(idx_HCOj)*n(idx_HNC3) &
        +k(2107)*n(idx_N2Hj)*n(idx_HC3N) &
        +k(2108)*n(idx_N2Hj)*n(idx_HNC3) &
        +k(2215)*n(idx_C2H2j)*n(idx_HCN) &
        +k(2219)*n(idx_C2H2j)*n(idx_HNC) &
        +k(2478)*n(idx_H3Oj)*n(idx_HC3N) &
        +k(2479)*n(idx_H3Oj)*n(idx_HNC3) &
        +k(2581)*n(idx_C2H3j)*n(idx_HC3N) &
        +k(2683)*n(idx_C3HNj)*n(idx_H2) &
        +k(2712)*n(idx_C4Nj)*n(idx_H2O) &
        +k(2790)*n(idx_C2H4j)*n(idx_HC3N) &
        +k(2931)*n(idx_CH5j)*n(idx_HC3N) &
        +k(2960)*n(idx_C3H4j)*n(idx_N) &
        -k(3188)*n(idx_C3H2Nj)*n(idx_C2H2) &
        -k(3943)*n(idx_C3H2Nj)*n(idx_E) &
        -k(3944)*n(idx_C3H2Nj)*n(idx_E) &
        -k(3945)*n(idx_C3H2Nj)*n(idx_E) &
        -k(3946)*n(idx_C3H2Nj)*n(idx_E) &
        -k(3947)*n(idx_C3H2Nj)*n(idx_E)

    !C7H2+
    !C7H2+
    dn(idx_C7H2j) = &
        +k(608)*n(idx_Hj)*n(idx_C7H2) &
        +k(946)*n(idx_HEj)*n(idx_CH3C6H) &
        +k(1849)*n(idx_H3j)*n(idx_C7H) &
        +k(2011)*n(idx_HCOj)*n(idx_C7H) &
        +k(2255)*n(idx_C2H2j)*n(idx_C5H) &
        +k(2260)*n(idx_C2H2j)*n(idx_C5H2) &
        +k(2269)*n(idx_C2H2j)*n(idx_C7H2) &
        +k(2383)*n(idx_CH3j)*n(idx_C6H) &
        +k(2590)*n(idx_C2H3j)*n(idx_C5H) &
        +k(2603)*n(idx_C2H3j)*n(idx_C7H) &
        +k(2642)*n(idx_C3H2j)*n(idx_C4H) &
        +k(2643)*n(idx_H2C3j)*n(idx_C4H) &
        +k(2652)*n(idx_C3H2j)*n(idx_C4H2) &
        +k(2653)*n(idx_H2C3j)*n(idx_C4H2) &
        +k(2698)*n(idx_C4Hj)*n(idx_C3H2) &
        +k(2699)*n(idx_C4Hj)*n(idx_H2C3) &
        +k(2804)*n(idx_C2H4j)*n(idx_C6H) &
        +k(2840)*n(idx_C3H3j)*n(idx_C4H) &
        +k(2841)*n(idx_H3C3j)*n(idx_C4H) &
        +k(2882)*n(idx_C4H2j)*n(idx_C3H) &
        +k(2883)*n(idx_C4H2j)*n(idx_HC3) &
        +k(2992)*n(idx_C5H2j)*n(idx_C2H) &
        +k(2993)*n(idx_C5H2j)*n(idx_C2H2) &
        +k(3055)*n(idx_C7Hj)*n(idx_H2) &
        +k(3063)*n(idx_C6H3j)*n(idx_C) &
        -k(3065)*n(idx_C7H2j)*n(idx_C) &
        -k(3066)*n(idx_C7H2j)*n(idx_C) &
        -k(3067)*n(idx_C7H2j)*n(idx_N) &
        -k(3068)*n(idx_C7H2j)*n(idx_O) &
        -k(3069)*n(idx_C7H2j)*n(idx_C2H) &
        -k(3070)*n(idx_C7H2j)*n(idx_C2H2) &
        -k(3071)*n(idx_C7H2j)*n(idx_C2H2) &
        -k(3072)*n(idx_C7H2j)*n(idx_C2H3) &
        -k(3073)*n(idx_C7H2j)*n(idx_C2H3) &
        -k(3074)*n(idx_C7H2j)*n(idx_CH4) &
        -k(3075)*n(idx_C7H2j)*n(idx_C2H4) &
        -k(4116)*n(idx_C7H2j)*n(idx_E) &
        -k(4117)*n(idx_C7H2j)*n(idx_E)

    !C5H4+
    !C5H4+
    dn(idx_C5H4j) = &
        +k(613)*n(idx_Hj)*n(idx_CH3C4H) &
        +k(2250)*n(idx_C2H2j)*n(idx_C3H3) &
        +k(2257)*n(idx_C2H2j)*n(idx_C3H4) &
        +k(2575)*n(idx_C2H3j)*n(idx_C3H2) &
        +k(2576)*n(idx_C2H3j)*n(idx_H2C3) &
        +k(2584)*n(idx_C2H3j)*n(idx_C3H3) &
        +k(2634)*n(idx_C3H2j)*n(idx_C2H3) &
        +k(2635)*n(idx_H2C3j)*n(idx_C2H3) &
        +k(2777)*n(idx_C2H4j)*n(idx_C3H) &
        +k(2778)*n(idx_C2H4j)*n(idx_HC3) &
        +k(2834)*n(idx_C3H3j)*n(idx_C2H3) &
        +k(2835)*n(idx_H3C3j)*n(idx_C2H3) &
        +k(2889)*n(idx_C4H2j)*n(idx_CH4) &
        -k(3061)*n(idx_C5H4j)*n(idx_N) &
        -k(4111)*n(idx_C5H4j)*n(idx_E) &
        -k(4112)*n(idx_C5H4j)*n(idx_E)

    !C7HN+
    !C7HN+
    dn(idx_C7HNj) = &
        +k(616)*n(idx_Hj)*n(idx_HC7N) &
        +k(1850)*n(idx_H3j)*n(idx_C7N) &
        +k(2012)*n(idx_HCOj)*n(idx_C7N) &
        +k(3056)*n(idx_C7Nj)*n(idx_H2) &
        +k(3067)*n(idx_C7H2j)*n(idx_N) &
        -k(3076)*n(idx_C7HNj)*n(idx_H2) &
        -k(4118)*n(idx_C7HNj)*n(idx_E) &
        -k(4119)*n(idx_C7HNj)*n(idx_E)

    !C9H2+
    !C9H2+
    dn(idx_C9H2j) = &
        +k(624)*n(idx_Hj)*n(idx_C9H2) &
        +k(1865)*n(idx_H3j)*n(idx_C9H) &
        +k(2026)*n(idx_HCOj)*n(idx_C9H) &
        +k(2268)*n(idx_C2H2j)*n(idx_C7H) &
        +k(2270)*n(idx_C2H2j)*n(idx_C7H2) &
        +k(2387)*n(idx_CH3j)*n(idx_C8H) &
        +k(2604)*n(idx_C2H3j)*n(idx_C7H) &
        +k(2676)*n(idx_C3H2j)*n(idx_C6H) &
        +k(2677)*n(idx_H2C3j)*n(idx_C6H) &
        +k(2678)*n(idx_C3H2j)*n(idx_C6H2) &
        +k(2679)*n(idx_H2C3j)*n(idx_C6H2) &
        +k(2709)*n(idx_C4Hj)*n(idx_C5H2) &
        +k(2864)*n(idx_C3H3j)*n(idx_C6H) &
        +k(2865)*n(idx_H3C3j)*n(idx_C6H) &
        +k(2897)*n(idx_C4H2j)*n(idx_C5H) &
        +k(3003)*n(idx_C5H2j)*n(idx_C4H) &
        +k(3038)*n(idx_C6H2j)*n(idx_HC3) &
        +k(3039)*n(idx_C6H2j)*n(idx_C3H) &
        +k(3042)*n(idx_C6H2j)*n(idx_C3H2) &
        +k(3043)*n(idx_C6H2j)*n(idx_H2C3) &
        +k(3069)*n(idx_C7H2j)*n(idx_C2H) &
        +k(3070)*n(idx_C7H2j)*n(idx_C2H2) &
        +k(3091)*n(idx_C9Hj)*n(idx_H2) &
        +k(3100)*n(idx_C8H3j)*n(idx_C) &
        -k(3102)*n(idx_C9H2j)*n(idx_C) &
        -k(3103)*n(idx_C9H2j)*n(idx_N) &
        -k(3104)*n(idx_C9H2j)*n(idx_O) &
        -k(4170)*n(idx_C9H2j)*n(idx_E) &
        -k(4171)*n(idx_C9H2j)*n(idx_E)

    !C7H4+
    !C7H4+
    dn(idx_C7H4j) = &
        +k(626)*n(idx_Hj)*n(idx_CH3C6H) &
        +k(2596)*n(idx_C2H3j)*n(idx_C5H2) &
        +k(2708)*n(idx_C4Hj)*n(idx_C3H4) &
        +k(2800)*n(idx_C2H4j)*n(idx_C5H) &
        +k(2894)*n(idx_C4H2j)*n(idx_C3H3) &
        +k(2976)*n(idx_C4H3j)*n(idx_C3H2) &
        +k(2977)*n(idx_C4H3j)*n(idx_H2C3) &
        +k(2980)*n(idx_C4H3j)*n(idx_C3H3) &
        +k(2998)*n(idx_C5H2j)*n(idx_C2H3) &
        +k(3006)*n(idx_C5H2j)*n(idx_C2H4) &
        +k(3046)*n(idx_C6H2j)*n(idx_CH4) &
        -k(3098)*n(idx_C7H4j)*n(idx_N) &
        -k(4166)*n(idx_C7H4j)*n(idx_E) &
        -k(4167)*n(idx_C7H4j)*n(idx_E)

    !C9HN+
    !C9HN+
    dn(idx_C9HNj) = &
        +k(628)*n(idx_Hj)*n(idx_HC9N) &
        +k(1866)*n(idx_H3j)*n(idx_C9N) &
        +k(2027)*n(idx_HCOj)*n(idx_C9N) &
        +k(3092)*n(idx_C9Nj)*n(idx_H2) &
        +k(3103)*n(idx_C9H2j)*n(idx_N) &
        -k(3105)*n(idx_C9HNj)*n(idx_H2) &
        -k(4172)*n(idx_C9HNj)*n(idx_E) &
        -k(4173)*n(idx_C9HNj)*n(idx_E)

    !N2+
    !N2+
    dn(idx_N2j) = &
        +k(652)*n(idx_HEj)*n(idx_N2) &
        +k(727)*n(idx_HEj)*n(idx_N2O) &
        +k(963)*n(idx_Nj)*n(idx_NH) &
        +k(965)*n(idx_Nj)*n(idx_NO) &
        -k(1356)*n(idx_N2j)*n(idx_C) &
        -k(1357)*n(idx_N2j)*n(idx_FE) &
        -k(1358)*n(idx_N2j)*n(idx_H) &
        -k(1359)*n(idx_N2j)*n(idx_MG) &
        -k(1360)*n(idx_N2j)*n(idx_N) &
        -k(1361)*n(idx_N2j)*n(idx_NA) &
        -k(1362)*n(idx_N2j)*n(idx_O) &
        -k(1363)*n(idx_N2j)*n(idx_O) &
        -k(1364)*n(idx_N2j)*n(idx_S) &
        -k(1365)*n(idx_N2j)*n(idx_C2) &
        -k(1366)*n(idx_N2j)*n(idx_CH) &
        -k(1367)*n(idx_N2j)*n(idx_CN) &
        -k(1368)*n(idx_N2j)*n(idx_CO) &
        -k(1369)*n(idx_N2j)*n(idx_H2) &
        -k(1370)*n(idx_N2j)*n(idx_NH) &
        -k(1371)*n(idx_N2j)*n(idx_NO) &
        -k(1372)*n(idx_N2j)*n(idx_O2) &
        -k(1373)*n(idx_N2j)*n(idx_OH) &
        -k(1374)*n(idx_N2j)*n(idx_C2H) &
        -k(1375)*n(idx_N2j)*n(idx_CH2) &
        -k(1376)*n(idx_N2j)*n(idx_CO2) &
        -k(1377)*n(idx_N2j)*n(idx_H2O) &
        -k(1378)*n(idx_N2j)*n(idx_H2O) &
        -k(1379)*n(idx_N2j)*n(idx_H2S) &
        -k(1380)*n(idx_N2j)*n(idx_H2S) &
        -k(1381)*n(idx_N2j)*n(idx_H2S) &
        -k(1382)*n(idx_N2j)*n(idx_HCN) &
        -k(1383)*n(idx_N2j)*n(idx_HCO) &
        -k(1384)*n(idx_N2j)*n(idx_HCO) &
        -k(1385)*n(idx_N2j)*n(idx_NH2) &
        -k(1386)*n(idx_N2j)*n(idx_OCS) &
        -k(1387)*n(idx_N2j)*n(idx_OCS) &
        -k(1388)*n(idx_N2j)*n(idx_H2CO) &
        -k(1389)*n(idx_N2j)*n(idx_H2CO) &
        -k(1390)*n(idx_N2j)*n(idx_NH3) &
        -k(1391)*n(idx_N2j)*n(idx_CH4) &
        -k(1392)*n(idx_N2j)*n(idx_CH4) &
        +k(1394)*n(idx_NHj)*n(idx_N) &
        -k(3671)*n(idx_N2j)*n(idx_E)

    !CO2+
    !CO2+
    dn(idx_CO2j) = &
        +k(695)*n(idx_HEj)*n(idx_CO2) &
        +k(804)*n(idx_HEj)*n(idx_CH2O2) &
        +k(975)*n(idx_Nj)*n(idx_CO2) &
        +k(1223)*n(idx_CNj)*n(idx_CO2) &
        +k(1255)*n(idx_COj)*n(idx_CO2) &
        +k(1310)*n(idx_H2j)*n(idx_CO2) &
        +k(1376)*n(idx_N2j)*n(idx_CO2) &
        -k(1641)*n(idx_CO2j)*n(idx_H) &
        -k(1642)*n(idx_CO2j)*n(idx_H) &
        -k(1643)*n(idx_CO2j)*n(idx_O) &
        -k(1644)*n(idx_CO2j)*n(idx_O) &
        -k(1645)*n(idx_CO2j)*n(idx_H2) &
        -k(1646)*n(idx_CO2j)*n(idx_NO) &
        -k(1647)*n(idx_CO2j)*n(idx_O2) &
        -k(1648)*n(idx_CO2j)*n(idx_H2O) &
        -k(1649)*n(idx_CO2j)*n(idx_H2O) &
        -k(1650)*n(idx_CO2j)*n(idx_H2S) &
        -k(1651)*n(idx_CO2j)*n(idx_NH3) &
        -k(1652)*n(idx_CO2j)*n(idx_CH4) &
        -k(1653)*n(idx_CO2j)*n(idx_CH4) &
        -k(3705)*n(idx_CO2j)*n(idx_E)

    !HEH+
    !HEH+
    dn(idx_HEHj) = &
        +k(708)*n(idx_HEj)*n(idx_HCO) &
        -k(1334)*n(idx_HEHj)*n(idx_H) &
        -k(1335)*n(idx_HEHj)*n(idx_H2) &
        -k(3669)*n(idx_HEHj)*n(idx_E)

    !SO2+
    !SO2+
    dn(idx_SO2j) = &
        +k(747)*n(idx_HEj)*n(idx_SO2) &
        -k(2184)*n(idx_SO2j)*n(idx_CO) &
        -k(2185)*n(idx_SO2j)*n(idx_H2) &
        -k(2186)*n(idx_SO2j)*n(idx_O2) &
        -k(3112)*n(idx_SO2j)*n(idx_H) &
        -k(3762)*n(idx_SO2j)*n(idx_E)

    !C6H5+
    !C6H5+
    dn(idx_C6H5j) = &
        +k(950)*n(idx_HEj)*n(idx_C6H6) &
        +k(2668)*n(idx_C3H2j)*n(idx_C3H4) &
        +k(2669)*n(idx_H2C3j)*n(idx_C3H4) &
        +k(2850)*n(idx_C3H3j)*n(idx_C3H3) &
        +k(2851)*n(idx_H3C3j)*n(idx_C3H3) &
        +k(2858)*n(idx_C3H3j)*n(idx_C3H4) &
        +k(2859)*n(idx_H3C3j)*n(idx_C3H4) &
        +k(2892)*n(idx_C4H2j)*n(idx_C2H4) &
        +k(2975)*n(idx_C4H3j)*n(idx_C2H3) &
        +k(3005)*n(idx_C5H2j)*n(idx_CH4) &
        +k(3028)*n(idx_C4H4j)*n(idx_C2H2) &
        -k(3094)*n(idx_C6H5j)*n(idx_N) &
        -k(3095)*n(idx_C6H5j)*n(idx_C2H4) &
        -k(3096)*n(idx_C6H5j)*n(idx_O) &
        -k(3097)*n(idx_C6H5j)*n(idx_O2) &
        +k(3201)*n(idx_C4H3j)*n(idx_C2H2) &
        +k(3206)*n(idx_C6H4j)*n(idx_H) &
        -k(3207)*n(idx_C6H5j)*n(idx_H2) &
        -k(4162)*n(idx_C6H5j)*n(idx_E) &
        -k(4163)*n(idx_C6H5j)*n(idx_E)

    !C5H5+
    !C5H5+
    dn(idx_C5H5j) = &
        +k(951)*n(idx_HEj)*n(idx_C6H6) &
        +k(1860)*n(idx_H3j)*n(idx_CH3C4H) &
        +k(2021)*n(idx_HCOj)*n(idx_CH3C4H) &
        +k(2258)*n(idx_C2H2j)*n(idx_C3H4) &
        +k(2585)*n(idx_C2H3j)*n(idx_C3H3) &
        +k(2593)*n(idx_C2H3j)*n(idx_C3H4) &
        +k(2648)*n(idx_C3H2j)*n(idx_C2H4) &
        +k(2649)*n(idx_H2C3j)*n(idx_C2H4) &
        +k(2786)*n(idx_C2H4j)*n(idx_C3H2) &
        +k(2787)*n(idx_C2H4j)*n(idx_H2C3) &
        +k(2796)*n(idx_C2H4j)*n(idx_C3H3) &
        +k(2846)*n(idx_C3H3j)*n(idx_C2H4) &
        +k(2847)*n(idx_H3C3j)*n(idx_C2H4) &
        +k(2890)*n(idx_C4H2j)*n(idx_CH4) &
        +k(2963)*n(idx_C3H4j)*n(idx_C2H2) &
        +k(2979)*n(idx_C4H3j)*n(idx_CH4) &
        +k(2985)*n(idx_C4H3j)*n(idx_C3H4) &
        -k(3079)*n(idx_C5H5j)*n(idx_N) &
        +k(3096)*n(idx_C6H5j)*n(idx_O) &
        -k(4138)*n(idx_C5H5j)*n(idx_E) &
        -k(4139)*n(idx_C5H5j)*n(idx_E)

    !N2H+
    !N2H+
    dn(idx_N2Hj) = &
        +k(989)*n(idx_Nj)*n(idx_NH3) &
        +k(1296)*n(idx_H2j)*n(idx_N2) &
        +k(1369)*n(idx_N2j)*n(idx_H2) &
        +k(1378)*n(idx_N2j)*n(idx_H2O) &
        +k(1384)*n(idx_N2j)*n(idx_HCO) &
        +k(1408)*n(idx_NHj)*n(idx_N2) &
        +k(1411)*n(idx_NHj)*n(idx_NO) &
        +k(1482)*n(idx_OHj)*n(idx_N2) &
        +k(1734)*n(idx_H3j)*n(idx_N2) &
        +k(2084)*n(idx_HOCj)*n(idx_N2) &
        -k(2086)*n(idx_N2Hj)*n(idx_C) &
        -k(2087)*n(idx_N2Hj)*n(idx_S) &
        -k(2088)*n(idx_N2Hj)*n(idx_C2) &
        -k(2089)*n(idx_N2Hj)*n(idx_CH) &
        -k(2090)*n(idx_N2Hj)*n(idx_CO) &
        -k(2091)*n(idx_N2Hj)*n(idx_NH) &
        -k(2092)*n(idx_N2Hj)*n(idx_OH) &
        -k(2093)*n(idx_N2Hj)*n(idx_C2H) &
        -k(2094)*n(idx_N2Hj)*n(idx_CH2) &
        -k(2095)*n(idx_N2Hj)*n(idx_CO2) &
        -k(2096)*n(idx_N2Hj)*n(idx_H2O) &
        -k(2097)*n(idx_N2Hj)*n(idx_HCN) &
        -k(2098)*n(idx_N2Hj)*n(idx_HCO) &
        -k(2099)*n(idx_N2Hj)*n(idx_HNC) &
        -k(2100)*n(idx_N2Hj)*n(idx_NH2) &
        -k(2101)*n(idx_N2Hj)*n(idx_C2H2) &
        -k(2102)*n(idx_N2Hj)*n(idx_H2CO) &
        -k(2103)*n(idx_N2Hj)*n(idx_NH3) &
        -k(2104)*n(idx_N2Hj)*n(idx_CH4) &
        -k(2105)*n(idx_N2Hj)*n(idx_HCNC2) &
        -k(2106)*n(idx_N2Hj)*n(idx_HC2NC) &
        -k(2107)*n(idx_N2Hj)*n(idx_HC3N) &
        -k(2108)*n(idx_N2Hj)*n(idx_HNC3) &
        -k(2109)*n(idx_N2Hj)*n(idx_NH2CHO) &
        -k(2110)*n(idx_N2Hj)*n(idx_C6H6) &
        +k(2112)*n(idx_NH2j)*n(idx_N) &
        +k(2157)*n(idx_O2Hj)*n(idx_N2) &
        -k(3740)*n(idx_N2Hj)*n(idx_E) &
        -k(3741)*n(idx_N2Hj)*n(idx_E)

    !NO2+
    !NO2+
    dn(idx_NO2j) = &
        +k(1033)*n(idx_Oj)*n(idx_NO2) &
        +k(1453)*n(idx_O2j)*n(idx_NH) &
        +k(1461)*n(idx_O2j)*n(idx_NO2) &
        +k(2060)*n(idx_HNOj)*n(idx_O) &
        -k(2146)*n(idx_NO2j)*n(idx_H) &
        -k(2147)*n(idx_NO2j)*n(idx_H2) &
        +k(2149)*n(idx_O2Hj)*n(idx_N) &
        -k(3747)*n(idx_NO2j)*n(idx_E)

    !PC2H2+
    !PC2H2+
    dn(idx_PC2H2j) = &
        +k(1051)*n(idx_Pj)*n(idx_C2H2) &
        +k(1055)*n(idx_Pj)*n(idx_C2H4) &
        +k(1519)*n(idx_PHj)*n(idx_C2H2) &
        +k(1794)*n(idx_H3j)*n(idx_HCCP) &
        +k(1965)*n(idx_HCOj)*n(idx_HCCP) &
        +k(2172)*n(idx_PH2j)*n(idx_C2H2) &
        +k(2465)*n(idx_H3Oj)*n(idx_HCCP) &
        -k(3909)*n(idx_PC2H2j)*n(idx_E) &
        -k(3910)*n(idx_PC2H2j)*n(idx_E) &
        -k(3911)*n(idx_PC2H2j)*n(idx_E)

    !PNH2+
    !PNH2+
    dn(idx_PNH2j) = &
        +k(1053)*n(idx_Pj)*n(idx_NH3) &
        +k(1520)*n(idx_PHj)*n(idx_NH3) &
        -k(3839)*n(idx_PNH2j)*n(idx_E)

    !PCH2+
    !PCH2+
    dn(idx_PCH2j) = &
        +k(1054)*n(idx_Pj)*n(idx_CH4) &
        +k(1525)*n(idx_PHj)*n(idx_C2H4) &
        +k(1763)*n(idx_H3j)*n(idx_HCP) &
        +k(1938)*n(idx_HCOj)*n(idx_HCP) &
        +k(2036)*n(idx_HCPj)*n(idx_H2) &
        +k(2173)*n(idx_PH2j)*n(idx_C2H4) &
        +k(2321)*n(idx_CH3j)*n(idx_P) &
        +k(2446)*n(idx_H3Oj)*n(idx_HCP) &
        -k(3835)*n(idx_PCH2j)*n(idx_E) &
        -k(3836)*n(idx_PCH2j)*n(idx_E)

    !HC2S+
    !HC2S+
    dn(idx_HC2Sj) = &
        +k(1078)*n(idx_Sj)*n(idx_C2H2) &
        +k(1085)*n(idx_Sj)*n(idx_C2H3) &
        +k(1753)*n(idx_H3j)*n(idx_C2S) &
        +k(1929)*n(idx_HCOj)*n(idx_C2S) &
        +k(2439)*n(idx_H3Oj)*n(idx_C2S) &
        +k(2550)*n(idx_C2H3j)*n(idx_S) &
        +k(2766)*n(idx_C2H4j)*n(idx_S) &
        -k(3816)*n(idx_HC2Sj)*n(idx_E) &
        -k(3817)*n(idx_HC2Sj)*n(idx_E)

    !HC3S+
    !HC3S+
    dn(idx_HC3Sj) = &
        +k(1086)*n(idx_Sj)*n(idx_C3H2) &
        +k(1087)*n(idx_Sj)*n(idx_H2C3) &
        +k(1787)*n(idx_H3j)*n(idx_C3S) &
        +k(1959)*n(idx_HCOj)*n(idx_C3S) &
        +k(2286)*n(idx_C3Hj)*n(idx_H2S) &
        +k(2289)*n(idx_C3Hj)*n(idx_OCS) &
        +k(2460)*n(idx_H3Oj)*n(idx_C3S) &
        +k(2620)*n(idx_C3H2j)*n(idx_S) &
        +k(2621)*n(idx_H2C3j)*n(idx_S) &
        +k(2818)*n(idx_C3H3j)*n(idx_S) &
        +k(2819)*n(idx_H3C3j)*n(idx_S) &
        -k(3903)*n(idx_HC3Sj)*n(idx_E) &
        -k(3904)*n(idx_HC3Sj)*n(idx_E)

    !H3CS+
    !H3CS+
    dn(idx_H3CSj) = &
        +k(1089)*n(idx_Sj)*n(idx_CH4) &
        +k(1355)*n(idx_HSj)*n(idx_CH4) &
        +k(1622)*n(idx_CH2j)*n(idx_H2S) &
        +k(1791)*n(idx_H3j)*n(idx_H2CS) &
        +k(1962)*n(idx_HCOj)*n(idx_H2CS) &
        +k(2342)*n(idx_CH3j)*n(idx_H2S) &
        +k(2346)*n(idx_CH3j)*n(idx_OCS) &
        -k(3894)*n(idx_H3CSj)*n(idx_E) &
        -k(3895)*n(idx_H3CSj)*n(idx_E)

    !HC4S+
    !HC4S+
    dn(idx_HC4Sj) = &
        +k(1094)*n(idx_Sj)*n(idx_C4H2) &
        +k(1807)*n(idx_H3j)*n(idx_C4S) &
        +k(1976)*n(idx_HCOj)*n(idx_C4S) &
        +k(2474)*n(idx_H3Oj)*n(idx_C4S) &
        +k(2877)*n(idx_C4H2j)*n(idx_S) &
        +k(2970)*n(idx_C4H3j)*n(idx_S) &
        -k(3989)*n(idx_HC4Sj)*n(idx_E) &
        -k(3990)*n(idx_HC4Sj)*n(idx_E) &
        -k(3991)*n(idx_HC4Sj)*n(idx_E)

    !SIF+
    !SIF+
    dn(idx_SIFj) = &
        +k(1101)*n(idx_SIj)*n(idx_HF) &
        -k(3686)*n(idx_SIFj)*n(idx_E)

    !SINH2+
    !SINH2+
    dn(idx_SINH2j) = &
        +k(1112)*n(idx_SIj)*n(idx_NH3) &
        +k(1768)*n(idx_H3j)*n(idx_HNSI) &
        +k(1942)*n(idx_HCOj)*n(idx_HNSI) &
        +k(2080)*n(idx_HNSIj)*n(idx_H2) &
        +k(2449)*n(idx_H3Oj)*n(idx_HNSI) &
        +k(2536)*n(idx_SIH3j)*n(idx_N) &
        -k(2541)*n(idx_SINH2j)*n(idx_C) &
        -k(2542)*n(idx_SINH2j)*n(idx_C) &
        -k(3848)*n(idx_SINH2j)*n(idx_E) &
        -k(3849)*n(idx_SINH2j)*n(idx_E)

    !SIC2H3+
    !SIC2H3+
    dn(idx_SIC2H3j) = &
        +k(1117)*n(idx_SIj)*n(idx_C2H4) &
        +k(1819)*n(idx_H3j)*n(idx_SIC2H2) &
        +k(1986)*n(idx_HCOj)*n(idx_SIC2H2) &
        +k(2768)*n(idx_C2H4j)*n(idx_SI) &
        -k(2934)*n(idx_SIC2H3j)*n(idx_C) &
        +k(2936)*n(idx_SICH4j)*n(idx_C) &
        +k(3181)*n(idx_SIC2Hj)*n(idx_H2) &
        -k(4005)*n(idx_SIC2H3j)*n(idx_E) &
        -k(4006)*n(idx_SIC2H3j)*n(idx_E)

    !SIC3H2+
    !SIC3H2+
    dn(idx_SIC3H2j) = &
        +k(1118)*n(idx_SIj)*n(idx_C3H3) &
        +k(1120)*n(idx_SIj)*n(idx_C3H4) &
        +k(1820)*n(idx_H3j)*n(idx_SIC3H) &
        +k(1987)*n(idx_HCOj)*n(idx_SIC3H) &
        +k(2822)*n(idx_C3H3j)*n(idx_SI) &
        +k(2823)*n(idx_H3C3j)*n(idx_SI) &
        +k(2934)*n(idx_SIC2H3j)*n(idx_C) &
        -k(2935)*n(idx_SIC3H2j)*n(idx_C) &
        -k(4007)*n(idx_SIC3H2j)*n(idx_E) &
        -k(4008)*n(idx_SIC3H2j)*n(idx_E)

    !C2HO+
    !C2HO+
    dn(idx_C2HOj) = &
        +k(1137)*n(idx_C2j)*n(idx_H2O) &
        +k(1575)*n(idx_C2Hj)*n(idx_CO2) &
        +k(1755)*n(idx_H3j)*n(idx_CCO) &
        +k(1931)*n(idx_HCOj)*n(idx_CCO) &
        +k(2198)*n(idx_C2H2j)*n(idx_O) &
        +k(2278)*n(idx_C3Hj)*n(idx_O2) &
        +k(2441)*n(idx_H3Oj)*n(idx_CCO) &
        -k(3768)*n(idx_C2HOj)*n(idx_E) &
        -k(3769)*n(idx_C2HOj)*n(idx_E) &
        -k(3770)*n(idx_C2HOj)*n(idx_E) &
        -k(3771)*n(idx_C2HOj)*n(idx_E)

    !H3O+
    !H3O+
    dn(idx_H3Oj) = &
        +k(1179)*n(idx_CHj)*n(idx_H2O) &
        +k(1313)*n(idx_H2j)*n(idx_H2O) &
        +k(1348)*n(idx_HSj)*n(idx_H2O) &
        +k(1424)*n(idx_NHj)*n(idx_H2O) &
        +k(1497)*n(idx_OHj)*n(idx_H2O) &
        +k(1511)*n(idx_OHj)*n(idx_CH4) &
        +k(1517)*n(idx_PHj)*n(idx_H2O) &
        +k(1655)*n(idx_H2CLj)*n(idx_H2O) &
        +k(1671)*n(idx_H2Oj)*n(idx_H2) &
        +k(1672)*n(idx_H2Oj)*n(idx_NH) &
        +k(1675)*n(idx_H2Oj)*n(idx_OH) &
        +k(1680)*n(idx_H2Oj)*n(idx_H2O) &
        +k(1682)*n(idx_H2Oj)*n(idx_H2S) &
        +k(1687)*n(idx_H2Oj)*n(idx_HCO) &
        +k(1695)*n(idx_H2Oj)*n(idx_CH4) &
        +k(1707)*n(idx_H2Sj)*n(idx_H2O) &
        +k(1759)*n(idx_H3j)*n(idx_H2O) &
        +k(1810)*n(idx_H3j)*n(idx_CH2O2) &
        +k(1854)*n(idx_H3j)*n(idx_C2H5OH) &
        +k(1890)*n(idx_HCNj)*n(idx_H2O) &
        +k(1934)*n(idx_HCOj)*n(idx_H2O) &
        +k(2016)*n(idx_HCOj)*n(idx_C2H5OH) &
        +k(2052)*n(idx_HNCj)*n(idx_H2O) &
        +k(2071)*n(idx_HNOj)*n(idx_H2O) &
        +k(2081)*n(idx_HNSIj)*n(idx_H2O) &
        +k(2085)*n(idx_HPOj)*n(idx_H2O) &
        +k(2096)*n(idx_N2Hj)*n(idx_H2O) &
        +k(2130)*n(idx_NH2j)*n(idx_H2O) &
        +k(2164)*n(idx_O2Hj)*n(idx_H2O) &
        +k(2415)*n(idx_H2COj)*n(idx_H2O) &
        -k(2427)*n(idx_H3Oj)*n(idx_C) &
        -k(2428)*n(idx_H3Oj)*n(idx_NA) &
        -k(2429)*n(idx_H3Oj)*n(idx_P) &
        -k(2430)*n(idx_H3Oj)*n(idx_SI) &
        -k(2431)*n(idx_H3Oj)*n(idx_CH) &
        -k(2432)*n(idx_H3Oj)*n(idx_CP) &
        -k(2433)*n(idx_H3Oj)*n(idx_CS) &
        -k(2434)*n(idx_H3Oj)*n(idx_PN) &
        -k(2435)*n(idx_H3Oj)*n(idx_S2) &
        -k(2436)*n(idx_H3Oj)*n(idx_SIC) &
        -k(2437)*n(idx_H3Oj)*n(idx_SIH) &
        -k(2438)*n(idx_H3Oj)*n(idx_SIO) &
        -k(2439)*n(idx_H3Oj)*n(idx_C2S) &
        -k(2440)*n(idx_H3Oj)*n(idx_C3) &
        -k(2441)*n(idx_H3Oj)*n(idx_CCO) &
        -k(2442)*n(idx_H3Oj)*n(idx_CCP) &
        -k(2443)*n(idx_H3Oj)*n(idx_CH2) &
        -k(2444)*n(idx_H3Oj)*n(idx_H2S) &
        -k(2445)*n(idx_H3Oj)*n(idx_HCN) &
        -k(2446)*n(idx_H3Oj)*n(idx_HCP) &
        -k(2447)*n(idx_H3Oj)*n(idx_HCSI) &
        -k(2448)*n(idx_H3Oj)*n(idx_HNC) &
        -k(2449)*n(idx_H3Oj)*n(idx_HNSI) &
        -k(2450)*n(idx_H3Oj)*n(idx_HS2) &
        -k(2451)*n(idx_H3Oj)*n(idx_NH2) &
        -k(2452)*n(idx_H3Oj)*n(idx_SIC2) &
        -k(2453)*n(idx_H3Oj)*n(idx_SIH2) &
        -k(2454)*n(idx_H3Oj)*n(idx_SINC) &
        -k(2455)*n(idx_H3Oj)*n(idx_C3H) &
        -k(2456)*n(idx_H3Oj)*n(idx_HC3) &
        -k(2457)*n(idx_H3Oj)*n(idx_C3N) &
        -k(2458)*n(idx_H3Oj)*n(idx_C3O) &
        -k(2459)*n(idx_H3Oj)*n(idx_C3P) &
        -k(2460)*n(idx_H3Oj)*n(idx_C3S) &
        -k(2461)*n(idx_H3Oj)*n(idx_C4) &
        -k(2462)*n(idx_H3Oj)*n(idx_H2CO) &
        -k(2463)*n(idx_H3Oj)*n(idx_H2S2) &
        -k(2464)*n(idx_H3Oj)*n(idx_H2SIO) &
        -k(2465)*n(idx_H3Oj)*n(idx_HCCP) &
        -k(2466)*n(idx_H3Oj)*n(idx_NH3) &
        -k(2467)*n(idx_H3Oj)*n(idx_SIC2H) &
        -k(2468)*n(idx_H3Oj)*n(idx_C2H2O) &
        -k(2469)*n(idx_H3Oj)*n(idx_C2H3) &
        -k(2470)*n(idx_H3Oj)*n(idx_C3H2) &
        -k(2471)*n(idx_H3Oj)*n(idx_H2C3) &
        -k(2472)*n(idx_H3Oj)*n(idx_C4H) &
        -k(2473)*n(idx_H3Oj)*n(idx_C4P) &
        -k(2474)*n(idx_H3Oj)*n(idx_C4S) &
        -k(2475)*n(idx_H3Oj)*n(idx_CH2PH) &
        -k(2476)*n(idx_H3Oj)*n(idx_HCNC2) &
        -k(2477)*n(idx_H3Oj)*n(idx_HC2NC) &
        -k(2478)*n(idx_H3Oj)*n(idx_HC3N) &
        -k(2479)*n(idx_H3Oj)*n(idx_HNC3) &
        -k(2480)*n(idx_H3Oj)*n(idx_SICH3) &
        -k(2481)*n(idx_H3Oj)*n(idx_CH3CN) &
        -k(2482)*n(idx_H3Oj)*n(idx_C3H3) &
        -k(2483)*n(idx_H3Oj)*n(idx_C4H2) &
        -k(2484)*n(idx_H3Oj)*n(idx_CH3OH) &
        -k(2485)*n(idx_H3Oj)*n(idx_NH2CHO) &
        -k(2486)*n(idx_H3Oj)*n(idx_C2H4O) &
        -k(2487)*n(idx_H3Oj)*n(idx_C3H4) &
        -k(2488)*n(idx_H3Oj)*n(idx_C4H3) &
        -k(2489)*n(idx_H3Oj)*n(idx_HCOOCH3) &
        -k(2490)*n(idx_H3Oj)*n(idx_C2H5OH) &
        -k(2491)*n(idx_H3Oj)*n(idx_CH3OCH3) &
        -k(2492)*n(idx_H3Oj)*n(idx_C2H6CO) &
        -k(2493)*n(idx_H3Oj)*n(idx_C6H6) &
        +k(2502)*n(idx_HCO2j)*n(idx_H2O) &
        +k(2507)*n(idx_HSO2j)*n(idx_H2O) &
        +k(2556)*n(idx_C2H3j)*n(idx_H2O) &
        +k(2722)*n(idx_CH4j)*n(idx_H2O) &
        +k(2751)*n(idx_SICH3j)*n(idx_H2O) &
        +k(2755)*n(idx_SIH4j)*n(idx_H2O) &
        +k(2911)*n(idx_CH5j)*n(idx_O) &
        +k(2923)*n(idx_CH5j)*n(idx_H2O) &
        +k(2939)*n(idx_SIH5j)*n(idx_H2O) &
        +k(2946)*n(idx_C2H5j)*n(idx_H2O) &
        -k(3179)*n(idx_H3Oj)*n(idx_C2H2) &
        -k(3180)*n(idx_H3Oj)*n(idx_C2H4) &
        -k(3810)*n(idx_H3Oj)*n(idx_E) &
        -k(3811)*n(idx_H3Oj)*n(idx_E) &
        -k(3812)*n(idx_H3Oj)*n(idx_E) &
        -k(3813)*n(idx_H3Oj)*n(idx_E) &
        -k(4243)*n(idx_H3Oj)*n(idx_Hk) &
        -k(4244)*n(idx_H3Oj)*n(idx_Hk)

    !H3S+
    !H3S+
    dn(idx_H3Sj) = &
        +k(1181)*n(idx_CHj)*n(idx_H2S) &
        +k(1350)*n(idx_HSj)*n(idx_H2S) &
        +k(1499)*n(idx_OHj)*n(idx_H2S) &
        +k(1683)*n(idx_H2Oj)*n(idx_H2S) &
        +k(1708)*n(idx_H2Sj)*n(idx_H2S) &
        +k(1760)*n(idx_H3j)*n(idx_H2S) &
        +k(1935)*n(idx_HCOj)*n(idx_H2S) &
        +k(2135)*n(idx_NH2j)*n(idx_H2S) &
        +k(2176)*n(idx_S2Hj)*n(idx_H2S) &
        +k(2444)*n(idx_H3Oj)*n(idx_H2S) &
        -k(2494)*n(idx_H3Sj)*n(idx_H) &
        -k(2495)*n(idx_H3Sj)*n(idx_HCN) &
        -k(2496)*n(idx_H3Sj)*n(idx_HNC) &
        -k(2497)*n(idx_H3Sj)*n(idx_H2CO) &
        -k(2498)*n(idx_H3Sj)*n(idx_NH3) &
        +k(2557)*n(idx_C2H3j)*n(idx_H2S) &
        +k(2724)*n(idx_CH4j)*n(idx_H2S) &
        +k(2947)*n(idx_C2H5j)*n(idx_H2S) &
        +k(3148)*n(idx_HSj)*n(idx_H2) &
        -k(3814)*n(idx_H3Sj)*n(idx_E) &
        -k(3815)*n(idx_H3Sj)*n(idx_E)

    !HOCS+
    !HOCS+
    dn(idx_HOCSj) = &
        +k(1190)*n(idx_CHj)*n(idx_OCS) &
        +k(1774)*n(idx_H3j)*n(idx_OCS) &
        +k(1947)*n(idx_HCOj)*n(idx_OCS) &
        +k(2336)*n(idx_CH3j)*n(idx_SO) &
        +k(2726)*n(idx_CH4j)*n(idx_OCS) &
        -k(3822)*n(idx_HOCSj)*n(idx_E) &
        -k(3823)*n(idx_HOCSj)*n(idx_E)

    !CH5O+
    !CH5O+
    dn(idx_CH5Oj) = &
        +k(1204)*n(idx_CHj)*n(idx_CH3OH) &
        +k(1834)*n(idx_H3j)*n(idx_CH3OH) &
        +k(1998)*n(idx_HCOj)*n(idx_CH3OH) &
        +k(2484)*n(idx_H3Oj)*n(idx_CH3OH) &
        +k(2740)*n(idx_CH4j)*n(idx_CH3OH) &
        -k(3018)*n(idx_CH5Oj)*n(idx_H2CO) &
        -k(3019)*n(idx_CH5Oj)*n(idx_CH3OH) &
        +k(3170)*n(idx_CH3j)*n(idx_H2O) &
        -k(4048)*n(idx_CH5Oj)*n(idx_E) &
        -k(4049)*n(idx_CH5Oj)*n(idx_E) &
        -k(4050)*n(idx_CH5Oj)*n(idx_E) &
        -k(4051)*n(idx_CH5Oj)*n(idx_E) &
        -k(4052)*n(idx_CH5Oj)*n(idx_E)

    !NCO+
    !NCO+
    dn(idx_NCOj) = &
        +k(1215)*n(idx_CNj)*n(idx_NO) &
        +k(1218)*n(idx_CNj)*n(idx_O2) &
        +k(1224)*n(idx_CNj)*n(idx_CO2) &
        +k(1405)*n(idx_NHj)*n(idx_CO) &
        -k(3744)*n(idx_NCOj)*n(idx_E)

    !HNCO+
    !HNCO+
    dn(idx_HNCOj) = &
        +k(1228)*n(idx_CNj)*n(idx_H2O) &
        -k(3821)*n(idx_HNCOj)*n(idx_E)

    !C2N2+
    !C2N2+
    dn(idx_C2N2j) = &
        +k(1230)*n(idx_CNj)*n(idx_HCN) &
        -k(3114)*n(idx_C2N2j)*n(idx_H) &
        -k(3115)*n(idx_C2N2j)*n(idx_H) &
        -k(3772)*n(idx_C2N2j)*n(idx_E) &
        -k(3773)*n(idx_C2N2j)*n(idx_E)

    !O2H+
    !O2H+
    dn(idx_O2Hj) = &
        +k(1302)*n(idx_H2j)*n(idx_O2) &
        +k(1414)*n(idx_NHj)*n(idx_O2) &
        +k(1459)*n(idx_O2j)*n(idx_HCO) &
        +k(1739)*n(idx_H3j)*n(idx_O2) &
        -k(2148)*n(idx_O2Hj)*n(idx_C) &
        -k(2149)*n(idx_O2Hj)*n(idx_N) &
        -k(2150)*n(idx_O2Hj)*n(idx_O) &
        -k(2151)*n(idx_O2Hj)*n(idx_S) &
        -k(2152)*n(idx_O2Hj)*n(idx_C2) &
        -k(2153)*n(idx_O2Hj)*n(idx_CH) &
        -k(2154)*n(idx_O2Hj)*n(idx_CN) &
        -k(2155)*n(idx_O2Hj)*n(idx_CO) &
        -k(2156)*n(idx_O2Hj)*n(idx_H2) &
        -k(2157)*n(idx_O2Hj)*n(idx_N2) &
        -k(2158)*n(idx_O2Hj)*n(idx_NH) &
        -k(2159)*n(idx_O2Hj)*n(idx_NO) &
        -k(2160)*n(idx_O2Hj)*n(idx_OH) &
        -k(2161)*n(idx_O2Hj)*n(idx_C2H) &
        -k(2162)*n(idx_O2Hj)*n(idx_CH2) &
        -k(2163)*n(idx_O2Hj)*n(idx_CO2) &
        -k(2164)*n(idx_O2Hj)*n(idx_H2O) &
        -k(2165)*n(idx_O2Hj)*n(idx_HCN) &
        -k(2166)*n(idx_O2Hj)*n(idx_HCO) &
        -k(2167)*n(idx_O2Hj)*n(idx_HNC) &
        -k(2168)*n(idx_O2Hj)*n(idx_NH2) &
        -k(2169)*n(idx_O2Hj)*n(idx_H2CO) &
        -k(2170)*n(idx_O2Hj)*n(idx_NH3) &
        -k(3748)*n(idx_O2Hj)*n(idx_E)

    !CH5+
    !CH5+
    dn(idx_CH5j) = &
        +k(1328)*n(idx_H2j)*n(idx_CH4) &
        +k(1512)*n(idx_OHj)*n(idx_CH4) &
        +k(1813)*n(idx_H3j)*n(idx_CH4) &
        +k(2078)*n(idx_HNOj)*n(idx_CH4) &
        +k(2104)*n(idx_N2Hj)*n(idx_CH4) &
        +k(2505)*n(idx_HCO2j)*n(idx_CH4) &
        +k(2719)*n(idx_CH4j)*n(idx_H2) &
        +k(2735)*n(idx_CH4j)*n(idx_NH3) &
        +k(2736)*n(idx_CH4j)*n(idx_CH4) &
        -k(2906)*n(idx_CH5j)*n(idx_C) &
        -k(2907)*n(idx_CH5j)*n(idx_C) &
        -k(2908)*n(idx_CH5j)*n(idx_C) &
        -k(2909)*n(idx_CH5j)*n(idx_H) &
        -k(2910)*n(idx_CH5j)*n(idx_MG) &
        -k(2911)*n(idx_CH5j)*n(idx_O) &
        -k(2912)*n(idx_CH5j)*n(idx_O) &
        -k(2913)*n(idx_CH5j)*n(idx_S) &
        -k(2914)*n(idx_CH5j)*n(idx_SI) &
        -k(2915)*n(idx_CH5j)*n(idx_SI) &
        -k(2916)*n(idx_CH5j)*n(idx_C2) &
        -k(2917)*n(idx_CH5j)*n(idx_CH) &
        -k(2918)*n(idx_CH5j)*n(idx_CO) &
        -k(2919)*n(idx_CH5j)*n(idx_NH) &
        -k(2920)*n(idx_CH5j)*n(idx_OH) &
        -k(2921)*n(idx_CH5j)*n(idx_C2H) &
        -k(2922)*n(idx_CH5j)*n(idx_CH2) &
        -k(2923)*n(idx_CH5j)*n(idx_H2O) &
        -k(2924)*n(idx_CH5j)*n(idx_HCN) &
        -k(2925)*n(idx_CH5j)*n(idx_HCO) &
        -k(2926)*n(idx_CH5j)*n(idx_HNC) &
        -k(2927)*n(idx_CH5j)*n(idx_NH2) &
        -k(2928)*n(idx_CH5j)*n(idx_C2H2) &
        -k(2929)*n(idx_CH5j)*n(idx_H2CO) &
        -k(2930)*n(idx_CH5j)*n(idx_NH3) &
        -k(2931)*n(idx_CH5j)*n(idx_HC3N) &
        -k(2932)*n(idx_CH5j)*n(idx_C6H6) &
        +k(3169)*n(idx_CH3j)*n(idx_H2) &
        -k(3198)*n(idx_CH5j)*n(idx_CO) &
        -k(3969)*n(idx_CH5j)*n(idx_E) &
        -k(3970)*n(idx_CH5j)*n(idx_E) &
        -k(3971)*n(idx_CH5j)*n(idx_E) &
        -k(3972)*n(idx_CH5j)*n(idx_E) &
        -k(3973)*n(idx_CH5j)*n(idx_E)

    !H2CL+
    !H2CL+
    dn(idx_H2CLj) = &
        +k(1332)*n(idx_HCLj)*n(idx_H2) &
        -k(1654)*n(idx_H2CLj)*n(idx_CO) &
        -k(1655)*n(idx_H2CLj)*n(idx_H2O) &
        +k(1730)*n(idx_H3j)*n(idx_HCL) &
        -k(3706)*n(idx_H2CLj)*n(idx_E) &
        -k(3707)*n(idx_H2CLj)*n(idx_E)

    !H2F+
    !H2F+
    dn(idx_H2Fj) = &
        +k(1333)*n(idx_HFj)*n(idx_H2) &
        +k(1717)*n(idx_H3j)*n(idx_F) &
        +k(1731)*n(idx_H3j)*n(idx_HF) &
        -k(3708)*n(idx_H2Fj)*n(idx_E) &
        -k(3709)*n(idx_H2Fj)*n(idx_E)

    !CH3O2+
    !CH3O2+
    dn(idx_CH3O2j) = &
        +k(1465)*n(idx_O2j)*n(idx_CH4) &
        +k(1978)*n(idx_HCOj)*n(idx_CH2O2) &
        +k(3153)*n(idx_HCOj)*n(idx_H2O) &
        -k(3961)*n(idx_CH3O2j)*n(idx_E) &
        -k(3962)*n(idx_CH3O2j)*n(idx_E)

    !H2PO+
    !H2PO+
    dn(idx_H2POj) = &
        +k(1516)*n(idx_PHj)*n(idx_H2O) &
        +k(1769)*n(idx_H3j)*n(idx_HPO) &
        +k(1943)*n(idx_HCOj)*n(idx_HPO) &
        -k(3804)*n(idx_H2POj)*n(idx_E) &
        -k(3805)*n(idx_H2POj)*n(idx_E)

    !PNH3+
    !PNH3+
    dn(idx_PNH3j) = &
        +k(1522)*n(idx_PHj)*n(idx_NH3) &
        -k(3918)*n(idx_PNH3j)*n(idx_E)

    !PCH4+
    !PCH4+
    dn(idx_PCH4j) = &
        +k(1524)*n(idx_PHj)*n(idx_CH4) &
        +k(1811)*n(idx_H3j)*n(idx_CH2PH) &
        +k(1979)*n(idx_HCOj)*n(idx_CH2PH) &
        +k(2475)*n(idx_H3Oj)*n(idx_CH2PH) &
        -k(4002)*n(idx_PCH4j)*n(idx_E) &
        -k(4003)*n(idx_PCH4j)*n(idx_E) &
        -k(4004)*n(idx_PCH4j)*n(idx_E)

    !PC2H3+
    !PC2H3+
    dn(idx_PC2H3j) = &
        +k(1526)*n(idx_PHj)*n(idx_C2H4) &
        +k(2531)*n(idx_PH3j)*n(idx_C2H2) &
        -k(3994)*n(idx_PC2H3j)*n(idx_E) &
        -k(3995)*n(idx_PC2H3j)*n(idx_E) &
        -k(3996)*n(idx_PC2H3j)*n(idx_E)

    !HSIS+
    !HSIS+
    dn(idx_HSISj) = &
        +k(1555)*n(idx_SISj)*n(idx_H2) &
        +k(1749)*n(idx_H3j)*n(idx_SIS) &
        +k(1926)*n(idx_HCOj)*n(idx_SIS) &
        +k(2181)*n(idx_SIH2j)*n(idx_S) &
        -k(3737)*n(idx_HSISj)*n(idx_E) &
        -k(3738)*n(idx_HSISj)*n(idx_E)

    !HSO+
    !HSO+
    dn(idx_HSOj) = &
        +k(1664)*n(idx_H2Oj)*n(idx_S) &
        +k(1750)*n(idx_H3j)*n(idx_SO) &
        +k(1927)*n(idx_HCOj)*n(idx_SO) &
        -k(3739)*n(idx_HSOj)*n(idx_E)

    !HNS+
    !HNS+
    dn(idx_HNSj) = &
        +k(1738)*n(idx_H3j)*n(idx_NS) &
        +k(1916)*n(idx_HCOj)*n(idx_NS) &
        +k(2116)*n(idx_NH2j)*n(idx_S) &
        -k(3727)*n(idx_HNSj)*n(idx_E)

    !HPN+
    !HPN+
    dn(idx_HPNj) = &
        +k(1742)*n(idx_H3j)*n(idx_PN) &
        +k(1920)*n(idx_HCOj)*n(idx_PN) &
        +k(2434)*n(idx_H3Oj)*n(idx_PN) &
        -k(3731)*n(idx_HPNj)*n(idx_E) &
        -k(3732)*n(idx_HPNj)*n(idx_E)

    !H2NO+
    !H2NO+
    dn(idx_H2NOj) = &
        +k(1767)*n(idx_H3j)*n(idx_HNO) &
        +k(1941)*n(idx_HCOj)*n(idx_HNO) &
        +k(2126)*n(idx_NH2j)*n(idx_O2) &
        +k(2513)*n(idx_NH3j)*n(idx_O) &
        +k(3149)*n(idx_NOj)*n(idx_H2) &
        -k(3802)*n(idx_H2NOj)*n(idx_E) &
        -k(3803)*n(idx_H2NOj)*n(idx_E)

    !NAH2O+
    !NAH2O+
    dn(idx_NAH2Oj) = &
        +k(1771)*n(idx_H3j)*n(idx_NAOH) &
        +k(1945)*n(idx_HCOj)*n(idx_NAOH) &
        +k(2111)*n(idx_NAH2j)*n(idx_H2O) &
        +k(3139)*n(idx_NAj)*n(idx_H2O) &
        -k(3829)*n(idx_NAH2Oj)*n(idx_E) &
        -k(3830)*n(idx_NAH2Oj)*n(idx_E)

    !PH3+
    !PH3+
    dn(idx_PH3j) = &
        +k(1775)*n(idx_H3j)*n(idx_PH2) &
        +k(1948)*n(idx_HCOj)*n(idx_PH2) &
        -k(2531)*n(idx_PH3j)*n(idx_C2H2) &
        +k(3150)*n(idx_PHj)*n(idx_H2) &
        -k(3837)*n(idx_PH3j)*n(idx_E) &
        -k(3838)*n(idx_PH3j)*n(idx_E)

    !SINCH+
    !SINCH+
    dn(idx_SINCHj) = &
        +k(1778)*n(idx_H3j)*n(idx_SINC) &
        +k(1951)*n(idx_HCOj)*n(idx_SINC) &
        +k(2454)*n(idx_H3Oj)*n(idx_SINC) &
        -k(2540)*n(idx_SINCHj)*n(idx_O) &
        +k(2542)*n(idx_SINH2j)*n(idx_C) &
        +k(3145)*n(idx_SIj)*n(idx_HCN) &
        -k(3846)*n(idx_SINCHj)*n(idx_E) &
        -k(3847)*n(idx_SINCHj)*n(idx_E)

    !HSIO2+
    !HSIO2+
    dn(idx_HSIO2j) = &
        +k(1779)*n(idx_H3j)*n(idx_SIO2) &
        +k(1952)*n(idx_HCOj)*n(idx_SIO2) &
        -k(3824)*n(idx_HSIO2j)*n(idx_E) &
        -k(3825)*n(idx_HSIO2j)*n(idx_E)

    !HSO2+
    !HSO2+
    dn(idx_HSO2j) = &
        +k(1780)*n(idx_H3j)*n(idx_SO2) &
        +k(2185)*n(idx_SO2j)*n(idx_H2) &
        -k(2507)*n(idx_HSO2j)*n(idx_H2O) &
        -k(2508)*n(idx_HSO2j)*n(idx_NH3) &
        -k(3826)*n(idx_HSO2j)*n(idx_E) &
        -k(3827)*n(idx_HSO2j)*n(idx_E) &
        -k(3828)*n(idx_HSO2j)*n(idx_E)

    !HC3O+
    !HC3O+
    dn(idx_HC3Oj) = &
        +k(1785)*n(idx_H3j)*n(idx_C3O) &
        +k(1957)*n(idx_HCOj)*n(idx_C3O) &
        +k(2279)*n(idx_C3Hj)*n(idx_O2) &
        +k(2280)*n(idx_C3Hj)*n(idx_CO2) &
        +k(2283)*n(idx_C3Hj)*n(idx_H2O) &
        +k(2288)*n(idx_C3Hj)*n(idx_OCS) &
        +k(2458)*n(idx_H3Oj)*n(idx_C3O) &
        -k(3900)*n(idx_HC3Oj)*n(idx_E) &
        -k(3901)*n(idx_HC3Oj)*n(idx_E) &
        -k(3902)*n(idx_HC3Oj)*n(idx_E)

    !PC3H+
    !PC3H+
    dn(idx_PC3Hj) = &
        +k(1786)*n(idx_H3j)*n(idx_C3P) &
        +k(1958)*n(idx_HCOj)*n(idx_C3P) &
        +k(2459)*n(idx_H3Oj)*n(idx_C3P) &
        +k(2618)*n(idx_C3H2j)*n(idx_P) &
        +k(2619)*n(idx_H2C3j)*n(idx_P) &
        -k(3912)*n(idx_PC3Hj)*n(idx_E) &
        -k(3913)*n(idx_PC3Hj)*n(idx_E) &
        -k(3914)*n(idx_PC3Hj)*n(idx_E)

    !H3S2+
    !H3S2+
    dn(idx_H3S2j) = &
        +k(1792)*n(idx_H3j)*n(idx_H2S2) &
        +k(1963)*n(idx_HCOj)*n(idx_H2S2) &
        +k(2175)*n(idx_S2Hj)*n(idx_H2) &
        +k(2463)*n(idx_H3Oj)*n(idx_H2S2) &
        -k(3896)*n(idx_H3S2j)*n(idx_E) &
        -k(3897)*n(idx_H3S2j)*n(idx_E)

    !H3SIO+
    !H3SIO+
    dn(idx_H3SIOj) = &
        +k(1793)*n(idx_H3j)*n(idx_H2SIO) &
        +k(1964)*n(idx_HCOj)*n(idx_H2SIO) &
        +k(2464)*n(idx_H3Oj)*n(idx_H2SIO) &
        +k(2539)*n(idx_SIH3j)*n(idx_O2) &
        +k(2938)*n(idx_SIH5j)*n(idx_O) &
        -k(3898)*n(idx_H3SIOj)*n(idx_E) &
        -k(3899)*n(idx_H3SIOj)*n(idx_E)

    !PC4H+
    !PC4H+
    dn(idx_PC4Hj) = &
        +k(1806)*n(idx_H3j)*n(idx_C4P) &
        +k(1975)*n(idx_HCOj)*n(idx_C4P) &
        +k(2473)*n(idx_H3Oj)*n(idx_C4P) &
        +k(2876)*n(idx_C4H2j)*n(idx_P) &
        -k(3997)*n(idx_PC4Hj)*n(idx_E) &
        -k(3998)*n(idx_PC4Hj)*n(idx_E) &
        -k(3999)*n(idx_PC4Hj)*n(idx_E) &
        -k(4000)*n(idx_PC4Hj)*n(idx_E) &
        -k(4001)*n(idx_PC4Hj)*n(idx_E)

    !NH2CNH+
    !NH2CNH+
    dn(idx_NH2CNHj) = &
        +k(1818)*n(idx_H3j)*n(idx_NH2CN) &
        +k(1985)*n(idx_HCOj)*n(idx_NH2CN) &
        -k(3992)*n(idx_NH2CNHj)*n(idx_E) &
        -k(3993)*n(idx_NH2CNHj)*n(idx_E)

    !SIC4H+
    !SIC4H+
    dn(idx_SIC4Hj) = &
        +k(1821)*n(idx_H3j)*n(idx_SIC4) &
        +k(1988)*n(idx_HCOj)*n(idx_SIC4) &
        +k(2533)*n(idx_SIC2Hj)*n(idx_C2H2) &
        +k(2879)*n(idx_C4H2j)*n(idx_SI) &
        +k(2935)*n(idx_SIC3H2j)*n(idx_C) &
        -k(4009)*n(idx_SIC4Hj)*n(idx_E) &
        -k(4010)*n(idx_SIC4Hj)*n(idx_E)

    !SICH4+
    !SICH4+
    dn(idx_SICH4j) = &
        +k(1822)*n(idx_H3j)*n(idx_SICH3) &
        +k(1989)*n(idx_HCOj)*n(idx_SICH3) &
        +k(2480)*n(idx_H3Oj)*n(idx_SICH3) &
        +k(2915)*n(idx_CH5j)*n(idx_SI) &
        -k(2936)*n(idx_SICH4j)*n(idx_C) &
        +k(2937)*n(idx_SIH5j)*n(idx_C) &
        +k(3147)*n(idx_SIj)*n(idx_CH4) &
        -k(4011)*n(idx_SICH4j)*n(idx_E) &
        -k(4012)*n(idx_SICH4j)*n(idx_E)

    !SIH5+
    !SIH5+
    dn(idx_SIH5j) = &
        +k(1823)*n(idx_H3j)*n(idx_SIH4) &
        +k(1990)*n(idx_HCOj)*n(idx_SIH4) &
        +k(2754)*n(idx_SIH4j)*n(idx_H2) &
        -k(2937)*n(idx_SIH5j)*n(idx_C) &
        -k(2938)*n(idx_SIH5j)*n(idx_O) &
        -k(2939)*n(idx_SIH5j)*n(idx_H2O) &
        +k(3182)*n(idx_SIH3j)*n(idx_H2) &
        -k(4013)*n(idx_SIH5j)*n(idx_E) &
        -k(4014)*n(idx_SIH5j)*n(idx_E)

    !C2H4N+
    !C2H4N+
    dn(idx_C2H4Nj) = &
        +k(1824)*n(idx_H3j)*n(idx_CH3CN) &
        +k(1991)*n(idx_HCOj)*n(idx_CH3CN) &
        +k(2481)*n(idx_H3Oj)*n(idx_CH3CN) &
        +k(2506)*n(idx_HCO2j)*n(idx_CH3CN) &
        +k(3171)*n(idx_CH3j)*n(idx_HCN) &
        -k(4015)*n(idx_C2H4Nj)*n(idx_E) &
        -k(4016)*n(idx_C2H4Nj)*n(idx_E)

    !NH2CH2O+
    !NH2CH2O+
    dn(idx_NH2CH2Oj) = &
        +k(1835)*n(idx_H3j)*n(idx_NH2CHO) &
        +k(1999)*n(idx_HCOj)*n(idx_NH2CHO) &
        +k(2109)*n(idx_N2Hj)*n(idx_NH2CHO) &
        +k(2485)*n(idx_H3Oj)*n(idx_NH2CHO) &
        -k(4057)*n(idx_NH2CH2Oj)*n(idx_E) &
        -k(4058)*n(idx_NH2CH2Oj)*n(idx_E) &
        -k(4059)*n(idx_NH2CH2Oj)*n(idx_E) &
        -k(4060)*n(idx_NH2CH2Oj)*n(idx_E) &
        -k(4061)*n(idx_NH2CH2Oj)*n(idx_E)

    !C2H6+
    !C2H6+
    dn(idx_C2H6j) = &
        +k(1837)*n(idx_H3j)*n(idx_C2H5) &
        +k(2001)*n(idx_HCOj)*n(idx_C2H5) &
        -k(3021)*n(idx_C2H6j)*n(idx_H) &
        -k(4071)*n(idx_C2H6j)*n(idx_E) &
        -k(4072)*n(idx_C2H6j)*n(idx_E)

    !C3H4N+
    !C3H4N+
    dn(idx_C3H4Nj) = &
        +k(1838)*n(idx_H3j)*n(idx_C3H3N) &
        +k(2002)*n(idx_HCOj)*n(idx_C3H3N) &
        +k(3178)*n(idx_HCNHj)*n(idx_C2H2) &
        -k(4073)*n(idx_C3H4Nj)*n(idx_E) &
        -k(4074)*n(idx_C3H4Nj)*n(idx_E) &
        -k(4075)*n(idx_C3H4Nj)*n(idx_E)

    !C3H5+
    !C3H5+
    dn(idx_C3H5j) = &
        +k(1841)*n(idx_H3j)*n(idx_C3H4) &
        +k(2003)*n(idx_HCOj)*n(idx_C3H4) &
        +k(2242)*n(idx_C2H2j)*n(idx_CH4) &
        +k(2374)*n(idx_CH3j)*n(idx_C2H4) &
        +k(2487)*n(idx_H3Oj)*n(idx_C3H4) &
        +k(2580)*n(idx_C2H3j)*n(idx_CH4) &
        +k(2592)*n(idx_C2H3j)*n(idx_C3H4) &
        +k(2791)*n(idx_C2H4j)*n(idx_C2H4) &
        +k(2955)*n(idx_C2H5j)*n(idx_C2H4) &
        -k(3022)*n(idx_C3H5j)*n(idx_C) &
        -k(3023)*n(idx_C3H5j)*n(idx_N) &
        -k(3024)*n(idx_C3H5j)*n(idx_N) &
        -k(3025)*n(idx_C3H5j)*n(idx_O) &
        -k(3026)*n(idx_C3H5j)*n(idx_C6H6) &
        -k(4076)*n(idx_C3H5j)*n(idx_E) &
        -k(4077)*n(idx_C3H5j)*n(idx_E)

    !C4H4+
    !C4H4+
    dn(idx_C4H4j) = &
        +k(1842)*n(idx_H3j)*n(idx_C4H3) &
        +k(2004)*n(idx_HCOj)*n(idx_C4H3) &
        +k(2488)*n(idx_H3Oj)*n(idx_C4H3) &
        +k(2664)*n(idx_C3H2j)*n(idx_C3H4) &
        +k(2665)*n(idx_H2C3j)*n(idx_C3H4) &
        -k(3027)*n(idx_C4H4j)*n(idx_C2H2) &
        -k(3028)*n(idx_C4H4j)*n(idx_C2H2) &
        -k(3029)*n(idx_C4H4j)*n(idx_C4H2) &
        +k(3200)*n(idx_C4H3j)*n(idx_H) &
        -k(4078)*n(idx_C4H4j)*n(idx_E) &
        -k(4079)*n(idx_C4H4j)*n(idx_E) &
        -k(4080)*n(idx_C4H4j)*n(idx_E)

    !CH6N+
    !CH6N+
    dn(idx_CH6Nj) = &
        +k(1846)*n(idx_H3j)*n(idx_CH5N) &
        +k(2008)*n(idx_HCOj)*n(idx_CH5N) &
        +k(3172)*n(idx_CH3j)*n(idx_NH3) &
        -k(4093)*n(idx_CH6Nj)*n(idx_E) &
        -k(4094)*n(idx_CH6Nj)*n(idx_E)

    !C5H2N+
    !C5H2N+
    dn(idx_C5H2Nj) = &
        +k(1847)*n(idx_H3j)*n(idx_HC5N) &
        +k(2009)*n(idx_HCOj)*n(idx_HC5N) &
        +k(2714)*n(idx_C4Nj)*n(idx_CH4) &
        +k(3013)*n(idx_C5HNj)*n(idx_H2) &
        +k(3032)*n(idx_C5H3j)*n(idx_N) &
        -k(4081)*n(idx_C5H2Nj)*n(idx_E) &
        -k(4082)*n(idx_C5H2Nj)*n(idx_E)

    !C4H4N+
    !C4H4N+
    dn(idx_C4H4Nj) = &
        +k(1852)*n(idx_H3j)*n(idx_CH3C3N) &
        +k(2014)*n(idx_HCOj)*n(idx_CH3C3N) &
        +k(3058)*n(idx_H3C4Nj)*n(idx_H2) &
        -k(3059)*n(idx_C4H4Nj)*n(idx_C) &
        +k(3060)*n(idx_C4H5j)*n(idx_N) &
        +k(3173)*n(idx_CH3j)*n(idx_HC3N) &
        -k(4102)*n(idx_C4H4Nj)*n(idx_E) &
        -k(4103)*n(idx_C4H4Nj)*n(idx_E)

    !H5C2O2+
    !H5C2O2+
    dn(idx_H5C2O2j) = &
        +k(1853)*n(idx_H3j)*n(idx_HCOOCH3) &
        +k(2015)*n(idx_HCOj)*n(idx_HCOOCH3) &
        +k(2489)*n(idx_H3Oj)*n(idx_HCOOCH3) &
        +k(3018)*n(idx_CH5Oj)*n(idx_H2CO) &
        -k(4127)*n(idx_H5C2O2j)*n(idx_E) &
        -k(4128)*n(idx_H5C2O2j)*n(idx_E)

    !C2H5OH2+
    !C2H5OH2+
    dn(idx_C2H5OH2j) = &
        +k(1856)*n(idx_H3j)*n(idx_C2H5OH) &
        +k(2017)*n(idx_HCOj)*n(idx_C2H5OH) &
        +k(2490)*n(idx_H3Oj)*n(idx_C2H5OH) &
        +k(3180)*n(idx_H3Oj)*n(idx_C2H4) &
        +k(3199)*n(idx_C2H5j)*n(idx_H2O) &
        -k(4131)*n(idx_C2H5OH2j)*n(idx_E) &
        -k(4132)*n(idx_C2H5OH2j)*n(idx_E) &
        -k(4133)*n(idx_C2H5OH2j)*n(idx_E)

    !CH3OCH4+
    !CH3OCH4+
    dn(idx_CH3OCH4j) = &
        +k(1861)*n(idx_H3j)*n(idx_CH3OCH3) &
        +k(2022)*n(idx_HCOj)*n(idx_CH3OCH3) &
        +k(2491)*n(idx_H3Oj)*n(idx_CH3OCH3) &
        +k(3019)*n(idx_CH5Oj)*n(idx_CH3OH) &
        +k(3174)*n(idx_CH3j)*n(idx_CH3OH) &
        +k(3187)*n(idx_H3COj)*n(idx_CH4) &
        -k(4151)*n(idx_CH3OCH4j)*n(idx_E) &
        -k(4152)*n(idx_CH3OCH4j)*n(idx_E) &
        -k(4153)*n(idx_CH3OCH4j)*n(idx_E)

    !C7H2N+
    !C7H2N+
    dn(idx_C7H2Nj) = &
        +k(1862)*n(idx_H3j)*n(idx_HC7N) &
        +k(2023)*n(idx_HCOj)*n(idx_HC7N) &
        +k(3076)*n(idx_C7HNj)*n(idx_H2) &
        +k(3082)*n(idx_C7H3j)*n(idx_N) &
        -k(4142)*n(idx_C7H2Nj)*n(idx_E) &
        -k(4143)*n(idx_C7H2Nj)*n(idx_E)

    !C3H6OH+
    !C3H6OH+
    dn(idx_C3H6OHj) = &
        +k(1863)*n(idx_H3j)*n(idx_C2H6CO) &
        +k(2024)*n(idx_HCOj)*n(idx_C2H6CO) &
        +k(2492)*n(idx_H3Oj)*n(idx_C2H6CO) &
        +k(3175)*n(idx_CH3j)*n(idx_C2H4O) &
        -k(4154)*n(idx_C3H6OHj)*n(idx_E) &
        -k(4155)*n(idx_C3H6OHj)*n(idx_E)

    !C6H4N+
    !C6H4N+
    dn(idx_C6H4Nj) = &
        +k(1867)*n(idx_H3j)*n(idx_CH3C5N) &
        +k(2028)*n(idx_HCOj)*n(idx_CH3C5N) &
        -k(3093)*n(idx_C6H4Nj)*n(idx_C) &
        +k(3094)*n(idx_C6H5j)*n(idx_N) &
        +k(3176)*n(idx_CH3j)*n(idx_HC5N) &
        -k(4160)*n(idx_C6H4Nj)*n(idx_E) &
        -k(4161)*n(idx_C6H4Nj)*n(idx_E)

    !C9H3+
    !C9H3+
    dn(idx_C9H3j) = &
        +k(1868)*n(idx_H3j)*n(idx_C9H2) &
        +k(2029)*n(idx_HCOj)*n(idx_C9H2) &
        +k(2271)*n(idx_C2H2j)*n(idx_C7H2) &
        +k(2388)*n(idx_CH3j)*n(idx_C8H2) &
        +k(2605)*n(idx_C2H3j)*n(idx_C7H) &
        +k(2607)*n(idx_C2H3j)*n(idx_C7H2) &
        +k(2680)*n(idx_C3H2j)*n(idx_C6H2) &
        +k(2681)*n(idx_H2C3j)*n(idx_C6H2) &
        +k(2866)*n(idx_C3H3j)*n(idx_C6H) &
        +k(2867)*n(idx_H3C3j)*n(idx_C6H) &
        +k(2868)*n(idx_C3H3j)*n(idx_C6H2) &
        +k(2869)*n(idx_H3C3j)*n(idx_C6H2) &
        +k(2899)*n(idx_C4H2j)*n(idx_C5H2) &
        +k(2984)*n(idx_C4H3j)*n(idx_C5H) &
        +k(2986)*n(idx_C4H3j)*n(idx_C5H2) &
        +k(3011)*n(idx_C5H2j)*n(idx_C4H2) &
        +k(3044)*n(idx_C6H2j)*n(idx_C3H2) &
        +k(3045)*n(idx_C6H2j)*n(idx_H2C3) &
        +k(3049)*n(idx_C6H2j)*n(idx_C3H3) &
        +k(3071)*n(idx_C7H2j)*n(idx_C2H2) &
        +k(3072)*n(idx_C7H2j)*n(idx_C2H3) &
        -k(3107)*n(idx_C9H3j)*n(idx_N) &
        -k(3108)*n(idx_C9H3j)*n(idx_O) &
        +k(3196)*n(idx_C5Hj)*n(idx_C4H2) &
        -k(4180)*n(idx_C9H3j)*n(idx_E) &
        -k(4181)*n(idx_C9H3j)*n(idx_E)

    !C7H5+
    !C7H5+
    dn(idx_C7H5j) = &
        +k(1869)*n(idx_H3j)*n(idx_CH3C6H) &
        +k(2030)*n(idx_HCOj)*n(idx_CH3C6H) &
        +k(2803)*n(idx_C2H4j)*n(idx_C5H2) &
        +k(2898)*n(idx_C4H2j)*n(idx_C3H4) &
        +k(2981)*n(idx_C4H3j)*n(idx_C3H3) &
        +k(3007)*n(idx_C5H2j)*n(idx_C2H4) &
        +k(3047)*n(idx_C6H2j)*n(idx_CH4) &
        -k(3106)*n(idx_C7H5j)*n(idx_N) &
        +k(3189)*n(idx_C3H3j)*n(idx_C4H2) &
        +k(3190)*n(idx_H3C3j)*n(idx_C4H2) &
        -k(4174)*n(idx_C7H5j)*n(idx_E) &
        -k(4175)*n(idx_C7H5j)*n(idx_E)

    !C8H4N+
    !C8H4N+
    dn(idx_C8H4Nj) = &
        +k(1870)*n(idx_H3j)*n(idx_CH3C7N) &
        +k(2031)*n(idx_HCOj)*n(idx_CH3C7N) &
        -k(3109)*n(idx_C8H4Nj)*n(idx_C) &
        +k(3177)*n(idx_CH3j)*n(idx_HC7N) &
        -k(4184)*n(idx_C8H4Nj)*n(idx_E) &
        -k(4185)*n(idx_C8H4Nj)*n(idx_E)

    !C9H2N+
    !C9H2N+
    dn(idx_C9H2Nj) = &
        +k(1871)*n(idx_H3j)*n(idx_HC9N) &
        +k(2032)*n(idx_HCOj)*n(idx_HC9N) &
        +k(3105)*n(idx_C9HNj)*n(idx_H2) &
        +k(3107)*n(idx_C9H3j)*n(idx_N) &
        -k(4178)*n(idx_C9H2Nj)*n(idx_E) &
        -k(4179)*n(idx_C9H2Nj)*n(idx_E)

    !C6H7+
    !C6H7+
    dn(idx_C6H7j) = &
        +k(1872)*n(idx_H3j)*n(idx_C6H6) &
        +k(2033)*n(idx_HCOj)*n(idx_C6H6) &
        +k(2110)*n(idx_N2Hj)*n(idx_C6H6) &
        +k(2493)*n(idx_H3Oj)*n(idx_C6H6) &
        +k(2609)*n(idx_C2H3j)*n(idx_C6H6) &
        +k(2932)*n(idx_CH5j)*n(idx_C6H6) &
        +k(2964)*n(idx_C3H4j)*n(idx_C3H4) &
        +k(3026)*n(idx_C3H5j)*n(idx_C6H6) &
        +k(3095)*n(idx_C6H5j)*n(idx_C2H4) &
        +k(3207)*n(idx_C6H5j)*n(idx_H2) &
        -k(4182)*n(idx_C6H7j)*n(idx_E) &
        -k(4183)*n(idx_C6H7j)*n(idx_E)

    !NAH2+
    !NAH2+
    dn(idx_NAH2j) = &
        -k(2111)*n(idx_NAH2j)*n(idx_H2O) &
        +k(3138)*n(idx_NAj)*n(idx_H2) &
        -k(3742)*n(idx_NAH2j)*n(idx_E) &
        -k(3743)*n(idx_NAH2j)*n(idx_E)

    !PC2H4+
    !PC2H4+
    dn(idx_PC2H4j) = &
        +k(2174)*n(idx_PH2j)*n(idx_C2H4) &
        -k(4062)*n(idx_PC2H4j)*n(idx_E) &
        -k(4063)*n(idx_PC2H4j)*n(idx_E) &
        -k(4064)*n(idx_PC2H4j)*n(idx_E)

    !C4H5+
    !C4H5+
    dn(idx_C4H5j) = &
        +k(2246)*n(idx_C2H2j)*n(idx_C2H4) &
        +k(2375)*n(idx_CH3j)*n(idx_C3H3) &
        +k(2570)*n(idx_C2H3j)*n(idx_C2H3) &
        +k(2644)*n(idx_C3H2j)*n(idx_CH4) &
        +k(2645)*n(idx_H2C3j)*n(idx_CH4) &
        +k(2774)*n(idx_C2H4j)*n(idx_C2H2) &
        +k(2783)*n(idx_C2H4j)*n(idx_C2H3) &
        +k(2801)*n(idx_C2H4j)*n(idx_C3H4) &
        +k(2844)*n(idx_C3H3j)*n(idx_CH4) &
        +k(2845)*n(idx_H3C3j)*n(idx_CH4) &
        +k(2952)*n(idx_C2H5j)*n(idx_C2H2) &
        -k(3060)*n(idx_C4H5j)*n(idx_N) &
        +k(3097)*n(idx_C6H5j)*n(idx_O2) &
        -k(4104)*n(idx_C4H5j)*n(idx_E) &
        -k(4105)*n(idx_C4H5j)*n(idx_E) &
        -k(4106)*n(idx_C4H5j)*n(idx_E) &
        -k(4107)*n(idx_C4H5j)*n(idx_E) &
        -k(4108)*n(idx_C4H5j)*n(idx_E)

    !H2CCL+
    !H2CCL+
    dn(idx_H2CCLj) = &
        +k(2329)*n(idx_CH3j)*n(idx_HCL) &
        -k(3792)*n(idx_H2CCLj)*n(idx_E)

    !PC4H2+
    !PC4H2+
    dn(idx_PC4H2j) = &
        +k(2530)*n(idx_PC2Hj)*n(idx_C2H2) &
        -k(4065)*n(idx_PC4H2j)*n(idx_E) &
        -k(4066)*n(idx_PC4H2j)*n(idx_E)

    !C6H4+
    !C6H4+
    dn(idx_C6H4j) = &
        +k(2588)*n(idx_C2H3j)*n(idx_C4H2) &
        +k(2650)*n(idx_C3H2j)*n(idx_C3H3) &
        +k(2651)*n(idx_H2C3j)*n(idx_C3H3) &
        +k(2704)*n(idx_C4Hj)*n(idx_C2H4) &
        +k(2789)*n(idx_C2H4j)*n(idx_C4H) &
        +k(2798)*n(idx_C2H4j)*n(idx_C4H2) &
        +k(2838)*n(idx_C3H3j)*n(idx_C3H2) &
        +k(2839)*n(idx_H3C3j)*n(idx_H2C3) &
        +k(2848)*n(idx_C3H3j)*n(idx_C3H3) &
        +k(2849)*n(idx_H3C3j)*n(idx_C3H3) &
        +k(2885)*n(idx_C4H2j)*n(idx_C2H3) &
        +k(2891)*n(idx_C4H2j)*n(idx_C2H4) &
        +k(2974)*n(idx_C4H3j)*n(idx_C2H3) &
        +k(3004)*n(idx_C5H2j)*n(idx_CH4) &
        +k(3027)*n(idx_C4H4j)*n(idx_C2H2) &
        +k(3029)*n(idx_C4H4j)*n(idx_C4H2) &
        +k(3192)*n(idx_C4H2j)*n(idx_C2H2) &
        -k(3206)*n(idx_C6H4j)*n(idx_H) &
        -k(4140)*n(idx_C6H4j)*n(idx_E) &
        -k(4141)*n(idx_C6H4j)*n(idx_E)

    !C8H4+
    !C8H4+
    dn(idx_C8H4j) = &
        +k(2602)*n(idx_C2H3j)*n(idx_C6H2) &
        +k(2805)*n(idx_C2H4j)*n(idx_C6H) &
        +k(2807)*n(idx_C2H4j)*n(idx_C6H2) &
        +k(2862)*n(idx_C3H3j)*n(idx_C5H2) &
        +k(2863)*n(idx_H3C3j)*n(idx_C5H2) &
        +k(2983)*n(idx_C4H3j)*n(idx_C4H2) &
        +k(3009)*n(idx_C5H2j)*n(idx_C3H3) &
        +k(3012)*n(idx_C5H2j)*n(idx_C3H4) &
        +k(3041)*n(idx_C6H2j)*n(idx_C2H3) &
        +k(3048)*n(idx_C6H2j)*n(idx_C2H4) &
        +k(3074)*n(idx_C7H2j)*n(idx_CH4) &
        +k(3194)*n(idx_C4H2j)*n(idx_C4H2) &
        +k(3205)*n(idx_C6H2j)*n(idx_C2H2) &
        -k(4176)*n(idx_C8H4j)*n(idx_E) &
        -k(4177)*n(idx_C8H4j)*n(idx_E)

    !C9H4+
    !C9H4+
    dn(idx_C9H4j) = &
        +k(2608)*n(idx_C2H3j)*n(idx_C7H2) &
        +k(2809)*n(idx_C2H4j)*n(idx_C7H) &
        +k(2811)*n(idx_C2H4j)*n(idx_C7H2) &
        +k(2987)*n(idx_C4H3j)*n(idx_C5H2) &
        +k(3050)*n(idx_C6H2j)*n(idx_C3H3) &
        +k(3051)*n(idx_C6H2j)*n(idx_C3H4) &
        +k(3073)*n(idx_C7H2j)*n(idx_C2H3) &
        +k(3075)*n(idx_C7H2j)*n(idx_C2H4) &
        +k(3087)*n(idx_C8H2j)*n(idx_CH4) &
        -k(3110)*n(idx_C9H4j)*n(idx_N) &
        +k(3203)*n(idx_C5H2j)*n(idx_C4H2) &
        -k(4190)*n(idx_C9H4j)*n(idx_E) &
        -k(4191)*n(idx_C9H4j)*n(idx_E)

    !C4H7+
    !C4H7+
    dn(idx_C4H7j) = &
        +k(2792)*n(idx_C2H4j)*n(idx_C2H4) &
        -k(4156)*n(idx_C4H7j)*n(idx_E) &
        -k(4157)*n(idx_C4H7j)*n(idx_E) &
        -k(4158)*n(idx_C4H7j)*n(idx_E) &
        -k(4159)*n(idx_C4H7j)*n(idx_E)

    !HC4N+
    !HC4N+
    dn(idx_HC4Nj) = &
        +k(2872)*n(idx_C4H2j)*n(idx_N) &
        -k(2933)*n(idx_HC4Nj)*n(idx_H2) &
        -k(3985)*n(idx_HC4Nj)*n(idx_E)

    !HC4O+
    !HC4O+
    dn(idx_HC4Oj) = &
        +k(2873)*n(idx_C4H2j)*n(idx_O) &
        +k(3164)*n(idx_C3Hj)*n(idx_CO) &
        -k(3986)*n(idx_HC4Oj)*n(idx_E) &
        -k(3987)*n(idx_HC4Oj)*n(idx_E) &
        -k(3988)*n(idx_HC4Oj)*n(idx_E)

    !C5N+
    !C5N+
    dn(idx_C5Nj) = &
        +k(2901)*n(idx_C5Hj)*n(idx_N) &
        -k(2904)*n(idx_C5Nj)*n(idx_H2) &
        -k(3958)*n(idx_C5Nj)*n(idx_E)

    !H2C4N+
    !H2C4N+
    dn(idx_H2C4Nj) = &
        +k(2933)*n(idx_HC4Nj)*n(idx_H2) &
        +k(2967)*n(idx_C4H3j)*n(idx_N) &
        -k(3020)*n(idx_H2C4Nj)*n(idx_H2) &
        -k(4053)*n(idx_H2C4Nj)*n(idx_E)

    !H3C4N+
    !H3C4N+
    dn(idx_H3C4Nj) = &
        +k(3020)*n(idx_H2C4Nj)*n(idx_H2) &
        -k(3058)*n(idx_H3C4Nj)*n(idx_H2) &
        -k(4097)*n(idx_H3C4Nj)*n(idx_E)

    !C7N+
    !C7N+
    dn(idx_C7Nj) = &
        +k(3053)*n(idx_C7Hj)*n(idx_N) &
        -k(3056)*n(idx_C7Nj)*n(idx_H2) &
        -k(4090)*n(idx_C7Nj)*n(idx_E)

    !C5H3N+
    !C5H3N+
    dn(idx_C5H3Nj) = &
        +k(3059)*n(idx_C4H4Nj)*n(idx_C) &
        +k(3061)*n(idx_C5H4j)*n(idx_N) &
        +k(3079)*n(idx_C5H5j)*n(idx_N) &
        +k(3159)*n(idx_C2H2j)*n(idx_HC3N) &
        -k(4109)*n(idx_C5H3Nj)*n(idx_E) &
        -k(4110)*n(idx_C5H3Nj)*n(idx_E)

    !C9N+
    !C9N+
    dn(idx_C9Nj) = &
        +k(3089)*n(idx_C9Hj)*n(idx_N) &
        -k(3092)*n(idx_C9Nj)*n(idx_H2) &
        -k(4150)*n(idx_C9Nj)*n(idx_E)

    !C7H3N+
    !C7H3N+
    dn(idx_C7H3Nj) = &
        +k(3093)*n(idx_C6H4Nj)*n(idx_C) &
        +k(3098)*n(idx_C7H4j)*n(idx_N) &
        +k(3106)*n(idx_C7H5j)*n(idx_N) &
        +k(3160)*n(idx_C2H2j)*n(idx_HC5N) &
        +k(3193)*n(idx_C4H2j)*n(idx_HC3N) &
        -k(4164)*n(idx_C7H3Nj)*n(idx_E) &
        -k(4165)*n(idx_C7H3Nj)*n(idx_E)

    !C9H3N+
    !C9H3N+
    dn(idx_C9H3Nj) = &
        +k(3109)*n(idx_C8H4Nj)*n(idx_C) &
        +k(3110)*n(idx_C9H4j)*n(idx_N) &
        +k(3161)*n(idx_C2H2j)*n(idx_HC7N) &
        +k(3195)*n(idx_C4H2j)*n(idx_HC5N) &
        -k(4188)*n(idx_C9H3Nj)*n(idx_E) &
        -k(4189)*n(idx_C9H3Nj)*n(idx_E)

    !OCS+H2
    !OCS+H2
    dn(idx_OCSjH2) = &
        +k(3155)*n(idx_OCSj)*n(idx_H2) &
        -k(3908)*n(idx_OCSjH2)*n(idx_E)

    !H2C3O+
    !H2C3O+
    dn(idx_H2C3Oj) = &
        +k(3157)*n(idx_C2H2j)*n(idx_CO) &
        -k(3974)*n(idx_H2C3Oj)*n(idx_E) &
        -k(3975)*n(idx_H2C3Oj)*n(idx_E) &
        -k(3976)*n(idx_H2C3Oj)*n(idx_E) &
        -k(3977)*n(idx_H2C3Oj)*n(idx_E) &
        -k(3978)*n(idx_H2C3Oj)*n(idx_E)

    !H3C3O+
    !H3C3O+
    dn(idx_H3C3Oj) = &
        +k(3183)*n(idx_C2H3j)*n(idx_CO) &
        -k(4054)*n(idx_H3C3Oj)*n(idx_E) &
        -k(4055)*n(idx_H3C3Oj)*n(idx_E) &
        -k(4056)*n(idx_H3C3Oj)*n(idx_E)

    !C5H4N+
    !C5H4N+
    dn(idx_C5H4Nj) = &
        +k(3188)*n(idx_C3H2Nj)*n(idx_C2H2) &
        -k(4136)*n(idx_C5H4Nj)*n(idx_E) &
        -k(4137)*n(idx_C5H4Nj)*n(idx_E)

    !C8H5+
    !C8H5+
    dn(idx_C8H5j) = &
        +k(3202)*n(idx_C4H3j)*n(idx_C4H2) &
        -k(4186)*n(idx_C8H5j)*n(idx_E) &
        -k(4187)*n(idx_C8H5j)*n(idx_E)

    !C9H5+
    !C9H5+
    dn(idx_C9H5j) = &
        +k(3204)*n(idx_C5H3j)*n(idx_C4H2) &
        -k(4192)*n(idx_C9H5j)*n(idx_E) &
        -k(4193)*n(idx_C9H5j)*n(idx_E)

end subroutine trace
