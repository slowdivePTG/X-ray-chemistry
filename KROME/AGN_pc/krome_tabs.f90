
!############### MODULE ##############
module krome_tabs
contains

  !***********************+
  function coe_tab(n)
    !interface to tabs
    use krome_subs
    use krome_getphys
    use krome_phfuncs
    use krome_grfuncs
    use krome_constants
    use krome_commons
    use krome_user_commons
    implicit none
    integer::idx,j
    real*8::Tgas, coe_tab(nrea),n(nspec),small

    Tgas = max(n(idx_Tgas),phys_Tcmb)
    small = 0d0

    coe_tab(:) = coe(n(:))

  end function coe_tab

  !**************************
  !compute rates that remain constant during solver call
  subroutine makeStoreOnceRates(n)
    use krome_commons
    implicit none
    real*8,intent(in)::n(nspec)
    real*8::small

    small = 0d0
    rateEvaluateOnce(:) = 0d0

    !C -> C+ + E
    rateEvaluateOnce(14) = small + (1.02e+03&
        *user_crate)

    !CL -> CL+ + E
    rateEvaluateOnce(15) = small + (3.00e+03&
        *user_crate)

    !FE -> FE+ + E
    rateEvaluateOnce(16) = small + (1.50e+03&
        *user_crate)

    !H -> H+ + E
    rateEvaluateOnce(17) = small + (4.60e-01&
        *user_crate)

    !HE -> HE+ + E
    rateEvaluateOnce(18) = small + (5.00e-01&
        *user_crate)

    !MG -> MG+ + E
    rateEvaluateOnce(19) = small + (1.13e+02&
        *user_crate)

    !N -> N+ + E
    rateEvaluateOnce(20) = small + (2.10e+00&
        *user_crate)

    !NA -> NA+ + E
    rateEvaluateOnce(21) = small + (1.70e+01&
        *user_crate)

    !O -> O+ + E
    rateEvaluateOnce(22) = small + (2.80e+00&
        *user_crate)

    !P -> P+ + E
    rateEvaluateOnce(23) = small + (1.50e+03&
        *user_crate)

    !S -> S+ + E
    rateEvaluateOnce(24) = small + (9.60e+02&
        *user_crate)

    !SI -> SI+ + E
    rateEvaluateOnce(25) = small + (4.23e+03&
        *user_crate)

    !C2 -> C + C
    rateEvaluateOnce(26) = small + (2.37e+02&
        *user_crate)

    !CCL -> C + CL
    rateEvaluateOnce(27) = small + (5.00e+02&
        *user_crate)

    !CH -> C + H
    rateEvaluateOnce(28) = small + (7.30e+02&
        *user_crate)

    !CLO -> CL + O
    rateEvaluateOnce(29) = small + (5.00e+02&
        *user_crate)

    !CN -> C + N
    rateEvaluateOnce(30) = small + (1.06e+04&
        *user_crate)

    !CO -> C + O
    rateEvaluateOnce(31) = small + (5.00e+00&
        *user_crate)

    !CO -> CO+ + E
    rateEvaluateOnce(32) = small + (3.00e+00&
        *user_crate)

    !CP -> C + P
    rateEvaluateOnce(33) = small + (5.00e+02&
        *user_crate)

    !CS -> C + S
    rateEvaluateOnce(34) = small + (5.00e+02&
        *user_crate)

    !H2 -> H + H
    rateEvaluateOnce(35) = small + (1.00e-01&
        *user_crate)

    !H2 -> H+ + H + E
    rateEvaluateOnce(36) = small + (2.20e-02&
        *user_crate)

    !H2 -> H+ + H-
    rateEvaluateOnce(37) = small + (3.00e-04&
        *user_crate)

    !H2 -> H2+ + E
    rateEvaluateOnce(38) = small + (9.30e-01&
        *user_crate)

    !HCL -> H + CL
    rateEvaluateOnce(39) = small + (6.10e+02&
        *user_crate)

    !HF -> F + H
    rateEvaluateOnce(40) = small + (8.70e+00&
        *user_crate)

    !HS -> H + S
    rateEvaluateOnce(41) = small + (5.00e+02&
        *user_crate)

    !MGH -> MG + H
    rateEvaluateOnce(42) = small + (5.00e+02&
        *user_crate)

    !N2 -> N + N
    rateEvaluateOnce(43) = small + (5.00e+00&
        *user_crate)

    !NAH -> NA + H
    rateEvaluateOnce(44) = small + (5.00e+02&
        *user_crate)

    !NH -> N + H
    rateEvaluateOnce(45) = small + (5.00e+02&
        *user_crate)

    !NO -> N + O
    rateEvaluateOnce(46) = small + (4.82e+02&
        *user_crate)

    !NO -> NO+ + E
    rateEvaluateOnce(47) = small + (4.94e+02&
        *user_crate)

    !NS -> N + S
    rateEvaluateOnce(48) = small + (5.00e+02&
        *user_crate)

    !O2 -> O + O
    rateEvaluateOnce(49) = small + (7.50e+02&
        *user_crate)

    !O2 -> O2+ + E
    rateEvaluateOnce(50) = small + (1.17e+02&
        *user_crate)

    !OH -> O + H
    rateEvaluateOnce(51) = small + (5.10e+02&
        *user_crate)

    !PH -> P + H
    rateEvaluateOnce(52) = small + (5.00e+02&
        *user_crate)

    !PN -> P + N
    rateEvaluateOnce(53) = small + (5.00e+02&
        *user_crate)

    !PO -> P + O
    rateEvaluateOnce(54) = small + (5.00e+02&
        *user_crate)

    !S2 -> S + S
    rateEvaluateOnce(55) = small + (5.00e+02&
        *user_crate)

    !SIC -> SI + C
    rateEvaluateOnce(56) = small + (5.00e+02&
        *user_crate)

    !SIH -> SI + H
    rateEvaluateOnce(57) = small + (5.00e+02&
        *user_crate)

    !SIN -> SI + N
    rateEvaluateOnce(58) = small + (5.00e+02&
        *user_crate)

    !SIO -> SI + O
    rateEvaluateOnce(59) = small + (5.00e+02&
        *user_crate)

    !SIS -> SI + S
    rateEvaluateOnce(60) = small + (5.00e+02&
        *user_crate)

    !SO -> S + O
    rateEvaluateOnce(61) = small + (5.00e+02&
        *user_crate)

    !C2H -> C2 + H
    rateEvaluateOnce(62) = small + (5.00e+03&
        *user_crate)

    !C2N -> C + CN
    rateEvaluateOnce(63) = small + (1.00e+03&
        *user_crate)

    !C2S -> CS + C
    rateEvaluateOnce(64) = small + (1.50e+03&
        *user_crate)

    !C3 -> C2 + C
    rateEvaluateOnce(65) = small + (1.12e+03&
        *user_crate)

    !CCO -> C2 + O
    rateEvaluateOnce(66) = small + (7.50e+02&
        *user_crate)

    !CCO -> CO + C
    rateEvaluateOnce(67) = small + (7.50e+02&
        *user_crate)

    !CCP -> C2 + P
    rateEvaluateOnce(68) = small + (7.50e+02&
        *user_crate)

    !CCP -> CP + C
    rateEvaluateOnce(69) = small + (7.50e+02&
        *user_crate)

    !CH2 -> CH2+ + E
    rateEvaluateOnce(70) = small + (5.00e+02&
        *user_crate)

    !CO2 -> CO + O
    rateEvaluateOnce(71) = small + (1.71e+03&
        *user_crate)

    !H2O -> OH + H
    rateEvaluateOnce(72) = small + (9.70e+02&
        *user_crate)

    !H2S -> H2 + S
    rateEvaluateOnce(73) = small + (5.15e+03&
        *user_crate)

    !H2S -> H2S+ + E
    rateEvaluateOnce(74) = small + (1.70e+03&
        *user_crate)

    !HCN -> CN + H
    rateEvaluateOnce(75) = small + (3.12e+03&
        *user_crate)

    !HCO -> CO + H
    rateEvaluateOnce(76) = small + (4.21e+02&
        *user_crate)

    !HCO -> HCO+ + E
    rateEvaluateOnce(77) = small + (1.17e+03&
        *user_crate)

    !HCP -> CP + H
    rateEvaluateOnce(78) = small + (1.50e+03&
        *user_crate)

    !HCS -> HCS+ + E
    rateEvaluateOnce(79) = small + (1.50e+03&
        *user_crate)

    !HCSI -> CH + SI
    rateEvaluateOnce(80) = small + (1.50e+03&
        *user_crate)

    !HNC -> CN + H
    rateEvaluateOnce(81) = small + (3.00e+03&
        *user_crate)

    !HNO -> HNO+ + E
    rateEvaluateOnce(82) = small + (1.00e+03&
        *user_crate)

    !HNSI -> SIN + H
    rateEvaluateOnce(83) = small + (1.50e+03&
        *user_crate)

    !HPO -> PO + H
    rateEvaluateOnce(84) = small + (1.50e+03&
        *user_crate)

    !HS2 -> HS + S
    rateEvaluateOnce(85) = small + (1.50e+03&
        *user_crate)

    !N2O -> NO + N
    rateEvaluateOnce(86) = small + (1.50e+03&
        *user_crate)

    !NAOH -> NA + OH
    rateEvaluateOnce(87) = small + (1.50e+03&
        *user_crate)

    !NH2 -> NH + H
    rateEvaluateOnce(88) = small + (8.00e+01&
        *user_crate)

    !NH2 -> NH2+ + E
    rateEvaluateOnce(89) = small + (6.50e+02&
        *user_crate)

    !NO2 -> NO + O
    rateEvaluateOnce(90) = small + (1.50e+03&
        *user_crate)

    !O2H -> O + OH
    rateEvaluateOnce(91) = small + (7.50e+02&
        *user_crate)

    !O2H -> O2 + H
    rateEvaluateOnce(92) = small + (7.50e+02&
        *user_crate)

    !OCN -> CN + O
    rateEvaluateOnce(93) = small + (1.50e+03&
        *user_crate)

    !OCS -> CO + S
    rateEvaluateOnce(94) = small + (5.35e+03&
        *user_crate)

    !OCS -> OCS+ + E
    rateEvaluateOnce(95) = small + (1.44e+03&
        *user_crate)

    !PH2 -> PH + H
    rateEvaluateOnce(96) = small + (1.50e+03&
        *user_crate)

    !SIC2 -> SIC + C
    rateEvaluateOnce(97) = small + (1.50e+03&
        *user_crate)

    !SIH2 -> SIH + H
    rateEvaluateOnce(98) = small + (1.50e+03&
        *user_crate)

    !SINC -> SI + CN
    rateEvaluateOnce(99) = small + (1.50e+03&
        *user_crate)

    !SIO2 -> SIO + O
    rateEvaluateOnce(100) = small + (1.50e+03&
        *user_crate)

    !SO2 -> SO + O
    rateEvaluateOnce(101) = small + (1.88e+03&
        *user_crate)

    !C2H2 -> C2H + H
    rateEvaluateOnce(102) = small + (5.15e+03&
        *user_crate)

    !C2H2 -> C2H2+ + E
    rateEvaluateOnce(103) = small + (1.31e+03&
        *user_crate)

    !C3H -> C3 + H
    rateEvaluateOnce(104) = small + (5.00e+03&
        *user_crate)

    !HC3 -> C3 + H
    rateEvaluateOnce(105) = small + (5.00e+03&
        *user_crate)

    !C3N -> C2 + CN
    rateEvaluateOnce(106) = small + (1.75e+03&
        *user_crate)

    !C3O -> C2 + CO
    rateEvaluateOnce(107) = small + (6.60e+03&
        *user_crate)

    !C3P -> CCP + C
    rateEvaluateOnce(108) = small + (1.50e+03&
        *user_crate)

    !C3S -> C2 + CS
    rateEvaluateOnce(109) = small + (1.50e+03&
        *user_crate)

    !C4 -> C3 + C
    rateEvaluateOnce(110) = small + (1.00e+03&
        *user_crate)

    !CH3 -> CH2 + H
    rateEvaluateOnce(111) = small + (5.00e+02&
        *user_crate)

    !CH3 -> CH3+ + E
    rateEvaluateOnce(112) = small + (5.00e+02&
        *user_crate)

    !H2CO -> CO + H2
    rateEvaluateOnce(113) = small + (2.66e+03&
        *user_crate)

    !H2CS -> H2 + CS
    rateEvaluateOnce(114) = small + (1.50e+03&
        *user_crate)

    !H2O2 -> OH + OH
    rateEvaluateOnce(115) = small + (1.50e+03&
        *user_crate)

    !H2S2 -> HS + HS
    rateEvaluateOnce(116) = small + (1.50e+03&
        *user_crate)

    !H2SIO -> SIO + H2
    rateEvaluateOnce(117) = small + (1.50e+03&
        *user_crate)

    !HCCP -> CCP + H
    rateEvaluateOnce(118) = small + (1.50e+03&
        *user_crate)

    !NH3 -> NH + H2
    rateEvaluateOnce(119) = small + (5.40e+02&
        *user_crate)

    !NH3 -> NH2 + H
    rateEvaluateOnce(120) = small + (1.32e+03&
        *user_crate)

    !NH3 -> NH3+ + E
    rateEvaluateOnce(121) = small + (5.75e+02&
        *user_crate)

    !SIC2H -> SIC2 + H
    rateEvaluateOnce(122) = small + (1.50e+03&
        *user_crate)

    !SIC3 -> SIC2 + C
    rateEvaluateOnce(123) = small + (1.50e+03&
        *user_crate)

    !SICH2 -> SIC + H2
    rateEvaluateOnce(124) = small + (1.50e+03&
        *user_crate)

    !SIH3 -> SIH2 + H
    rateEvaluateOnce(125) = small + (1.50e+03&
        *user_crate)

    !CH2CN -> CH2 + CN
    rateEvaluateOnce(126) = small + (5.00e+03&
        *user_crate)

    !C2H2O -> CH2 + CO
    rateEvaluateOnce(127) = small + (9.15e+02&
        *user_crate)

    !C2H2O -> C2H2O+ + E
    rateEvaluateOnce(128) = small + (1.22e+03&
        *user_crate)

    !C2H3 -> C2H2 + H
    rateEvaluateOnce(129) = small + (1.50e+03&
        *user_crate)

    !C3H2 -> C3H + H
    rateEvaluateOnce(130) = small + (5.00e+03&
        *user_crate)

    !H2C3 -> HC3 + H
    rateEvaluateOnce(131) = small + (5.00e+03&
        *user_crate)

    !C4H -> C4 + H
    rateEvaluateOnce(132) = small + (5.00e+03&
        *user_crate)

    !C4N -> C3 + CN
    rateEvaluateOnce(133) = small + (1.00e+03&
        *user_crate)

    !C4P -> C3P + C
    rateEvaluateOnce(134) = small + (1.50e+03&
        *user_crate)

    !C4S -> C3 + CS
    rateEvaluateOnce(135) = small + (1.50e+03&
        *user_crate)

    !C5 -> C4 + C
    rateEvaluateOnce(136) = small + (1.00e+03&
        *user_crate)

    !CH2O2 -> HCO + OH
    rateEvaluateOnce(137) = small + (2.49e+02&
        *user_crate)

    !CH2O2 -> CH2O2+ + E
    rateEvaluateOnce(138) = small + (6.50e+02&
        *user_crate)

    !CH2PH -> HCP + H2
    rateEvaluateOnce(139) = small + (1.50e+03&
        *user_crate)

    !CH3N -> HCN + H2
    rateEvaluateOnce(140) = small + (4.98e+03&
        *user_crate)

    !CH4 -> CH2 + H2
    rateEvaluateOnce(141) = small + (2.34e+03&
        *user_crate)

    !HC3N -> C2H + CN
    rateEvaluateOnce(142) = small + (1.72e+03&
        *user_crate)

    !SIC2H2 -> SIC2 + H2
    rateEvaluateOnce(143) = small + (1.50e+03&
        *user_crate)

    !SIC3H -> SIC3 + H
    rateEvaluateOnce(144) = small + (1.50e+03&
        *user_crate)

    !SIC4 -> SIC2 + C2
    rateEvaluateOnce(145) = small + (1.50e+03&
        *user_crate)

    !SICH3 -> SICH2 + H
    rateEvaluateOnce(146) = small + (1.50e+03&
        *user_crate)

    !SIH4 -> SIH2 + H2
    rateEvaluateOnce(147) = small + (1.50e+03&
        *user_crate)

    !CH3CN -> CH3 + CN
    rateEvaluateOnce(148) = small + (4.76e+03&
        *user_crate)

    !CH3CN -> CH3CN+ + E
    rateEvaluateOnce(149) = small + (2.24e+03&
        *user_crate)

    !C2H4 -> C2H2 + H2
    rateEvaluateOnce(150) = small + (3.70e+03&
        *user_crate)

    !C2H4 -> C2H4+ + E
    rateEvaluateOnce(151) = small + (7.80e+02&
        *user_crate)

    !C3H3 -> C3H2 + H
    rateEvaluateOnce(152) = small + (2.50e+03&
        *user_crate)

    !C3H3 -> H2C3 + H
    rateEvaluateOnce(153) = small + (2.50e+03&
        *user_crate)

    !C4H2 -> C2H + C2H
    rateEvaluateOnce(154) = small + (1.73e+03&
        *user_crate)

    !C4H2 -> C4H + H
    rateEvaluateOnce(155) = small + (1.73e+03&
        *user_crate)

    !C4H2 -> C4H2+ + E
    rateEvaluateOnce(156) = small + (1.12e+03&
        *user_crate)

    !C5H -> C5 + H
    rateEvaluateOnce(157) = small + (5.00e+03&
        *user_crate)

    !C5N -> C4 + CN
    rateEvaluateOnce(158) = small + (1.75e+03&
        *user_crate)

    !C6 -> C5 + C
    rateEvaluateOnce(159) = small + (1.00e+03&
        *user_crate)

    !CH3OH -> CH3 + OH
    rateEvaluateOnce(160) = small + (1.50e+03&
        *user_crate)

    !CH3OH -> H2CO + H2
    rateEvaluateOnce(161) = small + (3.17e+03&
        *user_crate)

    !CH3OH -> H3CO+ + H + E
    rateEvaluateOnce(162) = small + (9.90e+01&
        *user_crate)

    !CH3OH -> CH4O+ + E
    rateEvaluateOnce(163) = small + (1.44e+03&
        *user_crate)

    !C2H4O -> CH3 + HCO
    rateEvaluateOnce(164) = small + (5.25e+02&
        *user_crate)

    !C2H4O -> CH4 + CO
    rateEvaluateOnce(165) = small + (5.25e+02&
        *user_crate)

    !C2H4O -> C2H4O+ + E
    rateEvaluateOnce(166) = small + (1.12e+03&
        *user_crate)

    !C2H5 -> C2H4 + H
    rateEvaluateOnce(167) = small + (1.50e+03&
        *user_crate)

    !C3H3N -> C2H3 + CN
    rateEvaluateOnce(168) = small + (1.50e+03&
        *user_crate)

    !C3H4 -> C3H3 + H
    rateEvaluateOnce(169) = small + (3.28e+03&
        *user_crate)

    !C3H4 -> C3H4+ + E
    rateEvaluateOnce(170) = small + (5.30e+03&
        *user_crate)

    !C5H2 -> C5H + H
    rateEvaluateOnce(171) = small + (1.75e+03&
        *user_crate)

    !C6H -> C6 + H
    rateEvaluateOnce(172) = small + (5.00e+03&
        *user_crate)

    !C7 -> C6 + C
    rateEvaluateOnce(173) = small + (1.00e+03&
        *user_crate)

    !CH5N -> HCN + H2 + H + H
    rateEvaluateOnce(174) = small + (1.41e+03&
        *user_crate)

    !CH5N -> CH5N+ + E
    rateEvaluateOnce(175) = small + (1.12e+03&
        *user_crate)

    !HC5N -> C4H + CN
    rateEvaluateOnce(176) = small + (1.75e+03&
        *user_crate)

    !C6H2 -> C6H + H
    rateEvaluateOnce(177) = small + (1.75e+03&
        *user_crate)

    !C7H -> C7 + H
    rateEvaluateOnce(178) = small + (5.00e+03&
        *user_crate)

    !C7N -> C6 + CN
    rateEvaluateOnce(179) = small + (1.75e+03&
        *user_crate)

    !C8 -> C7 + C
    rateEvaluateOnce(180) = small + (1.00e+03&
        *user_crate)

    !CH3C3N -> CH3 + C3N
    rateEvaluateOnce(181) = small + (1.50e+03&
        *user_crate)

    !HCOOCH3 -> H2CO + H2CO
    rateEvaluateOnce(182) = small + (1.50e+03&
        *user_crate)

    !C2H5OH -> C2H5OH+ + E
    rateEvaluateOnce(183) = small + (2.74e+03&
        *user_crate)

    !C7H2 -> C7H + H
    rateEvaluateOnce(184) = small + (1.75e+03&
        *user_crate)

    !C8H -> C8 + H
    rateEvaluateOnce(185) = small + (5.00e+03&
        *user_crate)

    !C9 -> C8 + C
    rateEvaluateOnce(186) = small + (1.00e+03&
        *user_crate)

    !CH3C4H -> CH3 + C4H
    rateEvaluateOnce(187) = small + (1.50e+03&
        *user_crate)

    !CH3OCH3 -> H2CO + CH4
    rateEvaluateOnce(188) = small + (1.72e+03&
        *user_crate)

    !CH3OCH3 -> CH3OCH3+ + E
    rateEvaluateOnce(189) = small + (1.12e+03&
        *user_crate)

    !HC7N -> C6H + CN
    rateEvaluateOnce(190) = small + (1.75e+03&
        *user_crate)

    !C2H6CO -> C2H2O + CH4
    rateEvaluateOnce(191) = small + (1.50e+03&
        *user_crate)

    !C8H2 -> C8H + H
    rateEvaluateOnce(192) = small + (1.75e+03&
        *user_crate)

    !C9H -> C9 + H
    rateEvaluateOnce(193) = small + (5.00e+03&
        *user_crate)

    !C9N -> C8 + CN
    rateEvaluateOnce(194) = small + (1.75e+03&
        *user_crate)

    !CH3C5N -> CH3 + C5N
    rateEvaluateOnce(195) = small + (1.50e+03&
        *user_crate)

    !C9H2 -> C9H + H
    rateEvaluateOnce(196) = small + (1.75e+03&
        *user_crate)

    !CH3C6H -> CH3 + C6H
    rateEvaluateOnce(197) = small + (1.50e+03&
        *user_crate)

    !CH3C7N -> CH3 + C7N
    rateEvaluateOnce(198) = small + (1.50e+03&
        *user_crate)

    !HC9N -> C8H + CN
    rateEvaluateOnce(199) = small + (1.75e+03&
        *user_crate)

    !CH+ -> C + H+
    rateEvaluateOnce(200) = small + (1.76e+02&
        *user_crate)

    !C -> C+ + E
    rateEvaluateOnce(4250) = small + (2.16e-10&
        *exp(-2.61e+00*user_Av))

    !CL -> CL+ + E
    rateEvaluateOnce(4251) = small + (3.30e-11&
        *exp(-3.10e+00*user_Av))

    !FE -> FE+ + E
    rateEvaluateOnce(4252) = small + (1.20e-10&
        *exp(-1.50e+00*user_Av))

    !MG -> MG+ + E
    rateEvaluateOnce(4253) = small + (4.50e-11&
        *exp(-1.40e+00*user_Av))

    !NA -> NA+ + E
    rateEvaluateOnce(4254) = small + (5.60e-12&
        *exp(-2.00e+00*user_Av))

    !S -> S+ + E
    rateEvaluateOnce(4255) = small + (7.20e-10&
        *exp(-2.40e+00*user_Av))

    !SI -> SI+ + E
    rateEvaluateOnce(4256) = small + (1.20e-09&
        *exp(-1.60e+00*user_Av))

    !C2 -> C + C
    rateEvaluateOnce(4257) = small + (4.70e-11&
        *exp(-2.60e+00*user_Av))

    !C2 -> C2+ + E
    rateEvaluateOnce(4258) = small + (1.00e-10&
        *exp(-2.00e+00*user_Av))

    !CCL -> CL + C
    rateEvaluateOnce(4259) = small + (1.00e-10&
        *exp(-2.00e+00*user_Av))

    !CH -> C + H
    rateEvaluateOnce(4260) = small + (1.40e-10&
        *exp(-1.50e+00*user_Av))

    !CH -> CH+ + E
    rateEvaluateOnce(4261) = small + (2.90e-10&
        *exp(-2.80e+00*user_Av))

    !CLO -> CL + O
    rateEvaluateOnce(4262) = small + (1.00e-10&
        *exp(-2.00e+00*user_Av))

    !CN -> C + N
    rateEvaluateOnce(4263) = small + (1.00e-09&
        *exp(-2.80e+00*user_Av))

    !CO -> C + O
    rateEvaluateOnce(4264) = small + (3.10e-11&
        *exp(-2.54e+00*user_Av))

    !CS -> C + S
    rateEvaluateOnce(4265) = small + (9.70e-10&
        *exp(-2.00e+00*user_Av))

    !H2 -> H + H
    rateEvaluateOnce(4266) = small + (3.40e-11&
        *exp(-2.50e+00*user_Av))

    !HCL -> CL + H
    rateEvaluateOnce(4267) = small + (1.10e-10&
        *exp(-1.80e+00*user_Av))

    !HF -> F + H
    rateEvaluateOnce(4268) = small + (1.17e-10&
        *exp(-2.21e+00*user_Av))

    !HS -> H + S
    rateEvaluateOnce(4269) = small + (1.00e-11&
        *exp(-2.00e+00*user_Av))

    !N2 -> N + N
    rateEvaluateOnce(4270) = small + (5.00e-12&
        *exp(-3.00e+00*user_Av))

    !NH -> H + N
    rateEvaluateOnce(4271) = small + (4.00e-10&
        *exp(-1.50e+00*user_Av))

    !NH -> NH+ + E
    rateEvaluateOnce(4272) = small + (1.00e-11&
        *exp(-2.00e+00*user_Av))

    !NO -> N + O
    rateEvaluateOnce(4273) = small + (3.00e-10&
        *exp(-2.00e+00*user_Av))

    !NO -> NO+ + E
    rateEvaluateOnce(4274) = small + (2.00e-10&
        *exp(-2.00e+00*user_Av))

    !NS -> N + S
    rateEvaluateOnce(4275) = small + (1.00e-11&
        *exp(-2.00e+00*user_Av))

    !O2 -> O + O
    rateEvaluateOnce(4276) = small + (3.30e-10&
        *exp(-1.40e+00*user_Av))

    !O2 -> O2+ + E
    rateEvaluateOnce(4277) = small + (6.20e-12&
        *exp(-3.10e+00*user_Av))

    !OH -> O + H
    rateEvaluateOnce(4278) = small + (1.68e-10&
        *exp(-1.66e+00*user_Av))

    !OH -> OH+ + E
    rateEvaluateOnce(4279) = small + (1.60e-12&
        *exp(-3.10e+00*user_Av))

    !SIC -> SI + C
    rateEvaluateOnce(4280) = small + (1.00e-10&
        *exp(-2.30e+00*user_Av))

    !SIH -> SI + H
    rateEvaluateOnce(4281) = small + (1.00e-10&
        *exp(-2.30e+00*user_Av))

    !SIO -> SI + O
    rateEvaluateOnce(4282) = small + (1.00e-10&
        *exp(-2.30e+00*user_Av))

    !SIS -> SI + S
    rateEvaluateOnce(4283) = small + (1.00e-10&
        *exp(-2.30e+00*user_Av))

    !SO -> O + S
    rateEvaluateOnce(4284) = small + (3.30e-10&
        *exp(-1.40e+00*user_Av))

    !C2H -> C2 + H
    rateEvaluateOnce(4285) = small + (1.00e-09&
        *exp(-1.70e+00*user_Av))

    !C2H -> C2H+ + E
    rateEvaluateOnce(4286) = small + (1.00e-11&
        *exp(-2.00e+00*user_Av))

    !C2N -> C2 + N
    rateEvaluateOnce(4287) = small + (1.00e-10&
        *exp(-1.70e+00*user_Av))

    !C2N -> CN + C
    rateEvaluateOnce(4288) = small + (1.00e-09&
        *exp(-1.70e+00*user_Av))

    !C2S -> C2 + S
    rateEvaluateOnce(4289) = small + (1.00e-10&
        *exp(-2.00e+00*user_Av))

    !C3 -> C2 + C
    rateEvaluateOnce(4290) = small + (2.60e-10&
        *exp(-2.28e+00*user_Av))

    !CH2 -> CH + H
    rateEvaluateOnce(4291) = small + (5.00e-11&
        *exp(-1.70e+00*user_Av))

    !CH2 -> CH2+ + E
    rateEvaluateOnce(4292) = small + (1.00e-09&
        *exp(-2.30e+00*user_Av))

    !CO2 -> CO + O
    rateEvaluateOnce(4293) = small + (3.13e-10&
        *exp(-2.03e+00*user_Av))

    !H2O -> OH + H
    rateEvaluateOnce(4294) = small + (3.28e-10&
        *exp(-1.63e+00*user_Av))

    !H2O -> H2O+ + E
    rateEvaluateOnce(4295) = small + (2.10e-11&
        *exp(-3.10e+00*user_Av))

    !H2S -> HS + H
    rateEvaluateOnce(4296) = small + (3.20e-10&
        *exp(-1.70e+00*user_Av))

    !HCN -> CN + H
    rateEvaluateOnce(4297) = small + (5.48e-10&
        *exp(-2.00e+00*user_Av))

    !HCO -> H + CO
    rateEvaluateOnce(4298) = small + (5.87e-10&
        *exp(-5.30e-01*user_Av))

    !HCO -> HCO+ + E
    rateEvaluateOnce(4299) = small + (2.46e-10&
        *exp(-2.11e+00*user_Av))

    !HNC -> CN + H
    rateEvaluateOnce(4300) = small + (5.48e-10&
        *exp(-2.00e+00*user_Av))

    !HNO -> NO + H
    rateEvaluateOnce(4301) = small + (1.70e-10&
        *exp(-5.30e-01*user_Av))

    !NAOH -> NA + OH
    rateEvaluateOnce(4302) = small + (1.00e-09&
        *exp(-1.70e+00*user_Av))

    !NH2 -> NH + H
    rateEvaluateOnce(4303) = small + (2.11e-10&
        *exp(-1.52e+00*user_Av))

    !NH2 -> NH2+ + E
    rateEvaluateOnce(4304) = small + (1.73e-10&
        *exp(-2.59e+00*user_Av))

    !NO2 -> NO + O
    rateEvaluateOnce(4305) = small + (1.29e-09&
        *exp(-2.00e+00*user_Av))

    !OCN -> O + CN
    rateEvaluateOnce(4306) = small + (1.00e-11&
        *exp(-2.00e+00*user_Av))

    !OCS -> CO + S
    rateEvaluateOnce(4307) = small + (2.28e-09&
        *exp(-1.60e+00*user_Av))

    !OCS -> OCS+ + E
    rateEvaluateOnce(4308) = small + (2.37e-10&
        *exp(-2.71e+00*user_Av))

    !SO2 -> SO + O
    rateEvaluateOnce(4309) = small + (1.05e-09&
        *exp(-1.74e+00*user_Av))

    !C2H2 -> C2H + H
    rateEvaluateOnce(4310) = small + (1.81e-09&
        *exp(-1.72e+00*user_Av))

    !C2H2 -> C2H2+ + E
    rateEvaluateOnce(4311) = small + (2.07e-10&
        *exp(-2.67e+00*user_Av))

    !C3H -> C3 + H
    rateEvaluateOnce(4312) = small + (1.00e-09&
        *exp(-1.70e+00*user_Av))

    !HC3 -> C3 + H
    rateEvaluateOnce(4313) = small + (1.00e-09&
        *exp(-1.70e+00*user_Av))

    !C3N -> C2 + CN
    rateEvaluateOnce(4314) = small + (5.00e-10&
        *exp(-1.80e+00*user_Av))

    !C3O -> C2 + CO
    rateEvaluateOnce(4315) = small + (4.52e-09&
        *exp(-1.58e+00*user_Av))

    !C3S -> C2 + CS
    rateEvaluateOnce(4316) = small + (1.00e-10&
        *exp(-2.00e+00*user_Av))

    !C4 -> C2 + C2
    rateEvaluateOnce(4317) = small + (2.00e-10&
        *exp(-2.30e+00*user_Av))

    !C4 -> C3 + C
    rateEvaluateOnce(4318) = small + (2.00e-10&
        *exp(-2.30e+00*user_Av))

    !CH3 -> CH + H2
    rateEvaluateOnce(4319) = small + (3.00e-11&
        *exp(-1.70e+00*user_Av))

    !CH3 -> CH2 + H
    rateEvaluateOnce(4320) = small + (3.00e-11&
        *exp(-1.70e+00*user_Av))

    !CH3 -> CH3+ + E
    rateEvaluateOnce(4321) = small + (1.00e-10&
        *exp(-2.10e+00*user_Av))

    !H2CO -> CO + H + H
    rateEvaluateOnce(4322) = small + (4.40e-10&
        *exp(-1.60e+00*user_Av))

    !H2CO -> CO + H2
    rateEvaluateOnce(4323) = small + (4.40e-10&
        *exp(-1.60e+00*user_Av))

    !H2CO -> HCO+ + H + E
    rateEvaluateOnce(4324) = small + (1.40e-11&
        *exp(-3.10e+00*user_Av))

    !H2CO -> H2CO+ + E
    rateEvaluateOnce(4325) = small + (8.00e-11&
        *exp(-2.80e+00*user_Av))

    !H2CS -> CS + H2
    rateEvaluateOnce(4326) = small + (1.00e-09&
        *exp(-1.70e+00*user_Av))

    !NH3 -> NH + H2
    rateEvaluateOnce(4327) = small + (1.30e-10&
        *exp(-1.91e+00*user_Av))

    !NH3 -> NH2 + H
    rateEvaluateOnce(4328) = small + (4.94e-10&
        *exp(-1.65e+00*user_Av))

    !NH3 -> NH3+ + E
    rateEvaluateOnce(4329) = small + (1.24e-10&
        *exp(-2.47e+00*user_Av))

    !C2H2O -> CH2 + CO
    rateEvaluateOnce(4330) = small + (9.04e-10&
        *exp(-1.58e+00*user_Av))

    !C2H2O -> C2H2O+ + E
    rateEvaluateOnce(4331) = small + (3.44e-10&
        *exp(-2.01e+00*user_Av))

    !C2H3 -> C2H2 + H
    rateEvaluateOnce(4332) = small + (1.00e-09&
        *exp(-1.70e+00*user_Av))

    !C2H3 -> C2H3+ + E
    rateEvaluateOnce(4333) = small + (3.00e-10&
        *exp(-2.30e+00*user_Av))

    !C3H2 -> C3 + H2
    rateEvaluateOnce(4334) = small + (1.00e-09&
        *exp(-1.70e+00*user_Av))

    !H2C3 -> C3 + H2
    rateEvaluateOnce(4335) = small + (1.00e-09&
        *exp(-1.70e+00*user_Av))

    !C3H2 -> C3H + H
    rateEvaluateOnce(4336) = small + (1.00e-09&
        *exp(-1.70e+00*user_Av))

    !H2C3 -> HC3 + H
    rateEvaluateOnce(4337) = small + (1.00e-09&
        *exp(-1.70e+00*user_Av))

    !C4H -> C2H + C2
    rateEvaluateOnce(4338) = small + (1.00e-09&
        *exp(-1.70e+00*user_Av))

    !C4H -> C4 + H
    rateEvaluateOnce(4339) = small + (1.00e-09&
        *exp(-1.70e+00*user_Av))

    !C4N -> C3 + CN
    rateEvaluateOnce(4340) = small + (5.00e-10&
        *exp(-1.70e+00*user_Av))

    !C4S -> C3 + CS
    rateEvaluateOnce(4341) = small + (1.00e-10&
        *exp(-2.00e+00*user_Av))

    !C5 -> C3 + C2
    rateEvaluateOnce(4342) = small + (1.00e-11&
        *exp(-1.70e+00*user_Av))

    !CH2O2 -> HCO + OH
    rateEvaluateOnce(4343) = small + (2.75e-10&
        *exp(-1.80e+00*user_Av))

    !CH2O2 -> CH2O2+ + E
    rateEvaluateOnce(4344) = small + (1.73e-10&
        *exp(-2.59e+00*user_Av))

    !CH3N -> HCN + H2
    rateEvaluateOnce(4345) = small + (1.70e-09&
        *exp(-1.63e+00*user_Av))

    !CH4 -> CH + H + H2
    rateEvaluateOnce(4346) = small + (1.60e-10&
        *exp(-2.20e+00*user_Av))

    !CH4 -> CH2 + H2
    rateEvaluateOnce(4347) = small + (4.80e-10&
        *exp(-2.20e+00*user_Av))

    !CH4 -> CH3 + H
    rateEvaluateOnce(4348) = small + (1.60e-10&
        *exp(-2.20e+00*user_Av))

    !HC3N -> C2H + CN
    rateEvaluateOnce(4349) = small + (9.54e-10&
        *exp(-1.83e+00*user_Av))

    !CH3CN -> CH3 + CN
    rateEvaluateOnce(4350) = small + (1.56e-09&
        *exp(-1.95e+00*user_Av))

    !CH3CN -> CH3CN+ + E
    rateEvaluateOnce(4351) = small + (5.29e-10&
        *exp(-3.11e+00*user_Av))

    !C2H4 -> C2H2 + H2
    rateEvaluateOnce(4352) = small + (1.62e-09&
        *exp(-1.61e+00*user_Av))

    !C2H4 -> C2H4+ + E
    rateEvaluateOnce(4353) = small + (1.18e-10&
        *exp(-2.66e+00*user_Av))

    !C3H3 -> C3H + H2
    rateEvaluateOnce(4354) = small + (5.00e-10&
        *exp(-1.70e+00*user_Av))

    !C3H3 -> HC3 + H2
    rateEvaluateOnce(4355) = small + (5.00e-10&
        *exp(-1.70e+00*user_Av))

    !C3H3 -> C3H2 + H
    rateEvaluateOnce(4356) = small + (5.00e-10&
        *exp(-1.70e+00*user_Av))

    !C3H3 -> H2C3 + H
    rateEvaluateOnce(4357) = small + (5.00e-10&
        *exp(-1.70e+00*user_Av))

    !C4H2 -> C2H + C2H
    rateEvaluateOnce(4358) = small + (1.13e-09&
        *exp(-1.64e+00*user_Av))

    !C4H2 -> C4H + H
    rateEvaluateOnce(4359) = small + (1.13e-09&
        *exp(-1.64e+00*user_Av))

    !C4H2 -> C4H2+ + E
    rateEvaluateOnce(4360) = small + (2.60e-10&
        *exp(-2.28e+00*user_Av))

    !C5H -> C2H + C3
    rateEvaluateOnce(4361) = small + (1.00e-11&
        *exp(-1.70e+00*user_Av))

    !C5H -> C3H + C2
    rateEvaluateOnce(4362) = small + (5.00e-12&
        *exp(-1.70e+00*user_Av))

    !C5H -> HC3 + C2
    rateEvaluateOnce(4363) = small + (5.00e-12&
        *exp(-1.70e+00*user_Av))

    !C5H -> C5 + H
    rateEvaluateOnce(4364) = small + (1.00e-11&
        *exp(-1.70e+00*user_Av))

    !C5N -> C4 + CN
    rateEvaluateOnce(4365) = small + (5.00e-10&
        *exp(-1.70e+00*user_Av))

    !CH3OH -> H2CO + H2
    rateEvaluateOnce(4366) = small + (7.19e-10&
        *exp(-1.72e+00*user_Av))

    !CH3OH -> CH4O+ + E
    rateEvaluateOnce(4367) = small + (4.80e-10&
        *exp(-2.57e+00*user_Av))

    !C2H4O -> CH3 + HCO
    rateEvaluateOnce(4368) = small + (3.43e-10&
        *exp(-1.52e+00*user_Av))

    !C2H4O -> CH4 + CO
    rateEvaluateOnce(4369) = small + (3.43e-10&
        *exp(-1.52e+00*user_Av))

    !C2H4O -> C2H4O+ + E
    rateEvaluateOnce(4370) = small + (2.60e-10&
        *exp(-2.28e+00*user_Av))

    !C3H4 -> C3H2 + H2
    rateEvaluateOnce(4371) = small + (1.13e-10&
        *exp(-1.69e+00*user_Av))

    !C3H4 -> H2C3 + H2
    rateEvaluateOnce(4372) = small + (1.13e-10&
        *exp(-1.69e+00*user_Av))

    !C3H4 -> C3H3 + H
    rateEvaluateOnce(4373) = small + (1.84e-09&
        *exp(-1.72e+00*user_Av))

    !C3H4 -> C3H4+ + E
    rateEvaluateOnce(4374) = small + (9.88e-10&
        *exp(-2.37e+00*user_Av))

    !C4H4 -> C3H4 + C
    rateEvaluateOnce(4375) = small + (1.13e-09&
        *exp(-1.64e+00*user_Av))

    !C4H6 -> C3H6 + C
    rateEvaluateOnce(4376) = small + (1.13e-09&
        *exp(-1.64e+00*user_Av))

    !C5H2 -> C3H + C2H
    rateEvaluateOnce(4377) = small + (5.00e-12&
        *exp(-1.70e+00*user_Av))

    !C5H2 -> HC3 + C2H
    rateEvaluateOnce(4378) = small + (5.00e-12&
        *exp(-1.70e+00*user_Av))

    !C5H2 -> C5H + H
    rateEvaluateOnce(4379) = small + (1.00e-11&
        *exp(-1.70e+00*user_Av))

    !C6H -> C2H + C4
    rateEvaluateOnce(4380) = small + (5.00e-12&
        *exp(-1.70e+00*user_Av))

    !C6H -> C3H + C3
    rateEvaluateOnce(4381) = small + (2.50e-12&
        *exp(-1.70e+00*user_Av))

    !C6H -> HC3 + C3
    rateEvaluateOnce(4382) = small + (2.50e-12&
        *exp(-1.70e+00*user_Av))

    !CH5N -> CN + H2 + H2 + H
    rateEvaluateOnce(4383) = small + (9.42e-11&
        *exp(-1.76e+00*user_Av))

    !CH5N -> HCN + H2 + H + H
    rateEvaluateOnce(4384) = small + (3.50e-10&
        *exp(-1.73e+00*user_Av))

    !CH5N -> CH3 + NH2
    rateEvaluateOnce(4385) = small + (1.55e-10&
        *exp(-1.74e+00*user_Av))

    !CH5N -> CH3N + H + H
    rateEvaluateOnce(4386) = small + (6.63e-11&
        *exp(-1.51e+00*user_Av))

    !CH5N -> CH5N+ + E
    rateEvaluateOnce(4387) = small + (2.60e-10&
        *exp(-2.28e+00*user_Av))

    !HC5N -> H + C5N
    rateEvaluateOnce(4388) = small + (5.00e-10&
        *exp(-1.83e+00*user_Av))

    !HC5N -> C4H + CN
    rateEvaluateOnce(4389) = small + (5.00e-10&
        *exp(-1.83e+00*user_Av))

    !CH3C3N -> C3N + CH3
    rateEvaluateOnce(4390) = small + (2.00e-11&
        *exp(-1.70e+00*user_Av))

    !NC4N -> CN + CN + C2
    rateEvaluateOnce(4391) = small + (2.00e-11&
        *exp(-1.70e+00*user_Av))

    !NC6N -> CN + CN + C4
    rateEvaluateOnce(4392) = small + (2.00e-11&
        *exp(-1.70e+00*user_Av))

    !NC8N -> CN + CN + C6
    rateEvaluateOnce(4393) = small + (2.00e-11&
        *exp(-1.70e+00*user_Av))

    !NC10N -> CN + CN + C8
    rateEvaluateOnce(4394) = small + (2.00e-11&
        *exp(-1.70e+00*user_Av))

    !NC12N -> CN + CN + C10
    rateEvaluateOnce(4395) = small + (2.00e-11&
        *exp(-1.70e+00*user_Av))

    !HC4N -> CH + C2 + CN
    rateEvaluateOnce(4396) = small + (2.00e-11&
        *exp(-1.70e+00*user_Av))

    !HC6N -> CH + C4 + CN
    rateEvaluateOnce(4397) = small + (2.00e-11&
        *exp(-1.70e+00*user_Av))

    !HC8N -> CH + C6 + CN
    rateEvaluateOnce(4398) = small + (2.00e-11&
        *exp(-1.70e+00*user_Av))

    !HC10N -> CH + C8 + CN
    rateEvaluateOnce(4399) = small + (2.00e-11&
        *exp(-1.70e+00*user_Av))

    !HC12N -> CH + C10 + CN
    rateEvaluateOnce(4400) = small + (2.00e-11&
        *exp(-1.70e+00*user_Av))

    !HC13N -> CH + C11 + CN
    rateEvaluateOnce(4401) = small + (2.00e-11&
        *exp(-1.70e+00*user_Av))

    !SIC2H3 -> SIC2H2 + H
    rateEvaluateOnce(4402) = small + (1.00e-10&
        *exp(-2.30e+00*user_Av))

    !SIC3H3 -> SIC3H + H2
    rateEvaluateOnce(4403) = small + (1.00e-10&
        *exp(-2.30e+00*user_Av))

    !SIC3H5 -> SIC3H + H2 + H2
    rateEvaluateOnce(4404) = small + (1.00e-10&
        *exp(-2.30e+00*user_Av))

    !SIC4H -> SI + C4H
    rateEvaluateOnce(4405) = small + (1.00e-10&
        *exp(-2.30e+00*user_Av))

    !SIC6H -> SI + C6H
    rateEvaluateOnce(4406) = small + (1.00e-10&
        *exp(-2.30e+00*user_Av))

    !SIC8H -> SI + C8H
    rateEvaluateOnce(4407) = small + (1.00e-10&
        *exp(-2.30e+00*user_Av))

    !C2H5OH -> C2H4 + H2O
    rateEvaluateOnce(4408) = small + (1.38e-09&
        *exp(-1.73e+00*user_Av))

    !C2H5OH -> C2H5OH+ + E
    rateEvaluateOnce(4409) = small + (5.27e-10&
        *exp(-2.35e+00*user_Av))

    !CH3C4H -> C4H + CH3
    rateEvaluateOnce(4410) = small + (2.00e-11&
        *exp(-1.70e+00*user_Av))

    !CH3OCH3 -> H2CO + CH4
    rateEvaluateOnce(4411) = small + (8.21e-10&
        *exp(-1.60e+00*user_Av))

    !CH3OCH3 -> CH3OCH3+ + E
    rateEvaluateOnce(4412) = small + (2.60e-10&
        *exp(-2.28e+00*user_Av))

    !C2+ -> C+ + C
    rateEvaluateOnce(4413) = small + (1.00e-11&
        *exp(-1.70e+00*user_Av))

    !CH+ -> C+ + H
    rateEvaluateOnce(4414) = small + (4.60e-12&
        *exp(-3.00e+00*user_Av))

    !H2+ -> H+ + H
    rateEvaluateOnce(4415) = small + (2.60e-10&
        *exp(-1.80e+00*user_Av))

    !OH+ -> H+ + O
    rateEvaluateOnce(4416) = small + (7.20e-12&
        *exp(-1.80e+00*user_Av))

    !SIH+ -> SI+ + H
    rateEvaluateOnce(4417) = small + (2.20e-09&
        *exp(-2.00e+00*user_Av))

    !C2H+ -> C2+ + H
    rateEvaluateOnce(4418) = small + (1.00e-11&
        *exp(-2.00e+00*user_Av))

    !CH2+ -> CH+ + H
    rateEvaluateOnce(4419) = small + (1.70e-09&
        *exp(-1.70e+00*user_Av))

    !H3+ -> H+ + H2
    rateEvaluateOnce(4420) = small + (2.00e-08&
        *exp(-1.80e+00*user_Av))

    !H3+ -> H2+ + H
    rateEvaluateOnce(4421) = small + (7.90e-09&
        *exp(-2.30e+00*user_Av))

    !CH3+ -> CH+ + H2
    rateEvaluateOnce(4422) = small + (1.00e-09&
        *exp(-1.70e+00*user_Av))

    !CH3+ -> CH2+ + H
    rateEvaluateOnce(4423) = small + (1.00e-09&
        *exp(-1.70e+00*user_Av))

    !C- -> C + E
    rateEvaluateOnce(4424) = small + (2.40e-07&
        *exp(-9.00e-01*user_Av))

    !H- -> H + E
    rateEvaluateOnce(4425) = small + (2.40e-07&
        *exp(-9.00e-01*user_Av))

    !O- -> O + E
    rateEvaluateOnce(4426) = small + (2.40e-07&
        *exp(-9.00e-01*user_Av))

    !S- -> S + E
    rateEvaluateOnce(4427) = small + (2.40e-07&
        *exp(-9.00e-01*user_Av))

    !CN- -> CN + E
    rateEvaluateOnce(4428) = small + (2.40e-07&
        *exp(-9.00e-01*user_Av))

    !OH- -> OH + E
    rateEvaluateOnce(4429) = small + (2.40e-07&
        *exp(-9.00e-01*user_Av))

  end subroutine makeStoreOnceRates

end module krome_tabs
