
!############### MODULE ##############
module krome_subs
contains

  ! *************************************************************
  !  This file has been generated with:
  !  KROME 14.08.dev on 2019-03-29 11:56:59
  !  Changeset xxxxxxx
  !  see http://kromepackage.org
  !
  !  Written and developed by Tommaso Grassi and Stefano Bovino
  !
  !  Contributors:
  !  J.Boulangier, T.Frostholm, D.Galli, F.A.Gianturco, T.Haugboelle,
  !  A.Lupi, J.Prieto, J.Ramsey, D.R.G.Schleicher, D.Seifried, E.Simoncini,
  !  E.Tognelli
  !  KROME is provided "as it is", without any warranty.
  ! *************************************************************

  !************************
  !compute reaction rates cm^3(n-1)/s
  function coe(n)
    use krome_commons
    use krome_constants
    use krome_user_commons
    use krome_getphys
    use krome_grfuncs
    use krome_phfuncs
    use krome_fit
    implicit none
    real*8::coe(nrea),k(nrea),Tgas,n(nspec),kmax
    real*8::T32
    real*8::sqrT32
    real*8::small,nmax
    integer::i
    real*8::invsqrT32 !preproc from coevar
    real*8::sqrtT32 !preproc from coevar
    !Tgas is in K
    Tgas = max(n(idx_Tgas), phys_Tcmb)
    Tgas = min(Tgas,1d9)

    !maxn initialization can be removed and small can be
    ! replaced with a proper value according to the environment
    nmax = max(maxval(n(1:nmols)),1d0)
    small = 1d-40/(nmax*nmax*nmax*nmax)

    T32 = Tgas*0.0033333333333333335 !Tgas/(300 K) (#)
    sqrT32 = sqrt(T32)

    sqrtT32 = sqrt(Tgas/3d2)
    invsqrT32 = 1d0/sqrt(Tgas/3d2)

    k(:) = small !inizialize coefficients

    !E + GRAIN0 -> GRAIN-
    k(1) = small + (6.90e-15*sqrtT32&
        *user_gas_dust_ratio)

    !C+ + GRAIN- -> C + GRAIN0
    k(2) = small + (4.90e-17*sqrtT32&
        *user_gas_dust_ratio)

    !FE+ + GRAIN- -> FE + GRAIN0
    k(3) = small + (2.30e-17&
        *sqrtT32*user_gas_dust_ratio)

    !H+ + GRAIN- -> H + GRAIN0
    k(4) = small + (1.70e-16*sqrtT32&
        *user_gas_dust_ratio)

    !HE+ + GRAIN- -> HE + GRAIN0
    k(5) = small + (8.50e-17&
        *sqrtT32*user_gas_dust_ratio)

    !MG+ + GRAIN- -> MG + GRAIN0
    k(6) = small + (3.70e-17&
        *sqrtT32*user_gas_dust_ratio)

    !N+ + GRAIN- -> N + GRAIN0
    k(7) = small + (4.70e-17*sqrtT32&
        *user_gas_dust_ratio)

    !NA+ + GRAIN- -> NA + GRAIN0
    k(8) = small + (3.60e-17&
        *sqrtT32*user_gas_dust_ratio)

    !O+ + GRAIN- -> O + GRAIN0
    k(9) = small + (4.40e-17*sqrtT32&
        *user_gas_dust_ratio)

    !S+ + GRAIN- -> S + GRAIN0
    k(10) = small + (3.00e-17&
        *sqrtT32*user_gas_dust_ratio)

    !SI+ + GRAIN- -> SI + GRAIN0
    k(11) = small + (3.30e-17&
        *sqrtT32*user_gas_dust_ratio)

    !H3+ + GRAIN- -> H2 + H + GRAIN0
    k(12) = small + (1.00e-16&
        *sqrtT32*user_gas_dust_ratio)

    !HCO+ + GRAIN- -> H + CO + GRAIN0
    k(13) = small + (3.10e-17&
        *sqrtT32*user_gas_dust_ratio)

    !C -> C+ + E
    k(14) = rateEvaluateOnce(14)

    !CL -> CL+ + E
    k(15) = rateEvaluateOnce(15)

    !FE -> FE+ + E
    k(16) = rateEvaluateOnce(16)

    !H -> H+ + E
    k(17) = rateEvaluateOnce(17)

    !HE -> HE+ + E
    k(18) = rateEvaluateOnce(18)

    !MG -> MG+ + E
    k(19) = rateEvaluateOnce(19)

    !N -> N+ + E
    k(20) = rateEvaluateOnce(20)

    !NA -> NA+ + E
    k(21) = rateEvaluateOnce(21)

    !O -> O+ + E
    k(22) = rateEvaluateOnce(22)

    !P -> P+ + E
    k(23) = rateEvaluateOnce(23)

    !S -> S+ + E
    k(24) = rateEvaluateOnce(24)

    !SI -> SI+ + E
    k(25) = rateEvaluateOnce(25)

    !C2 -> C + C
    k(26) = rateEvaluateOnce(26)

    !CCL -> C + CL
    k(27) = rateEvaluateOnce(27)

    !CH -> C + H
    k(28) = rateEvaluateOnce(28)

    !CLO -> CL + O
    k(29) = rateEvaluateOnce(29)

    !CN -> C + N
    k(30) = rateEvaluateOnce(30)

    !CO -> C + O
    k(31) = rateEvaluateOnce(31)

    !CO -> CO+ + E
    k(32) = rateEvaluateOnce(32)

    !CP -> C + P
    k(33) = rateEvaluateOnce(33)

    !CS -> C + S
    k(34) = rateEvaluateOnce(34)

    !H2 -> H + H
    k(35) = rateEvaluateOnce(35)

    !H2 -> H+ + H + E
    k(36) = rateEvaluateOnce(36)

    !H2 -> H+ + H-
    k(37) = rateEvaluateOnce(37)

    !H2 -> H2+ + E
    k(38) = rateEvaluateOnce(38)

    !HCL -> H + CL
    k(39) = rateEvaluateOnce(39)

    !HF -> F + H
    k(40) = rateEvaluateOnce(40)

    !HS -> H + S
    k(41) = rateEvaluateOnce(41)

    !MGH -> MG + H
    k(42) = rateEvaluateOnce(42)

    !N2 -> N + N
    k(43) = rateEvaluateOnce(43)

    !NAH -> NA + H
    k(44) = rateEvaluateOnce(44)

    !NH -> N + H
    k(45) = rateEvaluateOnce(45)

    !NO -> N + O
    k(46) = rateEvaluateOnce(46)

    !NO -> NO+ + E
    k(47) = rateEvaluateOnce(47)

    !NS -> N + S
    k(48) = rateEvaluateOnce(48)

    !O2 -> O + O
    k(49) = rateEvaluateOnce(49)

    !O2 -> O2+ + E
    k(50) = rateEvaluateOnce(50)

    !OH -> O + H
    k(51) = rateEvaluateOnce(51)

    !PH -> P + H
    k(52) = rateEvaluateOnce(52)

    !PN -> P + N
    k(53) = rateEvaluateOnce(53)

    !PO -> P + O
    k(54) = rateEvaluateOnce(54)

    !S2 -> S + S
    k(55) = rateEvaluateOnce(55)

    !SIC -> SI + C
    k(56) = rateEvaluateOnce(56)

    !SIH -> SI + H
    k(57) = rateEvaluateOnce(57)

    !SIN -> SI + N
    k(58) = rateEvaluateOnce(58)

    !SIO -> SI + O
    k(59) = rateEvaluateOnce(59)

    !SIS -> SI + S
    k(60) = rateEvaluateOnce(60)

    !SO -> S + O
    k(61) = rateEvaluateOnce(61)

    !C2H -> C2 + H
    k(62) = rateEvaluateOnce(62)

    !C2N -> C + CN
    k(63) = rateEvaluateOnce(63)

    !C2S -> CS + C
    k(64) = rateEvaluateOnce(64)

    !C3 -> C2 + C
    k(65) = rateEvaluateOnce(65)

    !CCO -> C2 + O
    k(66) = rateEvaluateOnce(66)

    !CCO -> CO + C
    k(67) = rateEvaluateOnce(67)

    !CCP -> C2 + P
    k(68) = rateEvaluateOnce(68)

    !CCP -> CP + C
    k(69) = rateEvaluateOnce(69)

    !CH2 -> CH2+ + E
    k(70) = rateEvaluateOnce(70)

    !CO2 -> CO + O
    k(71) = rateEvaluateOnce(71)

    !H2O -> OH + H
    k(72) = rateEvaluateOnce(72)

    !H2S -> H2 + S
    k(73) = rateEvaluateOnce(73)

    !H2S -> H2S+ + E
    k(74) = rateEvaluateOnce(74)

    !HCN -> CN + H
    k(75) = rateEvaluateOnce(75)

    !HCO -> CO + H
    k(76) = rateEvaluateOnce(76)

    !HCO -> HCO+ + E
    k(77) = rateEvaluateOnce(77)

    !HCP -> CP + H
    k(78) = rateEvaluateOnce(78)

    !HCS -> HCS+ + E
    k(79) = rateEvaluateOnce(79)

    !HCSI -> CH + SI
    k(80) = rateEvaluateOnce(80)

    !HNC -> CN + H
    k(81) = rateEvaluateOnce(81)

    !HNO -> HNO+ + E
    k(82) = rateEvaluateOnce(82)

    !HNSI -> SIN + H
    k(83) = rateEvaluateOnce(83)

    !HPO -> PO + H
    k(84) = rateEvaluateOnce(84)

    !HS2 -> HS + S
    k(85) = rateEvaluateOnce(85)

    !N2O -> NO + N
    k(86) = rateEvaluateOnce(86)

    !NAOH -> NA + OH
    k(87) = rateEvaluateOnce(87)

    !NH2 -> NH + H
    k(88) = rateEvaluateOnce(88)

    !NH2 -> NH2+ + E
    k(89) = rateEvaluateOnce(89)

    !NO2 -> NO + O
    k(90) = rateEvaluateOnce(90)

    !O2H -> O + OH
    k(91) = rateEvaluateOnce(91)

    !O2H -> O2 + H
    k(92) = rateEvaluateOnce(92)

    !OCN -> CN + O
    k(93) = rateEvaluateOnce(93)

    !OCS -> CO + S
    k(94) = rateEvaluateOnce(94)

    !OCS -> OCS+ + E
    k(95) = rateEvaluateOnce(95)

    !PH2 -> PH + H
    k(96) = rateEvaluateOnce(96)

    !SIC2 -> SIC + C
    k(97) = rateEvaluateOnce(97)

    !SIH2 -> SIH + H
    k(98) = rateEvaluateOnce(98)

    !SINC -> SI + CN
    k(99) = rateEvaluateOnce(99)

    !SIO2 -> SIO + O
    k(100) = rateEvaluateOnce(100)

    !SO2 -> SO + O
    k(101) = rateEvaluateOnce(101)

    !C2H2 -> C2H + H
    k(102) = rateEvaluateOnce(102)

    !C2H2 -> C2H2+ + E
    k(103) = rateEvaluateOnce(103)

    !C3H -> C3 + H
    k(104) = rateEvaluateOnce(104)

    !HC3 -> C3 + H
    k(105) = rateEvaluateOnce(105)

    !C3N -> C2 + CN
    k(106) = rateEvaluateOnce(106)

    !C3O -> C2 + CO
    k(107) = rateEvaluateOnce(107)

    !C3P -> CCP + C
    k(108) = rateEvaluateOnce(108)

    !C3S -> C2 + CS
    k(109) = rateEvaluateOnce(109)

    !C4 -> C3 + C
    k(110) = rateEvaluateOnce(110)

    !CH3 -> CH2 + H
    k(111) = rateEvaluateOnce(111)

    !CH3 -> CH3+ + E
    k(112) = rateEvaluateOnce(112)

    !H2CO -> CO + H2
    k(113) = rateEvaluateOnce(113)

    !H2CS -> H2 + CS
    k(114) = rateEvaluateOnce(114)

    !H2O2 -> OH + OH
    k(115) = rateEvaluateOnce(115)

    !H2S2 -> HS + HS
    k(116) = rateEvaluateOnce(116)

    !H2SIO -> SIO + H2
    k(117) = rateEvaluateOnce(117)

    !HCCP -> CCP + H
    k(118) = rateEvaluateOnce(118)

    !NH3 -> NH + H2
    k(119) = rateEvaluateOnce(119)

    !NH3 -> NH2 + H
    k(120) = rateEvaluateOnce(120)

    !NH3 -> NH3+ + E
    k(121) = rateEvaluateOnce(121)

    !SIC2H -> SIC2 + H
    k(122) = rateEvaluateOnce(122)

    !SIC3 -> SIC2 + C
    k(123) = rateEvaluateOnce(123)

    !SICH2 -> SIC + H2
    k(124) = rateEvaluateOnce(124)

    !SIH3 -> SIH2 + H
    k(125) = rateEvaluateOnce(125)

    !C2H2N -> CH2 + CN
    k(126) = rateEvaluateOnce(126)

    !C2H2O -> CH2 + CO
    k(127) = rateEvaluateOnce(127)

    !C2H2O -> C2H2O+ + E
    k(128) = rateEvaluateOnce(128)

    !C2H3 -> C2H2 + H
    k(129) = rateEvaluateOnce(129)

    !C3H2 -> C3H + H
    k(130) = rateEvaluateOnce(130)

    !H2C3 -> HC3 + H
    k(131) = rateEvaluateOnce(131)

    !C4H -> C4 + H
    k(132) = rateEvaluateOnce(132)

    !C4N -> C3 + CN
    k(133) = rateEvaluateOnce(133)

    !C4P -> C3P + C
    k(134) = rateEvaluateOnce(134)

    !C4S -> C3 + CS
    k(135) = rateEvaluateOnce(135)

    !C5 -> C4 + C
    k(136) = rateEvaluateOnce(136)

    !CH2O2 -> HCO + OH
    k(137) = rateEvaluateOnce(137)

    !CH2O2 -> CH2O2+ + E
    k(138) = rateEvaluateOnce(138)

    !CH2PH -> HCP + H2
    k(139) = rateEvaluateOnce(139)

    !CH3N -> HCN + H2
    k(140) = rateEvaluateOnce(140)

    !CH4 -> CH2 + H2
    k(141) = rateEvaluateOnce(141)

    !HC3N -> C2H + CN
    k(142) = rateEvaluateOnce(142)

    !SIC2H2 -> SIC2 + H2
    k(143) = rateEvaluateOnce(143)

    !SIC3H -> SIC3 + H
    k(144) = rateEvaluateOnce(144)

    !SIC4 -> SIC2 + C2
    k(145) = rateEvaluateOnce(145)

    !SICH3 -> SICH2 + H
    k(146) = rateEvaluateOnce(146)

    !SIH4 -> SIH2 + H2
    k(147) = rateEvaluateOnce(147)

    !C2H3N -> CH3 + CN
    k(148) = rateEvaluateOnce(148)

    !C2H3N -> C2H3N+ + E
    k(149) = rateEvaluateOnce(149)

    !C2H4 -> C2H2 + H2
    k(150) = rateEvaluateOnce(150)

    !C2H4 -> C2H4+ + E
    k(151) = rateEvaluateOnce(151)

    !C3H3 -> C3H2 + H
    k(152) = rateEvaluateOnce(152)

    !C3H3 -> H2C3 + H
    k(153) = rateEvaluateOnce(153)

    !C4H2 -> C2H + C2H
    k(154) = rateEvaluateOnce(154)

    !C4H2 -> C4H + H
    k(155) = rateEvaluateOnce(155)

    !C4H2 -> C4H2+ + E
    k(156) = rateEvaluateOnce(156)

    !C5H -> C5 + H
    k(157) = rateEvaluateOnce(157)

    !C5N -> C4 + CN
    k(158) = rateEvaluateOnce(158)

    !C6 -> C5 + C
    k(159) = rateEvaluateOnce(159)

    !CH4O -> CH3 + OH
    k(160) = rateEvaluateOnce(160)

    !CH4O -> H2CO + H2
    k(161) = rateEvaluateOnce(161)

    !CH4O -> H3CO+ + H + E
    k(162) = rateEvaluateOnce(162)

    !CH4O -> CH4O+ + E
    k(163) = rateEvaluateOnce(163)

    !C2H4O -> CH3 + HCO
    k(164) = rateEvaluateOnce(164)

    !C2H4O -> CH4 + CO
    k(165) = rateEvaluateOnce(165)

    !C2H4O -> C2H4O+ + E
    k(166) = rateEvaluateOnce(166)

    !C2H5 -> C2H4 + H
    k(167) = rateEvaluateOnce(167)

    !C3H3N -> C2H3 + CN
    k(168) = rateEvaluateOnce(168)

    !C3H4 -> C3H3 + H
    k(169) = rateEvaluateOnce(169)

    !C3H4 -> C3H4+ + E
    k(170) = rateEvaluateOnce(170)

    !C5H2 -> C5H + H
    k(171) = rateEvaluateOnce(171)

    !C6H -> C6 + H
    k(172) = rateEvaluateOnce(172)

    !C7 -> C6 + C
    k(173) = rateEvaluateOnce(173)

    !CH5N -> HCN + H2 + H + H
    k(174) = rateEvaluateOnce(174)

    !CH5N -> CH5N+ + E
    k(175) = rateEvaluateOnce(175)

    !HC5N -> C4H + CN
    k(176) = rateEvaluateOnce(176)

    !C6H2 -> C6H + H
    k(177) = rateEvaluateOnce(177)

    !C7H -> C7 + H
    k(178) = rateEvaluateOnce(178)

    !C7N -> C6 + CN
    k(179) = rateEvaluateOnce(179)

    !C8 -> C7 + C
    k(180) = rateEvaluateOnce(180)

    !CH3C3N -> CH3 + C3N
    k(181) = rateEvaluateOnce(181)

    !HCOOCH3 -> H2CO + H2CO
    k(182) = rateEvaluateOnce(182)

    !C2H5OH -> C2H5OH+ + E
    k(183) = rateEvaluateOnce(183)

    !C7H2 -> C7H + H
    k(184) = rateEvaluateOnce(184)

    !C8H -> C8 + H
    k(185) = rateEvaluateOnce(185)

    !C9 -> C8 + C
    k(186) = rateEvaluateOnce(186)

    !CH3C4H -> CH3 + C4H
    k(187) = rateEvaluateOnce(187)

    !CH3OCH3 -> H2CO + CH4
    k(188) = rateEvaluateOnce(188)

    !CH3OCH3 -> CH3OCH3+ + E
    k(189) = rateEvaluateOnce(189)

    !HC7N -> C6H + CN
    k(190) = rateEvaluateOnce(190)

    !C2H6CO -> C2H2O + CH4
    k(191) = rateEvaluateOnce(191)

    !C8H2 -> C8H + H
    k(192) = rateEvaluateOnce(192)

    !C9H -> C9 + H
    k(193) = rateEvaluateOnce(193)

    !C9N -> C8 + CN
    k(194) = rateEvaluateOnce(194)

    !CH3C5N -> CH3 + C5N
    k(195) = rateEvaluateOnce(195)

    !C9H2 -> C9H + H
    k(196) = rateEvaluateOnce(196)

    !CH3C6H -> CH3 + C6H
    k(197) = rateEvaluateOnce(197)

    !CH3C7N -> CH3 + C7N
    k(198) = rateEvaluateOnce(198)

    !HC9N -> C8H + CN
    k(199) = rateEvaluateOnce(199)

    !CH+ -> C + H+
    k(200) = rateEvaluateOnce(200)

    !C+ + FE -> FE+ + C
    k(201) = small + (2.60e-09)

    !C+ + MG -> MG+ + C
    k(202) = small + (1.10e-09)

    !C+ + NA -> NA+ + C
    k(203) = small + (1.10e-09)

    !C+ + P -> P+ + C
    k(204) = small + (1.00e-09)

    !C+ + S -> S+ + C
    k(205) = small + (1.50e-09)

    !C+ + SI -> SI+ + C
    k(206) = small + (2.10e-09)

    !C+ + CCL -> CCL+ + C
    k(207) = small + (1.93e-09*invsqrT32)

    !C+ + CH -> C2+ + H
    k(208) = small + (2.70e-09*invsqrT32)

    !C+ + CH -> CH+ + C
    k(209) = small + (2.70e-09*invsqrT32)

    !C+ + CLO -> CLO+ + C
    k(210) = small + (3.65e-09*invsqrT32)

    !C+ + CP -> CP+ + C
    k(211) = small + (2.58e-09*invsqrT32)

    !C+ + HCL -> CCL+ + H
    k(212) = small + (3.30e-09*invsqrT32)

    !C+ + HF -> CF+ + H
    k(213) = small + (7.20e-09&
        *T32**(-1.50e-01))

    !C+ + HS -> CS+ + H
    k(214) = small + (2.40e-09*invsqrT32)

    !C+ + MGH -> MG+ + CH
    k(215) = small + (4.10e-09*invsqrT32)

    !C+ + NAH -> NA+ + CH
    k(216) = small + (2.20e-08*invsqrT32)

    !C+ + NH -> CN+ + H
    k(217) = small + (4.60e-09*invsqrT32)

    !C+ + NO -> NO+ + C
    k(218) = small + (4.80e-10*invsqrT32)

    !C+ + NS -> CS+ + N
    k(219) = small + (2.70e-09*invsqrT32)

    !C+ + NS -> NS+ + C
    k(220) = small + (2.70e-09*invsqrT32)

    !C+ + O2 -> O+ + CO
    k(221) = small + (4.10e-10)

    !C+ + O2 -> CO+ + O
    k(222) = small + (7.50e-10)

    !C+ + OH -> CO+ + H
    k(223) = small + (2.90e-09&
        *T32**(-3.33e-01))

    !C+ + PH -> PH+ + C
    k(224) = small + (1.99e-09*invsqrT32)

    !C+ + PO -> PO+ + C
    k(225) = small + (5.58e-09*invsqrT32)

    !C+ + SIC -> SI+ + C2
    k(226) = small + (2.56e-09*invsqrT32)

    !C+ + SIC -> SIC+ + C
    k(227) = small + (2.56e-09*invsqrT32)

    !C+ + SIH -> SIC+ + H
    k(228) = small + (3.78e-10*invsqrT32)

    !C+ + SIN -> SIC+ + N
    k(229) = small + (3.46e-09*invsqrT32)

    !C+ + SIN -> SIN+ + C
    k(230) = small + (3.46e-09*invsqrT32)

    !C+ + SIO -> SI+ + CO
    k(231) = small + (4.60e-09*invsqrT32)

    !C+ + SIS -> SIC+ + S
    k(232) = small + (2.50e-09*invsqrT32)

    !C+ + SIS -> SIS+ + C
    k(233) = small + (2.50e-09*invsqrT32)

    !C+ + SO -> S+ + CO
    k(234) = small + (1.10e-09*invsqrT32)

    !C+ + SO -> CO+ + S
    k(235) = small + (1.10e-09*invsqrT32)

    !C+ + SO -> CS+ + O
    k(236) = small + (1.10e-09*invsqrT32)

    !C+ + SO -> SO+ + C
    k(237) = small + (1.10e-09*invsqrT32)

    !C+ + C2H -> C3+ + H
    k(238) = small + (2.60e-09*invsqrT32)

    !C+ + C2S -> C2S+ + C
    k(239) = small + (1.72e-09*invsqrT32)

    !C+ + C2S -> C3+ + S
    k(240) = small + (1.72e-09*invsqrT32)

    !C+ + CCO -> C2O+ + C
    k(241) = small + (3.93e-09*invsqrT32)

    !C+ + CCP -> CP+ + C2
    k(242) = small + (1.46e-09*invsqrT32)

    !C+ + CCP -> CCP+ + C
    k(243) = small + (1.46e-09*invsqrT32)

    !C+ + CH2 -> C2H+ + H
    k(244) = small + (4.34e-10*invsqrT32)

    !C+ + CH2 -> CH2+ + C
    k(245) = small + (4.34e-10*invsqrT32)

    !C+ + CO2 -> CO+ + CO
    k(246) = small + (1.10e-09)

    !C+ + H2O -> HCO+ + H
    k(247) = small + (8.90e-10*invsqrT32)

    !C+ + H2O -> HOC+ + H
    k(248) = small + (1.80e-09*invsqrT32)

    !C+ + H2S -> H2S+ + C
    k(249) = small + (3.20e-10*invsqrT32)

    !C+ + H2S -> HCS+ + H
    k(250) = small + (9.50e-10*invsqrT32)

    !C+ + HCN -> C2N+ + H
    k(251) = small + (4.75e-09*invsqrT32)

    !C+ + HCN -> CNC+ + H
    k(252) = small + (4.75e-09*invsqrT32)

    !C+ + HCO -> CH+ + CO
    k(253) = small + (6.70e-10*invsqrT32)

    !C+ + HCO -> HCO+ + C
    k(254) = small + (6.70e-10*invsqrT32)

    !C+ + HCP -> CCP+ + H
    k(255) = small + (5.85e-10*invsqrT32)

    !C+ + HCP -> HCP+ + C
    k(256) = small + (5.85e-10*invsqrT32)

    !C+ + HCSI -> SIC2+ + H
    k(257) = small + (3.01e-09&
        *invsqrT32)

    !C+ + HNC -> C2N+ + H
    k(258) = small + (8.60e-09*invsqrT32)

    !C+ + HNSI -> SINC+ + H
    k(259) = small + (4.79e-10&
        *invsqrT32)

    !C+ + HPO -> HPO+ + C
    k(260) = small + (6.90e-09*invsqrT32)

    !C+ + NAOH -> HCO+ + NA
    k(261) = small + (6.40e-09&
        *invsqrT32)

    !C+ + NH2 -> HCN+ + H
    k(262) = small + (2.70e-09*invsqrT32)

    !C+ + OCN -> CO+ + CN
    k(263) = small + (1.90e-09*invsqrT32)

    !C+ + OCS -> CS+ + CO
    k(264) = small + (1.60e-09*invsqrT32)

    !C+ + OCS -> OCS+ + C
    k(265) = small + (4.00e-10*invsqrT32)

    !C+ + SIC2 -> SIC2+ + C
    k(266) = small + (2.97e-09&
        *invsqrT32)

    !C+ + SIH2 -> SIC+ + H2
    k(267) = small + (7.93e-11&
        *invsqrT32)

    !C+ + SIH2 -> CHSI+ + H
    k(268) = small + (7.93e-11&
        *invsqrT32)

    !C+ + SIH2 -> SIH2+ + C
    k(269) = small + (7.93e-11&
        *invsqrT32)

    !C+ + SO2 -> SO+ + CO
    k(270) = small + (2.00e-09*invsqrT32)

    !C+ + C2H2 -> C3H+ + H
    k(271) = small + (2.70e-09)

    !C+ + C3H -> C4+ + H
    k(272) = small + (8.29e-09*invsqrT32)

    !C+ + HC3 -> C4+ + H
    k(273) = small + (1.07e-08*invsqrT32)

    !C+ + C3O -> C3+ + CO
    k(274) = small + (2.34e-09*invsqrT32)

    !C+ + C3O -> C3O+ + C
    k(275) = small + (2.34e-09*invsqrT32)

    !C+ + C3O -> C4+ + O
    k(276) = small + (2.34e-09*invsqrT32)

    !C+ + C3P -> C4+ + P
    k(277) = small + (1.22e-09*invsqrT32)

    !C+ + C3S -> C3S+ + C
    k(278) = small + (2.36e-09*invsqrT32)

    !C+ + C3S -> C4+ + S
    k(279) = small + (2.36e-09*invsqrT32)

    !C+ + CH3 -> C2H+ + H2
    k(280) = small + (1.00e-09)

    !C+ + CH3 -> C2H2+ + H
    k(281) = small + (1.00e-09)

    !C+ + CH3 -> CH3+ + C
    k(282) = small + (1.00e-09)

    !C+ + H2CO -> CH2+ + CO
    k(283) = small + (1.50e-09&
        *invsqrT32)

    !C+ + H2CO -> HCO+ + CH
    k(284) = small + (6.50e-10&
        *invsqrT32)

    !C+ + H2CO -> H2CO+ + C
    k(285) = small + (9.60e-10&
        *invsqrT32)

    !C+ + H2CS -> CH2+ + CS
    k(286) = small + (2.10e-09&
        *invsqrT32)

    !C+ + H2SIO -> H2SIO+ + C
    k(287) = small + (2.51e-09&
        *invsqrT32)

    !C+ + HCCP -> CP+ + C2H
    k(288) = small + (5.00e-10)

    !C+ + HCCP -> CCP+ + CH
    k(289) = small + (5.00e-10)

    !C+ + NH3 -> HCN+ + H2
    k(290) = small + (1.08e-10&
        *invsqrT32)

    !C+ + NH3 -> HCNH+ + H
    k(291) = small + (1.36e-09&
        *invsqrT32)

    !C+ + NH3 -> NH3+ + C
    k(292) = small + (6.80e-10*invsqrT32)

    !C+ + SIC2H -> SIC2H+ + C
    k(293) = small + (8.70e-10&
        *invsqrT32)

    !C+ + SIC2H -> SIC3+ + H
    k(294) = small + (8.70e-10&
        *invsqrT32)

    !C+ + SIC3 -> SIC3+ + C
    k(295) = small + (2.44e-09&
        *invsqrT32)

    !C+ + SICH2 -> SIC2+ + H2
    k(296) = small + (6.33e-10&
        *invsqrT32)

    !C+ + SICH2 -> CH2SI+ + C
    k(297) = small + (6.33e-10&
        *invsqrT32)

    !C+ + SICH2 -> SIC2H+ + H
    k(298) = small + (6.33e-10&
        *invsqrT32)

    !C+ + SIH3 -> CHSI+ + H2
    k(299) = small + (1.00e-09)

    !C+ + SIH3 -> CH2SI+ + H
    k(300) = small + (1.00e-09)

    !C+ + SIH3 -> SIH3+ + C
    k(301) = small + (1.00e-09)

    !C+ + C2H2N -> C2H2N+ + C
    k(302) = small + (2.04e-09&
        *invsqrT32)

    !C+ + C2H2O -> C2H2O+ + C
    k(303) = small + (1.80e-09&
        *invsqrT32)

    !C+ + C2H3 -> C3H+ + H2
    k(304) = small + (6.70e-10&
        *invsqrT32)

    !C+ + C2H3 -> C2H3+ + C
    k(305) = small + (6.70e-10&
        *invsqrT32)

    !C+ + C2H3 -> C3H2+ + H
    k(306) = small + (3.35e-10&
        *invsqrT32)

    !C+ + C2H3 -> H2C3+ + H
    k(307) = small + (3.35e-10&
        *invsqrT32)

    !C+ + C3H2 -> C4+ + H2
    k(308) = small + (1.90e-09&
        *invsqrT32)

    !C+ + H2C3 -> C4+ + H2
    k(309) = small + (2.30e-09&
        *invsqrT32)

    !C+ + C3H2 -> C4H+ + H
    k(310) = small + (1.90e-09&
        *invsqrT32)

    !C+ + H2C3 -> C4H+ + H
    k(311) = small + (2.30e-09&
        *invsqrT32)

    !C+ + C4H -> C5+ + H
    k(312) = small + (2.70e-09*invsqrT32)

    !C+ + C4P -> C5+ + P
    k(313) = small + (6.01e-10*invsqrT32)

    !C+ + C4S -> C4S+ + C
    k(314) = small + (1.80e-09*invsqrT32)

    !C+ + C4S -> C5+ + S
    k(315) = small + (1.80e-09*invsqrT32)

    !C+ + CH2PH -> PC2H+ + H2
    k(316) = small + (6.28e-10&
        *invsqrT32)

    !C+ + CH3N -> C2H2N+ + H
    k(317) = small + (2.70e-09&
        *invsqrT32)

    !C+ + CH4 -> C2H2+ + H2
    k(318) = small + (5.00e-10)

    !C+ + CH4 -> C2H3+ + H
    k(319) = small + (1.00e-09)

    !C+ + HCNC2 -> C3N+ + CH
    k(320) = small + (4.80e-09&
        *invsqrT32)

    !C+ + HCNC2 -> C2H+ + C2N
    k(321) = small + (4.80e-09&
        *invsqrT32)

    !C+ + HCNC2 -> HCN+ + C3
    k(322) = small + (4.80e-09&
        *invsqrT32)

    !C+ + HCNC2 -> C4N+ + H
    k(323) = small + (4.80e-09&
        *invsqrT32)

    !C+ + HCNC2 -> C2N+ + C2H
    k(324) = small + (4.80e-09&
        *invsqrT32)

    !C+ + HC2NC -> C3H+ + CN
    k(325) = small + (1.40e-09&
        *invsqrT32)

    !C+ + HC2NC -> C2H+ + C2N
    k(326) = small + (1.40e-09&
        *invsqrT32)

    !C+ + HC2NC -> CNC+ + C2H
    k(327) = small + (1.40e-09&
        *invsqrT32)

    !C+ + HC2NC -> C4N+ + H
    k(328) = small + (1.40e-09&
        *invsqrT32)

    !C+ + HC2NC -> C3HN+ + C
    k(329) = small + (1.40e-09&
        *invsqrT32)

    !C+ + HC3N -> C3+ + HCN
    k(330) = small + (5.50e-10&
        *invsqrT32)

    !C+ + HC3N -> C3H+ + CN
    k(331) = small + (7.70e-09&
        *invsqrT32)

    !C+ + HC3N -> C4N+ + H
    k(332) = small + (2.53e-09&
        *invsqrT32)

    !C+ + HNC3 -> C3+ + HNC
    k(333) = small + (1.55e-09&
        *invsqrT32)

    !C+ + HNC3 -> HNC+ + C3
    k(334) = small + (1.55e-09&
        *invsqrT32)

    !C+ + HNC3 -> C3N+ + CH
    k(335) = small + (1.55e-09&
        *invsqrT32)

    !C+ + HNC3 -> C4N+ + H
    k(336) = small + (1.55e-09&
        *invsqrT32)

    !C+ + SIC2H2 -> SIC3H+ + H
    k(337) = small + (3.09e-09&
        *invsqrT32)

    !C+ + SIC3H -> SIC4+ + H
    k(338) = small + (3.65e-09&
        *invsqrT32)

    !C+ + SICH3 -> SIC2H+ + H2
    k(339) = small + (6.33e-10&
        *invsqrT32)

    !C+ + SICH3 -> SIC2H2+ + H
    k(340) = small + (6.33e-10&
        *invsqrT32)

    !C+ + SICH3 -> SICH3+ + C
    k(341) = small + (6.33e-10&
        *invsqrT32)

    !C+ + SIH4 -> CH2SI+ + H2
    k(342) = small + (1.00e-09)

    !C+ + SIH4 -> SICH3+ + H
    k(343) = small + (1.00e-09)

    !C+ + C2H3N -> C2H3+ + CN
    k(344) = small + (2.49e-09&
        *invsqrT32)

    !C+ + C2H3N -> HC2NCH+ + H
    k(345) = small + (2.49e-09&
        *invsqrT32)

    !C+ + C2H4 -> C3H+ + H2 + H
    k(346) = small + (8.50e-11)

    !C+ + C2H4 -> C2H3+ + CH
    k(347) = small + (8.50e-11)

    !C+ + C2H4 -> C3H2+ + H2
    k(348) = small + (2.55e-10)

    !C+ + C2H4 -> H2C3+ + H2
    k(349) = small + (2.55e-10)

    !C+ + C2H4 -> C2H4+ + C
    k(350) = small + (1.70e-10)

    !C+ + C2H4 -> C3H3+ + H
    k(351) = small + (1.00e-09)

    !C+ + C3H3 -> C4H+ + H2
    k(352) = small + (1.70e-09&
        *invsqrT32)

    !C+ + C3H3 -> C3H3+ + C
    k(353) = small + (8.50e-10&
        *invsqrT32)

    !C+ + C3H3 -> H3C3+ + C
    k(354) = small + (8.50e-10&
        *invsqrT32)

    !C+ + C3H3 -> C4H2+ + H
    k(355) = small + (1.70e-09&
        *invsqrT32)

    !C+ + C4H2 -> C3H+ + C2H
    k(356) = small + (1.45e-10)

    !C+ + C4H2 -> C5+ + H2
    k(357) = small + (2.00e-09)

    !C+ + C4H2 -> C4H2+ + C
    k(358) = small + (1.40e-09)

    !C+ + C4H2 -> C5H+ + H
    k(359) = small + (1.50e-09)

    !C+ + C5H -> C6+ + H
    k(360) = small + (1.25e-08*invsqrT32)

    !C+ + CH4O -> CH3+ + HCO
    k(361) = small + (6.90e-10&
        *invsqrT32)

    !C+ + CH4O -> H3CO+ + CH
    k(362) = small + (6.90e-10&
        *invsqrT32)

    !C+ + CH4O -> CH4O+ + C
    k(363) = small + (8.10e-10&
        *invsqrT32)

    !C+ + NH2CHO -> C2H3O+ + N
    k(364) = small + (1.85e-09&
        *invsqrT32)

    !C+ + NH2CHO -> H3CO+ + CN
    k(365) = small + (1.85e-09&
        *invsqrT32)

    !C+ + NH2CHO -> H2CO+ + HCN
    k(366) = small + (1.85e-09&
        *invsqrT32)

    !C+ + NH2CHO -> HCN+ + H2CO
    k(367) = small + (1.85e-09&
        *invsqrT32)

    !C+ + NH2CHO -> C2H2N+ + OH
    k(368) = small + (1.85e-09&
        *invsqrT32)

    !C+ + NH2CHO -> C2H3N+ + O
    k(369) = small + (1.85e-09&
        *invsqrT32)

    !C+ + C2H4O -> C2H3O+ + CH
    k(370) = small + (1.70e-09&
        *invsqrT32)

    !C+ + C2H4O -> C2H4O+ + C
    k(371) = small + (1.70e-09&
        *invsqrT32)

    !C+ + C2H5 -> C3H3+ + H2
    k(372) = small + (3.33e-10&
        *invsqrT32)

    !C+ + C2H5 -> H3C3+ + H2
    k(373) = small + (3.33e-10&
        *invsqrT32)

    !C+ + C2H5 -> C2H5+ + C
    k(374) = small + (6.65e-10&
        *invsqrT32)

    !C+ + C3H3N -> C3H3N+ + C
    k(375) = small + (4.80e-09&
        *invsqrT32)

    !C+ + C3H4 -> C2H2+ + C2H2
    k(376) = small + (1.00e-10&
        *invsqrT32)

    !C+ + C3H4 -> C2H3+ + C2H
    k(377) = small + (1.00e-10&
        *invsqrT32)

    !C+ + C3H4 -> C3H3+ + CH
    k(378) = small + (1.00e-10&
        *invsqrT32)

    !C+ + C3H4 -> H3C3+ + CH
    k(379) = small + (1.00e-10&
        *invsqrT32)

    !C+ + C3H4 -> C4H2+ + H2
    k(380) = small + (3.00e-10&
        *invsqrT32)

    !C+ + C3H4 -> C3H4+ + C
    k(381) = small + (3.00e-10&
        *invsqrT32)

    !C+ + C4H3 -> C5H2+ + H
    k(382) = small + (3.10e-10&
        *invsqrT32)

    !C+ + C4H3 -> C5H+ + H2
    k(383) = small + (3.10e-10&
        *invsqrT32)

    !C+ + C4H3 -> C4H3+ + C
    k(384) = small + (3.10e-10&
        *invsqrT32)

    !C+ + C4H3 -> C3H2+ + C2H
    k(385) = small + (1.55e-10&
        *invsqrT32)

    !C+ + C4H3 -> H2C3+ + C2H
    k(386) = small + (1.55e-10&
        *invsqrT32)

    !C+ + C5H2 -> C6+ + H2
    k(387) = small + (1.53e-09&
        *invsqrT32)

    !C+ + C5H2 -> C6H+ + H
    k(388) = small + (1.53e-09&
        *invsqrT32)

    !C+ + C6H -> C7+ + H
    k(389) = small + (1.43e-08*invsqrT32)

    !C+ + CH5N -> CH4N+ + CH
    k(390) = small + (6.20e-10&
        *invsqrT32)

    !C+ + CH5N -> CH5N+ + C
    k(391) = small + (1.10e-09&
        *invsqrT32)

    !C+ + HC5N -> C5H+ + CN
    k(392) = small + (6.20e-09&
        *invsqrT32)

    !C+ + HC5N -> C5HN+ + C
    k(393) = small + (6.20e-09&
        *invsqrT32)

    !C+ + C6H2 -> C7+ + H2
    k(394) = small + (1.20e-09)

    !C+ + C6H2 -> C7H+ + H
    k(395) = small + (1.20e-09)

    !C+ + C7H -> C8+ + H
    k(396) = small + (1.27e-08*invsqrT32)

    !C+ + CH3C3N -> C2H3+ + C3N
    k(397) = small + (2.90e-09&
        *invsqrT32)

    !C+ + CH3C3N -> C4H3+ + CN
    k(398) = small + (2.90e-09&
        *invsqrT32)

    !C+ + HCOOCH3 -> COOCH4+ + C
    k(399) = small + (2.17e-09&
        *invsqrT32)

    !C+ + C2H5OH -> H3CO+ + C2H3
    k(400) = small + (7.07e-10&
        *invsqrT32)

    !C+ + C2H5OH -> C2H5O+ + CH
    k(401) = small + (7.07e-10&
        *invsqrT32)

    !C+ + C2H5OH -> C2H5OH+ + C
    k(402) = small + (7.07e-10&
        *invsqrT32)

    !C+ + C7H2 -> C8+ + H2
    k(403) = small + (1.50e-09&
        *invsqrT32)

    !C+ + C7H2 -> C8H+ + H
    k(404) = small + (1.50e-09&
        *invsqrT32)

    !C+ + C8H -> C9+ + H
    k(405) = small + (1.40e-08*invsqrT32)

    !C+ + CH3C4H -> C5H3+ + CH
    k(406) = small + (4.93e-10&
        *invsqrT32)

    !C+ + CH3C4H -> C6H2+ + H2
    k(407) = small + (4.93e-10&
        *invsqrT32)

    !C+ + CH3C4H -> C6H3+ + H
    k(408) = small + (4.93e-10&
        *invsqrT32)

    !C+ + CH3OCH3 -> CH3OCH3+ + C
    k(409) = small + (1.60e-09&
        *invsqrT32)

    !C+ + HC7N -> C7H+ + CN
    k(410) = small + (1.30e-08&
        *invsqrT32)

    !C+ + C2H6CO -> C2H6CO+ + C
    k(411) = small + (3.44e-09&
        *invsqrT32)

    !C+ + C8H2 -> C9+ + H2
    k(412) = small + (1.20e-09)

    !C+ + C8H2 -> C9H+ + H
    k(413) = small + (1.20e-09)

    !C+ + C9H -> C10+ + H
    k(414) = small + (1.31e-08*invsqrT32)

    !C+ + CH3C5N -> C6H3+ + CN
    k(415) = small + (6.24e-09&
        *invsqrT32)

    !C+ + C9H2 -> C10+ + H2
    k(416) = small + (2.95e-09&
        *invsqrT32)

    !C+ + CH3C6H -> C7H3+ + CH
    k(417) = small + (9.00e-10&
        *invsqrT32)

    !C+ + CH3C6H -> C8H2+ + H2
    k(418) = small + (9.00e-10&
        *invsqrT32)

    !C+ + CH3C7N -> C8H3+ + CN
    k(419) = small + (6.44e-09&
        *invsqrT32)

    !C+ + HC9N -> C9H+ + CN
    k(420) = small + (1.34e-08&
        *invsqrT32)

    !CL+ + H2 -> HCL+ + H
    k(421) = small + (1.00e-09)

    !CL+ + O2 -> O2+ + CL
    k(422) = small + (4.60e-10)

    !FE+ + NA -> NA+ + FE
    k(423) = small + (1.00e-11)

    !F+ + H2 -> HF+ + H
    k(424) = small + (1.00e-09)

    !H+ + FE -> FE+ + H
    k(425) = small + (7.40e-09)

    !H+ + MG -> MG+ + H
    k(426) = small + (1.10e-09)

    !H+ + NA -> NA+ + H
    k(427) = small + (1.20e-09)

    !H+ + O -> O+ + H
    k(428) = small + (7.00e-10&
        *exp(-2.32e+02&
        /Tgas))

    !H+ + P -> P+ + H
    k(429) = small + (1.00e-09)

    !H+ + S -> S+ + H
    k(430) = small + (1.30e-09)

    !H+ + SI -> SI+ + H
    k(431) = small + (9.90e-10)

    !H+ + C2 -> C2+ + H
    k(432) = small + (3.10e-09)

    !H+ + CH -> CH+ + H
    k(433) = small + (1.40e-08*invsqrT32)

    !H+ + CP -> CP+ + H
    k(434) = small + (7.96e-09*invsqrT32)

    !H+ + CS -> CS+ + H
    k(435) = small + (1.80e-08*invsqrT32)

    !H+ + HCL -> HCL+ + H
    k(436) = small + (1.00e-08*invsqrT32)

    !H+ + HS -> S+ + H2
    k(437) = small + (3.50e-09*invsqrT32)

    !H+ + HS -> HS+ + H
    k(438) = small + (3.50e-09*invsqrT32)

    !H+ + MGH -> MG+ + H2
    k(439) = small + (1.20e-08*invsqrT32)

    !H+ + NAH -> NA+ + H2
    k(440) = small + (6.30e-08*invsqrT32)

    !H+ + NH -> NH+ + H
    k(441) = small + (1.20e-08*invsqrT32)

    !H+ + NO -> NO+ + H
    k(442) = small + (1.40e-09*invsqrT32)

    !H+ + NS -> NS+ + H
    k(443) = small + (1.70e-08*invsqrT32)

    !H+ + O2 -> O2+ + H
    k(444) = small + (1.20e-09)

    !H+ + OH -> OH+ + H
    k(445) = small + (1.60e-08*invsqrT32)

    !H+ + PH -> PH+ + H
    k(446) = small + (5.94e-09*invsqrT32)

    !H+ + PN -> PN+ + H
    k(447) = small + (2.54e-08*invsqrT32)

    !H+ + PO -> PO+ + H
    k(448) = small + (1.74e-08*invsqrT32)

    !H+ + S2 -> S2+ + H
    k(449) = small + (3.00e-09)

    !H+ + SIC -> SIC+ + H
    k(450) = small + (1.57e-08*invsqrT32)

    !H+ + SIH -> SI+ + H2
    k(451) = small + (5.60e-10*invsqrT32)

    !H+ + SIH -> SIH+ + H
    k(452) = small + (5.60e-10*invsqrT32)

    !H+ + SIN -> SIN+ + H
    k(453) = small + (2.13e-08*invsqrT32)

    !H+ + SIO -> SIO+ + H
    k(454) = small + (2.90e-08*invsqrT32)

    !H+ + SIS -> SIS+ + H
    k(455) = small + (1.60e-08*invsqrT32)

    !H+ + SO -> SO+ + H
    k(456) = small + (1.40e-08*invsqrT32)

    !H+ + C2H -> C2+ + H2
    k(457) = small + (3.70e-09*invsqrT32)

    !H+ + C2H -> C2H+ + H
    k(458) = small + (3.70e-09*invsqrT32)

    !H+ + C2N -> C2N+ + H
    k(459) = small + (5.56e-09*invsqrT32)

    !H+ + C2S -> C2S+ + H
    k(460) = small + (1.09e-08*invsqrT32)

    !H+ + C3 -> C3+ + H
    k(461) = small + (4.00e-09)

    !H+ + CCO -> C2O+ + H
    k(462) = small + (1.20e-08*invsqrT32)

    !H+ + CCP -> CCP+ + H
    k(463) = small + (9.23e-09*invsqrT32)

    !H+ + CH2 -> CH+ + H2
    k(464) = small + (1.14e-09*invsqrT32)

    !H+ + CH2 -> CH2+ + H
    k(465) = small + (1.14e-09*invsqrT32)

    !H+ + CO2 -> HCO+ + O
    k(466) = small + (3.00e-09)

    !H+ + H2O -> H2O+ + H
    k(467) = small + (7.30e-09*invsqrT32)

    !H+ + H2S -> H2S+ + H
    k(468) = small + (3.80e-09*invsqrT32)

    !H+ + HCN -> HCN+ + H
    k(469) = small + (2.78e-08*invsqrT32)

    !H+ + HCO -> CO+ + H2
    k(470) = small + (1.30e-09*invsqrT32)

    !H+ + HCO -> H2+ + CO
    k(471) = small + (1.30e-09*invsqrT32)

    !H+ + HCO -> HCO+ + H
    k(472) = small + (1.30e-09*invsqrT32)

    !H+ + HCP -> HCP+ + H
    k(473) = small + (3.61e-09*invsqrT32)

    !H+ + HCS -> CS+ + H2
    k(474) = small + (1.85e-08*invsqrT32)

    !H+ + HCSI -> SIC+ + H2
    k(475) = small + (4.63e-09&
        *invsqrT32)

    !H+ + HCSI -> CHSI+ + H
    k(476) = small + (4.63e-09&
        *invsqrT32)

    !H+ + HNC -> H+ + HCN
    k(477) = small + (2.51e-08*invsqrT32)

    !H+ + HNO -> NO+ + H2
    k(478) = small + (6.70e-09*invsqrT32)

    !H+ + HNSI -> SIN+ + H2
    k(479) = small + (7.40e-10&
        *invsqrT32)

    !H+ + HNSI -> HNSI+ + H
    k(480) = small + (7.40e-10&
        *invsqrT32)

    !H+ + HPO -> HPO+ + H
    k(481) = small + (2.15e-08*invsqrT32)

    !H+ + HS2 -> S2H+ + H
    k(482) = small + (7.79e-09*invsqrT32)

    !H+ + NAOH -> NA+ + H2O
    k(483) = small + (2.00e-08&
        *invsqrT32)

    !H+ + NH2 -> NH2+ + H
    k(484) = small + (7.30e-09*invsqrT32)

    !H+ + OCS -> HS+ + CO
    k(485) = small + (6.50e-09*invsqrT32)

    !H+ + PH2 -> PH2+ + H
    k(486) = small + (1.96e-09*invsqrT32)

    !H+ + SIC2 -> SIC2+ + H
    k(487) = small + (9.32e-09&
        *invsqrT32)

    !H+ + SIH2 -> SIH+ + H2
    k(488) = small + (3.54e-10&
        *invsqrT32)

    !H+ + SIH2 -> SIH2+ + H
    k(489) = small + (3.54e-10&
        *invsqrT32)

    !H+ + SINC -> SINC+ + H
    k(490) = small + (7.92e-09&
        *invsqrT32)

    !H+ + C2H2 -> C2H+ + H2
    k(491) = small + (2.00e-09)

    !H+ + C2H2 -> C2H2+ + H
    k(492) = small + (2.00e-09)

    !H+ + C3H -> C3+ + H2
    k(493) = small + (1.22e-08*invsqrT32)

    !H+ + HC3 -> C3+ + H2
    k(494) = small + (1.58e-08*invsqrT32)

    !H+ + C3H -> C3H+ + H
    k(495) = small + (1.22e-08*invsqrT32)

    !H+ + HC3 -> C3H+ + H
    k(496) = small + (1.58e-08*invsqrT32)

    !H+ + C3O -> C3O+ + H
    k(497) = small + (2.21e-08*invsqrT32)

    !H+ + C3S -> C3S+ + H
    k(498) = small + (1.52e-08*invsqrT32)

    !H+ + C4 -> C4+ + H
    k(499) = small + (4.00e-09)

    !H+ + CH3 -> CH3+ + H
    k(500) = small + (3.40e-09)

    !H+ + H2CO -> HCO+ + H2
    k(501) = small + (4.60e-09&
        *invsqrT32)

    !H+ + H2CO -> H2CO+ + H
    k(502) = small + (4.60e-09&
        *invsqrT32)

    !H+ + H2CS -> H2CS+ + H
    k(503) = small + (6.40e-09&
        *invsqrT32)

    !H+ + H2S2 -> H2S2+ + H
    k(504) = small + (4.67e-09&
        *invsqrT32)

    !H+ + H2SIO -> HSIO+ + H2
    k(505) = small + (3.91e-09&
        *invsqrT32)

    !H+ + H2SIO -> H2SIO+ + H
    k(506) = small + (3.91e-09&
        *invsqrT32)

    !H+ + HCCP -> PC2H+ + H
    k(507) = small + (1.00e-09)

    !H+ + NH3 -> NH3+ + H
    k(508) = small + (5.80e-09*invsqrT32)

    !H+ + SIC2H -> SIC2+ + H2
    k(509) = small + (2.73e-09&
        *invsqrT32)

    !H+ + SIC2H -> SIC2H+ + H
    k(510) = small + (2.73e-09&
        *invsqrT32)

    !H+ + SIC3 -> SIC3+ + H
    k(511) = small + (7.79e-09&
        *invsqrT32)

    !H+ + SICH2 -> CHSI+ + H2
    k(512) = small + (2.93e-09&
        *invsqrT32)

    !H+ + SICH2 -> CH2SI+ + H
    k(513) = small + (2.93e-09&
        *invsqrT32)

    !H+ + SIH3 -> SIH2+ + H2
    k(514) = small + (1.50e-09)

    !H+ + SIH3 -> SIH3+ + H
    k(515) = small + (1.50e-09)

    !H+ + C2H2N -> C2H2N+ + H
    k(516) = small + (6.26e-09&
        *invsqrT32)

    !H+ + C2H2O -> C2H2O+ + H
    k(517) = small + (5.60e-09&
        *invsqrT32)

    !H+ + C2H3 -> C2H2+ + H2
    k(518) = small + (3.00e-09&
        *invsqrT32)

    !H+ + C2H3 -> C2H3+ + H
    k(519) = small + (3.00e-09&
        *invsqrT32)

    !H+ + C3H2 -> C3H+ + H2
    k(520) = small + (5.89e-09&
        *invsqrT32)

    !H+ + H2C3 -> C3H+ + H2
    k(521) = small + (7.11e-09&
        *invsqrT32)

    !H+ + C3H2 -> C3H2+ + H
    k(522) = small + (5.89e-09&
        *invsqrT32)

    !H+ + H2C3 -> H2C3+ + H
    k(523) = small + (7.11e-09&
        *invsqrT32)

    !H+ + C4H -> C4+ + H2
    k(524) = small + (4.20e-09*invsqrT32)

    !H+ + C4H -> C4H+ + H
    k(525) = small + (4.20e-09*invsqrT32)

    !H+ + C4P -> C4P+ + H
    k(526) = small + (1.94e-09*invsqrT32)

    !H+ + C4S -> C4S+ + H
    k(527) = small + (1.17e-08*invsqrT32)

    !H+ + C5 -> C5+ + H
    k(528) = small + (4.00e-09)

    !H+ + CH2O2 -> HCO2+ + H2
    k(529) = small + (2.80e-09&
        *invsqrT32)

    !H+ + CH2O2 -> CH2O2+ + H
    k(530) = small + (2.80e-09&
        *invsqrT32)

    !H+ + CH2PH -> PCH3+ + H
    k(531) = small + (1.95e-09&
        *invsqrT32)

    !H+ + CH3N -> HCNH+ + H2
    k(532) = small + (7.90e-09&
        *invsqrT32)

    !H+ + CH4 -> CH3+ + H2
    k(533) = small + (2.30e-09)

    !H+ + CH4 -> CH4+ + H
    k(534) = small + (1.50e-09)

    !H+ + HCNC2 -> HCN+ + C2H
    k(535) = small + (1.90e-08&
        *invsqrT32)

    !H+ + HCNC2 -> C2H+ + HCN
    k(536) = small + (1.90e-08&
        *invsqrT32)

    !H+ + HCNC2 -> C3N+ + H2
    k(537) = small + (1.90e-08&
        *invsqrT32)

    !H+ + HCNC2 -> C2NH+ + CH
    k(538) = small + (1.90e-08&
        *invsqrT32)

    !H+ + HC2NC -> C2H2N+ + C
    k(539) = small + (7.23e-09&
        *invsqrT32)

    !H+ + HC2NC -> C2H2+ + CN
    k(540) = small + (7.23e-09&
        *invsqrT32)

    !H+ + HC2NC -> C3N+ + H2
    k(541) = small + (7.23e-09&
        *invsqrT32)

    !H+ + HC3N -> C3HN+ + H
    k(542) = small + (3.40e-08&
        *invsqrT32)

    !H+ + HNC3 -> H+ + HC3N
    k(543) = small + (3.23e-09&
        *invsqrT32)

    !H+ + HNC3 -> C3HN+ + H
    k(544) = small + (3.23e-09&
        *invsqrT32)

    !H+ + HNC3 -> C3H+ + NH
    k(545) = small + (3.23e-09&
        *invsqrT32)

    !H+ + HNC3 -> C3N+ + H2
    k(546) = small + (3.23e-09&
        *invsqrT32)

    !H+ + HNC3 -> HNC+ + C2H
    k(547) = small + (3.23e-09&
        *invsqrT32)

    !H+ + HNC3 -> C2H+ + HNC
    k(548) = small + (3.23e-09&
        *invsqrT32)

    !H+ + NH2CN -> HNC+ + NH2
    k(549) = small + (8.35e-09&
        *invsqrT32)

    !H+ + NH2CN -> NH2+ + HNC
    k(550) = small + (8.35e-09&
        *invsqrT32)

    !H+ + SIC2H2 -> SIC2H+ + H2
    k(551) = small + (4.87e-09&
        *invsqrT32)

    !H+ + SIC2H2 -> SIC2H2+ + H
    k(552) = small + (4.87e-09&
        *invsqrT32)

    !H+ + SIC3H -> SIC3+ + H2
    k(553) = small + (5.85e-09&
        *invsqrT32)

    !H+ + SIC3H -> SIC3H+ + H
    k(554) = small + (5.85e-09&
        *invsqrT32)

    !H+ + SIC4 -> SIC4+ + H
    k(555) = small + (2.45e-08&
        *invsqrT32)

    !H+ + SICH3 -> CH2SI+ + H2
    k(556) = small + (2.93e-09&
        *invsqrT32)

    !H+ + SICH3 -> SICH3+ + H
    k(557) = small + (2.93e-09&
        *invsqrT32)

    !H+ + SIH4 -> SIH3+ + H2
    k(558) = small + (1.50e-09)

    !H+ + SIH4 -> SIH4+ + H
    k(559) = small + (1.50e-09)

    !H+ + C2H3N -> C2H2N+ + H2
    k(560) = small + (7.70e-09&
        *invsqrT32)

    !H+ + C2H3N -> C2H3N+ + H
    k(561) = small + (7.70e-09&
        *invsqrT32)

    !H+ + C2H4 -> C2H3+ + H2
    k(562) = small + (2.00e-09)

    !H+ + C2H4 -> C2H4+ + H
    k(563) = small + (2.00e-09)

    !H+ + C3H3 -> C3H2+ + H2
    k(564) = small + (3.90e-09&
        *invsqrT32)

    !H+ + C3H3 -> H2C3+ + H2
    k(565) = small + (3.90e-09&
        *invsqrT32)

    !H+ + C3H3 -> C3H3+ + H
    k(566) = small + (3.90e-09&
        *invsqrT32)

    !H+ + C3H3 -> H3C3+ + H
    k(567) = small + (3.90e-09&
        *invsqrT32)

    !H+ + C4H2 -> C4H+ + H2
    k(568) = small + (2.00e-09)

    !H+ + C4H2 -> C4H2+ + H
    k(569) = small + (2.00e-09)

    !H+ + C5H -> C5+ + H2
    k(570) = small + (1.98e-08*invsqrT32)

    !H+ + C5H -> C5H+ + H
    k(571) = small + (1.98e-08*invsqrT32)

    !H+ + C6 -> C6+ + H
    k(572) = small + (4.00e-09)

    !H+ + CH4O -> H3CO+ + H2
    k(573) = small + (3.30e-09&
        *invsqrT32)

    !H+ + CH4O -> CH4O+ + H
    k(574) = small + (3.30e-09&
        *invsqrT32)

    !H+ + NH2CHO -> NH4+ + CO
    k(575) = small + (8.62e-09&
        *invsqrT32)

    !H+ + NH2CHO -> HCO+ + NH3
    k(576) = small + (8.62e-09&
        *invsqrT32)

    !H+ + NH2CHO -> H2NC+ + H2O
    k(577) = small + (8.62e-09&
        *invsqrT32)

    !H+ + NH2CHO -> NH2+ + H2CO
    k(578) = small + (8.62e-09&
        *invsqrT32)

    !H+ + C2H4O -> C2H3O+ + H2
    k(579) = small + (5.00e-09&
        *invsqrT32)

    !H+ + C2H4O -> C2H4O+ + H
    k(580) = small + (5.00e-09&
        *invsqrT32)

    !H+ + C2H5 -> C2H4+ + H2
    k(581) = small + (1.97e-09&
        *invsqrT32)

    !H+ + C2H5 -> C2H5+ + H
    k(582) = small + (1.97e-09&
        *invsqrT32)

    !H+ + C3H3N -> C3H2N+ + H2
    k(583) = small + (7.50e-09&
        *invsqrT32)

    !H+ + C3H3N -> C3H3N+ + H
    k(584) = small + (7.50e-09&
        *invsqrT32)

    !H+ + C3H4 -> C3H3+ + H2
    k(585) = small + (7.50e-10&
        *invsqrT32)

    !H+ + C3H4 -> H3C3+ + H2
    k(586) = small + (7.50e-10&
        *invsqrT32)

    !H+ + C3H4 -> C3H4+ + H
    k(587) = small + (1.50e-09&
        *invsqrT32)

    !H+ + C4H3 -> C4H3+ + H
    k(588) = small + (2.00e-09&
        *invsqrT32)

    !H+ + C4H3 -> C4H2+ + H2
    k(589) = small + (2.00e-09&
        *invsqrT32)

    !H+ + C5H2 -> C5H+ + H2
    k(590) = small + (4.87e-09&
        *invsqrT32)

    !H+ + C5H2 -> C5H2+ + H
    k(591) = small + (4.87e-09&
        *invsqrT32)

    !H+ + C6H -> C6+ + H2
    k(592) = small + (2.30e-08*invsqrT32)

    !H+ + C6H -> C6H+ + H
    k(593) = small + (2.30e-08*invsqrT32)

    !H+ + C7 -> C7+ + H
    k(594) = small + (4.00e-09)

    !H+ + CH5N -> CH4N+ + H2
    k(595) = small + (2.60e-09&
        *invsqrT32)

    !H+ + CH5N -> CH5N+ + H
    k(596) = small + (2.60e-09&
        *invsqrT32)

    !H+ + HC5N -> C5HN+ + H
    k(597) = small + (4.00e-08&
        *invsqrT32)

    !H+ + C6H2 -> C6H+ + H2
    k(598) = small + (2.00e-09)

    !H+ + C6H2 -> C6H2+ + H
    k(599) = small + (2.00e-09)

    !H+ + C7H -> C7+ + H2
    k(600) = small + (2.07e-08*invsqrT32)

    !H+ + C7H -> C7H+ + H
    k(601) = small + (2.07e-08*invsqrT32)

    !H+ + C8 -> C8+ + H
    k(602) = small + (4.00e-09)

    !H+ + CH3C3N -> CH3+ + HC3N
    k(603) = small + (1.85e-08&
        *invsqrT32)

    !H+ + HCOOCH3 -> COOCH4+ + H
    k(604) = small + (6.90e-09&
        *invsqrT32)

    !H+ + C2H5OH -> C2H5O+ + H2
    k(605) = small + (3.30e-09&
        *invsqrT32)

    !H+ + C2H5OH -> C2H5OH+ + H
    k(606) = small + (3.30e-09&
        *invsqrT32)

    !H+ + C7H2 -> C7H+ + H2
    k(607) = small + (4.86e-09&
        *invsqrT32)

    !H+ + C7H2 -> C7H2+ + H
    k(608) = small + (4.86e-09&
        *invsqrT32)

    !H+ + C8H -> C8+ + H2
    k(609) = small + (2.30e-08*invsqrT32)

    !H+ + C8H -> C8H+ + H
    k(610) = small + (2.30e-08*invsqrT32)

    !H+ + C9 -> C9+ + H
    k(611) = small + (4.00e-09)

    !H+ + CH3C4H -> C5H3+ + H2
    k(612) = small + (2.36e-09&
        *invsqrT32)

    !H+ + CH3C4H -> C5H4+ + H
    k(613) = small + (2.36e-09&
        *invsqrT32)

    !H+ + CH3OCH3 -> C2H5O+ + H2
    k(614) = small + (2.50e-09&
        *invsqrT32)

    !H+ + CH3OCH3 -> CH3OCH3+ + H
    k(615) = small + (2.50e-09&
        *invsqrT32)

    !H+ + HC7N -> C7HN+ + H
    k(616) = small + (4.25e-08&
        *invsqrT32)

    !H+ + C2H6CO -> C2H6CO+ + H
    k(617) = small + (1.09e-08&
        *invsqrT32)

    !H+ + C8H2 -> C8H+ + H2
    k(618) = small + (2.00e-09)

    !H+ + C8H2 -> C8H2+ + H
    k(619) = small + (2.00e-09)

    !H+ + C9H -> C9+ + H2
    k(620) = small + (2.16e-08*invsqrT32)

    !H+ + C9H -> C9H+ + H
    k(621) = small + (2.16e-08*invsqrT32)

    !H+ + CH3C5N -> CH3+ + HC5N
    k(622) = small + (2.03e-08&
        *invsqrT32)

    !H+ + C9H2 -> C9H+ + H2
    k(623) = small + (4.85e-09&
        *invsqrT32)

    !H+ + C9H2 -> C9H2+ + H
    k(624) = small + (4.85e-09&
        *invsqrT32)

    !H+ + CH3C6H -> C7H3+ + H2
    k(625) = small + (2.92e-09&
        *invsqrT32)

    !H+ + CH3C6H -> C7H4+ + H
    k(626) = small + (2.92e-09&
        *invsqrT32)

    !H+ + CH3C7N -> CH3+ + HC7N
    k(627) = small + (2.12e-08&
        *invsqrT32)

    !H+ + HC9N -> C9HN+ + H
    k(628) = small + (4.44e-08&
        *invsqrT32)

    !HE+ + H -> H+ + HE
    k(629) = small + (1.90e-15)

    !HE+ + P -> P+ + HE
    k(630) = small + (1.00e-09)

    !HE+ + SI -> SI+ + HE
    k(631) = small + (3.30e-09)

    !HE+ + C2 -> C+ + C + HE
    k(632) = small + (1.60e-09)

    !HE+ + C2 -> C2+ + HE
    k(633) = small + (5.00e-10)

    !HE+ + CCL -> C+ + CL + HE
    k(634) = small + (3.11e-09&
        *invsqrT32)

    !HE+ + CH -> C+ + H + HE
    k(635) = small + (3.83e-09&
        *invsqrT32)

    !HE+ + CH -> CH+ + HE
    k(636) = small + (3.83e-09*invsqrT32)

    !HE+ + CLO -> CL+ + O + HE
    k(637) = small + (5.91e-09&
        *invsqrT32)

    !HE+ + CN -> C+ + N + HE
    k(638) = small + (3.60e-09&
        *invsqrT32)

    !HE+ + CN -> N+ + C + HE
    k(639) = small + (3.60e-09&
        *invsqrT32)

    !HE+ + CO -> C+ + O + HE
    k(640) = small + (1.60e-09)

    !HE+ + CP -> C+ + P + HE
    k(641) = small + (2.06e-09&
        *invsqrT32)

    !HE+ + CP -> P+ + C + HE
    k(642) = small + (2.06e-09&
        *invsqrT32)

    !HE+ + CS -> C+ + S + HE
    k(643) = small + (4.70e-09&
        *invsqrT32)

    !HE+ + CS -> S+ + C + HE
    k(644) = small + (4.70e-09&
        *invsqrT32)

    !HE+ + H2 -> H+ + H + HE
    k(645) = small + (3.30e-15)

    !HE+ + H2 -> H2+ + HE
    k(646) = small + (9.60e-15)

    !HE+ + HCL -> CL+ + H + HE
    k(647) = small + (5.22e-09&
        *invsqrT32)

    !HE+ + HF -> F+ + H + HE
    k(648) = small + (1.10e-08&
        *T32**(-1.50e-01))

    !HE+ + HS -> S+ + H + HE
    k(649) = small + (3.70e-09&
        *invsqrT32)

    !HE+ + MGH -> MG+ + H + HE
    k(650) = small + (6.30e-09&
        *invsqrT32)

    !HE+ + N2 -> N+ + N + HE
    k(651) = small + (8.00e-10)

    !HE+ + N2 -> N2+ + HE
    k(652) = small + (4.00e-10)

    !HE+ + NAH -> NA+ + H + HE
    k(653) = small + (3.30e-08&
        *invsqrT32)

    !HE+ + NH -> N+ + H + HE
    k(654) = small + (6.70e-09&
        *invsqrT32)

    !HE+ + NO -> N+ + O + HE
    k(655) = small + (6.40e-10&
        *invsqrT32)

    !HE+ + NO -> O+ + N + HE
    k(656) = small + (1.00e-10&
        *invsqrT32)

    !HE+ + NS -> N+ + S + HE
    k(657) = small + (4.30e-09&
        *invsqrT32)

    !HE+ + NS -> S+ + N + HE
    k(658) = small + (4.30e-09&
        *invsqrT32)

    !HE+ + O2 -> O+ + O + HE
    k(659) = small + (1.00e-09)

    !HE+ + O2 -> O2+ + HE
    k(660) = small + (3.30e-11)

    !HE+ + OH -> O+ + H + HE
    k(661) = small + (8.50e-09&
        *invsqrT32)

    !HE+ + PH -> P+ + H + HE
    k(662) = small + (3.12e-09&
        *invsqrT32)

    !HE+ + PN -> P+ + N + HE
    k(663) = small + (1.32e-08&
        *invsqrT32)

    !HE+ + PO -> P+ + O + HE
    k(664) = small + (8.99e-09&
        *invsqrT32)

    !HE+ + S2 -> S+ + S + HE
    k(665) = small + (2.00e-09)

    !HE+ + SIC -> C+ + SI + HE
    k(666) = small + (4.09e-09&
        *invsqrT32)

    !HE+ + SIC -> SI+ + C + HE
    k(667) = small + (4.09e-09&
        *invsqrT32)

    !HE+ + SIH -> SI+ + H + HE
    k(668) = small + (5.87e-10&
        *invsqrT32)

    !HE+ + SIN -> SI+ + N + HE
    k(669) = small + (1.10e-08&
        *invsqrT32)

    !HE+ + SIO -> O+ + SI + HE
    k(670) = small + (7.40e-09&
        *invsqrT32)

    !HE+ + SIO -> SI+ + O + HE
    k(671) = small + (7.40e-09&
        *invsqrT32)

    !HE+ + SIS -> S+ + SI + HE
    k(672) = small + (4.10e-09&
        *invsqrT32)

    !HE+ + SIS -> SI+ + S + HE
    k(673) = small + (4.10e-09&
        *invsqrT32)

    !HE+ + SO -> O+ + S + HE
    k(674) = small + (3.70e-09&
        *invsqrT32)

    !HE+ + SO -> S+ + O + HE
    k(675) = small + (3.70e-09&
        *invsqrT32)

    !HE+ + C2H -> C+ + CH + HE
    k(676) = small + (1.30e-09&
        *invsqrT32)

    !HE+ + C2H -> C2+ + H + HE
    k(677) = small + (1.30e-09&
        *invsqrT32)

    !HE+ + C2H -> CH+ + C + HE
    k(678) = small + (1.30e-09&
        *invsqrT32)

    !HE+ + C2N -> C+ + CN + HE
    k(679) = small + (2.89e-09&
        *invsqrT32)

    !HE+ + C2S -> C+ + CS + HE
    k(680) = small + (1.40e-09&
        *invsqrT32)

    !HE+ + C2S -> S+ + C2 + HE
    k(681) = small + (1.40e-09&
        *invsqrT32)

    !HE+ + C2S -> C2+ + S + HE
    k(682) = small + (1.40e-09&
        *invsqrT32)

    !HE+ + C2S -> CS+ + C + HE
    k(683) = small + (1.40e-09&
        *invsqrT32)

    !HE+ + C3 -> C+ + C2 + HE
    k(684) = small + (1.00e-09)

    !HE+ + C3 -> C2+ + C + HE
    k(685) = small + (1.00e-09)

    !HE+ + CCO -> C+ + CO + HE
    k(686) = small + (6.26e-09&
        *invsqrT32)

    !HE+ + CCP -> C+ + CP + HE
    k(687) = small + (2.38e-09&
        *invsqrT32)

    !HE+ + CCP -> P+ + C2 + HE
    k(688) = small + (2.38e-09&
        *invsqrT32)

    !HE+ + CH2 -> C+ + H2 + HE
    k(689) = small + (6.25e-10&
        *invsqrT32)

    !HE+ + CH2 -> CH+ + H + HE
    k(690) = small + (6.25e-10&
        *invsqrT32)

    !HE+ + CO2 -> C+ + O2 + HE
    k(691) = small + (4.00e-11)

    !HE+ + CO2 -> O+ + CO + HE
    k(692) = small + (2.00e-10)

    !HE+ + CO2 -> CO+ + O + HE
    k(693) = small + (8.00e-10)

    !HE+ + CO2 -> O2+ + C + HE
    k(694) = small + (1.10e-11)

    !HE+ + CO2 -> CO2+ + HE
    k(695) = small + (1.21e-10)

    !HE+ + H2O -> H+ + OH + HE
    k(696) = small + (1.32e-09&
        *invsqrT32)

    !HE+ + H2O -> OH+ + H + HE
    k(697) = small + (1.32e-09&
        *invsqrT32)

    !HE+ + H2O -> H2O+ + HE
    k(698) = small + (1.32e-09&
        *invsqrT32)

    !HE+ + H2S -> S+ + H2 + HE
    k(699) = small + (1.60e-09&
        *invsqrT32)

    !HE+ + H2S -> HS+ + H + HE
    k(700) = small + (2.20e-10&
        *invsqrT32)

    !HE+ + H2S -> H2S+ + HE
    k(701) = small + (1.40e-10&
        *invsqrT32)

    !HE+ + HCN -> C+ + N + H + HE
    k(702) = small + (3.70e-09&
        *invsqrT32)

    !HE+ + HCN -> N+ + CH + HE
    k(703) = small + (1.00e-09&
        *invsqrT32)

    !HE+ + HCN -> CH+ + N + HE
    k(704) = small + (3.10e-09&
        *invsqrT32)

    !HE+ + HCN -> CN+ + H + HE
    k(705) = small + (6.90e-09&
        *invsqrT32)

    !HE+ + HCO -> CH+ + O + HE
    k(706) = small + (6.90e-10&
        *invsqrT32)

    !HE+ + HCO -> CO+ + H + HE
    k(707) = small + (6.90e-10&
        *invsqrT32)

    !HE+ + HCO -> HEH+ + CO
    k(708) = small + (6.90e-10&
        *invsqrT32)

    !HE+ + HCP -> C+ + PH + HE
    k(709) = small + (9.35e-10&
        *invsqrT32)

    !HE+ + HCP -> P+ + CH + HE
    k(710) = small + (9.35e-10&
        *invsqrT32)

    !HE+ + HCS -> H+ + CS + HE
    k(711) = small + (4.79e-09&
        *invsqrT32)

    !HE+ + HCS -> CS+ + H + HE
    k(712) = small + (4.79e-09&
        *invsqrT32)

    !HE+ + HCSI -> SI+ + CH + HE
    k(713) = small + (2.41e-09&
        *invsqrT32)

    !HE+ + HCSI -> SIC+ + H + HE
    k(714) = small + (2.41e-09&
        *invsqrT32)

    !HE+ + HNC -> C+ + N + H + HE
    k(715) = small + (4.43e-09&
        *invsqrT32)

    !HE+ + HNC -> CN+ + H + HE
    k(716) = small + (4.43e-09&
        *invsqrT32)

    !HE+ + HNC -> NH+ + C + HE
    k(717) = small + (4.43e-09&
        *invsqrT32)

    !HE+ + HNO -> H+ + NO + HE
    k(718) = small + (1.80e-09&
        *invsqrT32)

    !HE+ + HNO -> NO+ + H + HE
    k(719) = small + (1.80e-09&
        *invsqrT32)

    !HE+ + HNSI -> SIN+ + H + HE
    k(720) = small + (7.68e-10&
        *invsqrT32)

    !HE+ + HPO -> PH+ + O + HE
    k(721) = small + (5.55e-09&
        *invsqrT32)

    !HE+ + HPO -> PO+ + H + HE
    k(722) = small + (5.55e-09&
        *invsqrT32)

    !HE+ + HS2 -> S+ + HS + HE
    k(723) = small + (2.00e-09&
        *invsqrT32)

    !HE+ + HS2 -> S2+ + H + HE
    k(724) = small + (2.00e-09&
        *invsqrT32)

    !HE+ + N2O -> N+ + NO + HE
    k(725) = small + (8.45e-11&
        *invsqrT32)

    !HE+ + N2O -> O+ + N2 + HE
    k(726) = small + (8.45e-11&
        *invsqrT32)

    !HE+ + N2O -> N2+ + O + HE
    k(727) = small + (8.45e-11&
        *invsqrT32)

    !HE+ + N2O -> NO+ + N + HE
    k(728) = small + (8.45e-11&
        *invsqrT32)

    !HE+ + NAOH -> NA+ + OH + HE
    k(729) = small + (1.00e-08&
        *invsqrT32)

    !HE+ + NH2 -> N+ + H2 + HE
    k(730) = small + (2.00e-09&
        *invsqrT32)

    !HE+ + NH2 -> NH+ + H + HE
    k(731) = small + (2.00e-09&
        *invsqrT32)

    !HE+ + OCN -> O+ + CN + HE
    k(732) = small + (1.50e-09&
        *invsqrT32)

    !HE+ + OCN -> CN+ + O + HE
    k(733) = small + (1.50e-09&
        *invsqrT32)

    !HE+ + OCS -> O+ + CS + HE
    k(734) = small + (8.40e-10&
        *invsqrT32)

    !HE+ + OCS -> S+ + CO + HE
    k(735) = small + (8.40e-10&
        *invsqrT32)

    !HE+ + OCS -> CO+ + S + HE
    k(736) = small + (8.40e-10&
        *invsqrT32)

    !HE+ + OCS -> CS+ + O + HE
    k(737) = small + (8.40e-10&
        *invsqrT32)

    !HE+ + PH2 -> P+ + H2 + HE
    k(738) = small + (1.03e-09&
        *invsqrT32)

    !HE+ + SIC2 -> SI+ + C2 + HE
    k(739) = small + (4.81e-09&
        *invsqrT32)

    !HE+ + SIH2 -> SI+ + H2 + HE
    k(740) = small + (1.86e-10&
        *invsqrT32)

    !HE+ + SIH2 -> SIH+ + H + HE
    k(741) = small + (1.86e-10&
        *invsqrT32)

    !HE+ + SINC -> CN+ + SI + HE
    k(742) = small + (4.08e-09&
        *invsqrT32)

    !HE+ + SIO2 -> SI+ + O2 + HE
    k(743) = small + (1.00e-09&
        *invsqrT32)

    !HE+ + SO2 -> S+ + O2 + HE
    k(744) = small + (8.15e-10&
        *invsqrT32)

    !HE+ + SO2 -> O2+ + S + HE
    k(745) = small + (8.15e-10&
        *invsqrT32)

    !HE+ + SO2 -> SO+ + O + HE
    k(746) = small + (8.15e-10&
        *invsqrT32)

    !HE+ + SO2 -> SO2+ + HE
    k(747) = small + (8.15e-10&
        *invsqrT32)

    !HE+ + C2H2 -> C2+ + H2 + HE
    k(748) = small + (1.60e-09)

    !HE+ + C2H2 -> CH+ + CH + HE
    k(749) = small + (7.70e-10)

    !HE+ + C2H2 -> C2H+ + H + HE
    k(750) = small + (8.80e-10)

    !HE+ + C2H2 -> C2H2+ + HE
    k(751) = small + (2.50e-10)

    !HE+ + C3H -> C3+ + H + HE
    k(752) = small + (1.31e-08&
        *invsqrT32)

    !HE+ + HC3 -> C3+ + H + HE
    k(753) = small + (1.69e-08&
        *invsqrT32)

    !HE+ + C3N -> C2+ + CN + HE
    k(754) = small + (5.25e-09&
        *invsqrT32)

    !HE+ + C3N -> C3N+ + HE
    k(755) = small + (5.25e-09&
        *invsqrT32)

    !HE+ + C3O -> C2+ + CO + HE
    k(756) = small + (5.70e-09&
        *invsqrT32)

    !HE+ + C3O -> C3+ + O + HE
    k(757) = small + (5.70e-09&
        *invsqrT32)

    !HE+ + C3P -> P+ + C3 + HE
    k(758) = small + (1.00e-09&
        *invsqrT32)

    !HE+ + C3P -> C3+ + P + HE
    k(759) = small + (1.00e-09&
        *invsqrT32)

    !HE+ + C3S -> C2+ + CS + HE
    k(760) = small + (3.89e-09&
        *invsqrT32)

    !HE+ + C3S -> CS+ + C2 + HE
    k(761) = small + (3.89e-09&
        *invsqrT32)

    !HE+ + C4 -> C+ + C3 + HE
    k(762) = small + (6.70e-10)

    !HE+ + C4 -> C2+ + C2 + HE
    k(763) = small + (6.70e-10)

    !HE+ + C4 -> C3+ + C + HE
    k(764) = small + (6.70e-10)

    !HE+ + CH3 -> CH+ + H2 + HE
    k(765) = small + (1.00e-09)

    !HE+ + CH3 -> CH2+ + H + HE
    k(766) = small + (1.00e-09)

    !HE+ + H2CO -> CO+ + H2 + HE
    k(767) = small + (2.40e-09&
        *invsqrT32)

    !HE+ + H2CO -> HCO+ + H + HE
    k(768) = small + (2.40e-09&
        *invsqrT32)

    !HE+ + H2CS -> S+ + CH2 + HE
    k(769) = small + (1.11e-09&
        *invsqrT32)

    !HE+ + H2CS -> CS+ + H2 + HE
    k(770) = small + (1.11e-09&
        *invsqrT32)

    !HE+ + H2CS -> CH2+ + S + HE
    k(771) = small + (1.11e-09&
        *invsqrT32)

    !HE+ + H2S2 -> HS+ + HS + HE
    k(772) = small + (1.20e-09&
        *invsqrT32)

    !HE+ + H2S2 -> S2H+ + H + HE
    k(773) = small + (1.20e-09&
        *invsqrT32)

    !HE+ + H2SIO -> HSIO+ + H + HE
    k(774) = small + (4.04e-09&
        *invsqrT32)

    !HE+ + HCCP -> CH+ + CP + HE
    k(775) = small + (5.00e-10)

    !HE+ + HCCP -> CP+ + CH + HE
    k(776) = small + (5.00e-10)

    !HE+ + NH3 -> NH+ + H2 + HE
    k(777) = small + (2.50e-10&
        *invsqrT32)

    !HE+ + NH3 -> NH2+ + H + HE
    k(778) = small + (2.50e-09&
        *invsqrT32)

    !HE+ + NH3 -> NH3+ + HE
    k(779) = small + (3.80e-10&
        *invsqrT32)

    !HE+ + SIC2H -> SI+ + C2H + HE
    k(780) = small + (1.40e-09&
        *invsqrT32)

    !HE+ + SIC2H -> SIC2+ + H + HE
    k(781) = small + (1.40e-09&
        *invsqrT32)

    !HE+ + SIC3 -> SIC2+ + C + HE
    k(782) = small + (4.00e-09&
        *invsqrT32)

    !HE+ + SICH2 -> SIH+ + CH + HE
    k(783) = small + (1.52e-09&
        *invsqrT32)

    !HE+ + SICH2 -> CHSI+ + H + HE
    k(784) = small + (1.52e-09&
        *invsqrT32)

    !HE+ + SIH3 -> SIH+ + H2 + HE
    k(785) = small + (1.00e-09)

    !HE+ + SIH3 -> SIH2+ + H + HE
    k(786) = small + (1.00e-09)

    !HE+ + C2H2N -> CH2+ + CN + HE
    k(787) = small + (3.25e-09&
        *invsqrT32)

    !HE+ + C2H2O -> CO+ + CH2 + HE
    k(788) = small + (1.40e-09&
        *invsqrT32)

    !HE+ + C2H2O -> CH2+ + CO + HE
    k(789) = small + (1.40e-09&
        *invsqrT32)

    !HE+ + C2H3 -> C2H+ + H2 + HE
    k(790) = small + (1.60e-09&
        *invsqrT32)

    !HE+ + C2H3 -> C2H2+ + H + HE
    k(791) = small + (1.60e-09&
        *invsqrT32)

    !HE+ + C3H2 -> C3+ + H2 + HE
    k(792) = small + (3.08e-09&
        *invsqrT32)

    !HE+ + H2C3 -> C3+ + H2 + HE
    k(793) = small + (3.72e-09&
        *invsqrT32)

    !HE+ + C3H2 -> C3H+ + H + HE
    k(794) = small + (3.08e-09&
        *invsqrT32)

    !HE+ + H2C3 -> C3H+ + H + HE
    k(795) = small + (3.72e-09&
        *invsqrT32)

    !HE+ + C4H -> C2H+ + C2 + HE
    k(796) = small + (2.10e-09&
        *invsqrT32)

    !HE+ + C4H -> C4+ + H + HE
    k(797) = small + (2.10e-09&
        *invsqrT32)

    !HE+ + C4P -> C2+ + CCP + HE
    k(798) = small + (4.97e-10&
        *invsqrT32)

    !HE+ + C4P -> CCP+ + C2 + HE
    k(799) = small + (4.97e-10&
        *invsqrT32)

    !HE+ + C4S -> CS+ + C3 + HE
    k(800) = small + (2.98e-09&
        *invsqrT32)

    !HE+ + C4S -> C3+ + CS + HE
    k(801) = small + (2.98e-09&
        *invsqrT32)

    !HE+ + C5 -> C3+ + C2 + HE
    k(802) = small + (1.00e-09)

    !HE+ + C5 -> C4+ + C + HE
    k(803) = small + (1.00e-09)

    !HE+ + CH2O2 -> CO2+ + H + H + HE
    k(804) = small + (1.40e-09&
        *invsqrT32)

    !HE+ + CH2O2 -> HCO2+ + H + HE
    k(805) = small + (1.40e-09&
        *invsqrT32)

    !HE+ + CH2PH -> PH+ + CH2 + HE
    k(806) = small + (5.05e-10&
        *invsqrT32)

    !HE+ + CH2PH -> CH2+ + PH + HE
    k(807) = small + (5.05e-10&
        *invsqrT32)

    !HE+ + CH3N -> NH+ + CH2 + HE
    k(808) = small + (1.00e-09&
        *invsqrT32)

    !HE+ + CH3N -> CH2+ + NH + HE
    k(809) = small + (1.00e-09&
        *invsqrT32)

    !HE+ + CH3N -> HCN+ + H2 + HE
    k(810) = small + (1.00e-09&
        *invsqrT32)

    !HE+ + CH3N -> HCNH+ + H + HE
    k(811) = small + (1.00e-09&
        *invsqrT32)

    !HE+ + CH4 -> H+ + CH3 + HE
    k(812) = small + (4.80e-10)

    !HE+ + CH4 -> CH+ + H2 + H + HE
    k(813) = small + (2.40e-10)

    !HE+ + CH4 -> CH2+ + H2 + HE
    k(814) = small + (9.50e-10)

    !HE+ + CH4 -> CH3+ + H + HE
    k(815) = small + (8.50e-11)

    !HE+ + CH4 -> CH4+ + HE
    k(816) = small + (5.10e-11)

    !HE+ + HCNC2 -> C2+ + HCN + HE
    k(817) = small + (3.70e-09&
        *invsqrT32)

    !HE+ + HCNC2 -> C2N+ + CH + HE
    k(818) = small + (3.70e-09&
        *invsqrT32)

    !HE+ + HCNC2 -> C3N+ + H + HE
    k(819) = small + (3.70e-09&
        *invsqrT32)

    !HE+ + HCNC2 -> HCN+ + C2 + HE
    k(820) = small + (3.70e-09&
        *invsqrT32)

    !HE+ + HC2NC -> CN+ + C2H + HE
    k(821) = small + (1.10e-09&
        *invsqrT32)

    !HE+ + HC2NC -> C2H+ + CN + HE
    k(822) = small + (1.10e-09&
        *invsqrT32)

    !HE+ + HC2NC -> C3N+ + H + HE
    k(823) = small + (1.10e-09&
        *invsqrT32)

    !HE+ + HC2NC -> CNC+ + CH + HE
    k(824) = small + (1.10e-09&
        *invsqrT32)

    !HE+ + HC3N -> C2+ + HCN + HE
    k(825) = small + (2.53e-09&
        *invsqrT32)

    !HE+ + HC3N -> CN+ + C2H + HE
    k(826) = small + (2.53e-09&
        *invsqrT32)

    !HE+ + HC3N -> C2H+ + CN + HE
    k(827) = small + (2.53e-09&
        *invsqrT32)

    !HE+ + HC3N -> C2N+ + CH + HE
    k(828) = small + (2.53e-09&
        *invsqrT32)

    !HE+ + HC3N -> C3+ + NH + HE
    k(829) = small + (2.53e-09&
        *invsqrT32)

    !HE+ + HC3N -> C3H+ + N + HE
    k(830) = small + (2.53e-09&
        *invsqrT32)

    !HE+ + HC3N -> C3N+ + H + HE
    k(831) = small + (2.53e-09&
        *invsqrT32)

    !HE+ + HNC3 -> C2+ + HNC + HE
    k(832) = small + (2.00e-09&
        *invsqrT32)

    !HE+ + HNC3 -> C3+ + NH + HE
    k(833) = small + (2.00e-09&
        *invsqrT32)

    !HE+ + HNC3 -> C3N+ + H + HE
    k(834) = small + (2.00e-09&
        *invsqrT32)

    !HE+ + HNC3 -> NH+ + C3 + HE
    k(835) = small + (2.00e-09&
        *invsqrT32)

    !HE+ + HNC3 -> C2NH+ + C + HE
    k(836) = small + (2.00e-09&
        *invsqrT32)

    !HE+ + NH2CN -> NH2 + CN+ + HE
    k(837) = small + (4.33e-09&
        *invsqrT32)

    !HE+ + NH2CN -> NH2+ + CN + HE
    k(838) = small + (4.33e-09&
        *invsqrT32)

    !HE+ + SIC2H2 -> SIH+ + C2H + HE
    k(839) = small + (2.51e-09&
        *invsqrT32)

    !HE+ + SIC2H2 -> SIC2H+ + H + HE
    k(840) = small + (2.51e-09&
        *invsqrT32)

    !HE+ + SIC3H -> SI+ + C3H + HE
    k(841) = small + (1.50e-09&
        *invsqrT32)

    !HE+ + SIC3H -> SI+ + HC3 + HE
    k(842) = small + (1.50e-09&
        *invsqrT32)

    !HE+ + SIC3H -> SIC3+ + H + HE
    k(843) = small + (2.99e-09&
        *invsqrT32)

    !HE+ + SIC4 -> SIC3+ + C + HE
    k(844) = small + (1.25e-08&
        *invsqrT32)

    !HE+ + SICH3 -> SIH+ + CH2 + HE
    k(845) = small + (1.52e-09&
        *invsqrT32)

    !HE+ + SICH3 -> CH2SI+ + H + HE
    k(846) = small + (1.52e-09&
        *invsqrT32)

    !HE+ + SIH4 -> SIH2+ + H2 + HE
    k(847) = small + (1.00e-09)

    !HE+ + SIH4 -> SIH3+ + H + HE
    k(848) = small + (1.00e-09)

    !HE+ + C2H3N -> CN+ + CH3 + HE
    k(849) = small + (4.00e-09&
        *invsqrT32)

    !HE+ + C2H3N -> CH3+ + CN + HE
    k(850) = small + (4.00e-09&
        *invsqrT32)

    !HE+ + C2H4 -> C2H+ + H + H2 + HE
    k(851) = small + (4.40e-10)

    !HE+ + C2H4 -> CH2+ + CH2 + HE
    k(852) = small + (4.80e-10)

    !HE+ + C2H4 -> C2H2+ + H2 + HE
    k(853) = small + (2.20e-09)

    !HE+ + C2H4 -> C2H3+ + H + HE
    k(854) = small + (1.70e-10)

    !HE+ + C2H4 -> C2H4+ + HE
    k(855) = small + (2.40e-10)

    !HE+ + C3H3 -> C3+ + H + H2 + HE
    k(856) = small + (2.70e-09&
        *invsqrT32)

    !HE+ + C3H3 -> C3H+ + H2 + HE
    k(857) = small + (2.70e-09&
        *invsqrT32)

    !HE+ + C3H3 -> C3H2+ + H + HE
    k(858) = small + (1.35e-09&
        *invsqrT32)

    !HE+ + C3H3 -> H2C3+ + H + HE
    k(859) = small + (1.35e-09&
        *invsqrT32)

    !HE+ + C4H2 -> C2H+ + C2H + HE
    k(860) = small + (1.00e-09)

    !HE+ + C4H2 -> C4+ + H2 + HE
    k(861) = small + (1.00e-09)

    !HE+ + C4H2 -> C4H+ + H + HE
    k(862) = small + (1.00e-09)

    !HE+ + C5H -> C3H+ + C2 + HE
    k(863) = small + (1.02e-08&
        *invsqrT32)

    !HE+ + C5H -> C5+ + H + HE
    k(864) = small + (1.02e-08&
        *invsqrT32)

    !HE+ + C5N -> C4+ + CN + HE
    k(865) = small + (1.30e-08&
        *invsqrT32)

    !HE+ + C6 -> C4+ + C2 + HE
    k(866) = small + (1.40e-09)

    !HE+ + C6 -> C5+ + C + HE
    k(867) = small + (1.40e-09)

    !HE+ + CH4O -> OH+ + CH3 + HE
    k(868) = small + (1.70e-09&
        *invsqrT32)

    !HE+ + CH4O -> CH3+ + OH + HE
    k(869) = small + (1.70e-09&
        *invsqrT32)

    !HE+ + NH2CHO -> HCO+ + NH2 + HE
    k(870) = small + (1.40e-09&
        *invsqrT32)

    !HE+ + NH2CHO -> H2CO+ + NH + HE
    k(871) = small + (1.40e-09&
        *invsqrT32)

    !HE+ + NH2CHO -> NH+ + H2CO + HE
    k(872) = small + (1.40e-09&
        *invsqrT32)

    !HE+ + NH2CHO -> NH3+ + CO + HE
    k(873) = small + (1.40e-09&
        *invsqrT32)

    !HE+ + NH2CHO -> CO+ + NH3 + HE
    k(874) = small + (1.40e-09&
        *invsqrT32)

    !HE+ + C2H4O -> HCO+ + CH3 + HE
    k(875) = small + (1.40e-09&
        *invsqrT32)

    !HE+ + C2H4O -> CH3+ + HCO + HE
    k(876) = small + (1.40e-09&
        *invsqrT32)

    !HE+ + C2H4O -> C2H2O+ + H2 + HE
    k(877) = small + (1.40e-09&
        *invsqrT32)

    !HE+ + C2H4O -> C2H3O+ + H + HE
    k(878) = small + (1.40e-09&
        *invsqrT32)

    !HE+ + C2H5 -> C2H3+ + H2 + HE
    k(879) = small + (6.90e-10&
        *invsqrT32)

    !HE+ + C2H5 -> C2H4+ + H + HE
    k(880) = small + (6.90e-10&
        *invsqrT32)

    !HE+ + C2H5 -> C2H5+ + HE
    k(881) = small + (6.90e-10&
        *invsqrT32)

    !HE+ + C3H3N -> C2H3+ + CN + HE
    k(882) = small + (7.80e-09&
        *invsqrT32)

    !HE+ + C3H4 -> C3+ + H2 + H2 + HE
    k(883) = small + (4.00e-10&
        *invsqrT32)

    !HE+ + C3H4 -> C3H+ + HE + H + H2
    k(884) = small + (4.00e-10&
        *invsqrT32)

    !HE+ + C3H4 -> C3H2+ + HE + H2
    k(885) = small + (2.00e-10&
        *invsqrT32)

    !HE+ + C3H4 -> H2C3+ + HE + H2
    k(886) = small + (2.00e-10&
        *invsqrT32)

    !HE+ + C3H4 -> C3H3+ + HE + H
    k(887) = small + (2.00e-10&
        *invsqrT32)

    !HE+ + C3H4 -> H3C3+ + HE + H
    k(888) = small + (2.00e-10&
        *invsqrT32)

    !HE+ + C4H3 -> C4H2+ + HE + H
    k(889) = small + (6.70e-10&
        *invsqrT32)

    !HE+ + C4H3 -> C3H3+ + HE + C
    k(890) = small + (3.35e-10&
        *invsqrT32)

    !HE+ + C4H3 -> H3C3+ + HE + C
    k(891) = small + (3.35e-10&
        *invsqrT32)

    !HE+ + C4H3 -> C3H2+ + CH + HE
    k(892) = small + (3.35e-10&
        *invsqrT32)

    !HE+ + C4H3 -> H2C3+ + CH + HE
    k(893) = small + (3.35e-10&
        *invsqrT32)

    !HE+ + C5H2 -> C3H+ + C2H + HE
    k(894) = small + (1.67e-09&
        *invsqrT32)

    !HE+ + C5H2 -> C5+ + H2 + HE
    k(895) = small + (1.67e-09&
        *invsqrT32)

    !HE+ + C5H2 -> C5H+ + H + HE
    k(896) = small + (1.67e-09&
        *invsqrT32)

    !HE+ + C6H -> C4H+ + C2 + HE
    k(897) = small + (1.18e-08&
        *invsqrT32)

    !HE+ + C6H -> C6+ + H + HE
    k(898) = small + (1.18e-08&
        *invsqrT32)

    !HE+ + C7 -> C5+ + C2 + HE
    k(899) = small + (1.40e-09)

    !HE+ + C7 -> C6+ + C + HE
    k(900) = small + (1.40e-09)

    !HE+ + CH5N -> NH2+ + CH3 + HE
    k(901) = small + (6.70e-10&
        *invsqrT32)

    !HE+ + CH5N -> CH3+ + NH2 + HE
    k(902) = small + (6.70e-10&
        *invsqrT32)

    !HE+ + CH5N -> HCNH+ + H + H2 + HE
    k(903) = small + (6.70e-10&
        *invsqrT32)

    !HE+ + CH5N -> CH4N+ + H + HE
    k(904) = small + (6.70e-10&
        *invsqrT32)

    !HE+ + HC5N -> C4H + CN+ + HE
    k(905) = small + (6.80e-09&
        *invsqrT32)

    !HE+ + HC5N -> C2H+ + C3N + HE
    k(906) = small + (6.80e-09&
        *invsqrT32)

    !HE+ + HC5N -> C4H+ + CN + HE
    k(907) = small + (6.80e-09&
        *invsqrT32)

    !HE+ + C6H2 -> C4H+ + C2H + HE
    k(908) = small + (1.00e-09)

    !HE+ + C6H2 -> C6+ + H2 + HE
    k(909) = small + (1.00e-09)

    !HE+ + C6H2 -> C6H+ + H + HE
    k(910) = small + (1.00e-09)

    !HE+ + C7H -> C5H+ + C2 + HE
    k(911) = small + (1.06e-08&
        *invsqrT32)

    !HE+ + C7H -> C7+ + H + HE
    k(912) = small + (1.06e-08&
        *invsqrT32)

    !HE+ + C7N -> C6+ + CN + HE
    k(913) = small + (1.40e-08&
        *invsqrT32)

    !HE+ + C8 -> C6+ + C2 + HE
    k(914) = small + (1.50e-09)

    !HE+ + C8 -> C7+ + C + HE
    k(915) = small + (1.50e-09)

    !HE+ + CH3C3N -> CH3+ + C3N + HE
    k(916) = small + (9.49e-09&
        *invsqrT32)

    !HE+ + HCOOCH3 -> HCO2+ + CH3 + HE
    k(917) = small + (3.54e-09&
        *invsqrT32)

    !HE+ + C2H5OH -> C2H2O+ + H2 + H2 + HE
    k(918) = small + (6.80e-10&
        *invsqrT32)

    !HE+ + C2H5OH -> C2H3O+ + H + H2 + HE
    k(919) = small + (6.80e-10&
        *invsqrT32)

    !HE+ + C2H5OH -> C2H4O+ + H2 + HE
    k(920) = small + (6.80e-10&
        *invsqrT32)

    !HE+ + C2H5OH -> C2H5+ + OH + HE
    k(921) = small + (6.80e-10&
        *invsqrT32)

    !HE+ + C2H5OH -> C2H5O+ + H + HE
    k(922) = small + (6.80e-10&
        *invsqrT32)

    !HE+ + C7H2 -> C5H+ + C2H + HE
    k(923) = small + (1.65e-09&
        *invsqrT32)

    !HE+ + C7H2 -> C7+ + H2 + HE
    k(924) = small + (1.65e-09&
        *invsqrT32)

    !HE+ + C7H2 -> C7H+ + H + HE
    k(925) = small + (1.65e-09&
        *invsqrT32)

    !HE+ + C8H -> C6H+ + C2 + HE
    k(926) = small + (1.17e-08&
        *invsqrT32)

    !HE+ + C8H -> C8+ + H + HE
    k(927) = small + (1.17e-08&
        *invsqrT32)

    !HE+ + C9 -> C7+ + C2 + HE
    k(928) = small + (1.50e-09)

    !HE+ + C9 -> C8+ + C + HE
    k(929) = small + (1.50e-09)

    !HE+ + CH3C4H -> C5H2+ + H2 + HE
    k(930) = small + (1.21e-09&
        *invsqrT32)

    !HE+ + CH3C4H -> C5H3+ + H + HE
    k(931) = small + (1.21e-09&
        *invsqrT32)

    !HE+ + CH3OCH3 -> CH3+ + H2CO + HE + H
    k(932) = small + (1.32e-09&
        *invsqrT32)

    !HE+ + CH3OCH3 -> H3CO+ + CH3 + HE
    k(933) = small + (1.32e-09&
        *invsqrT32)

    !HE+ + HC7N -> C6H+ + CN + HE
    k(934) = small + (2.16e-08&
        *invsqrT32)

    !HE+ + C2H6CO -> C2H3O+ + CH3 + HE
    k(935) = small + (5.61e-09&
        *invsqrT32)

    !HE+ + C8H2 -> C6H+ + C2H + HE
    k(936) = small + (1.00e-09)

    !HE+ + C8H2 -> C8+ + H2 + HE
    k(937) = small + (1.00e-09)

    !HE+ + C8H2 -> C8H+ + H + HE
    k(938) = small + (1.00e-09)

    !HE+ + C9H -> C7H+ + C2 + HE
    k(939) = small + (1.10e-08&
        *invsqrT32)

    !HE+ + C9H -> C9+ + H + HE
    k(940) = small + (1.10e-08&
        *invsqrT32)

    !HE+ + C9N -> C8+ + CN + HE
    k(941) = small + (1.54e-08&
        *invsqrT32)

    !HE+ + CH3C5N -> CH3+ + C5N + HE
    k(942) = small + (1.04e-08&
        *invsqrT32)

    !HE+ + C9H2 -> C7H+ + C2H + HE
    k(943) = small + (1.65e-09&
        *invsqrT32)

    !HE+ + C9H2 -> C9+ + H2 + HE
    k(944) = small + (1.65e-09&
        *invsqrT32)

    !HE+ + C9H2 -> C9H+ + H + HE
    k(945) = small + (1.65e-09&
        *invsqrT32)

    !HE+ + CH3C6H -> C7H2+ + H2 + HE
    k(946) = small + (1.49e-09&
        *invsqrT32)

    !HE+ + CH3C6H -> C7H3+ + H + HE
    k(947) = small + (1.49e-09&
        *invsqrT32)

    !HE+ + CH3C7N -> CH3+ + C7N + HE
    k(948) = small + (1.08e-08&
        *invsqrT32)

    !HE+ + HC9N -> C8H+ + CN + HE
    k(949) = small + (2.26e-08&
        *invsqrT32)

    !HE+ + C6H6 -> C6H5+ + H + HE
    k(950) = small + (7.00e-10)

    !HE+ + C6H6 -> C5H5+ + CH + HE
    k(951) = small + (7.00e-10)

    !MG+ + NA -> NA+ + MG
    k(952) = small + (1.00e-11)

    !MG+ + NAH -> NA+ + MGH
    k(953) = small + (1.80e-08&
        *invsqrT32)

    !N+ + FE -> FE+ + N
    k(954) = small + (1.50e-09)

    !N+ + MG -> MG+ + N
    k(955) = small + (1.20e-09)

    !N+ + C2 -> C2+ + N
    k(956) = small + (1.00e-09)

    !N+ + CH -> CH+ + N
    k(957) = small + (3.60e-10)

    !N+ + CH -> CN+ + H
    k(958) = small + (3.60e-10)

    !N+ + CN -> CN+ + N
    k(959) = small + (1.10e-09)

    !N+ + CO -> CO+ + N
    k(960) = small + (4.90e-10)

    !N+ + CO -> NO+ + C
    k(961) = small + (6.00e-11)

    !N+ + H2 -> NH+ + H
    k(962) = small + (1.00e-09&
        *exp(-8.50e+01&
        /Tgas))

    !N+ + NH -> N2+ + H
    k(963) = small + (3.70e-10)

    !N+ + NH -> NH+ + N
    k(964) = small + (3.70e-10)

    !N+ + NO -> N2+ + O
    k(965) = small + (5.00e-11)

    !N+ + NO -> NO+ + N
    k(966) = small + (5.10e-10)

    !N+ + O2 -> O+ + NO
    k(967) = small + (3.60e-11)

    !N+ + O2 -> NO+ + O
    k(968) = small + (1.70e-10)

    !N+ + O2 -> O2+ + N
    k(969) = small + (4.00e-10)

    !N+ + OH -> NO+ + H
    k(970) = small + (3.70e-10)

    !N+ + OH -> OH+ + N
    k(971) = small + (3.70e-10)

    !N+ + C2H -> C2H+ + N
    k(972) = small + (9.50e-10)

    !N+ + CH2 -> CH2+ + N
    k(973) = small + (1.00e-09)

    !N+ + CO2 -> CO+ + NO
    k(974) = small + (2.50e-10)

    !N+ + CO2 -> CO2+ + N
    k(975) = small + (1.10e-09)

    !N+ + H2O -> H2O+ + N
    k(976) = small + (2.60e-09)

    !N+ + H2S -> HS+ + NH
    k(977) = small + (5.51e-10)

    !N+ + H2S -> H2S+ + N
    k(978) = small + (1.06e-09)

    !N+ + HCN -> HCN+ + N
    k(979) = small + (1.20e-09)

    !N+ + HCO -> NH+ + CO
    k(980) = small + (4.50e-10)

    !N+ + HCO -> HCO+ + N
    k(981) = small + (4.50e-10)

    !N+ + NH2 -> NH2+ + N
    k(982) = small + (1.00e-09)

    !N+ + OCS -> S+ + CO + N
    k(983) = small + (3.08e-10)

    !N+ + OCS -> CS+ + NO
    k(984) = small + (7.00e-11)

    !N+ + OCS -> OCS+ + N
    k(985) = small + (1.02e-09)

    !N+ + H2CO -> NO+ + CH2
    k(986) = small + (2.90e-10)

    !N+ + H2CO -> HCO+ + NH
    k(987) = small + (7.30e-10)

    !N+ + H2CO -> H2CO+ + N
    k(988) = small + (1.90e-09)

    !N+ + NH3 -> N2H+ + H2
    k(989) = small + (2.20e-10)

    !N+ + NH3 -> NH2+ + NH
    k(990) = small + (2.20e-10)

    !N+ + NH3 -> NH3+ + N
    k(991) = small + (2.00e-09)

    !N+ + CH4 -> HCN+ + H2 + H
    k(992) = small + (5.60e-11)

    !N+ + CH4 -> CH3+ + N + H
    k(993) = small + (4.70e-10)

    !N+ + CH4 -> CH3+ + NH
    k(994) = small + (4.70e-10)

    !N+ + CH4 -> HCNH+ + H + H
    k(995) = small + (3.80e-10)

    !N+ + CH4 -> HCNH+ + H2
    k(996) = small + (3.80e-10)

    !N+ + CH4 -> CH4+ + N
    k(997) = small + (2.80e-11)

    !N+ + CH4O -> NO+ + CH3 + H
    k(998) = small + (3.10e-10)

    !N+ + CH4O -> CH3+ + NO + H
    k(999) = small + (1.24e-10)

    !N+ + CH4O -> H2CO+ + NH + H
    k(1000) = small + (9.30e-10)

    !N+ + CH4O -> H3CO+ + NH
    k(1001) = small + (4.96e-10)

    !N+ + CH4O -> CH4O+ + N
    k(1002) = small + (1.24e-09)

    !O+ + FE -> FE+ + O
    k(1003) = small + (2.90e-09)

    !O+ + H -> H+ + O
    k(1004) = small + (7.00e-10)

    !O+ + C2 -> C2+ + O
    k(1005) = small + (4.80e-10)

    !O+ + C2 -> CO+ + C
    k(1006) = small + (4.80e-10)

    !O+ + CH -> CH+ + O
    k(1007) = small + (3.50e-10)

    !O+ + CH -> CO+ + H
    k(1008) = small + (3.50e-10)

    !O+ + CN -> NO+ + C
    k(1009) = small + (1.00e-09)

    !O+ + H2 -> OH+ + H
    k(1010) = small + (1.60e-09)

    !O+ + N2 -> NO+ + N
    k(1011) = small + (1.20e-12)

    !O+ + NH -> NH+ + O
    k(1012) = small + (3.60e-10)

    !O+ + NH -> NO+ + H
    k(1013) = small + (3.60e-10)

    !O+ + NO -> NO+ + O
    k(1014) = small + (1.70e-12)

    !O+ + O2 -> O2+ + O
    k(1015) = small + (3.00e-11)

    !O+ + OH -> O2+ + H
    k(1016) = small + (3.60e-10)

    !O+ + OH -> OH+ + O
    k(1017) = small + (3.60e-10)

    !O+ + C2H -> CO+ + CH
    k(1018) = small + (4.60e-10)

    !O+ + C2H -> C2H+ + O
    k(1019) = small + (4.60e-10)

    !O+ + CH2 -> CH2+ + O
    k(1020) = small + (9.70e-10)

    !O+ + CO2 -> O2+ + CO
    k(1021) = small + (1.10e-09)

    !O+ + H2O -> H2O+ + O
    k(1022) = small + (3.20e-09)

    !O+ + H2S -> H2O + S+
    k(1023) = small + (2.20e-10)

    !O+ + H2S -> HS+ + OH
    k(1024) = small + (4.20e-10)

    !O+ + H2S -> H2S+ + O
    k(1025) = small + (1.80e-09)

    !O+ + HCN -> CO+ + NH
    k(1026) = small + (1.20e-09)

    !O+ + HCN -> NO+ + CH
    k(1027) = small + (1.20e-09)

    !O+ + HCN -> HCO+ + N
    k(1028) = small + (1.20e-09)

    !O+ + HCO -> OH+ + CO
    k(1029) = small + (4.30e-10)

    !O+ + HCO -> HCO+ + O
    k(1030) = small + (4.30e-10)

    !O+ + N2O -> NO+ + NO
    k(1031) = small + (6.30e-10)

    !O+ + NH2 -> NH2+ + O
    k(1032) = small + (1.00e-09)

    !O+ + NO2 -> NO2+ + O
    k(1033) = small + (1.60e-09)

    !O+ + OCS -> S+ + CO2
    k(1034) = small + (2.00e-11)

    !O+ + OCS -> OCS+ + O
    k(1035) = small + (6.50e-10)

    !O+ + SO2 -> O2+ + SO
    k(1036) = small + (8.00e-10)

    !O+ + H2CO -> HCO+ + OH
    k(1037) = small + (1.40e-09)

    !O+ + H2CO -> H2CO+ + O
    k(1038) = small + (2.10e-09)

    !O+ + NH3 -> NH3+ + O
    k(1039) = small + (1.20e-09)

    !O+ + CH4 -> CH3+ + OH
    k(1040) = small + (1.10e-10)

    !O+ + CH4 -> CH4+ + O
    k(1041) = small + (8.90e-10)

    !O+ + CH4O -> H2CO+ + H2O
    k(1042) = small + (9.50e-11)

    !O+ + CH4O -> H3CO+ + OH
    k(1043) = small + (1.33e-09)

    !O+ + CH4O -> CH4O+ + O
    k(1044) = small + (4.75e-10)

    !P+ + SI -> P + SI+
    k(1045) = small + (1.00e-09)

    !P+ + O2 -> PO+ + O
    k(1046) = small + (4.90e-10)

    !P+ + OH -> PO+ + H
    k(1047) = small + (4.60e-09*invsqrT32)

    !P+ + H2O -> PO+ + H2
    k(1048) = small + (1.07e-09&
        *invsqrT32)

    !P+ + H2O -> HPO+ + H
    k(1049) = small + (1.07e-09&
        *invsqrT32)

    !P+ + C2H2 -> PC2H+ + H
    k(1050) = small + (1.24e-09)

    !P+ + C2H2 -> PC2H2+
    k(1051) = small + (6.00e-11)

    !P+ + NH3 -> NH3+ + P
    k(1052) = small + (8.60e-10&
        *invsqrT32)

    !P+ + NH3 -> PNH2+ + H
    k(1053) = small + (8.60e-10&
        *invsqrT32)

    !P+ + CH4 -> PCH2+ + H2
    k(1054) = small + (9.60e-10)

    !P+ + C2H4 -> PC2H2+ + H2
    k(1055) = small + (1.20e-09)

    !S+ + FE -> FE+ + S
    k(1056) = small + (1.80e-10)

    !S+ + MG -> MG+ + S
    k(1057) = small + (2.80e-10)

    !S+ + NA -> NA+ + S
    k(1058) = small + (2.60e-10)

    !S+ + SI -> SI+ + S
    k(1059) = small + (1.60e-09)

    !S+ + C2 -> CS+ + C
    k(1060) = small + (8.10e-10)

    !S+ + CH -> CS+ + H
    k(1061) = small + (4.40e-09*invsqrT32)

    !S+ + NH -> NS+ + H
    k(1062) = small + (3.70e-09*invsqrT32)

    !S+ + NO -> NO+ + S
    k(1063) = small + (3.60e-10*invsqrT32)

    !S+ + O2 -> SO+ + O
    k(1064) = small + (2.00e-11)

    !S+ + OH -> SO+ + H
    k(1065) = small + (4.60e-09*invsqrT32)

    !S+ + SIC -> SIC+ + S
    k(1066) = small + (3.70e-09&
        *invsqrT32)

    !S+ + SIH -> SIH+ + S
    k(1067) = small + (1.41e-10&
        *invsqrT32)

    !S+ + SIH -> SIS+ + H
    k(1068) = small + (1.41e-10&
        *invsqrT32)

    !S+ + SIS -> SIS+ + S
    k(1069) = small + (3.50e-09&
        *invsqrT32)

    !S+ + C2H -> C2S+ + H
    k(1070) = small + (1.96e-09&
        *invsqrT32)

    !S+ + CH2 -> HCS+ + H
    k(1071) = small + (7.08e-10&
        *invsqrT32)

    !S+ + H2S -> S2+ + H2
    k(1072) = small + (6.40e-10&
        *invsqrT32)

    !S+ + H2S -> S2H+ + H
    k(1073) = small + (2.00e-10&
        *invsqrT32)

    !S+ + H2S -> H2S+ + S
    k(1074) = small + (4.40e-11&
        *invsqrT32)

    !S+ + HCO -> HS+ + CO
    k(1075) = small + (5.00e-10&
        *invsqrT32)

    !S+ + HCO -> HCO+ + S
    k(1076) = small + (5.00e-10&
        *invsqrT32)

    !S+ + OCS -> S2+ + CO
    k(1077) = small + (9.10e-10&
        *invsqrT32)

    !S+ + C2H2 -> HC2S+ + H
    k(1078) = small + (9.50e-10)

    !S+ + C3H -> C3S+ + H
    k(1079) = small + (6.00e-09&
        *invsqrT32)

    !S+ + HC3 -> C3S+ + H
    k(1080) = small + (6.74e-09&
        *invsqrT32)

    !S+ + CH3 -> H2CS+ + H
    k(1081) = small + (1.00e-11)

    !S+ + H2CO -> H2S+ + CO
    k(1082) = small + (1.10e-09&
        *invsqrT32)

    !S+ + H2CO -> HCO+ + HS
    k(1083) = small + (1.10e-09&
        *invsqrT32)

    !S+ + NH3 -> NH3+ + S
    k(1084) = small + (1.60e-09&
        *invsqrT32)

    !S+ + C2H3 -> HC2S+ + H2
    k(1085) = small + (1.52e-09&
        *invsqrT32)

    !S+ + C3H2 -> HC3S+ + H
    k(1086) = small + (2.87e-09&
        *invsqrT32)

    !S+ + H2C3 -> HC3S+ + H
    k(1087) = small + (3.45e-09&
        *invsqrT32)

    !S+ + C4H -> C4S+ + H
    k(1088) = small + (1.88e-09&
        *invsqrT32)

    !S+ + CH4 -> H3CS+ + H
    k(1089) = small + (1.40e-10)

    !S+ + C4H2 -> C3H2+ + CS
    k(1090) = small + (1.20e-10)

    !S+ + C4H2 -> H2C3+ + CS
    k(1091) = small + (1.20e-10)

    !S+ + C4H2 -> C4H+ + HS
    k(1092) = small + (1.60e-10)

    !S+ + C4H2 -> C4H2+ + S
    k(1093) = small + (7.20e-10)

    !S+ + C4H2 -> HC4S+ + H
    k(1094) = small + (4.80e-10)

    !SI+ + FE -> FE+ + SI
    k(1095) = small + (1.90e-09)

    !SI+ + MG -> MG+ + SI
    k(1096) = small + (2.90e-09)

    !SI+ + NA -> NA+ + SI
    k(1097) = small + (2.70e-09)

    !SI+ + CH -> SIC+ + H
    k(1098) = small + (4.50e-09&
        *invsqrT32)

    !SI+ + NH -> SIN+ + H
    k(1099) = small + (3.85e-09&
        *invsqrT32)

    !SI+ + OH -> SIO+ + H
    k(1100) = small + (4.70e-09&
        *invsqrT32)

    !SI+ + HF -> SIF+ + H
    k(1101) = small + (5.70e-09&
        *T32**(-1.50e-01))

    !SI+ + CH2 -> CHSI+ + H
    k(1102) = small + (7.23e-10&
        *invsqrT32)

    !SI+ + H2O -> HSIO+ + H
    k(1103) = small + (2.20e-09&
        *invsqrT32)

    !SI+ + HCN -> SINC+ + H
    k(1104) = small + (7.37e-09&
        *invsqrT32)

    !SI+ + HNC -> SINC+ + H
    k(1105) = small + (6.68e-09&
        *invsqrT32)

    !SI+ + OCS -> SIS+ + CO
    k(1106) = small + (1.50e-09&
        *invsqrT32)

    !SI+ + C2H2 -> SIC2H+ + H
    k(1107) = small + (2.50e-10)

    !SI+ + C3H -> SIC3+ + H
    k(1108) = small + (6.21e-09&
        *invsqrT32)

    !SI+ + HC3 -> SIC3+ + H
    k(1109) = small + (8.03e-09&
        *invsqrT32)

    !SI+ + CH3 -> CHSI+ + H2
    k(1110) = small + (1.00e-09)

    !SI+ + CH3 -> CH2SI+ + H
    k(1111) = small + (1.00e-09)

    !SI+ + NH3 -> SINH2+ + H
    k(1112) = small + (1.75e-09&
        *invsqrT32)

    !SI+ + C2H3 -> SIC2H2+ + H
    k(1113) = small + (1.57e-09&
        *invsqrT32)

    !SI+ + C3H2 -> SIC3H+ + H
    k(1114) = small + (2.97e-09&
        *invsqrT32)

    !SI+ + H2C3 -> SIC3H+ + H
    k(1115) = small + (3.59e-09&
        *invsqrT32)

    !SI+ + C4H -> SIC4+ + H
    k(1116) = small + (1.96e-09&
        *invsqrT32)

    !SI+ + C2H4 -> SIC2H3+ + H
    k(1117) = small + (1.00e-09)

    !SI+ + C3H3 -> SIC3H2+ + H
    k(1118) = small + (3.84e-09&
        *invsqrT32)

    !SI+ + C4H2 -> C4H+ + SIH
    k(1119) = small + (1.60e-09)

    !SI+ + C3H4 -> SIC3H2+ + H2
    k(1120) = small + (7.46e-10&
        *invsqrT32)

    !C2+ + C -> C+ + C2
    k(1121) = small + (1.10e-10)

    !C2+ + N -> C+ + CN
    k(1122) = small + (4.00e-11)

    !C2+ + O -> CO+ + C
    k(1123) = small + (3.10e-10)

    !C2+ + S -> S+ + C2
    k(1124) = small + (5.80e-10)

    !C2+ + S -> CS+ + C
    k(1125) = small + (5.80e-10)

    !C2+ + C2 -> C3+ + C
    k(1126) = small + (8.70e-10)

    !C2+ + CH -> CH+ + C2
    k(1127) = small + (3.20e-10)

    !C2+ + CH -> C3+ + H
    k(1128) = small + (3.20e-10)

    !C2+ + H2 -> C2H+ + H
    k(1129) = small + (1.10e-09)

    !C2+ + NH -> C2H+ + N
    k(1130) = small + (3.30e-10)

    !C2+ + NH -> C2N+ + H
    k(1131) = small + (3.30e-10)

    !C2+ + NO -> NO+ + C2
    k(1132) = small + (3.40e-10)

    !C2+ + O2 -> CO+ + CO
    k(1133) = small + (8.00e-10)

    !C2+ + CH2 -> CH2+ + C2
    k(1134) = small + (4.50e-10)

    !C2+ + CH2 -> C3H+ + H
    k(1135) = small + (4.50e-10)

    !C2+ + H2O -> C2H+ + OH
    k(1136) = small + (4.40e-10)

    !C2+ + H2O -> C2HO+ + H
    k(1137) = small + (4.40e-10)

    !C2+ + HCN -> C3H+ + N
    k(1138) = small + (7.80e-10)

    !C2+ + HCN -> C3N+ + H
    k(1139) = small + (1.60e-09)

    !C2+ + HCO -> C2H+ + CO
    k(1140) = small + (3.80e-10)

    !C2+ + HCO -> HCO+ + C2
    k(1141) = small + (3.80e-10)

    !C2+ + NH2 -> NH2+ + C2
    k(1142) = small + (4.60e-10)

    !C2+ + NH2 -> C2NH+ + H
    k(1143) = small + (4.60e-10)

    !C2+ + C2H2 -> C4H+ + H
    k(1144) = small + (1.70e-09)

    !C2+ + CH4 -> C2H+ + CH3
    k(1145) = small + (2.38e-10)

    !C2+ + CH4 -> C2H2+ + CH2
    k(1146) = small + (1.82e-10)

    !C2+ + CH4 -> C3H+ + H2 + H
    k(1147) = small + (1.96e-10)

    !C2+ + CH4 -> C3H2+ + H2
    k(1148) = small + (2.87e-10)

    !C2+ + CH4 -> H2C3+ + H2
    k(1149) = small + (2.87e-10)

    !C2+ + CH4 -> C3H3+ + H
    k(1150) = small + (1.05e-10)

    !C2+ + CH4 -> H3C3+ + H
    k(1151) = small + (1.05e-10)

    !CH+ + C -> C2+ + H
    k(1152) = small + (1.20e-09)

    !CH+ + FE -> FE+ + CH
    k(1153) = small + (2.60e-10)

    !CH+ + H -> C+ + H2
    k(1154) = small + (7.50e-10)

    !CH+ + MG -> MG+ + CH
    k(1155) = small + (3.60e-10)

    !CH+ + N -> CN+ + H
    k(1156) = small + (1.90e-10)

    !CH+ + NA -> NA+ + CH
    k(1157) = small + (3.50e-10)

    !CH+ + O -> CO+ + H
    k(1158) = small + (3.50e-10)

    !CH+ + S -> S+ + CH
    k(1159) = small + (4.70e-10)

    !CH+ + S -> CS+ + H
    k(1160) = small + (4.70e-10)

    !CH+ + S -> HS+ + C
    k(1161) = small + (4.70e-10)

    !CH+ + SI -> SI+ + CH
    k(1162) = small + (2.00e-10)

    !CH+ + C2 -> C3+ + H
    k(1163) = small + (1.00e-09)

    !CH+ + CH -> C2+ + H2
    k(1164) = small + (7.40e-10)

    !CH+ + CN -> C2N+ + H
    k(1165) = small + (1.10e-09)

    !CH+ + CN -> CNC+ + H
    k(1166) = small + (5.50e-10)

    !CH+ + H2 -> CH2+ + H
    k(1167) = small + (1.20e-09)

    !CH+ + NH -> CN+ + H2
    k(1168) = small + (7.60e-10)

    !CH+ + NO -> NO+ + CH
    k(1169) = small + (7.60e-10)

    !CH+ + O2 -> HCO + O+
    k(1170) = small + (1.00e-11)

    !CH+ + O2 -> CO+ + OH
    k(1171) = small + (1.00e-11)

    !CH+ + O2 -> HCO+ + O
    k(1172) = small + (9.70e-10)

    !CH+ + OH -> CO+ + H2
    k(1173) = small + (7.50e-10)

    !CH+ + C2H -> C3+ + H2
    k(1174) = small + (9.80e-10)

    !CH+ + CH2 -> C2H+ + H2
    k(1175) = small + (1.00e-09)

    !CH+ + CO2 -> HCO+ + CO
    k(1176) = small + (1.60e-09)

    !CH+ + H2O -> HCO+ + H2
    k(1177) = small + (2.90e-09)

    !CH+ + H2O -> H2CO+ + H
    k(1178) = small + (5.80e-10)

    !CH+ + H2O -> H3O+ + C
    k(1179) = small + (5.80e-10)

    !CH+ + H2S -> HCS+ + H2
    k(1180) = small + (6.60e-10)

    !CH+ + H2S -> H3S+ + C
    k(1181) = small + (6.30e-10)

    !CH+ + HCN -> C2N+ + H2
    k(1182) = small + (3.60e-10)

    !CH+ + HCN -> C2NH+ + H
    k(1183) = small + (2.40e-10)

    !CH+ + HCN -> HCNH+ + C
    k(1184) = small + (2.40e-09)

    !CH+ + HCO -> CH2+ + CO
    k(1185) = small + (4.60e-10)

    !CH+ + HCO -> HCO+ + CH
    k(1186) = small + (4.60e-10)

    !CH+ + HNC -> HCNH+ + C
    k(1187) = small + (1.80e-09)

    !CH+ + NH2 -> HCN+ + H2
    k(1188) = small + (1.10e-09)

    !CH+ + OCS -> HCS+ + CO
    k(1189) = small + (1.05e-09)

    !CH+ + OCS -> HOCS+ + C
    k(1190) = small + (8.55e-10)

    !CH+ + C2H2 -> C3H2+ + H
    k(1191) = small + (1.20e-09)

    !CH+ + C2H2 -> H2C3+ + H
    k(1192) = small + (1.20e-09)

    !CH+ + H2CO -> HCO+ + CH2
    k(1193) = small + (9.60e-10)

    !CH+ + H2CO -> CH3+ + CO
    k(1194) = small + (9.60e-10)

    !CH+ + H2CO -> H3CO+ + C
    k(1195) = small + (9.60e-10)

    !CH+ + NH3 -> H2NC+ + H2
    k(1196) = small + (1.84e-09)

    !CH+ + NH3 -> NH3+ + CH
    k(1197) = small + (4.59e-10)

    !CH+ + NH3 -> NH4+ + C
    k(1198) = small + (4.05e-10)

    !CH+ + CH4 -> C2H2+ + H2 + H
    k(1199) = small + (1.40e-10)

    !CH+ + CH4 -> C2H3+ + H2
    k(1200) = small + (1.10e-09)

    !CH+ + CH4 -> C2H4+ + H
    k(1201) = small + (6.50e-11)

    !CH+ + CH4O -> CH3+ + H2CO
    k(1202) = small + (1.45e-09)

    !CH+ + CH4O -> H3CO+ + CH2
    k(1203) = small + (2.90e-10)

    !CH+ + CH4O -> CH5O+ + C
    k(1204) = small + (1.16e-09)

    !CN+ + C -> C+ + CN
    k(1205) = small + (1.10e-10)

    !CN+ + H -> H+ + CN
    k(1206) = small + (6.40e-10)

    !CN+ + O -> O+ + CN
    k(1207) = small + (6.50e-11)

    !CN+ + S -> S+ + CN
    k(1208) = small + (1.10e-09)

    !CN+ + C2 -> C2+ + CN
    k(1209) = small + (8.50e-10)

    !CN+ + CH -> CH+ + CN
    k(1210) = small + (6.40e-10)

    !CN+ + CO -> CO+ + CN
    k(1211) = small + (6.30e-10)

    !CN+ + H2 -> HCN+ + H
    k(1212) = small + (7.50e-10)

    !CN+ + NH -> NH+ + CN
    k(1213) = small + (6.50e-10)

    !CN+ + NO -> NO+ + CN
    k(1214) = small + (8.10e-10)

    !CN+ + NO -> NCO+ + N
    k(1215) = small + (1.90e-10)

    !CN+ + O2 -> NO+ + CO
    k(1216) = small + (8.60e-11)

    !CN+ + O2 -> O2+ + CN
    k(1217) = small + (7.80e-10)

    !CN+ + O2 -> NCO+ + O
    k(1218) = small + (8.60e-11)

    !CN+ + OH -> OH+ + CN
    k(1219) = small + (6.40e-10)

    !CN+ + C2H -> C2H+ + CN
    k(1220) = small + (8.00e-10)

    !CN+ + CH2 -> CH2+ + CN
    k(1221) = small + (8.80e-10)

    !CN+ + CO2 -> C2O+ + NO
    k(1222) = small + (2.25e-10)

    !CN+ + CO2 -> CO2+ + CN
    k(1223) = small + (4.50e-10)

    !CN+ + CO2 -> NCO+ + CO
    k(1224) = small + (2.25e-10)

    !CN+ + H2O -> HCN+ + OH
    k(1225) = small + (1.60e-09)

    !CN+ + H2O -> HCO+ + NH
    k(1226) = small + (1.60e-10)

    !CN+ + H2O -> H2NC+ + O
    k(1227) = small + (4.80e-10)

    !CN+ + H2O -> HNCO+ + H
    k(1228) = small + (6.40e-10)

    !CN+ + HCN -> HCN+ + CN
    k(1229) = small + (2.40e-09)

    !CN+ + HCN -> C2N2+ + H
    k(1230) = small + (3.15e-10)

    !CN+ + HCO -> HCN+ + CO
    k(1231) = small + (3.70e-10)

    !CN+ + HCO -> HCO+ + CN
    k(1232) = small + (3.70e-10)

    !CN+ + NH2 -> NH2+ + CN
    k(1233) = small + (9.10e-10)

    !CN+ + H2CO -> HCO+ + HCN
    k(1234) = small + (5.20e-10)

    !CN+ + H2CO -> H2CO+ + CN
    k(1235) = small + (5.20e-10)

    !CO+ + C -> C+ + CO
    k(1236) = small + (1.10e-10)

    !CO+ + H -> H+ + CO
    k(1237) = small + (4.00e-10)

    !CO+ + N -> NO+ + C
    k(1238) = small + (8.10e-11)

    !CO+ + O -> O+ + CO
    k(1239) = small + (1.40e-10)

    !CO+ + S -> S+ + CO
    k(1240) = small + (1.10e-09)

    !CO+ + C2 -> C2+ + CO
    k(1241) = small + (8.40e-10)

    !CO+ + CH -> CH+ + CO
    k(1242) = small + (3.20e-10)

    !CO+ + CH -> HCO+ + C
    k(1243) = small + (3.20e-10)

    !CO+ + H2 -> HCO+ + H
    k(1244) = small + (7.50e-10)

    !CO+ + NH -> NH+ + CO
    k(1245) = small + (3.20e-10)

    !CO+ + NH -> HCO+ + N
    k(1246) = small + (3.20e-10)

    !CO+ + NO -> NO+ + CO
    k(1247) = small + (3.30e-10)

    !CO+ + O2 -> O2+ + CO
    k(1248) = small + (1.20e-10)

    !CO+ + OH -> OH+ + CO
    k(1249) = small + (3.10e-10)

    !CO+ + OH -> HCO+ + O
    k(1250) = small + (3.10e-10)

    !CO+ + C2H -> C2H+ + CO
    k(1251) = small + (3.90e-10)

    !CO+ + C2H -> HCO+ + C2
    k(1252) = small + (3.90e-10)

    !CO+ + CH2 -> CH2+ + CO
    k(1253) = small + (4.30e-10)

    !CO+ + CH2 -> HCO+ + CH
    k(1254) = small + (4.30e-10)

    !CO+ + CO2 -> CO2+ + CO
    k(1255) = small + (1.10e-09)

    !CO+ + H2O -> H2O+ + CO
    k(1256) = small + (1.70e-09)

    !CO+ + H2O -> HCO+ + OH
    k(1257) = small + (8.80e-10)

    !CO+ + H2S -> H2S+ + CO
    k(1258) = small + (2.44e-09)

    !CO+ + H2S -> HCO+ + HS
    k(1259) = small + (1.56e-10)

    !CO+ + HCN -> HCN+ + CO
    k(1260) = small + (3.40e-10)

    !CO+ + HCO -> HCO+ + CO
    k(1261) = small + (7.40e-10)

    !CO+ + NH2 -> HCO+ + NH
    k(1262) = small + (4.50e-10)

    !CO+ + NH2 -> NH2+ + CO
    k(1263) = small + (4.50e-10)

    !CO+ + SO2 -> SO+ + CO2
    k(1264) = small + (1.70e-09)

    !CO+ + H2CO -> HCO+ + HCO
    k(1265) = small + (1.70e-09)

    !CO+ + H2CO -> H2CO+ + CO
    k(1266) = small + (1.40e-09)

    !CO+ + NH3 -> HCO+ + NH2
    k(1267) = small + (4.12e-11)

    !CO+ + NH3 -> NH3+ + CO
    k(1268) = small + (2.02e-09)

    !CO+ + CH4 -> HCO+ + CH3
    k(1269) = small + (4.55e-10)

    !CO+ + CH4 -> CH4+ + CO
    k(1270) = small + (7.93e-10)

    !CO+ + CH4 -> C2H3O+ + H
    k(1271) = small + (5.20e-11)

    !CP+ + O -> P+ + CO
    k(1272) = small + (2.00e-10)

    !CP+ + H2 -> HCP+ + H
    k(1273) = small + (1.00e-09)

    !CS+ + C -> C+ + CS
    k(1274) = small + (1.60e-09)

    !CS+ + FE -> FE+ + CS
    k(1275) = small + (1.70e-10)

    !CS+ + MG -> MG+ + CS
    k(1276) = small + (2.70e-10)

    !CS+ + NA -> NA+ + CS
    k(1277) = small + (2.30e-10)

    !CS+ + O -> CO+ + S
    k(1278) = small + (6.00e-11)

    !CS+ + SI -> SI+ + CS
    k(1279) = small + (1.50e-10)

    !CS+ + H2 -> HCS+ + H
    k(1280) = small + (4.80e-10)

    !CS+ + O2 -> OCS+ + O
    k(1281) = small + (1.30e-10)

    !CS+ + CH4 -> HCS+ + CH3
    k(1282) = small + (5.00e-10)

    !H2+ + C -> CH+ + H
    k(1283) = small + (2.40e-09)

    !H2+ + H -> H+ + H2
    k(1284) = small + (6.40e-10)

    !H2+ + N -> NH+ + H
    k(1285) = small + (1.90e-09)

    !H2+ + O -> OH+ + H
    k(1286) = small + (1.50e-09)

    !H2+ + C2 -> C2+ + H2
    k(1287) = small + (1.10e-09)

    !H2+ + C2 -> C2H+ + H
    k(1288) = small + (1.10e-09)

    !H2+ + CH -> CH+ + H2
    k(1289) = small + (7.10e-10)

    !H2+ + CH -> CH2+ + H
    k(1290) = small + (7.10e-10)

    !H2+ + CN -> CN+ + H2
    k(1291) = small + (1.20e-09)

    !H2+ + CN -> HCN+ + H
    k(1292) = small + (1.20e-09)

    !H2+ + CO -> CO+ + H2
    k(1293) = small + (6.00e-10)

    !H2+ + CO -> HCO+ + H
    k(1294) = small + (2.20e-09)

    !H2+ + H2 -> H3+ + H
    k(1295) = small + (2.10e-09)

    !H2+ + N2 -> N2H+ + H
    k(1296) = small + (2.00e-09)

    !H2+ + NH -> NH+ + H2
    k(1297) = small + (7.60e-10)

    !H2+ + NH -> NH2+ + H
    k(1298) = small + (7.60e-10)

    !H2+ + NO -> NO+ + H2
    k(1299) = small + (1.10e-09)

    !H2+ + NO -> HNO+ + H
    k(1300) = small + (1.10e-09)

    !H2+ + O2 -> O2+ + H2
    k(1301) = small + (8.00e-10)

    !H2+ + O2 -> O2H+ + H
    k(1302) = small + (1.90e-09)

    !H2+ + OH -> OH+ + H2
    k(1303) = small + (7.60e-10)

    !H2+ + OH -> H2O+ + H
    k(1304) = small + (7.60e-10)

    !H2+ + C2H -> C2H+ + H2
    k(1305) = small + (1.00e-09)

    !H2+ + C2H -> C2H2+ + H
    k(1306) = small + (1.00e-09)

    !H2+ + CH2 -> CH2+ + H2
    k(1307) = small + (1.00e-09)

    !H2+ + CH2 -> CH3+ + H
    k(1308) = small + (1.00e-09)

    !H2+ + CO2 -> CO+ + H2O
    k(1309) = small + (1.40e-09)

    !H2+ + CO2 -> CO2+ + H2
    k(1310) = small + (1.40e-09)

    !H2+ + CO2 -> HCO2+ + H
    k(1311) = small + (2.35e-09)

    !H2+ + H2O -> H2O+ + H2
    k(1312) = small + (3.90e-09)

    !H2+ + H2O -> H3O+ + H
    k(1313) = small + (3.40e-09)

    !H2+ + H2S -> S+ + H2 + H2
    k(1314) = small + (7.70e-10)

    !H2+ + H2S -> HS+ + H + H2
    k(1315) = small + (8.60e-10)

    !H2+ + H2S -> H2S+ + H2
    k(1316) = small + (2.70e-09)

    !H2+ + HCN -> HCN+ + H2
    k(1317) = small + (2.70e-09)

    !H2+ + HCO -> H3+ + CO
    k(1318) = small + (1.00e-09)

    !H2+ + HCO -> HCO+ + H2
    k(1319) = small + (1.00e-09)

    !H2+ + NH2 -> NH2+ + H2
    k(1320) = small + (2.10e-09)

    !H2+ + C2H2 -> C2H2+ + H2
    k(1321) = small + (4.80e-09)

    !H2+ + C2H2 -> C2H3+ + H
    k(1322) = small + (4.80e-10)

    !H2+ + H2CO -> HCO+ + H + H2
    k(1323) = small + (1.40e-09)

    !H2+ + H2CO -> H2CO+ + H2
    k(1324) = small + (1.40e-09)

    !H2+ + NH3 -> NH3+ + H2
    k(1325) = small + (5.70e-09)

    !H2+ + CH4 -> CH3+ + H + H2
    k(1326) = small + (2.30e-09)

    !H2+ + CH4 -> CH4+ + H2
    k(1327) = small + (1.40e-09)

    !H2+ + CH4 -> CH5+ + H
    k(1328) = small + (1.10e-10)

    !H2+ + C2H4 -> C2H2+ + H2 + H2
    k(1329) = small + (8.82e-10)

    !H2+ + C2H4 -> C2H3+ + H2 + H
    k(1330) = small + (1.81e-09)

    !H2+ + C2H4 -> C2H4+ + H2
    k(1331) = small + (2.21e-09)

    !HCL+ + H2 -> H2CL+ + H
    k(1332) = small + (1.30e-09)

    !HF+ + H2 -> H2F+ + H
    k(1333) = small + (1.30e-09)

    !HEH+ + H -> H2+ + HE
    k(1334) = small + (9.00e-10)

    !HEH+ + H2 -> H3+ + HE
    k(1335) = small + (1.80e-09)

    !HS+ + C -> CS+ + H
    k(1336) = small + (9.90e-10)

    !HS+ + FE -> FE+ + HS
    k(1337) = small + (1.60e-09)

    !HS+ + H -> S+ + H2
    k(1338) = small + (1.10e-10)

    !HS+ + MG -> MG+ + HS
    k(1339) = small + (2.60e-09)

    !HS+ + N -> NS+ + H
    k(1340) = small + (7.40e-10)

    !HS+ + NA -> NA+ + HS
    k(1341) = small + (2.20e-09)

    !HS+ + O -> S+ + OH
    k(1342) = small + (2.90e-10)

    !HS+ + O -> SO+ + H
    k(1343) = small + (2.90e-10)

    !HS+ + S -> S+ + HS
    k(1344) = small + (9.70e-10)

    !HS+ + SI -> SI+ + HS
    k(1345) = small + (1.40e-09)

    !HS+ + CH -> CH2+ + S
    k(1346) = small + (5.80e-10)

    !HS+ + NO -> NO+ + HS
    k(1347) = small + (4.50e-10)

    !HS+ + H2O -> H3O+ + S
    k(1348) = small + (7.80e-10)

    !HS+ + H2S -> S2H+ + H2
    k(1349) = small + (2.80e-10)

    !HS+ + H2S -> H3S+ + S
    k(1350) = small + (2.90e-10)

    !HS+ + HCN -> HCNH+ + S
    k(1351) = small + (8.90e-10)

    !HS+ + HNC -> HCNH+ + S
    k(1352) = small + (8.60e-10)

    !HS+ + NH3 -> NH3+ + HS
    k(1353) = small + (8.40e-10)

    !HS+ + NH3 -> NH4+ + S
    k(1354) = small + (7.70e-10)

    !HS+ + CH4 -> H3CS+ + H2
    k(1355) = small + (5.40e-10)

    !N2+ + C -> C+ + N2
    k(1356) = small + (1.10e-10)

    !N2+ + FE -> FE+ + N2
    k(1357) = small + (4.30e-10)

    !N2+ + H -> H+ + N2
    k(1358) = small + (1.20e-10)

    !N2+ + MG -> MG+ + N2
    k(1359) = small + (7.00e-10)

    !N2+ + N -> N+ + N2
    k(1360) = small + (1.00e-11)

    !N2+ + NA -> NA+ + N2
    k(1361) = small + (1.90e-09)

    !N2+ + O -> O+ + N2
    k(1362) = small + (1.00e-11)

    !N2+ + O -> NO+ + N
    k(1363) = small + (1.40e-10)

    !N2+ + S -> S+ + N2
    k(1364) = small + (1.10e-09)

    !N2+ + C2 -> C2+ + N2
    k(1365) = small + (8.40e-10)

    !N2+ + CH -> CH+ + N2
    k(1366) = small + (6.30e-10)

    !N2+ + CN -> CN+ + N2
    k(1367) = small + (1.00e-10)

    !N2+ + CO -> CO+ + N2
    k(1368) = small + (7.00e-11)

    !N2+ + H2 -> N2H+ + H
    k(1369) = small + (1.70e-09)

    !N2+ + NH -> NH+ + N2
    k(1370) = small + (6.50e-10)

    !N2+ + NO -> NO+ + N2
    k(1371) = small + (4.40e-10)

    !N2+ + O2 -> O2+ + N2
    k(1372) = small + (5.00e-11)

    !N2+ + OH -> OH+ + N2
    k(1373) = small + (6.30e-10)

    !N2+ + C2H -> C2H+ + N2
    k(1374) = small + (7.90e-10)

    !N2+ + CH2 -> CH2+ + N2
    k(1375) = small + (8.70e-10)

    !N2+ + CO2 -> CO2+ + N2
    k(1376) = small + (9.00e-10)

    !N2+ + H2O -> H2O+ + N2
    k(1377) = small + (2.20e-09)

    !N2+ + H2O -> N2H+ + OH
    k(1378) = small + (2.00e-09)

    !N2+ + H2S -> S+ + N2 + H2
    k(1379) = small + (2.25e-10)

    !N2+ + H2S -> HS+ + N2 + H
    k(1380) = small + (1.13e-09)

    !N2+ + H2S -> H2S+ + N2
    k(1381) = small + (1.50e-10)

    !N2+ + HCN -> HCN+ + N2
    k(1382) = small + (1.00e-09)

    !N2+ + HCO -> HCO+ + N2
    k(1383) = small + (3.70e-10)

    !N2+ + HCO -> N2H+ + CO
    k(1384) = small + (3.70e-10)

    !N2+ + NH2 -> NH2+ + N2
    k(1385) = small + (8.90e-10)

    !N2+ + OCS -> S+ + N2 + CO
    k(1386) = small + (1.04e-09)

    !N2+ + OCS -> OCS+ + N2
    k(1387) = small + (2.60e-10)

    !N2+ + H2CO -> HCO+ + N2 + H
    k(1388) = small + (2.50e-09)

    !N2+ + H2CO -> H2CO+ + N2
    k(1389) = small + (3.77e-10)

    !N2+ + NH3 -> NH3+ + N2
    k(1390) = small + (1.90e-09)

    !N2+ + CH4 -> CH2+ + H2 + N2
    k(1391) = small + (7.00e-11)

    !N2+ + CH4 -> CH3+ + N2 + H
    k(1392) = small + (9.30e-10)

    !NH+ + C -> CH+ + N
    k(1393) = small + (1.60e-09)

    !NH+ + N -> N2+ + H
    k(1394) = small + (1.30e-09)

    !NH+ + O -> OH+ + N
    k(1395) = small + (1.00e-09)

    !NH+ + S -> S+ + NH
    k(1396) = small + (6.90e-10)

    !NH+ + S -> HS+ + N
    k(1397) = small + (6.90e-10)

    !NH+ + S -> NS+ + H
    k(1398) = small + (6.90e-10)

    !NH+ + C2 -> C2H+ + N
    k(1399) = small + (4.90e-10)

    !NH+ + C2 -> C2N+ + H
    k(1400) = small + (4.90e-10)

    !NH+ + C2 -> HCN+ + C
    k(1401) = small + (4.90e-10)

    !NH+ + CH -> CH2+ + N
    k(1402) = small + (9.90e-10)

    !NH+ + CN -> HCN+ + N
    k(1403) = small + (1.60e-09)

    !NH+ + CO -> HCO+ + N
    k(1404) = small + (1.60e-09)

    !NH+ + CO -> NCO+ + H
    k(1405) = small + (5.39e-10)

    !NH+ + H2 -> H3+ + N
    k(1406) = small + (2.25e-10)

    !NH+ + H2 -> NH2+ + H
    k(1407) = small + (1.00e-09)

    !NH+ + N2 -> N2H+ + N
    k(1408) = small + (1.50e-09)

    !NH+ + NH -> NH2+ + N
    k(1409) = small + (1.00e-09)

    !NH+ + NO -> NO+ + NH
    k(1410) = small + (7.10e-10)

    !NH+ + NO -> N2H+ + O
    k(1411) = small + (1.78e-10)

    !NH+ + O2 -> NO+ + OH
    k(1412) = small + (2.00e-10)

    !NH+ + O2 -> O2+ + NH
    k(1413) = small + (4.50e-10)

    !NH+ + O2 -> O2H+ + N
    k(1414) = small + (1.60e-10)

    !NH+ + OH -> H2O+ + N
    k(1415) = small + (1.00e-09)

    !NH+ + C2H -> C2H2+ + N
    k(1416) = small + (1.40e-09)

    !NH+ + CH2 -> CH3+ + N
    k(1417) = small + (1.40e-09)

    !NH+ + CO2 -> NO+ + HCO
    k(1418) = small + (3.30e-10)

    !NH+ + CO2 -> HNO+ + CO
    k(1419) = small + (3.85e-10)

    !NH+ + CO2 -> HCO2+ + N
    k(1420) = small + (3.90e-10)

    !NH+ + H2O -> H2O+ + NH
    k(1421) = small + (1.05e-09)

    !NH+ + H2O -> HNO+ + H2
    k(1422) = small + (3.50e-10)

    !NH+ + H2O -> NH2+ + OH
    k(1423) = small + (8.75e-10)

    !NH+ + H2O -> H3O+ + N
    k(1424) = small + (2.10e-09)

    !NH+ + H2O -> NH3+ + O
    k(1425) = small + (1.75e-10)

    !NH+ + HCN -> HCNH+ + N
    k(1426) = small + (1.80e-09)

    !NH+ + HCO -> H2CO+ + N
    k(1427) = small + (1.30e-09)

    !NH+ + HNC -> HCNH+ + N
    k(1428) = small + (1.80e-09)

    !NH+ + NH2 -> NH3+ + N
    k(1429) = small + (1.50e-09)

    !NH+ + H2CO -> HCO+ + NH2
    k(1430) = small + (1.80e-09)

    !NH+ + H2CO -> H2CO+ + NH
    k(1431) = small + (9.90e-10)

    !NH+ + H2CO -> H3CO+ + N
    k(1432) = small + (4.95e-10)

    !NH+ + NH3 -> NH3+ + NH
    k(1433) = small + (1.80e-09)

    !NH+ + NH3 -> NH4+ + N
    k(1434) = small + (6.00e-10)

    !NO+ + FE -> FE+ + NO
    k(1435) = small + (9.20e-10)

    !NO+ + MG -> MG+ + NO
    k(1436) = small + (8.10e-10)

    !NO+ + NA -> NA+ + NO
    k(1437) = small + (7.00e-11)

    !NO+ + SI -> SI+ + NO
    k(1438) = small + (1.60e-09)

    !NS+ + O -> NO+ + S
    k(1439) = small + (6.10e-10)

    !O2+ + C -> C+ + O2
    k(1440) = small + (5.20e-11)

    !O2+ + C -> CO+ + O
    k(1441) = small + (5.20e-11)

    !O2+ + FE -> FE+ + O2
    k(1442) = small + (1.10e-09)

    !O2+ + MG -> MG+ + O2
    k(1443) = small + (1.20e-09)

    !O2+ + N -> NO+ + O
    k(1444) = small + (1.80e-10)

    !O2+ + NA -> NA+ + O2
    k(1445) = small + (7.10e-10)

    !O2+ + S -> S+ + O2
    k(1446) = small + (5.40e-10)

    !O2+ + S -> SO+ + O
    k(1447) = small + (5.40e-10)

    !O2+ + SI -> SI+ + O2
    k(1448) = small + (1.60e-09)

    !O2+ + C2 -> CO+ + CO
    k(1449) = small + (4.10e-10)

    !O2+ + CH -> CH+ + O2
    k(1450) = small + (3.10e-10)

    !O2+ + CH -> HCO+ + O
    k(1451) = small + (3.10e-10)

    !O2+ + NH -> HNO+ + O
    k(1452) = small + (3.20e-10)

    !O2+ + NH -> NO2+ + H
    k(1453) = small + (3.20e-10)

    !O2+ + NO -> NO+ + O2
    k(1454) = small + (4.50e-10)

    !O2+ + CH2 -> CH2+ + O2
    k(1455) = small + (4.30e-10)

    !O2+ + CH2 -> H2CO+ + O
    k(1456) = small + (4.30e-10)

    !O2+ + H2S -> H2S+ + O2
    k(1457) = small + (1.40e-09)

    !O2+ + HCO -> HCO+ + O2
    k(1458) = small + (3.60e-10)

    !O2+ + HCO -> O2H+ + CO
    k(1459) = small + (3.60e-10)

    !O2+ + NH2 -> NH2+ + O2
    k(1460) = small + (8.70e-10)

    !O2+ + NO2 -> NO2+ + O2
    k(1461) = small + (6.60e-10)

    !O2+ + H2CO -> HCO+ + O2 + H
    k(1462) = small + (2.30e-10)

    !O2+ + H2CO -> H2CO+ + O2
    k(1463) = small + (9.90e-10)

    !O2+ + NH3 -> NH3+ + O2
    k(1464) = small + (2.40e-09)

    !O2+ + CH4 -> CH3O2+ + H
    k(1465) = small + (3.80e-12&
        *T32**(-1.80e+00))

    !O2+ + CH4O -> H3CO+ + O2 + H
    k(1466) = small + (5.00e-10)

    !O2+ + CH4O -> CH4O+ + O2
    k(1467) = small + (5.00e-10)

    !OH+ + C -> CH+ + O
    k(1468) = small + (1.20e-09)

    !OH+ + N -> NO+ + H
    k(1469) = small + (8.90e-10)

    !OH+ + O -> O2+ + H
    k(1470) = small + (7.10e-10)

    !OH+ + S -> S+ + OH
    k(1471) = small + (4.30e-10)

    !OH+ + S -> HS+ + O
    k(1472) = small + (4.30e-10)

    !OH+ + S -> SO+ + H
    k(1473) = small + (4.30e-10)

    !OH+ + SI -> SIH+ + O
    k(1474) = small + (1.90e-09)

    !OH+ + C2 -> C2+ + OH
    k(1475) = small + (4.80e-10)

    !OH+ + C2 -> C2H+ + O
    k(1476) = small + (4.80e-10)

    !OH+ + CH -> CH+ + OH
    k(1477) = small + (3.50e-10)

    !OH+ + CH -> CH2+ + O
    k(1478) = small + (3.50e-10)

    !OH+ + CN -> HCN+ + O
    k(1479) = small + (1.00e-09)

    !OH+ + CO -> HCO+ + O
    k(1480) = small + (1.00e-09)

    !OH+ + H2 -> H2O+ + H
    k(1481) = small + (1.10e-09)

    !OH+ + N2 -> N2H+ + O
    k(1482) = small + (3.60e-10)

    !OH+ + NH -> NH2+ + O
    k(1483) = small + (3.60e-10)

    !OH+ + NO -> NO+ + OH
    k(1484) = small + (3.60e-10)

    !OH+ + NO -> HNO+ + O
    k(1485) = small + (6.10e-10)

    !OH+ + O2 -> O2+ + OH
    k(1486) = small + (5.90e-10)

    !OH+ + OH -> H2O+ + O
    k(1487) = small + (7.00e-10)

    !OH+ + SIC -> CHSI+ + O
    k(1488) = small + (4.50e-09)

    !OH+ + SIH -> SIH2+ + O
    k(1489) = small + (1.00e-09)

    !OH+ + SIO -> HSIO+ + O
    k(1490) = small + (9.40e-10)

    !OH+ + C2H -> C2H+ + OH
    k(1491) = small + (4.50e-10)

    !OH+ + C2H -> C2H2+ + O
    k(1492) = small + (4.50e-10)

    !OH+ + CH2 -> CH2+ + OH
    k(1493) = small + (4.80e-10)

    !OH+ + CH2 -> CH3+ + O
    k(1494) = small + (4.80e-10)

    !OH+ + CO2 -> HCO2+ + O
    k(1495) = small + (1.40e-09)

    !OH+ + H2O -> H2O+ + OH
    k(1496) = small + (1.50e-09)

    !OH+ + H2O -> H3O+ + O
    k(1497) = small + (1.30e-09)

    !OH+ + H2S -> H2S+ + OH
    k(1498) = small + (1.20e-09)

    !OH+ + H2S -> H3S+ + O
    k(1499) = small + (8.20e-10)

    !OH+ + HCN -> HCNH+ + O
    k(1500) = small + (1.20e-09)

    !OH+ + HCO -> H2O+ + CO
    k(1501) = small + (2.80e-10)

    !OH+ + HCO -> HCO+ + OH
    k(1502) = small + (2.80e-10)

    !OH+ + HCO -> H2CO+ + O
    k(1503) = small + (2.80e-10)

    !OH+ + HNC -> HCNH+ + O
    k(1504) = small + (1.20e-09)

    !OH+ + NH2 -> NH2+ + OH
    k(1505) = small + (5.00e-10)

    !OH+ + NH2 -> NH3+ + O
    k(1506) = small + (5.00e-10)

    !OH+ + H2CO -> H2CO+ + OH
    k(1507) = small + (7.40e-10)

    !OH+ + H2CO -> H3CO+ + O
    k(1508) = small + (1.10e-09)

    !OH+ + NH3 -> NH3+ + OH
    k(1509) = small + (1.20e-09)

    !OH+ + NH3 -> NH4+ + O
    k(1510) = small + (1.20e-09)

    !OH+ + CH4 -> H3O+ + CH2
    k(1511) = small + (1.40e-09)

    !OH+ + CH4 -> CH5+ + O
    k(1512) = small + (1.95e-10)

    !PH+ + O -> PO+ + H
    k(1513) = small + (1.00e-09)

    !PH+ + O2 -> PO+ + OH
    k(1514) = small + (4.90e-10)

    !PH+ + H2O -> HPO+ + H2
    k(1515) = small + (7.03e-10&
        *invsqrT32)

    !PH+ + H2O -> H2PO+ + H
    k(1516) = small + (7.03e-10&
        *invsqrT32)

    !PH+ + H2O -> H3O+ + P
    k(1517) = small + (7.03e-10&
        *invsqrT32)

    !PH+ + HCN -> HCNH+ + P
    k(1518) = small + (7.15e-09&
        *invsqrT32)

    !PH+ + C2H2 -> PC2H2+ + H
    k(1519) = small + (1.30e-09)

    !PH+ + NH3 -> PNH2+ + H2
    k(1520) = small + (5.70e-10&
        *invsqrT32)

    !PH+ + NH3 -> NH4+ + P
    k(1521) = small + (5.70e-10&
        *invsqrT32)

    !PH+ + NH3 -> PNH3+ + H
    k(1522) = small + (5.70e-10&
        *invsqrT32)

    !PH+ + CH4 -> PCH3+ + H2
    k(1523) = small + (1.10e-09)

    !PH+ + CH4 -> PCH4+ + H
    k(1524) = small + (5.50e-11)

    !PH+ + C2H4 -> PCH2+ + CH3
    k(1525) = small + (3.60e-10)

    !PH+ + C2H4 -> PC2H3+ + H2
    k(1526) = small + (8.40e-10)

    !S2+ + NO -> NO+ + S2
    k(1527) = small + (5.10e-10)

    !S2+ + C2H5OH -> C2H5O+ + HS2
    k(1528) = small + (1.60e-09)

    !S2+ + C2H5OH -> H2S2+ + C2H4O
    k(1529) = small + (8.50e-11)

    !S2+ + CH3OCH3 -> C2H5O+ + HS2
    k(1530) = small + (1.60e-09)

    !SIC+ + N -> SI+ + CN
    k(1531) = small + (7.70e-10)

    !SIC+ + O -> SIO+ + C
    k(1532) = small + (6.00e-10)

    !SIC+ + H2 -> CHSI+ + H
    k(1533) = small + (1.50e-09)

    !SIH+ + C -> SIC+ + H
    k(1534) = small + (2.00e-10)

    !SIH+ + H -> SI+ + H2
    k(1535) = small + (1.90e-09)

    !SIH+ + N -> SIN+ + H
    k(1536) = small + (2.00e-10)

    !SIH+ + O -> SIO+ + H
    k(1537) = small + (6.10e-10)

    !SIH+ + NH3 -> NH4+ + SI
    k(1538) = small + (1.00e-09)

    !SIN+ + O -> SIO+ + N
    k(1539) = small + (1.00e-09)

    !SIO+ + C -> SI+ + CO
    k(1540) = small + (1.00e-09)

    !SIO+ + FE -> FE+ + SIO
    k(1541) = small + (1.00e-09)

    !SIO+ + MG -> MG+ + SIO
    k(1542) = small + (1.00e-09)

    !SIO+ + N -> SI+ + NO
    k(1543) = small + (2.00e-10)

    !SIO+ + N -> NO+ + SI
    k(1544) = small + (2.00e-10)

    !SIO+ + O -> SI+ + O2
    k(1545) = small + (2.00e-10)

    !SIO+ + S -> SI+ + SO
    k(1546) = small + (1.00e-09)

    !SIO+ + C2 -> SIC+ + CO
    k(1547) = small + (7.60e-10)

    !SIO+ + CH -> HCO+ + SI
    k(1548) = small + (5.90e-10)

    !SIO+ + CO -> SI+ + CO2
    k(1549) = small + (7.90e-10)

    !SIO+ + H2 -> HSIO+ + H
    k(1550) = small + (3.20e-10)

    !SIO+ + NO -> NO+ + SIO
    k(1551) = small + (7.20e-10)

    !SIO+ + CH2 -> SI+ + H2CO
    k(1552) = small + (8.20e-10)

    !SIO+ + HCO -> HCO+ + SIO
    k(1553) = small + (6.60e-10)

    !SIS+ + H -> SI+ + HS
    k(1554) = small + (1.90e-09)

    !SIS+ + H2 -> HSIS+ + H
    k(1555) = small + (1.50e-09)

    !SO+ + FE -> FE+ + SO
    k(1556) = small + (1.60e-09)

    !SO+ + MG -> MG+ + SO
    k(1557) = small + (1.00e-10)

    !SO+ + N -> NS+ + O
    k(1558) = small + (5.00e-11)

    !SO+ + NA -> NA+ + SO
    k(1559) = small + (2.30e-09)

    !SO+ + H2S -> S2+ + H2O
    k(1560) = small + (1.10e-09)

    !SO+ + NH3 -> NH3+ + SO
    k(1561) = small + (1.30e-09)

    !C2H+ + C -> C3+ + H
    k(1562) = small + (1.10e-09)

    !C2H+ + N -> CH+ + CN
    k(1563) = small + (9.00e-11)

    !C2H+ + N -> C2N+ + H
    k(1564) = small + (1.00e-10)

    !C2H+ + O -> HCO+ + C
    k(1565) = small + (3.30e-10)

    !C2H+ + S -> S+ + C2H
    k(1566) = small + (1.20e-09)

    !C2H+ + CH -> CH2+ + C2
    k(1567) = small + (3.20e-10)

    !C2H+ + CH -> C3H+ + H
    k(1568) = small + (3.20e-10)

    !C2H+ + CN -> C3N+ + H
    k(1569) = small + (9.10e-10)

    !C2H+ + H2 -> C2H2+ + H
    k(1570) = small + (1.10e-09)

    !C2H+ + NO -> NO+ + C2H
    k(1571) = small + (1.20e-10)

    !C2H+ + CH2 -> CH3+ + C2
    k(1572) = small + (4.40e-10)

    !C2H+ + CH2 -> C3H2+ + H
    k(1573) = small + (2.20e-10)

    !C2H+ + CH2 -> H2C3+ + H
    k(1574) = small + (2.20e-10)

    !C2H+ + CO2 -> C2HO+ + CO
    k(1575) = small + (9.40e-10)

    !C2H+ + H2O -> C2H2O+ + H
    k(1576) = small + (8.70e-10)

    !C2H+ + HCN -> C2H2+ + CN
    k(1577) = small + (1.40e-09)

    !C2H+ + HCN -> HCNH+ + C2
    k(1578) = small + (9.50e-10)

    !C2H+ + HCN -> C3HN+ + H
    k(1579) = small + (1.80e-09)

    !C2H+ + HCO -> C2H2+ + CO
    k(1580) = small + (7.60e-10)

    !C2H+ + HNC -> HCNH+ + C2
    k(1581) = small + (1.40e-09)

    !C2H+ + NH2 -> NH3+ + C2
    k(1582) = small + (4.60e-10)

    !C2H+ + NH2 -> C2H2N+ + H
    k(1583) = small + (4.60e-10)

    !C2H+ + C2H2 -> C4H2+ + H
    k(1584) = small + (1.70e-09)

    !C2H+ + H2CO -> H3CO+ + C2
    k(1585) = small + (1.10e-09)

    !C2H+ + NH3 -> C2H2N+ + H2
    k(1586) = small + (5.50e-10)

    !C2H+ + NH3 -> NH4+ + C2
    k(1587) = small + (5.50e-10)

    !C2H+ + CH4 -> C2H2+ + CH3
    k(1588) = small + (3.74e-10)

    !C2H+ + CH4 -> C3H3+ + H2
    k(1589) = small + (1.87e-10)

    !C2H+ + CH4 -> H3C3+ + H2
    k(1590) = small + (1.87e-10)

    !C2H+ + CH4 -> C3H4+ + H
    k(1591) = small + (1.32e-10)

    !C2N+ + H2 -> HCNH+ + C
    k(1592) = small + (8.10e-10)

    !C2N+ + CH4 -> C2H3+ + HCN
    k(1593) = small + (4.20e-10)

    !C2N+ + CH4 -> C3H2N+ + H2
    k(1594) = small + (2.10e-10)

    !C2N+ + CH4 -> HCNH+ + C2H2
    k(1595) = small + (7.00e-11)

    !C2N+ + NH3 -> HCNH+ + HCN
    k(1596) = small + (1.90e-09)

    !C2N+ + H2O -> HCO+ + HCN
    k(1597) = small + (1.50e-09)

    !C2N+ + H2O -> HCNH+ + CO
    k(1598) = small + (1.30e-10)

    !C2N+ + C2H2 -> C3H+ + HCN
    k(1599) = small + (1.50e-09)

    !C2N+ + C2H2 -> HCNH+ + C3
    k(1600) = small + (1.30e-10)

    !C2N+ + H2S -> HCS+ + HCN
    k(1601) = small + (1.20e-09)

    !C3+ + H2 -> C3H+ + H
    k(1602) = small + (2.40e-10)

    !C3+ + C2H2 -> C5H+ + H
    k(1603) = small + (6.00e-10)

    !CH2+ + C -> C2H+ + H
    k(1604) = small + (1.20e-09)

    !CH2+ + N -> HCN+ + H
    k(1605) = small + (2.20e-10)

    !CH2+ + O -> HCO+ + H
    k(1606) = small + (7.50e-10)

    !CH2+ + S -> HCS+ + H
    k(1607) = small + (1.40e-09)

    !CH2+ + C2 -> C3H+ + H
    k(1608) = small + (1.00e-09)

    !CH2+ + CH -> C2H2+ + H
    k(1609) = small + (7.20e-10)

    !CH2+ + H2 -> CH3+ + H
    k(1610) = small + (1.20e-09)

    !CH2+ + NH -> HCNH+ + H
    k(1611) = small + (7.50e-10)

    !CH2+ + NO -> NO+ + CH2
    k(1612) = small + (4.20e-10)

    !CH2+ + O2 -> HCO+ + OH
    k(1613) = small + (9.10e-10)

    !CH2+ + O2 -> HCO2+ + H
    k(1614) = small + (4.70e-10)

    !CH2+ + OH -> H2CO+ + H
    k(1615) = small + (7.40e-10)

    !CH2+ + C2H -> C3H2+ + H
    k(1616) = small + (4.75e-10)

    !CH2+ + C2H -> H2C3+ + H
    k(1617) = small + (4.75e-10)

    !CH2+ + CH2 -> C2H3+ + H
    k(1618) = small + (1.00e-09)

    !CH2+ + CO2 -> H2CO+ + CO
    k(1619) = small + (1.20e-09)

    !CH2+ + H2O -> H3CO+ + H
    k(1620) = small + (1.20e-09)

    !CH2+ + H2S -> HCS+ + H2 + H
    k(1621) = small + (1.10e-09)

    !CH2+ + H2S -> H3CS+ + H
    k(1622) = small + (1.60e-09)

    !CH2+ + HCN -> C2H2N+ + H
    k(1623) = small + (1.80e-09)

    !CH2+ + HCO -> CH3+ + CO
    k(1624) = small + (4.50e-10)

    !CH2+ + HCO -> C2H2O+ + H
    k(1625) = small + (4.50e-10)

    !CH2+ + NH2 -> HCNH+ + H2
    k(1626) = small + (1.00e-09)

    !CH2+ + OCS -> HCS+ + HCO
    k(1627) = small + (1.08e-09)

    !CH2+ + OCS -> H2CS+ + CO
    k(1628) = small + (7.20e-10)

    !CH2+ + H2CO -> HCO+ + CH3
    k(1629) = small + (2.80e-09)

    !CH2+ + H2CO -> C2H2O+ + H2
    k(1630) = small + (1.65e-10)

    !CH2+ + H2CO -> C2H3O+ + H
    k(1631) = small + (3.30e-10)

    !CH2+ + NH3 -> NH4+ + CH
    k(1632) = small + (1.30e-09)

    !CH2+ + NH3 -> CH4N+ + H
    k(1633) = small + (1.50e-09)

    !CH2+ + CH4 -> C2H4+ + H2
    k(1634) = small + (9.10e-10)

    !CH2+ + CH4 -> C2H5+ + H
    k(1635) = small + (3.60e-10)

    !CHSI+ + H2 -> CH2SI+ + H
    k(1636) = small + (1.50e-09)

    !CNC+ + NH3 -> HCNH+ + HCN
    k(1637) = small + (1.90e-09)

    !CNC+ + H2O -> HCO+ + HCN
    k(1638) = small + (6.40e-11)

    !CNC+ + C2H2 -> C3H+ + HCN
    k(1639) = small + (6.40e-10)

    !CNC+ + C2H2 -> HCNH+ + C3
    k(1640) = small + (5.60e-11)

    !CO2+ + H -> H+ + CO2
    k(1641) = small + (1.00e-10)

    !CO2+ + H -> HCO+ + O
    k(1642) = small + (2.90e-10)

    !CO2+ + O -> O+ + CO2
    k(1643) = small + (9.62e-11)

    !CO2+ + O -> O2+ + CO
    k(1644) = small + (1.64e-10)

    !CO2+ + H2 -> HCO2+ + H
    k(1645) = small + (8.70e-10)

    !CO2+ + NO -> NO+ + CO2
    k(1646) = small + (1.20e-10)

    !CO2+ + O2 -> O2+ + CO2
    k(1647) = small + (5.00e-11)

    !CO2+ + H2O -> H2O+ + CO2
    k(1648) = small + (2.04e-09)

    !CO2+ + H2O -> HCO2+ + OH
    k(1649) = small + (7.56e-10)

    !CO2+ + H2S -> H2S+ + CO2
    k(1650) = small + (1.40e-09)

    !CO2+ + NH3 -> NH3+ + CO2
    k(1651) = small + (1.98e-09)

    !CO2+ + CH4 -> HCO2+ + CH3
    k(1652) = small + (5.50e-10)

    !CO2+ + CH4 -> CH4+ + CO2
    k(1653) = small + (5.50e-10)

    !H2CL+ + CO -> HCO+ + HCL
    k(1654) = small + (7.80e-10)

    !H2CL+ + H2O -> H3O+ + HCL
    k(1655) = small + (2.00e-09)

    !H2O+ + C -> CH+ + OH
    k(1656) = small + (1.10e-09)

    !H2O+ + FE -> FE+ + H2O
    k(1657) = small + (1.50e-09)

    !H2O+ + MG -> MG+ + H2O
    k(1658) = small + (2.20e-09)

    !H2O+ + N -> HNO+ + H
    k(1659) = small + (1.90e-10)

    !H2O+ + NA -> NA+ + H2O
    k(1660) = small + (2.70e-09)

    !H2O+ + O -> O2+ + H2
    k(1661) = small + (4.00e-11)

    !H2O+ + S -> S+ + H2O
    k(1662) = small + (4.30e-10)

    !H2O+ + S -> HS+ + OH
    k(1663) = small + (4.30e-10)

    !H2O+ + S -> HSO+ + H
    k(1664) = small + (4.30e-10)

    !H2O+ + SI -> SI+ + H2O
    k(1665) = small + (3.00e-09)

    !H2O+ + C2 -> C2+ + H2O
    k(1666) = small + (4.70e-10)

    !H2O+ + C2 -> C2H+ + OH
    k(1667) = small + (4.70e-10)

    !H2O+ + CH -> CH+ + H2O
    k(1668) = small + (3.40e-10)

    !H2O+ + CH -> CH2+ + OH
    k(1669) = small + (3.40e-10)

    !H2O+ + CO -> HCO+ + OH
    k(1670) = small + (5.00e-10)

    !H2O+ + H2 -> H3O+ + H
    k(1671) = small + (6.10e-10)

    !H2O+ + NH -> H3O+ + N
    k(1672) = small + (7.10e-10)

    !H2O+ + NO -> NO+ + H2O
    k(1673) = small + (1.20e-09)

    !H2O+ + O2 -> O2+ + H2O
    k(1674) = small + (4.30e-10)

    !H2O+ + OH -> H3O+ + O
    k(1675) = small + (6.90e-10)

    !H2O+ + C2H -> C2H+ + H2O
    k(1676) = small + (4.40e-10)

    !H2O+ + C2H -> C2H2+ + OH
    k(1677) = small + (4.40e-10)

    !H2O+ + CH2 -> CH2+ + H2O
    k(1678) = small + (4.70e-10)

    !H2O+ + CH2 -> CH3+ + OH
    k(1679) = small + (4.70e-10)

    !H2O+ + H2O -> H3O+ + OH
    k(1680) = small + (2.10e-09)

    !H2O+ + H2S -> H2S+ + H2O
    k(1681) = small + (8.90e-10)

    !H2O+ + H2S -> H3O+ + HS
    k(1682) = small + (5.90e-10)

    !H2O+ + H2S -> H3S+ + OH
    k(1683) = small + (7.00e-10)

    !H2O+ + HCN -> HCNH+ + OH
    k(1684) = small + (2.10e-09)

    !H2O+ + HCO -> HCO+ + H2O
    k(1685) = small + (2.80e-10)

    !H2O+ + HCO -> H2CO+ + OH
    k(1686) = small + (2.80e-10)

    !H2O+ + HCO -> H3O+ + CO
    k(1687) = small + (2.80e-10)

    !H2O+ + HNC -> HCNH+ + OH
    k(1688) = small + (1.10e-09)

    !H2O+ + NH2 -> NH2+ + H2O
    k(1689) = small + (4.90e-10)

    !H2O+ + NH2 -> NH3+ + OH
    k(1690) = small + (4.90e-10)

    !H2O+ + H2CO -> H2CO+ + H2O
    k(1691) = small + (1.40e-09)

    !H2O+ + H2CO -> H3CO+ + OH
    k(1692) = small + (6.60e-10)

    !H2O+ + NH3 -> NH3+ + H2O
    k(1693) = small + (2.20e-09)

    !H2O+ + NH3 -> NH4+ + OH
    k(1694) = small + (9.00e-10)

    !H2O+ + CH4 -> H3O+ + CH3
    k(1695) = small + (1.30e-09)

    !H2S+ + C -> HCS+ + H
    k(1696) = small + (1.00e-09)

    !H2S+ + FE -> FE+ + H2S
    k(1697) = small + (1.80e-09)

    !H2S+ + H -> HS+ + H2
    k(1698) = small + (2.00e-10)

    !H2S+ + MG -> MG+ + H2S
    k(1699) = small + (2.80e-09)

    !H2S+ + N -> NS+ + H2
    k(1700) = small + (7.90e-10)

    !H2S+ + NA -> NA+ + H2S
    k(1701) = small + (2.50e-09)

    !H2S+ + O -> HS+ + OH
    k(1702) = small + (3.10e-10)

    !H2S+ + O -> SO+ + H2
    k(1703) = small + (3.10e-10)

    !H2S+ + S -> S+ + H2S
    k(1704) = small + (1.10e-09)

    !H2S+ + SI -> SI+ + H2S
    k(1705) = small + (1.60e-09)

    !H2S+ + NO -> NO+ + H2S
    k(1706) = small + (3.70e-10)

    !H2S+ + H2O -> H3O+ + HS
    k(1707) = small + (7.00e-10)

    !H2S+ + H2S -> H3S+ + HS
    k(1708) = small + (5.80e-10)

    !H2S+ + HCO -> HCO+ + H2S
    k(1709) = small + (7.00e-10)

    !H2S+ + NH3 -> NH3+ + H2S
    k(1710) = small + (5.60e-10)

    !H2S+ + NH3 -> NH4+ + HS
    k(1711) = small + (1.30e-09)

    !H3+ + C -> CH+ + H2
    k(1712) = small + (2.00e-09)

    !H3+ + CL -> HCL+ + H2
    k(1713) = small + (1.00e-09)

    !H3+ + FE -> FE+ + H + H2
    k(1714) = small + (4.90e-09)

    !H3+ + MG -> MG+ + H + H2
    k(1715) = small + (1.00e-09)

    !H3+ + N -> NH2+ + H
    k(1716) = small + (1.00e-17)

    !H3+ + F -> H2F+ + H
    k(1717) = small + (4.80e-10)

    !H3+ + NA -> NA+ + H + H2
    k(1718) = small + (1.10e-09)

    !H3+ + O -> OH+ + H2
    k(1719) = small + (8.00e-10)

    !H3+ + P -> PH+ + H2
    k(1720) = small + (1.00e-09)

    !H3+ + S -> HS+ + H2
    k(1721) = small + (2.60e-09)

    !H3+ + SI -> SIH+ + H2
    k(1722) = small + (3.70e-09)

    !H3+ + C2 -> C2H+ + H2
    k(1723) = small + (1.80e-09)

    !H3+ + CH -> CH2+ + H2
    k(1724) = small + (8.50e-09&
        *invsqrT32)

    !H3+ + CN -> HCN+ + H2
    k(1725) = small + (8.10e-09&
        *invsqrT32)

    !H3+ + CO -> HCO+ + H2
    k(1726) = small + (1.61e-09)

    !H3+ + CO -> HOC+ + H2
    k(1727) = small + (9.44e-11)

    !H3+ + CP -> HCP+ + H2
    k(1728) = small + (4.70e-09&
        *invsqrT32)

    !H3+ + CS -> HCS+ + H2
    k(1729) = small + (1.10e-08&
        *invsqrT32)

    !H3+ + HCL -> H2CL+ + H2
    k(1730) = small + (5.93e-09&
        *invsqrT32)

    !H3+ + HF -> H2F+ + H2
    k(1731) = small + (1.20e-08&
        *T32**(-1.50e-01))

    !H3+ + HS -> H2S+ + H2
    k(1732) = small + (4.20e-09&
        *invsqrT32)

    !H3+ + MGH -> MG+ + H2 + H2
    k(1733) = small + (7.20e-09&
        *invsqrT32)

    !H3+ + N2 -> N2H+ + H2
    k(1734) = small + (1.70e-09)

    !H3+ + NAH -> NA+ + H2 + H2
    k(1735) = small + (3.80e-08&
        *invsqrT32)

    !H3+ + NH -> NH2+ + H2
    k(1736) = small + (7.50e-09&
        *invsqrT32)

    !H3+ + NO -> HNO+ + H2
    k(1737) = small + (8.50e-10&
        *invsqrT32)

    !H3+ + NS -> HNS+ + H2
    k(1738) = small + (9.90e-09&
        *invsqrT32)

    !H3+ + O2 -> O2H+ + H2
    k(1739) = small + (6.40e-10)

    !H3+ + OH -> H2O+ + H2
    k(1740) = small + (9.50e-09&
        *invsqrT32)

    !H3+ + PH -> PH2+ + H2
    k(1741) = small + (3.54e-09&
        *invsqrT32)

    !H3+ + PN -> HPN+ + H2
    k(1742) = small + (1.50e-08&
        *invsqrT32)

    !H3+ + PO -> HPO+ + H2
    k(1743) = small + (1.02e-08&
        *invsqrT32)

    !H3+ + S2 -> S2H+ + H2
    k(1744) = small + (2.00e-09)

    !H3+ + SIC -> CHSI+ + H2
    k(1745) = small + (9.31e-09&
        *invsqrT32)

    !H3+ + SIH -> SIH2+ + H2
    k(1746) = small + (6.66e-10&
        *invsqrT32)

    !H3+ + SIN -> HNSI+ + H2
    k(1747) = small + (1.26e-08&
        *invsqrT32)

    !H3+ + SIO -> HSIO+ + H2
    k(1748) = small + (1.70e-08&
        *invsqrT32)

    !H3+ + SIS -> HSIS+ + H2
    k(1749) = small + (9.40e-09&
        *invsqrT32)

    !H3+ + SO -> HSO+ + H2
    k(1750) = small + (8.40e-09&
        *invsqrT32)

    !H3+ + C2H -> C2H2+ + H2
    k(1751) = small + (4.50e-09&
        *invsqrT32)

    !H3+ + C2N -> C2NH+ + H2
    k(1752) = small + (3.29e-09&
        *invsqrT32)

    !H3+ + C2S -> HC2S+ + H2
    k(1753) = small + (6.41e-09&
        *invsqrT32)

    !H3+ + C3 -> C3H+ + H2
    k(1754) = small + (2.00e-09)

    !H3+ + CCO -> C2HO+ + H2
    k(1755) = small + (7.12e-09&
        *invsqrT32)

    !H3+ + CCP -> PC2H+ + H2
    k(1756) = small + (5.42e-09&
        *invsqrT32)

    !H3+ + CH2 -> CH3+ + H2
    k(1757) = small + (1.40e-09&
        *invsqrT32)

    !H3+ + CO2 -> HCO2+ + H2
    k(1758) = small + (1.90e-09)

    !H3+ + H2O -> H3O+ + H2
    k(1759) = small + (4.50e-09&
        *invsqrT32)

    !H3+ + H2S -> H3S+ + H2
    k(1760) = small + (2.30e-09&
        *invsqrT32)

    !H3+ + HCN -> HCNH+ + H2
    k(1761) = small + (1.70e-08&
        *invsqrT32)

    !H3+ + HCO -> H2CO+ + H2
    k(1762) = small + (2.30e-09&
        *invsqrT32)

    !H3+ + HCP -> PCH2+ + H2
    k(1763) = small + (2.13e-09&
        *invsqrT32)

    !H3+ + HCS -> H2CS+ + H2
    k(1764) = small + (1.09e-08&
        *invsqrT32)

    !H3+ + HCSI -> CH2SI+ + H2
    k(1765) = small + (5.47e-09&
        *invsqrT32)

    !H3+ + HNC -> HCNH+ + H2
    k(1766) = small + (1.50e-08&
        *invsqrT32)

    !H3+ + HNO -> H2NO+ + H2
    k(1767) = small + (4.00e-09&
        *invsqrT32)

    !H3+ + HNSI -> SINH2+ + H2
    k(1768) = small + (8.74e-10&
        *invsqrT32)

    !H3+ + HPO -> H2PO+ + H2
    k(1769) = small + (1.27e-08&
        *invsqrT32)

    !H3+ + HS2 -> H2S2+ + H2
    k(1770) = small + (4.56e-09&
        *invsqrT32)

    !H3+ + NAOH -> NAH2O+ + H2
    k(1771) = small + (1.20e-08&
        *invsqrT32)

    !H3+ + NH2 -> NH3+ + H2
    k(1772) = small + (4.50e-09&
        *invsqrT32)

    !H3+ + NO2 -> NO+ + H2 + OH
    k(1773) = small + (7.28e-10&
        *invsqrT32)

    !H3+ + OCS -> HOCS+ + H2
    k(1774) = small + (3.80e-09&
        *invsqrT32)

    !H3+ + PH2 -> PH3+ + H2
    k(1775) = small + (1.17e-09&
        *invsqrT32)

    !H3+ + SIC2 -> SIC2H+ + H2
    k(1776) = small + (5.48e-09&
        *invsqrT32)

    !H3+ + SIH2 -> SIH3+ + H2
    k(1777) = small + (4.21e-10&
        *invsqrT32)

    !H3+ + SINC -> SINCH+ + H2
    k(1778) = small + (4.65e-09&
        *invsqrT32)

    !H3+ + SIO2 -> HSIO2+ + H2
    k(1779) = small + (1.14e-09&
        *invsqrT32)

    !H3+ + SO2 -> HSO2+ + H2
    k(1780) = small + (3.72e-09&
        *invsqrT32)

    !H3+ + C2H2 -> C2H3+ + H2
    k(1781) = small + (3.50e-09)

    !H3+ + C3H -> C3H2+ + H2
    k(1782) = small + (1.48e-08&
        *invsqrT32)

    !H3+ + HC3 -> H2C3+ + H2
    k(1783) = small + (1.92e-08&
        *invsqrT32)

    !H3+ + C3N -> C3HN+ + H2
    k(1784) = small + (1.20e-08&
        *invsqrT32)

    !H3+ + C3O -> HC3O+ + H2
    k(1785) = small + (1.30e-08&
        *invsqrT32)

    !H3+ + C3P -> PC3H+ + H2
    k(1786) = small + (2.28e-09&
        *invsqrT32)

    !H3+ + C3S -> HC3S+ + H2
    k(1787) = small + (8.89e-09&
        *invsqrT32)

    !H3+ + C4 -> C4H+ + H2
    k(1788) = small + (2.00e-09)

    !H3+ + CH3 -> CH4+ + H2
    k(1789) = small + (2.10e-09)

    !H3+ + H2CO -> H3CO+ + H2
    k(1790) = small + (5.50e-09&
        *invsqrT32)

    !H3+ + H2CS -> H3CS+ + H2
    k(1791) = small + (3.80e-09&
        *invsqrT32)

    !H3+ + H2S2 -> H3S2+ + H2
    k(1792) = small + (2.74e-09&
        *invsqrT32)

    !H3+ + H2SIO -> H3SIO+ + H2
    k(1793) = small + (4.61e-09&
        *invsqrT32)

    !H3+ + HCCP -> PC2H2+ + H2
    k(1794) = small + (1.00e-09)

    !H3+ + NH3 -> NH4+ + H2
    k(1795) = small + (3.60e-09&
        *invsqrT32)

    !H3+ + SIC2H -> SIC2H2+ + H2
    k(1796) = small + (3.21e-09&
        *invsqrT32)

    !H3+ + SIC3 -> SIC3H+ + H2
    k(1797) = small + (4.57e-09&
        *invsqrT32)

    !H3+ + SICH2 -> SICH3+ + H2
    k(1798) = small + (3.46e-09&
        *invsqrT32)

    !H3+ + SIH3 -> SIH4+ + H2
    k(1799) = small + (2.00e-09)

    !H3+ + C2H2N -> C2H3N+ + H2
    k(1800) = small + (3.70e-09&
        *invsqrT32)

    !H3+ + C2H2O -> C2H3O+ + H2
    k(1801) = small + (3.30e-09&
        *invsqrT32)

    !H3+ + C2H3 -> C2H4+ + H2
    k(1802) = small + (3.50e-09&
        *invsqrT32)

    !H3+ + C3H2 -> C3H3+ + H2
    k(1803) = small + (6.98e-09&
        *invsqrT32)

    !H3+ + H2C3 -> H3C3+ + H2
    k(1804) = small + (8.42e-09&
        *invsqrT32)

    !H3+ + C4H -> C4H2+ + H2
    k(1805) = small + (4.90e-09&
        *invsqrT32)

    !H3+ + C4P -> PC4H+ + H2
    k(1806) = small + (1.14e-09&
        *invsqrT32)

    !H3+ + C4S -> HC4S+ + H2
    k(1807) = small + (6.82e-09&
        *invsqrT32)

    !H3+ + C5 -> C5H+ + H2
    k(1808) = small + (2.00e-09)

    !H3+ + CH2O2 -> HCO+ + H2O + H2
    k(1809) = small + (2.30e-09&
        *invsqrT32)

    !H3+ + CH2O2 -> H3O+ + CO + H2
    k(1810) = small + (9.70e-10&
        *invsqrT32)

    !H3+ + CH2PH -> PCH4+ + H2
    k(1811) = small + (1.15e-09&
        *invsqrT32)

    !H3+ + CH3N -> CH4N+ + H2
    k(1812) = small + (4.70e-09&
        *invsqrT32)

    !H3+ + CH4 -> CH5+ + H2
    k(1813) = small + (2.40e-09)

    !H3+ + HCNC2 -> HC2NCH+ + H2
    k(1814) = small + (4.40e-08&
        *invsqrT32)

    !H3+ + HC2NC -> HC2NCH+ + H2
    k(1815) = small + (1.28e-08&
        *invsqrT32)

    !H3+ + HC3N -> C3H2N+ + H2
    k(1816) = small + (2.00e-08&
        *invsqrT32)

    !H3+ + HNC3 -> C3H2N+ + H2
    k(1817) = small + (1.14e-08&
        *invsqrT32)

    !H3+ + NH2CN -> NH2CNH+ + H2
    k(1818) = small + (9.86e-09&
        *invsqrT32)

    !H3+ + SIC2H2 -> SIC2H3+ + H2
    k(1819) = small + (5.73e-09&
        *invsqrT32)

    !H3+ + SIC3H -> SIC3H2+ + H2
    k(1820) = small + (6.85e-09&
        *invsqrT32)

    !H3+ + SIC4 -> SIC4H+ + H2
    k(1821) = small + (1.43e-08&
        *invsqrT32)

    !H3+ + SICH3 -> SICH4+ + H2
    k(1822) = small + (3.46e-09&
        *invsqrT32)

    !H3+ + SIH4 -> SIH5+ + H2
    k(1823) = small + (2.00e-09)

    !H3+ + C2H3N -> C2H4N+ + H2
    k(1824) = small + (9.10e-09&
        *invsqrT32)

    !H3+ + C2H4 -> C2H3+ + H2 + H2
    k(1825) = small + (1.20e-10)

    !H3+ + C2H4 -> C2H5+ + H2
    k(1826) = small + (1.90e-09)

    !H3+ + C3H3 -> C3H4+ + H2
    k(1827) = small + (9.30e-09&
        *invsqrT32)

    !H3+ + C4H2 -> C4H3+ + H2
    k(1828) = small + (2.00e-09)

    !H3+ + C5H -> C5H2+ + H2
    k(1829) = small + (2.33e-08&
        *invsqrT32)

    !H3+ + C5N -> C5HN+ + H2
    k(1830) = small + (1.45e-08&
        *invsqrT32)

    !H3+ + C6 -> C6H+ + H2
    k(1831) = small + (2.00e-09)

    !H3+ + CH4O -> CH3+ + H2O + H2
    k(1832) = small + (1.80e-09&
        *invsqrT32)

    !H3+ + CH4O -> H3CO+ + H2 + H2
    k(1833) = small + (1.12e-09&
        *invsqrT32)

    !H3+ + CH4O -> CH5O+ + H2
    k(1834) = small + (1.04e-09&
        *invsqrT32)

    !H3+ + NH2CHO -> NH2CH2O+ + H2
    k(1835) = small + (2.00e-08&
        *invsqrT32)

    !H3+ + C2H4O -> C2H5O+ + H2
    k(1836) = small + (6.20e-09&
        *invsqrT32)

    !H3+ + C2H5 -> C2H6+ + H2
    k(1837) = small + (2.34e-09&
        *invsqrT32)

    !H3+ + C3H3N -> C3H4N+ + H2
    k(1838) = small + (8.90e-09&
        *invsqrT32)

    !H3+ + C3H4 -> C3H3+ + H2 + H2
    k(1839) = small + (9.00e-11&
        *invsqrT32)

    !H3+ + C3H4 -> H3C3+ + H2 + H2
    k(1840) = small + (9.00e-11&
        *invsqrT32)

    !H3+ + C3H4 -> C3H5+ + H2
    k(1841) = small + (1.80e-09&
        *invsqrT32)

    !H3+ + C4H3 -> C4H4+ + H2
    k(1842) = small + (2.30e-09&
        *invsqrT32)

    !H3+ + C5H2 -> C5H3+ + H2
    k(1843) = small + (5.71e-09&
        *invsqrT32)

    !H3+ + C6H -> C6H2+ + H2
    k(1844) = small + (2.69e-08&
        *invsqrT32)

    !H3+ + C7 -> C7H+ + H2
    k(1845) = small + (2.00e-09)

    !H3+ + CH5N -> CH6N+ + H2
    k(1846) = small + (3.10e-09&
        *invsqrT32)

    !H3+ + HC5N -> C5H2N+ + H2
    k(1847) = small + (2.30e-08&
        *invsqrT32)

    !H3+ + C6H2 -> C6H3+ + H2
    k(1848) = small + (2.00e-09)

    !H3+ + C7H -> C7H2+ + H2
    k(1849) = small + (2.42e-08&
        *invsqrT32)

    !H3+ + C7N -> C7HN+ + H2
    k(1850) = small + (1.61e-08&
        *invsqrT32)

    !H3+ + C8 -> C8H+ + H2
    k(1851) = small + (2.00e-09)

    !H3+ + CH3C3N -> C4H4N+ + H2
    k(1852) = small + (1.08e-08&
        *invsqrT32)

    !H3+ + HCOOCH3 -> H5C2O2+ + H2
    k(1853) = small + (4.05e-09&
        *invsqrT32)

    !H3+ + C2H5OH -> H3O+ + C2H4 + H2
    k(1854) = small + (1.30e-09&
        *invsqrT32)

    !H3+ + C2H5OH -> C2H5+ + H2O + H2
    k(1855) = small + (1.30e-09&
        *invsqrT32)

    !H3+ + C2H5OH -> C2H5OH2+ + H2
    k(1856) = small + (1.30e-09&
        *invsqrT32)

    !H3+ + C7H2 -> C7H3+ + H2
    k(1857) = small + (5.68e-09&
        *invsqrT32)

    !H3+ + C8H -> C8H2+ + H2
    k(1858) = small + (2.68e-08&
        *invsqrT32)

    !H3+ + C9 -> C9H+ + H2
    k(1859) = small + (2.00e-09)

    !H3+ + CH3C4H -> C5H5+ + H2
    k(1860) = small + (2.76e-09&
        *invsqrT32)

    !H3+ + CH3OCH3 -> CH3OCH4+ + H2
    k(1861) = small + (3.00e-09&
        *invsqrT32)

    !H3+ + HC7N -> C7H2N+ + H2
    k(1862) = small + (2.48e-08&
        *invsqrT32)

    !H3+ + C2H6CO -> C3H6OH+ + H2
    k(1863) = small + (6.41e-09&
        *invsqrT32)

    !H3+ + C8H2 -> C8H3+ + H2
    k(1864) = small + (2.00e-09)

    !H3+ + C9H -> C9H2+ + H2
    k(1865) = small + (2.52e-08&
        *invsqrT32)

    !H3+ + C9N -> C9HN+ + H2
    k(1866) = small + (1.76e-08&
        *invsqrT32)

    !H3+ + CH3C5N -> C6H4N+ + H2
    k(1867) = small + (1.19e-08&
        *invsqrT32)

    !H3+ + C9H2 -> C9H3+ + H2
    k(1868) = small + (5.65e-09&
        *invsqrT32)

    !H3+ + CH3C6H -> C7H5+ + H2
    k(1869) = small + (3.40e-09&
        *invsqrT32)

    !H3+ + CH3C7N -> C8H4N+ + H2
    k(1870) = small + (1.24e-08&
        *invsqrT32)

    !H3+ + HC9N -> C9H2N+ + H2
    k(1871) = small + (2.59e-08&
        *invsqrT32)

    !H3+ + C6H6 -> C6H7+ + H2
    k(1872) = small + (3.90e-09)

    !HCN+ + C -> CH+ + CN
    k(1873) = small + (1.10e-09)

    !HCN+ + H -> H+ + HCN
    k(1874) = small + (3.70e-11)

    !HCN+ + O -> O+ + HCN
    k(1875) = small + (6.50e-11)

    !HCN+ + S -> S+ + HCN
    k(1876) = small + (5.70e-10)

    !HCN+ + S -> HS+ + CN
    k(1877) = small + (5.70e-10)

    !HCN+ + C2 -> C2H+ + CN
    k(1878) = small + (8.40e-10)

    !HCN+ + CH -> CH2+ + CN
    k(1879) = small + (6.30e-10)

    !HCN+ + CO -> HCO+ + CN
    k(1880) = small + (1.40e-10)

    !HCN+ + H2 -> HCNH+ + H
    k(1881) = small + (9.00e-10)

    !HCN+ + NH -> NH2+ + CN
    k(1882) = small + (6.50e-10)

    !HCN+ + NO -> NO+ + HCN
    k(1883) = small + (8.10e-10)

    !HCN+ + O2 -> O2+ + HCN
    k(1884) = small + (3.20e-10)

    !HCN+ + OH -> H2O+ + CN
    k(1885) = small + (6.30e-10)

    !HCN+ + C2H -> C2H2+ + CN
    k(1886) = small + (7.90e-10)

    !HCN+ + CH2 -> CH3+ + CN
    k(1887) = small + (8.70e-10)

    !HCN+ + CO2 -> HCO2+ + CN
    k(1888) = small + (2.10e-10)

    !HCN+ + H2O -> H2O+ + HCN
    k(1889) = small + (1.80e-09)

    !HCN+ + H2O -> H3O+ + CN
    k(1890) = small + (8.50e-10)

    !HCN+ + HCN -> HCNH+ + CN
    k(1891) = small + (1.60e-09)

    !HCN+ + HCO -> HCNH+ + CO
    k(1892) = small + (3.70e-10)

    !HCN+ + HCO -> H2CO+ + CN
    k(1893) = small + (3.70e-10)

    !HCN+ + HNC -> HCNH+ + CN
    k(1894) = small + (1.00e-09)

    !HCN+ + NH2 -> NH3+ + CN
    k(1895) = small + (9.00e-10)

    !HCN+ + H2CO -> H3CO+ + CN
    k(1896) = small + (1.00e-09)

    !HCN+ + NH3 -> HCNH+ + NH2
    k(1897) = small + (8.40e-10)

    !HCN+ + NH3 -> NH3+ + HCN
    k(1898) = small + (1.70e-09)

    !HCN+ + CH4 -> HCNH+ + CH3
    k(1899) = small + (1.04e-09)

    !HCN+ + CH4 -> C2H3+ + NH2
    k(1900) = small + (2.60e-10)

    !HCO+ + C -> CH+ + CO
    k(1901) = small + (1.10e-09)

    !HCO+ + FE -> FE+ + HCO
    k(1902) = small + (1.90e-09)

    !HCO+ + MG -> MG+ + HCO
    k(1903) = small + (2.90e-09)

    !HCO+ + NA -> NA+ + HCO
    k(1904) = small + (2.60e-09)

    !HCO+ + P -> PH+ + CO
    k(1905) = small + (1.00e-09)

    !HCO+ + S -> HS+ + CO
    k(1906) = small + (3.30e-10)

    !HCO+ + SI -> SIH+ + CO
    k(1907) = small + (1.60e-09)

    !HCO+ + C2 -> C2H+ + CO
    k(1908) = small + (8.30e-10)

    !HCO+ + CH -> CH2+ + CO
    k(1909) = small + (4.50e-09&
        *invsqrT32)

    !HCO+ + CP -> HCP+ + CO
    k(1910) = small + (1.90e-09&
        *invsqrT32)

    !HCO+ + CS -> HCS+ + CO
    k(1911) = small + (4.30e-09&
        *invsqrT32)

    !HCO+ + HS -> H2S+ + CO
    k(1912) = small + (1.80e-09&
        *invsqrT32)

    !HCO+ + MGH -> MG+ + CO + H2
    k(1913) = small + (3.20e-09&
        *invsqrT32)

    !HCO+ + NAH -> NA+ + CO + H2
    k(1914) = small + (1.70e-08&
        *invsqrT32)

    !HCO+ + NH -> NH2+ + CO
    k(1915) = small + (3.80e-09&
        *invsqrT32)

    !HCO+ + NS -> HNS+ + CO
    k(1916) = small + (3.90e-09&
        *invsqrT32)

    !HCO+ + OH -> H2O+ + CO
    k(1917) = small + (2.33e-09&
        *invsqrT32)

    !HCO+ + OH -> HCO2+ + H
    k(1918) = small + (2.33e-09&
        *invsqrT32)

    !HCO+ + PH -> PH2+ + CO
    k(1919) = small + (1.51e-09&
        *invsqrT32)

    !HCO+ + PN -> HPN+ + CO
    k(1920) = small + (6.01e-09&
        *invsqrT32)

    !HCO+ + PO -> HPO+ + CO
    k(1921) = small + (4.08e-09&
        *invsqrT32)

    !HCO+ + S2 -> S2H+ + CO
    k(1922) = small + (2.00e-09)

    !HCO+ + SIC -> CHSI+ + CO
    k(1923) = small + (3.80e-09&
        *invsqrT32)

    !HCO+ + SIH -> SIH2+ + CO
    k(1924) = small + (2.89e-10&
        *invsqrT32)

    !HCO+ + SIO -> HSIO+ + CO
    k(1925) = small + (6.80e-09&
        *invsqrT32)

    !HCO+ + SIS -> HSIS+ + CO
    k(1926) = small + (3.60e-09&
        *invsqrT32)

    !HCO+ + SO -> HSO+ + CO
    k(1927) = small + (3.30e-09&
        *invsqrT32)

    !HCO+ + C2H -> C2H2+ + CO
    k(1928) = small + (2.00e-09&
        *invsqrT32)

    !HCO+ + C2S -> HC2S+ + CO
    k(1929) = small + (2.48e-09&
        *invsqrT32)

    !HCO+ + C3 -> C3H+ + CO
    k(1930) = small + (1.40e-09)

    !HCO+ + CCO -> C2HO+ + CO
    k(1931) = small + (2.91e-09&
        *invsqrT32)

    !HCO+ + CCP -> PC2H+ + CO
    k(1932) = small + (2.11e-09&
        *invsqrT32)

    !HCO+ + CH2 -> CH3+ + CO
    k(1933) = small + (7.19e-10&
        *invsqrT32)

    !HCO+ + H2O -> H3O+ + CO
    k(1934) = small + (2.10e-09&
        *invsqrT32)

    !HCO+ + H2S -> H3S+ + CO
    k(1935) = small + (9.50e-10&
        *invsqrT32)

    !HCO+ + HCN -> HCNH+ + CO
    k(1936) = small + (7.30e-09&
        *invsqrT32)

    !HCO+ + HCO -> H2CO+ + CO
    k(1937) = small + (1.00e-09&
        *invsqrT32)

    !HCO+ + HCP -> PCH2+ + CO
    k(1938) = small + (8.56e-10&
        *invsqrT32)

    !HCO+ + HCSI -> CH2SI+ + CO
    k(1939) = small + (2.23e-09&
        *invsqrT32)

    !HCO+ + HNC -> HCNH+ + CO
    k(1940) = small + (6.63e-09&
        *invsqrT32)

    !HCO+ + HNO -> H2NO+ + CO
    k(1941) = small + (1.70e-09&
        *invsqrT32)

    !HCO+ + HNSI -> SINH2+ + CO
    k(1942) = small + (3.53e-10&
        *invsqrT32)

    !HCO+ + HPO -> H2PO+ + CO
    k(1943) = small + (5.03e-09&
        *invsqrT32)

    !HCO+ + HS2 -> H2S2+ + CO
    k(1944) = small + (1.73e-09&
        *invsqrT32)

    !HCO+ + NAOH -> NAH2O+ + CO
    k(1945) = small + (4.70e-09&
        *invsqrT32)

    !HCO+ + NH2 -> NH3+ + CO
    k(1946) = small + (2.20e-09&
        *invsqrT32)

    !HCO+ + OCS -> HOCS+ + CO
    k(1947) = small + (1.50e-09&
        *invsqrT32)

    !HCO+ + PH2 -> PH3+ + CO
    k(1948) = small + (4.94e-10&
        *invsqrT32)

    !HCO+ + SIC2 -> SIC2H+ + CO
    k(1949) = small + (2.15e-09&
        *invsqrT32)

    !HCO+ + SIH2 -> SIH3+ + CO
    k(1950) = small + (1.82e-10&
        *invsqrT32)

    !HCO+ + SINC -> SINCH+ + CO
    k(1951) = small + (1.81e-09&
        *invsqrT32)

    !HCO+ + SIO2 -> HSIO2+ + CO
    k(1952) = small + (4.38e-10&
        *invsqrT32)

    !HCO+ + C2H2 -> C2H3+ + CO
    k(1953) = small + (1.40e-09)

    !HCO+ + C3H -> C3H2+ + CO
    k(1954) = small + (6.20e-09&
        *invsqrT32)

    !HCO+ + HC3 -> H2C3+ + CO
    k(1955) = small + (8.00e-09&
        *invsqrT32)

    !HCO+ + C3N -> C3HN+ + CO
    k(1956) = small + (7.06e-09&
        *invsqrT32)

    !HCO+ + C3O -> HC3O+ + CO
    k(1957) = small + (5.08e-09&
        *invsqrT32)

    !HCO+ + C3P -> PC3H+ + CO
    k(1958) = small + (8.62e-10&
        *invsqrT32)

    !HCO+ + C3S -> HC3S+ + CO
    k(1959) = small + (3.35e-09&
        *invsqrT32)

    !HCO+ + C4 -> C4H+ + CO
    k(1960) = small + (1.40e-09)

    !HCO+ + H2CO -> H3CO+ + CO
    k(1961) = small + (2.40e-09&
        *invsqrT32)

    !HCO+ + H2CS -> H3CS+ + CO
    k(1962) = small + (1.50e-09&
        *invsqrT32)

    !HCO+ + H2S2 -> H3S2+ + CO
    k(1963) = small + (1.04e-09&
        *invsqrT32)

    !HCO+ + H2SIO -> H3SIO+ + CO
    k(1964) = small + (1.84e-09&
        *invsqrT32)

    !HCO+ + HCCP -> PC2H2+ + CO
    k(1965) = small + (1.00e-09)

    !HCO+ + NH3 -> NH4+ + CO
    k(1966) = small + (1.70e-09&
        *invsqrT32)

    !HCO+ + SIC2H -> SIC2H2+ + CO
    k(1967) = small + (1.25e-09&
        *invsqrT32)

    !HCO+ + SIC3 -> SIC3H+ + CO
    k(1968) = small + (1.74e-09&
        *invsqrT32)

    !HCO+ + SICH2 -> SICH3+ + CO
    k(1969) = small + (1.40e-09&
        *invsqrT32)

    !HCO+ + C2H2O -> C2H3O+ + CO
    k(1970) = small + (1.30e-09&
        *invsqrT32)

    !HCO+ + C2H3 -> C2H4+ + CO
    k(1971) = small + (1.60e-09&
        *invsqrT32)

    !HCO+ + C3H2 -> C3H3+ + CO
    k(1972) = small + (2.90e-09&
        *invsqrT32)

    !HCO+ + H2C3 -> H3C3+ + CO
    k(1973) = small + (3.50e-09&
        *invsqrT32)

    !HCO+ + C4H -> C4H2+ + CO
    k(1974) = small + (1.90e-09&
        *invsqrT32)

    !HCO+ + C4P -> PC4H+ + CO
    k(1975) = small + (4.21e-10&
        *invsqrT32)

    !HCO+ + C4S -> HC4S+ + CO
    k(1976) = small + (2.52e-09&
        *invsqrT32)

    !HCO+ + C5 -> C5H+ + CO
    k(1977) = small + (1.40e-09)

    !HCO+ + CH2O2 -> CH3O2+ + CO
    k(1978) = small + (1.30e-09&
        *invsqrT32)

    !HCO+ + CH2PH -> PCH4+ + CO
    k(1979) = small + (4.60e-10&
        *invsqrT32)

    !HCO+ + CH3N -> CH4N+ + CO
    k(1980) = small + (2.00e-09&
        *invsqrT32)

    !HCO+ + HCNC2 -> HC2NCH+ + CO
    k(1981) = small + (1.75e-08&
        *invsqrT32)

    !HCO+ + HC2NC -> HC2NCH+ + CO
    k(1982) = small + (5.00e-09&
        *invsqrT32)

    !HCO+ + HC3N -> C3H2N+ + CO
    k(1983) = small + (7.90e-09&
        *invsqrT32)

    !HCO+ + HNC3 -> C3H2N+ + CO
    k(1984) = small + (4.50e-09&
        *invsqrT32)

    !HCO+ + NH2CN -> NH2CNH+ + CO
    k(1985) = small + (4.00e-09&
        *invsqrT32)

    !HCO+ + SIC2H2 -> SIC2H3+ + CO
    k(1986) = small + (2.23e-09&
        *invsqrT32)

    !HCO+ + SIC3H -> SIC3H2+ + CO
    k(1987) = small + (2.60e-09&
        *invsqrT32)

    !HCO+ + SIC4 -> SIC4H+ + CO
    k(1988) = small + (5.33e-09&
        *invsqrT32)

    !HCO+ + SICH3 -> SICH4+ + CO
    k(1989) = small + (1.40e-09&
        *invsqrT32)

    !HCO+ + SIH4 -> SIH5+ + CO
    k(1990) = small + (1.40e-09)

    !HCO+ + C2H3N -> C2H4N+ + CO
    k(1991) = small + (3.70e-09&
        *invsqrT32)

    !HCO+ + C2H4 -> C2H5+ + CO
    k(1992) = small + (1.40e-09)

    !HCO+ + C3H3 -> C3H4+ + CO
    k(1993) = small + (3.80e-09&
        *invsqrT32)

    !HCO+ + C4H2 -> C4H3+ + CO
    k(1994) = small + (1.40e-09)

    !HCO+ + C5H -> C5H2+ + CO
    k(1995) = small + (8.90e-09&
        *invsqrT32)

    !HCO+ + C5N -> C5HN+ + CO
    k(1996) = small + (6.50e-09&
        *invsqrT32)

    !HCO+ + C6 -> C6H+ + CO
    k(1997) = small + (1.40e-09)

    !HCO+ + CH4O -> CH5O+ + CO
    k(1998) = small + (1.70e-09&
        *invsqrT32)

    !HCO+ + NH2CHO -> NH2CH2O+ + CO
    k(1999) = small + (8.15e-09&
        *invsqrT32)

    !HCO+ + C2H4O -> C2H5O+ + CO
    k(2000) = small + (2.50e-09&
        *invsqrT32)

    !HCO+ + C2H5 -> C2H6+ + CO
    k(2001) = small + (1.02e-09&
        *invsqrT32)

    !HCO+ + C3H3N -> C3H4N+ + CO
    k(2002) = small + (3.50e-09&
        *invsqrT32)

    !HCO+ + C3H4 -> C3H5+ + CO
    k(2003) = small + (7.40e-10&
        *invsqrT32)

    !HCO+ + C4H3 -> C4H4+ + CO
    k(2004) = small + (9.00e-10&
        *invsqrT32)

    !HCO+ + C5H2 -> C5H3+ + CO
    k(2005) = small + (2.18e-09&
        *invsqrT32)

    !HCO+ + C6H -> C6H2+ + CO
    k(2006) = small + (1.01e-08&
        *invsqrT32)

    !HCO+ + C7 -> C7H+ + CO
    k(2007) = small + (1.40e-09)

    !HCO+ + CH5N -> CH6N+ + CO
    k(2008) = small + (1.30e-09&
        *invsqrT32)

    !HCO+ + HC5N -> C5H2N+ + CO
    k(2009) = small + (8.70e-09&
        *invsqrT32)

    !HCO+ + C6H2 -> C6H3+ + CO
    k(2010) = small + (1.40e-09)

    !HCO+ + C7H -> C7H2+ + CO
    k(2011) = small + (8.88e-09&
        *invsqrT32)

    !HCO+ + C7N -> C7HN+ + CO
    k(2012) = small + (5.82e-09&
        *invsqrT32)

    !HCO+ + C8 -> C8H+ + CO
    k(2013) = small + (1.40e-09)

    !HCO+ + CH3C3N -> C4H4N+ + CO
    k(2014) = small + (4.11e-09&
        *invsqrT32)

    !HCO+ + HCOOCH3 -> H5C2O2+ + CO
    k(2015) = small + (1.55e-09&
        *invsqrT32)

    !HCO+ + C2H5OH -> H3O+ + C2H4 + CO
    k(2016) = small + (7.00e-10&
        *invsqrT32)

    !HCO+ + C2H5OH -> C2H5OH2+ + CO
    k(2017) = small + (8.50e-10&
        *invsqrT32)

    !HCO+ + C7H2 -> C7H3+ + CO
    k(2018) = small + (2.08e-09&
        *invsqrT32)

    !HCO+ + C8H -> C8H2+ + CO
    k(2019) = small + (9.71e-09&
        *invsqrT32)

    !HCO+ + C9 -> C9H+ + CO
    k(2020) = small + (1.40e-09)

    !HCO+ + CH3C4H -> C5H5+ + CO
    k(2021) = small + (1.05e-09&
        *invsqrT32)

    !HCO+ + CH3OCH3 -> CH3OCH4+ + CO
    k(2022) = small + (1.20e-09&
        *invsqrT32)

    !HCO+ + HC7N -> C7H2N+ + CO
    k(2023) = small + (8.95e-09&
        *invsqrT32)

    !HCO+ + C2H6CO -> C3H6OH+ + CO
    k(2024) = small + (2.47e-09&
        *invsqrT32)

    !HCO+ + C8H2 -> C8H3+ + CO
    k(2025) = small + (1.40e-09)

    !HCO+ + C9H -> C9H2+ + CO
    k(2026) = small + (9.01e-09&
        *invsqrT32)

    !HCO+ + C9N -> C9HN+ + CO
    k(2027) = small + (6.26e-09&
        *invsqrT32)

    !HCO+ + CH3C5N -> C6H4N+ + CO
    k(2028) = small + (4.34e-09&
        *invsqrT32)

    !HCO+ + C9H2 -> C9H3+ + CO
    k(2029) = small + (2.02e-09&
        *invsqrT32)

    !HCO+ + CH3C6H -> C7H5+ + CO
    k(2030) = small + (1.25e-09&
        *invsqrT32)

    !HCO+ + CH3C7N -> C8H4N+ + CO
    k(2031) = small + (4.42e-09&
        *invsqrT32)

    !HCO+ + HC9N -> C9H2N+ + CO
    k(2032) = small + (9.17e-09&
        *invsqrT32)

    !HCO+ + C6H6 -> C6H7+ + CO
    k(2033) = small + (1.60e-09)

    !HCP+ + C -> CCP+ + H
    k(2034) = small + (2.00e-10)

    !HCP+ + O -> PH+ + CO
    k(2035) = small + (2.00e-10)

    !HCP+ + H2 -> PCH2+ + H
    k(2036) = small + (1.00e-09)

    !HCS+ + O -> HCO+ + S
    k(2037) = small + (5.00e-10)

    !HCS+ + O -> OCS+ + H
    k(2038) = small + (5.00e-10)

    !HCS+ + NH3 -> NH4+ + CS
    k(2039) = small + (1.62e-09&
        *invsqrT32)

    !HNC+ + C -> CH+ + CN
    k(2040) = small + (1.10e-09)

    !HNC+ + S -> S+ + HNC
    k(2041) = small + (5.70e-10)

    !HNC+ + S -> HS+ + CN
    k(2042) = small + (5.70e-10)

    !HNC+ + C2 -> C2H+ + CN
    k(2043) = small + (8.40e-10)

    !HNC+ + CH -> CH2+ + CN
    k(2044) = small + (6.30e-10)

    !HNC+ + H2 -> HCNH+ + H
    k(2045) = small + (7.00e-10)

    !HNC+ + NH -> NH2+ + CN
    k(2046) = small + (6.50e-10)

    !HNC+ + NO -> NO+ + HNC
    k(2047) = small + (8.10e-10)

    !HNC+ + O2 -> NO+ + HCO
    k(2048) = small + (9.00e-11)

    !HNC+ + OH -> H2O+ + CN
    k(2049) = small + (6.30e-10)

    !HNC+ + C2H -> C2H2+ + CN
    k(2050) = small + (7.90e-10)

    !HNC+ + CH2 -> CH3+ + CN
    k(2051) = small + (8.70e-10)

    !HNC+ + H2O -> H3O+ + CN
    k(2052) = small + (8.50e-10)

    !HNC+ + HCN -> HCNH+ + CN
    k(2053) = small + (1.60e-09)

    !HNC+ + HCO -> HCNH+ + CO
    k(2054) = small + (3.70e-10)

    !HNC+ + HCO -> H2CO+ + CN
    k(2055) = small + (3.70e-10)

    !HNC+ + NH2 -> NH3+ + CN
    k(2056) = small + (9.00e-10)

    !HNC+ + H2CO -> H3CO+ + CN
    k(2057) = small + (1.00e-09)

    !HNC+ + NH3 -> NH3+ + HNC
    k(2058) = small + (1.70e-09)

    !HNO+ + C -> CH+ + NO
    k(2059) = small + (1.00e-09)

    !HNO+ + O -> NO2+ + H
    k(2060) = small + (1.00e-12)

    !HNO+ + S -> HS+ + NO
    k(2061) = small + (1.10e-09)

    !HNO+ + C2 -> C2H+ + NO
    k(2062) = small + (8.20e-10)

    !HNO+ + CH -> CH2+ + NO
    k(2063) = small + (4.40e-09&
        *invsqrT32)

    !HNO+ + CO -> HCO+ + NO
    k(2064) = small + (2.70e-10&
        *invsqrT32)

    !HNO+ + NH -> NH2+ + NO
    k(2065) = small + (3.80e-09&
        *invsqrT32)

    !HNO+ + NO -> NO+ + HNO
    k(2066) = small + (3.60e-10&
        *invsqrT32)

    !HNO+ + OH -> H2O+ + NO
    k(2067) = small + (4.60e-09&
        *invsqrT32)

    !HNO+ + C2H -> C2H2+ + NO
    k(2068) = small + (2.00e-09&
        *invsqrT32)

    !HNO+ + CH2 -> CH3+ + NO
    k(2069) = small + (7.11e-10&
        *invsqrT32)

    !HNO+ + CO2 -> HCO2+ + NO
    k(2070) = small + (1.00e-10)

    !HNO+ + H2O -> H3O+ + NO
    k(2071) = small + (2.10e-09&
        *invsqrT32)

    !HNO+ + HCN -> HCNH+ + NO
    k(2072) = small + (7.20e-09&
        *invsqrT32)

    !HNO+ + HCO -> H2CO+ + NO
    k(2073) = small + (1.00e-09&
        *invsqrT32)

    !HNO+ + HNC -> HCNH+ + NO
    k(2074) = small + (6.52e-09&
        *invsqrT32)

    !HNO+ + NH2 -> NH3+ + NO
    k(2075) = small + (2.20e-09&
        *invsqrT32)

    !HNO+ + H2CO -> H3CO+ + NO
    k(2076) = small + (2.30e-09&
        *invsqrT32)

    !HNO+ + NH3 -> NH4+ + NO
    k(2077) = small + (1.70e-09&
        *invsqrT32)

    !HNO+ + CH4 -> CH5+ + NO
    k(2078) = small + (1.00e-10)

    !HNSI+ + CO -> HCO+ + SIN
    k(2079) = small + (2.00e-09)

    !HNSI+ + H2 -> SINH2+ + H
    k(2080) = small + (1.00e-09)

    !HNSI+ + H2O -> H3O+ + SIN
    k(2081) = small + (2.00e-09)

    !HOC+ + CO -> HCO+ + CO
    k(2082) = small + (4.00e-10)

    !HOC+ + H2 -> HCO+ + H2
    k(2083) = small + (1.00e-11)

    !HOC+ + N2 -> N2H+ + CO
    k(2084) = small + (2.00e-09)

    !HPO+ + H2O -> H3O+ + PO
    k(2085) = small + (1.00e-09)

    !N2H+ + C -> CH+ + N2
    k(2086) = small + (1.10e-09)

    !N2H+ + S -> HS+ + N2
    k(2087) = small + (1.10e-09)

    !N2H+ + C2 -> C2H+ + N2
    k(2088) = small + (8.30e-10)

    !N2H+ + CH -> CH2+ + N2
    k(2089) = small + (4.50e-09&
        *invsqrT32)

    !N2H+ + CO -> HCO+ + N2
    k(2090) = small + (8.80e-10)

    !N2H+ + NH -> NH2+ + N2
    k(2091) = small + (3.80e-09&
        *invsqrT32)

    !N2H+ + OH -> H2O+ + N2
    k(2092) = small + (4.70e-09&
        *invsqrT32)

    !N2H+ + C2H -> C2H2+ + N2
    k(2093) = small + (2.00e-09&
        *invsqrT32)

    !N2H+ + CH2 -> CH3+ + N2
    k(2094) = small + (7.19e-10&
        *invsqrT32)

    !N2H+ + CO2 -> HCO2+ + N2
    k(2095) = small + (9.20e-10)

    !N2H+ + H2O -> H3O+ + N2
    k(2096) = small + (2.20e-09&
        *invsqrT32)

    !N2H+ + HCN -> HCNH+ + N2
    k(2097) = small + (7.30e-09&
        *invsqrT32)

    !N2H+ + HCO -> H2CO+ + N2
    k(2098) = small + (1.00e-09&
        *invsqrT32)

    !N2H+ + HNC -> HCNH+ + N2
    k(2099) = small + (6.63e-09&
        *invsqrT32)

    !N2H+ + NH2 -> NH3+ + N2
    k(2100) = small + (2.20e-09&
        *invsqrT32)

    !N2H+ + C2H2 -> C2H3+ + N2
    k(2101) = small + (1.40e-09)

    !N2H+ + H2CO -> H3CO+ + N2
    k(2102) = small + (2.40e-09&
        *invsqrT32)

    !N2H+ + NH3 -> NH4+ + N2
    k(2103) = small + (1.70e-09&
        *invsqrT32)

    !N2H+ + CH4 -> CH5+ + N2
    k(2104) = small + (9.00e-10)

    !N2H+ + HCNC2 -> HC2NCH+ + N2
    k(2105) = small + (1.75e-08&
        *invsqrT32)

    !N2H+ + HC2NC -> HC2NCH+ + N2
    k(2106) = small + (5.00e-09&
        *invsqrT32)

    !N2H+ + HC3N -> C3H2N+ + N2
    k(2107) = small + (7.94e-09&
        *invsqrT32)

    !N2H+ + HNC3 -> C3H2N+ + N2
    k(2108) = small + (4.50e-09&
        *invsqrT32)

    !N2H+ + NH2CHO -> NH2CH2O+ + N2
    k(2109) = small + (8.15e-09&
        *invsqrT32)

    !N2H+ + C6H6 -> C6H7+ + N2
    k(2110) = small + (1.60e-09)

    !NAH2+ + H2O -> NAH2O+ + H2
    k(2111) = small + (1.00e-09)

    !NH2+ + N -> N2H+ + H
    k(2112) = small + (9.10e-11)

    !NH2+ + O -> HNO+ + H
    k(2113) = small + (7.20e-11)

    !NH2+ + S -> S+ + NH2
    k(2114) = small + (4.40e-10)

    !NH2+ + S -> HS+ + NH
    k(2115) = small + (4.40e-10)

    !NH2+ + S -> HNS+ + H
    k(2116) = small + (4.40e-10)

    !NH2+ + C2 -> C2H+ + NH
    k(2117) = small + (9.70e-10)

    !NH2+ + CH -> CH+ + NH2
    k(2118) = small + (3.50e-10)

    !NH2+ + CH -> CH2+ + NH
    k(2119) = small + (3.50e-10)

    !NH2+ + CN -> HCNH+ + N
    k(2120) = small + (1.00e-10)

    !NH2+ + CN -> H2NC+ + N
    k(2121) = small + (1.00e-10)

    !NH2+ + H2 -> NH3+ + H
    k(2122) = small + (1.20e-10)

    !NH2+ + NH -> NH3+ + N
    k(2123) = small + (7.30e-10)

    !NH2+ + NO -> NO+ + NH2
    k(2124) = small + (9.40e-10)

    !NH2+ + O2 -> HNO+ + OH
    k(2125) = small + (2.10e-11)

    !NH2+ + O2 -> H2NO+ + O
    k(2126) = small + (1.20e-10)

    !NH2+ + C2H -> C2H2+ + NH
    k(2127) = small + (9.10e-10)

    !NH2+ + CH2 -> CH2+ + NH2
    k(2128) = small + (4.90e-10)

    !NH2+ + CH2 -> CH3+ + NH
    k(2129) = small + (4.90e-10)

    !NH2+ + H2O -> H3O+ + NH
    k(2130) = small + (1.60e-09)

    !NH2+ + H2O -> NH3+ + OH
    k(2131) = small + (1.00e-10)

    !NH2+ + H2O -> NH4+ + O
    k(2132) = small + (3.00e-11)

    !NH2+ + H2S -> HS+ + NH3
    k(2133) = small + (1.80e-10)

    !NH2+ + H2S -> H2S+ + NH2
    k(2134) = small + (3.40e-10)

    !NH2+ + H2S -> H3S+ + NH
    k(2135) = small + (2.40e-10)

    !NH2+ + H2S -> NH3+ + HS
    k(2136) = small + (4.50e-10)

    !NH2+ + H2S -> NH4+ + S
    k(2137) = small + (1.80e-10)

    !NH2+ + HCN -> HCNH+ + NH
    k(2138) = small + (1.20e-09)

    !NH2+ + HCO -> HCO+ + NH2
    k(2139) = small + (4.30e-10)

    !NH2+ + HNC -> HCNH+ + NH
    k(2140) = small + (1.20e-09)

    !NH2+ + NH2 -> NH3+ + NH
    k(2141) = small + (1.00e-09)

    !NH2+ + H2CO -> NH3+ + HCO
    k(2142) = small + (5.60e-10)

    !NH2+ + H2CO -> H3CO+ + NH
    k(2143) = small + (2.20e-09)

    !NH2+ + NH3 -> NH3+ + NH2
    k(2144) = small + (1.50e-09)

    !NH2+ + NH3 -> NH4+ + NH
    k(2145) = small + (1.00e-09)

    !NO2+ + H -> NO+ + OH
    k(2146) = small + (1.90e-10)

    !NO2+ + H2 -> NO+ + H2O
    k(2147) = small + (1.50e-10)

    !O2H+ + C -> CH+ + O2
    k(2148) = small + (1.00e-09)

    !O2H+ + N -> NO2+ + H
    k(2149) = small + (1.00e-12)

    !O2H+ + O -> OH+ + O2
    k(2150) = small + (6.20e-10)

    !O2H+ + S -> HS+ + O2
    k(2151) = small + (1.10e-09)

    !O2H+ + C2 -> C2H+ + O2
    k(2152) = small + (8.10e-10)

    !O2H+ + CH -> CH2+ + O2
    k(2153) = small + (6.20e-10)

    !O2H+ + CN -> HCN+ + O2
    k(2154) = small + (8.60e-10)

    !O2H+ + CO -> HCO+ + O2
    k(2155) = small + (8.40e-10)

    !O2H+ + H2 -> H3+ + O2
    k(2156) = small + (3.20e-10)

    !O2H+ + N2 -> N2H+ + O2
    k(2157) = small + (7.90e-10)

    !O2H+ + NH -> NH2+ + O2
    k(2158) = small + (6.30e-10)

    !O2H+ + NO -> HNO+ + O2
    k(2159) = small + (7.70e-10)

    !O2H+ + OH -> H2O+ + O2
    k(2160) = small + (6.10e-10)

    !O2H+ + C2H -> C2H2+ + O2
    k(2161) = small + (7.60e-10)

    !O2H+ + CH2 -> CH3+ + O2
    k(2162) = small + (8.50e-10)

    !O2H+ + CO2 -> HCO2+ + O2
    k(2163) = small + (1.10e-09)

    !O2H+ + H2O -> H3O+ + O2
    k(2164) = small + (8.20e-10)

    !O2H+ + HCN -> HCNH+ + O2
    k(2165) = small + (9.70e-10)

    !O2H+ + HCO -> H2CO+ + O2
    k(2166) = small + (7.10e-10)

    !O2H+ + HNC -> HCNH+ + O2
    k(2167) = small + (9.70e-10)

    !O2H+ + NH2 -> NH3+ + O2
    k(2168) = small + (8.70e-10)

    !O2H+ + H2CO -> H3CO+ + O2
    k(2169) = small + (9.80e-10)

    !O2H+ + NH3 -> NH4+ + O2
    k(2170) = small + (2.00e-09)

    !OCS+ + NH3 -> NH3+ + OCS
    k(2171) = small + (1.60e-09&
        *invsqrT32)

    !PH2+ + C2H2 -> PC2H2+ + H2
    k(2172) = small + (1.40e-09)

    !PH2+ + C2H4 -> PCH2+ + CH4
    k(2173) = small + (1.40e-10)

    !PH2+ + C2H4 -> PC2H4+ + H2
    k(2174) = small + (1.10e-09)

    !S2H+ + H2 -> H3S2+
    k(2175) = small + (1.00e-14&
        *T32**(-1.00e+00))

    !S2H+ + H2S -> H3S+ + S2
    k(2176) = small + (7.95e-10&
        *invsqrT32)

    !SIC2+ + H2 -> SIC2H+ + H
    k(2177) = small + (1.50e-09)

    !SIH2+ + C -> CHSI+ + H
    k(2178) = small + (1.10e-09)

    !SIH2+ + N -> HNSI+ + H
    k(2179) = small + (1.00e-10)

    !SIH2+ + O -> HSIO+ + H
    k(2180) = small + (6.30e-10)

    !SIH2+ + S -> HSIS+ + H
    k(2181) = small + (1.10e-09)

    !SIH2+ + O2 -> HSIO+ + OH
    k(2182) = small + (2.40e-11)

    !SINC+ + O -> SIN+ + CO
    k(2183) = small + (1.00e-10)

    !SO2+ + CO -> SO+ + CO2
    k(2184) = small + (3.00e-10)

    !SO2+ + H2 -> HSO2+ + H
    k(2185) = small + (5.00e-12)

    !SO2+ + O2 -> O2+ + SO2
    k(2186) = small + (2.50e-10)

    !C2H2+ + C -> C2H2 + C+
    k(2187) = small + (1.10e-09)

    !C2H2+ + C -> C3+ + H2
    k(2188) = small + (1.10e-09)

    !C2H2+ + C -> C3H+ + H
    k(2189) = small + (1.10e-09)

    !C2H2+ + FE -> FE+ + C2H2
    k(2190) = small + (2.00e-09)

    !C2H2+ + MG -> MG+ + C2H2
    k(2191) = small + (3.00e-09)

    !C2H2+ + N -> CH+ + HCN
    k(2192) = small + (2.50e-11)

    !C2H2+ + N -> C2N+ + H2
    k(2193) = small + (7.50e-11)

    !C2H2+ + N -> C2NH+ + H
    k(2194) = small + (1.50e-10)

    !C2H2+ + NA -> NA+ + C2H2
    k(2195) = small + (2.70e-09)

    !C2H2+ + O -> HCO+ + CH
    k(2196) = small + (5.00e-11)

    !C2H2+ + O -> HOC+ + CH
    k(2197) = small + (5.00e-11)

    !C2H2+ + O -> C2HO+ + H
    k(2198) = small + (1.00e-10)

    !C2H2+ + P -> PC2H+ + H
    k(2199) = small + (1.00e-09)

    !C2H2+ + SI -> SI+ + C2H2
    k(2200) = small + (1.70e-09)

    !C2H2+ + SI -> SIC2+ + H2
    k(2201) = small + (2.00e-10)

    !C2H2+ + SI -> SIC2H+ + H
    k(2202) = small + (2.00e-10)

    !C2H2+ + CH -> C3H2+ + H
    k(2203) = small + (2.30e-09&
        *invsqrT32)

    !C2H2+ + CH -> H2C3+ + H
    k(2204) = small + (2.30e-09&
        *invsqrT32)

    !C2H2+ + CN -> C3HN+ + H
    k(2205) = small + (3.70e-09&
        *invsqrT32)

    !C2H2+ + NH -> C2H2N+ + H
    k(2206) = small + (3.90e-09&
        *invsqrT32)

    !C2H2+ + NO -> NO+ + C2H2
    k(2207) = small + (3.80e-10&
        *invsqrT32)

    !C2H2+ + OH -> C2H2O+ + H
    k(2208) = small + (4.80e-09&
        *invsqrT32)

    !C2H2+ + O2 -> HCO+ + HCO
    k(2209) = small + (9.80e-13)

    !C2H2+ + C2H -> C4H2+ + H
    k(2210) = small + (2.10e-09&
        *invsqrT32)

    !C2H2+ + CH2 -> C3H3+ + H
    k(2211) = small + (3.66e-10&
        *invsqrT32)

    !C2H2+ + CH2 -> H3C3+ + H
    k(2212) = small + (3.66e-10&
        *invsqrT32)

    !C2H2+ + H2S -> H2S+ + C2H2
    k(2213) = small + (9.80e-10&
        *invsqrT32)

    !C2H2+ + H2S -> C2H3+ + HS
    k(2214) = small + (2.00e-11&
        *invsqrT32)

    !C2H2+ + HCN -> C3H2N+ + H
    k(2215) = small + (1.33e-10)

    !C2H2+ + HCO -> HCO+ + C2H2
    k(2216) = small + (5.70e-10&
        *invsqrT32)

    !C2H2+ + HCO -> C2H3+ + CO
    k(2217) = small + (4.30e-10&
        *invsqrT32)

    !C2H2+ + HNC -> HCNH+ + C2H
    k(2218) = small + (2.60e-10)

    !C2H2+ + HNC -> C3H2N+ + H
    k(2219) = small + (1.30e-10)

    !C2H2+ + NH2 -> NH3+ + C2H
    k(2220) = small + (1.10e-09&
        *invsqrT32)

    !C2H2+ + NH2 -> C2H3N+ + H
    k(2221) = small + (1.10e-09&
        *invsqrT32)

    !C2H2+ + C2H2 -> C4H2+ + H2
    k(2222) = small + (5.20e-10)

    !C2H2+ + C2H2 -> C4H3+ + H
    k(2223) = small + (8.80e-10)

    !C2H2+ + C3H -> C5H+ + H2
    k(2224) = small + (3.18e-09&
        *invsqrT32)

    !C2H2+ + HC3 -> C5H+ + H2
    k(2225) = small + (4.10e-09&
        *invsqrT32)

    !C2H2+ + C3H -> C5H2+ + H
    k(2226) = small + (3.18e-09&
        *invsqrT32)

    !C2H2+ + HC3 -> C5H2+ + H
    k(2227) = small + (4.10e-09&
        *invsqrT32)

    !C2H2+ + H2CO -> H2CO+ + C2H2
    k(2228) = small + (1.60e-09&
        *invsqrT32)

    !C2H2+ + NH3 -> NH3+ + C2H2
    k(2229) = small + (1.20e-09&
        *invsqrT32)

    !C2H2+ + NH3 -> NH4+ + C2H
    k(2230) = small + (5.50e-10&
        *invsqrT32)

    !C2H2+ + C2H3 -> C2H3+ + C2H2
    k(2231) = small + (5.30e-10&
        *invsqrT32)

    !C2H2+ + C2H3 -> C3H3+ + CH2
    k(2232) = small + (2.65e-10&
        *invsqrT32)

    !C2H2+ + C2H3 -> H3C3+ + CH2
    k(2233) = small + (2.65e-10&
        *invsqrT32)

    !C2H2+ + C2H3 -> C4H3+ + H2
    k(2234) = small + (5.30e-10&
        *invsqrT32)

    !C2H2+ + C3H2 -> C5H2+ + H2
    k(2235) = small + (1.02e-10&
        *invsqrT32)

    !C2H2+ + H2C3 -> C5H2+ + H2
    k(2236) = small + (1.22e-10&
        *invsqrT32)

    !C2H2+ + C3H2 -> C5H3+ + H
    k(2237) = small + (2.03e-09&
        *invsqrT32)

    !C2H2+ + H2C3 -> C5H3+ + H
    k(2238) = small + (2.45e-09&
        *invsqrT32)

    !C2H2+ + C4H -> C6H+ + H2
    k(2239) = small + (1.00e-09&
        *invsqrT32)

    !C2H2+ + C4H -> C6H2+ + H
    k(2240) = small + (1.00e-09&
        *invsqrT32)

    !C2H2+ + CH4 -> C3H4+ + H2
    k(2241) = small + (2.00e-10)

    !C2H2+ + CH4 -> C3H5+ + H
    k(2242) = small + (8.00e-10)

    !C2H2+ + C2H4 -> C2H4+ + C2H2
    k(2243) = small + (4.10e-10)

    !C2H2+ + C2H4 -> C3H3+ + CH3
    k(2244) = small + (2.60e-10)

    !C2H2+ + C2H4 -> H3C3+ + CH3
    k(2245) = small + (2.60e-10)

    !C2H2+ + C2H4 -> C4H5+ + H
    k(2246) = small + (2.80e-10)

    !C2H2+ + C3H3 -> C3H3+ + C2H2
    k(2247) = small + (6.55e-10&
        *invsqrT32)

    !C2H2+ + C3H3 -> H3C3+ + C2H2
    k(2248) = small + (6.55e-10&
        *invsqrT32)

    !C2H2+ + C3H3 -> C5H3+ + H2
    k(2249) = small + (1.31e-09&
        *invsqrT32)

    !C2H2+ + C3H3 -> C5H4+ + H
    k(2250) = small + (1.31e-09&
        *invsqrT32)

    !C2H2+ + C4H2 -> C4H2+ + C2H2
    k(2251) = small + (1.30e-09)

    !C2H2+ + C4H2 -> C6H2+ + H2
    k(2252) = small + (1.00e-17)

    !C2H2+ + C4H2 -> C6H3+ + H
    k(2253) = small + (1.40e-10)

    !C2H2+ + C5H -> C7H+ + H2
    k(2254) = small + (4.62e-09&
        *invsqrT32)

    !C2H2+ + C5H -> C7H2+ + H
    k(2255) = small + (4.62e-09&
        *invsqrT32)

    !C2H2+ + C3H4 -> C3H4+ + C2H2
    k(2256) = small + (2.54e-10&
        *invsqrT32)

    !C2H2+ + C3H4 -> C5H4+ + H2
    k(2257) = small + (2.54e-10&
        *invsqrT32)

    !C2H2+ + C3H4 -> C5H5+ + H
    k(2258) = small + (2.54e-10&
        *invsqrT32)

    !C2H2+ + C5H2 -> C5H2+ + C2H2
    k(2259) = small + (7.55e-10&
        *invsqrT32)

    !C2H2+ + C5H2 -> C7H2+ + H2
    k(2260) = small + (7.55e-10&
        *invsqrT32)

    !C2H2+ + C5H2 -> C7H3+ + H
    k(2261) = small + (7.55e-10&
        *invsqrT32)

    !C2H2+ + C6H -> C8H+ + H2
    k(2262) = small + (5.03e-09&
        *invsqrT32)

    !C2H2+ + C6H -> C8H2+ + H
    k(2263) = small + (5.03e-09&
        *invsqrT32)

    !C2H2+ + C6H2 -> C6H2+ + C2H2
    k(2264) = small + (5.00e-10)

    !C2H2+ + C6H2 -> C8H2+ + H2
    k(2265) = small + (5.00e-10)

    !C2H2+ + C6H2 -> C8H3+ + H
    k(2266) = small + (5.00e-10)

    !C2H2+ + C7H -> C9H+ + H2
    k(2267) = small + (4.63e-09&
        *invsqrT32)

    !C2H2+ + C7H -> C9H2+ + H
    k(2268) = small + (4.63e-09&
        *invsqrT32)

    !C2H2+ + C7H2 -> C7H2+ + C2H2
    k(2269) = small + (7.23e-10&
        *invsqrT32)

    !C2H2+ + C7H2 -> C9H2+ + H2
    k(2270) = small + (7.23e-10&
        *invsqrT32)

    !C2H2+ + C7H2 -> C9H3+ + H
    k(2271) = small + (7.23e-10&
        *invsqrT32)

    !C3H+ + SI -> SIC3+ + H
    k(2272) = small + (2.00e-10)

    !C3H+ + H2 -> C3H2+ + H
    k(2273) = small + (1.00e-12)

    !C3H+ + NO -> NO+ + C3H
    k(2274) = small + (8.65e-11&
        *invsqrT32)

    !C3H+ + NO -> NO+ + HC3
    k(2275) = small + (8.65e-11&
        *invsqrT32)

    !C3H+ + NO -> C2NH+ + CO
    k(2276) = small + (1.73e-10&
        *invsqrT32)

    !C3H+ + O2 -> HCO+ + CCO
    k(2277) = small + (1.50e-11)

    !C3H+ + O2 -> C2HO+ + CO
    k(2278) = small + (2.50e-12)

    !C3H+ + O2 -> HC3O+ + O
    k(2279) = small + (7.50e-12)

    !C3H+ + CO2 -> HC3O+ + CO
    k(2280) = small + (2.00e-12)

    !C3H+ + H2O -> HCO+ + C2H2
    k(2281) = small + (6.87e-10&
        *invsqrT32)

    !C3H+ + H2O -> C2H3+ + CO
    k(2282) = small + (6.87e-10&
        *invsqrT32)

    !C3H+ + H2O -> HC3O+ + H2
    k(2283) = small + (6.87e-10&
        *invsqrT32)

    !C3H+ + H2S -> HCS+ + C2H2
    k(2284) = small + (2.98e-10&
        *invsqrT32)

    !C3H+ + H2S -> C2H3+ + CS
    k(2285) = small + (2.98e-10&
        *invsqrT32)

    !C3H+ + H2S -> HC3S+ + H2
    k(2286) = small + (2.98e-10&
        *invsqrT32)

    !C3H+ + OCS -> CS+ + C3O + H
    k(2287) = small + (4.57e-10&
        *invsqrT32)

    !C3H+ + OCS -> HC3O+ + CS
    k(2288) = small + (4.57e-10&
        *invsqrT32)

    !C3H+ + OCS -> HC3S+ + CO
    k(2289) = small + (4.57e-10&
        *invsqrT32)

    !C3H+ + C2H2 -> C5H2+ + H
    k(2290) = small + (3.00e-10)

    !C3H+ + NH3 -> H2NC+ + C2H2
    k(2291) = small + (5.57e-10&
        *invsqrT32)

    !C3H+ + NH3 -> NH3+ + C3H
    k(2292) = small + (2.79e-10&
        *invsqrT32)

    !C3H+ + NH3 -> NH3+ + HC3
    k(2293) = small + (2.79e-10&
        *invsqrT32)

    !C3H+ + NH3 -> NH4+ + C3
    k(2294) = small + (5.57e-10&
        *invsqrT32)

    !C3H+ + CH4 -> C2H3+ + C2H2
    k(2295) = small + (6.12e-10)

    !C3H+ + CH4 -> C4H3+ + H2
    k(2296) = small + (5.50e-11)

    !C3H+ + C2H4 -> C3H3+ + C2H2
    k(2297) = small + (4.50e-10)

    !C3H+ + C2H4 -> H3C3+ + C2H2
    k(2298) = small + (4.50e-10)

    !C3H+ + C2H4 -> C5H3+ + H2
    k(2299) = small + (5.00e-11)

    !C3H+ + C4H2 -> C5H+ + C2H2
    k(2300) = small + (1.20e-10)

    !C3H+ + C4H2 -> C5H2+ + C2H
    k(2301) = small + (1.00e-09)

    !C3N+ + H2 -> C3HN+ + H
    k(2302) = small + (1.50e-09)

    !C4+ + H2 -> C4H+ + H
    k(2303) = small + (1.30e-10)

    !CH2SI+ + C -> SI+ + C2H2
    k(2304) = small + (1.00e-09)

    !CH2SI+ + C -> SIC2+ + H2
    k(2305) = small + (1.00e-10)

    !CH2SI+ + C -> SIC2H+ + H
    k(2306) = small + (1.00e-10)

    !CH2SI+ + N -> SI+ + HCN + H
    k(2307) = small + (7.60e-10)

    !CH2SI+ + O -> SI+ + H2CO
    k(2308) = small + (6.00e-10)

    !CH2SI+ + O -> HCO+ + SIH
    k(2309) = small + (3.00e-10)

    !CH2SI+ + S -> SI+ + H2CS
    k(2310) = small + (1.00e-09)

    !CH3+ + C -> C2H+ + H2
    k(2311) = small + (1.20e-09)

    !CH3+ + C -> C2H2+ + H
    k(2312) = small + (1.20e-09)

    !CH3+ + FE -> FE+ + CH3
    k(2313) = small + (2.40e-09)

    !CH3+ + MG -> MG+ + CH3
    k(2314) = small + (3.50e-09)

    !CH3+ + N -> HCN+ + H2
    k(2315) = small + (6.70e-11)

    !CH3+ + N -> H2NC+ + H
    k(2316) = small + (6.70e-11)

    !CH3+ + NA -> NA+ + CH3
    k(2317) = small + (3.40e-09)

    !CH3+ + O -> HOC+ + H2
    k(2318) = small + (2.05e-10)

    !CH3+ + O -> HCO+ + H2
    k(2319) = small + (2.05e-10)

    !CH3+ + O -> H2CO+ + H
    k(2320) = small + (1.00e-15)

    !CH3+ + P -> PCH2+ + H
    k(2321) = small + (1.00e-09)

    !CH3+ + S -> HCS+ + H2
    k(2322) = small + (1.40e-09)

    !CH3+ + SI -> SI+ + CH3
    k(2323) = small + (9.70e-10)

    !CH3+ + SI -> CHSI+ + H2
    k(2324) = small + (2.00e-10)

    !CH3+ + SI -> CH2SI+ + H
    k(2325) = small + (9.70e-10)

    !CH3+ + C2 -> C3H+ + H2
    k(2326) = small + (9.90e-10)

    !CH3+ + CH -> C2H2+ + H2
    k(2327) = small + (5.10e-09&
        *invsqrT32)

    !CH3+ + CN -> C2H2N+ + H
    k(2328) = small + (4.30e-09&
        *invsqrT32)

    !CH3+ + HCL -> H2CCL+ + H2
    k(2329) = small + (3.04e-09&
        *invsqrT32)

    !CH3+ + HS -> H2CS+ + H2
    k(2330) = small + (2.20e-09&
        *invsqrT32)

    !CH3+ + NH -> HCNH+ + H2
    k(2331) = small + (4.40e-09&
        *invsqrT32)

    !CH3+ + NO -> NO+ + CH3
    k(2332) = small + (4.44e-10&
        *invsqrT32)

    !CH3+ + O2 -> H3CO+ + O
    k(2333) = small + (5.00e-12)

    !CH3+ + OH -> H2CO+ + H2
    k(2334) = small + (5.40e-09&
        *invsqrT32)

    !CH3+ + SIH -> CH2SI+ + H2
    k(2335) = small + (3.50e-10&
        *invsqrT32)

    !CH3+ + SO -> HOCS+ + H2
    k(2336) = small + (4.20e-09&
        *invsqrT32)

    !CH3+ + C2H -> C3H2+ + H2
    k(2337) = small + (6.00e-10&
        *invsqrT32)

    !CH3+ + C2H -> H2C3+ + H2
    k(2338) = small + (6.00e-10&
        *invsqrT32)

    !CH3+ + C2H -> C3H3+ + H
    k(2339) = small + (6.00e-10&
        *invsqrT32)

    !CH3+ + C2H -> H3C3+ + H
    k(2340) = small + (6.00e-10&
        *invsqrT32)

    !CH3+ + CH2 -> C2H3+ + H2
    k(2341) = small + (8.21e-10&
        *invsqrT32)

    !CH3+ + H2S -> H3CS+ + H2
    k(2342) = small + (1.20e-09&
        *invsqrT32)

    !CH3+ + HCO -> HCO+ + CH3
    k(2343) = small + (6.10e-10&
        *invsqrT32)

    !CH3+ + HCO -> CH4+ + CO
    k(2344) = small + (6.10e-10&
        *invsqrT32)

    !CH3+ + NH2 -> CH4N+ + H
    k(2345) = small + (2.60e-09&
        *invsqrT32)

    !CH3+ + OCS -> H3CS+ + CO
    k(2346) = small + (1.90e-09&
        *invsqrT32)

    !CH3+ + C2H2 -> C3H3+ + H2
    k(2347) = small + (6.00e-10)

    !CH3+ + C3H -> C3H+ + CH3
    k(2348) = small + (3.80e-09&
        *invsqrT32)

    !CH3+ + HC3 -> C3H+ + CH3
    k(2349) = small + (4.90e-09&
        *invsqrT32)

    !CH3+ + C3H -> C4H2+ + H2
    k(2350) = small + (3.80e-09&
        *invsqrT32)

    !CH3+ + HC3 -> C4H2+ + H2
    k(2351) = small + (4.90e-09&
        *invsqrT32)

    !CH3+ + H2CO -> HCO+ + CH4
    k(2352) = small + (2.90e-09&
        *invsqrT32)

    !CH3+ + NH3 -> NH4+ + CH2
    k(2353) = small + (3.00e-10&
        *invsqrT32)

    !CH3+ + NH3 -> CH4N+ + H2
    k(2354) = small + (1.72e-09&
        *invsqrT32)

    !CH3+ + C2H3 -> C2H3+ + CH3
    k(2355) = small + (5.60e-10&
        *invsqrT32)

    !CH3+ + C2H3 -> C3H3+ + H + H2
    k(2356) = small + (9.50e-11&
        *invsqrT32)

    !CH3+ + C2H3 -> H3C3+ + H + H2
    k(2357) = small + (9.50e-11&
        *invsqrT32)

    !CH3+ + C2H3 -> C3H4+ + H2
    k(2358) = small + (1.10e-09&
        *invsqrT32)

    !CH3+ + C3H2 -> C4H3+ + H2
    k(2359) = small + (3.64e-09&
        *invsqrT32)

    !CH3+ + H2C3 -> C4H3+ + H2
    k(2360) = small + (4.40e-09&
        *invsqrT32)

    !CH3+ + C4H -> C5H2+ + H2
    k(2361) = small + (2.44e-09&
        *invsqrT32)

    !CH3+ + CH4 -> C2H5+ + H2
    k(2362) = small + (9.60e-10)

    !CH3+ + HCNC2 -> C3H3+ + HCN
    k(2363) = small + (1.10e-08&
        *invsqrT32)

    !CH3+ + HCNC2 -> H3C3+ + HCN
    k(2364) = small + (1.10e-08&
        *invsqrT32)

    !CH3+ + HC2NC -> C3H3+ + HCN
    k(2365) = small + (3.16e-09&
        *invsqrT32)

    !CH3+ + HC2NC -> H3C3+ + HCN
    k(2366) = small + (3.16e-09&
        *invsqrT32)

    !CH3+ + HC3N -> C3H3+ + HCN
    k(2367) = small + (5.00e-09&
        *invsqrT32)

    !CH3+ + HC3N -> H3C3+ + HCN
    k(2368) = small + (5.00e-09&
        *invsqrT32)

    !CH3+ + HNC3 -> C3H3+ + HNC
    k(2369) = small + (2.84e-09&
        *invsqrT32)

    !CH3+ + HNC3 -> H3C3+ + HNC
    k(2370) = small + (2.84e-09&
        *invsqrT32)

    !CH3+ + C2H4 -> C2H3+ + CH4
    k(2371) = small + (3.50e-10)

    !CH3+ + C2H4 -> C3H3+ + H2 + H2
    k(2372) = small + (2.30e-11)

    !CH3+ + C2H4 -> H3C3+ + H2 + H2
    k(2373) = small + (2.30e-11)

    !CH3+ + C2H4 -> C3H5+ + H2
    k(2374) = small + (5.20e-10)

    !CH3+ + C3H3 -> C4H5+ + H
    k(2375) = small + (4.71e-09&
        *invsqrT32)

    !CH3+ + C4H2 -> C3H3+ + C2H2
    k(2376) = small + (6.00e-10)

    !CH3+ + C4H2 -> H3C3+ + C2H2
    k(2377) = small + (6.00e-10)

    !CH3+ + C4H2 -> C5H3+ + H2
    k(2378) = small + (1.30e-10)

    !CH3+ + C5H -> C6H2+ + H2
    k(2379) = small + (1.14e-08&
        *invsqrT32)

    !CH3+ + CH4O -> H3CO+ + CH4
    k(2380) = small + (2.10e-09&
        *invsqrT32)

    !CH3+ + NH2CHO -> CH5N+ + HCO
    k(2381) = small + (1.00e-08&
        *invsqrT32)

    !CH3+ + C5H2 -> C6H3+ + H2
    k(2382) = small + (2.79e-09&
        *invsqrT32)

    !CH3+ + C6H -> C7H2+ + H2
    k(2383) = small + (1.30e-08&
        *invsqrT32)

    !CH3+ + C6H2 -> C7H3+ + H2
    k(2384) = small + (1.20e-09)

    !CH3+ + C7H -> C8H2+ + H2
    k(2385) = small + (1.16e-08&
        *invsqrT32)

    !CH3+ + C7H2 -> C8H3+ + H2
    k(2386) = small + (2.71e-09&
        *invsqrT32)

    !CH3+ + C8H -> C9H2+ + H2
    k(2387) = small + (1.27e-08&
        *invsqrT32)

    !CH3+ + C8H2 -> C9H3+ + H2
    k(2388) = small + (1.20e-09)

    !HCNH+ + NA -> NA+ + HCN + H
    k(2389) = small + (2.70e-09)

    !HCNH+ + NA -> NA+ + HNC + H
    k(2390) = small + (1.35e-09)

    !HCNH+ + SI -> SINC+ + H2
    k(2391) = small + (5.00e-10)

    !HCNH+ + CH -> CH2+ + HCN
    k(2392) = small + (4.50e-09&
        *invsqrT32)

    !HCNH+ + CH2 -> CH3+ + HCN
    k(2393) = small + (3.61e-10&
        *invsqrT32)

    !HCNH+ + CH2 -> CH3+ + HNC
    k(2394) = small + (3.61e-10&
        *invsqrT32)

    !HCNH+ + NH2 -> NH3+ + HCN
    k(2395) = small + (1.11e-09&
        *invsqrT32)

    !HCNH+ + NH2 -> NH3+ + HNC
    k(2396) = small + (1.11e-09&
        *invsqrT32)

    !HCNH+ + H2CO -> H3CO+ + HCN
    k(2397) = small + (2.37e-09&
        *invsqrT32)

    !HCNH+ + NH3 -> NH4+ + HCN
    k(2398) = small + (8.75e-10&
        *invsqrT32)

    !HCNH+ + NH3 -> NH4+ + HNC
    k(2399) = small + (8.75e-10&
        *invsqrT32)

    !H2CO+ + FE -> FE+ + H2CO
    k(2400) = small + (1.90e-09)

    !H2CO+ + MG -> MG+ + H2CO
    k(2401) = small + (2.90e-09)

    !H2CO+ + NA -> NA+ + H2CO
    k(2402) = small + (2.60e-09)

    !H2CO+ + S -> S+ + H2CO
    k(2403) = small + (5.50e-10)

    !H2CO+ + S -> HS+ + HCO
    k(2404) = small + (5.50e-10)

    !H2CO+ + SI -> SI+ + H2CO
    k(2405) = small + (1.60e-09)

    !H2CO+ + C2 -> C2H+ + HCO
    k(2406) = small + (8.20e-10)

    !H2CO+ + CH -> CH+ + H2CO
    k(2407) = small + (3.10e-10)

    !H2CO+ + CH -> CH2+ + HCO
    k(2408) = small + (3.10e-10)

    !H2CO+ + NH -> H3CO+ + N
    k(2409) = small + (6.40e-10)

    !H2CO+ + NO -> NO+ + H2CO
    k(2410) = small + (7.80e-10)

    !H2CO+ + O2 -> HCO+ + O2H
    k(2411) = small + (7.70e-11)

    !H2CO+ + C2H -> C2H2+ + HCO
    k(2412) = small + (7.70e-10)

    !H2CO+ + CH2 -> CH2+ + H2CO
    k(2413) = small + (4.30e-10)

    !H2CO+ + CH2 -> CH3+ + HCO
    k(2414) = small + (4.30e-10)

    !H2CO+ + H2O -> H3O+ + HCO
    k(2415) = small + (2.60e-09)

    !H2CO+ + HCN -> HCNH+ + HCO
    k(2416) = small + (1.40e-09)

    !H2CO+ + HCO -> HCO+ + H2CO
    k(2417) = small + (3.20e-09)

    !H2CO+ + HCO -> H3CO+ + CO
    k(2418) = small + (3.60e-10)

    !H2CO+ + HNC -> HCNH+ + HCO
    k(2419) = small + (1.40e-09)

    !H2CO+ + NH2 -> NH3+ + HCO
    k(2420) = small + (8.80e-10)

    !H2CO+ + H2CO -> H3CO+ + HCO
    k(2421) = small + (1.00e-09)

    !H2CO+ + NH3 -> NH3+ + H2CO
    k(2422) = small + (4.30e-10)

    !H2CO+ + NH3 -> NH4+ + HCO
    k(2423) = small + (1.30e-09)

    !H2CO+ + CH4 -> H3CO+ + CH3
    k(2424) = small + (9.35e-11)

    !H2CO+ + CH4 -> C2H5O+ + H
    k(2425) = small + (1.65e-11)

    !H2NC+ + SI -> SINC+ + H2
    k(2426) = small + (5.00e-10)

    !H3O+ + C -> HCO+ + H2
    k(2427) = small + (1.00e-11)

    !H3O+ + NA -> NA+ + H2O + H
    k(2428) = small + (3.10e-09)

    !H3O+ + P -> HPO+ + H2
    k(2429) = small + (1.00e-09)

    !H3O+ + SI -> SIH+ + H2O
    k(2430) = small + (1.80e-09)

    !H3O+ + CH -> CH2+ + H2O
    k(2431) = small + (4.80e-09&
        *invsqrT32)

    !H3O+ + CP -> HCP+ + H2O
    k(2432) = small + (2.17e-09&
        *invsqrT32)

    !H3O+ + CS -> HCS+ + H2O
    k(2433) = small + (4.99e-09&
        *invsqrT32)

    !H3O+ + PN -> HPN+ + H2O
    k(2434) = small + (6.91e-09&
        *invsqrT32)

    !H3O+ + S2 -> S2H+ + H2O
    k(2435) = small + (2.00e-09)

    !H3O+ + SIC -> CHSI+ + H2O
    k(2436) = small + (4.35e-09&
        *invsqrT32)

    !H3O+ + SIH -> SIH2+ + H2O
    k(2437) = small + (3.25e-10&
        *invsqrT32)

    !H3O+ + SIO -> HSIO+ + H2O
    k(2438) = small + (7.81e-09&
        *invsqrT32)

    !H3O+ + C2S -> HC2S+ + H2O
    k(2439) = small + (2.88e-09&
        *invsqrT32)

    !H3O+ + C3 -> C3H+ + H2O
    k(2440) = small + (2.00e-09)

    !H3O+ + CCO -> C2HO+ + H2O
    k(2441) = small + (3.32e-09&
        *invsqrT32)

    !H3O+ + CCP -> PC2H+ + H2O
    k(2442) = small + (2.44e-09&
        *invsqrT32)

    !H3O+ + CH2 -> CH3+ + H2O
    k(2443) = small + (7.78e-10&
        *invsqrT32)

    !H3O+ + H2S -> H3S+ + H2O
    k(2444) = small + (1.10e-09&
        *invsqrT32)

    !H3O+ + HCN -> HCNH+ + H2O
    k(2445) = small + (8.20e-09&
        *invsqrT32)

    !H3O+ + HCP -> PCH2+ + H2O
    k(2446) = small + (9.83e-10&
        *invsqrT32)

    !H3O+ + HCSI -> CH2SI+ + H2O
    k(2447) = small + (2.55e-09&
        *invsqrT32)

    !H3O+ + HNC -> HCNH+ + H2O
    k(2448) = small + (7.42e-09&
        *invsqrT32)

    !H3O+ + HNSI -> SINH2+ + H2O
    k(2449) = small + (4.04e-10&
        *invsqrT32)

    !H3O+ + HS2 -> H2S2+ + H2O
    k(2450) = small + (2.02e-09&
        *invsqrT32)

    !H3O+ + NH2 -> NH3+ + H2O
    k(2451) = small + (2.40e-09&
        *invsqrT32)

    !H3O+ + SIC2 -> SIC2H+ + H2O
    k(2452) = small + (2.48e-09&
        *invsqrT32)

    !H3O+ + SIH2 -> SIH3+ + H2O
    k(2453) = small + (2.05e-10&
        *invsqrT32)

    !H3O+ + SINC -> SINCH+ + H2O
    k(2454) = small + (2.10e-09&
        *invsqrT32)

    !H3O+ + C3H -> C3H2+ + H2O
    k(2455) = small + (7.01e-09&
        *invsqrT32)

    !H3O+ + HC3 -> H2C3+ + H2O
    k(2456) = small + (9.05e-09&
        *invsqrT32)

    !H3O+ + C3N -> C3HN+ + H2O
    k(2457) = small + (5.44e-09&
        *invsqrT32)

    !H3O+ + C3O -> HC3O+ + H2O
    k(2458) = small + (5.88e-09&
        *invsqrT32)

    !H3O+ + C3P -> PC3H+ + H2O
    k(2459) = small + (1.01e-09&
        *invsqrT32)

    !H3O+ + C3S -> HC3S+ + H2O
    k(2460) = small + (3.92e-09&
        *invsqrT32)

    !H3O+ + C4 -> C4H+ + H2O
    k(2461) = small + (1.10e-09)

    !H3O+ + H2CO -> H3CO+ + H2O
    k(2462) = small + (2.60e-09&
        *invsqrT32)

    !H3O+ + H2S2 -> H3S2+ + H2O
    k(2463) = small + (1.21e-09&
        *invsqrT32)

    !H3O+ + H2SIO -> H3SIO+ + H2O
    k(2464) = small + (2.11e-09&
        *invsqrT32)

    !H3O+ + HCCP -> PC2H2+ + H2O
    k(2465) = small + (1.00e-09)

    !H3O+ + NH3 -> NH4+ + H2O
    k(2466) = small + (1.90e-09&
        *invsqrT32)

    !H3O+ + SIC2H -> SIC2H2+ + H2O
    k(2467) = small + (1.45e-09&
        *invsqrT32)

    !H3O+ + C2H2O -> C2H3O+ + H2O
    k(2468) = small + (1.52e-09&
        *invsqrT32)

    !H3O+ + C2H3 -> C2H4+ + H2O
    k(2469) = small + (1.74e-09&
        *invsqrT32)

    !H3O+ + C3H2 -> C3H3+ + H2O
    k(2470) = small + (3.35e-09&
        *invsqrT32)

    !H3O+ + H2C3 -> H3C3+ + H2O
    k(2471) = small + (4.05e-09&
        *invsqrT32)

    !H3O+ + C4H -> C4H2+ + H2O
    k(2472) = small + (2.23e-09&
        *invsqrT32)

    !H3O+ + C4P -> PC4H+ + H2O
    k(2473) = small + (4.95e-10&
        *invsqrT32)

    !H3O+ + C4S -> HC4S+ + H2O
    k(2474) = small + (2.97e-09&
        *invsqrT32)

    !H3O+ + CH2PH -> PCH4+ + H2O
    k(2475) = small + (5.29e-10&
        *invsqrT32)

    !H3O+ + HCNC2 -> HC2NCH+ + H2O
    k(2476) = small + (2.00e-08&
        *invsqrT32)

    !H3O+ + HC2NC -> HC2NCH+ + H2O
    k(2477) = small + (5.79e-09&
        *invsqrT32)

    !H3O+ + HC3N -> C3H2N+ + H2O
    k(2478) = small + (9.17e-09&
        *invsqrT32)

    !H3O+ + HNC3 -> C3H2N+ + H2O
    k(2479) = small + (5.19e-09&
        *invsqrT32)

    !H3O+ + SICH3 -> SICH4+ + H2O
    k(2480) = small + (1.60e-09&
        *invsqrT32)

    !H3O+ + C2H3N -> C2H4N+ + H2O
    k(2481) = small + (4.22e-09&
        *invsqrT32)

    !H3O+ + C3H3 -> C3H4+ + H2O
    k(2482) = small + (4.34e-09&
        *invsqrT32)

    !H3O+ + C4H2 -> C4H3+ + H2O
    k(2483) = small + (1.10e-09)

    !H3O+ + CH4O -> CH5O+ + H2O
    k(2484) = small + (1.91e-09&
        *invsqrT32)

    !H3O+ + NH2CHO -> NH2CH2O+ + H2O
    k(2485) = small + (9.37e-09&
        *invsqrT32)

    !H3O+ + C2H4O -> C2H5O+ + H2O
    k(2486) = small + (2.86e-09&
        *invsqrT32)

    !H3O+ + C3H4 -> C3H5+ + H2O
    k(2487) = small + (8.44e-10&
        *invsqrT32)

    !H3O+ + C4H3 -> C4H4+ + H2O
    k(2488) = small + (1.00e-09&
        *invsqrT32)

    !H3O+ + HCOOCH3 -> H5C2O2+ + H2O
    k(2489) = small + (1.81e-09&
        *invsqrT32)

    !H3O+ + C2H5OH -> C2H5OH2+ + H2O
    k(2490) = small + (1.79e-09&
        *invsqrT32)

    !H3O+ + CH3OCH3 -> CH3OCH4+ + H2O
    k(2491) = small + (1.37e-09&
        *invsqrT32)

    !H3O+ + C2H6CO -> C3H6OH+ + H2O
    k(2492) = small + (2.87e-09&
        *invsqrT32)

    !H3O+ + C6H6 -> C6H7+ + H2O
    k(2493) = small + (1.80e-09)

    !H3S+ + H -> H2S+ + H2
    k(2494) = small + (6.00e-11)

    !H3S+ + HCN -> HCNH+ + H2S
    k(2495) = small + (1.50e-09)

    !H3S+ + HNC -> HCNH+ + H2S
    k(2496) = small + (1.50e-09)

    !H3S+ + H2CO -> H3CO+ + H2S
    k(2497) = small + (2.20e-09)

    !H3S+ + NH3 -> NH4+ + H2S
    k(2498) = small + (1.90e-09)

    !HCO2+ + C -> CH+ + CO2
    k(2499) = small + (1.00e-09)

    !HCO2+ + O -> HCO+ + O2
    k(2500) = small + (1.00e-09)

    !HCO2+ + CO -> HCO+ + CO2
    k(2501) = small + (2.47e-10&
        *invsqrT32)

    !HCO2+ + H2O -> H3O+ + CO2
    k(2502) = small + (2.00e-09&
        *invsqrT32)

    !HCO2+ + C2H2 -> C2H3+ + CO2
    k(2503) = small + (1.37e-09)

    !HCO2+ + NH3 -> NH4+ + CO2
    k(2504) = small + (1.62e-09&
        *invsqrT32)

    !HCO2+ + CH4 -> CH5+ + CO2
    k(2505) = small + (7.80e-10)

    !HCO2+ + C2H3N -> C2H4N+ + CO2
    k(2506) = small + (3.28e-09&
        *invsqrT32)

    !HSO2+ + H2O -> H3O+ + SO2
    k(2507) = small + (2.13e-09)

    !HSO2+ + NH3 -> NH4+ + SO2
    k(2508) = small + (2.00e-09)

    !NH3+ + FE -> FE+ + NH3
    k(2509) = small + (2.30e-09)

    !NH3+ + MG -> MG+ + NH3
    k(2510) = small + (3.30e-09)

    !NH3+ + NA -> NA+ + NH3
    k(2511) = small + (3.20e-09)

    !NH3+ + O -> HNO+ + H2
    k(2512) = small + (1.00e-11)

    !NH3+ + O -> H2NO+ + H
    k(2513) = small + (1.00e-11)

    !NH3+ + SI -> SI+ + NH3
    k(2514) = small + (1.90e-09)

    !NH3+ + C2 -> C2H2+ + NH
    k(2515) = small + (1.00e-11)

    !NH3+ + CH -> NH4+ + C
    k(2516) = small + (4.90e-09&
        *invsqrT32)

    !NH3+ + H2 -> NH4+ + H
    k(2517) = small + (1.50e-14&
        *T32**(-1.50e+00))

    !NH3+ + NH -> NH4+ + N
    k(2518) = small + (4.20e-09&
        *invsqrT32)

    !NH3+ + NO -> NO+ + NH3
    k(2519) = small + (4.30e-10&
        *invsqrT32)

    !NH3+ + OH -> NH4+ + O
    k(2520) = small + (5.20e-09&
        *invsqrT32)

    !NH3+ + CH2 -> CH3+ + NH2
    k(2521) = small + (7.97e-10&
        *invsqrT32)

    !NH3+ + H2O -> NH4+ + OH
    k(2522) = small + (2.40e-09&
        *invsqrT32)

    !NH3+ + H2S -> NH4+ + HS
    k(2523) = small + (9.60e-10&
        *invsqrT32)

    !NH3+ + HCO -> HCO+ + NH3
    k(2524) = small + (5.90e-10&
        *invsqrT32)

    !NH3+ + HCO -> NH4+ + CO
    k(2525) = small + (5.90e-10&
        *invsqrT32)

    !NH3+ + NH2 -> NH4+ + NH
    k(2526) = small + (2.50e-09&
        *invsqrT32)

    !NH3+ + H2CO -> NH4+ + HCO
    k(2527) = small + (2.70e-09&
        *invsqrT32)

    !NH3+ + NH3 -> NH4+ + NH2
    k(2528) = small + (2.00e-09&
        *invsqrT32)

    !NH3+ + CH4 -> NH4+ + CH3
    k(2529) = small + (3.90e-10)

    !PC2H+ + C2H2 -> PC4H2+ + H
    k(2530) = small + (9.10e-10)

    !PH3+ + C2H2 -> PC2H3+ + H2
    k(2531) = small + (5.80e-10)

    !SIC2H+ + C -> SIC3+ + H
    k(2532) = small + (3.00e-10)

    !SIC2H+ + C2H2 -> SIC4H+ + H2
    k(2533) = small + (2.00e-11)

    !SIH3+ + C -> CH2SI+ + H
    k(2534) = small + (2.00e-10)

    !SIH3+ + N -> HNSI+ + H2
    k(2535) = small + (1.00e-10)

    !SIH3+ + N -> SINH2+ + H
    k(2536) = small + (1.00e-10)

    !SIH3+ + O -> HSIO+ + H2
    k(2537) = small + (2.00e-10)

    !SIH3+ + O -> H2SIO+ + H
    k(2538) = small + (2.00e-10)

    !SIH3+ + O2 -> H3SIO+ + O
    k(2539) = small + (2.90e-12)

    !SINCH+ + O -> HCO+ + SIN
    k(2540) = small + (2.00e-10)

    !SINH2+ + C -> SINC+ + H2
    k(2541) = small + (1.00e-10)

    !SINH2+ + C -> SINCH+ + H
    k(2542) = small + (1.00e-10)

    !C2H3+ + C -> C3H+ + H2
    k(2543) = small + (1.00e-09)

    !C2H3+ + C -> C3H2+ + H
    k(2544) = small + (5.00e-10)

    !C2H3+ + C -> H2C3+ + H
    k(2545) = small + (5.00e-10)

    !C2H3+ + H -> C2H2+ + H2
    k(2546) = small + (6.80e-11)

    !C2H3+ + N -> C2NH+ + H2
    k(2547) = small + (2.20e-10)

    !C2H3+ + O -> C2H2O+ + H
    k(2548) = small + (8.50e-11)

    !C2H3+ + O -> CH3+ + CO
    k(2549) = small + (5.00e-12)

    !C2H3+ + S -> HC2S+ + H2
    k(2550) = small + (1.00e-09)

    !C2H3+ + SI -> SIC2H+ + H2
    k(2551) = small + (2.00e-10)

    !C2H3+ + SI -> SIC2H2+ + H
    k(2552) = small + (2.00e-10)

    !C2H3+ + C2H -> C2H2+ + C2H2
    k(2553) = small + (6.80e-10&
        *invsqrT32)

    !C2H3+ + C2H -> C4H2+ + H2
    k(2554) = small + (6.80e-10&
        *invsqrT32)

    !C2H3+ + C2H -> C4H3+ + H
    k(2555) = small + (6.80e-10&
        *invsqrT32)

    !C2H3+ + H2O -> H3O+ + C2H2
    k(2556) = small + (2.20e-09&
        *invsqrT32)

    !C2H3+ + H2S -> H3S+ + C2H2
    k(2557) = small + (9.70e-10&
        *invsqrT32)

    !C2H3+ + HCN -> HCNH+ + C2H2
    k(2558) = small + (7.40e-09&
        *invsqrT32)

    !C2H3+ + HNC -> HCNH+ + C2H2
    k(2559) = small + (6.74e-09&
        *invsqrT32)

    !C2H3+ + C2H2 -> C4H3+ + H2
    k(2560) = small + (7.20e-10)

    !C2H3+ + C3H -> C3H2+ + C2H2
    k(2561) = small + (2.09e-09&
        *invsqrT32)

    !C2H3+ + HC3 -> H2C3+ + C2H2
    k(2562) = small + (2.71e-09&
        *invsqrT32)

    !C2H3+ + C3H -> C5H2+ + H2
    k(2563) = small + (2.09e-09&
        *invsqrT32)

    !C2H3+ + HC3 -> C5H2+ + H2
    k(2564) = small + (2.71e-09&
        *invsqrT32)

    !C2H3+ + C3H -> C5H3+ + H
    k(2565) = small + (2.09e-09&
        *invsqrT32)

    !C2H3+ + HC3 -> C5H3+ + H
    k(2566) = small + (2.71e-09&
        *invsqrT32)

    !C2H3+ + NH3 -> NH4+ + C2H2
    k(2567) = small + (1.80e-09&
        *invsqrT32)

    !C2H3+ + C2H3 -> C3H3+ + CH3
    k(2568) = small + (2.65e-10&
        *invsqrT32)

    !C2H3+ + C2H3 -> H3C3+ + CH3
    k(2569) = small + (2.65e-10&
        *invsqrT32)

    !C2H3+ + C2H3 -> C4H5+ + H
    k(2570) = small + (5.30e-10&
        *invsqrT32)

    !C2H3+ + C3H2 -> C3H3+ + C2H2
    k(2571) = small + (1.01e-09&
        *invsqrT32)

    !C2H3+ + H2C3 -> H3C3+ + C2H2
    k(2572) = small + (1.21e-09&
        *invsqrT32)

    !C2H3+ + C3H2 -> C5H3+ + H2
    k(2573) = small + (1.01e-09&
        *invsqrT32)

    !C2H3+ + H2C3 -> C5H3+ + H2
    k(2574) = small + (1.21e-09&
        *invsqrT32)

    !C2H3+ + C3H2 -> C5H4+ + H
    k(2575) = small + (1.01e-09&
        *invsqrT32)

    !C2H3+ + H2C3 -> C5H4+ + H
    k(2576) = small + (1.21e-09&
        *invsqrT32)

    !C2H3+ + C4H -> C4H2+ + C2H2
    k(2577) = small + (6.60e-10&
        *invsqrT32)

    !C2H3+ + C4H -> C6H2+ + H2
    k(2578) = small + (6.60e-10&
        *invsqrT32)

    !C2H3+ + C4H -> C6H3+ + H
    k(2579) = small + (6.60e-10&
        *invsqrT32)

    !C2H3+ + CH4 -> C3H5+ + H2
    k(2580) = small + (2.20e-10)

    !C2H3+ + HC3N -> C3H2N+ + C2H2
    k(2581) = small + (8.12e-09&
        *invsqrT32)

    !C2H3+ + C2H4 -> C2H5+ + C2H2
    k(2582) = small + (9.30e-10)

    !C2H3+ + C3H3 -> C3H4+ + C2H2
    k(2583) = small + (1.29e-09&
        *invsqrT32)

    !C2H3+ + C3H3 -> C5H4+ + H2
    k(2584) = small + (1.29e-09&
        *invsqrT32)

    !C2H3+ + C3H3 -> C5H5+ + H
    k(2585) = small + (1.29e-09&
        *invsqrT32)

    !C2H3+ + C4H2 -> C4H3+ + C2H2
    k(2586) = small + (3.00e-10)

    !C2H3+ + C4H2 -> C6H3+ + H2
    k(2587) = small + (3.00e-10)

    !C2H3+ + C4H2 -> C6H4+ + H
    k(2588) = small + (3.00e-10)

    !C2H3+ + C5H -> C5H2+ + C2H2
    k(2589) = small + (3.04e-09&
        *invsqrT32)

    !C2H3+ + C5H -> C7H2+ + H2
    k(2590) = small + (3.04e-09&
        *invsqrT32)

    !C2H3+ + C5H -> C7H3+ + H
    k(2591) = small + (3.04e-09&
        *invsqrT32)

    !C2H3+ + C3H4 -> C3H5+ + C2H2
    k(2592) = small + (3.77e-10&
        *invsqrT32)

    !C2H3+ + C3H4 -> C5H5+ + H2
    k(2593) = small + (3.77e-10&
        *invsqrT32)

    !C2H3+ + C5H2 -> C5H3+ + C2H2
    k(2594) = small + (7.45e-10&
        *invsqrT32)

    !C2H3+ + C5H2 -> C7H3+ + H2
    k(2595) = small + (7.45e-10&
        *invsqrT32)

    !C2H3+ + C5H2 -> C7H4+ + H
    k(2596) = small + (7.45e-10&
        *invsqrT32)

    !C2H3+ + C6H -> C6H2+ + C2H2
    k(2597) = small + (3.34e-09&
        *invsqrT32)

    !C2H3+ + C6H -> C8H2+ + H2
    k(2598) = small + (3.34e-09&
        *invsqrT32)

    !C2H3+ + C6H -> C8H3+ + H
    k(2599) = small + (3.34e-09&
        *invsqrT32)

    !C2H3+ + C6H2 -> C6H3+ + C2H2
    k(2600) = small + (3.00e-10)

    !C2H3+ + C6H2 -> C8H3+ + H2
    k(2601) = small + (3.00e-10)

    !C2H3+ + C6H2 -> C8H4+ + H
    k(2602) = small + (3.00e-10)

    !C2H3+ + C7H -> C7H2+ + C2H2
    k(2603) = small + (3.04e-09&
        *invsqrT32)

    !C2H3+ + C7H -> C9H2+ + H2
    k(2604) = small + (3.04e-09&
        *invsqrT32)

    !C2H3+ + C7H -> C9H3+ + H
    k(2605) = small + (3.04e-09&
        *invsqrT32)

    !C2H3+ + C7H2 -> C7H3+ + C2H2
    k(2606) = small + (6.79e-10&
        *invsqrT32)

    !C2H3+ + C7H2 -> C9H3+ + H2
    k(2607) = small + (6.79e-10&
        *invsqrT32)

    !C2H3+ + C7H2 -> C9H4+ + H
    k(2608) = small + (6.79e-10&
        *invsqrT32)

    !C2H3+ + C6H6 -> C6H7+ + C2H2
    k(2609) = small + (1.60e-09)

    !C3H2+ + C -> C4H+ + H
    k(2610) = small + (1.00e-09)

    !H2C3+ + C -> C4H+ + H
    k(2611) = small + (1.00e-09)

    !C3H2+ + H -> C3H+ + H2
    k(2612) = small + (6.00e-11)

    !H2C3+ + H -> C3H+ + H2
    k(2613) = small + (6.00e-11)

    !C3H2+ + N -> C3HN+ + H
    k(2614) = small + (2.50e-10)

    !H2C3+ + N -> C3HN+ + H
    k(2615) = small + (2.50e-10)

    !C3H2+ + O -> HCO+ + C2H
    k(2616) = small + (2.00e-10)

    !H2C3+ + O -> HCO+ + C2H
    k(2617) = small + (2.00e-10)

    !C3H2+ + P -> PC3H+ + H
    k(2618) = small + (1.00e-09)

    !H2C3+ + P -> PC3H+ + H
    k(2619) = small + (1.00e-09)

    !C3H2+ + S -> HC3S+ + H
    k(2620) = small + (1.00e-09)

    !H2C3+ + S -> HC3S+ + H
    k(2621) = small + (1.00e-09)

    !C3H2+ + SI -> SIC3+ + H2
    k(2622) = small + (2.00e-10)

    !H2C3+ + SI -> SIC3+ + H2
    k(2623) = small + (2.00e-10)

    !C3H2+ + SI -> SIC3H+ + H
    k(2624) = small + (2.00e-10)

    !H2C3+ + SI -> SIC3H+ + H
    k(2625) = small + (2.00e-10)

    !C3H2+ + C2H -> C5H2+ + H
    k(2626) = small + (1.89e-09&
        *invsqrT32)

    !H2C3+ + C2H -> C5H2+ + H
    k(2627) = small + (1.89e-09&
        *invsqrT32)

    !C3H2+ + C2H2 -> C5H3+ + H
    k(2628) = small + (5.50e-10)

    !H2C3+ + C2H2 -> C5H3+ + H
    k(2629) = small + (5.50e-10)

    !C3H2+ + C3H -> C6H2+ + H
    k(2630) = small + (5.73e-09&
        *invsqrT32)

    !H2C3+ + HC3 -> C6H2+ + H
    k(2631) = small + (7.41e-09&
        *invsqrT32)

    !C3H2+ + C2H3 -> C5H3+ + H2
    k(2632) = small + (7.30e-10&
        *invsqrT32)

    !H2C3+ + C2H3 -> C5H3+ + H2
    k(2633) = small + (7.30e-10&
        *invsqrT32)

    !C3H2+ + C2H3 -> C5H4+ + H
    k(2634) = small + (7.30e-10&
        *invsqrT32)

    !H2C3+ + C2H3 -> C5H4+ + H
    k(2635) = small + (7.30e-10&
        *invsqrT32)

    !C3H2+ + C3H2 -> C6H2+ + H2
    k(2636) = small + (1.37e-09&
        *invsqrT32)

    !H2C3+ + H2C3 -> C6H2+ + H2
    k(2637) = small + (1.65e-09&
        *invsqrT32)

    !C3H2+ + C3H2 -> C6H3+ + H
    k(2638) = small + (1.37e-09&
        *invsqrT32)

    !H2C3+ + H2C3 -> C6H3+ + H
    k(2639) = small + (1.65e-09&
        *invsqrT32)

    !C3H2+ + C4H -> C7H+ + H2
    k(2640) = small + (8.90e-10&
        *invsqrT32)

    !H2C3+ + C4H -> C7H+ + H2
    k(2641) = small + (8.90e-10&
        *invsqrT32)

    !C3H2+ + C4H -> C7H2+ + H
    k(2642) = small + (8.90e-10&
        *invsqrT32)

    !H2C3+ + C4H -> C7H2+ + H
    k(2643) = small + (8.90e-10&
        *invsqrT32)

    !C3H2+ + CH4 -> C4H5+ + H
    k(2644) = small + (1.00e-09)

    !H2C3+ + CH4 -> C4H5+ + H
    k(2645) = small + (1.00e-09)

    !C3H2+ + C2H4 -> C4H3+ + CH3
    k(2646) = small + (3.00e-10)

    !H2C3+ + C2H4 -> C4H3+ + CH3
    k(2647) = small + (3.00e-10)

    !C3H2+ + C2H4 -> C5H5+ + H
    k(2648) = small + (3.00e-10)

    !H2C3+ + C2H4 -> C5H5+ + H
    k(2649) = small + (3.00e-10)

    !C3H2+ + C3H3 -> C6H4+ + H
    k(2650) = small + (3.54e-09&
        *invsqrT32)

    !H2C3+ + C3H3 -> C6H4+ + H
    k(2651) = small + (3.54e-09&
        *invsqrT32)

    !C3H2+ + C4H2 -> C7H2+ + H2
    k(2652) = small + (3.00e-10)

    !H2C3+ + C4H2 -> C7H2+ + H2
    k(2653) = small + (3.00e-10)

    !C3H2+ + C4H2 -> C7H3+ + H
    k(2654) = small + (3.00e-10)

    !H2C3+ + C4H2 -> C7H3+ + H
    k(2655) = small + (3.00e-10)

    !C3H2+ + C5H -> C8H+ + H2
    k(2656) = small + (4.08e-09&
        *invsqrT32)

    !H2C3+ + C5H -> C8H+ + H2
    k(2657) = small + (4.08e-09&
        *invsqrT32)

    !C3H2+ + C5H -> C8H2+ + H
    k(2658) = small + (4.08e-09&
        *invsqrT32)

    !H2C3+ + C5H -> C8H2+ + H
    k(2659) = small + (4.08e-09&
        *invsqrT32)

    !C3H2+ + C3H4 -> C4H2+ + C2H4
    k(2660) = small + (6.17e-11&
        *invsqrT32)

    !H2C3+ + C3H4 -> C4H2+ + C2H4
    k(2661) = small + (6.17e-11&
        *invsqrT32)

    !C3H2+ + C3H4 -> C4H3+ + C2H3
    k(2662) = small + (8.23e-11&
        *invsqrT32)

    !H2C3+ + C3H4 -> C4H3+ + C2H3
    k(2663) = small + (8.23e-11&
        *invsqrT32)

    !C3H2+ + C3H4 -> C4H4+ + C2H2
    k(2664) = small + (2.81e-10&
        *invsqrT32)

    !H2C3+ + C3H4 -> C4H4+ + C2H2
    k(2665) = small + (2.81e-10&
        *invsqrT32)

    !H2C3+ + C3H4 -> C5H3+ + CH3
    k(2666) = small + (1.24e-10&
        *invsqrT32)

    !C3H2+ + C3H4 -> C5H3+ + CH3
    k(2667) = small + (1.24e-10&
        *invsqrT32)

    !C3H2+ + C3H4 -> C6H5+ + H
    k(2668) = small + (1.37e-10&
        *invsqrT32)

    !H2C3+ + C3H4 -> C6H5+ + H
    k(2669) = small + (1.37e-10&
        *invsqrT32)

    !C3H2+ + C5H2 -> C8H2+ + H2
    k(2670) = small + (1.00e-09&
        *invsqrT32)

    !H2C3+ + C5H2 -> C8H2+ + H2
    k(2671) = small + (1.00e-09&
        *invsqrT32)

    !C3H2+ + C5H2 -> C8H3+ + H
    k(2672) = small + (1.00e-09&
        *invsqrT32)

    !H2C3+ + C5H2 -> C8H3+ + H
    k(2673) = small + (1.00e-09&
        *invsqrT32)

    !C3H2+ + C6H -> C9H+ + H2
    k(2674) = small + (4.59e-09&
        *invsqrT32)

    !H2C3+ + C6H -> C9H+ + H2
    k(2675) = small + (4.59e-09&
        *invsqrT32)

    !C3H2+ + C6H -> C9H2+ + H
    k(2676) = small + (4.59e-09&
        *invsqrT32)

    !H2C3+ + C6H -> C9H2+ + H
    k(2677) = small + (4.59e-09&
        *invsqrT32)

    !C3H2+ + C6H2 -> C9H2+ + H2
    k(2678) = small + (3.00e-10)

    !H2C3+ + C6H2 -> C9H2+ + H2
    k(2679) = small + (3.00e-10)

    !C3H2+ + C6H2 -> C9H3+ + H
    k(2680) = small + (3.00e-10)

    !H2C3+ + C6H2 -> C9H3+ + H
    k(2681) = small + (3.00e-10)

    !C3HN+ + H2 -> C2H2+ + HCN
    k(2682) = small + (2.00e-12)

    !C3HN+ + H2 -> C3H2N+ + H
    k(2683) = small + (5.00e-12)

    !C4H+ + C -> C5+ + H
    k(2684) = small + (1.00e-09)

    !C4H+ + FE -> FE+ + C4H
    k(2685) = small + (1.00e-09)

    !C4H+ + MG -> MG+ + C4H
    k(2686) = small + (1.00e-09)

    !C4H+ + NA -> NA+ + C4H
    k(2687) = small + (1.00e-09)

    !C4H+ + O -> HCO+ + C3
    k(2688) = small + (2.00e-10)

    !C4H+ + H2 -> C4H2+ + H
    k(2689) = small + (1.65e-10)

    !C4H+ + C2H -> C6+ + H2
    k(2690) = small + (9.03e-10&
        *invsqrT32)

    !C4H+ + C2H -> C6H+ + H
    k(2691) = small + (9.03e-10&
        *invsqrT32)

    !C4H+ + C2H2 -> C6H2+ + H
    k(2692) = small + (1.50e-09)

    !C4H+ + C3H -> C7+ + H2
    k(2693) = small + (2.71e-09&
        *invsqrT32)

    !C4H+ + HC3 -> C7+ + H2
    k(2694) = small + (3.49e-09&
        *invsqrT32)

    !C4H+ + C3H -> C7H+ + H
    k(2695) = small + (2.71e-09&
        *invsqrT32)

    !C4H+ + HC3 -> C7H+ + H
    k(2696) = small + (3.49e-09&
        *invsqrT32)

    !C4H+ + C2H3 -> C6H3+ + H
    k(2697) = small + (1.39e-09&
        *invsqrT32)

    !C4H+ + C3H2 -> C7H2+ + H
    k(2698) = small + (2.58e-09&
        *invsqrT32)

    !C4H+ + H2C3 -> C7H2+ + H
    k(2699) = small + (3.12e-09&
        *invsqrT32)

    !C4H+ + C4H -> C4H2+ + C4
    k(2700) = small + (8.35e-10&
        *invsqrT32)

    !C4H+ + C4H -> C8H+ + H
    k(2701) = small + (8.35e-10&
        *invsqrT32)

    !C4H+ + CH4 -> C5H3+ + H2
    k(2702) = small + (1.10e-09)

    !C4H+ + C2H4 -> C4H3+ + C2H2
    k(2703) = small + (7.50e-10)

    !C4H+ + C2H4 -> C6H4+ + H
    k(2704) = small + (7.50e-10)

    !C4H+ + C3H3 -> C7H3+ + H
    k(2705) = small + (3.33e-09&
        *invsqrT32)

    !C4H+ + C4H2 -> C8H2+ + H
    k(2706) = small + (1.60e-09)

    !C4H+ + C5H -> C9H+ + H
    k(2707) = small + (7.57e-09&
        *invsqrT32)

    !C4H+ + C3H4 -> C7H4+ + H
    k(2708) = small + (6.45e-10&
        *invsqrT32)

    !C4H+ + C5H2 -> C9H2+ + H
    k(2709) = small + (1.85e-09&
        *invsqrT32)

    !C4N+ + H2 -> C3H+ + HCN
    k(2710) = small + (2.20e-11)

    !C4N+ + H2O -> HCO+ + HC3N
    k(2711) = small + (7.50e-10)

    !C4N+ + H2O -> C3H2N+ + CO
    k(2712) = small + (7.50e-10)

    !C4N+ + C2H2 -> C5H+ + HCN
    k(2713) = small + (8.00e-10)

    !C4N+ + CH4 -> C5H2N+ + H2
    k(2714) = small + (1.00e-10)

    !C5+ + H2 -> C5H+ + H
    k(2715) = small + (6.20e-10)

    !CH4+ + H -> CH3+ + H2
    k(2716) = small + (1.00e-11)

    !CH4+ + O -> CH3+ + OH
    k(2717) = small + (1.00e-09)

    !CH4+ + CO -> HCO+ + CH3
    k(2718) = small + (1.40e-09)

    !CH4+ + H2 -> CH5+ + H
    k(2719) = small + (3.50e-11)

    !CH4+ + O2 -> O2+ + CH4
    k(2720) = small + (4.00e-10)

    !CH4+ + CO2 -> HCO2+ + CH3
    k(2721) = small + (1.20e-09)

    !CH4+ + H2O -> H3O+ + CH3
    k(2722) = small + (2.50e-09)

    !CH4+ + H2S -> H2S+ + CH4
    k(2723) = small + (1.60e-09)

    !CH4+ + H2S -> H3S+ + CH3
    k(2724) = small + (9.50e-10)

    !CH4+ + OCS -> OCS+ + CH4
    k(2725) = small + (4.20e-10)

    !CH4+ + OCS -> HOCS+ + CH3
    k(2726) = small + (9.80e-10)

    !CH4+ + C2H2 -> C2H2+ + CH4
    k(2727) = small + (1.10e-09)

    !CH4+ + C2H2 -> C2H3+ + CH3
    k(2728) = small + (1.40e-09)

    !CH4+ + C2H2 -> C3H3+ + H2 + H
    k(2729) = small + (6.25e-11)

    !CH4+ + C2H2 -> H3C3+ + H2 + H
    k(2730) = small + (6.25e-11)

    !CH4+ + H2CO -> H2CO+ + CH4
    k(2731) = small + (1.62e-09)

    !CH4+ + H2CO -> H3CO+ + CH3
    k(2732) = small + (1.98e-09)

    !CH4+ + NH3 -> NH3+ + CH4
    k(2733) = small + (6.90e-10)

    !CH4+ + NH3 -> NH4+ + CH3
    k(2734) = small + (6.60e-10)

    !CH4+ + NH3 -> CH5+ + NH2
    k(2735) = small + (3.00e-11)

    !CH4+ + CH4 -> CH5+ + CH3
    k(2736) = small + (1.50e-09)

    !CH4+ + C2H4 -> C2H4+ + CH4
    k(2737) = small + (1.38e-09)

    !CH4+ + C2H4 -> C2H5+ + CH3
    k(2738) = small + (4.23e-10)

    !CH4+ + CH4O -> CH4O+ + CH4
    k(2739) = small + (1.80e-09)

    !CH4+ + CH4O -> CH5O+ + CH3
    k(2740) = small + (1.20e-09)

    !H3CO+ + NA -> NA+ + H2CO + H
    k(2741) = small + (2.60e-09)

    !H3CO+ + CH -> CH2+ + H2CO
    k(2742) = small + (4.40e-09&
        *invsqrT32)

    !H3CO+ + HNC -> HCNH+ + H2CO
    k(2743) = small + (6.52e-09&
        *invsqrT32)

    !H3CO+ + NH2 -> NH3+ + H2CO
    k(2744) = small + (2.20e-09&
        *invsqrT32)

    !H3CO+ + NH3 -> NH4+ + H2CO
    k(2745) = small + (1.70e-09&
        *invsqrT32)

    !NH4+ + C -> HCNH+ + H2
    k(2746) = small + (1.00e-11)

    !NH4+ + C -> H2NC+ + H2
    k(2747) = small + (1.00e-11)

    !SIC2H2+ + C -> SIC3H+ + H
    k(2748) = small + (2.00e-10)

    !SIC3H+ + C -> SIC4+ + H
    k(2749) = small + (2.00e-10)

    !SICH3+ + C -> SIC2H2+ + H
    k(2750) = small + (2.00e-10)

    !SICH3+ + H2O -> H3O+ + SICH2
    k(2751) = small + (2.00e-09)

    !SIH4+ + C -> CH2SI+ + H2
    k(2752) = small + (3.00e-10)

    !SIH4+ + CO -> HCO+ + SIH3
    k(2753) = small + (1.00e-09)

    !SIH4+ + H2 -> SIH5+ + H
    k(2754) = small + (1.00e-09)

    !SIH4+ + H2O -> H3O+ + SIH3
    k(2755) = small + (2.00e-09)

    !C2H3N+ + CO -> HCO+ + C2H2N
    k(2756) = small + (2.00e-09)

    !C2H4+ + C -> C3H2+ + H2
    k(2757) = small + (5.00e-10)

    !C2H4+ + C -> H2C3+ + H2
    k(2758) = small + (5.00e-10)

    !C2H4+ + C -> C3H3+ + H
    k(2759) = small + (5.00e-10)

    !C2H4+ + C -> H3C3+ + H
    k(2760) = small + (5.00e-10)

    !C2H4+ + H -> C2H3+ + H2
    k(2761) = small + (3.00e-10)

    !C2H4+ + N -> C2H2N+ + H2
    k(2762) = small + (2.50e-10)

    !C2H4+ + N -> C2H3N+ + H
    k(2763) = small + (1.00e-10)

    !C2H4+ + O -> HCO+ + CH3
    k(2764) = small + (8.40e-11)

    !C2H4+ + O -> CH3+ + HCO
    k(2765) = small + (1.08e-10)

    !C2H4+ + S -> HC2S+ + H2 + H
    k(2766) = small + (1.00e-09)

    !C2H4+ + SI -> SIC2H2+ + H2
    k(2767) = small + (2.00e-10)

    !C2H4+ + SI -> SIC2H3+ + H
    k(2768) = small + (2.00e-10)

    !C2H4+ + C2H -> C3H3+ + CH2
    k(2769) = small + (5.00e-10&
        *invsqrT32)

    !C2H4+ + C2H -> H3C3+ + CH2
    k(2770) = small + (5.00e-10&
        *invsqrT32)

    !C2H4+ + C2H -> C4H3+ + H2
    k(2771) = small + (1.00e-09&
        *invsqrT32)

    !C2H4+ + C2H2 -> C3H3+ + CH3
    k(2772) = small + (3.15e-10)

    !C2H4+ + C2H2 -> H3C3+ + CH3
    k(2773) = small + (3.15e-10)

    !C2H4+ + C2H2 -> C4H5+ + H
    k(2774) = small + (1.60e-10)

    !C2H4+ + C3H -> C4H2+ + CH3
    k(2775) = small + (4.66e-09&
        *invsqrT32)

    !C2H4+ + HC3 -> C4H2+ + CH3
    k(2776) = small + (6.02e-09&
        *invsqrT32)

    !C2H4+ + C3H -> C5H4+ + H
    k(2777) = small + (1.55e-09&
        *invsqrT32)

    !C2H4+ + HC3 -> C5H4+ + H
    k(2778) = small + (2.01e-09&
        *invsqrT32)

    !C2H4+ + NH3 -> NH3+ + C2H4
    k(2779) = small + (8.75e-10&
        *invsqrT32)

    !C2H4+ + NH3 -> NH4+ + C2H3
    k(2780) = small + (8.75e-10&
        *invsqrT32)

    !C2H4+ + C2H3 -> C2H3+ + C2H4
    k(2781) = small + (5.20e-10&
        *invsqrT32)

    !C2H4+ + C2H3 -> C2H5+ + C2H2
    k(2782) = small + (5.20e-10&
        *invsqrT32)

    !C2H4+ + C2H3 -> C4H5+ + H2
    k(2783) = small + (5.20e-10&
        *invsqrT32)

    !C2H4+ + C3H2 -> C4H3+ + CH3
    k(2784) = small + (2.23e-09&
        *invsqrT32)

    !C2H4+ + H2C3 -> C4H3+ + CH3
    k(2785) = small + (2.69e-09&
        *invsqrT32)

    !C2H4+ + C3H2 -> C5H5+ + H
    k(2786) = small + (7.43e-10&
        *invsqrT32)

    !C2H4+ + H2C3 -> C5H5+ + H
    k(2787) = small + (8.97e-10&
        *invsqrT32)

    !C2H4+ + C4H -> C5H2+ + CH3
    k(2788) = small + (1.47e-09&
        *invsqrT32)

    !C2H4+ + C4H -> C6H4+ + H
    k(2789) = small + (4.89e-10&
        *invsqrT32)

    !C2H4+ + HC3N -> C3H2N+ + C2H3
    k(2790) = small + (8.03e-09&
        *invsqrT32)

    !C2H4+ + C2H4 -> C3H5+ + CH3
    k(2791) = small + (7.30e-10)

    !C2H4+ + C2H4 -> C4H7+ + H
    k(2792) = small + (7.20e-11)

    !C2H4+ + C3H3 -> C3H3+ + C2H4
    k(2793) = small + (6.45e-10&
        *invsqrT32)

    !C2H4+ + C3H3 -> H3C3+ + C2H4
    k(2794) = small + (6.45e-10&
        *invsqrT32)

    !C2H4+ + C3H3 -> C4H3+ + CH4
    k(2795) = small + (1.29e-09&
        *invsqrT32)

    !C2H4+ + C3H3 -> C5H5+ + H2
    k(2796) = small + (1.29e-09&
        *invsqrT32)

    !C2H4+ + C4H2 -> C5H3+ + CH3
    k(2797) = small + (5.00e-10)

    !C2H4+ + C4H2 -> C6H4+ + H2
    k(2798) = small + (5.00e-10)

    !C2H4+ + C5H -> C6H2+ + CH3
    k(2799) = small + (6.76e-09&
        *invsqrT32)

    !C2H4+ + C5H -> C7H4+ + H
    k(2800) = small + (2.25e-09&
        *invsqrT32)

    !C2H4+ + C3H4 -> C4H5+ + CH3
    k(2801) = small + (7.45e-10&
        *invsqrT32)

    !C2H4+ + C5H2 -> C6H3+ + CH3
    k(2802) = small + (1.66e-09&
        *invsqrT32)

    !C2H4+ + C5H2 -> C7H5+ + H
    k(2803) = small + (5.52e-10&
        *invsqrT32)

    !C2H4+ + C6H -> C7H2+ + CH3
    k(2804) = small + (7.65e-09&
        *invsqrT32)

    !C2H4+ + C6H -> C8H4+ + H
    k(2805) = small + (2.55e-09&
        *invsqrT32)

    !C2H4+ + C6H2 -> C7H3+ + CH3
    k(2806) = small + (5.00e-10)

    !C2H4+ + C6H2 -> C8H4+ + H2
    k(2807) = small + (5.00e-10)

    !C2H4+ + C7H -> C8H2+ + CH3
    k(2808) = small + (6.75e-09&
        *invsqrT32)

    !C2H4+ + C7H -> C9H4+ + H
    k(2809) = small + (2.25e-09&
        *invsqrT32)

    !C2H4+ + C7H2 -> C8H3+ + CH3
    k(2810) = small + (1.58e-09&
        *invsqrT32)

    !C2H4+ + C7H2 -> C9H4+ + H2
    k(2811) = small + (5.27e-10&
        *invsqrT32)

    !C3H3+ + C -> C4H+ + H2
    k(2812) = small + (1.00e-09)

    !H3C3+ + C -> C4H+ + H2
    k(2813) = small + (1.00e-09)

    !C3H3+ + C -> C4H2+ + H
    k(2814) = small + (1.00e-09)

    !H3C3+ + C -> C4H2+ + H
    k(2815) = small + (1.00e-09)

    !C3H3+ + O -> C2H3+ + CO
    k(2816) = small + (4.50e-11)

    !H3C3+ + O -> C2H3+ + CO
    k(2817) = small + (4.50e-11)

    !C3H3+ + S -> HC3S+ + H2
    k(2818) = small + (1.00e-09)

    !H3C3+ + S -> HC3S+ + H2
    k(2819) = small + (1.00e-09)

    !C3H3+ + SI -> SIC3H+ + H2
    k(2820) = small + (2.00e-10)

    !H3C3+ + SI -> SIC3H+ + H2
    k(2821) = small + (2.00e-10)

    !C3H3+ + SI -> SIC3H2+ + H
    k(2822) = small + (2.00e-10)

    !H3C3+ + SI -> SIC3H2+ + H
    k(2823) = small + (2.00e-10)

    !C3H3+ + C2H -> C5H2+ + H2
    k(2824) = small + (9.40e-10&
        *invsqrT32)

    !H3C3+ + C2H -> C5H2+ + H2
    k(2825) = small + (9.40e-10&
        *invsqrT32)

    !C3H3+ + C2H -> C5H3+ + H
    k(2826) = small + (9.40e-10&
        *invsqrT32)

    !H3C3+ + C2H -> C5H3+ + H
    k(2827) = small + (9.40e-10&
        *invsqrT32)

    !C3H3+ + C2H2 -> C5H3+ + H2
    k(2828) = small + (1.00e-09)

    !H3C3+ + C2H2 -> C5H3+ + H2
    k(2829) = small + (1.00e-09)

    !C3H3+ + C3H -> C6H2+ + H2
    k(2830) = small + (2.85e-09&
        *invsqrT32)

    !H3C3+ + HC3 -> C6H2+ + H2
    k(2831) = small + (3.69e-09&
        *invsqrT32)

    !C3H3+ + C3H -> C6H3+ + H
    k(2832) = small + (2.85e-09&
        *invsqrT32)

    !H3C3+ + HC3 -> C6H3+ + H
    k(2833) = small + (3.69e-09&
        *invsqrT32)

    !C3H3+ + C2H3 -> C5H4+ + H2
    k(2834) = small + (1.46e-09&
        *invsqrT32)

    !H3C3+ + C2H3 -> C5H4+ + H2
    k(2835) = small + (1.46e-09&
        *invsqrT32)

    !C3H3+ + C3H2 -> C6H3+ + H2
    k(2836) = small + (1.36e-09&
        *invsqrT32)

    !H3C3+ + H2C3 -> C6H3+ + H2
    k(2837) = small + (1.64e-09&
        *invsqrT32)

    !C3H3+ + C3H2 -> C6H4+ + H
    k(2838) = small + (1.36e-09&
        *invsqrT32)

    !H3C3+ + H2C3 -> C6H4+ + H
    k(2839) = small + (1.64e-09&
        *invsqrT32)

    !C3H3+ + C4H -> C7H2+ + H2
    k(2840) = small + (8.85e-10&
        *invsqrT32)

    !H3C3+ + C4H -> C7H2+ + H2
    k(2841) = small + (8.85e-10&
        *invsqrT32)

    !C3H3+ + C4H -> C7H3+ + H
    k(2842) = small + (8.85e-10&
        *invsqrT32)

    !H3C3+ + C4H -> C7H3+ + H
    k(2843) = small + (8.85e-10&
        *invsqrT32)

    !C3H3+ + CH4 -> C4H5+ + H2
    k(2844) = small + (1.00e-09)

    !H3C3+ + CH4 -> C4H5+ + H2
    k(2845) = small + (1.00e-09)

    !C3H3+ + C2H4 -> C5H5+ + H2
    k(2846) = small + (1.10e-09)

    !H3C3+ + C2H4 -> C5H5+ + H2
    k(2847) = small + (1.10e-09)

    !C3H3+ + C3H3 -> C6H4+ + H2
    k(2848) = small + (1.76e-09&
        *invsqrT32)

    !H3C3+ + C3H3 -> C6H4+ + H2
    k(2849) = small + (1.76e-09&
        *invsqrT32)

    !C3H3+ + C3H3 -> C6H5+ + H
    k(2850) = small + (1.76e-09&
        *invsqrT32)

    !H3C3+ + C3H3 -> C6H5+ + H
    k(2851) = small + (1.76e-09&
        *invsqrT32)

    !C3H3+ + C4H2 -> C7H3+ + H2
    k(2852) = small + (1.00e-09)

    !H3C3+ + C4H2 -> C7H3+ + H2
    k(2853) = small + (1.00e-09)

    !C3H3+ + C5H -> C8H2+ + H2
    k(2854) = small + (4.05e-09&
        *invsqrT32)

    !H3C3+ + C5H -> C8H2+ + H2
    k(2855) = small + (4.05e-09&
        *invsqrT32)

    !C3H3+ + C5H -> C8H3+ + H
    k(2856) = small + (4.05e-09&
        *invsqrT32)

    !H3C3+ + C5H -> C8H3+ + H
    k(2857) = small + (4.05e-09&
        *invsqrT32)

    !C3H3+ + C3H4 -> C6H5+ + H2
    k(2858) = small + (6.81e-10&
        *invsqrT32)

    !H3C3+ + C3H4 -> C6H5+ + H2
    k(2859) = small + (6.81e-10&
        *invsqrT32)

    !C3H3+ + C5H2 -> C8H3+ + H2
    k(2860) = small + (9.91e-10&
        *invsqrT32)

    !H3C3+ + C5H2 -> C8H3+ + H2
    k(2861) = small + (9.91e-10&
        *invsqrT32)

    !C3H3+ + C5H2 -> C8H4+ + H
    k(2862) = small + (9.91e-10&
        *invsqrT32)

    !H3C3+ + C5H2 -> C8H4+ + H
    k(2863) = small + (9.91e-10&
        *invsqrT32)

    !C3H3+ + C6H -> C9H2+ + H2
    k(2864) = small + (4.55e-09&
        *invsqrT32)

    !H3C3+ + C6H -> C9H2+ + H2
    k(2865) = small + (4.55e-09&
        *invsqrT32)

    !C3H3+ + C6H -> C9H3+ + H
    k(2866) = small + (4.55e-09&
        *invsqrT32)

    !H3C3+ + C6H -> C9H3+ + H
    k(2867) = small + (4.55e-09&
        *invsqrT32)

    !C3H3+ + C6H2 -> C9H3+ + H2
    k(2868) = small + (1.00e-09)

    !H3C3+ + C6H2 -> C9H3+ + H2
    k(2869) = small + (1.00e-09)

    !C4H2+ + C -> C5+ + H2
    k(2870) = small + (5.00e-10)

    !C4H2+ + C -> C5H+ + H
    k(2871) = small + (5.00e-10)

    !C4H2+ + N -> HC4N+ + H
    k(2872) = small + (1.00e-18)

    !C4H2+ + O -> HC4O+ + H
    k(2873) = small + (1.35e-10)

    !C4H2+ + O -> C3H2+ + CO
    k(2874) = small + (5.50e-11)

    !C4H2+ + O -> H2C3+ + CO
    k(2875) = small + (5.50e-11)

    !C4H2+ + P -> PC4H+ + H
    k(2876) = small + (1.00e-09)

    !C4H2+ + S -> HC4S+ + H
    k(2877) = small + (1.00e-09)

    !C4H2+ + SI -> SIC4+ + H2
    k(2878) = small + (2.00e-10)

    !C4H2+ + SI -> SIC4H+ + H
    k(2879) = small + (2.00e-10)

    !C4H2+ + C2H -> C6H2+ + H
    k(2880) = small + (1.80e-09&
        *invsqrT32)

    !C4H2+ + C2H2 -> C6H3+ + H
    k(2881) = small + (7.00e-12)

    !C4H2+ + C3H -> C7H2+ + H
    k(2882) = small + (5.38e-09&
        *invsqrT32)

    !C4H2+ + HC3 -> C7H2+ + H
    k(2883) = small + (6.96e-09&
        *invsqrT32)

    !C4H2+ + C2H3 -> C6H3+ + H2
    k(2884) = small + (2.78e-10&
        *invsqrT32)

    !C4H2+ + C2H3 -> C6H4+ + H
    k(2885) = small + (1.11e-09&
        *invsqrT32)

    !C4H2+ + C3H2 -> C7H3+ + H
    k(2886) = small + (2.57e-09&
        *invsqrT32)

    !C4H2+ + H2C3 -> C7H3+ + H
    k(2887) = small + (3.11e-09&
        *invsqrT32)

    !C4H2+ + C4H -> C8H2+ + H
    k(2888) = small + (1.66e-09&
        *invsqrT32)

    !C4H2+ + CH4 -> C5H4+ + H2
    k(2889) = small + (2.00e-10)

    !C4H2+ + CH4 -> C5H5+ + H
    k(2890) = small + (8.00e-10)

    !C4H2+ + C2H4 -> C6H4+ + H2
    k(2891) = small + (2.00e-10)

    !C4H2+ + C2H4 -> C6H5+ + H
    k(2892) = small + (8.00e-10)

    !C4H2+ + C3H3 -> C7H3+ + H2
    k(2893) = small + (6.63e-10&
        *invsqrT32)

    !C4H2+ + C3H3 -> C7H4+ + H
    k(2894) = small + (2.65e-09&
        *invsqrT32)

    !C4H2+ + C4H2 -> C6H2+ + C2H2
    k(2895) = small + (1.00e-09)

    !C4H2+ + C4H2 -> C8H2+ + H2
    k(2896) = small + (1.00e-09)

    !C4H2+ + C5H -> C9H2+ + H
    k(2897) = small + (7.53e-09&
        *invsqrT32)

    !C4H2+ + C3H4 -> C7H5+ + H
    k(2898) = small + (6.42e-10&
        *invsqrT32)

    !C4H2+ + C5H2 -> C9H3+ + H
    k(2899) = small + (1.84e-09&
        *invsqrT32)

    !C5H+ + C -> C6+ + H
    k(2900) = small + (1.00e-09)

    !C5H+ + N -> C5N+ + H
    k(2901) = small + (2.00e-10)

    !C5H+ + O -> HCO+ + C4
    k(2902) = small + (2.00e-10)

    !C5H+ + H2 -> C5H2+ + H
    k(2903) = small + (1.00e-17)

    !C5N+ + H2 -> C5HN+ + H
    k(2904) = small + (1.50e-09)

    !C6+ + H2 -> C6H+ + H
    k(2905) = small + (5.40e-11)

    !CH5+ + C -> CH+ + CH4
    k(2906) = small + (1.00e-09)

    !CH5+ + C -> C2H3+ + H2
    k(2907) = small + (1.00e-09)

    !CH5+ + C -> C2H4+ + H
    k(2908) = small + (1.00e-09)

    !CH5+ + H -> CH4+ + H2
    k(2909) = small + (1.50e-10&
        *exp(-4.81e+02&
        /Tgas))

    !CH5+ + MG -> MG+ + CH4 + H
    k(2910) = small + (1.40e-09)

    !CH5+ + O -> H3O+ + CH2
    k(2911) = small + (2.20e-10)

    !CH5+ + O -> H3CO+ + H2
    k(2912) = small + (4.40e-12)

    !CH5+ + S -> HS+ + CH4
    k(2913) = small + (1.30e-09)

    !CH5+ + SI -> SICH3+ + H2
    k(2914) = small + (2.00e-10)

    !CH5+ + SI -> SICH4+ + H
    k(2915) = small + (2.00e-10)

    !CH5+ + C2 -> C2H+ + CH4
    k(2916) = small + (9.50e-10)

    !CH5+ + CH -> CH2+ + CH4
    k(2917) = small + (4.90e-09&
        *invsqrT32)

    !CH5+ + CO -> HCO+ + CH4
    k(2918) = small + (3.16e-10&
        *invsqrT32)

    !CH5+ + NH -> NH2+ + CH4
    k(2919) = small + (4.20e-09&
        *invsqrT32)

    !CH5+ + OH -> H2O+ + CH4
    k(2920) = small + (5.20e-09&
        *invsqrT32)

    !CH5+ + C2H -> C2H2+ + CH4
    k(2921) = small + (2.30e-09&
        *invsqrT32)

    !CH5+ + CH2 -> CH3+ + CH4
    k(2922) = small + (7.97e-10&
        *invsqrT32)

    !CH5+ + H2O -> H3O+ + CH4
    k(2923) = small + (2.40e-09&
        *invsqrT32)

    !CH5+ + HCN -> HCNH+ + CH4
    k(2924) = small + (8.50e-09&
        *invsqrT32)

    !CH5+ + HCO -> H2CO+ + CH4
    k(2925) = small + (1.20e-09&
        *invsqrT32)

    !CH5+ + HNC -> HCNH+ + CH4
    k(2926) = small + (7.67e-09&
        *invsqrT32)

    !CH5+ + NH2 -> NH3+ + CH4
    k(2927) = small + (2.50e-09&
        *invsqrT32)

    !CH5+ + C2H2 -> C2H3+ + CH4
    k(2928) = small + (1.60e-09)

    !CH5+ + H2CO -> H3CO+ + CH4
    k(2929) = small + (2.70e-09&
        *invsqrT32)

    !CH5+ + NH3 -> NH4+ + CH4
    k(2930) = small + (2.00e-09&
        *invsqrT32)

    !CH5+ + HC3N -> C3H2N+ + CH4
    k(2931) = small + (9.55e-09&
        *invsqrT32)

    !CH5+ + C6H6 -> C6H7+ + CH4
    k(2932) = small + (2.00e-09)

    !HC4N+ + H2 -> H2C4N+ + H
    k(2933) = small + (1.00e-09)

    !SIC2H3+ + C -> SIC3H2+ + H
    k(2934) = small + (2.00e-10)

    !SIC3H2+ + C -> SIC4H+ + H
    k(2935) = small + (2.00e-10)

    !SICH4+ + C -> SIC2H3+ + H
    k(2936) = small + (2.00e-10)

    !SIH5+ + C -> SICH4+ + H
    k(2937) = small + (2.00e-10)

    !SIH5+ + O -> H3SIO+ + H2
    k(2938) = small + (1.00e-10)

    !SIH5+ + H2O -> H3O+ + SIH4
    k(2939) = small + (2.00e-09)

    !C2H5+ + C -> C3H3+ + H2
    k(2940) = small + (5.00e-10)

    !C2H5+ + C -> H3C3+ + H2
    k(2941) = small + (5.00e-10)

    !C2H5+ + C -> C3H4+ + H
    k(2942) = small + (1.00e-09)

    !C2H5+ + H -> C2H4+ + H2
    k(2943) = small + (1.00e-11)

    !C2H5+ + O -> HCO+ + CH4
    k(2944) = small + (1.00e-11)

    !C2H5+ + O -> C2H4O+ + H
    k(2945) = small + (1.00e-11)

    !C2H5+ + H2O -> H3O+ + C2H4
    k(2946) = small + (2.15e-09&
        *invsqrT32)

    !C2H5+ + H2S -> H3S+ + C2H4
    k(2947) = small + (9.50e-10&
        *invsqrT32)

    !C2H5+ + HCN -> HCNH+ + C2H4
    k(2948) = small + (7.31e-09&
        *invsqrT32)

    !C2H5+ + HNC -> HCNH+ + C2H4
    k(2949) = small + (6.62e-09&
        *invsqrT32)

    !C2H5+ + C2H2 -> C3H3+ + CH4
    k(2950) = small + (3.40e-11)

    !C2H5+ + C2H2 -> H3C3+ + CH4
    k(2951) = small + (3.40e-11)

    !C2H5+ + C2H2 -> C4H5+ + H2
    k(2952) = small + (1.20e-10)

    !C2H5+ + H2CO -> H3CO+ + C2H4
    k(2953) = small + (2.35e-09&
        *invsqrT32)

    !C2H5+ + NH3 -> NH4+ + C2H4
    k(2954) = small + (1.74e-09&
        *invsqrT32)

    !C2H5+ + C2H4 -> C3H5+ + CH4
    k(2955) = small + (3.90e-10)

    !C3H4+ + C -> C4H2+ + H2
    k(2956) = small + (1.00e-09)

    !C3H4+ + C -> C4H3+ + H
    k(2957) = small + (1.00e-09)

    !C3H4+ + H -> C3H3+ + H2
    k(2958) = small + (1.50e-10)

    !C3H4+ + H -> H3C3+ + H2
    k(2959) = small + (1.50e-10)

    !C3H4+ + N -> C3H2N+ + H2
    k(2960) = small + (1.00e-10)

    !C3H4+ + N -> C3H3N+ + H
    k(2961) = small + (1.00e-10)

    !C3H4+ + O -> HCO+ + C2H3
    k(2962) = small + (2.00e-10)

    !C3H4+ + C2H2 -> C5H5+ + H
    k(2963) = small + (4.90e-10)

    !C3H4+ + C3H4 -> C6H7+ + H
    k(2964) = small + (7.50e-10)

    !C4H3+ + C -> C5H+ + H2
    k(2965) = small + (5.00e-10)

    !C4H3+ + C -> C5H2+ + H
    k(2966) = small + (5.00e-10)

    !C4H3+ + N -> H2C4N+ + H
    k(2967) = small + (1.00e-18)

    !C4H3+ + O -> HCO+ + C3H2
    k(2968) = small + (2.50e-11)

    !C4H3+ + O -> HCO+ + H2C3
    k(2969) = small + (2.50e-11)

    !C4H3+ + S -> HC4S+ + H2
    k(2970) = small + (1.00e-09)

    !C4H3+ + C2H -> C6H3+ + H
    k(2971) = small + (1.79e-09&
        *invsqrT32)

    !C4H3+ + C3H -> C7H3+ + H
    k(2972) = small + (5.36e-09&
        *invsqrT32)

    !C4H3+ + HC3 -> C7H3+ + H
    k(2973) = small + (6.92e-09&
        *invsqrT32)

    !C4H3+ + C2H3 -> C6H4+ + H2
    k(2974) = small + (6.93e-10&
        *invsqrT32)

    !C4H3+ + C2H3 -> C6H5+ + H
    k(2975) = small + (6.93e-10&
        *invsqrT32)

    !C4H3+ + C3H2 -> C7H4+ + H
    k(2976) = small + (2.56e-09&
        *invsqrT32)

    !C4H3+ + H2C3 -> C7H4+ + H
    k(2977) = small + (3.08e-09&
        *invsqrT32)

    !C4H3+ + C4H -> C8H3+ + H
    k(2978) = small + (1.65e-09&
        *invsqrT32)

    !C4H3+ + CH4 -> C5H5+ + H2
    k(2979) = small + (5.00e-10)

    !C4H3+ + C3H3 -> C7H4+ + H2
    k(2980) = small + (1.65e-09&
        *invsqrT32)

    !C4H3+ + C3H3 -> C7H5+ + H
    k(2981) = small + (1.65e-09&
        *invsqrT32)

    !C4H3+ + C4H2 -> C6H3+ + C2H2
    k(2982) = small + (1.00e-10)

    !C4H3+ + C4H2 -> C8H4+ + H
    k(2983) = small + (5.00e-10)

    !C4H3+ + C5H -> C9H3+ + H
    k(2984) = small + (7.49e-09&
        *invsqrT32)

    !C4H3+ + C3H4 -> C5H5+ + C2H2
    k(2985) = small + (6.39e-10&
        *invsqrT32)

    !C4H3+ + C5H2 -> C9H3+ + H2
    k(2986) = small + (9.17e-10&
        *invsqrT32)

    !C4H3+ + C5H2 -> C9H4+ + H
    k(2987) = small + (9.17e-10&
        *invsqrT32)

    !C5H2+ + C -> C6+ + H2
    k(2988) = small + (5.00e-10)

    !C5H2+ + C -> C6H+ + H
    k(2989) = small + (5.00e-10)

    !C5H2+ + N -> C5HN+ + H
    k(2990) = small + (2.00e-10)

    !C5H2+ + O -> HCO+ + C4H
    k(2991) = small + (2.00e-10)

    !C5H2+ + C2H -> C7H2+ + H
    k(2992) = small + (1.74e-09&
        *invsqrT32)

    !C5H2+ + C2H2 -> C7H2+ + H2
    k(2993) = small + (3.00e-10)

    !C5H2+ + C2H2 -> C7H3+ + H
    k(2994) = small + (7.00e-10)

    !C5H2+ + C3H -> C8H2+ + H
    k(2995) = small + (5.16e-09&
        *invsqrT32)

    !C5H2+ + HC3 -> C8H2+ + H
    k(2996) = small + (6.66e-09&
        *invsqrT32)

    !C5H2+ + C2H3 -> C7H3+ + H2
    k(2997) = small + (8.93e-10&
        *invsqrT32)

    !C5H2+ + C2H3 -> C7H4+ + H
    k(2998) = small + (4.47e-10&
        *invsqrT32)

    !C5H2+ + C3H2 -> C8H2+ + H2
    k(2999) = small + (8.25e-10&
        *invsqrT32)

    !C5H2+ + H2C3 -> C8H2+ + H2
    k(3000) = small + (9.95e-10&
        *invsqrT32)

    !C5H2+ + C3H2 -> C8H3+ + H
    k(3001) = small + (1.64e-09&
        *invsqrT32)

    !C5H2+ + H2C3 -> C8H3+ + H
    k(3002) = small + (1.98e-09&
        *invsqrT32)

    !C5H2+ + C4H -> C9H2+ + H
    k(3003) = small + (1.58e-09&
        *invsqrT32)

    !C5H2+ + CH4 -> C6H4+ + H2
    k(3004) = small + (2.00e-10)

    !C5H2+ + CH4 -> C6H5+ + H
    k(3005) = small + (8.00e-10)

    !C5H2+ + C2H4 -> C7H4+ + H2
    k(3006) = small + (5.00e-10)

    !C5H2+ + C2H4 -> C7H5+ + H
    k(3007) = small + (5.00e-10)

    !C5H2+ + C3H3 -> C8H3+ + H2
    k(3008) = small + (1.59e-09&
        *invsqrT32)

    !C5H2+ + C3H3 -> C8H4+ + H
    k(3009) = small + (1.59e-09&
        *invsqrT32)

    !C5H2+ + C4H2 -> C7H3+ + C2H
    k(3010) = small + (6.00e-10)

    !C5H2+ + C4H2 -> C9H3+ + H
    k(3011) = small + (1.00e-09)

    !C5H2+ + C3H4 -> C8H4+ + H2
    k(3012) = small + (6.14e-10&
        *invsqrT32)

    !C5HN+ + H2 -> C5H2N+ + H
    k(3013) = small + (5.00e-12)

    !C6H+ + C -> C7+ + H
    k(3014) = small + (1.00e-09)

    !C6H+ + O -> HCO+ + C5
    k(3015) = small + (2.00e-10)

    !C6H+ + H2 -> C6H2+ + H
    k(3016) = small + (1.30e-12)

    !C7+ + H2 -> C7H+ + H
    k(3017) = small + (1.90e-10)

    !CH5O+ + H2CO -> H5C2O2+ + H2
    k(3018) = small + (1.00e-09)

    !CH5O+ + CH4O -> CH3OCH4+ + H2O
    k(3019) = small + (1.00e-10&
        *T32**(-1.00e+00))

    !H2C4N+ + H2 -> H3C4N+ + H
    k(3020) = small + (1.00e-09)

    !C2H6+ + H -> C2H5+ + H2
    k(3021) = small + (1.00e-10)

    !C3H5+ + C -> C4H3+ + H2
    k(3022) = small + (2.00e-09)

    !C3H5+ + N -> C2H4+ + HCN
    k(3023) = small + (1.00e-10)

    !C3H5+ + N -> C3H3N+ + H2
    k(3024) = small + (1.00e-10)

    !C3H5+ + O -> HCO+ + C2H4
    k(3025) = small + (2.00e-10)

    !C3H5+ + C6H6 -> C6H7+ + C3H4
    k(3026) = small + (1.15e-10)

    !C4H4+ + C2H2 -> C6H4+ + H2
    k(3027) = small + (1.20e-11)

    !C4H4+ + C2H2 -> C6H5+ + H
    k(3028) = small + (9.00e-11)

    !C4H4+ + C4H2 -> C6H4+ + C2H2
    k(3029) = small + (7.00e-10)

    !C5H3+ + C -> C6H+ + H2
    k(3030) = small + (5.00e-10)

    !C5H3+ + C -> C6H2+ + H
    k(3031) = small + (5.00e-10)

    !C5H3+ + N -> C5H2N+ + H
    k(3032) = small + (2.00e-10)

    !C5H3+ + O -> HCO+ + C4H2
    k(3033) = small + (2.00e-10)

    !C6H2+ + C -> C7+ + H2
    k(3034) = small + (5.00e-10)

    !C6H2+ + C -> C7H+ + H
    k(3035) = small + (5.00e-10)

    !C6H2+ + O -> HCO+ + C5H
    k(3036) = small + (2.00e-10)

    !C6H2+ + C2H -> C8H2+ + H
    k(3037) = small + (1.70e-09&
        *invsqrT32)

    !C6H2+ + HC3 -> C9H2+ + H
    k(3038) = small + (6.46e-09&
        *invsqrT32)

    !C6H2+ + C3H -> C9H2+ + H
    k(3039) = small + (5.00e-09&
        *invsqrT32)

    !C6H2+ + C2H3 -> C8H3+ + H2
    k(3040) = small + (8.72e-10&
        *invsqrT32)

    !C6H2+ + C2H3 -> C8H4+ + H
    k(3041) = small + (4.36e-10&
        *invsqrT32)

    !C6H2+ + C3H2 -> C9H2+ + H2
    k(3042) = small + (7.98e-10&
        *invsqrT32)

    !C6H2+ + H2C3 -> C9H2+ + H2
    k(3043) = small + (9.62e-10&
        *invsqrT32)

    !C6H2+ + C3H2 -> C9H3+ + H
    k(3044) = small + (1.60e-09&
        *invsqrT32)

    !C6H2+ + H2C3 -> C9H3+ + H
    k(3045) = small + (1.92e-09&
        *invsqrT32)

    !C6H2+ + CH4 -> C7H4+ + H2
    k(3046) = small + (2.00e-10)

    !C6H2+ + CH4 -> C7H5+ + H
    k(3047) = small + (8.00e-10)

    !C6H2+ + C2H4 -> C8H4+ + H2
    k(3048) = small + (1.00e-09)

    !C6H2+ + C3H3 -> C9H3+ + H2
    k(3049) = small + (1.54e-09&
        *invsqrT32)

    !C6H2+ + C3H3 -> C9H4+ + H
    k(3050) = small + (1.54e-09&
        *invsqrT32)

    !C6H2+ + C3H4 -> C9H4+ + H2
    k(3051) = small + (5.94e-10&
        *invsqrT32)

    !C7H+ + C -> C8+ + H
    k(3052) = small + (1.00e-09)

    !C7H+ + N -> C7N+ + H
    k(3053) = small + (2.00e-10)

    !C7H+ + O -> HCO+ + C6
    k(3054) = small + (2.00e-10)

    !C7H+ + H2 -> C7H2+ + H
    k(3055) = small + (1.00e-17)

    !C7N+ + H2 -> C7HN+ + H
    k(3056) = small + (1.50e-09)

    !C8+ + H2 -> C8H+ + H
    k(3057) = small + (4.70e-12)

    !H3C4N+ + H2 -> C4H4N+ + H
    k(3058) = small + (1.00e-09)

    !C4H4N+ + C -> C5H3N+ + H
    k(3059) = small + (1.00e-09)

    !C4H5+ + N -> C4H4N+ + H
    k(3060) = small + (1.00e-10)

    !C5H4+ + N -> C5H3N+ + H
    k(3061) = small + (1.00e-10)

    !C6H3+ + C -> C7H+ + H2
    k(3062) = small + (5.00e-10)

    !C6H3+ + C -> C7H2+ + H
    k(3063) = small + (5.00e-10)

    !C6H3+ + O -> HCO+ + C5H2
    k(3064) = small + (2.00e-10)

    !C7H2+ + C -> C8+ + H2
    k(3065) = small + (5.00e-10)

    !C7H2+ + C -> C8H+ + H
    k(3066) = small + (5.00e-10)

    !C7H2+ + N -> C7HN+ + H
    k(3067) = small + (2.00e-10)

    !C7H2+ + O -> HCO+ + C6H
    k(3068) = small + (2.00e-10)

    !C7H2+ + C2H -> C9H2+ + H
    k(3069) = small + (1.67e-09&
        *invsqrT32)

    !C7H2+ + C2H2 -> C9H2+ + H2
    k(3070) = small + (3.00e-10)

    !C7H2+ + C2H2 -> C9H3+ + H
    k(3071) = small + (7.00e-10)

    !C7H2+ + C2H3 -> C9H3+ + H2
    k(3072) = small + (8.53e-10&
        *invsqrT32)

    !C7H2+ + C2H3 -> C9H4+ + H
    k(3073) = small + (4.27e-10&
        *invsqrT32)

    !C7H2+ + CH4 -> C8H4+ + H2
    k(3074) = small + (1.00e-09)

    !C7H2+ + C2H4 -> C9H4+ + H2
    k(3075) = small + (1.00e-09)

    !C7HN+ + H2 -> C7H2N+ + H
    k(3076) = small + (5.00e-12)

    !C8H+ + H2 -> C8H2+ + H
    k(3077) = small + (1.00e-09)

    !C9+ + H2 -> C9H+ + H
    k(3078) = small + (4.10e-11)

    !C5H5+ + N -> C5H3N+ + H2
    k(3079) = small + (1.00e-10)

    !C7H3+ + C -> C8H+ + H2
    k(3080) = small + (5.00e-10)

    !C7H3+ + C -> C8H2+ + H
    k(3081) = small + (5.00e-10)

    !C7H3+ + N -> C7H2N+ + H
    k(3082) = small + (2.00e-10)

    !C7H3+ + O -> HCO+ + C6H2
    k(3083) = small + (2.00e-10)

    !C8H2+ + C -> C9+ + H2
    k(3084) = small + (5.00e-10)

    !C8H2+ + C -> C9H+ + H
    k(3085) = small + (5.00e-10)

    !C8H2+ + O -> HCO+ + C7H
    k(3086) = small + (2.00e-10)

    !C8H2+ + CH4 -> C9H4+ + H2
    k(3087) = small + (1.00e-09)

    !C9H+ + C -> C10+ + H
    k(3088) = small + (1.00e-09)

    !C9H+ + N -> C9N+ + H
    k(3089) = small + (2.00e-10)

    !C9H+ + O -> HCO+ + C8
    k(3090) = small + (2.00e-10)

    !C9H+ + H2 -> C9H2+ + H
    k(3091) = small + (1.00e-17)

    !C9N+ + H2 -> C9HN+ + H
    k(3092) = small + (1.50e-09)

    !C6H4N+ + C -> C7H3N+ + H
    k(3093) = small + (1.00e-09)

    !C6H5+ + N -> C6H4N+ + H
    k(3094) = small + (1.00e-10)

    !C6H5+ + C2H4 -> C6H7+ + C2H2
    k(3095) = small + (8.50e-11)

    !C6H5+ + O -> C5H5+ + CO
    k(3096) = small + (6.00e-11)

    !C6H5+ + O2 -> C4H5+ + CO + CO
    k(3097) = small + (4.90e-11)

    !C7H4+ + N -> C7H3N+ + H
    k(3098) = small + (1.00e-10)

    !C8H3+ + C -> C9H+ + H2
    k(3099) = small + (5.00e-10)

    !C8H3+ + C -> C9H2+ + H
    k(3100) = small + (5.00e-10)

    !C8H3+ + O -> HCO+ + C7H2
    k(3101) = small + (2.00e-10)

    !C9H2+ + C -> C10+ + H2
    k(3102) = small + (1.00e-09)

    !C9H2+ + N -> C9HN+ + H
    k(3103) = small + (2.00e-10)

    !C9H2+ + O -> HCO+ + C8H
    k(3104) = small + (2.00e-10)

    !C9HN+ + H2 -> C9H2N+ + H
    k(3105) = small + (5.00e-12)

    !C7H5+ + N -> C7H3N+ + H2
    k(3106) = small + (1.00e-10)

    !C9H3+ + N -> C9H2N+ + H
    k(3107) = small + (2.00e-10)

    !C9H3+ + O -> HCO+ + C8H2
    k(3108) = small + (2.00e-10)

    !C8H4N+ + C -> C9H3N+ + H
    k(3109) = small + (1.00e-09)

    !C9H4+ + N -> C9H3N+ + H
    k(3110) = small + (1.00e-10)

    !CO+ + H2 -> HOC+ + H
    k(3111) = small + (7.50e-10)

    !SO2+ + H -> SO+ + OH
    k(3112) = small + (4.20e-10)

    !CN+ + H2 -> HNC+ + H
    k(3113) = small + (7.50e-10)

    !C2N2+ + H -> HNC+ + CN
    k(3114) = small + (5.00e-10)

    !C2N2+ + H -> C2H+ + N2
    k(3115) = small + (1.20e-10)

    !C- + NO -> CN- + O
    k(3116) = small + (1.00e-09)

    !C- + O2 -> O- + CO
    k(3117) = small + (4.00e-10)

    !C- + CO2 -> CO + CO + E
    k(3118) = small + (4.70e-11)

    !H- + H2O -> OH- + H2
    k(3119) = small + (3.80e-09)

    !H- + HCN -> CN- + H2
    k(3120) = small + (3.80e-09)

    !O- + CN -> CN- + O
    k(3121) = small + (1.00e-09)

    !O- + H2 -> OH- + H
    k(3122) = small + (3.00e-11)

    !O- + HCN -> CN- + OH
    k(3123) = small + (1.20e-09)

    !O- + CH4 -> OH- + CH3
    k(3124) = small + (1.00e-10)

    !OH- + CN -> CN- + OH
    k(3125) = small + (1.00e-09)

    !OH- + HCN -> CN- + H2O
    k(3126) = small + (1.20e-09)

    !C+ + H -> CH+
    k(3127) = small + (1.70e-17)

    !C+ + O -> CO+
    k(3128) = small + (2.50e-18)

    !C+ + H2 -> CH2+
    k(3129) = small + (4.00e-16&
        *T32**(-2.00e-01))

    !C+ + C3 -> C4+
    k(3130) = small + (1.00e-13&
        *T32**(-1.00e+00))

    !C+ + C4 -> C5+
    k(3131) = small + (1.00e-09)

    !C+ + C5 -> C6+
    k(3132) = small + (1.00e-09)

    !C+ + C6 -> C7+
    k(3133) = small + (1.00e-09)

    !C+ + C7 -> C8+
    k(3134) = small + (1.00e-09)

    !C+ + C8 -> C9+
    k(3135) = small + (1.00e-09)

    !C+ + C9 -> C10+
    k(3136) = small + (1.00e-09)

    !H+ + H -> H2+
    k(3137) = small + (2.00e-20*T32**(1.00e+00))

    !NA+ + H2 -> NAH2+
    k(3138) = small + (4.00e-19)

    !NA+ + H2O -> NAH2O+
    k(3139) = small + (1.40e-17&
        *T32**(-1.30e+00))

    !P+ + H2 -> PH2+
    k(3140) = small + (7.50e-18&
        *T32**(-1.30e+00))

    !S+ + H2 -> H2S+
    k(3141) = small + (1.00e-17&
        *T32**(-2.00e-01))

    !SI+ + H -> SIH+
    k(3142) = small + (1.00e-17)

    !SI+ + O -> SIO+
    k(3143) = small + (1.00e-17)

    !SI+ + H2 -> SIH2+
    k(3144) = small + (1.00e-15)

    !SI+ + HCN -> SINCH+
    k(3145) = small + (6.00e-15&
        *T32**(-1.50e+00))

    !SI+ + C2H2 -> SIC2H2+
    k(3146) = small + (1.00e-13&
        *T32**(-1.00e+00))

    !SI+ + CH4 -> SICH4+
    k(3147) = small + (4.00e-16&
        *T32**(-1.50e+00))

    !HS+ + H2 -> H3S+
    k(3148) = small + (1.40e-16&
        *T32**(-6.00e-01))

    !NO+ + H2 -> H2NO+
    k(3149) = small + (6.70e-20&
        *T32**(-1.00e+00))

    !PH+ + H2 -> PH3+
    k(3150) = small + (2.40e-17&
        *T32**(-1.40e+00))

    !SIH+ + H2 -> SIH3+
    k(3151) = small + (3.00e-17&
        *T32**(-1.00e+00))

    !C3+ + H -> C3H+
    k(3152) = small + (7.00e-16&
        *T32**(-1.50e+00))

    !HCO+ + H2O -> CH3O2+
    k(3153) = small + (4.00e-13&
        *T32**(-1.30e+00))

    !HCO+ + CH4 -> C2H5O+
    k(3154) = small + (1.00e-17)

    !OCS+ + H2 -> OCS+H2
    k(3155) = small + (6.10e-20&
        *T32**(-1.50e+00))

    !C2H2+ + H -> C2H3+
    k(3156) = small + (7.00e-15&
        *T32**(-1.50e+00))

    !C2H2+ + CO -> H2C3O+
    k(3157) = small + (1.10e-15&
        *T32**(-2.00e+00))

    !C2H2+ + H2 -> C2H4+
    k(3158) = small + (1.50e-14&
        *T32**(-1.00e+00))

    !C2H2+ + HC3N -> C5H3N+
    k(3159) = small + (2.00e-12&
        *T32**(-2.50e+00))

    !C2H2+ + HC5N -> C7H3N+
    k(3160) = small + (2.00e-12&
        *T32**(-2.50e+00))

    !C2H2+ + HC7N -> C9H3N+
    k(3161) = small + (2.00e-12&
        *T32**(-2.50e+00))

    !C3H+ + H -> C3H2+
    k(3162) = small + (1.00e-14&
        *T32**(-1.50e+00))

    !C3H+ + H -> H2C3+
    k(3163) = small + (1.00e-14&
        *T32**(-1.50e+00))

    !C3H+ + CO -> HC4O+
    k(3164) = small + (1.10e-14&
        *T32**(-2.00e+00))

    !C3H+ + H2 -> H3C3+
    k(3165) = small + (1.65e-13&
        *T32**(-1.00e+00))

    !C3H+ + H2 -> C3H3+
    k(3166) = small + (1.65e-13&
        *T32**(-1.00e+00))

    !C3H+ + C2H2 -> C5H3+
    k(3167) = small + (2.90e-12&
        *T32**(-1.00e+00))

    !CH3+ + CO -> C2H3O+
    k(3168) = small + (1.20e-13&
        *T32**(-1.30e+00))

    !CH3+ + H2 -> CH5+
    k(3169) = small + (1.30e-14&
        *T32**(-1.00e+00))

    !CH3+ + H2O -> CH5O+
    k(3170) = small + (2.00e-12)

    !CH3+ + HCN -> C2H4N+
    k(3171) = small + (9.00e-09&
        *invsqrT32)

    !CH3+ + NH3 -> CH6N+
    k(3172) = small + (9.40e-10&
        *T32**(-9.00e-01))

    !CH3+ + HC3N -> C4H4N+
    k(3173) = small + (8.60e-11&
        *T32**(-1.40e+00))

    !CH3+ + CH4O -> CH3OCH4+
    k(3174) = small + (7.80e-12&
        *T32**(-1.10e+00))

    !CH3+ + C2H4O -> C3H6OH+
    k(3175) = small + (5.70e-11&
        *T32**(-6.60e-01))

    !CH3+ + HC5N -> C6H4N+
    k(3176) = small + (8.60e-11&
        *T32**(-1.40e+00))

    !CH3+ + HC7N -> C8H4N+
    k(3177) = small + (8.60e-11&
        *T32**(-1.40e+00))

    !HCNH+ + C2H2 -> C3H4N+
    k(3178) = small + (2.20e-15&
        *T32**(-2.00e+00))

    !H3O+ + C2H2 -> C2H5O+
    k(3179) = small + (2.70e-14&
        *T32**(-1.60e+00))

    !H3O+ + C2H4 -> C2H5OH2+
    k(3180) = small + (2.40e-14&
        *T32**(-2.80e+00))

    !SIC2H+ + H2 -> SIC2H3+
    k(3181) = small + (3.00e-16&
        *T32**(-1.00e+00))

    !SIH3+ + H2 -> SIH5+
    k(3182) = small + (1.00e-18*invsqrT32)

    !C2H3+ + CO -> H3C3O+
    k(3183) = small + (2.00e-15&
        *T32**(-2.50e+00))

    !C3H2+ + H -> C3H3+
    k(3184) = small + (4.00e-15&
        *T32**(-1.50e+00))

    !H2C3+ + H -> H3C3+
    k(3185) = small + (4.00e-15&
        *T32**(-1.50e+00))

    !C4H+ + H -> C4H2+
    k(3186) = small + (6.00e-14&
        *T32**(-1.50e+00))

    !H3CO+ + CH4 -> CH3OCH4+
    k(3187) = small + (1.00e-17)

    !C3H2N+ + C2H2 -> C5H4N+
    k(3188) = small + (1.00e-09)

    !C3H3+ + C4H2 -> C7H5+
    k(3189) = small + (1.00e-13&
        *T32**(-2.50e+00))

    !H3C3+ + C4H2 -> C7H5+
    k(3190) = small + (1.00e-13&
        *T32**(-2.50e+00))

    !C4H2+ + H -> C4H3+
    k(3191) = small + (7.00e-11&
        *T32**(-1.00e-01))

    !C4H2+ + C2H2 -> C6H4+
    k(3192) = small + (1.00e-09)

    !C4H2+ + HC3N -> C7H3N+
    k(3193) = small + (2.00e-12&
        *T32**(-2.50e+00))

    !C4H2+ + C4H2 -> C8H4+
    k(3194) = small + (1.00e-13&
        *T32**(-2.00e+00))

    !C4H2+ + HC5N -> C9H3N+
    k(3195) = small + (2.00e-12&
        *T32**(-2.50e+00))

    !C5H+ + C4H2 -> C9H3+
    k(3196) = small + (1.00e-13&
        *T32**(-2.00e+00))

    !C6+ + H2 -> C6H2+
    k(3197) = small + (5.20e-14*invsqrT32)

    !CH5+ + CO -> C2H5O+
    k(3198) = small + (1.00e-17)

    !C2H5+ + H2O -> C2H5OH2+
    k(3199) = small + (4.10e-16&
        *T32**(-2.40e+00))

    !C4H3+ + H -> C4H4+
    k(3200) = small + (6.00e-14&
        *T32**(-7.00e-01))

    !C4H3+ + C2H2 -> C6H5+
    k(3201) = small + (1.00e-09)

    !C4H3+ + C4H2 -> C8H5+
    k(3202) = small + (1.00e-13&
        *T32**(-2.50e+00))

    !C5H2+ + C4H2 -> C9H4+
    k(3203) = small + (1.00e-13&
        *T32**(-2.00e+00))

    !C5H3+ + C4H2 -> C9H5+
    k(3204) = small + (1.00e-13&
        *T32**(-2.50e+00))

    !C6H2+ + C2H2 -> C8H4+
    k(3205) = small + (1.00e-09)

    !C6H4+ + H -> C6H5+
    k(3206) = small + (3.00e-15&
        *T32**(-1.50e+00))

    !C6H5+ + H2 -> C6H7+
    k(3207) = small + (6.00e-11)

    !C- + C -> C2 + E
    k(3208) = small + (5.00e-10)

    !C- + H -> CH + E
    k(3209) = small + (5.00e-10)

    !C- + N -> CN + E
    k(3210) = small + (5.00e-10)

    !C- + O -> CO + E
    k(3211) = small + (5.00e-10)

    !C- + CH -> C2H + E
    k(3212) = small + (5.00e-10)

    !C- + H2 -> CH2 + E
    k(3213) = small + (1.00e-13)

    !C- + NH -> HCN + E
    k(3214) = small + (5.00e-10)

    !C- + O2 -> CO2 + E
    k(3215) = small + (5.00e-11)

    !C- + OH -> HCO + E
    k(3216) = small + (5.00e-10)

    !C- + CH2 -> C2H2 + E
    k(3217) = small + (5.00e-10)

    !C- + H2O -> H2CO + E
    k(3218) = small + (5.00e-10)

    !H- + C -> CH + E
    k(3219) = small + (1.00e-09)

    !H- + H -> H2 + E
    k(3220) = small + (1.30e-09)

    !H- + N -> NH + E
    k(3221) = small + (1.00e-09)

    !H- + O -> OH + E
    k(3222) = small + (1.00e-09)

    !H- + C2 -> C2H + E
    k(3223) = small + (1.00e-09)

    !H- + CH -> CH2 + E
    k(3224) = small + (1.00e-10)

    !H- + CN -> HCN + E
    k(3225) = small + (1.00e-10)

    !H- + CO -> HCO + E
    k(3226) = small + (5.00e-11)

    !H- + NH -> NH2 + E
    k(3227) = small + (1.00e-10)

    !H- + OH -> H2O + E
    k(3228) = small + (1.00e-10)

    !H- + C2H -> C2H2 + E
    k(3229) = small + (1.00e-09)

    !H- + CH2 -> CH3 + E
    k(3230) = small + (1.00e-09)

    !H- + HCO -> H2CO + E
    k(3231) = small + (1.00e-09)

    !H- + NH2 -> NH3 + E
    k(3232) = small + (1.00e-09)

    !H- + CH3 -> CH4 + E
    k(3233) = small + (1.00e-09)

    !O- + C -> CO + E
    k(3234) = small + (5.00e-10)

    !O- + H -> OH + E
    k(3235) = small + (5.00e-10)

    !O- + N -> NO + E
    k(3236) = small + (2.20e-10)

    !O- + O -> O2 + E
    k(3237) = small + (1.90e-10)

    !O- + CH -> HCO + E
    k(3238) = small + (5.00e-10)

    !O- + CO -> CO2 + E
    k(3239) = small + (6.50e-10)

    !O- + H2 -> H2O + E
    k(3240) = small + (7.00e-10)

    !O- + CH2 -> H2CO + E
    k(3241) = small + (5.00e-10)

    !S- + C -> CS + E
    k(3242) = small + (1.00e-10)

    !S- + H -> HS + E
    k(3243) = small + (1.00e-10)

    !S- + N -> NS + E
    k(3244) = small + (1.00e-10)

    !S- + O -> SO + E
    k(3245) = small + (1.00e-10)

    !S- + CO -> OCS + E
    k(3246) = small + (3.00e-10)

    !S- + O2 -> SO2 + E
    k(3247) = small + (3.00e-11)

    !CN- + H -> HCN + E
    k(3248) = small + (1.30e-09)

    !CN- + CH3 -> C2H3N + E
    k(3249) = small + (1.00e-09)

    !OH- + C -> HCO + E
    k(3250) = small + (5.00e-10)

    !OH- + H -> H2O + E
    k(3251) = small + (1.40e-09)

    !OH- + CH -> H2CO + E
    k(3252) = small + (5.00e-10)

    !OH- + CH3 -> CH4O + E
    k(3253) = small + (1.00e-09)

    !O + CH -> HCO+ + E
    k(3254) = small + (2.00e-11&
        *T32**(4.40e-01))

    !C + CH -> C2 + H
    k(3255) = small + (6.59e-11)

    !C + HS -> CS + H
    k(3256) = small + (1.00e-10)

    !C + NH -> CN + H
    k(3257) = small + (1.20e-10)

    !C + NO -> CN + O
    k(3258) = small + (6.00e-11&
        *T32**(-1.60e-01))

    !C + NO -> CO + N
    k(3259) = small + (9.00e-11&
        *T32**(-1.60e-01))

    !C + NS -> CN + S
    k(3260) = small + (1.50e-10&
        *T32**(-1.60e-01))

    !C + O2 -> CO + O
    k(3261) = small + (4.70e-11&
        *T32**(-3.40e-01))

    !C + OH -> CO + H
    k(3262) = small + (1.00e-10)

    !C + PH -> CP + H
    k(3263) = small + (7.50e-11)

    !C + S2 -> S + CS
    k(3264) = small + (7.00e-11)

    !C + SIH -> SIC + H
    k(3265) = small + (6.59e-11)

    !C + SO -> CO + S
    k(3266) = small + (3.50e-11)

    !C + SO -> CS + O
    k(3267) = small + (3.50e-11)

    !C + CH2 -> C2H + H
    k(3268) = small + (1.00e-10)

    !C + HCO -> CH + CO
    k(3269) = small + (1.00e-10)

    !C + HCO -> CCO + H
    k(3270) = small + (1.00e-10)

    !C + C2N -> C2 + CN
    k(3271) = small + (1.00e-10)

    !C + C2H -> C3 + H
    k(3272) = small + (1.00e-10)

    !C + CCO -> C2 + CO
    k(3273) = small + (2.00e-10)

    !C + NH2 -> HNC + H
    k(3274) = small + (3.40e-11&
        *T32**(-3.60e-01))

    !C + NH2 -> HCN + H
    k(3275) = small + (3.40e-11&
        *T32**(-3.60e-01))

    !C + OCN -> CO + CN
    k(3276) = small + (1.00e-10)

    !C + SIH2 -> HCSI + H
    k(3277) = small + (1.00e-10)

    !C + SO2 -> CO + SO
    k(3278) = small + (7.00e-11)

    !C + CH3 -> C2H2 + H
    k(3279) = small + (1.00e-10)

    !C + C2H2 -> C3H + H
    k(3280) = small + (7.25e-11&
        *T32**(-1.20e-01))

    !C + C2H2 -> HC3 + H
    k(3281) = small + (7.25e-11&
        *T32**(-1.20e-01))

    !C + C2H2 -> C3 + H2
    k(3282) = small + (1.45e-10&
        *T32**(-1.20e-01))

    !C + H2CN -> C2N + H2
    k(3283) = small + (2.00e-10)

    !C + SIH3 -> SICH2 + H
    k(3284) = small + (1.00e-10)

    !C + C2H4 -> C3H3 + H
    k(3285) = small + (3.10e-10&
        *T32**(-7.00e-02))

    !C + HCNC2 -> C3 + HCN
    k(3286) = small + (2.00e-10)

    !C + HNC3 -> C3 + HNC
    k(3287) = small + (2.00e-10)

    !C + C2H2N -> HC3N + H
    k(3288) = small + (1.00e-10)

    !C + C2H3 -> C3H2 + H
    k(3289) = small + (5.00e-11)

    !C + C2H3 -> H2C3 + H
    k(3290) = small + (5.00e-11)

    !C + C3H -> C4 + H
    k(3291) = small + (1.00e-10)

    !C + HC3 -> C4 + H
    k(3292) = small + (1.00e-10)

    !C + C3H2 -> C4H + H
    k(3293) = small + (1.00e-10)

    !C + H2C3 -> C4H + H
    k(3294) = small + (1.00e-10)

    !C + C3N -> C3 + CN
    k(3295) = small + (1.00e-13)

    !C + C3O -> C3 + CO
    k(3296) = small + (1.00e-10)

    !C + C3H3 -> C4H2 + H
    k(3297) = small + (1.00e-10)

    !C + C3H4 -> C4H3 + H
    k(3298) = small + (2.70e-10&
        *T32**(-1.10e-01))

    !C + C2H5 -> C3H4 + H
    k(3299) = small + (2.00e-10)

    !C + C4H -> C5 + H
    k(3300) = small + (1.00e-10)

    !C + C4H2 -> C5H + H
    k(3301) = small + (6.50e-10)

    !C + C4H3 -> C5H2 + H
    k(3302) = small + (3.00e-10)

    !C + C5H -> C6 + H
    k(3303) = small + (1.00e-10)

    !C + C5N -> C5 + CN
    k(3304) = small + (1.00e-13)

    !C + C5H2 -> C6H + H
    k(3305) = small + (5.30e-10)

    !C + C6H -> C7 + H
    k(3306) = small + (2.00e-10)

    !C + C6H2 -> C7H + H
    k(3307) = small + (7.40e-10)

    !C + C7H -> C8 + H
    k(3308) = small + (2.00e-10)

    !C + C7N -> C7 + CN
    k(3309) = small + (1.00e-13)

    !C + C7H2 -> C8H + H
    k(3310) = small + (8.40e-10)

    !C + C8H -> C9 + H
    k(3311) = small + (2.00e-10)

    !C + C8H2 -> C9H + H
    k(3312) = small + (9.00e-10)

    !C + C9H -> C10 + H
    k(3313) = small + (2.00e-10)

    !C + C9N -> C9 + CN
    k(3314) = small + (1.00e-13)

    !C + CH3C4H -> C6H2 + H2
    k(3315) = small + (5.30e-10)

    !C + CH3C6H -> C8H2 + H2
    k(3316) = small + (7.40e-10)

    !C + C4 -> C2 + C3
    k(3317) = small + (1.00e-10)

    !C + C5 -> C3 + C3
    k(3318) = small + (3.00e-10)

    !C + C6 -> C2 + C5
    k(3319) = small + (5.00e-11)

    !C + C6 -> C3 + C4
    k(3320) = small + (5.00e-11)

    !C + C7 -> C3 + C5
    k(3321) = small + (3.00e-10)

    !C + C8 -> C4 + C5
    k(3322) = small + (3.00e-11)

    !C + C8 -> C3 + C6
    k(3323) = small + (3.00e-11)

    !C + C8 -> C2 + C7
    k(3324) = small + (3.00e-11)

    !C + CH2 -> CH + CH
    k(3325) = small + (2.69e-12&
        *exp(-2.36e+04&
        /Tgas))

    !C + NH2 -> CH + NH
    k(3326) = small + (9.61e-13&
        *exp(-1.05e+04&
        /Tgas))

    !C + CN -> C2 + N
    k(3327) = small + (4.98e-10&
        *exp(-1.81e+04&
        /Tgas))

    !C + N2 -> CN + N
    k(3328) = small + (8.70e-11&
        *exp(-2.26e+04&
        /Tgas))

    !C + CO -> C2 + O
    k(3329) = small + (1.00e-10&
        *exp(-5.28e+04&
        /Tgas))

    !H + HS -> S + H2
    k(3330) = small + (2.50e-11)

    !H + HCO -> H2 + CO
    k(3331) = small + (1.50e-10)

    !H + HCO -> O + CH2
    k(3332) = small + (6.61e-11&
        *exp(-5.16e+04&
        /Tgas))

    !H + C2H3 -> C2H2 + H2
    k(3333) = small + (2.00e-11)

    !H + H2CN -> H2 + HCN
    k(3334) = small + (1.00e-10)

    !H + HCNC2 -> HC2NC + H
    k(3335) = small + (1.00e-11)

    !H + HNC3 -> HC3N + H
    k(3336) = small + (1.00e-11)

    !H + CH -> C + H2
    k(3337) = small + (2.70e-11&
        *T32**(3.80e-01))

    !H + CH2 -> CH + H2
    k(3338) = small + (2.70e-10)

    !H + CH3 -> CH2 + H2
    k(3339) = small + (1.00e-10&
        *exp(-7.60e+03&
        /Tgas))

    !H + CH4 -> CH3 + H2
    k(3340) = small + (7.34e-12&
        *exp(-4.41e+03&
        /Tgas))

    !H + OH -> O + H2
    k(3341) = small + (6.86e-14&
        *T32**(2.80e+00)*exp(-1.95e+03&
        /Tgas))

    !H + NH3 -> NH2 + H2
    k(3342) = small + (6.54e-13&
        *T32**(2.76e+00)*exp(-5.17e+03&
        /Tgas))

    !H + H2O -> OH + H2
    k(3343) = small + (6.82e-12&
        *T32**(1.60e+00)*exp(-9.72e+03&
        /Tgas))

    !H + HCN -> CN + H2
    k(3344) = small + (6.19e-10&
        *exp(-1.25e+04&
        /Tgas))

    !H + NO -> O + NH
    k(3345) = small + (9.30e-10&
        *T32**(-1.00e-01)*exp(-3.52e+04&
        /Tgas))

    !H + NO -> N + OH
    k(3346) = small + (3.60e-10&
        *exp(-2.49e+04&
        /Tgas))

    !H + H2CO -> HCO + H2
    k(3347) = small + (2.14e-12&
        *T32**(1.62e+00)*exp(-1.09e+03&
        /Tgas))

    !H + HNO -> NH2 + O
    k(3348) = small + (1.05e-09&
        *T32**(-3.00e-01)*exp(-1.47e+04&
        /Tgas))

    !H + HNO -> OH + NH
    k(3349) = small + (2.41e-09*invsqrT32&
        *exp(-9.01e+03&
        /Tgas))

    !H + O2 -> OH + O
    k(3350) = small + (2.94e-10&
        *exp(-8.38e+03&
        /Tgas))

    !H + O2H -> O2 + H2
    k(3351) = small + (5.60e-12)

    !H + O2H -> OH + OH
    k(3352) = small + (7.21e-11)

    !H + O2H -> H2O + O
    k(3353) = small + (2.42e-12)

    !H + H2O2 -> H2O + OH
    k(3354) = small + (1.69e-11&
        *exp(-1.80e+03&
        /Tgas))

    !H + H2O2 -> O2H + H2
    k(3355) = small + (2.81e-12&
        *exp(-1.89e+03&
        /Tgas))

    !H + H2S -> HS + H2
    k(3356) = small + (6.60e-11&
        *exp(-1.35e+03&
        /Tgas))

    !H + CO2 -> CO + OH
    k(3357) = small + (2.51e-10&
        *exp(-1.33e+04&
        /Tgas))

    !H + N2O -> OH + N2
    k(3358) = small + (9.22e-14&
        *exp(-2.99e+03&
        /Tgas))

    !H + NO2 -> NO + OH
    k(3359) = small + (4.00e-10&
        *exp(-3.40e+02&
        /Tgas))

    !H + OCS -> CO + HS
    k(3360) = small + (1.23e-11&
        *exp(-1.95e+03&
        /Tgas))

    !H2 + C -> CH + H
    k(3361) = small + (6.64e-10&
        *exp(-1.17e+04&
        /Tgas))

    !H2 + CH -> CH2 + H
    k(3362) = small + (3.75e-10&
        *exp(-1.66e+03&
        /Tgas))

    !H2 + CH2 -> CH3 + H
    k(3363) = small + (5.00e-11&
        *exp(-4.87e+03&
        /Tgas))

    !H2 + CH3 -> CH4 + H
    k(3364) = small + (2.51e-13&
        *exp(-4.21e+03&
        /Tgas))

    !H2 + O -> OH + H
    k(3365) = small + (3.44e-13&
        *T32**(2.67e+00)*exp(-3.16e+03&
        /Tgas))

    !H2 + OH -> H2O + H
    k(3366) = small + (8.40e-13&
        *exp(-1.04e+03&
        /Tgas))

    !H2 + N -> NH + H
    k(3367) = small + (4.65e-10&
        *exp(-1.66e+04&
        /Tgas))

    !H2 + NH -> NH2 + H
    k(3368) = small + (5.96e-11&
        *exp(-7.78e+03&
        /Tgas))

    !H2 + NH2 -> NH3 + H
    k(3369) = small + (1.76e-13&
        *T32**(2.23e+00)*exp(-3.61e+03&
        /Tgas))

    !H2 + O2H -> H2O2 + H
    k(3370) = small + (4.38e-12&
        *exp(-1.08e+04&
        /Tgas))

    !N + C2 -> CN + C
    k(3371) = small + (5.00e-11)

    !N + CH -> CN + H
    k(3372) = small + (1.66e-10&
        *T32**(-9.00e-02))

    !N + CN -> C + N2
    k(3373) = small + (3.00e-10)

    !N + HS -> NS + H
    k(3374) = small + (1.00e-10)

    !N + NH -> N2 + H
    k(3375) = small + (5.00e-11)

    !N + NO -> N2 + O
    k(3376) = small + (3.00e-11&
        *T32**(-6.00e-01))

    !N + NS -> N2 + S
    k(3377) = small + (3.00e-11&
        *T32**(-6.00e-01))

    !N + OH -> NO + H
    k(3378) = small + (7.50e-11&
        *T32**(-1.80e-01))

    !N + O2 -> NO + O
    k(3379) = small + (1.50e-11&
        *exp(-3.68e+03&
        /Tgas))

    !N + PH -> PN + H
    k(3380) = small + (5.00e-11)

    !N + PO -> PN + O
    k(3381) = small + (3.00e-11&
        *T32**(-6.00e-01))

    !N + SIC -> CN + SI
    k(3382) = small + (5.00e-11)

    !N + SIC -> SIN + C
    k(3383) = small + (5.00e-11)

    !N + SIH -> SIN + H
    k(3384) = small + (1.66e-10&
        *T32**(-9.00e-02))

    !N + SO -> NO + S
    k(3385) = small + (1.50e-11&
        *exp(-3.68e+03&
        /Tgas))

    !N + CH2 -> HCN + H
    k(3386) = small + (3.95e-11&
        *T32**(1.67e-01))

    !N + CH2 -> HNC + H
    k(3387) = small + (3.95e-11&
        *T32**(1.67e-01))

    !N + HCO -> OCN + H
    k(3388) = small + (1.00e-10)

    !N + HCS -> HCN + S
    k(3389) = small + (1.00e-10)

    !N + NO2 -> N2 + O2
    k(3390) = small + (1.00e-12)

    !N + NO2 -> NO + NO
    k(3391) = small + (1.00e-12)

    !N + NO2 -> N2O + O
    k(3392) = small + (2.10e-11)

    !N + O2H -> NH + O2
    k(3393) = small + (1.70e-13)

    !N + SIH2 -> HNSI + H
    k(3394) = small + (8.00e-11&
        *T32**(1.67e-01))

    !N + C2H -> C2N + H
    k(3395) = small + (1.70e-11)

    !N + C2N -> CN + CN
    k(3396) = small + (1.00e-10)

    !N + CCO -> CN + CO
    k(3397) = small + (5.50e-10)

    !N + C3 -> CN + C2
    k(3398) = small + (1.00e-13)

    !N + C3H -> C3N + H
    k(3399) = small + (1.00e-13)

    !N + HC3 -> C3N + H
    k(3400) = small + (1.70e-11)

    !N + C3N -> CN + C2N
    k(3401) = small + (1.00e-10)

    !N + CH3 -> HCN + H + H
    k(3402) = small + (3.32e-13)

    !N + CH3 -> H2CN + H
    k(3403) = small + (8.60e-11)

    !N + H2CN -> NH + HCN
    k(3404) = small + (3.70e-11)

    !N + SIH3 -> HNSI + H2
    k(3405) = small + (1.00e-10)

    !N + C2H3 -> C2H2N + H
    k(3406) = small + (6.20e-11)

    !N + C2H3 -> C2H2 + NH
    k(3407) = small + (1.20e-11)

    !N + C3H2 -> HC3N + H
    k(3408) = small + (1.70e-11)

    !N + H2C3 -> HC3N + H
    k(3409) = small + (1.00e-13)

    !N + C3H3 -> HC3N + H2
    k(3410) = small + (8.00e-11)

    !N + C4 -> C3 + CN
    k(3411) = small + (5.00e-11)

    !N + C5 -> CN + C4
    k(3412) = small + (1.00e-13)

    !N + C4H -> C4N + H
    k(3413) = small + (1.70e-11)

    !N + C4N -> CN + C3N
    k(3414) = small + (1.00e-10)

    !N + C5H -> C5N + H
    k(3415) = small + (1.70e-11)

    !N + C5N -> CN + C4N
    k(3416) = small + (1.00e-10)

    !N + C2H5 -> H2CN + CH3
    k(3417) = small + (3.85e-11)

    !N + C2H5 -> C2H4 + NH
    k(3418) = small + (7.15e-11)

    !N + C5H2 -> HC5N + H
    k(3419) = small + (1.00e-13)

    !N + C6 -> CN + C5
    k(3420) = small + (5.00e-11)

    !N + C6H -> CN + C5H
    k(3421) = small + (1.00e-13)

    !N + C7 -> CN + C6
    k(3422) = small + (1.00e-13)

    !N + C7H -> C7N + H
    k(3423) = small + (1.70e-11)

    !N + C7H2 -> HC7N + H
    k(3424) = small + (1.00e-13)

    !N + C7N -> C2N + C5N
    k(3425) = small + (1.00e-10)

    !N + C8 -> CN + C7
    k(3426) = small + (5.00e-11)

    !N + C8H -> CN + C7H
    k(3427) = small + (1.00e-10)

    !N + C9 -> CN + C8
    k(3428) = small + (1.00e-13)

    !N + C9H -> C9N + H
    k(3429) = small + (1.70e-11)

    !N + C9N -> C2N + C7N
    k(3430) = small + (1.00e-10)

    !O + C2 -> CO + C
    k(3431) = small + (1.00e-10)

    !O + CCL -> CLO + C
    k(3432) = small + (1.38e-10&
        *exp(-1.60e+04&
        /Tgas))

    !O + CCL -> CL + CO
    k(3433) = small + (9.96e-11)

    !O + CH -> CO + H
    k(3434) = small + (6.60e-11)

    !O + CLO -> CL + O2
    k(3435) = small + (4.00e-11)

    !O + CN -> CO + N
    k(3436) = small + (4.00e-11)

    !O + CP -> P + CO
    k(3437) = small + (4.00e-11)

    !O + CS -> CO + S
    k(3438) = small + (1.94e-11&
        *exp(-2.31e+02&
        /Tgas))

    !O + HS -> SO + H
    k(3439) = small + (1.60e-10*sqrT32)

    !O + NH -> NO + H
    k(3440) = small + (1.16e-10)

    !O + NH -> OH + N
    k(3441) = small + (1.16e-11)

    !O + NS -> NO + S
    k(3442) = small + (1.00e-10)

    !O + NS -> SO + N
    k(3443) = small + (1.00e-11)

    !O + OH -> O2 + H
    k(3444) = small + (7.50e-11&
        *T32**(-2.50e-01))

    !O + PH -> PO + H
    k(3445) = small + (1.00e-10)

    !O + S2 -> SO + S
    k(3446) = small + (1.70e-11)

    !O + SIC -> CO + SI
    k(3447) = small + (5.00e-11)

    !O + SIC -> SIO + C
    k(3448) = small + (5.00e-11)

    !O + SIH -> SIO + H
    k(3449) = small + (1.00e-10)

    !O + SIN -> NO + SI
    k(3450) = small + (5.00e-11)

    !O + SIN -> SIO + N
    k(3451) = small + (5.00e-11)

    !O + C2H -> CO + CH
    k(3452) = small + (1.70e-11)

    !O + C2N -> CO + CN
    k(3453) = small + (6.00e-12)

    !O + CCO -> CO + CO
    k(3454) = small + (8.60e-11)

    !O + CCP -> CP + CO
    k(3455) = small + (6.00e-12)

    !O + CH2 -> CO + H + H
    k(3456) = small + (1.20e-10)

    !O + CH2 -> CO + H2
    k(3457) = small + (8.00e-11)

    !O + HCO -> H + CO2
    k(3458) = small + (5.00e-11)

    !O + HCO -> OH + CO
    k(3459) = small + (5.00e-11)

    !O + HCN -> OCN + H
    k(3460) = small + (3.61e-13&
        *T32**(2.10e+00)*exp(-3.08e+03&
        /Tgas))

    !O + HCP -> CO + PH
    k(3461) = small + (3.61e-13&
        *T32**(2.10e+00)*exp(-3.08e+03&
        /Tgas))

    !O + HCS -> OCS + H
    k(3462) = small + (5.00e-11)

    !O + HCS -> OH + CS
    k(3463) = small + (5.00e-11)

    !O + HCSI -> SIO + CH
    k(3464) = small + (2.00e-11)

    !O + H2S -> HS + OH
    k(3465) = small + (9.22e-12&
        *exp(-1.80e+03&
        /Tgas))

    !O + HNO -> OH + NO
    k(3466) = small + (3.80e-11)

    !O + HNO -> NO2 + H
    k(3467) = small + (1.00e-12)

    !O + HPO -> PO + OH
    k(3468) = small + (3.80e-11)

    !O + NH2 -> NH + OH
    k(3469) = small + (2.00e-11)

    !O + NH2 -> HNO + H
    k(3470) = small + (8.00e-11)

    !O + NH2 -> NO + H2
    k(3471) = small + (1.00e-11)

    !O + NO2 -> NO + O2
    k(3472) = small + (1.00e-11)

    !O + O2H -> OH + O2
    k(3473) = small + (5.30e-11)

    !O + OCN -> NO + CO
    k(3474) = small + (1.50e-11&
        *exp(-2.00e+02&
        /Tgas))

    !O + OCN -> CN + O2
    k(3475) = small + (4.05e-10&
        *T32**(-1.43e+00)*exp(-3.50e+03&
        /Tgas))

    !O + PH2 -> HPO + H
    k(3476) = small + (8.00e-11)

    !O + PH2 -> PH + OH
    k(3477) = small + (2.00e-11)

    !O + C3 -> CO + C2
    k(3478) = small + (5.00e-12&
        *exp(-9.00e+02&
        /Tgas))

    !O + SIC2 -> SIC + CO
    k(3479) = small + (4.00e-11)

    !O + SIH2 -> SIO + H + H
    k(3480) = small + (1.20e-10)

    !O + SIH2 -> SIO + H2
    k(3481) = small + (8.00e-11)

    !O + SINC -> SIN + CO
    k(3482) = small + (1.00e-11)

    !O + C2H3 -> C2H2O + H
    k(3483) = small + (1.60e-10)

    !O + C2H5 -> C2H4O + H
    k(3484) = small + (1.33e-10)

    !O + C2H5 -> H2CO + CH3
    k(3485) = small + (2.65e-11)

    !O + C3H -> C2H + CO
    k(3486) = small + (1.70e-11)

    !O + HC3 -> C2H + CO
    k(3487) = small + (1.70e-11)

    !O + C3N -> CO + C2N
    k(3488) = small + (4.00e-11)

    !O + C3O -> CCO + CO
    k(3489) = small + (5.00e-12&
        *exp(-9.00e+02&
        /Tgas))

    !O + C3P -> CCP + CO
    k(3490) = small + (4.00e-11)

    !O + C4 -> CO + C3
    k(3491) = small + (5.00e-11)

    !O + CH3 -> H2CO + H
    k(3492) = small + (1.40e-10)

    !O + H2CN -> OCN + H2
    k(3493) = small + (1.00e-10)

    !O + HCCP -> HCP + CO
    k(3494) = small + (4.00e-11)

    !O + SIC3 -> SIC2 + CO
    k(3495) = small + (4.00e-11)

    !O + SIH3 -> H2SIO + H
    k(3496) = small + (1.40e-10)

    !O + H2C3 -> C2H2 + CO
    k(3497) = small + (1.00e-10)

    !O + C5 -> CO + C4
    k(3498) = small + (5.00e-12&
        *exp(-9.00e+02&
        /Tgas))

    !O + C4H -> C3H + CO
    k(3499) = small + (8.50e-12)

    !O + C4H -> HC3 + CO
    k(3500) = small + (8.50e-12)

    !O + C4N -> C3N + CO
    k(3501) = small + (6.00e-12)

    !O + C4P -> C3P + CO
    k(3502) = small + (1.00e-11)

    !O + CH2PH -> PH2 + CO + H
    k(3503) = small + (4.00e-11)

    !O + SIC4 -> SIC3 + CO
    k(3504) = small + (4.00e-11)

    !O + C5H -> CO + C4H
    k(3505) = small + (1.70e-11)

    !O + C5N -> C4N + CO
    k(3506) = small + (4.00e-11)

    !O + C6 -> CO + C5
    k(3507) = small + (5.00e-11)

    !O + C6H -> CO + C5H
    k(3508) = small + (1.70e-11)

    !O + C7 -> CO + C6
    k(3509) = small + (5.00e-12&
        *exp(-9.00e+02&
        /Tgas))

    !O + C7H -> CO + C6H
    k(3510) = small + (1.70e-11)

    !O + C7N -> OCN + C6
    k(3511) = small + (4.00e-11)

    !O + C8 -> CO + C7
    k(3512) = small + (5.00e-11)

    !O + C8H -> CO + C7H
    k(3513) = small + (1.70e-11)

    !O + C9 -> CO + C8
    k(3514) = small + (5.00e-12&
        *exp(-9.00e+02&
        /Tgas))

    !O + C9H -> CO + C8H
    k(3515) = small + (1.70e-11)

    !O + C9N -> OCN + C8
    k(3516) = small + (4.00e-11)

    !O + C10 -> CO + C9
    k(3517) = small + (5.00e-11)

    !O + C11 -> CO + C10
    k(3518) = small + (5.00e-11)

    !S + C2 -> CS + C
    k(3519) = small + (1.00e-10)

    !S + CH -> CS + H
    k(3520) = small + (5.00e-11)

    !S + NH -> NS + H
    k(3521) = small + (1.00e-10)

    !S + HS -> S2 + H
    k(3522) = small + (4.50e-11)

    !S + O2 -> SO + O
    k(3523) = small + (2.30e-12)

    !S + OH -> SO + H
    k(3524) = small + (6.60e-11)

    !S + CH2 -> HCS + H
    k(3525) = small + (1.00e-10)

    !S + CH2 -> CS + H2
    k(3526) = small + (1.00e-10)

    !S + CH3 -> H2CS + H
    k(3527) = small + (1.40e-10)

    !SI + O2 -> SIO + O
    k(3528) = small + (1.72e-10&
        *T32**(-5.30e-01)*exp(-1.70e+01&
        /Tgas))

    !SI + NO -> SIO + N
    k(3529) = small + (9.00e-11&
        *T32**(-9.60e-01)*exp(-2.80e+01&
        /Tgas))

    !SI + OH -> SIO + H
    k(3530) = small + (1.00e-10)

    !SI + CH2 -> HCSI + H
    k(3531) = small + (1.00e-10)

    !SI + CH3 -> SICH2 + H
    k(3532) = small + (1.00e-10)

    !SI + C2H2 -> SIC2H + H
    k(3533) = small + (2.70e-10&
        *T32**(-1.10e-01))

    !SI + C3H4 -> SIC3H3 + H
    k(3534) = small + (2.70e-10&
        *T32**(-1.10e-01))

    !SI + C4H2 -> SIC4H + H
    k(3535) = small + (2.70e-10&
        *T32**(-1.10e-01))

    !SI + C6H2 -> SIC6H + H
    k(3536) = small + (2.70e-10&
        *T32**(-1.10e-01))

    !SI + C8H2 -> SIC8H + H
    k(3537) = small + (2.70e-10&
        *T32**(-1.10e-01))

    !SI + C2H4 -> SIC2H3 + H
    k(3538) = small + (2.40e-10&
        *T32**(-1.20e-01))

    !SI + C3H6 -> SIC3H5 + H
    k(3539) = small + (2.40e-10&
        *T32**(-1.20e-01))

    !F + H2 -> HF + H
    k(3540) = small + (1.00e-10&
        *T32**(2.26e-01)*exp(2.98e+01&
        /Tgas))

    !F + CH -> HF + C
    k(3541) = small + (1.60e-10)

    !F + OH -> HF + O
    k(3542) = small + (1.60e-10)

    !F + H2O -> HF + OH
    k(3543) = small + (1.60e-10)

    !CH + NO -> HCN + O
    k(3544) = small + (1.20e-11&
        *T32**(-1.30e-01))

    !CH + O2 -> CO + OH
    k(3545) = small + (3.80e-11&
        *T32**(-4.80e-01))

    !CH + HNO -> NO + CH2
    k(3546) = small + (1.73e-11)

    !CH + CH4 -> C2H4 + H
    k(3547) = small + (2.23e-12)

    !CH + C2H2 -> C3H2 + H
    k(3548) = small + (4.20e-10&
        *T32**(-2.30e-01)*exp(-1.60e+01&
        /Tgas))

    !CH + C3H4 -> C4H4 + H
    k(3549) = small + (4.20e-10&
        *T32**(-2.30e-01)*exp(-1.60e+01&
        /Tgas))

    !CH + C4H2 -> C5H2 + H
    k(3550) = small + (4.20e-10&
        *T32**(-2.30e-01)*exp(-1.60e+01&
        /Tgas))

    !CH + C6H2 -> C7H2 + H
    k(3551) = small + (4.20e-10&
        *T32**(-2.30e-01)*exp(-1.60e+01&
        /Tgas))

    !CH + C2H4 -> C3H4 + H
    k(3552) = small + (3.45e-10&
        *T32**(-5.50e-01)*exp(-2.96e+01&
        /Tgas))

    !CH + C3H6 -> C4H6 + H
    k(3553) = small + (3.45e-10&
        *T32**(-5.50e-01)*exp(-2.96e+01&
        /Tgas))

    !CH + C3 -> C4 + H
    k(3554) = small + (4.00e-10)

    !CH + C5 -> C6 + H
    k(3555) = small + (4.00e-10)

    !CH + C7 -> C8 + H
    k(3556) = small + (4.00e-10)

    !CH + C9 -> C10 + H
    k(3557) = small + (4.00e-10)

    !CH + C2 -> C3 + H
    k(3558) = small + (1.00e-10)

    !CH + C4 -> C5 + H
    k(3559) = small + (1.00e-10)

    !CH + C6 -> C7 + H
    k(3560) = small + (1.00e-10)

    !CH + C8 -> C9 + H
    k(3561) = small + (1.00e-10)

    !CH + HC3N -> HC4N + H
    k(3562) = small + (3.45e-10&
        *T32**(-5.50e-01)*exp(-2.96e+01&
        /Tgas))

    !CH + HC5N -> HC6N + H
    k(3563) = small + (3.45e-10&
        *T32**(-5.50e-01)*exp(-2.96e+01&
        /Tgas))

    !CH + HC7N -> HC8N + H
    k(3564) = small + (3.45e-10&
        *T32**(-5.50e-01)*exp(-2.96e+01&
        /Tgas))

    !CH + HC9N -> HC10N + H
    k(3565) = small + (3.45e-10&
        *T32**(-5.50e-01)*exp(-2.96e+01&
        /Tgas))

    !CH + HC11N -> HC12N + H
    k(3566) = small + (3.45e-10&
        *T32**(-5.50e-01)*exp(-2.96e+01&
        /Tgas))

    !C2 + C2H2 -> C4H + H
    k(3567) = small + (1.00e-10)

    !C2 + C2H4 -> C4H3 + H
    k(3568) = small + (1.00e-10)

    !C2 + C4H2 -> C6H + H
    k(3569) = small + (1.00e-10)

    !C2 + C6H2 -> C8H + H
    k(3570) = small + (1.00e-10)

    !CN + NO -> N2 + CO
    k(3571) = small + (1.60e-13)

    !CN + O2 -> O + OCN
    k(3572) = small + (2.40e-11&
        *T32**(-6.00e-01))

    !CN + HCO -> HCN + CO
    k(3573) = small + (1.00e-10)

    !CN + OH -> OCN + H
    k(3574) = small + (7.01e-11)

    !CN + OH -> HCN + O
    k(3575) = small + (1.00e-11&
        *exp(-1.00e+03&
        /Tgas))

    !CN + HNO -> NO + HCN
    k(3576) = small + (3.00e-11)

    !CN + C2H2 -> HC3N + H
    k(3577) = small + (2.72e-10&
        *T32**(-5.20e-01)*exp(-1.90e+01&
        /Tgas))

    !CN + NH3 -> NH2 + HCN
    k(3578) = small + (1.38e-11&
        *T32**(-1.14e+00))

    !CN + NH3 -> NH2CN + H
    k(3579) = small + (1.30e-11&
        *T32**(-1.11e+00))

    !CN + C2H4 -> C3H3N + H
    k(3580) = small + (2.67e-10&
        *T32**(-6.90e-01)*exp(-3.10e+01&
        /Tgas))

    !CN + C4H2 -> HC5N + H
    k(3581) = small + (2.72e-10&
        *T32**(-5.20e-01)*exp(-1.90e+01&
        /Tgas))

    !CN + C6H2 -> HC7N + H
    k(3582) = small + (2.72e-10&
        *T32**(-5.20e-01)*exp(-1.90e+01&
        /Tgas))

    !CN + C8H2 -> HC9N + H
    k(3583) = small + (2.72e-10&
        *T32**(-5.20e-01)*exp(-1.90e+01&
        /Tgas))

    !CN + HC3N -> NC4N + H
    k(3584) = small + (2.70e-10&
        *T32**(-5.20e-01)*exp(-1.90e+01&
        /Tgas))

    !CN + HC5N -> NC6N + H
    k(3585) = small + (2.70e-10&
        *T32**(-5.20e-01)*exp(-1.90e+01&
        /Tgas))

    !CN + HC7N -> NC8N + H
    k(3586) = small + (2.70e-10&
        *T32**(-5.20e-01)*exp(-1.90e+01&
        /Tgas))

    !CN + HC9N -> NC10N + H
    k(3587) = small + (2.70e-10&
        *T32**(-5.20e-01)*exp(-1.90e+01&
        /Tgas))

    !CN + HC11N -> NC12N + H
    k(3588) = small + (2.70e-10&
        *T32**(-5.20e-01)*exp(-1.90e+01&
        /Tgas))

    !CO + OH -> CO2 + H
    k(3589) = small + (2.81e-13&
        *exp(-1.76e+02&
        /Tgas))

    !CO + HNO -> NH + CO2
    k(3590) = small + (3.32e-12&
        *exp(-6.17e+03&
        /Tgas))

    !HS + HS -> H2S + S
    k(3591) = small + (3.00e-11)

    !NH + NH -> N2 + H + H
    k(3592) = small + (1.00e-10)

    !NH + NO -> N2O + H
    k(3593) = small + (3.12e-11)

    !NO + NH2 -> N2 + H2O
    k(3594) = small + (1.70e-11)

    !OH + SIO -> SIO2 + H
    k(3595) = small + (2.00e-12)

    !OH + SO -> SO2 + H
    k(3596) = small + (8.60e-11)

    !OH + OH -> H2O + O
    k(3597) = small + (1.65e-12&
        *T32**(1.14e+00)*exp(-5.00e+01&
        /Tgas))

    !OH + CH2 -> H2CO + H
    k(3598) = small + (3.00e-10)

    !OH + H2S -> H2O + HS
    k(3599) = small + (6.00e-12&
        *exp(-7.50e+01&
        /Tgas))

    !OH + HCO -> H2O + CO
    k(3600) = small + (1.69e-10)

    !OH + HNO -> H2O + NO
    k(3601) = small + (8.00e-11&
        *exp(-5.00e+02&
        /Tgas))

    !OH + NH2 -> NH + H2O
    k(3602) = small + (1.50e-12)

    !OH + NH2 -> NH3 + O
    k(3603) = small + (9.18e-14)

    !OH + O2H -> H2O + O2
    k(3604) = small + (1.20e-10)

    !OH + H2CO -> HCO + H2O
    k(3605) = small + (1.00e-11)

    !OH + H2CO -> CH2O2 + H
    k(3606) = small + (2.01e-13)

    !OH + H2O2 -> H2O + O2H
    k(3607) = small + (2.91e-12&
        *exp(-1.60e+02&
        /Tgas))

    !OH + C2H3 -> C2H2 + H2O
    k(3608) = small + (1.00e-10)

    !OH + C2H5 -> C2H4 + H2O
    k(3609) = small + (4.00e-11)

    !C2H + S -> C2S + H
    k(3610) = small + (1.70e-11)

    !C2H + CS -> C3S + H
    k(3611) = small + (1.70e-11)

    !C2H + O2 -> HCO + CO
    k(3612) = small + (4.20e-11&
        *T32**(-3.20e-01))

    !C2H + HCN -> HC3N + H
    k(3613) = small + (5.30e-12&
        *exp(-7.70e+02&
        /Tgas))

    !C2H + HNC -> HC3N + H
    k(3614) = small + (5.30e-12&
        *exp(-7.70e+02&
        /Tgas))

    !C2H + C2H2 -> C4H2 + H
    k(3615) = small + (1.06e-10&
        *T32**(-2.50e-01))

    !C2H + C3H2 -> C5H2 + H
    k(3616) = small + (1.06e-10&
        *T32**(-2.50e-01))

    !C2H + H2C3 -> C5H2 + H
    k(3617) = small + (1.06e-10&
        *T32**(-2.50e-01))

    !C2H + C4H2 -> C6H2 + H
    k(3618) = small + (1.06e-10&
        *T32**(-2.50e-01))

    !C2H + C5H2 -> C7H2 + H
    k(3619) = small + (1.06e-10&
        *T32**(-2.50e-01))

    !C2H + C6H2 -> C8H2 + H
    k(3620) = small + (1.06e-10&
        *T32**(-2.50e-01))

    !C2H + C7H2 -> C9H2 + H
    k(3621) = small + (1.06e-10&
        *T32**(-2.50e-01))

    !C2H + C3 -> C5 + H
    k(3622) = small + (2.00e-10&
        *T32**(-2.50e-01))

    !C2H + C5 -> C7 + H
    k(3623) = small + (2.00e-10&
        *T32**(-2.50e-01))

    !C2H + C7 -> C9 + H
    k(3624) = small + (2.00e-10&
        *T32**(-2.50e-01))

    !C2H + C9 -> C11 + H
    k(3625) = small + (2.00e-10&
        *T32**(-2.50e-01))

    !C2H + C2 -> C4 + H
    k(3626) = small + (1.00e-10)

    !C2H + C4 -> C6 + H
    k(3627) = small + (1.00e-10)

    !C2H + C6 -> C8 + H
    k(3628) = small + (1.00e-10)

    !C2H + C8 -> C10 + H
    k(3629) = small + (1.00e-10)

    !C2H + HC3N -> HC5N + H
    k(3630) = small + (1.06e-10&
        *T32**(-2.50e-01))

    !C2H + HC5N -> HC7N + H
    k(3631) = small + (1.06e-10&
        *T32**(-2.50e-01))

    !C2H + HC7N -> HC9N + H
    k(3632) = small + (1.06e-10&
        *T32**(-2.50e-01))

    !C2H + HC9N -> HC11N + H
    k(3633) = small + (1.06e-10&
        *T32**(-2.50e-01))

    !C2H + HC11N -> HC13N + H
    k(3634) = small + (1.06e-10&
        *T32**(-2.50e-01))

    !CH2 + HNO -> NO + CH3
    k(3635) = small + (1.70e-11)

    !HCO + HCO -> H2CO + CO
    k(3636) = small + (5.00e-11)

    !HCO + HNO -> H2CO + NO
    k(3637) = small + (1.00e-12&
        *exp(-9.76e+02&
        /Tgas))

    !HCO + CH3 -> CH4 + CO
    k(3638) = small + (4.40e-11)

    !HNO + CH3 -> CH4 + NO
    k(3639) = small + (3.32e-12)

    !NH2 + H2CO -> NH2CHO + H
    k(3640) = small + (1.00e-10)

    !C + C -> C2
    k(3641) = small + (1.00e-17)

    !C + H -> CH
    k(3642) = small + (1.00e-17)

    !C + N -> CN
    k(3643) = small + (1.00e-17)

    !C + O -> CO
    k(3644) = small + (2.10e-19)

    !C + H2 -> CH2
    k(3645) = small + (1.00e-17)

    !H + O -> OH
    k(3646) = small + (9.90e-19*T32**(-3.80e-01))

    !O + O -> O2
    k(3647) = small + (4.90e-20*T32**(1.58e+00))

    !O + SO -> SO2
    k(3648) = small + (3.20e-16&
        *T32**(-1.60e+00))

    !S + CO -> OCS
    k(3649) = small + (1.60e-17&
        *T32**(-1.50e+00))

    !CH + H2 -> CH3
    k(3650) = small + (3.25e-17&
        *T32**(-6.00e-01))

    !CN + C2H -> HC3N
    k(3651) = small + (1.00e-16)

    !CN + CH3 -> C2H3N
    k(3652) = small + (1.00e-16)

    !C + C2 -> C3
    k(3653) = small + (3.30e-16*T32**(-1.00e+00))

    !C + C3 -> C4
    k(3654) = small + (3.30e-14*T32**(-1.00e+00))

    !H + OH -> H2O
    k(3655) = small + (4.00e-18&
        *T32**(-2.00e+00))

    !OH + OH -> H2O2
    k(3656) = small + (1.00e-18&
        *T32**(-2.00e+00))

    !C2+ + E -> C + C
    k(3657) = small + (8.84e-08*invsqrT32)

    !CCL+ + E -> C + CL
    k(3658) = small + (3.00e-07*invsqrT32)

    !CF+ + E -> C + F
    k(3659) = small + (2.00e-07*invsqrT32)

    !CH+ + E -> C + H
    k(3660) = small + (7.00e-08*invsqrT32)

    !CLO+ + E -> CL + O
    k(3661) = small + (2.00e-07*invsqrT32)

    !CN+ + E -> C + N
    k(3662) = small + (3.38e-07&
        *T32**(-5.50e-01))

    !CO+ + E -> O + C
    k(3663) = small + (2.75e-07&
        *T32**(-5.50e-01))

    !CP+ + E -> P + C
    k(3664) = small + (1.00e-07*invsqrT32)

    !CS+ + E -> C + S
    k(3665) = small + (2.00e-07*invsqrT32)

    !H2+ + E -> H + H
    k(3666) = small + (2.53e-07*invsqrT32)

    !HCL+ + E -> H + CL
    k(3667) = small + (3.00e-07*invsqrT32)

    !HF+ + E -> H + F
    k(3668) = small + (2.00e-07*invsqrT32)

    !HEH+ + E -> H + HE
    k(3669) = small + (3.00e-08*invsqrT32)

    !HS+ + E -> S + H
    k(3670) = small + (2.00e-07*invsqrT32)

    !N2+ + E -> N + N
    k(3671) = small + (1.80e-07&
        *T32**(-3.90e-01))

    !NH+ + E -> N + H
    k(3672) = small + (1.18e-07*invsqrT32)

    !NO+ + E -> N + O
    k(3673) = small + (4.10e-07&
        *T32**(-1.00e+00))

    !NS+ + E -> N + S
    k(3674) = small + (2.00e-07*invsqrT32)

    !O2+ + E -> O + O
    k(3675) = small + (1.95e-07&
        *T32**(-7.00e-01))

    !OH+ + E -> O + H
    k(3676) = small + (6.30e-09&
        *T32**(-4.80e-01))

    !PH+ + E -> P + H
    k(3677) = small + (1.00e-07*invsqrT32)

    !PN+ + E -> P + N
    k(3678) = small + (1.80e-07*invsqrT32)

    !PO+ + E -> P + O
    k(3679) = small + (1.80e-07*invsqrT32)

    !S2+ + E -> S + S
    k(3680) = small + (2.00e-07*invsqrT32)

    !SIC+ + E -> SI + C
    k(3681) = small + (2.00e-07*invsqrT32)

    !SIH+ + E -> SI + H
    k(3682) = small + (2.00e-07*invsqrT32)

    !SIN+ + E -> SI + N
    k(3683) = small + (2.00e-07*invsqrT32)

    !SIO+ + E -> SI + O
    k(3684) = small + (2.00e-07*invsqrT32)

    !SIS+ + E -> SI + S
    k(3685) = small + (2.00e-07*invsqrT32)

    !SIF+ + E -> SI + F
    k(3686) = small + (2.00e-07*invsqrT32)

    !SO+ + E -> O + S
    k(3687) = small + (2.00e-07*invsqrT32)

    !C2H+ + E -> C2 + H
    k(3688) = small + (1.16e-07&
        *T32**(-7.60e-01))

    !C2H+ + E -> CH + C
    k(3689) = small + (1.05e-07&
        *T32**(-7.60e-01))

    !C2H+ + E -> C + C + H
    k(3690) = small + (4.80e-08&
        *T32**(-7.60e-01))

    !C2N+ + E -> C + CN
    k(3691) = small + (1.50e-07*invsqrT32)

    !C2N+ + E -> C2 + N
    k(3692) = small + (1.50e-07*invsqrT32)

    !C2O+ + E -> CO + C
    k(3693) = small + (3.00e-07*invsqrT32)

    !C2S+ + E -> C2 + S
    k(3694) = small + (1.50e-07*invsqrT32)

    !C2S+ + E -> CS + C
    k(3695) = small + (1.50e-07*invsqrT32)

    !C3+ + E -> C2 + C
    k(3696) = small + (3.00e-07*invsqrT32)

    !CCP+ + E -> P + C2
    k(3697) = small + (1.50e-07*invsqrT32)

    !CCP+ + E -> CP + C
    k(3698) = small + (1.50e-07*invsqrT32)

    !CH2+ + E -> C + H2
    k(3699) = small + (7.70e-08&
        *T32**(-6.00e-01))

    !CH2+ + E -> CH + H
    k(3700) = small + (1.60e-07&
        *T32**(-6.00e-01))

    !CH2+ + E -> C + H + H
    k(3701) = small + (4.00e-07&
        *T32**(-6.00e-01))

    !CHSI+ + E -> SI + CH
    k(3702) = small + (1.50e-07&
        *invsqrT32)

    !CHSI+ + E -> SIC + H
    k(3703) = small + (1.50e-07&
        *invsqrT32)

    !CNC+ + E -> CN + C
    k(3704) = small + (3.00e-07*invsqrT32)

    !CO2+ + E -> O + CO
    k(3705) = small + (4.20e-07&
        *T32**(-7.50e-01))

    !H2CL+ + E -> CL + H + H
    k(3706) = small + (2.70e-07&
        *invsqrT32)

    !H2CL+ + E -> HCL + H
    k(3707) = small + (3.00e-08&
        *invsqrT32)

    !H2F+ + E -> F + H + H
    k(3708) = small + (3.50e-07&
        *invsqrT32)

    !H2F+ + E -> HF + H
    k(3709) = small + (3.50e-07*invsqrT32)

    !H2O+ + E -> O + H2
    k(3710) = small + (3.90e-08*invsqrT32)

    !H2O+ + E -> OH + H
    k(3711) = small + (8.60e-08*invsqrT32)

    !H2O+ + E -> O + H + H
    k(3712) = small + (3.05e-07&
        *invsqrT32)

    !H2S+ + E -> S + H + H
    k(3713) = small + (1.50e-07&
        *invsqrT32)

    !H2S+ + E -> HS + H
    k(3714) = small + (1.50e-07*invsqrT32)

    !H3+ + E -> H + H + H
    k(3715) = small + (4.36e-08&
        *T32**(-5.20e-01))

    !H3+ + E -> H2 + H
    k(3716) = small + (2.34e-08&
        *T32**(-5.20e-01))

    !HCN+ + E -> CN + H
    k(3717) = small + (2.00e-07*invsqrT32)

    !HCO+ + E -> CO + H
    k(3718) = small + (2.40e-07&
        *T32**(-6.90e-01))

    !HCO+ + E -> OH + C
    k(3719) = small + (1.00e-08&
        *T32**(-6.90e-01))

    !HCO+ + E -> CH + O
    k(3720) = small + (1.00e-08&
        *T32**(-6.90e-01))

    !HCP+ + E -> P + CH
    k(3721) = small + (1.50e-07*invsqrT32)

    !HCP+ + E -> CP + H
    k(3722) = small + (1.50e-07*invsqrT32)

    !HCS+ + E -> CS + H
    k(3723) = small + (1.84e-07&
        *T32**(-5.70e-01))

    !HCS+ + E -> CH + S
    k(3724) = small + (7.86e-07&
        *T32**(-5.70e-01))

    !HNC+ + E -> CN + H
    k(3725) = small + (2.00e-07*invsqrT32)

    !HNO+ + E -> NO + H
    k(3726) = small + (3.00e-07*invsqrT32)

    !HNS+ + E -> NS + H
    k(3727) = small + (3.00e-07*invsqrT32)

    !HNSI+ + E -> NH + SI
    k(3728) = small + (1.50e-07&
        *invsqrT32)

    !HNSI+ + E -> SIN + H
    k(3729) = small + (1.50e-07&
        *invsqrT32)

    !HOC+ + E -> CO + H
    k(3730) = small + (2.00e-07&
        *T32**(-7.50e-01))

    !HPN+ + E -> PH + N
    k(3731) = small + (1.50e-07*invsqrT32)

    !HPN+ + E -> PN + H
    k(3732) = small + (1.50e-07*invsqrT32)

    !HPO+ + E -> PH + O
    k(3733) = small + (1.50e-07*invsqrT32)

    !HPO+ + E -> PO + H
    k(3734) = small + (1.50e-07*invsqrT32)

    !HSIO+ + E -> SI + OH
    k(3735) = small + (1.50e-07&
        *invsqrT32)

    !HSIO+ + E -> SIO + H
    k(3736) = small + (1.50e-07&
        *invsqrT32)

    !HSIS+ + E -> SI + HS
    k(3737) = small + (1.50e-07&
        *invsqrT32)

    !HSIS+ + E -> SIS + H
    k(3738) = small + (1.50e-07&
        *invsqrT32)

    !HSO+ + E -> SO + H
    k(3739) = small + (2.00e-07*invsqrT32)

    !N2H+ + E -> N2 + H
    k(3740) = small + (3.60e-08&
        *T32**(-5.10e-01))

    !N2H+ + E -> NH + N
    k(3741) = small + (6.40e-08&
        *T32**(-5.10e-01))

    !NAH2+ + E -> NA + H2
    k(3742) = small + (1.50e-07&
        *invsqrT32)

    !NAH2+ + E -> NAH + H
    k(3743) = small + (1.50e-07&
        *invsqrT32)

    !NCO+ + E -> CO + N
    k(3744) = small + (3.00e-07*invsqrT32)

    !NH2+ + E -> N + H + H
    k(3745) = small + (2.00e-07&
        *invsqrT32)

    !NH2+ + E -> NH + H
    k(3746) = small + (1.00e-07*invsqrT32)

    !NO2+ + E -> O + NO
    k(3747) = small + (3.00e-07*invsqrT32)

    !O2H+ + E -> O2 + H
    k(3748) = small + (3.00e-07*invsqrT32)

    !OCS+ + E -> CO + S
    k(3749) = small + (2.90e-07&
        *T32**(-6.20e-01))

    !OCS+ + E -> CS + O
    k(3750) = small + (4.80e-08&
        *T32**(-6.20e-01))

    !OCS+ + E -> C + SO
    k(3751) = small + (1.05e-08&
        *T32**(-6.20e-01))

    !PH2+ + E -> P + H2
    k(3752) = small + (1.50e-07*invsqrT32)

    !PH2+ + E -> PH + H
    k(3753) = small + (1.50e-07*invsqrT32)

    !S2H+ + E -> HS + S
    k(3754) = small + (1.50e-07*invsqrT32)

    !S2H+ + E -> S2 + H
    k(3755) = small + (1.50e-07*invsqrT32)

    !SIC2+ + E -> SI + C2
    k(3756) = small + (1.50e-07&
        *invsqrT32)

    !SIC2+ + E -> SIC + C
    k(3757) = small + (1.50e-07&
        *invsqrT32)

    !SIH2+ + E -> SI + H + H
    k(3758) = small + (2.00e-07&
        *invsqrT32)

    !SIH2+ + E -> SI + H2
    k(3759) = small + (1.50e-07&
        *invsqrT32)

    !SIH2+ + E -> SIH + H
    k(3760) = small + (2.00e-07&
        *invsqrT32)

    !SINC+ + E -> SI + CN
    k(3761) = small + (3.00e-07&
        *invsqrT32)

    !SO2+ + E -> SO + O
    k(3762) = small + (2.50e-07*invsqrT32)

    !C2H2+ + E -> C2H + H
    k(3763) = small + (2.90e-07&
        *invsqrT32)

    !C2H2+ + E -> C2 + H + H
    k(3764) = small + (1.70e-07&
        *invsqrT32)

    !C2H2+ + E -> CH + CH
    k(3765) = small + (7.50e-08&
        *invsqrT32)

    !C2H2+ + E -> CH2 + C
    k(3766) = small + (2.89e-08&
        *invsqrT32)

    !C2H2+ + E -> C2 + H2
    k(3767) = small + (1.15e-08&
        *invsqrT32)

    !C2HO+ + E -> CO + C + H
    k(3768) = small + (1.50e-07&
        *invsqrT32)

    !C2HO+ + E -> CO + CH
    k(3769) = small + (1.00e-07&
        *invsqrT32)

    !C2HO+ + E -> C2H + O
    k(3770) = small + (1.50e-07&
        *invsqrT32)

    !C2HO+ + E -> CCO + H
    k(3771) = small + (1.00e-07&
        *invsqrT32)

    !C2N2+ + E -> CN + CN
    k(3772) = small + (1.50e-07&
        *invsqrT32)

    !C2N2+ + E -> C2N + N
    k(3773) = small + (1.50e-07&
        *invsqrT32)

    !C2NH+ + E -> CH + CN
    k(3774) = small + (1.50e-07&
        *invsqrT32)

    !C2NH+ + E -> C2N + H
    k(3775) = small + (1.50e-07&
        *invsqrT32)

    !C3H+ + E -> C2H + C
    k(3776) = small + (1.50e-07*invsqrT32)

    !C3H+ + E -> C3 + H
    k(3777) = small + (1.50e-07*invsqrT32)

    !C3N+ + E -> C2 + CN
    k(3778) = small + (3.00e-07*invsqrT32)

    !C3O+ + E -> C2 + CO
    k(3779) = small + (3.00e-07*invsqrT32)

    !C3S+ + E -> C2 + CS
    k(3780) = small + (1.00e-07*invsqrT32)

    !C3S+ + E -> C2S + C
    k(3781) = small + (1.00e-07*invsqrT32)

    !C3S+ + E -> C3 + S
    k(3782) = small + (1.00e-07*invsqrT32)

    !C4+ + E -> C2 + C2
    k(3783) = small + (1.75e-07*invsqrT32)

    !C4+ + E -> C3 + C
    k(3784) = small + (2.75e-07*invsqrT32)

    !CH2SI+ + E -> SI + CH2
    k(3785) = small + (2.00e-07&
        *invsqrT32)

    !CH2SI+ + E -> SIC + H2
    k(3786) = small + (2.00e-07&
        *invsqrT32)

    !CH2SI+ + E -> HCSI + H
    k(3787) = small + (1.50e-07&
        *invsqrT32)

    !CH3+ + E -> H2 + C + H
    k(3788) = small + (3.00e-07&
        *T32**(-3.00e-01))

    !CH3+ + E -> CH + H + H
    k(3789) = small + (1.60e-07&
        *T32**(-3.00e-01))

    !CH3+ + E -> CH + H2
    k(3790) = small + (1.40e-07&
        *T32**(-3.00e-01))

    !CH3+ + E -> CH2 + H
    k(3791) = small + (4.00e-07&
        *T32**(-3.00e-01))

    !H2CCL+ + E -> CCL + H + H
    k(3792) = small + (3.00e-07&
        *invsqrT32)

    !HCNH+ + E -> CN + H + H
    k(3793) = small + (9.20e-08&
        *T32**(-6.50e-01))

    !HCNH+ + E -> HCN + H
    k(3794) = small + (1.85e-07&
        *T32**(-6.50e-01))

    !HCNH+ + E -> HNC + H
    k(3795) = small + (1.85e-07&
        *T32**(-6.50e-01))

    !H2CO+ + E -> CO + H + H
    k(3796) = small + (5.00e-07&
        *invsqrT32)

    !H2CO+ + E -> HCO + H
    k(3797) = small + (1.00e-07&
        *invsqrT32)

    !H2CS+ + E -> CS + H + H
    k(3798) = small + (3.00e-07&
        *invsqrT32)

    !H2CS+ + E -> HCS + H
    k(3799) = small + (3.00e-07&
        *invsqrT32)

    !H2NC+ + E -> CN + H2
    k(3800) = small + (1.80e-08&
        *invsqrT32)

    !H2NC+ + E -> HNC + H
    k(3801) = small + (1.80e-07&
        *invsqrT32)

    !H2NO+ + E -> NO + H2
    k(3802) = small + (1.50e-07&
        *invsqrT32)

    !H2NO+ + E -> HNO + H
    k(3803) = small + (1.50e-07&
        *invsqrT32)

    !H2PO+ + E -> PH + OH
    k(3804) = small + (1.50e-07&
        *invsqrT32)

    !H2PO+ + E -> HPO + H
    k(3805) = small + (1.50e-07&
        *invsqrT32)

    !H2S2+ + E -> HS + HS
    k(3806) = small + (1.50e-07&
        *invsqrT32)

    !H2S2+ + E -> HS2 + H
    k(3807) = small + (1.50e-07&
        *invsqrT32)

    !H2SIO+ + E -> SIH + OH
    k(3808) = small + (1.50e-07&
        *invsqrT32)

    !H2SIO+ + E -> SIO + H2
    k(3809) = small + (1.50e-07&
        *invsqrT32)

    !H3O+ + E -> OH + H + H
    k(3810) = small + (2.60e-07&
        *invsqrT32)

    !H3O+ + E -> H2O + H
    k(3811) = small + (1.10e-07*invsqrT32)

    !H3O+ + E -> OH + H2
    k(3812) = small + (6.00e-08*invsqrT32)

    !H3O+ + E -> H2 + H + O
    k(3813) = small + (5.60e-09&
        *invsqrT32)

    !H3S+ + E -> HS + H + H
    k(3814) = small + (1.00e-07&
        *invsqrT32)

    !H3S+ + E -> H2S + H
    k(3815) = small + (3.00e-07*invsqrT32)

    !HC2S+ + E -> CS + CH
    k(3816) = small + (1.50e-07&
        *invsqrT32)

    !HC2S+ + E -> C2S + H
    k(3817) = small + (1.50e-07&
        *invsqrT32)

    !HCO2+ + E -> CO + H + O
    k(3818) = small + (8.10e-07&
        *T32**(-6.40e-01))

    !HCO2+ + E -> OH + CO
    k(3819) = small + (3.20e-07&
        *T32**(-6.40e-01))

    !HCO2+ + E -> CO2 + H
    k(3820) = small + (6.00e-08&
        *T32**(-6.40e-01))

    !HNCO+ + E -> CO + NH
    k(3821) = small + (3.00e-07&
        *invsqrT32)

    !HOCS+ + E -> OH + CS
    k(3822) = small + (2.00e-07&
        *invsqrT32)

    !HOCS+ + E -> OCS + H
    k(3823) = small + (2.00e-07&
        *invsqrT32)

    !HSIO2+ + E -> SIO + OH
    k(3824) = small + (1.50e-07&
        *invsqrT32)

    !HSIO2+ + E -> SIO2 + H
    k(3825) = small + (1.50e-07&
        *invsqrT32)

    !HSO2+ + E -> SO + H + O
    k(3826) = small + (1.00e-07&
        *invsqrT32)

    !HSO2+ + E -> SO + OH
    k(3827) = small + (1.00e-07&
        *invsqrT32)

    !HSO2+ + E -> SO2 + H
    k(3828) = small + (2.00e-07&
        *invsqrT32)

    !NAH2O+ + E -> NA + H2O
    k(3829) = small + (1.50e-07&
        *invsqrT32)

    !NAH2O+ + E -> NAOH + H
    k(3830) = small + (1.50e-07&
        *invsqrT32)

    !NH3+ + E -> NH + H + H
    k(3831) = small + (1.55e-07&
        *invsqrT32)

    !NH3+ + E -> NH2 + H
    k(3832) = small + (1.55e-07*invsqrT32)

    !PC2H+ + E -> CP + CH
    k(3833) = small + (1.50e-07&
        *invsqrT32)

    !PC2H+ + E -> CCP + H
    k(3834) = small + (1.50e-07&
        *invsqrT32)

    !PCH2+ + E -> CP + H2
    k(3835) = small + (1.50e-07&
        *invsqrT32)

    !PCH2+ + E -> HCP + H
    k(3836) = small + (1.50e-07&
        *invsqrT32)

    !PH3+ + E -> PH + H2
    k(3837) = small + (1.50e-07*invsqrT32)

    !PH3+ + E -> PH2 + H
    k(3838) = small + (1.50e-07*invsqrT32)

    !PNH2+ + E -> NH2 + P
    k(3839) = small + (3.00e-07&
        *invsqrT32)

    !SIC2H+ + E -> C2H + SI
    k(3840) = small + (1.50e-07&
        *invsqrT32)

    !SIC2H+ + E -> SIC2 + H
    k(3841) = small + (1.50e-07&
        *invsqrT32)

    !SIC3+ + E -> SIC + C2
    k(3842) = small + (1.50e-07&
        *invsqrT32)

    !SIC3+ + E -> SIC2 + C
    k(3843) = small + (1.50e-07&
        *invsqrT32)

    !SIH3+ + E -> SIH + H2
    k(3844) = small + (1.50e-07&
        *invsqrT32)

    !SIH3+ + E -> SIH2 + H
    k(3845) = small + (1.50e-07&
        *invsqrT32)

    !SINCH+ + E -> SIN + CH
    k(3846) = small + (1.50e-07&
        *invsqrT32)

    !SINCH+ + E -> SINC + H
    k(3847) = small + (1.50e-07&
        *invsqrT32)

    !SINH2+ + E -> SIN + H2
    k(3848) = small + (1.50e-07&
        *invsqrT32)

    !SINH2+ + E -> HNSI + H
    k(3849) = small + (1.50e-07&
        *invsqrT32)

    !C2H2N+ + E -> CH + HCN
    k(3850) = small + (3.00e-07&
        *invsqrT32)

    !C2H2N+ + E -> CN + CH2
    k(3851) = small + (3.00e-07&
        *invsqrT32)

    !C2H2N+ + E -> C2N + H2
    k(3852) = small + (3.00e-07&
        *invsqrT32)

    !C2H2O+ + E -> C2 + H2O
    k(3853) = small + (2.00e-07&
        *invsqrT32)

    !C2H2O+ + E -> CH2 + CO
    k(3854) = small + (2.00e-07&
        *invsqrT32)

    !C2H2O+ + E -> C2H2 + O
    k(3855) = small + (2.00e-07&
        *invsqrT32)

    !C2H3+ + E -> C2H + H + H
    k(3856) = small + (2.95e-07&
        *T32**(-8.40e-01))

    !C2H3+ + E -> C2H + H2
    k(3857) = small + (3.00e-08&
        *T32**(-8.40e-01))

    !C2H3+ + E -> C2H2 + H
    k(3858) = small + (1.45e-07&
        *T32**(-8.40e-01))

    !C2H3+ + E -> C2 + H + H2
    k(3859) = small + (1.50e-08&
        *T32**(-8.40e-01))

    !C2H3+ + E -> CH3 + C
    k(3860) = small + (3.00e-09&
        *T32**(-8.40e-01))

    !C2H3+ + E -> CH2 + CH
    k(3861) = small + (1.50e-08&
        *T32**(-8.40e-01))

    !C3H2+ + E -> C2 + CH2
    k(3862) = small + (3.00e-08&
        *invsqrT32)

    !H2C3+ + E -> C2 + CH2
    k(3863) = small + (3.00e-08&
        *invsqrT32)

    !C3H2+ + E -> C3 + H + H
    k(3864) = small + (6.00e-08&
        *invsqrT32)

    !H2C3+ + E -> C3 + H + H
    k(3865) = small + (6.00e-08&
        *invsqrT32)

    !C3H2+ + E -> C3 + H2
    k(3866) = small + (1.50e-07&
        *invsqrT32)

    !H2C3+ + E -> C3 + H2
    k(3867) = small + (1.50e-07&
        *invsqrT32)

    !C3H2+ + E -> C2H2 + C
    k(3868) = small + (3.00e-08&
        *invsqrT32)

    !H2C3+ + E -> C2H2 + C
    k(3869) = small + (3.00e-08&
        *invsqrT32)

    !C3H2+ + E -> C3H + H
    k(3870) = small + (1.50e-07&
        *invsqrT32)

    !H2C3+ + E -> HC3 + H
    k(3871) = small + (1.50e-07&
        *invsqrT32)

    !C3HN+ + E -> C2 + HCN
    k(3872) = small + (3.00e-07&
        *invsqrT32)

    !C3HN+ + E -> C2H + CN
    k(3873) = small + (1.50e-07&
        *invsqrT32)

    !C3HN+ + E -> C3N + H
    k(3874) = small + (1.50e-07&
        *invsqrT32)

    !C4H+ + E -> C2H + C2
    k(3875) = small + (9.00e-08&
        *invsqrT32)

    !C4H+ + E -> C3H + C
    k(3876) = small + (4.50e-08*invsqrT32)

    !C4H+ + E -> C3 + CH
    k(3877) = small + (4.50e-08*invsqrT32)

    !C4H+ + E -> C4 + H
    k(3878) = small + (1.20e-07*invsqrT32)

    !C4N+ + E -> C2N + C2
    k(3879) = small + (1.50e-07&
        *invsqrT32)

    !C4N+ + E -> C3N + C
    k(3880) = small + (1.50e-07*invsqrT32)

    !C4P+ + E -> CCP + C2
    k(3881) = small + (1.50e-07&
        *invsqrT32)

    !C4P+ + E -> C3P + C
    k(3882) = small + (1.50e-07*invsqrT32)

    !C4S+ + E -> C2S + C2
    k(3883) = small + (1.00e-07&
        *invsqrT32)

    !C4S+ + E -> C3 + CS
    k(3884) = small + (1.00e-07*invsqrT32)

    !C4S+ + E -> C3S + C
    k(3885) = small + (1.00e-07*invsqrT32)

    !C5+ + E -> C3 + C2
    k(3886) = small + (1.50e-07*invsqrT32)

    !C5+ + E -> C4 + C
    k(3887) = small + (1.50e-07*invsqrT32)

    !CH2O2+ + E -> CO2 + H + H
    k(3888) = small + (3.00e-07&
        *invsqrT32)

    !CH4+ + E -> CH2 + H + H
    k(3889) = small + (3.00e-07&
        *invsqrT32)

    !CH4+ + E -> CH3 + H
    k(3890) = small + (3.00e-07*invsqrT32)

    !H3CO+ + E -> CO + H + H2
    k(3891) = small + (2.00e-07&
        *invsqrT32)

    !H3CO+ + E -> HCO + H + H
    k(3892) = small + (2.00e-07&
        *invsqrT32)

    !H3CO+ + E -> H2CO + H
    k(3893) = small + (2.00e-07&
        *invsqrT32)

    !H3CS+ + E -> CS + H + H2
    k(3894) = small + (3.00e-07&
        *invsqrT32)

    !H3CS+ + E -> H2CS + H
    k(3895) = small + (3.00e-07&
        *invsqrT32)

    !H3S2+ + E -> HS2 + H2
    k(3896) = small + (1.50e-07&
        *invsqrT32)

    !H3S2+ + E -> H2S2 + H
    k(3897) = small + (1.50e-07&
        *invsqrT32)

    !H3SIO+ + E -> SIO + H2 + H
    k(3898) = small + (1.50e-07&
        *invsqrT32)

    !H3SIO+ + E -> H2SIO + H
    k(3899) = small + (1.50e-07&
        *invsqrT32)

    !HC3O+ + E -> C3H + O
    k(3900) = small + (1.50e-07&
        *invsqrT32)

    !HC3O+ + E -> HC3 + O
    k(3901) = small + (1.50e-07&
        *invsqrT32)

    !HC3O+ + E -> C3O + H
    k(3902) = small + (1.50e-07&
        *invsqrT32)

    !HC3S+ + E -> C2S + CH
    k(3903) = small + (1.50e-07&
        *invsqrT32)

    !HC3S+ + E -> C3S + H
    k(3904) = small + (1.50e-07&
        *invsqrT32)

    !NH4+ + E -> NH2 + H + H
    k(3905) = small + (3.20e-07&
        *invsqrT32)

    !NH4+ + E -> NH2 + H2
    k(3906) = small + (1.50e-07&
        *invsqrT32)

    !NH4+ + E -> NH3 + H
    k(3907) = small + (1.05e-06*invsqrT32)

    !OCS+H2 + E -> OCS + H2
    k(3908) = small + (3.00e-07)

    !PC2H2+ + E -> P + C2H2
    k(3909) = small + (1.00e-07&
        *invsqrT32)

    !PC2H2+ + E -> CCP + H2
    k(3910) = small + (1.00e-07&
        *invsqrT32)

    !PC2H2+ + E -> HCCP + H
    k(3911) = small + (1.00e-07&
        *invsqrT32)

    !PC3H+ + E -> CCP + CH
    k(3912) = small + (1.00e-07&
        *invsqrT32)

    !PC3H+ + E -> C3P + H
    k(3913) = small + (1.00e-07&
        *invsqrT32)

    !PC3H+ + E -> HCCP + C
    k(3914) = small + (1.00e-07&
        *invsqrT32)

    !PCH3+ + E -> CP + H2 + H
    k(3915) = small + (1.50e-07&
        *invsqrT32)

    !PCH3+ + E -> HCP + H2
    k(3916) = small + (1.50e-07&
        *invsqrT32)

    !PCH3+ + E -> CH3 + P
    k(3917) = small + (3.00e-07&
        *invsqrT32)

    !PNH3+ + E -> NH3 + P
    k(3918) = small + (3.00e-07&
        *invsqrT32)

    !SIC2H2+ + E -> SIC2 + H2
    k(3919) = small + (1.50e-07&
        *invsqrT32)

    !SIC2H2+ + E -> SIC2H + H
    k(3920) = small + (1.50e-07&
        *invsqrT32)

    !SIC3H+ + E -> SI + C3H
    k(3921) = small + (1.50e-07&
        *invsqrT32)

    !SIC3H+ + E -> SI + HC3
    k(3922) = small + (1.50e-07&
        *invsqrT32)

    !SIC3H+ + E -> SIC3 + H
    k(3923) = small + (1.50e-07&
        *invsqrT32)

    !SIC4+ + E -> SIC2 + C2
    k(3924) = small + (1.50e-07&
        *invsqrT32)

    !SIC4+ + E -> SIC3 + C
    k(3925) = small + (1.50e-07&
        *invsqrT32)

    !SICH3+ + E -> HCSI + H2
    k(3926) = small + (1.50e-07&
        *invsqrT32)

    !SICH3+ + E -> SICH2 + H
    k(3927) = small + (1.50e-07&
        *invsqrT32)

    !SIH4+ + E -> SIH2 + H2
    k(3928) = small + (1.50e-07&
        *invsqrT32)

    !SIH4+ + E -> SIH3 + H
    k(3929) = small + (1.50e-07&
        *invsqrT32)

    !C2H3N+ + E -> C2N + H2 + H
    k(3930) = small + (2.00e-07&
        *invsqrT32)

    !C2H3N+ + E -> CH2 + HCN
    k(3931) = small + (3.00e-07&
        *invsqrT32)

    !C2H3N+ + E -> CH3 + CN
    k(3932) = small + (2.00e-07&
        *invsqrT32)

    !C2H3N+ + E -> C2H2N + H
    k(3933) = small + (2.00e-07&
        *invsqrT32)

    !C2H3O+ + E -> CH3 + CO
    k(3934) = small + (1.50e-07&
        *invsqrT32)

    !C2H3O+ + E -> C2H2O + H
    k(3935) = small + (1.50e-07&
        *invsqrT32)

    !C2H4+ + E -> C2H2 + H + H
    k(3936) = small + (3.70e-07&
        *T32**(-7.60e-01))

    !C2H4+ + E -> C2H2 + H2
    k(3937) = small + (3.36e-08&
        *T32**(-7.60e-01))

    !C2H4+ + E -> C2H3 + H
    k(3938) = small + (6.16e-08&
        *T32**(-7.60e-01))

    !C2H4+ + E -> C2H + H2 + H
    k(3939) = small + (5.60e-08&
        *T32**(-7.60e-01))

    !C2H4+ + E -> CH4 + C
    k(3940) = small + (5.60e-09&
        *T32**(-7.60e-01))

    !C2H4+ + E -> CH3 + CH
    k(3941) = small + (1.12e-08&
        *T32**(-7.60e-01))

    !C2H4+ + E -> CH2 + CH2
    k(3942) = small + (2.24e-08&
        *T32**(-7.60e-01))

    !C3H2N+ + E -> C2H + HNC
    k(3943) = small + (7.50e-08&
        *invsqrT32)

    !C3H2N+ + E -> HCNC2 + H
    k(3944) = small + (1.20e-08&
        *invsqrT32)

    !C3H2N+ + E -> HC2NC + H
    k(3945) = small + (1.20e-08&
        *invsqrT32)

    !C3H2N+ + E -> HC3N + H
    k(3946) = small + (1.50e-07&
        *invsqrT32)

    !C3H2N+ + E -> HNC3 + H
    k(3947) = small + (7.50e-08&
        *invsqrT32)

    !C3H3+ + E -> C2H2 + CH
    k(3948) = small + (6.99e-08&
        *invsqrT32)

    !H3C3+ + E -> C2H2 + CH
    k(3949) = small + (6.99e-08&
        *invsqrT32)

    !C3H3+ + E -> C3H + H2
    k(3950) = small + (3.15e-07&
        *invsqrT32)

    !H3C3+ + E -> HC3 + H2
    k(3951) = small + (3.15e-07&
        *invsqrT32)

    !C3H3+ + E -> C3H2 + H
    k(3952) = small + (3.15e-07&
        *invsqrT32)

    !H3C3+ + E -> H2C3 + H
    k(3953) = small + (3.15e-07&
        *invsqrT32)

    !C4H2+ + E -> C4 + H2
    k(3954) = small + (1.50e-07&
        *invsqrT32)

    !C4H2+ + E -> C4H + H
    k(3955) = small + (1.50e-07&
        *invsqrT32)

    !C5H+ + E -> C4H + C
    k(3956) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C5H+ + E -> C5 + H
    k(3957) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C5N+ + E -> C2 + C3N
    k(3958) = small + (3.00e-07&
        *invsqrT32)

    !C6+ + E -> C4 + C2
    k(3959) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C6+ + E -> C5 + C
    k(3960) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !CH3O2+ + E -> CO2 + H2 + H
    k(3961) = small + (1.50e-07&
        *invsqrT32)

    !CH3O2+ + E -> CH2O2 + H
    k(3962) = small + (1.50e-07&
        *invsqrT32)

    !CH4N+ + E -> CN + H2 + H2
    k(3963) = small + (3.00e-08&
        *invsqrT32)

    !CH4N+ + E -> CH2 + NH2
    k(3964) = small + (1.50e-07&
        *invsqrT32)

    !CH4N+ + E -> HCN + H + H2
    k(3965) = small + (3.00e-07&
        *invsqrT32)

    !CH4N+ + E -> CH3N + H
    k(3966) = small + (1.50e-07&
        *invsqrT32)

    !CH4O+ + E -> CH3 + OH
    k(3967) = small + (3.00e-07&
        *invsqrT32)

    !CH4O+ + E -> H2CO + H2
    k(3968) = small + (3.00e-07&
        *invsqrT32)

    !CH5+ + E -> CH3 + H2
    k(3969) = small + (1.40e-08&
        *T32**(-5.20e-01))

    !CH5+ + E -> CH4 + H
    k(3970) = small + (1.40e-08&
        *T32**(-5.20e-01))

    !CH5+ + E -> CH3 + H + H
    k(3971) = small + (1.95e-07&
        *T32**(-5.20e-01))

    !CH5+ + E -> CH2 + H2 + H
    k(3972) = small + (4.80e-08&
        *T32**(-5.20e-01))

    !CH5+ + E -> CH + H2 + H2
    k(3973) = small + (3.00e-09&
        *T32**(-5.20e-01))

    !H2C3O+ + E -> C2H2 + CO
    k(3974) = small + (1.50e-07&
        *invsqrT32)

    !H2C3O+ + E -> C3H + OH
    k(3975) = small + (1.50e-07&
        *invsqrT32)

    !H2C3O+ + E -> HC3 + OH
    k(3976) = small + (1.50e-07&
        *invsqrT32)

    !H2C3O+ + E -> C3O + H + H
    k(3977) = small + (1.50e-07&
        *invsqrT32)

    !H2C3O+ + E -> C3O + H2
    k(3978) = small + (1.50e-07&
        *invsqrT32)

    !HC2NCH+ + E -> C2H + HCN
    k(3979) = small + (2.28e-07&
        *invsqrT32)

    !HC2NCH+ + E -> C2H2 + CN
    k(3980) = small + (2.28e-07&
        *invsqrT32)

    !HC2NCH+ + E -> HCNC2 + H
    k(3981) = small + (6.00e-08&
        *invsqrT32)

    !HC2NCH+ + E -> HC2NC + H
    k(3982) = small + (6.00e-08&
        *invsqrT32)

    !HC2NCH+ + E -> HC3N + H
    k(3983) = small + (1.20e-08&
        *invsqrT32)

    !HC2NCH+ + E -> HNC3 + H
    k(3984) = small + (1.20e-08&
        *invsqrT32)

    !HC4N+ + E -> C3N + CH
    k(3985) = small + (3.00e-07&
        *invsqrT32)

    !HC4O+ + E -> C3H + CO
    k(3986) = small + (1.50e-07&
        *invsqrT32)

    !HC4O+ + E -> HC3 + CO
    k(3987) = small + (1.50e-07&
        *invsqrT32)

    !HC4O+ + E -> C3O + CH
    k(3988) = small + (1.50e-07&
        *invsqrT32)

    !HC4S+ + E -> C2S + C2H
    k(3989) = small + (1.00e-07&
        *invsqrT32)

    !HC4S+ + E -> C3S + CH
    k(3990) = small + (1.00e-07&
        *invsqrT32)

    !HC4S+ + E -> C4S + H
    k(3991) = small + (1.00e-07&
        *invsqrT32)

    !NH2CNH+ + E -> NH2 + HNC
    k(3992) = small + (1.50e-07&
        *invsqrT32)

    !NH2CNH+ + E -> NH2CN + H
    k(3993) = small + (1.50e-07&
        *invsqrT32)

    !PC2H3+ + E -> PH + C2H2
    k(3994) = small + (1.00e-07&
        *invsqrT32)

    !PC2H3+ + E -> CCP + H2 + H
    k(3995) = small + (1.00e-07&
        *invsqrT32)

    !PC2H3+ + E -> HCCP + H2
    k(3996) = small + (1.00e-07&
        *invsqrT32)

    !PC4H+ + E -> CP + C3H
    k(3997) = small + (7.50e-08&
        *invsqrT32)

    !PC4H+ + E -> CP + HC3
    k(3998) = small + (7.50e-08&
        *invsqrT32)

    !PC4H+ + E -> CCP + C2H
    k(3999) = small + (7.50e-08&
        *invsqrT32)

    !PC4H+ + E -> C3P + CH
    k(4000) = small + (7.50e-08&
        *invsqrT32)

    !PC4H+ + E -> C4P + H
    k(4001) = small + (7.50e-08&
        *invsqrT32)

    !PCH4+ + E -> HCP + H2 + H
    k(4002) = small + (1.50e-07&
        *invsqrT32)

    !PCH4+ + E -> CH2PH + H
    k(4003) = small + (1.50e-07&
        *invsqrT32)

    !PCH4+ + E -> CH4 + P
    k(4004) = small + (3.00e-07&
        *invsqrT32)

    !SIC2H3+ + E -> SIC2H + H2
    k(4005) = small + (1.50e-07&
        *invsqrT32)

    !SIC2H3+ + E -> SIC2H2 + H
    k(4006) = small + (1.50e-07&
        *invsqrT32)

    !SIC3H2+ + E -> SIC3 + H2
    k(4007) = small + (1.50e-07&
        *invsqrT32)

    !SIC3H2+ + E -> SIC3H + H
    k(4008) = small + (1.50e-07&
        *invsqrT32)

    !SIC4H+ + E -> SIC3 + CH
    k(4009) = small + (1.50e-07&
        *invsqrT32)

    !SIC4H+ + E -> SIC4 + H
    k(4010) = small + (1.50e-07&
        *invsqrT32)

    !SICH4+ + E -> SICH2 + H2
    k(4011) = small + (1.50e-07&
        *invsqrT32)

    !SICH4+ + E -> SICH3 + H
    k(4012) = small + (1.50e-07&
        *invsqrT32)

    !SIH5+ + E -> SIH3 + H2
    k(4013) = small + (1.50e-07&
        *invsqrT32)

    !SIH5+ + E -> SIH4 + H
    k(4014) = small + (1.50e-07&
        *invsqrT32)

    !C2H4N+ + E -> C2H2N + H + H
    k(4015) = small + (1.50e-07&
        *invsqrT32)

    !C2H4N+ + E -> C2H3N + H
    k(4016) = small + (1.50e-07&
        *invsqrT32)

    !C2H4O+ + E -> CH3 + HCO
    k(4017) = small + (1.50e-07&
        *invsqrT32)

    !C2H4O+ + E -> C2H2O + H + H
    k(4018) = small + (1.50e-07&
        *invsqrT32)

    !C2H4O+ + E -> C2H2O + H2
    k(4019) = small + (1.50e-07&
        *invsqrT32)

    !C2H5+ + E -> C2H + H2 + H2
    k(4020) = small + (1.50e-07&
        *invsqrT32)

    !C2H5+ + E -> C2H2 + H2 + H
    k(4021) = small + (3.00e-07&
        *invsqrT32)

    !C2H5+ + E -> C2H3 + H2
    k(4022) = small + (1.50e-07&
        *invsqrT32)

    !C2H5+ + E -> C2H4 + H
    k(4023) = small + (1.50e-07&
        *invsqrT32)

    !C3H3N+ + E -> C3N + H2 + H
    k(4024) = small + (1.50e-07&
        *invsqrT32)

    !C3H3N+ + E -> HC3N + H2
    k(4025) = small + (1.50e-07&
        *invsqrT32)

    !C3H4+ + E -> C3H2 + H2
    k(4026) = small + (2.95e-08&
        *T32**(-6.70e-01))

    !C3H4+ + E -> H2C3 + H2
    k(4027) = small + (2.95e-08&
        *T32**(-6.70e-01))

    !C3H4+ + E -> C3H3 + H
    k(4028) = small + (2.57e-06&
        *T32**(-6.70e-01))

    !C3H4+ + E -> C2H3 + CH
    k(4029) = small + (2.95e-08&
        *T32**(-6.70e-01))

    !C3H4+ + E -> C2H2 + CH2
    k(4030) = small + (1.77e-07&
        *T32**(-6.70e-01))

    !C3H4+ + E -> C2H + CH3
    k(4031) = small + (2.95e-08&
        *T32**(-6.70e-01))

    !C3H4+ + E -> C3H2 + H + H
    k(4032) = small + (1.18e-07&
        *T32**(-6.70e-01))

    !C3H4+ + E -> H2C3 + H + H
    k(4033) = small + (1.18e-07&
        *T32**(-6.70e-01))

    !C4H3+ + E -> C4H + H2
    k(4034) = small + (1.50e-07&
        *invsqrT32)

    !C4H3+ + E -> C4H2 + H
    k(4035) = small + (1.50e-07&
        *invsqrT32)

    !C5H2+ + E -> C5 + H2
    k(4036) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C5H2+ + E -> C5H + H
    k(4037) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C5HN+ + E -> CN + C4H
    k(4038) = small + (1.50e-07&
        *invsqrT32)

    !C5HN+ + E -> C3N + C2H
    k(4039) = small + (1.50e-07&
        *invsqrT32)

    !C5HN+ + E -> C5N + H
    k(4040) = small + (1.50e-07&
        *invsqrT32)

    !C6H+ + E -> C5H + C
    k(4041) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C6H+ + E -> C6 + H
    k(4042) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C7+ + E -> C4 + C3
    k(4043) = small + (3.00e-07*invsqrT32)

    !C7+ + E -> C5 + C2
    k(4044) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C7+ + E -> C6 + C
    k(4045) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !CH5N+ + E -> CH3 + NH2
    k(4046) = small + (1.50e-07&
        *invsqrT32)

    !CH5N+ + E -> CH3N + H2
    k(4047) = small + (1.50e-07&
        *invsqrT32)

    !CH5O+ + E -> H2CO + H2 + H
    k(4048) = small + (9.10e-08&
        *T32**(-6.70e-01))

    !CH5O+ + E -> CH3 + H2O
    k(4049) = small + (8.19e-08&
        *T32**(-6.70e-01))

    !CH5O+ + E -> CH3 + OH + H
    k(4050) = small + (4.64e-07&
        *T32**(-6.70e-01))

    !CH5O+ + E -> CH2 + H2O + H
    k(4051) = small + (1.91e-07&
        *T32**(-6.70e-01))

    !CH5O+ + E -> CH4O + H
    k(4052) = small + (2.73e-08&
        *T32**(-6.70e-01))

    !H2C4N+ + E -> HC3N + CH
    k(4053) = small + (3.00e-07&
        *invsqrT32)

    !H3C3O+ + E -> C3H + H2O
    k(4054) = small + (1.50e-07&
        *invsqrT32)

    !H3C3O+ + E -> HC3 + H2O
    k(4055) = small + (1.50e-07&
        *invsqrT32)

    !H3C3O+ + E -> C3O + H2 + H
    k(4056) = small + (1.50e-07&
        *invsqrT32)

    !NH2CH2O+ + E -> NH2CHO + H
    k(4057) = small + (1.50e-07&
        *invsqrT32)

    !NH2CH2O+ + E -> NH3 + CO + H
    k(4058) = small + (1.50e-07&
        *invsqrT32)

    !NH2CH2O+ + E -> H2CN + H2O
    k(4059) = small + (1.50e-07&
        *invsqrT32)

    !NH2CH2O+ + E -> OCN + H2 + H2
    k(4060) = small + (1.50e-07&
        *invsqrT32)

    !NH2CH2O+ + E -> NH2 + H2CO
    k(4061) = small + (1.50e-07&
        *invsqrT32)

    !PC2H4+ + E -> P + C2H4
    k(4062) = small + (1.00e-07&
        *invsqrT32)

    !PC2H4+ + E -> CCP + H2 + H2
    k(4063) = small + (1.00e-07&
        *invsqrT32)

    !PC2H4+ + E -> HCCP + H2 + H
    k(4064) = small + (1.00e-07&
        *invsqrT32)

    !PC4H2+ + E -> CCP + C2H2
    k(4065) = small + (1.50e-07&
        *invsqrT32)

    !PC4H2+ + E -> C4P + H2
    k(4066) = small + (1.50e-07&
        *invsqrT32)

    !C2H5O+ + E -> H2CO + CH3
    k(4067) = small + (1.50e-07&
        *invsqrT32)

    !C2H5O+ + E -> C2H2O + H2 + H
    k(4068) = small + (1.50e-07&
        *invsqrT32)

    !C2H5O+ + E -> CH4 + CO + H
    k(4069) = small + (3.00e-07&
        *invsqrT32)

    !C2H5O+ + E -> C2H4O + H
    k(4070) = small + (1.50e-07&
        *invsqrT32)

    !C2H6+ + E -> C2H4 + H2
    k(4071) = small + (1.50e-07&
        *invsqrT32)

    !C2H6+ + E -> C2H5 + H
    k(4072) = small + (1.50e-07&
        *invsqrT32)

    !C3H4N+ + E -> C3N + H2 + H2
    k(4073) = small + (1.50e-07&
        *invsqrT32)

    !C3H4N+ + E -> HC3N + H2 + H
    k(4074) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C3H4N+ + E -> C3H3N + H
    k(4075) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C3H5+ + E -> C3H3 + H2
    k(4076) = small + (1.50e-07&
        *invsqrT32)

    !C3H5+ + E -> C3H4 + H
    k(4077) = small + (1.50e-07&
        *invsqrT32)

    !C4H4+ + E -> C4H + H2 + H
    k(4078) = small + (3.30e-07&
        *invsqrT32)

    !C4H4+ + E -> C4H2 + H2
    k(4079) = small + (3.30e-07&
        *invsqrT32)

    !C4H4+ + E -> C4H3 + H
    k(4080) = small + (3.30e-07&
        *invsqrT32)

    !C5H2N+ + E -> C5N + H2
    k(4081) = small + (1.50e-07&
        *invsqrT32)

    !C5H2N+ + E -> HC5N + H
    k(4082) = small + (1.50e-07&
        *invsqrT32)

    !C5H3+ + E -> C5H + H2
    k(4083) = small + (4.50e-07&
        *invsqrT32)

    !C5H3+ + E -> C5H2 + H
    k(4084) = small + (4.50e-07&
        *invsqrT32)

    !C6H2+ + E -> C6 + H + H
    k(4085) = small + (1.50e-07&
        *invsqrT32)

    !C6H2+ + E -> C6 + H2
    k(4086) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C6H2+ + E -> C6H + H
    k(4087) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C7H+ + E -> C6H + C
    k(4088) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C7H+ + E -> C7 + H
    k(4089) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C7N+ + E -> C2 + C5N
    k(4090) = small + (3.00e-07&
        *invsqrT32)

    !C8+ + E -> C6 + C2
    k(4091) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C8+ + E -> C7 + C
    k(4092) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !CH6N+ + E -> CH3N + H2 + H
    k(4093) = small + (1.50e-07&
        *invsqrT32)

    !CH6N+ + E -> CH5N + H
    k(4094) = small + (1.50e-07&
        *invsqrT32)

    !COOCH4+ + E -> CH3 + CO2 + H
    k(4095) = small + (1.50e-07&
        *invsqrT32)

    !COOCH4+ + E -> CH4O + CO
    k(4096) = small + (1.50e-07&
        *invsqrT32)

    !H3C4N+ + E -> HC3N + CH2
    k(4097) = small + (3.00e-07&
        *invsqrT32)

    !C2H5OH+ + E -> C2H2O + H2 + H2
    k(4098) = small + (1.50e-07&
        *invsqrT32)

    !C2H5OH+ + E -> CH4 + H2CO
    k(4099) = small + (1.50e-07&
        *invsqrT32)

    !C2H5OH+ + E -> C2H4O + H2
    k(4100) = small + (1.50e-07&
        *invsqrT32)

    !C2H5OH+ + E -> C2H5 + OH
    k(4101) = small + (1.50e-07&
        *invsqrT32)

    !C4H4N+ + E -> CH3 + HC3N
    k(4102) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C4H4N+ + E -> CH3C3N + H
    k(4103) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C4H5+ + E -> C4H + H2 + H2
    k(4104) = small + (1.01e-07&
        *invsqrT32)

    !C4H5+ + E -> C4H2 + H + H2
    k(4105) = small + (1.01e-07&
        *invsqrT32)

    !C4H5+ + E -> C3H4 + CH
    k(4106) = small + (4.50e-08&
        *invsqrT32)

    !C4H5+ + E -> C2H2 + C2H3
    k(4107) = small + (1.01e-07&
        *invsqrT32)

    !C4H5+ + E -> C2H + C2H4
    k(4108) = small + (1.01e-07&
        *invsqrT32)

    !C5H3N+ + E -> C5N + H2 + H
    k(4109) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C5H3N+ + E -> HC5N + H2
    k(4110) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C5H4+ + E -> C5H + H + H2
    k(4111) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C5H4+ + E -> C5H2 + H2
    k(4112) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C6H3+ + E -> C6H + H + H
    k(4113) = small + (3.00e-07&
        *invsqrT32)

    !C6H3+ + E -> C6H + H2
    k(4114) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C6H3+ + E -> C6H2 + H
    k(4115) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C7H2+ + E -> C7 + H2
    k(4116) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C7H2+ + E -> C7H + H
    k(4117) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C7HN+ + E -> CN + C6H
    k(4118) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C7HN+ + E -> C7N + H
    k(4119) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C8H+ + E -> C7H + C
    k(4120) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C8H+ + E -> C8 + H
    k(4121) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C9+ + E -> C7 + C2
    k(4122) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C9+ + E -> C8 + C
    k(4123) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !CH3OCH3+ + E -> CH3 + CH3 + O
    k(4124) = small + (1.50e-07&
        *invsqrT32)

    !CH3OCH3+ + E -> H2CO + CH4
    k(4125) = small + (3.00e-07&
        *invsqrT32)

    !CH3OCH3+ + E -> CH4O + CH2
    k(4126) = small + (1.50e-07&
        *invsqrT32)

    !H5C2O2+ + E -> CH4O + HCO
    k(4127) = small + (1.50e-07&
        *invsqrT32)

    !H5C2O2+ + E -> HCOOCH3 + H
    k(4128) = small + (1.50e-07&
        *invsqrT32)

    !C10+ + E -> C8 + C2
    k(4129) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C10+ + E -> C9 + C
    k(4130) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C2H5OH2+ + E -> C2H4 + H2O + H
    k(4131) = small + (1.50e-07&
        *invsqrT32)

    !C2H5OH2+ + E -> C2H4O + H2 + H
    k(4132) = small + (1.50e-07&
        *invsqrT32)

    !C2H5OH2+ + E -> C2H5OH + H
    k(4133) = small + (1.50e-07&
        *invsqrT32)

    !C2H6CO+ + E -> CH3 + CH3 + CO
    k(4134) = small + (1.50e-07&
        *invsqrT32)

    !C2H6CO+ + E -> C2H4O + CH2
    k(4135) = small + (1.50e-07&
        *invsqrT32)

    !C5H4N+ + E -> C5N + H2 + H2
    k(4136) = small + (1.50e-07&
        *invsqrT32)

    !C5H4N+ + E -> HC5N + H2 + H
    k(4137) = small + (1.50e-07&
        *invsqrT32)

    !C5H5+ + E -> C5H2 + H2 + H
    k(4138) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C5H5+ + E -> CH3C4H + H
    k(4139) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C6H4+ + E -> C6H + H2 + H
    k(4140) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C6H4+ + E -> C6H2 + H2
    k(4141) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C7H2N+ + E -> C7N + H2
    k(4142) = small + (1.50e-07&
        *invsqrT32)

    !C7H2N+ + E -> HC7N + H
    k(4143) = small + (1.50e-07&
        *invsqrT32)

    !C7H3+ + E -> C7H + H2
    k(4144) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C7H3+ + E -> C7H2 + H
    k(4145) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C8H2+ + E -> C8 + H2
    k(4146) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C8H2+ + E -> C8H + H
    k(4147) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C9H+ + E -> C8H + C
    k(4148) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C9H+ + E -> C9 + H
    k(4149) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C9N+ + E -> C2 + C7N
    k(4150) = small + (3.00e-07&
        *invsqrT32)

    !CH3OCH4+ + E -> CH3 + CH4 + O
    k(4151) = small + (1.50e-07&
        *invsqrT32)

    !CH3OCH4+ + E -> CH4O + CH3
    k(4152) = small + (1.50e-07&
        *invsqrT32)

    !CH3OCH4+ + E -> CH3OCH3 + H
    k(4153) = small + (1.50e-07&
        *invsqrT32)

    !C3H6OH+ + E -> C2H4O + CH3
    k(4154) = small + (1.50e-07&
        *invsqrT32)

    !C3H6OH+ + E -> C2H6CO + H
    k(4155) = small + (1.50e-07&
        *invsqrT32)

    !C4H7+ + E -> C4H + H2 + H2 + H2
    k(4156) = small + (6.00e-08&
        *invsqrT32)

    !C4H7+ + E -> C3H3 + CH4
    k(4157) = small + (1.95e-07&
        *invsqrT32)

    !C4H7+ + E -> C2H3 + C2H4
    k(4158) = small + (2.25e-08&
        *invsqrT32)

    !C4H7+ + E -> C2H2 + C2H5
    k(4159) = small + (2.25e-08&
        *invsqrT32)

    !C6H4N+ + E -> CH3 + HC5N
    k(4160) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C6H4N+ + E -> CH3C5N + H
    k(4161) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C6H5+ + E -> C6H + H2 + H2
    k(4162) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C6H5+ + E -> C6H2 + H2 + H
    k(4163) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C7H3N+ + E -> C7N + H2 + H
    k(4164) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C7H3N+ + E -> HC7N + H2
    k(4165) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C7H4+ + E -> C7H + H2 + H
    k(4166) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C7H4+ + E -> C7H2 + H2
    k(4167) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C8H3+ + E -> C8H + H2
    k(4168) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C8H3+ + E -> C8H2 + H
    k(4169) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C9H2+ + E -> C9 + H2
    k(4170) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C9H2+ + E -> C9H + H
    k(4171) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C9HN+ + E -> CN + C8H
    k(4172) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C9HN+ + E -> C9N + H
    k(4173) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C7H5+ + E -> C7H2 + H2 + H
    k(4174) = small + (3.50e-07&
        *invsqrT32)

    !C7H5+ + E -> CH3C6H + H
    k(4175) = small + (3.50e-07&
        *invsqrT32)

    !C8H4+ + E -> C8H + H2 + H
    k(4176) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C8H4+ + E -> C8H2 + H2
    k(4177) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C9H2N+ + E -> C9N + H2
    k(4178) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C9H2N+ + E -> HC9N + H
    k(4179) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C9H3+ + E -> C9H + H2
    k(4180) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C9H3+ + E -> C9H2 + H
    k(4181) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C6H7+ + E -> C6H6 + H
    k(4182) = small + (5.00e-07&
        *invsqrT32)

    !C6H7+ + E -> C6H2 + H2 + H2 + H
    k(4183) = small + (5.00e-07&
        *invsqrT32)

    !C8H4N+ + E -> CH3 + HC7N
    k(4184) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C8H4N+ + E -> CH3C7N + H
    k(4185) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C8H5+ + E -> C8H + H2 + H2
    k(4186) = small + (1.50e-07&
        *invsqrT32)

    !C8H5+ + E -> C8H2 + H + H2
    k(4187) = small + (1.50e-07&
        *invsqrT32)

    !C9H3N+ + E -> C9N + H2 + H
    k(4188) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C9H3N+ + E -> HC9N + H2
    k(4189) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C9H4+ + E -> C9H + H2 + H
    k(4190) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C9H4+ + E -> C9H2 + H2
    k(4191) = small + (1.00e-06&
        *T32**(-3.00e-01))

    !C9H5+ + E -> C9H + H2 + H2
    k(4192) = small + (1.50e-07&
        *invsqrT32)

    !C9H5+ + E -> C9H2 + H2 + H
    k(4193) = small + (1.50e-07&
        *invsqrT32)

    !C+ + E -> C
    k(4194) = small + (4.40e-12*T32**(-6.10e-01))

    !CL+ + E -> CL
    k(4195) = small + (1.13e-10&
        *T32**(-7.00e-01))

    !FE+ + E -> FE
    k(4196) = small + (3.70e-12&
        *T32**(-6.50e-01))

    !H+ + E -> H
    k(4197) = small + (3.50e-12*T32**(-7.00e-01))

    !HE+ + E -> HE
    k(4198) = small + (4.50e-12&
        *T32**(-6.70e-01))

    !MG+ + E -> MG
    k(4199) = small + (2.80e-12&
        *T32**(-8.60e-01))

    !N+ + E -> N
    k(4200) = small + (3.80e-12*T32**(-6.20e-01))

    !NA+ + E -> NA
    k(4201) = small + (2.70e-12&
        *T32**(-6.90e-01))

    !O+ + E -> O
    k(4202) = small + (3.40e-12*T32**(-6.30e-01))

    !S+ + E -> S
    k(4203) = small + (3.90e-12*T32**(-6.30e-01))

    !SI+ + E -> SI
    k(4204) = small + (4.90e-12&
        *T32**(-6.00e-01))

    !H2+ + E -> H2
    k(4205) = small + (2.25e-07&
        *T32**(-4.00e-01))

    !H2S+ + E -> H2S
    k(4206) = small + (1.10e-10&
        *T32**(-7.00e-01))

    !CH3+ + E -> CH3
    k(4207) = small + (1.10e-10&
        *T32**(-7.00e-01))

    !H2CO+ + E -> H2CO
    k(4208) = small + (1.10e-10&
        *T32**(-7.00e-01))

    !H2CS+ + E -> H2CS
    k(4209) = small + (1.10e-10&
        *T32**(-7.00e-01))

    !C+ + C- -> C + C
    k(4210) = small + (2.30e-07*invsqrT32)

    !C+ + H- -> H + C
    k(4211) = small + (2.30e-07*invsqrT32)

    !C+ + S- -> C + S
    k(4212) = small + (2.30e-07*invsqrT32)

    !FE+ + C- -> FE + C
    k(4213) = small + (2.30e-07*invsqrT32)

    !FE+ + H- -> FE + H
    k(4214) = small + (2.30e-07*invsqrT32)

    !FE+ + S- -> FE + S
    k(4215) = small + (2.30e-07*invsqrT32)

    !H+ + C- -> H + C
    k(4216) = small + (2.30e-07*invsqrT32)

    !H+ + H- -> H + H
    k(4217) = small + (2.30e-07*invsqrT32)

    !H+ + S- -> H + S
    k(4218) = small + (2.30e-07*invsqrT32)

    !HE+ + C- -> HE + C
    k(4219) = small + (2.30e-07*invsqrT32)

    !HE+ + H- -> H + HE
    k(4220) = small + (2.30e-07*invsqrT32)

    !HE+ + S- -> HE + S
    k(4221) = small + (2.30e-07*invsqrT32)

    !MG+ + C- -> MG + C
    k(4222) = small + (2.30e-07*invsqrT32)

    !MG+ + H- -> MG + H
    k(4223) = small + (2.30e-07*invsqrT32)

    !MG+ + S- -> MG + S
    k(4224) = small + (2.30e-07*invsqrT32)

    !N+ + C- -> N + C
    k(4225) = small + (2.30e-07*invsqrT32)

    !N+ + H- -> H + N
    k(4226) = small + (2.30e-07*invsqrT32)

    !N+ + S- -> N + S
    k(4227) = small + (2.30e-07*invsqrT32)

    !NA+ + C- -> NA + C
    k(4228) = small + (2.30e-07*invsqrT32)

    !NA+ + H- -> NA + H
    k(4229) = small + (2.30e-07*invsqrT32)

    !NA+ + S- -> NA + S
    k(4230) = small + (2.30e-07*invsqrT32)

    !O+ + C- -> O + C
    k(4231) = small + (2.30e-07*invsqrT32)

    !O+ + H- -> H + O
    k(4232) = small + (2.30e-07*invsqrT32)

    !O+ + S- -> O + S
    k(4233) = small + (2.30e-07*invsqrT32)

    !S+ + C- -> S + C
    k(4234) = small + (2.30e-07*invsqrT32)

    !S+ + H- -> S + H
    k(4235) = small + (2.30e-07*invsqrT32)

    !S+ + S- -> S + S
    k(4236) = small + (2.30e-07*invsqrT32)

    !SI+ + C- -> SI + C
    k(4237) = small + (2.30e-07*invsqrT32)

    !SI+ + H- -> SI + H
    k(4238) = small + (2.30e-07*invsqrT32)

    !SI+ + S- -> SI + S
    k(4239) = small + (2.30e-07*invsqrT32)

    !H2+ + H- -> H + H2
    k(4240) = small + (2.30e-07*invsqrT32)

    !H3+ + H- -> H2 + H2
    k(4241) = small + (2.30e-07*invsqrT32)

    !HCO+ + H- -> CO + H2
    k(4242) = small + (2.30e-07&
        *invsqrT32)

    !H3O+ + H- -> OH + H2 + H
    k(4243) = small + (2.30e-07&
        *invsqrT32)

    !H3O+ + H- -> H2O + H2
    k(4244) = small + (2.30e-07&
        *invsqrT32)

    !NH4+ + H- -> NH3 + H2
    k(4245) = small + (2.30e-07&
        *invsqrT32)

    !C + E -> C-
    k(4246) = small + (3.00e-15)

    !H + E -> H-
    k(4247) = small + (3.00e-16*T32**(1.00e+00))

    !O + E -> O-
    k(4248) = small + (1.50e-15)

    !S + E -> S-
    k(4249) = small + (5.00e-15)

    !C -> C+ + E
    k(4250) = rateEvaluateOnce(4250)

    !CL -> CL+ + E
    k(4251) = rateEvaluateOnce(4251)

    !FE -> FE+ + E
    k(4252) = rateEvaluateOnce(4252)

    !MG -> MG+ + E
    k(4253) = rateEvaluateOnce(4253)

    !NA -> NA+ + E
    k(4254) = rateEvaluateOnce(4254)

    !S -> S+ + E
    k(4255) = rateEvaluateOnce(4255)

    !SI -> SI+ + E
    k(4256) = rateEvaluateOnce(4256)

    !C2 -> C + C
    k(4257) = rateEvaluateOnce(4257)

    !C2 -> C2+ + E
    k(4258) = rateEvaluateOnce(4258)

    !CCL -> CL + C
    k(4259) = rateEvaluateOnce(4259)

    !CH -> C + H
    k(4260) = rateEvaluateOnce(4260)

    !CH -> CH+ + E
    k(4261) = rateEvaluateOnce(4261)

    !CLO -> CL + O
    k(4262) = rateEvaluateOnce(4262)

    !CN -> C + N
    k(4263) = rateEvaluateOnce(4263)

    !CO -> C + O
    k(4264) = rateEvaluateOnce(4264)

    !CS -> C + S
    k(4265) = rateEvaluateOnce(4265)

    !H2 -> H + H
    k(4266) = rateEvaluateOnce(4266)

    !HCL -> CL + H
    k(4267) = rateEvaluateOnce(4267)

    !HF -> F + H
    k(4268) = rateEvaluateOnce(4268)

    !HS -> H + S
    k(4269) = rateEvaluateOnce(4269)

    !N2 -> N + N
    k(4270) = rateEvaluateOnce(4270)

    !NH -> H + N
    k(4271) = rateEvaluateOnce(4271)

    !NH -> NH+ + E
    k(4272) = rateEvaluateOnce(4272)

    !NO -> N + O
    k(4273) = rateEvaluateOnce(4273)

    !NO -> NO+ + E
    k(4274) = rateEvaluateOnce(4274)

    !NS -> N + S
    k(4275) = rateEvaluateOnce(4275)

    !O2 -> O + O
    k(4276) = rateEvaluateOnce(4276)

    !O2 -> O2+ + E
    k(4277) = rateEvaluateOnce(4277)

    !OH -> O + H
    k(4278) = rateEvaluateOnce(4278)

    !OH -> OH+ + E
    k(4279) = rateEvaluateOnce(4279)

    !SIC -> SI + C
    k(4280) = rateEvaluateOnce(4280)

    !SIH -> SI + H
    k(4281) = rateEvaluateOnce(4281)

    !SIO -> SI + O
    k(4282) = rateEvaluateOnce(4282)

    !SIS -> SI + S
    k(4283) = rateEvaluateOnce(4283)

    !SO -> O + S
    k(4284) = rateEvaluateOnce(4284)

    !C2H -> C2 + H
    k(4285) = rateEvaluateOnce(4285)

    !C2H -> C2H+ + E
    k(4286) = rateEvaluateOnce(4286)

    !C2N -> C2 + N
    k(4287) = rateEvaluateOnce(4287)

    !C2N -> CN + C
    k(4288) = rateEvaluateOnce(4288)

    !C2S -> C2 + S
    k(4289) = rateEvaluateOnce(4289)

    !C3 -> C2 + C
    k(4290) = rateEvaluateOnce(4290)

    !CH2 -> CH + H
    k(4291) = rateEvaluateOnce(4291)

    !CH2 -> CH2+ + E
    k(4292) = rateEvaluateOnce(4292)

    !CO2 -> CO + O
    k(4293) = rateEvaluateOnce(4293)

    !H2O -> OH + H
    k(4294) = rateEvaluateOnce(4294)

    !H2O -> H2O+ + E
    k(4295) = rateEvaluateOnce(4295)

    !H2S -> HS + H
    k(4296) = rateEvaluateOnce(4296)

    !HCN -> CN + H
    k(4297) = rateEvaluateOnce(4297)

    !HCO -> H + CO
    k(4298) = rateEvaluateOnce(4298)

    !HCO -> HCO+ + E
    k(4299) = rateEvaluateOnce(4299)

    !HNC -> CN + H
    k(4300) = rateEvaluateOnce(4300)

    !HNO -> NO + H
    k(4301) = rateEvaluateOnce(4301)

    !NAOH -> NA + OH
    k(4302) = rateEvaluateOnce(4302)

    !NH2 -> NH + H
    k(4303) = rateEvaluateOnce(4303)

    !NH2 -> NH2+ + E
    k(4304) = rateEvaluateOnce(4304)

    !NO2 -> NO + O
    k(4305) = rateEvaluateOnce(4305)

    !OCN -> O + CN
    k(4306) = rateEvaluateOnce(4306)

    !OCS -> CO + S
    k(4307) = rateEvaluateOnce(4307)

    !OCS -> OCS+ + E
    k(4308) = rateEvaluateOnce(4308)

    !SO2 -> SO + O
    k(4309) = rateEvaluateOnce(4309)

    !C2H2 -> C2H + H
    k(4310) = rateEvaluateOnce(4310)

    !C2H2 -> C2H2+ + E
    k(4311) = rateEvaluateOnce(4311)

    !C3H -> C3 + H
    k(4312) = rateEvaluateOnce(4312)

    !HC3 -> C3 + H
    k(4313) = rateEvaluateOnce(4313)

    !C3N -> C2 + CN
    k(4314) = rateEvaluateOnce(4314)

    !C3O -> C2 + CO
    k(4315) = rateEvaluateOnce(4315)

    !C3S -> C2 + CS
    k(4316) = rateEvaluateOnce(4316)

    !C4 -> C2 + C2
    k(4317) = rateEvaluateOnce(4317)

    !C4 -> C3 + C
    k(4318) = rateEvaluateOnce(4318)

    !CH3 -> CH + H2
    k(4319) = rateEvaluateOnce(4319)

    !CH3 -> CH2 + H
    k(4320) = rateEvaluateOnce(4320)

    !CH3 -> CH3+ + E
    k(4321) = rateEvaluateOnce(4321)

    !H2CO -> CO + H + H
    k(4322) = rateEvaluateOnce(4322)

    !H2CO -> CO + H2
    k(4323) = rateEvaluateOnce(4323)

    !H2CO -> HCO+ + H + E
    k(4324) = rateEvaluateOnce(4324)

    !H2CO -> H2CO+ + E
    k(4325) = rateEvaluateOnce(4325)

    !H2CS -> CS + H2
    k(4326) = rateEvaluateOnce(4326)

    !NH3 -> NH + H2
    k(4327) = rateEvaluateOnce(4327)

    !NH3 -> NH2 + H
    k(4328) = rateEvaluateOnce(4328)

    !NH3 -> NH3+ + E
    k(4329) = rateEvaluateOnce(4329)

    !C2H2O -> CH2 + CO
    k(4330) = rateEvaluateOnce(4330)

    !C2H2O -> C2H2O+ + E
    k(4331) = rateEvaluateOnce(4331)

    !C2H3 -> C2H2 + H
    k(4332) = rateEvaluateOnce(4332)

    !C2H3 -> C2H3+ + E
    k(4333) = rateEvaluateOnce(4333)

    !C3H2 -> C3 + H2
    k(4334) = rateEvaluateOnce(4334)

    !H2C3 -> C3 + H2
    k(4335) = rateEvaluateOnce(4335)

    !C3H2 -> C3H + H
    k(4336) = rateEvaluateOnce(4336)

    !H2C3 -> HC3 + H
    k(4337) = rateEvaluateOnce(4337)

    !C4H -> C2H + C2
    k(4338) = rateEvaluateOnce(4338)

    !C4H -> C4 + H
    k(4339) = rateEvaluateOnce(4339)

    !C4N -> C3 + CN
    k(4340) = rateEvaluateOnce(4340)

    !C4S -> C3 + CS
    k(4341) = rateEvaluateOnce(4341)

    !C5 -> C3 + C2
    k(4342) = rateEvaluateOnce(4342)

    !CH2O2 -> HCO + OH
    k(4343) = rateEvaluateOnce(4343)

    !CH2O2 -> CH2O2+ + E
    k(4344) = rateEvaluateOnce(4344)

    !CH3N -> HCN + H2
    k(4345) = rateEvaluateOnce(4345)

    !CH4 -> CH + H + H2
    k(4346) = rateEvaluateOnce(4346)

    !CH4 -> CH2 + H2
    k(4347) = rateEvaluateOnce(4347)

    !CH4 -> CH3 + H
    k(4348) = rateEvaluateOnce(4348)

    !HC3N -> C2H + CN
    k(4349) = rateEvaluateOnce(4349)

    !C2H3N -> CH3 + CN
    k(4350) = rateEvaluateOnce(4350)

    !C2H3N -> C2H3N+ + E
    k(4351) = rateEvaluateOnce(4351)

    !C2H4 -> C2H2 + H2
    k(4352) = rateEvaluateOnce(4352)

    !C2H4 -> C2H4+ + E
    k(4353) = rateEvaluateOnce(4353)

    !C3H3 -> C3H + H2
    k(4354) = rateEvaluateOnce(4354)

    !C3H3 -> HC3 + H2
    k(4355) = rateEvaluateOnce(4355)

    !C3H3 -> C3H2 + H
    k(4356) = rateEvaluateOnce(4356)

    !C3H3 -> H2C3 + H
    k(4357) = rateEvaluateOnce(4357)

    !C4H2 -> C2H + C2H
    k(4358) = rateEvaluateOnce(4358)

    !C4H2 -> C4H + H
    k(4359) = rateEvaluateOnce(4359)

    !C4H2 -> C4H2+ + E
    k(4360) = rateEvaluateOnce(4360)

    !C5H -> C2H + C3
    k(4361) = rateEvaluateOnce(4361)

    !C5H -> C3H + C2
    k(4362) = rateEvaluateOnce(4362)

    !C5H -> HC3 + C2
    k(4363) = rateEvaluateOnce(4363)

    !C5H -> C5 + H
    k(4364) = rateEvaluateOnce(4364)

    !C5N -> C4 + CN
    k(4365) = rateEvaluateOnce(4365)

    !CH4O -> H2CO + H2
    k(4366) = rateEvaluateOnce(4366)

    !CH4O -> CH4O+ + E
    k(4367) = rateEvaluateOnce(4367)

    !C2H4O -> CH3 + HCO
    k(4368) = rateEvaluateOnce(4368)

    !C2H4O -> CH4 + CO
    k(4369) = rateEvaluateOnce(4369)

    !C2H4O -> C2H4O+ + E
    k(4370) = rateEvaluateOnce(4370)

    !C3H4 -> C3H2 + H2
    k(4371) = rateEvaluateOnce(4371)

    !C3H4 -> H2C3 + H2
    k(4372) = rateEvaluateOnce(4372)

    !C3H4 -> C3H3 + H
    k(4373) = rateEvaluateOnce(4373)

    !C3H4 -> C3H4+ + E
    k(4374) = rateEvaluateOnce(4374)

    !C4H4 -> C3H4 + C
    k(4375) = rateEvaluateOnce(4375)

    !C4H6 -> C3H6 + C
    k(4376) = rateEvaluateOnce(4376)

    !C5H2 -> C3H + C2H
    k(4377) = rateEvaluateOnce(4377)

    !C5H2 -> HC3 + C2H
    k(4378) = rateEvaluateOnce(4378)

    !C5H2 -> C5H + H
    k(4379) = rateEvaluateOnce(4379)

    !C6H -> C2H + C4
    k(4380) = rateEvaluateOnce(4380)

    !C6H -> C3H + C3
    k(4381) = rateEvaluateOnce(4381)

    !C6H -> HC3 + C3
    k(4382) = rateEvaluateOnce(4382)

    !CH5N -> CN + H2 + H2 + H
    k(4383) = rateEvaluateOnce(4383)

    !CH5N -> HCN + H2 + H + H
    k(4384) = rateEvaluateOnce(4384)

    !CH5N -> CH3 + NH2
    k(4385) = rateEvaluateOnce(4385)

    !CH5N -> CH3N + H + H
    k(4386) = rateEvaluateOnce(4386)

    !CH5N -> CH5N+ + E
    k(4387) = rateEvaluateOnce(4387)

    !HC5N -> H + C5N
    k(4388) = rateEvaluateOnce(4388)

    !HC5N -> C4H + CN
    k(4389) = rateEvaluateOnce(4389)

    !CH3C3N -> C3N + CH3
    k(4390) = rateEvaluateOnce(4390)

    !NC4N -> CN + CN + C2
    k(4391) = rateEvaluateOnce(4391)

    !NC6N -> CN + CN + C4
    k(4392) = rateEvaluateOnce(4392)

    !NC8N -> CN + CN + C6
    k(4393) = rateEvaluateOnce(4393)

    !NC10N -> CN + CN + C8
    k(4394) = rateEvaluateOnce(4394)

    !NC12N -> CN + CN + C10
    k(4395) = rateEvaluateOnce(4395)

    !HC4N -> CH + C2 + CN
    k(4396) = rateEvaluateOnce(4396)

    !HC6N -> CH + C4 + CN
    k(4397) = rateEvaluateOnce(4397)

    !HC8N -> CH + C6 + CN
    k(4398) = rateEvaluateOnce(4398)

    !HC10N -> CH + C8 + CN
    k(4399) = rateEvaluateOnce(4399)

    !HC12N -> CH + C10 + CN
    k(4400) = rateEvaluateOnce(4400)

    !HC13N -> CH + C11 + CN
    k(4401) = rateEvaluateOnce(4401)

    !SIC2H3 -> SIC2H2 + H
    k(4402) = rateEvaluateOnce(4402)

    !SIC3H3 -> SIC3H + H2
    k(4403) = rateEvaluateOnce(4403)

    !SIC3H5 -> SIC3H + H2 + H2
    k(4404) = rateEvaluateOnce(4404)

    !SIC4H -> SI + C4H
    k(4405) = rateEvaluateOnce(4405)

    !SIC6H -> SI + C6H
    k(4406) = rateEvaluateOnce(4406)

    !SIC8H -> SI + C8H
    k(4407) = rateEvaluateOnce(4407)

    !C2H5OH -> C2H4 + H2O
    k(4408) = rateEvaluateOnce(4408)

    !C2H5OH -> C2H5OH+ + E
    k(4409) = rateEvaluateOnce(4409)

    !CH3C4H -> C4H + CH3
    k(4410) = rateEvaluateOnce(4410)

    !CH3OCH3 -> H2CO + CH4
    k(4411) = rateEvaluateOnce(4411)

    !CH3OCH3 -> CH3OCH3+ + E
    k(4412) = rateEvaluateOnce(4412)

    !C2+ -> C+ + C
    k(4413) = rateEvaluateOnce(4413)

    !CH+ -> C+ + H
    k(4414) = rateEvaluateOnce(4414)

    !H2+ -> H+ + H
    k(4415) = rateEvaluateOnce(4415)

    !OH+ -> H+ + O
    k(4416) = rateEvaluateOnce(4416)

    !SIH+ -> SI+ + H
    k(4417) = rateEvaluateOnce(4417)

    !C2H+ -> C2+ + H
    k(4418) = rateEvaluateOnce(4418)

    !CH2+ -> CH+ + H
    k(4419) = rateEvaluateOnce(4419)

    !H3+ -> H+ + H2
    k(4420) = rateEvaluateOnce(4420)

    !H3+ -> H2+ + H
    k(4421) = rateEvaluateOnce(4421)

    !CH3+ -> CH+ + H2
    k(4422) = rateEvaluateOnce(4422)

    !CH3+ -> CH2+ + H
    k(4423) = rateEvaluateOnce(4423)

    !C- -> C + E
    k(4424) = rateEvaluateOnce(4424)

    !H- -> H + E
    k(4425) = rateEvaluateOnce(4425)

    !O- -> O + E
    k(4426) = rateEvaluateOnce(4426)

    !S- -> S + E
    k(4427) = rateEvaluateOnce(4427)

    !CN- -> CN + E
    k(4428) = rateEvaluateOnce(4428)

    !OH- -> OH + E
    k(4429) = rateEvaluateOnce(4429)

    coe(:) = k(:) !set coefficients to return variable

    !!uncomment below to check coefficient values
    !kmax = 1d0
    !if(maxval(k)>kmax.or.minval(k)<0d0) then
    !   print *,"***************"
    !   do i=1,size(k)
    !      if(k(i)<0d0.or.k(i)>kmax) print *,i,k(i)
    !   end do
    !end if
  end function coe

  !*************************
  subroutine loadReactionsVerbatim()
    use krome_commons
    implicit none
    character*50::fname,line
    integer::ios,i,nunit

    fname = "reactions_verbatim.dat"

    !verbatim reactions are loaded from file
    ! to increase compilation speed
    open(newunit=nunit,file=trim(fname),status="old",iostat=ios)
    if(ios/=0) then
      print *,"ERROR: "//trim(fname)//" file not present!"
      stop
    end if

    !load reactions from file
    do i=1,nrea
      read(nunit,'(a)',iostat=ios) line
      if(ios/=0) then
        print *,"ERROR: problem reading "//trim(fname)
        stop
      end if
      reactionNames(i) = trim(line)
    end do
    close(nunit)

  end subroutine loadReactionsVerbatim

  !*******************
  !The following functions compute the recombination rate
  ! on dust for H+, He+, C+, Si+, and O+. See Weingartner&Draine 2001
  ! dust2gas_ratio, D/D_sol, default is assumed equal to Z/Z_sol
  function H_recombination_on_dust(n,Tgas)
    use krome_commons
    implicit none
    real*8::n(nspec),Tgas,psi
    real*8::H_recombination_on_dust

    H_recombination_on_dust = 0d0

    if(n(idx_E)<1d-20.or.GHabing<=0.d0) return

    psi = GHabing*sqrt(Tgas)/n(idx_E)

    if(psi<=0) return

    H_recombination_on_dust =  1.225d-13*dust2gas_ratio &
        /(1.d0+8.074d-6*psi**(1.378)*(1.d0+5.087d2 &
        *Tgas**(0.01586)*psi**(-0.4723-1.102d-5*log(Tgas))))

  end function H_recombination_on_dust

  !******************
  function He_recombination_on_dust(n,Tgas)
    use krome_commons
    implicit none
    real*8::n(nspec),Tgas,psi
    real*8::He_recombination_on_dust

    He_recombination_on_dust = 0d0
    if(n(idx_E)<1d-20.or.GHabing<=0.d0) return

    psi = GHabing*sqrt(Tgas)/n(idx_E)

    if(psi<=0) return

    He_recombination_on_dust = 5.572d-14*dust2gas_ratio&
        /(1.d0+3.185d-7*psi**(1.512)*(1.d0+5.115d3&
        *Tgas**(3.903d-7)*psi**(-0.4956-5.494d-7*log(Tgas))))

  end function He_recombination_on_dust

  !*******************
  function C_recombination_on_dust(n,Tgas)
    use krome_commons
    implicit none
    real*8::n(nspec),Tgas,psi
    real*8::C_recombination_on_dust

    C_recombination_on_dust = 0d0
    if(n(idx_E)<1d-20.or.GHabing<=0.d0) return

    psi = GHabing*sqrt(Tgas)/n(idx_E)

    if(psi<=0) return

    C_recombination_on_dust = 4.558d-13*dust2gas_ratio&
        /(1.d0+6.089d-3*psi**(1.128)*(1.d0+4.331d2&
        *Tgas**(0.04845)*psi**(-0.8120-1.333d-4*log(Tgas))))

  end function C_recombination_on_dust

  !******************
  function Si_recombination_on_dust(n,Tgas)
    use krome_commons
    implicit none
    real*8::n(nspec),Tgas,psi
    real*8::Si_recombination_on_dust

    Si_recombination_on_dust = 0d0
    if(n(idx_E)<1d-20.or.GHabing<=0.d0) return

    psi = GHabing*sqrt(Tgas)/n(idx_E)

    if(psi<=0) return

    Si_recombination_on_dust = 2.166d-14*dust2gas_ratio&
        /(1.d0+5.678d-8*psi**(1.874)*(1.d0+4.375d4&
        *Tgas**(1.635d-6)*psi**(-0.8964-7.538d-5*log(Tgas))))

  end function Si_recombination_on_dust

  !********************
  function O_recombination_on_dust(n,Tgas)
    use krome_commons
    implicit none
    real*8::n(nspec),Tgas,k_H
    real*8::O_recombination_on_dust

    k_H = H_recombination_on_dust(n(:),Tgas)
    O_recombination_on_dust = 0.25d0*k_H

  end function O_recombination_on_dust

  !*********************
  !This function returns the
  ! photorate of H2 occurring in the
  ! Lyman-Werner bands following the approximation
  ! provided by Glover&Jappsen 2007. Rate in 1/s.
  !Approximation valid at low-density, it assumes H2(nu = 0).
  !It also stores the rate as a common, needed for the photoheating
  function H2_solomonLW(myflux)
    use krome_commons
    use krome_constants
    implicit none
    real*8::H2_solomonLW,myflux

    !myflux is the radiation background at E = 12.87 eV
    !should be converted to erg
    H2_solomonLW = 1.38d9*myflux*eV_to_erg

  end function H2_solomonLW

  !****************************
  !tanh smoothing function that
  ! increses when xarg increases.
  ! xpos is the position of the transition point.
  ! slope is the steepness of the curve.
  function smooth_increase(xarg,xpos,slope)
    implicit none
    real*8::smooth_increase,xarg,xpos,slope

    smooth_increase = .5d0 * (tanh(slope * (xarg - xpos)) &
        + 1d0)

  end function smooth_increase

  !****************************
  !tanh smoothing function that
  ! decreses when xarg increases.
  ! xpos is the position of the transition point.
  ! slope is the steepness of the curve.
  function smooth_decrease(xarg,xpos,slope)
    implicit none
    real*8::smooth_decrease,xarg,xpos,slope

    smooth_decrease = .5d0 * (tanh(-slope * (xarg - xpos)) &
        + 1d0)

  end function smooth_decrease

  !*********************
  !sign: return 1d0 if x>=0d0,
  ! else return -1d0
  function get_sgn(x)
    implicit none
    real*8::x,get_sgn

    get_sgn = 1d0
    if(x==0d0) return
    get_sgn = x/abs(x)

  end function get_sgn

  !*********************
  function conserve(n,ni)
    use krome_commons
    implicit none
    real*8::conserve(nspec),n(nspec),ni(nspec),no(nspec)
    real*8::ntot,nitot,factor

    no(:) = n(:)

    conserve(:) = 0d0
    conserve(:) = no(:)

  end function conserve

  !*************************
  !this subroutine changes the x(:) mass fractions of the species
  ! to force conservation according to the reference ref(:)
  subroutine conserveLin_x(x,ref)
    use krome_commons
    use krome_getphys
    implicit none
    real*8::x(nmols),ref(natoms)
    real*8::A(natoms,natoms),B(natoms),m(nspec)

    m(:) = get_mass()
    A(:,:) = 0d0
    B(:) = ref(:)

    !charge conservation
    x(idx_E) = m(idx_E)*(- 1d0*x(idx_GRAINk) / m(idx_GRAINk) &
        - 1d0*x(idx_Hk) / m(idx_Hk) &
        - 1d0*x(idx_Ck) / m(idx_Ck) &
        - 1d0*x(idx_CNk) / m(idx_CNk) &
        - 1d0*x(idx_Ok) / m(idx_Ok) &
        - 1d0*x(idx_OHk) / m(idx_OHk) &
        - 1d0*x(idx_Sk) / m(idx_Sk) &
        + 1d0*x(idx_Cj) / m(idx_Cj) &
        + 1d0*x(idx_FEj) / m(idx_FEj) &
        + 1d0*x(idx_Hj) / m(idx_Hj) &
        + 1d0*x(idx_HEj) / m(idx_HEj) &
        + 1d0*x(idx_MGj) / m(idx_MGj) &
        + 1d0*x(idx_Nj) / m(idx_Nj) &
        + 1d0*x(idx_NAj) / m(idx_NAj) &
        + 1d0*x(idx_Oj) / m(idx_Oj) &
        + 1d0*x(idx_Sj) / m(idx_Sj) &
        + 1d0*x(idx_SIj) / m(idx_SIj) &
        + 1d0*x(idx_H3j) / m(idx_H3j) &
        + 1d0*x(idx_HCOj) / m(idx_HCOj) &
        + 1d0*x(idx_CLj) / m(idx_CLj) &
        + 1d0*x(idx_Pj) / m(idx_Pj) &
        + 1d0*x(idx_COj) / m(idx_COj) &
        + 1d0*x(idx_H2j) / m(idx_H2j) &
        + 1d0*x(idx_NOj) / m(idx_NOj) &
        + 1d0*x(idx_O2j) / m(idx_O2j) &
        + 1d0*x(idx_CH2j) / m(idx_CH2j) &
        + 1d0*x(idx_H2Sj) / m(idx_H2Sj) &
        + 1d0*x(idx_HCSj) / m(idx_HCSj) &
        + 1d0*x(idx_HNOj) / m(idx_HNOj) &
        + 1d0*x(idx_NH2j) / m(idx_NH2j) &
        + 1d0*x(idx_OCSj) / m(idx_OCSj) &
        + 1d0*x(idx_C2H2j) / m(idx_C2H2j) &
        + 1d0*x(idx_CH3j) / m(idx_CH3j) &
        + 1d0*x(idx_NH3j) / m(idx_NH3j) &
        + 1d0*x(idx_C2H2Oj) / m(idx_C2H2Oj) &
        + 1d0*x(idx_CH2O2j) / m(idx_CH2O2j) &
        + 1d0*x(idx_C2H3Nj) / m(idx_C2H3Nj) &
        + 1d0*x(idx_C2H4j) / m(idx_C2H4j) &
        + 1d0*x(idx_C4H2j) / m(idx_C4H2j) &
        + 1d0*x(idx_H3COj) / m(idx_H3COj) &
        + 1d0*x(idx_CH4Oj) / m(idx_CH4Oj) &
        + 1d0*x(idx_C2H4Oj) / m(idx_C2H4Oj) &
        + 1d0*x(idx_C3H4j) / m(idx_C3H4j) &
        + 1d0*x(idx_CH5Nj) / m(idx_CH5Nj) &
        + 1d0*x(idx_C2H5OHj) / m(idx_C2H5OHj) &
        + 1d0*x(idx_CH3OCH3j) / m(idx_CH3OCH3j) &
        + 1d0*x(idx_CHj) / m(idx_CHj) &
        + 1d0*x(idx_CCLj) / m(idx_CCLj) &
        + 1d0*x(idx_C2j) / m(idx_C2j) &
        + 1d0*x(idx_CLOj) / m(idx_CLOj) &
        + 1d0*x(idx_CPj) / m(idx_CPj) &
        + 1d0*x(idx_CFj) / m(idx_CFj) &
        + 1d0*x(idx_CSj) / m(idx_CSj) &
        + 1d0*x(idx_CNj) / m(idx_CNj) &
        + 1d0*x(idx_NSj) / m(idx_NSj) &
        + 1d0*x(idx_PHj) / m(idx_PHj) &
        + 1d0*x(idx_POj) / m(idx_POj) &
        + 1d0*x(idx_SICj) / m(idx_SICj) &
        + 1d0*x(idx_SINj) / m(idx_SINj) &
        + 1d0*x(idx_SISj) / m(idx_SISj) &
        + 1d0*x(idx_SOj) / m(idx_SOj) &
        + 1d0*x(idx_C3j) / m(idx_C3j) &
        + 1d0*x(idx_C2Sj) / m(idx_C2Sj) &
        + 1d0*x(idx_C2Oj) / m(idx_C2Oj) &
        + 1d0*x(idx_CCPj) / m(idx_CCPj) &
        + 1d0*x(idx_C2Hj) / m(idx_C2Hj) &
        + 1d0*x(idx_HOCj) / m(idx_HOCj) &
        + 1d0*x(idx_C2Nj) / m(idx_C2Nj) &
        + 1d0*x(idx_CNCj) / m(idx_CNCj) &
        + 1d0*x(idx_HCPj) / m(idx_HCPj) &
        + 1d0*x(idx_SIC2j) / m(idx_SIC2j) &
        + 1d0*x(idx_SINCj) / m(idx_SINCj) &
        + 1d0*x(idx_HPOj) / m(idx_HPOj) &
        + 1d0*x(idx_HCNj) / m(idx_HCNj) &
        + 1d0*x(idx_CHSIj) / m(idx_CHSIj) &
        + 1d0*x(idx_SIH2j) / m(idx_SIH2j) &
        + 1d0*x(idx_C3Hj) / m(idx_C3Hj) &
        + 1d0*x(idx_C4j) / m(idx_C4j) &
        + 1d0*x(idx_C3Oj) / m(idx_C3Oj) &
        + 1d0*x(idx_C3Sj) / m(idx_C3Sj) &
        + 1d0*x(idx_H2COj) / m(idx_H2COj) &
        + 1d0*x(idx_H2SIOj) / m(idx_H2SIOj) &
        + 1d0*x(idx_HCNHj) / m(idx_HCNHj) &
        + 1d0*x(idx_SIC2Hj) / m(idx_SIC2Hj) &
        + 1d0*x(idx_SIC3j) / m(idx_SIC3j) &
        + 1d0*x(idx_CH2SIj) / m(idx_CH2SIj) &
        + 1d0*x(idx_SIH3j) / m(idx_SIH3j) &
        + 1d0*x(idx_C2H2Nj) / m(idx_C2H2Nj) &
        + 1d0*x(idx_C2H3j) / m(idx_C2H3j) &
        + 1d0*x(idx_C3H2j) / m(idx_C3H2j) &
        + 1d0*x(idx_H2C3j) / m(idx_H2C3j) &
        + 1d0*x(idx_C4Hj) / m(idx_C4Hj) &
        + 1d0*x(idx_C5j) / m(idx_C5j) &
        + 1d0*x(idx_C4Sj) / m(idx_C4Sj) &
        + 1d0*x(idx_PC2Hj) / m(idx_PC2Hj) &
        + 1d0*x(idx_C3Nj) / m(idx_C3Nj) &
        + 1d0*x(idx_C4Nj) / m(idx_C4Nj) &
        + 1d0*x(idx_C3HNj) / m(idx_C3HNj) &
        + 1d0*x(idx_HNCj) / m(idx_HNCj) &
        + 1d0*x(idx_SIC3Hj) / m(idx_SIC3Hj) &
        + 1d0*x(idx_SIC4j) / m(idx_SIC4j) &
        + 1d0*x(idx_SIC2H2j) / m(idx_SIC2H2j) &
        + 1d0*x(idx_SICH3j) / m(idx_SICH3j) &
        + 1d0*x(idx_HC2NCHj) / m(idx_HC2NCHj) &
        + 1d0*x(idx_C3H3j) / m(idx_C3H3j) &
        + 1d0*x(idx_H3C3j) / m(idx_H3C3j) &
        + 1d0*x(idx_C5Hj) / m(idx_C5Hj) &
        + 1d0*x(idx_C6j) / m(idx_C6j) &
        + 1d0*x(idx_C2H3Oj) / m(idx_C2H3Oj) &
        + 1d0*x(idx_C2H5j) / m(idx_C2H5j) &
        + 1d0*x(idx_C3H3Nj) / m(idx_C3H3Nj) &
        + 1d0*x(idx_C5H2j) / m(idx_C5H2j) &
        + 1d0*x(idx_C4H3j) / m(idx_C4H3j) &
        + 1d0*x(idx_C6Hj) / m(idx_C6Hj) &
        + 1d0*x(idx_C7j) / m(idx_C7j) &
        + 1d0*x(idx_CH4Nj) / m(idx_CH4Nj) &
        + 1d0*x(idx_C5HNj) / m(idx_C5HNj) &
        + 1d0*x(idx_C7Hj) / m(idx_C7Hj) &
        + 1d0*x(idx_C8j) / m(idx_C8j) &
        + 1d0*x(idx_COOCH4j) / m(idx_COOCH4j) &
        + 1d0*x(idx_C2H5Oj) / m(idx_C2H5Oj) &
        + 1d0*x(idx_C8Hj) / m(idx_C8Hj) &
        + 1d0*x(idx_C9j) / m(idx_C9j) &
        + 1d0*x(idx_C5H3j) / m(idx_C5H3j) &
        + 1d0*x(idx_C6H2j) / m(idx_C6H2j) &
        + 1d0*x(idx_C6H3j) / m(idx_C6H3j) &
        + 1d0*x(idx_C2H6COj) / m(idx_C2H6COj) &
        + 1d0*x(idx_C9Hj) / m(idx_C9Hj) &
        + 1d0*x(idx_C10j) / m(idx_C10j) &
        + 1d0*x(idx_C7H3j) / m(idx_C7H3j) &
        + 1d0*x(idx_C8H2j) / m(idx_C8H2j) &
        + 1d0*x(idx_C8H3j) / m(idx_C8H3j) &
        + 1d0*x(idx_HCLj) / m(idx_HCLj) &
        + 1d0*x(idx_Fj) / m(idx_Fj) &
        + 1d0*x(idx_HFj) / m(idx_HFj) &
        + 1d0*x(idx_HSj) / m(idx_HSj) &
        + 1d0*x(idx_NHj) / m(idx_NHj) &
        + 1d0*x(idx_OHj) / m(idx_OHj) &
        + 1d0*x(idx_PNj) / m(idx_PNj) &
        + 1d0*x(idx_S2j) / m(idx_S2j) &
        + 1d0*x(idx_SIHj) / m(idx_SIHj) &
        + 1d0*x(idx_SIOj) / m(idx_SIOj) &
        + 1d0*x(idx_H2Oj) / m(idx_H2Oj) &
        + 1d0*x(idx_HNSIj) / m(idx_HNSIj) &
        + 1d0*x(idx_S2Hj) / m(idx_S2Hj) &
        + 1d0*x(idx_PH2j) / m(idx_PH2j) &
        + 1d0*x(idx_H2CSj) / m(idx_H2CSj) &
        + 1d0*x(idx_H2S2j) / m(idx_H2S2j) &
        + 1d0*x(idx_HSIOj) / m(idx_HSIOj) &
        + 1d0*x(idx_C4Pj) / m(idx_C4Pj) &
        + 1d0*x(idx_HCO2j) / m(idx_HCO2j) &
        + 1d0*x(idx_PCH3j) / m(idx_PCH3j) &
        + 1d0*x(idx_CH4j) / m(idx_CH4j) &
        + 1d0*x(idx_C2NHj) / m(idx_C2NHj) &
        + 1d0*x(idx_SIH4j) / m(idx_SIH4j) &
        + 1d0*x(idx_NH4j) / m(idx_NH4j) &
        + 1d0*x(idx_H2NCj) / m(idx_H2NCj) &
        + 1d0*x(idx_C3H2Nj) / m(idx_C3H2Nj) &
        + 1d0*x(idx_C7H2j) / m(idx_C7H2j) &
        + 1d0*x(idx_C5H4j) / m(idx_C5H4j) &
        + 1d0*x(idx_C7HNj) / m(idx_C7HNj) &
        + 1d0*x(idx_C9H2j) / m(idx_C9H2j) &
        + 1d0*x(idx_C7H4j) / m(idx_C7H4j) &
        + 1d0*x(idx_C9HNj) / m(idx_C9HNj) &
        + 1d0*x(idx_N2j) / m(idx_N2j) &
        + 1d0*x(idx_CO2j) / m(idx_CO2j) &
        + 1d0*x(idx_HEHj) / m(idx_HEHj) &
        + 1d0*x(idx_SO2j) / m(idx_SO2j) &
        + 1d0*x(idx_C6H5j) / m(idx_C6H5j) &
        + 1d0*x(idx_C5H5j) / m(idx_C5H5j) &
        + 1d0*x(idx_N2Hj) / m(idx_N2Hj) &
        + 1d0*x(idx_NO2j) / m(idx_NO2j) &
        + 1d0*x(idx_PC2H2j) / m(idx_PC2H2j) &
        + 1d0*x(idx_PNH2j) / m(idx_PNH2j) &
        + 1d0*x(idx_PCH2j) / m(idx_PCH2j) &
        + 1d0*x(idx_HC2Sj) / m(idx_HC2Sj) &
        + 1d0*x(idx_HC3Sj) / m(idx_HC3Sj) &
        + 1d0*x(idx_H3CSj) / m(idx_H3CSj) &
        + 1d0*x(idx_HC4Sj) / m(idx_HC4Sj) &
        + 1d0*x(idx_SIFj) / m(idx_SIFj) &
        + 1d0*x(idx_SINH2j) / m(idx_SINH2j) &
        + 1d0*x(idx_SIC2H3j) / m(idx_SIC2H3j) &
        + 1d0*x(idx_SIC3H2j) / m(idx_SIC3H2j) &
        + 1d0*x(idx_C2HOj) / m(idx_C2HOj) &
        + 1d0*x(idx_H3Oj) / m(idx_H3Oj) &
        + 1d0*x(idx_H3Sj) / m(idx_H3Sj) &
        + 1d0*x(idx_HOCSj) / m(idx_HOCSj) &
        + 1d0*x(idx_CH5Oj) / m(idx_CH5Oj) &
        + 1d0*x(idx_NCOj) / m(idx_NCOj) &
        + 1d0*x(idx_HNCOj) / m(idx_HNCOj) &
        + 1d0*x(idx_C2N2j) / m(idx_C2N2j) &
        + 1d0*x(idx_O2Hj) / m(idx_O2Hj) &
        + 1d0*x(idx_CH5j) / m(idx_CH5j) &
        + 1d0*x(idx_H2CLj) / m(idx_H2CLj) &
        + 1d0*x(idx_H2Fj) / m(idx_H2Fj) &
        + 1d0*x(idx_CH3O2j) / m(idx_CH3O2j) &
        + 1d0*x(idx_H2POj) / m(idx_H2POj) &
        + 1d0*x(idx_PNH3j) / m(idx_PNH3j) &
        + 1d0*x(idx_PCH4j) / m(idx_PCH4j) &
        + 1d0*x(idx_PC2H3j) / m(idx_PC2H3j) &
        + 1d0*x(idx_HSISj) / m(idx_HSISj) &
        + 1d0*x(idx_HSOj) / m(idx_HSOj) &
        + 1d0*x(idx_HNSj) / m(idx_HNSj) &
        + 1d0*x(idx_HPNj) / m(idx_HPNj) &
        + 1d0*x(idx_H2NOj) / m(idx_H2NOj) &
        + 1d0*x(idx_NAH2Oj) / m(idx_NAH2Oj) &
        + 1d0*x(idx_PH3j) / m(idx_PH3j) &
        + 1d0*x(idx_SINCHj) / m(idx_SINCHj) &
        + 1d0*x(idx_HSIO2j) / m(idx_HSIO2j) &
        + 1d0*x(idx_HSO2j) / m(idx_HSO2j) &
        + 1d0*x(idx_HC3Oj) / m(idx_HC3Oj) &
        + 1d0*x(idx_PC3Hj) / m(idx_PC3Hj) &
        + 1d0*x(idx_H3S2j) / m(idx_H3S2j) &
        + 1d0*x(idx_H3SIOj) / m(idx_H3SIOj) &
        + 1d0*x(idx_PC4Hj) / m(idx_PC4Hj) &
        + 1d0*x(idx_NH2CNHj) / m(idx_NH2CNHj) &
        + 1d0*x(idx_SIC4Hj) / m(idx_SIC4Hj) &
        + 1d0*x(idx_SICH4j) / m(idx_SICH4j) &
        + 1d0*x(idx_SIH5j) / m(idx_SIH5j) &
        + 1d0*x(idx_C2H4Nj) / m(idx_C2H4Nj) &
        + 1d0*x(idx_NH2CH2Oj) / m(idx_NH2CH2Oj) &
        + 1d0*x(idx_C2H6j) / m(idx_C2H6j) &
        + 1d0*x(idx_C3H4Nj) / m(idx_C3H4Nj) &
        + 1d0*x(idx_C3H5j) / m(idx_C3H5j) &
        + 1d0*x(idx_C4H4j) / m(idx_C4H4j) &
        + 1d0*x(idx_CH6Nj) / m(idx_CH6Nj) &
        + 1d0*x(idx_C5H2Nj) / m(idx_C5H2Nj) &
        + 1d0*x(idx_C4H4Nj) / m(idx_C4H4Nj) &
        + 1d0*x(idx_H5C2O2j) / m(idx_H5C2O2j) &
        + 1d0*x(idx_C2H5OH2j) / m(idx_C2H5OH2j) &
        + 1d0*x(idx_CH3OCH4j) / m(idx_CH3OCH4j) &
        + 1d0*x(idx_C7H2Nj) / m(idx_C7H2Nj) &
        + 1d0*x(idx_C3H6OHj) / m(idx_C3H6OHj) &
        + 1d0*x(idx_C6H4Nj) / m(idx_C6H4Nj) &
        + 1d0*x(idx_C9H3j) / m(idx_C9H3j) &
        + 1d0*x(idx_C7H5j) / m(idx_C7H5j) &
        + 1d0*x(idx_C8H4Nj) / m(idx_C8H4Nj) &
        + 1d0*x(idx_C9H2Nj) / m(idx_C9H2Nj) &
        + 1d0*x(idx_C6H7j) / m(idx_C6H7j) &
        + 1d0*x(idx_NAH2j) / m(idx_NAH2j) &
        + 1d0*x(idx_PC2H4j) / m(idx_PC2H4j) &
        + 1d0*x(idx_C4H5j) / m(idx_C4H5j) &
        + 1d0*x(idx_H2CCLj) / m(idx_H2CCLj) &
        + 1d0*x(idx_PC4H2j) / m(idx_PC4H2j) &
        + 1d0*x(idx_C6H4j) / m(idx_C6H4j) &
        + 1d0*x(idx_C8H4j) / m(idx_C8H4j) &
        + 1d0*x(idx_C9H4j) / m(idx_C9H4j) &
        + 1d0*x(idx_C4H7j) / m(idx_C4H7j) &
        + 1d0*x(idx_HC4Nj) / m(idx_HC4Nj) &
        + 1d0*x(idx_HC4Oj) / m(idx_HC4Oj) &
        + 1d0*x(idx_C5Nj) / m(idx_C5Nj) &
        + 1d0*x(idx_H2C4Nj) / m(idx_H2C4Nj) &
        + 1d0*x(idx_H3C4Nj) / m(idx_H3C4Nj) &
        + 1d0*x(idx_C7Nj) / m(idx_C7Nj) &
        + 1d0*x(idx_C5H3Nj) / m(idx_C5H3Nj) &
        + 1d0*x(idx_C9Nj) / m(idx_C9Nj) &
        + 1d0*x(idx_C7H3Nj) / m(idx_C7H3Nj) &
        + 1d0*x(idx_C9H3Nj) / m(idx_C9H3Nj) &
        + 1d0*x(idx_OCSjH2) / m(idx_OCSjH2) &
        + 1d0*x(idx_H2C3Oj) / m(idx_H2C3Oj) &
        + 1d0*x(idx_H3C3Oj) / m(idx_H3C3Oj) &
        + 1d0*x(idx_C5H4Nj) / m(idx_C5H4Nj) &
        + 1d0*x(idx_C8H5j) / m(idx_C8H5j) &
        + 1d0*x(idx_C9H5j) / m(idx_C9H5j))
    !check if charge conservation goes wrong
    if(x(idx_E)<0d0) then
      print *,"ERROR in conserveLin, electrons < 0"
      stop
    end if

  end subroutine conserveLin_x

  !***************************
  !compute the total reference mass atom type by atom type
  function conserveLinGetRef_x(x)
    use krome_commons
    use krome_getphys
    implicit none
    real*8::conserveLinGetRef_x(natoms),x(nmols)
    real*8::m(nspec)

    m(:) = get_mass()
    conserveLinGetRef_x(:) = 0d0

  end function conserveLinGetRef_x

  !***************************
  !Ref: Sasaki & Takahara (1993)
  !This function evaluate the recombination rate
  ! for H+ + e --> H + gamma and the same
  ! for D+ + e --> D + gamma
  function elec_recomb_ST93(nabund,nelec,ntot,nucleiH,Trad)
    use krome_commons
    use krome_constants
    implicit none
    real*8::nabund,nelec,Trad
    real*8::nucleiH,elec_recomb_ST93
    real*8::al,ak,rc2,r2c
    real*8::a0,b0,c0,d0,e0
    real*8::a1,b1,c1,d1,e1,f1,g1,h1
    real*8::ntot,ratio

    al = 8.227d0
    ak = 22.06d0 / (hubble  *(1d0 + phys_zredshift) &
        * sqrt(1d0 + Omega0 * phys_zredshift))
    !Rc2 evaluation
    rc2 = 8.76d-11 * (1d0 + phys_zredshift)**(-0.58)
    !R2c evaluation
    r2c = (1.80d10 * Trad)**(1.5) &
        * exp(-3.9472d4 / Trad) * rc2

    !coefficients
    a0 = nucleiH * rc2
    b0 = ak * al * nucleiH
    c0 = ak * rc2 * nucleiH * nucleiH
    d0 = r2c * exp(-1.18416d5/Trad)
    e0 = ak * r2c * nucleiH

    !polynomial terms
    a1 = -d0 * (1d0 + b0)
    b1 = d0 * (1d0 + 2d0 * b0)
    c1 = a0 + b0 * (a0 - d0)
    d1 = -a0 * b0
    e1 = a0 * c0
    f1 = 1d0 + b0 + e0
    g1 = -(b0 + e0)
    h1 = c0

    ratio = nabund / ntot

    elec_recomb_ST93 = ntot*(a1 + b1*ratio + c1*ratio**2 + d1*ratio**3 &
        + e1*ratio**4) / (f1 + g1*ratio + h1*ratio**2)

    elec_recomb_ST93 = elec_recomb_ST93 / (nabund * nelec)

  end function elec_recomb_ST93

  !********************
  subroutine load_parts()
    use krome_commons
    implicit none

  end subroutine load_parts

  !*************************
  subroutine load_part(fname,array_part,min_part,dT_part)
    character(len=*)::fname
    integer::ios,icount,i,cv
    real*8,allocatable::array_part(:),emed(:)
    real*8::min_part,dT_part,Told,array_tmp(int(1e5)),rout(2)

    open(33,file=trim(fname),status="old",iostat=ios)
    if(ios.ne.0) then
      print *,"ERROR: partition function not found"
      print *," in file "//fname
      stop
    end if

    print *,"loading partition function from "//fname
    icount = 0
    min_part = 1d99
    Told = 0d0
    do
      read(33,*,iostat=ios) rout(:)
      if(ios<0) exit
      if(ios.ne.0) cycle
      icount = icount + 1
      min_part = min(min_part,rout(1))
      array_tmp(icount) = rout(2)
      dT_part = rout(1) - Told
      Told = rout(1)
    end do
    close(33)

    allocate(array_part(icount),emed(icount))
    array_part(:) = array_tmp(1:icount)

  end subroutine load_part

  !**********************
  function troe_falloff(k0,kinf,Fc,m)
    implicit none
    real*8::troe_falloff,k0,kinf,Fc,m,rm,xexp
    rm = k0*m/kinf
    xexp = 1d0/(1d0+log10(rm)**2)
    troe_falloff = k0*m/(1d0+rm)*Fc**xexp
  end function troe_falloff

  !*************************
  function k3body(k0,kinf,Fc,nM)
    implicit none
    real*8::k3body,k0,kinf,Fc,nM
    real*8::c,n,d,Pr,xexp,F

    c = -0.4d0-0.67d0*log10(Fc)
    n = 0.75d0-1.27d0*log10(Fc)
    d = 0.14d0
    Pr = k0*nM/kinf
    xexp = (log10(Pr)+c)/(n-d*(log10(Pr)+c))
    F = 1d1**(log10(Fc)/(1d0+xexp**2))
    k3body = kinf*(Pr/(1d0+Pr)) * F

  end function k3body

  !***********************
  !see http://kida.obs.u-bordeaux1.fr/help
  function KIDA3body(ka0,kb0,kc0,kaInf,kbInf,kcInf,kaFc,kbFc,&
        kcFc,kdFc,npart,Tgas,pmin,pmax)
    implicit none
    real*8::ka0,kb0,kc0,kaInf,kbInf,kcInf,kaFc,kbFc,kcFc,kdFc
    real*8::KIDA3body,kinf,p,f,npart,Tgas,fc,fexp,invT
    real*8::k0,cc,dd,nn,pmin,pmax

    KIDA3body = 0d0

    invT = 1d0/Tgas
    k0 = ka0*(Tgas/3d2)**kb0*exp(-kc0*invT)
    kinf = kainf*(Tgas/3d2)**kbinf*exp(-kcinf*invT)

    p = k0*npart/kinf
    if(p<pmin) return
    if(p>pmax) return

    fc = (1d0-kaFc)*exp(-Tgas/kbFc) + kaFc*exp(-Tgas/kbFc) &
        + exp(-kdFc*invT)

    cc = -0.4d0 - 0.67d0 *log10(fc)
    dd = 0.14d0
    nn = 0.75d0 - 1.27d0*log10(fc)
    fexp = 1d0 + ((log10(p)+cc)/(nn-dd*(log10(p)+cc)))**2

    f = fc**(1d0/fexp)

    KIDA3body = kinf*(p/(1d0+p))*f

  end function KIDA3body

  !******************************
  !collisional ionization rate from Verner+96
  ! unit: cm3/s
  function colion_v96(Tgas,dE,P,A,X,K)
    implicit none
    real*8::colion_v96,Tgas,dE,A,X,K,U,Te,P

    Te = Tgas * 8.621738d-5 !K to eV
    U = dE / Te
    colion_v96 = A * (1d0 + P*sqrt(U)) * U**K * exp(-U) / (X+U)

  end function colion_v96

  !****************************
  !radiative recombination rates from
  ! Verner routine, standard fit, cm3/s
  function recV96(Tgas,a,b)
    implicit none
    real*8::recV96,Tgas,a,b

    recV96 = a*(1d4/Tgas)**b

  end function recV96

  !****************************
  !radiative recombination rates from
  ! Verner routine, new fit, cm3/s
  function recNewV96(Tgas,r1,r2,r3,r4)
    implicit none
    real*8::recNewV96,Tgas,r1,r2,r3,r4,tt

    tt = sqrt(Tgas/r3)
    recNewV96 = r1/(tt*(tt + 1d0)**(1.-r2) &
        * (1d0 + sqrt(Tgas/r4))**(1.+r2))

  end function recNewV96

  !****************************
  !radiative recombination rates from
  ! Verner routine, iron only, cm3/s
  function recFeV96(Tgas,r1,r2,r3)
    implicit none
    real*8::recFeV96,Tgas,r1,r2,r3,tt

    tt = sqrt(Tgas*1d-4)
    recFeV96 = r1/tt**(r2 + r3 + log10(tt))

  end function recFeV96

  !******************************
  !radiative recombination rates from Verner+96
  ! unit: cm3/s
  function radrec_v96(Tgas,a,b,T0,T1)
    implicit none
    real*8::Tgas,a,b,T0,T1,radrec_v96,iT0

    iT0 = 1d0/T0
    radrec_v96 = a/(sqrt(Tgas*iT0) + (1d0*sqrt(Tgas*iT0))**(1.-b) &
        * (1d0+sqrt(Tgas/T1))**(1+b))

  end function radrec_v96

  !*******************************
  !radiative recombination rates low-temp fit, Verner+96
  ! unit: cm3/s
  function radrec_low_v96(Tgas,a,b,c,d,f)
    implicit none
    real*8::Tgas,a,b,c,d,f,radrec_low_v96,t,invt

    t = Tgas*1d-4
    invt = 1d0/t

    radrec_low_v96 = 1d-12 * (a*invt + b + c*t + d*t**2) &
        * t**(-1.5) * exp(-f*invt)

    radrec_low_v96 = max(0d0,radrec_low_v96)

  end function radrec_low_v96

  !***************************
  !Collisional dissociation rate (cm-3/s) by Martin et al. 1996
  ! H2+H->H+H+H
  !NOTE: the use of this rate is suggested
  ! for high-density regime and in the presence of UV backgrounds.
  ! if necessary it must be included in the reaction file as
  ! H2,H,,H,H,H,,NONE,NONE,dissH2_Martin96(n,Tgas)
  function dissH2_Martin96(n,Tgas)
    use krome_commons
    use krome_getphys
    integer::i
    real*8::n(nspec),Tgas,dissH2_Martin96
    real*8::CDrates,logTv(4),k_CIDm(21,2),k_CID,invT,logT,n_c1,n_c2,n_H
    real*8::logk_h1,logk_h2,logk_l1,logk_l2,logn_c1,logn_c2,p,logk_CID
    real*8::logT2,logT3

    !k_CID = collision-induced dissociation + dissociative tunneling

    !Collisional dissociation of H2
    k_CIDm(:,1) = (/-178.4239d0, -68.42243d0, 43.20243d0, -4.633167d0, &
        69.70086d0, 40870.38d0, -23705.70d0, 128.8953d0, -53.91334d0, &
        5.315517d0, -19.73427d0, 16780.95d0, -25786.11d0, 14.82123d0, &
        -4.890915d0, 0.4749030d0, -133.8283d0, -1.164408d0, 0.8227443d0,&
        0.5864073d0, -2.056313d0/)

    !Dissociative tunneling of H2
    k_CIDm(:,2) = (/-142.7664d0, 42.70741d0, -2.027365d0, -0.2582097d0, &
        21.36094d0, 27535.31d0, -21467.79d0, 60.34928d0, -27.43096d0, &
        2.676150d0, -11.28215d0, 14254.55d0, -23125.20d0, 9.305564d0, &
        -2.464009d0, 0.1985955d0, 743.0600d0, -1.174242d0, 0.7502286d0, &
        0.2358848d0, 2.937507d0/)

    n_H  = get_Hnuclei(n(:))
    logT = log10(Tgas)
    invT = 1.0d0/Tgas
    logT2 = logT*logT
    logT3 = logT2*logT
    logTv = (/1.d0, logT, logT2, logT3/)
    k_CID = 0.d0
    do i=1,2
      logk_h1 = k_CIDm(1,i)*logTv(1) + k_CIDm(2,i)*logTv(2) + &
          k_CIDm(3,i)*logTv(3) + k_CIDm(4,i)*logTv(4) + &
          k_CIDm(5,i)*log10(1.d0+k_CIDm(6,i)*invT)
      logk_h2 = k_CIDm(7,i)*invT
      logk_l1 = k_CIDm(8,i)*logTv(1) + k_CIDm(9,i)*logTv(2) + &
          k_CIDm(10,i)*logTv(3) + k_CIDm(11,i)*log10(1.d0+k_CIDm(12,i)*invT)
      logk_l2 = k_CIDm(13,i)*invT
      logn_c1 = k_CIDm(14,i)*logTv(1) + k_CIDm(15,i)*logTv(2) &
          + k_CIDm(16,i)*logTv(3) + k_CIDm(17,i)*invT
      logn_c2 = k_CIDm(18,i) + logn_c1
      p = k_CIDm(19,i) + k_CIDm(20,i)*exp(-Tgas/1.850d3) &
          + k_CIDm(21,i)*exp(-Tgas/4.40d2)
      n_c1 = 1d1**(logn_c1)
      n_c2 = 1d1**(logn_c2)
      logk_CID = logk_h1 - (logk_h1 - logk_l1) / (1.d0 + (n_H/n_c1)**p) &
          + logk_h2 - (logk_h2 - logk_l2) / (1.d0 + (n_H/n_c2)**p)
      k_CID = k_CID + 1.d1**logk_CID
    enddo

    dissH2_Martin96 = k_CID

  end function dissH2_Martin96

  !**********************
  ! Cluster growth rate based on kinetic nucleation theory (KNT)
  ! Theory is explained in chapter 13 of Gail and Sedlmayr 2013
  ! (https://doi.org/10.1017/CBO9780511985607)
  function cluster_growth_rate(monomer_idx, cluster_size, temperature, stick) result(rate)
    ! k_N = v_thermal * cross_section_N * stick_N
    ! with N the cluster size of the reactant
    use krome_constants
    use krome_commons
    use krome_getphys
    implicit none
    integer, parameter :: dp=kind(0.d0) ! double precision

    integer, intent(in) :: monomer_idx
    integer, intent(in) :: cluster_size
    real(dp), intent(in) :: temperature
    real(dp), intent(in), optional :: stick
    real(dp) :: rate

    real(dp) :: v_thermal
    real(dp) :: cross_section
    real(dp) :: stick_coefficient
    real(dp) :: monomer_radius
    real(dp) :: cluster_radius
    real(dp) :: inverse_monomer_mass
    real(dp) :: inverse_cluster_mass
    real(dp) :: inverse_reduced_mass
    real(dp) :: inverse_mass(nspec)

    inverse_mass(:) = get_imass()

    ! References in kromelib.py
    monomer_radius = 7.5765e-09_dp ! SIO in cm

    inverse_monomer_mass = inverse_mass(monomer_idx)
    inverse_cluster_mass = 1._dp/cluster_size * inverse_monomer_mass
    inverse_reduced_mass = inverse_monomer_mass + inverse_cluster_mass

    v_thermal = sqrt(8._dp * boltzmann_erg * temperature &
        * inverse_reduced_mass / pi )

    ! Assuming cluster volume is proportional to monomer volume
    ! V_N = N * V_1, and both are considered as a hypothetical sphere
    cluster_radius = monomer_radius * cluster_size**(1._dp/3._dp)

    ! Geometrical cross section
    cross_section = pi * (monomer_radius + cluster_radius)**2._dp

    ! Sticking coefficiet is set to one for simplicity
    if(present(stick)) then
      stick_coefficient = stick
    else
      stick_coefficient = 1._dp
    end if

    rate = v_thermal * cross_section * stick_coefficient

  end function cluster_growth_rate

  function general_cluster_growth_rate(monomer_idx, cluster1_size, cluster2_size,&
        temperature, stick) result(rate)
    ! k_N = v_thermal * cross_section_N * stick_N
    ! with N the cluster size of the reactant
    use krome_constants
    use krome_commons
    use krome_getphys
    implicit none
    integer, parameter :: dp=kind(0.d0) ! double precision

    integer, intent(in) :: monomer_idx
    integer, intent(in) :: cluster1_size
    integer, intent(in) :: cluster2_size
    real(dp), intent(in) :: temperature
    real(dp), intent(in), optional :: stick
    real(dp) :: rate

    real(dp) :: v_thermal
    real(dp) :: cross_section
    real(dp) :: stick_coefficient
    real(dp) :: monomer_radius
    real(dp) :: cluster1_radius
    real(dp) :: cluster2_radius
    real(dp) :: inverse_monomer_mass
    real(dp) :: inverse_cluster1_mass
    real(dp) :: inverse_cluster2_mass
    real(dp) :: inverse_reduced_mass
    real(dp) :: inverse_mass(nspec)

    inverse_mass(:) = get_imass()

    ! References in kromelib.py
    monomer_radius = 7.5765e-09_dp ! SIO in cm

    inverse_monomer_mass = inverse_mass(monomer_idx)
    inverse_cluster1_mass = 1._dp/cluster1_size * inverse_monomer_mass
    inverse_cluster2_mass = 1._dp/cluster2_size * inverse_monomer_mass
    inverse_reduced_mass = inverse_cluster1_mass + inverse_cluster2_mass

    v_thermal = sqrt(8._dp * boltzmann_erg * temperature &
        * inverse_reduced_mass / pi )

    ! Assuming cluster volume is proportional to monomer volume
    ! V_N = N * V_1, and both are considered as a hypothetical sphere
    cluster1_radius = monomer_radius * cluster1_size**(1._dp/3._dp)
    cluster2_radius = monomer_radius * cluster2_size**(1._dp/3._dp)

    ! Geometrical cross section
    cross_section = pi * (cluster1_radius + cluster2_radius)**2._dp

    ! Sticking coefficiet is set to one for simplicity
    if(present(stick)) then
      stick_coefficient = stick
    else
      stick_coefficient = 1._dp
    end if

    rate = v_thermal * cross_section * stick_coefficient

  end function general_cluster_growth_rate

  !***********************************
  subroutine init_exp_table()
    use krome_commons
    implicit none
    integer::i
    real*8::a

    do i=1,exp_table_na
      a = (i-1)*(exp_table_aMax-exp_table_aMin)/(exp_table_na-1) + exp_table_aMin
      exp_table(i) = exp(-a)
    end do

  end subroutine init_exp_table

  !***************************
  !get the index of the specie name
  function get_index(name)
    use krome_commons
    use krome_getphys
    integer::get_index,i
    character*16::names(nspec)
    character*(*)::name
    names(:) = get_names()
    get_index = -1 !default index
    !loop on species to found the specie named name
    do i=1,nspec
      !when found store and break loop
      if(trim(names(i))== trim(name)) then
        get_index = i !store index
        exit
      end if
    end do

    !error if species not found
    if(get_index<0) then
      print *,"ERROR: can't find the index of ",name
      stop
    end if

  end function get_index

  !*****************************
  !computes revers kinetics from reaction and
  ! product indexes
  ! k_rev = k_for * revKc
  ! Note that reaction constant revKc is calculated with
  ! reactants and products from reverse reaction
  function revKc(Tgas,ridx,pidx)
    use krome_constants
    use krome_commons
    implicit none
    real*8::revKc,Tgas,dgibss,stoichiometricChange
    integer::ridx(:),pidx(:),i

    ! when considering forward reaction:
    ! Kc = (P°)**(p+p-r-r) * exp(-dGibss_forward°)
    ! where ° means at standard conditions of
    ! P° = 1 bar = (kb*T/1e6) dyn/cm^2 (cgs)
    ! when considering reverse:
    ! 1/Kc = revKc = (kb*T/1e6)**(p+p-r-r) * exp(-dGibss_reverse°)
    ! kb*T/1e6 is to go from 1 atm pressure to number density cm^-3
    ! When not at standard pressure this does not change:
    ! revKc = P**(p+p-r-r) *exp(-dGibss_reverse° - (p+p-r-r)*ln(P/P°))
    !       = (P°)**(p+p-r-r) * exp(-dGibss_reverse°)

    dgibss = 0.d0 ! Gibbs free energy/(R*T)
    stoichiometricChange = 0d0

    do i=1,size(pidx)
      dgibss = dgibss + revHS(Tgas,pidx(i))
      stoichiometricChange = stoichiometricChange + 1
    end do

    do i=1,size(ridx)
      dgibss = dgibss - revHS(Tgas,ridx(i))
      stoichiometricChange = stoichiometricChange - 1
    end do

    revKc = (boltzmann_erg * Tgas * 1e-6)**(-stoichiometricChange)&
        * exp(-dgibss)

  end function revKc

  !*****************************
  !compute H-S for species with index idx
  ! when temperature is Tgas
  function revHS(Tgas,idx)
    use krome_commons
    use krome_constants
    use krome_fit
    real*8::revHS,Tgas,Tgas2,Tgas3,Tgas4,invT,lnT,H,S
    real*8::Tnist,Tnist2,Tnist3,Tnist4,invTnist,invTnist2,lnTnist
    real*8::p1_nasa(456,7), p2_nasa(456,7), Tlim_nasa(456,3), p(7)
    real*8::p1_nist(456,7), p2_nist(456,7), Tlim_nist(456,3)
    integer::idx

    p(:) = 0.d0
    p1_nasa(:,:) = 0.d0
    p2_nasa(:,:) = 0.d0
    Tlim_nasa(:,:) = 0.d0
    p1_nist(:,:) = 0.d0
    p2_nist(:,:) = 0.d0
    Tlim_nist(:,:) = 0.d0
    Tgas2 = Tgas * Tgas
    Tgas3 = Tgas2 * Tgas
    Tgas4 = Tgas3 * Tgas
    invT = 1d0/Tgas
    lnT = log(Tgas)
    ! NIST polynomials are quite differernt
    ! it doesn't like easy stuff...
    Tnist = Tgas * 1.d-3
    Tnist2 = Tnist * Tnist
    Tnist3 = Tnist2 * Tnist
    Tnist4 = Tnist3 * Tnist2
    invTnist = 1d0/Tnist
    invTnist2 = invTnist * invTnist
    lnTnist = log(Tnist)

    p1_nasa(idx_Hk,:)  = (/2.5d0,&
        0.0d0,&
        0.0d0,&
        0.0d0,&
        0.0d0,&
        15976.167d0,&
        -1.1390139d0/)
    p1_nasa(idx_Ck,:)  = (/2.50025151d0,&
        -1.19774349d-06,&
        2.28919443d-09,&
        -1.98276803d-12,&
        6.44398056d-16,&
        70064.893d0,&
        4.87847086d0/)
    p1_nasa(idx_Ok,:)  = (/2.90805921d0,&
        -0.00169804907d0,&
        2.98069955d-06,&
        -2.43835127d-09,&
        7.61229311d-13,&
        11435.7717d0,&
        2.80339097d0/)
    p1_nasa(idx_OHk,:)  = (/3.43126659d0,&
        0.000631146866d0,&
        -1.92914359d-06,&
        2.40618712d-09,&
        -8.66679361d-13,&
        -18508.5918d0,&
        1.07990541d0/)
    p1_nasa(idx_C,:)  = (/2.5542395d0,&
        -0.00032153772d0,&
        7.3379223d-07,&
        -7.3223487d-10,&
        2.6652144d-13,&
        85442.681d0,&
        4.5313085d0/)
    p1_nasa(idx_H,:)  = (/2.5d0,&
        0.0d0,&
        0.0d0,&
        0.0d0,&
        0.0d0,&
        25473.66d0,&
        -0.44668285d0/)
    p1_nasa(idx_HE,:)  = (/2.5d0,&
        0.0d0,&
        0.0d0,&
        0.0d0,&
        0.0d0,&
        -745.375d0,&
        0.928723974d0/)
    p1_nasa(idx_N,:)  = (/2.5d0,&
        0.0d0,&
        0.0d0,&
        0.0d0,&
        0.0d0,&
        56104.638d0,&
        4.1939088d0/)
    p1_nasa(idx_O,:)  = (/3.1682671d0,&
        -0.00327931884d0,&
        6.64306396d-06,&
        -6.12806624d-09,&
        2.11265971d-12,&
        29122.2592d0,&
        2.05193346d0/)
    p1_nasa(idx_H2,:)  = (/2.34433112d0,&
        0.00798052075d0,&
        -1.9478151d-05,&
        2.01572094d-08,&
        -7.37611761d-12,&
        -917.935173d0,&
        0.683010238d0/)
    p1_nasa(idx_CO,:)  = (/3.5795335d0,&
        -0.00061035369d0,&
        1.0168143d-06,&
        9.0700586d-10,&
        -9.0442449d-13,&
        -14344.086d0,&
        3.5084093d0/)
    p1_nasa(idx_CH,:)  = (/3.4897583d0,&
        0.0003243216d0,&
        -1.6899751d-06,&
        3.162842d-09,&
        -1.4061803d-12,&
        70660.755d0,&
        2.0842841d0/)
    p1_nasa(idx_N2,:)  = (/3.53100528d0,&
        -0.000123660988d0,&
        -5.02999433d-07,&
        2.43530612d-09,&
        -1.40881235d-12,&
        -1046.97628d0,&
        2.96747038d0/)
    p1_nasa(idx_NO,:)  = (/4.21859896d0,&
        -0.00463988124d0,&
        1.10443049d-05,&
        -9.34055507d-09,&
        2.80554874d-12,&
        9845.09964d0,&
        2.28061001d0/)
    p1_nasa(idx_O2,:)  = (/3.78245636d0,&
        -0.00299673416d0,&
        9.84730201d-06,&
        -9.68129509d-09,&
        3.24372837d-12,&
        -1063.94356d0,&
        3.65767573d0/)
    p1_nasa(idx_OH,:)  = (/3.99198424d0,&
        -0.00240106655d0,&
        4.61664033d-06,&
        -3.87916306d-09,&
        1.36319502d-12,&
        3368.89836d0,&
        -0.103998477d0/)
    p1_nasa(idx_SO,:)  = (/3.61859514d0,&
        -0.00232173768d0,&
        1.16462669d-05,&
        -1.4209251d-08,&
        5.6076537d-12,&
        -480.621641d0,&
        6.36504115d0/)
    p1_nasa(idx_CH2,:)  = (/3.84261832d0,&
        -7.36676871d-06,&
        6.16970693d-06,&
        -6.96689962d-09,&
        2.64620979d-12,&
        45863.1528d0,&
        1.2758447d0/)
    p1_nasa(idx_CO2,:)  = (/2.356813d0,&
        0.0089841299d0,&
        -7.1220632d-06,&
        2.4573008d-09,&
        -1.4288548d-13,&
        -48371.971d0,&
        9.9009035d0/)
    p1_nasa(idx_H2O,:)  = (/4.1986352d0,&
        -0.0020364017d0,&
        6.5203416d-06,&
        -5.4879269d-09,&
        1.771968d-12,&
        -30293.726d0,&
        -0.84900901d0/)
    p1_nasa(idx_HCO,:)  = (/4.36380907d0,&
        -0.00535204137d0,&
        2.31954508d-05,&
        -2.6610904d-08,&
        1.02711962d-11,&
        25010.8717d0,&
        2.98106307d0/)
    p1_nasa(idx_N2O,:)  = (/2.2571502d0,&
        0.011304728d0,&
        -1.3671319d-05,&
        9.6819803d-09,&
        -2.9307182d-12,&
        8741.7746d0,&
        10.757992d0/)
    p1_nasa(idx_NO2,:)  = (/3.9440312d0,&
        -0.001585429d0,&
        1.6657812d-05,&
        -2.0475426d-08,&
        7.8350564d-12,&
        2896.618d0,&
        6.3119919d0/)
    p1_nasa(idx_SO2,:)  = (/3.67480752d0,&
        0.00228302107d0,&
        8.46893049d-06,&
        -1.36562039d-08,&
        5.76271873d-12,&
        -36945.5073d0,&
        7.9686643d0/)
    p1_nasa(idx_C3H,:)  = (/3.34917187d0,&
        0.0165822626d0,&
        -2.77115653d-05,&
        2.51382364d-08,&
        -8.85285352d-12,&
        84986.3168d0,&
        6.80362439d0/)
    p1_nasa(idx_CH3,:)  = (/3.6571797d0,&
        0.0021265979d0,&
        5.4583883d-06,&
        -6.6181003d-09,&
        2.4657074d-12,&
        16422.716d0,&
        1.6735354d0/)
    p1_nasa(idx_H2CO,:)  = (/4.65733258d0,&
        -0.00953742306d0,&
        4.04679152d-05,&
        -4.45317569d-08,&
        1.64761516d-11,&
        13861.5127d0,&
        1.97860732d0/)
    p1_nasa(idx_H2O2,:)  = (/4.31515149d0,&
        -0.000847390622d0,&
        1.76404323d-05,&
        -2.26762944d-08,&
        9.08950158d-12,&
        -17706.7437d0,&
        3.27373319d0/)
    p1_nasa(idx_CH4,:)  = (/5.14825732d0,&
        -0.013700241d0,&
        4.93749414d-05,&
        -4.91952339d-08,&
        1.70097299d-11,&
        -10245.3222d0,&
        -4.63322726d0/)
    p1_nasa(idx_Cj,:)  = (/2.61332254d0,&
        -0.000540148065d0,&
        1.03037233d-06,&
        -8.90092552d-10,&
        2.88500586d-13,&
        216862.274d0,&
        3.8345479d0/)
    p1_nasa(idx_FEj,:)  = (/2.76418106d0,&
        0.00286948238d0,&
        -7.61235651d-06,&
        8.18183334d-09,&
        -3.11792199d-12,&
        141159.039d0,&
        5.53997981d0/)
    p1_nasa(idx_Hj,:)  = (/2.5d0,&
        0.0d0,&
        0.0d0,&
        0.0d0,&
        0.0d0,&
        184021.488d0,&
        -1.14064664d0/)
    p1_nasa(idx_HEj,:)  = (/2.5d0,&
        0.0d0,&
        0.0d0,&
        0.0d0,&
        0.0d0,&
        285323.374d0,&
        1.62166556d0/)
    p1_nasa(idx_Oj,:)  = (/2.5d0,&
        0.0d0,&
        0.0d0,&
        0.0d0,&
        0.0d0,&
        187935.284d0,&
        4.39337676d0/)
    p1_nasa(idx_H3j,:)  = (/4.1795698d0,&
        -0.000868875627d0,&
        -1.09017371d-07,&
        4.13349766d-09,&
        -2.37877027d-12,&
        132635.537d0,&
        -5.838001d0/)
    p1_nasa(idx_COj,:)  = (/3.77061642d0,&
        -0.00201773246d0,&
        4.61081738d-06,&
        -2.99175463d-09,&
        6.06065045d-13,&
        149006.795d0,&
        3.38129783d0/)
    p1_nasa(idx_H2j,:)  = (/3.77256072d0,&
        -0.0019574659d0,&
        4.54812047d-06,&
        -2.82152141d-09,&
        5.33969209d-13,&
        178694.654d0,&
        -3.96609192d0/)
    p1_nasa(idx_O2j,:)  = (/4.61017167d0,&
        -0.00635951952d0,&
        1.42425624d-05,&
        -1.20997923d-08,&
        3.70956878d-12,&
        139742.229d0,&
        -0.201326941d0/)
    p1_nasa(idx_OHj,:)  = (/3.50502572d0,&
        0.000241313747d0,&
        -1.42200948d-06,&
        2.64780232d-09,&
        -1.17038711d-12,&
        155210.676d0,&
        1.97907627d0/)
    p1_nasa(idx_H2Oj,:)  = (/4.02465912d0,&
        -0.00108851414d0,&
        5.13576558d-06,&
        -4.40027838d-09,&
        1.40726746d-12,&
        116895.616d0,&
        0.699968812d0/)
    p1_nasa(idx_H3Oj,:)  = (/3.79295251d0,&
        -0.000910852723d0,&
        1.16363521d-05,&
        -1.21364865d-08,&
        4.26159624d-12,&
        71402.7518d0,&
        1.47156927d0/)
    p2_nasa(idx_Hk,:)  = (/2.5d0,&
        0.0d0,&
        0.0d0,&
        0.0d0,&
        0.0d0,&
        15976.167d0,&
        -1.1390139d0/)
    p2_nasa(idx_Ck,:)  = (/2.50001597d0,&
        -1.71721376d-08,&
        6.9283294d-12,&
        -1.20607892d-15,&
        7.60308635d-20,&
        70064.9324d0,&
        4.87955907d0/)
    p2_nasa(idx_Ok,:)  = (/2.54474869d0,&
        -4.66695513d-05,&
        1.84912357d-08,&
        -3.18159223d-12,&
        1.98962956d-16,&
        11504.2089d0,&
        4.52131015d0/)
    p2_nasa(idx_OHk,:)  = (/2.80023747d0,&
        0.00113380509d0,&
        -2.99666184d-07,&
        4.01911483d-11,&
        -1.78988913d-15,&
        -18253.5298d0,&
        4.6939462d0/)
    p2_nasa(idx_C,:)  = (/2.605583d0,&
        -0.00019593434d0,&
        1.0673722d-07,&
        -1.642394d-11,&
        8.187058d-16,&
        85411.742d0,&
        4.1923868d0/)
    p2_nasa(idx_H,:)  = (/2.5d0,&
        0.0d0,&
        0.0d0,&
        0.0d0,&
        0.0d0,&
        25473.66d0,&
        -0.44668285d0/)
    p2_nasa(idx_HE,:)  = (/2.5d0,&
        0.0d0,&
        0.0d0,&
        0.0d0,&
        0.0d0,&
        -745.375d0,&
        0.928723974d0/)
    p2_nasa(idx_N,:)  = (/2.4159429d0,&
        0.00017489065d0,&
        -1.1902369d-07,&
        3.0226244d-11,&
        -2.0360983d-15,&
        56133.775d0,&
        4.6496095d0/)
    p2_nasa(idx_O,:)  = (/2.54363697d0,&
        -2.73162486d-05,&
        -4.1902952d-09,&
        4.95481845d-12,&
        -4.79553694d-16,&
        29226.012d0,&
        4.92229457d0/)
    p2_nasa(idx_H2,:)  = (/2.93286575d0,&
        0.000826608026d0,&
        -1.46402364d-07,&
        1.54100414d-11,&
        -6.888048d-16,&
        -813.065581d0,&
        -1.02432865d0/)
    p2_nasa(idx_CO,:)  = (/3.0484859d0,&
        0.0013517281d0,&
        -4.8579405d-07,&
        7.8853644d-11,&
        -4.6980746d-15,&
        -14266.117d0,&
        6.0170977d0/)
    p2_nasa(idx_CH,:)  = (/2.5209369d0,&
        0.0017653639d0,&
        -4.614766d-07,&
        5.9289675d-11,&
        -3.3474501d-15,&
        70994.878d0,&
        7.4051829d0/)
    p2_nasa(idx_N2,:)  = (/2.95257637d0,&
        0.0013969004d0,&
        -4.92631603d-07,&
        7.86010195d-11,&
        -4.60755204d-15,&
        -923.948688d0,&
        5.87188762d0/)
    p2_nasa(idx_NO,:)  = (/3.26071234d0,&
        0.00119101135d0,&
        -4.29122646d-07,&
        6.94481463d-11,&
        -4.03295681d-15,&
        9921.43132d0,&
        6.36900518d0/)
    p2_nasa(idx_O2,:)  = (/3.66096065d0,&
        0.000656365811d0,&
        -1.41149627d-07,&
        2.05797935d-11,&
        -1.29913436d-15,&
        -1215.97718d0,&
        3.41536279d0/)
    p2_nasa(idx_OH,:)  = (/2.83853033d0,&
        0.00110741289d0,&
        -2.94000209d-07,&
        4.20698729d-11,&
        -2.4228989d-15,&
        3697.80808d0,&
        5.84494652d0/)
    p2_nasa(idx_SO,:)  = (/3.96894225d0,&
        0.000377296831d0,&
        7.67102696d-09,&
        -1.37544433d-11,&
        1.37139416d-15,&
        -728.571725d0,&
        3.73493087d0/)
    p2_nasa(idx_CH2,:)  = (/3.11049513d0,&
        0.00373779517d0,&
        -1.37371977d-06,&
        2.23054839d-10,&
        -1.33567178d-14,&
        45971.5953d0,&
        4.62796405d0/)
    p2_nasa(idx_CO2,:)  = (/4.6365111d0,&
        0.0027414569d0,&
        -9.9589759d-07,&
        1.6038666d-10,&
        -9.1619857d-15,&
        -49024.904d0,&
        -1.9348955d0/)
    p2_nasa(idx_H2O,:)  = (/2.6770389d0,&
        0.0029731816d0,&
        -7.7376889d-07,&
        9.4433514d-11,&
        -4.2689991d-15,&
        -29885.894d0,&
        6.88255d0/)
    p2_nasa(idx_HCO,:)  = (/4.23892214d0,&
        0.0019657617d0,&
        -3.82075171d-07,&
        4.80137647d-11,&
        -3.11176347d-15,&
        24726.1645d0,&
        1.99698242d0/)
    p2_nasa(idx_N2O,:)  = (/4.8230729d0,&
        0.0026270251d0,&
        -9.5850872d-07,&
        1.6000712d-10,&
        -9.7752302d-15,&
        8073.4047d0,&
        -2.2017208d0/)
    p2_nasa(idx_NO2,:)  = (/4.884754d0,&
        0.0021723955d0,&
        -8.2806909d-07,&
        1.574751d-10,&
        -1.0510895d-14,&
        2316.4982d0,&
        -0.11741695d0/)
    p2_nasa(idx_SO2,:)  = (/5.38423482d0,&
        0.0016793056d0,&
        -6.32062944d-07,&
        1.08465348d-10,&
        -6.66890336d-15,&
        -37606.7022d0,&
        -1.83130517d0/)
    p2_nasa(idx_C3H,:)  = (/6.14184491d0,&
        0.00339661013d0,&
        -1.21915444d-06,&
        1.97782838d-10,&
        -1.18312807d-14,&
        84422.5753d0,&
        -6.44480148d0/)
    p2_nasa(idx_CH3,:)  = (/2.9781206d0,&
        0.005797852d0,&
        -1.97558d-06,&
        3.072979d-10,&
        -1.7917416d-14,&
        16509.513d0,&
        4.7224799d0/)
    p2_nasa(idx_H2CO,:)  = (/3.65237205d0,&
        0.0055580706d0,&
        -1.97617181d-06,&
        3.16823378d-10,&
        -1.88747598d-14,&
        13553.6156d0,&
        4.2214084d0/)
    p2_nasa(idx_H2O2,:)  = (/4.57977305d0,&
        0.00405326003d0,&
        -1.2984473d-06,&
        1.982114d-10,&
        -1.13968792d-14,&
        -18007.1775d0,&
        0.664970694d0/)
    p2_nasa(idx_CH4,:)  = (/1.911786d0,&
        0.0096026796d0,&
        -3.38387841d-06,&
        5.3879724d-10,&
        -3.19306807d-14,&
        -10099.2136d0,&
        8.48241861d0/)
    p2_nasa(idx_Cj,:)  = (/2.50827618d0,&
        -1.04354146d-05,&
        5.16160809d-09,&
        -1.14187475d-12,&
        9.43539946d-17,&
        216879.645d0,&
        4.3188599d0/)
    p2_nasa(idx_FEj,:)  = (/3.33602399d0,&
        -0.000272549262d0,&
        8.05440344d-09,&
        1.51229089d-11,&
        -1.43376595d-15,&
        141036.455d0,&
        2.86476968d0/)
    p2_nasa(idx_Hj,:)  = (/2.5d0,&
        0.0d0,&
        0.0d0,&
        0.0d0,&
        0.0d0,&
        184021.488d0,&
        -1.14064664d0/)
    p2_nasa(idx_HEj,:)  = (/2.5d0,&
        0.0d0,&
        0.0d0,&
        0.0d0,&
        0.0d0,&
        285323.374d0,&
        1.62166556d0/)
    p2_nasa(idx_Oj,:)  = (/2.48542028d0,&
        2.56978695d-05,&
        -1.28833378d-08,&
        1.65525487d-12,&
        1.09933344d-16,&
        187940.874d0,&
        4.47425446d0/)
    p2_nasa(idx_H3j,:)  = (/2.01435718d0,&
        0.00415925769d0,&
        -1.42664877d-06,&
        2.22372739d-10,&
        -1.29346518d-14,&
        133230.507d0,&
        5.46168967d0/)
    p2_nasa(idx_COj,:)  = (/2.93062935d0,&
        0.00156033262d0,&
        -6.16246355d-07,&
        1.09957336d-10,&
        -6.66119284d-15,&
        149147.222d0,&
        7.3384673d0/)
    p2_nasa(idx_H2j,:)  = (/3.44204765d0,&
        0.000599083239d0,&
        6.69133685d-08,&
        -3.43574373d-11,&
        1.97626599d-15,&
        178650.236d0,&
        -2.79499055d0/)
    p2_nasa(idx_O2j,:)  = (/3.31675922d0,&
        0.00111522244d0,&
        -3.83492556d-07,&
        5.72784687d-11,&
        -2.77648381d-15,&
        139876.823d0,&
        5.44726469d0/)
    p2_nasa(idx_OHj,:)  = (/2.68358996d0,&
        0.00157006435d0,&
        -5.39972815d-07,&
        9.37643877d-11,&
        -5.70068067d-15,&
        155479.296d0,&
        6.44375894d0/)
    p2_nasa(idx_H2Oj,:)  = (/3.31570445d0,&
        0.00210648746d0,&
        -3.76341515d-07,&
        3.47525972d-11,&
        -1.70335643d-15,&
        117017.475d0,&
        4.03220514d0/)
    p2_nasa(idx_H3Oj,:)  = (/2.49647765d0,&
        0.0057284484d0,&
        -1.83953239d-06,&
        2.73577348d-10,&
        -1.54093917d-14,&
        71624.4227d0,&
        7.45850493d0/)
    Tlim_nasa(idx_Hk,:)  = (/298.15d0,&
        1000.0d0,&
        6000.0d0/)
    Tlim_nasa(idx_Ck,:)  = (/298.15d0,&
        1000.0d0,&
        6000.0d0/)
    Tlim_nasa(idx_Ok,:)  = (/298.15d0,&
        1000.0d0,&
        6000.0d0/)
    Tlim_nasa(idx_OHk,:)  = (/298.15d0,&
        1000.0d0,&
        6000.0d0/)
    Tlim_nasa(idx_C,:)  = (/200.0d0,&
        1000.0d0,&
        6000.0d0/)
    Tlim_nasa(idx_H,:)  = (/200.0d0,&
        1000.0d0,&
        6000.0d0/)
    Tlim_nasa(idx_HE,:)  = (/200.0d0,&
        1000.0d0,&
        6000.0d0/)
    Tlim_nasa(idx_N,:)  = (/200.0d0,&
        1000.0d0,&
        6000.0d0/)
    Tlim_nasa(idx_O,:)  = (/200.0d0,&
        1000.0d0,&
        6000.0d0/)
    Tlim_nasa(idx_H2,:)  = (/200.0d0,&
        1000.0d0,&
        6000.0d0/)
    Tlim_nasa(idx_CO,:)  = (/200.0d0,&
        1000.0d0,&
        6000.0d0/)
    Tlim_nasa(idx_CH,:)  = (/200.0d0,&
        1000.0d0,&
        6000.0d0/)
    Tlim_nasa(idx_N2,:)  = (/200.0d0,&
        1000.0d0,&
        6000.0d0/)
    Tlim_nasa(idx_NO,:)  = (/200.0d0,&
        1000.0d0,&
        6000.0d0/)
    Tlim_nasa(idx_O2,:)  = (/200.0d0,&
        1000.0d0,&
        6000.0d0/)
    Tlim_nasa(idx_OH,:)  = (/200.0d0,&
        1000.0d0,&
        6000.0d0/)
    Tlim_nasa(idx_SO,:)  = (/200.0d0,&
        1000.0d0,&
        6000.0d0/)
    Tlim_nasa(idx_CH2,:)  = (/200.0d0,&
        1000.0d0,&
        6000.0d0/)
    Tlim_nasa(idx_CO2,:)  = (/200.0d0,&
        1000.0d0,&
        6000.0d0/)
    Tlim_nasa(idx_H2O,:)  = (/200.0d0,&
        1000.0d0,&
        6000.0d0/)
    Tlim_nasa(idx_HCO,:)  = (/200.0d0,&
        1000.0d0,&
        6000.0d0/)
    Tlim_nasa(idx_N2O,:)  = (/200.0d0,&
        1000.0d0,&
        6000.0d0/)
    Tlim_nasa(idx_NO2,:)  = (/200.0d0,&
        1000.0d0,&
        6000.0d0/)
    Tlim_nasa(idx_SO2,:)  = (/200.0d0,&
        1000.0d0,&
        6000.0d0/)
    Tlim_nasa(idx_C3H,:)  = (/200.0d0,&
        1000.0d0,&
        6000.0d0/)
    Tlim_nasa(idx_CH3,:)  = (/200.0d0,&
        1000.0d0,&
        6000.0d0/)
    Tlim_nasa(idx_H2CO,:)  = (/200.0d0,&
        1000.0d0,&
        6000.0d0/)
    Tlim_nasa(idx_H2O2,:)  = (/200.0d0,&
        1000.0d0,&
        6000.0d0/)
    Tlim_nasa(idx_CH4,:)  = (/200.0d0,&
        1000.0d0,&
        6000.0d0/)
    Tlim_nasa(idx_Cj,:)  = (/298.15d0,&
        1000.0d0,&
        6000.0d0/)
    Tlim_nasa(idx_FEj,:)  = (/298.15d0,&
        1000.0d0,&
        6000.0d0/)
    Tlim_nasa(idx_Hj,:)  = (/298.15d0,&
        1000.0d0,&
        6000.0d0/)
    Tlim_nasa(idx_HEj,:)  = (/298.15d0,&
        1000.0d0,&
        6000.0d0/)
    Tlim_nasa(idx_Oj,:)  = (/298.15d0,&
        1000.0d0,&
        6000.0d0/)
    Tlim_nasa(idx_H3j,:)  = (/298.15d0,&
        1000.0d0,&
        6000.0d0/)
    Tlim_nasa(idx_COj,:)  = (/298.15d0,&
        1000.0d0,&
        6000.0d0/)
    Tlim_nasa(idx_H2j,:)  = (/298.15d0,&
        1000.0d0,&
        6000.0d0/)
    Tlim_nasa(idx_O2j,:)  = (/298.15d0,&
        1000.0d0,&
        6000.0d0/)
    Tlim_nasa(idx_OHj,:)  = (/298.15d0,&
        1000.0d0,&
        6000.0d0/)
    Tlim_nasa(idx_H2Oj,:)  = (/298.15d0,&
        1000.0d0,&
        6000.0d0/)
    Tlim_nasa(idx_H3Oj,:)  = (/298.15d0,&
        1000.0d0,&
        6000.0d0/)
    p1_nist(idx_CL,:)  = (/13.38298d0,&
        42.33999d0,&
        -64.74656d0,&
        32.99532d0,&
        0.063319d0,&
        116.1491d0,&
        171.7038d0/)
    p2_nist(idx_CL,:)  = (/23.26597d0,&
        -1.555939d0,&
        0.34691d0,&
        -0.025961d0,&
        0.153212d0,&
        114.6604d0,&
        193.8882d0/)
    Tlim_nist(idx_CL,:)  = (/298.0d0,&
        600.0d0,&
        6000.0d0/)

    ! pick NASA data if present for species
    if (Tlim_nasa(idx,2) /= 0.d0) then
      !select set of NASA polynomials using temperature
      if(Tlim_nasa(idx,1).le.Tgas .and. Tgas.le.Tlim_nasa(idx,2)) then
        p(:) = p1_nasa(idx,:)

      else if(Tlim_nasa(idx,2)<Tgas .and. Tgas.le.Tlim_nasa(idx,3)) then
        p(:) = p2_nasa(idx,:)

        ! currently no option when Tgas not in Tlim range p(:) = 0
      end if

      !compute NASA polynomials for enthalpy and enthropy (unitless)
      H = p(1) + p(2)*0.5d0*Tgas + p(3)*Tgas2/3.d0 + p(4)*Tgas3*0.25d0 + &
          p(5)*Tgas4*0.2d0 + p(6)*invT
      S = p(1)*lnT + p(2)*Tgas + p(3)*Tgas2*0.5d0 + p(4)*Tgas3/3.d0 + &
          p(5)*Tgas4*0.25d0 + p(7)

      revHS = H - S

      ! else pick NIST data (if present)
    else if (Tlim_nist(idx,2) /= 0.d0) then
      if (Tlim_nist(idx,1) < Tgas .and. Tgas < Tlim_nist(idx,2)) then
        p(:) = p1_nist(idx,:)

      else if (Tlim_nist(idx,2) < Tgas .and. Tgas < Tlim_nist(idx,3)) then
        p(:) = p2_nist(idx,:)

        ! currently no option when Tgas not in Tlim range p(:) = 0
      end if

      !compute NIST polynomials for enthalpy and enthropy
      ! H in (kJ/mol)
      H = p(1)*Tnist + p(2)*0.5d0*Tnist2 + p(3)*Tnist3/3.d0 + p(4)*Tnist4*0.25d0&
          - p(5)*invTnist + p(6)
      !  Unitsless
      H = H / (Rgas_kJ * Tgas)

      ! S in (J/mol*K)
      S = p(1)*lnTnist + p(2)*Tnist + p(3)*Tnist2*0.5d0 + p(4)*Tnist3/3.d0&
          - p(5)*invTnist2*0.5d0 + p(7)
      !  Unitless. Note: do not use Tnist
      S = S / Rgas_J

      revHS = H - S

      ! return zero is no data exists
    else
      print *, "No thermochemical data of species index", idx
      revHS = 0.d0

    end if

  end function revHS

  !******************************
  subroutine print_best_flux(n,Tgas,nbestin)
    !print the first nbestin fluxes
    use krome_commons
    use krome_getphys
    implicit none
    real*8::n(nspec),Tgas,flux(nrea)
    integer::nbest,idx(nrea),i,nbestin
    character*50::name(nrea)

    nbest = min(nbestin,nrea) !cannot exceed the number of reactions

    flux(:) = get_flux(n(:),Tgas) !get fluxes
    name(:) = get_rnames() !get reaction names

    !call the sorting algorithm (bubblesort)
    idx(:) = idx_sort(flux(:))

    !print to screen
    print *,"***************"
    do i=1,nbest
      print '(I8,a1,a50,E17.8)',idx(i)," ",name(idx(i)),flux(idx(i))
    end do

  end subroutine print_best_flux

  !******************************
  subroutine print_best_flux_frac(n,Tgas,frac)
    !print the first nbestin fluxes
    use krome_commons
    use krome_getphys
    implicit none
    real*8::n(nspec),Tgas,flux(nrea),frac
    integer::idx(nrea),i
    character*50::name(nrea)

    if(frac>1d0) then
      print *,"ERROR: fraction in krome_print_best_flux should be <=1!"
      stop
    end if

    flux(:) = get_flux(n(:),Tgas) !get fluxes
    name(:) = get_rnames() !get reaction names

    !call the sorting algorithm (bubblesort)
    idx(:) = idx_sort(flux(:))

    !print to screen
    print *,"***************"
    do i=1,nrea
      if(flux(idx(i))<flux(idx(1))*frac) exit
      print '(I8,a1,a50,E17.8)',idx(i)," ",name(idx(i)),flux(idx(i))
    end do

  end subroutine print_best_flux_frac

  !******************************
  subroutine print_best_flux_spec(n,Tgas,nbestin,idx_found)
    !print the first nbestin fluxes for the reactions
    ! that contains the species with index idx_found
    use krome_commons
    use krome_getphys
    implicit none
    real*8::n(nspec),Tgas,flux(nrea),maxflux
    integer::nbest,idx(nrea),i,nbestin,idx_found
    character*50::name(nrea)
    logical::found

    nbest = min(nbestin,nrea) !cannot exceed the number of reactions
    maxflux = 0d0
    flux(:) = get_flux(n(:),Tgas) !get fluxes
    name(:) = get_rnames() !get reaction names
    do i=1,nrea
      found = .false.
      if(arr_r1(i) == idx_found) found = .true.
      if(arr_r2(i) == idx_found) found = .true.
      if(arr_p1(i) == idx_found) found = .true.
      if(arr_p2(i) == idx_found) found = .true.
      if(arr_p3(i) == idx_found) found = .true.
      if(arr_p4(i) == idx_found) found = .true.
      maxflux = max(maxflux,flux(i))
      if(.not.found) flux(i) = 0d0
    end do

    !call the sorting algorithm (bubblesort)
    idx(:) = idx_sort(flux(:))

    !print to screen
    print *,"***************"
    do i=1,nbest
      print '(I8,a1,a50,2E17.8)',idx(i)," ",name(idx(i)),flux(idx(i)),&
          flux(idx(i))/maxflux
    end do

  end subroutine print_best_flux_spec

  !*****************************
  function idx_sort(fin)
    !sorting algorithm: requires an array of real values fin
    ! and returns the sorted index list. descending.
    ! bubblesort: not very efficient, replace with what you prefer
    implicit none
    real*8::fin(:),f(size(fin)),ftmp
    integer::idx_sort(size(fin)),n,itmp,i
    logical::found

    f(:) = fin(:) !copy to local

    n = size(f)
    !init indexes
    do i=1,n
      idx_sort(i) = i
    end do

    !loop to sort
    do
      found = .false. !swapped something flag
      do i=2,n
        !> for descending, < for ascending
        if(f(i)>f(i-1)) then
          found = .true.
          !swap real value
          ftmp = f(i)
          f(i) = f(i-1)
          f(i-1) = ftmp
          !swap index
          itmp = idx_sort(i)
          idx_sort(i) = idx_sort(i-1)
          idx_sort(i-1) = itmp
        end if
      end do
      !if nothing swapped exit
      if(.not.found) exit
    end do

  end function idx_sort

  !******************************
  function get_flux(n,Tgas)
    !get the flux k*n*n*... of the rates
    use krome_commons
    implicit none
    integer::i
    integer::r1,r2
    real*8::get_flux(nrea),n(nspec),k(nrea),rrmax,Tgas

    k(:) = coe(n(:))
    rrmax = 0.d0
    n(idx_dummy) = 1.d0
    n(idx_g) = 1.d0
    n(idx_CR) = 1.d0
    do i=1,nrea
      r1 = arr_r1(i)
      r2 = arr_r2(i)
      arr_flux(i) = k(i)*n(r1)*n(r2)
    end do
    get_flux(:) = arr_flux(:)

  end function get_flux

  !*****************************
  subroutine load_arrays()
    !load the array containing reactants
    ! and product index
    use krome_commons

    arr_r1(1:4429) = (/1,196,197,198,199,200,201,202,203,204,205&
        ,206,207,10,22,11,12,13,14,15,16,17,23,18,19,24,25,26,27,28&
        ,21,21,29,30,20,20,20,20,31,32,34,35,36,37,38,39,39,40,41,41&
        ,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,57,58,58,59&
        ,60,61,62,62,63,64,64,65,66,67,68,69,70,71,72,73,74,75,75,76&
        ,77,77,78,79,79,80,81,82,83,84,85,86,86,87,88,89,90,91,92,93&
        ,94,94,95,96,97,98,99,100,101,101,101,102,103,104,105,106,107&
        ,107,108,109,110,111,112,113,114,115,116,116,117,118,119,120&
        ,121,122,123,124,125,126,126,127,127,128,128,129,129,129,130&
        ,131,132,133,133,133,133,134,134,134,135,136,137,137,138,139&
        ,140,141,141,142,143,144,145,146,147,148,149,150,151,152,153&
        ,154,154,155,156,157,158,159,160,161,162,163,164,235,196,196&
        ,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196&
        ,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196&
        ,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196&
        ,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196&
        ,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196&
        ,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196&
        ,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196&
        ,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196&
        ,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196&
        ,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196&
        ,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196&
        ,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196&
        ,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196&
        ,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196&
        ,196,196,196,196,196,196,196,196,208,208,197,322,198,198,198&
        ,198,198,198,198,198,198,198,198,198,198,198,198,198,198,198&
        ,198,198,198,198,198,198,198,198,198,198,198,198,198,198,198&
        ,198,198,198,198,198,198,198,198,198,198,198,198,198,198,198&
        ,198,198,198,198,198,198,198,198,198,198,198,198,198,198,198&
        ,198,198,198,198,198,198,198,198,198,198,198,198,198,198,198&
        ,198,198,198,198,198,198,198,198,198,198,198,198,198,198,198&
        ,198,198,198,198,198,198,198,198,198,198,198,198,198,198,198&
        ,198,198,198,198,198,198,198,198,198,198,198,198,198,198,198&
        ,198,198,198,198,198,198,198,198,198,198,198,198,198,198,198&
        ,198,198,198,198,198,198,198,198,198,198,198,198,198,198,198&
        ,198,198,198,198,198,198,198,198,198,198,198,198,198,198,198&
        ,198,198,198,198,198,198,198,198,198,198,198,198,198,198,198&
        ,198,198,198,198,198,198,198,198,198,198,198,198,198,198,198&
        ,198,198,198,198,198,198,199,199,199,199,199,199,199,199,199&
        ,199,199,199,199,199,199,199,199,199,199,199,199,199,199,199&
        ,199,199,199,199,199,199,199,199,199,199,199,199,199,199,199&
        ,199,199,199,199,199,199,199,199,199,199,199,199,199,199,199&
        ,199,199,199,199,199,199,199,199,199,199,199,199,199,199,199&
        ,199,199,199,199,199,199,199,199,199,199,199,199,199,199,199&
        ,199,199,199,199,199,199,199,199,199,199,199,199,199,199,199&
        ,199,199,199,199,199,199,199,199,199,199,199,199,199,199,199&
        ,199,199,199,199,199,199,199,199,199,199,199,199,199,199,199&
        ,199,199,199,199,199,199,199,199,199,199,199,199,199,199,199&
        ,199,199,199,199,199,199,199,199,199,199,199,199,199,199,199&
        ,199,199,199,199,199,199,199,199,199,199,199,199,199,199,199&
        ,199,199,199,199,199,199,199,199,199,199,199,199,199,199,199&
        ,199,199,199,199,199,199,199,199,199,199,199,199,199,199,199&
        ,199,199,199,199,199,199,199,199,199,199,199,199,199,199,199&
        ,199,199,199,199,199,199,199,199,199,199,199,199,199,199,199&
        ,199,199,199,199,199,199,199,199,199,199,199,199,199,199,199&
        ,199,199,199,199,199,199,199,199,199,199,199,199,199,199,199&
        ,199,199,199,199,199,199,199,199,199,199,199,199,199,199,199&
        ,199,199,199,199,199,199,199,199,199,199,199,199,199,199,199&
        ,199,199,199,199,199,199,199,199,199,199,199,199,199,199,199&
        ,199,199,199,199,199,199,199,199,199,199,199,199,199,199,200&
        ,200,201,201,201,201,201,201,201,201,201,201,201,201,201,201&
        ,201,201,201,201,201,201,201,201,201,201,201,201,201,201,201&
        ,201,201,201,201,201,201,201,201,201,201,201,201,201,201,201&
        ,201,201,201,201,201,203,203,203,203,203,203,203,203,203,203&
        ,203,203,203,203,203,203,203,203,203,203,203,203,203,203,203&
        ,203,203,203,203,203,203,203,203,203,203,203,203,203,203,203&
        ,203,203,209,209,209,209,209,209,209,209,209,209,209,204,204&
        ,204,204,204,204,204,204,204,204,204,204,204,204,204,204,204&
        ,204,204,204,204,204,204,204,204,204,204,204,204,204,204,204&
        ,204,204,204,204,204,204,204,205,205,205,205,205,205,205,205&
        ,205,205,205,205,205,205,205,205,205,205,205,205,205,205,205&
        ,205,205,205,237,237,237,237,237,237,237,237,237,237,237,237&
        ,237,237,237,237,237,237,237,237,237,237,237,237,237,237,237&
        ,237,237,237,237,235,235,235,235,235,235,235,235,235,235,235&
        ,235,235,235,235,235,235,235,235,235,235,235,235,235,235,235&
        ,235,235,235,235,235,235,235,235,235,235,235,235,235,235,235&
        ,235,235,235,235,235,235,235,235,235,235,235,235,242,242,242&
        ,242,242,242,242,242,242,242,242,242,242,242,242,242,242,242&
        ,242,242,242,242,242,242,242,242,242,242,242,242,242,210,210&
        ,210,210,210,210,210,210,210,210,210,210,210,210,210,210,210&
        ,210,210,210,210,210,210,210,210,210,210,210,210,210,210,210&
        ,210,210,210,210,239,239,241,241,241,241,241,241,241,241,241&
        ,211,211,211,211,211,211,211,211,211,211,211,211,211,211,211&
        ,211,211,211,211,211,211,211,211,211,211,211,211,211,211,211&
        ,211,211,211,211,211,211,211,211,211,211,211,211,211,211,211&
        ,211,211,211,211,321,323,355,355,324,324,324,324,324,324,324&
        ,324,324,324,324,324,324,324,324,324,324,324,324,324,353,353&
        ,353,353,353,353,353,353,353,353,353,353,353,353,353,353,353&
        ,353,353,353,353,353,353,353,353,353,353,353,353,353,353,353&
        ,353,353,353,353,353,325,325,325,325,325,325,325,325,325,325&
        ,325,325,325,325,325,325,325,325,325,325,325,325,325,325,325&
        ,325,325,325,325,325,325,325,325,325,325,325,325,325,325,325&
        ,325,325,212,212,212,212,243,213,213,213,213,213,213,213,213&
        ,213,213,213,213,213,213,213,213,213,213,213,213,213,213,213&
        ,213,213,213,213,213,326,326,326,326,326,326,326,326,326,326&
        ,326,326,326,326,326,326,326,326,326,326,326,326,326,326,326&
        ,326,326,326,326,326,326,326,326,326,326,326,326,326,326,326&
        ,326,326,326,326,326,244,244,244,244,244,244,244,244,244,244&
        ,244,244,244,244,328,328,328,328,246,246,246,329,329,329,329&
        ,329,247,330,330,330,330,330,330,330,330,330,330,330,330,330&
        ,330,248,248,249,249,249,249,249,249,254,254,254,254,254,254&
        ,254,254,254,254,254,254,254,254,254,254,254,254,254,254,254&
        ,254,254,254,254,254,254,254,254,254,256,256,256,256,256,256&
        ,256,256,256,256,250,250,214,214,214,214,214,214,214,214,214&
        ,214,214,214,214,214,214,214,214,214,214,214,214,214,214,214&
        ,214,214,214,214,214,214,214,214,263,257,257,257,257,354,354&
        ,354,354,354,354,354,354,354,354,354,354,354,382,382,331,331&
        ,331,331,331,331,331,331,331,331,331,331,331,331,331,331,331&
        ,331,331,331,331,331,331,331,331,331,331,331,331,331,331,331&
        ,331,331,331,331,331,331,331,331,215,215,215,215,215,215,215&
        ,215,215,215,215,215,215,215,215,215,206,206,206,206,206,206&
        ,206,206,206,206,206,206,206,206,206,206,206,206,206,206,206&
        ,206,206,206,206,206,206,206,206,206,206,206,206,206,206,206&
        ,206,206,206,206,206,206,206,206,206,206,206,206,206,206,206&
        ,206,206,206,206,206,206,206,206,206,206,206,206,206,206,206&
        ,206,206,206,206,206,206,206,206,206,206,206,206,206,206,206&
        ,206,206,206,206,206,206,206,206,206,206,206,206,206,206,206&
        ,206,206,206,206,206,206,206,206,206,206,206,206,206,206,206&
        ,206,206,206,206,206,206,206,206,206,206,206,206,206,206,206&
        ,206,206,206,206,206,206,206,206,206,206,206,206,206,206,206&
        ,206,206,206,206,206,206,206,206,206,206,206,206,206,206,206&
        ,206,206,206,206,206,262,262,262,262,262,262,262,262,262,262&
        ,262,262,262,262,262,262,262,262,262,262,262,262,262,262,262&
        ,262,262,262,207,207,207,207,207,207,207,207,207,207,207,207&
        ,207,207,207,207,207,207,207,207,207,207,207,207,207,207,207&
        ,207,207,207,207,207,207,207,207,207,207,207,207,207,207,207&
        ,207,207,207,207,207,207,207,207,207,207,207,207,207,207,207&
        ,207,207,207,207,207,207,207,207,207,207,207,207,207,207,207&
        ,207,207,207,207,207,207,207,207,207,207,207,207,207,207,207&
        ,207,207,207,207,207,207,207,207,207,207,207,207,207,207,207&
        ,207,207,207,207,207,207,207,207,207,207,207,207,207,207,207&
        ,207,207,207,207,207,207,207,207,207,207,207,207,207,207,207&
        ,207,258,258,258,216,216,216,287,287,287,287,287,287,287,287&
        ,287,287,287,287,287,287,287,287,287,287,287,217,217,217,217&
        ,217,217,217,217,217,217,217,217,217,217,217,217,217,217,217&
        ,217,332,332,332,255,255,255,261,359,359,359,359,359,359,359&
        ,359,359,359,359,359,359,359,359,359,359,359,359,359,359,359&
        ,359,359,359,428,218,218,218,218,218,218,218,218,218,218,218&
        ,218,218,218,218,218,218,218,218,218,218,218,218,218,218,218&
        ,218,218,218,218,218,218,218,218,360,360,380,380,380,380,380&
        ,380,380,380,380,380,380,380,380,380,380,380,380,380,380,380&
        ,380,380,380,219,334,334,334,333,333,259,264,264,264,264,264&
        ,260,356,356,356,220,220,220,220,220,220,220,220,220,220,220&
        ,220,220,220,220,220,220,220,220,220,220,220,220,220,220,220&
        ,220,220,220,220,220,220,220,220,220,220,220,220,220,220,220&
        ,220,220,220,220,220,220,220,220,220,220,220,220,220,220,220&
        ,220,220,220,220,220,220,220,220,220,220,220,220,220,220,220&
        ,220,220,220,220,220,220,220,220,220,220,220,220,220,220,265&
        ,265,265,265,265,265,265,265,265,265,265,265,265,265,265,265&
        ,265,265,265,265,265,265,265,265,265,265,265,265,265,265,284&
        ,266,274,274,274,274,274,274,274,221,221,221,221,221,221,221&
        ,221,221,221,221,221,221,221,221,221,221,221,221,221,221,221&
        ,221,221,221,221,221,221,221,221,221,221,221,221,221,221,221&
        ,221,221,221,221,221,221,221,221,221,221,221,221,221,221,221&
        ,221,221,221,221,221,221,221,221,221,221,221,221,221,221,221&
        ,221,221,221,221,221,221,221,221,221,221,221,271,271,271,271&
        ,271,271,271,271,271,271,271,269,269,269,269,269,269,269,269&
        ,269,269,269,269,269,269,269,269,269,269,269,269,269,269,269&
        ,269,269,269,345,373,373,373,373,373,373,373,373,373,373,373&
        ,373,373,373,373,373,373,373,373,373,373,373,373,373,373,373&
        ,373,373,373,373,373,373,373,373,373,373,373,373,373,373,373&
        ,373,373,373,373,373,373,373,373,373,373,373,373,373,373,373&
        ,373,373,373,373,373,373,373,373,373,373,373,374,374,374,374&
        ,374,339,339,339,339,339,339,339,339,398,398,222,222,222,222&
        ,222,222,222,222,222,222,222,222,222,222,222,222,222,222,222&
        ,222,222,283,395,272,272,275,275,275,275,275,275,396,369,369&
        ,277,277,277,277,277,277,277,277,277,277,277,277,277,277,277&
        ,277,277,277,277,277,277,277,277,277,277,277,277,277,277,277&
        ,277,277,277,277,277,277,277,277,277,277,277,277,277,277,277&
        ,277,277,277,277,277,277,277,277,277,277,277,277,277,277,277&
        ,277,277,277,277,277,277,277,278,279,278,279,278,279,278,279&
        ,278,279,278,279,278,279,278,279,278,279,278,279,278,279,278&
        ,279,278,279,278,279,278,279,278,279,278,279,278,279,278,279&
        ,278,279,278,279,278,279,278,279,278,279,278,279,278,279,278&
        ,279,278,279,279,278,278,279,278,279,278,279,278,279,278,279&
        ,278,279,278,279,286,286,280,280,280,280,280,280,280,280,280&
        ,280,280,280,280,280,280,280,280,280,280,280,280,280,280,280&
        ,280,280,285,285,285,285,285,281,341,341,341,341,341,341,341&
        ,341,341,341,341,341,341,341,341,341,341,341,341,341,341,341&
        ,341,341,341,228,228,228,228,228,344,344,290,288,291,291,343&
        ,343,343,343,225,226,226,226,226,226,226,226,226,226,226,226&
        ,226,226,226,226,226,226,226,226,226,226,226,226,226,226,226&
        ,226,226,226,226,226,226,226,226,226,226,226,226,226,226,226&
        ,226,226,226,226,226,226,226,226,226,226,226,226,226,226,293&
        ,294,293,294,293,294,293,294,293,294,293,294,293,294,293,294&
        ,293,294,293,294,293,294,293,294,293,294,293,294,293,294,293&
        ,294,293,294,293,294,293,294,293,294,293,294,293,294,293,294&
        ,293,294,293,294,293,294,293,294,293,294,293,294,227,227,227&
        ,227,227,227,227,227,227,227,227,227,227,227,227,227,227,227&
        ,227,227,227,227,227,227,227,227,227,227,227,227,295,295,295&
        ,295,439,296,381,381,381,381,381,381,381,381,381,381,381,381&
        ,381,381,381,381,381,381,381,381,381,381,381,381,381,381,381&
        ,437,370,371,406,407,407,407,298,298,298,298,298,298,298,298&
        ,298,298,298,298,298,298,298,298,231,231,231,231,231,231,231&
        ,231,231,301,301,301,301,301,301,301,301,301,301,301,301,301&
        ,301,301,301,301,301,301,301,301,301,301,300,300,300,300,300&
        ,300,300,300,300,300,300,300,300,300,300,300,300,300,300,300&
        ,300,300,300,300,300,305,302,302,302,303,376,376,440,410,412&
        ,412,412,412,412,413,413,413,312,312,312,312,313,313,313,313&
        ,313,313,313,313,313,313,313,313,313,313,313,313,313,313,306&
        ,306,306,306,442,307,441,416,430,348,314,314,314,347,347,347&
        ,347,347,347,347,347,347,347,347,349,310,311,358,318,318,318&
        ,318,319,319,319,319,316,316,316,316,444,422,357,357,357,357&
        ,351,320,320,320,350,350,350,352,424,423,423,425,435,210,356&
        ,242,379,379,4,4,4,3,3,6,6,6,6,7,7,196,196,196,196,196,196&
        ,196,196,196,196,198,202,202,209,204,205,205,205,205,205,205&
        ,324,212,244,329,250,207,207,219,220,220,220,220,220,220,265&
        ,265,265,265,265,265,221,221,221,221,221,221,221,221,221,221&
        ,271,373,373,272,275,277,278,279,280,228,346,293,294,227,227&
        ,227,227,227,295,296,381,298,301,301,301,300,312,313,433,357&
        ,4,4,4,4,4,4,4,4,4,4,4,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,6,6,6,6&
        ,6,6,6,6,8,8,8,8,8,8,5,5,7,7,7,7,17,10,10,10,10,10,10,10,10&
        ,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10&
        ,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10&
        ,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10&
        ,10,10,10,10,10,10,10,12,12,12,12,12,12,12,12,12,12,12,12,12&
        ,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,20,20&
        ,20,20,20,20,20,20,20,20,15,15,15,15,15,15,15,15,15,15,15,15&
        ,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15&
        ,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15&
        ,15,15,15,15,15,15,15,15,17,17,17,17,17,17,17,17,17,17,17,17&
        ,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17&
        ,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17&
        ,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17&
        ,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,18,18,18,18&
        ,18,18,18,18,18,19,19,19,19,19,19,19,19,19,19,19,19,33,33,33&
        ,33,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26&
        ,26,26,26,26,24,24,24,24,28,28,28,28,28,28,28,28,28,28,28,28&
        ,28,28,28,28,28,28,21,21,34,38,38,39,42,42,42,42,42,42,42,42&
        ,42,42,42,42,42,42,42,53,53,53,53,53,53,53,53,53,53,53,53,53&
        ,53,53,53,53,53,53,53,53,53,53,53,53,59,64,64,64,69,75,10,10&
        ,10,10,10,12,17,17,18,26,28,28,10,10,12,42,237,236,240,235&
        ,238,242,210,239,241,211,321,323,355,324,353,325,212,243,213&
        ,326,244,327,245,328,246,329,247,330,248,368,249,254,254,254&
        ,256,256,252,251,251,250,253,253,214,214,214,263,263,257,354&
        ,382,382,383,383,331,331,331,215,215,206,206,262,207,207,207&
        ,258,258,216,216,287,217,391,332,332,255,392,392,261,261,337&
        ,337,389,389,390,359,359,428,428,377,218,218,360,380,219,219&
        ,219,334,334,333,333,259,259,264,264,264,260,356,220,220,220&
        ,220,220,372,372,372,372,379,379,342,342,265,265,284,267,268&
        ,268,268,266,266,274,274,274,221,221,221,221,431,271,271,271&
        ,269,269,335,335,345,345,393,393,385,385,336,336,270,270,373&
        ,373,373,373,374,374,364,364,339,339,339,378,375,375,397,397&
        ,398,398,398,394,394,222,222,283,283,363,363,395,395,362,272&
        ,272,273,273,275,275,396,396,369,369,276,276,276,223,223,223&
        ,277,277,277,277,277,277,278,279,278,279,278,279,278,279,278&
        ,279,286,286,286,280,280,280,280,285,285,338,338,282,282,282&
        ,281,281,224,341,341,228,228,228,366,366,401,401,402,402,399&
        ,399,399,365,365,344,344,344,447,361,361,361,400,400,400,340&
        ,340,340,386,290,290,288,288,288,289,289,291,291,343,343,225&
        ,225,225,225,297,297,226,226,226,226,226,226,226,346,346,346&
        ,346,346,293,294,293,294,293,294,227,227,295,295,439,296,296&
        ,384,384,304,304,304,304,229,229,381,381,381,381,381,448,448&
        ,448,448,448,292,292,292,292,292,292,437,438,438,438,367,367&
        ,367,404,404,388,388,388,403,403,403,403,403,387,387,387,370&
        ,370,371,371,405,405,406,406,407,407,408,408,230,230,230,298&
        ,298,298,298,299,299,231,231,231,231,231,231,231,231,301,301&
        ,300,300,305,305,305,302,302,303,303,303,232,232,376,376,376&
        ,376,376,440,449,449,449,409,409,409,409,409,429,429,429,432&
        ,432,309,309,309,309,410,410,411,411,411,412,412,413,413,413&
        ,415,415,312,312,313,313,313,306,306,442,307,307,414,414,308&
        ,308,441,233,233,233,233,416,416,430,430,430,430,430,443,443&
        ,348,348,314,314,314,347,347,349,349,310,310,311,311,234,234&
        ,234,417,417,317,317,418,418,418,315,315,450,450,358,358,433&
        ,433,420,420,318,318,319,319,316,316,444,419,419,419,421,421&
        ,436,436,436,436,422,422,357,357,445,445,351,351,320,320,350&
        ,350,352,352,424,424,434,434,426,426,423,423,427,427,425,425&
        ,451,451,446,446,435,435,452,452,196,208,197,198,199,200,201&
        ,202,203,204,205,211,215,221,269,335,196,196,196,197,197,197&
        ,198,198,198,199,199,199,200,200,200,201,201,201,202,202,202&
        ,203,203,203,204,204,204,205,205,205,211,206,207,373,373,344&
        ,10,12,17,18,10,22,11,14,16,18,19,24,24,25,26,26,27,28,21,30&
        ,20,31,32,34,36,38,38,39,39,40,41,41,42,42,47,48,50,51,52,53&
        ,53,54,54,55,56,59,59,60,61,61,62,63,64,64,68,69,74,75,75,76&
        ,78,79,79,85,86,86,87,88,89,90,92,93,93,94,94,94,95,95,95,95&
        ,96,101,101,101,107,107,108,108,109,110,109,110,111,111,112&
        ,114,115,116,116,118,119,119,119,120,126,126,127,127,128,128&
        ,128,128,129,129,129,130,130,130,130,131,133,133,134,134,134&
        ,137,137,137,137,182,183,138,138,138,139,139,139,141,141,141&
        ,141,141,142,142,147,190,191,192,193,194,184,185,186,187,189&
        ,195,179,175,181,176,177,178,149,149,153,154,154,237,235,211&
        ,326,329,254,214,206,206,221,221,4,3,6,8,5&
        ,7/)
    arr_r2(1:4429) = (/9,2,2,2,2,2,2,2,2,2,2,2,2,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,11,14,16,23,18,19,25,26,26,27,29,31,32&
        ,34,35,37,38,39,40,40,41,41,42,43,45,47,47,48,49,49,50,51,51&
        ,52,52,52,52,53,55,55,57,58,58,59,59,60,61,61,62,62,63,63,64&
        ,64,65,65,67,68,70,71,74,75,78,79,79,81,82,82,82,85,86,87,88&
        ,90,90,90,91,92,92,94,94,94,95,95,95,96,99,100,100,101,101&
        ,101,102,102,103,104,104,104,105,105,105,106,107,108,108,108&
        ,108,109,110,109,110,111,113,114,114,117,118,119,119,165,165&
        ,165,165,165,166,166,166,166,166,120,120,120,167,167,167,167&
        ,121,122,124,124,124,125,125,126,126,127,127,127,127,127,127&
        ,128,128,128,128,129,129,129,129,130,133,133,133,168,168,168&
        ,168,168,168,134,134,135,135,135,136,137,137,137,137,137,137&
        ,169,169,169,169,169,138,138,139,141,141,142,142,143,143,144&
        ,147,147,148,149,149,149,150,150,151,153,153,153,154,155,156&
        ,157,157,158,160,161,162,162,163,164,20,41,16,20,11,14,16,17&
        ,23,18,19,24,26,29,30,31,34,34,35,37,38,39,40,41,42,43,44,45&
        ,46,47,48,48,49,50,51,52,53,53,54,55,56,57,58,59,59,60,61,62&
        ,63,64,64,64,65,66,67,67,68,69,70,70,71,72,74,75,79,80,81,82&
        ,82,83,86,86,87,88,87,88,90,92,93,94,95,95,96,98,99,99,100&
        ,101,102,102,103,104,104,105,105,106,107,108,108,109,110,109&
        ,110,111,111,113,114,115,116,116,117,118,119,119,165,165,165&
        ,165,166,166,166,120,167,167,167,167,167,167,170,170,121,121&
        ,122,122,123,124,124,125,125,126,126,127,127,128,128,128,128&
        ,129,129,130,130,132,133,133,168,168,168,168,134,134,135,135&
        ,136,136,137,137,137,169,169,138,138,139,139,140,141,141,142&
        ,143,143,144,144,146,147,148,149,149,150,150,151,151,152,153&
        ,153,154,154,155,156,157,157,158,158,160,161,161,162,162,163&
        ,164,12,23,19,24,24,25,26,26,27,28,28,21,29,29,30,30,20,20,31&
        ,32,34,35,36,36,37,38,39,39,40,40,41,41,42,43,44,45,46,47,47&
        ,48,49,50,50,51,51,52,52,53,53,53,54,55,55,55,55,56,56,57,58&
        ,58,59,59,60,60,60,60,60,61,61,61,62,62,62,63,63,63,63,64,64&
        ,64,65,65,66,66,67,67,68,68,68,69,69,70,71,71,72,72,73,73,73&
        ,73,74,75,75,78,78,79,79,79,79,80,81,82,82,83,84,85,85,85,85&
        ,86,86,86,86,87,88,89,89,90,90,91,91,92,92,93,93,93,94,94,95&
        ,95,96,96,96,98,98,99,100,100,101,101,101,102,102,103,104,104&
        ,105,105,106,107,107,108,108,109,110,109,110,111,111,113,113&
        ,114,114,115,115,116,116,117,117,118,118,118,118,119,119,119&
        ,119,119,165,165,165,165,166,166,166,166,120,120,120,120,120&
        ,120,120,167,167,167,167,167,170,170,121,121,122,122,122,123&
        ,124,124,125,125,126,126,127,127,127,127,127,128,128,128,128&
        ,129,129,129,130,130,131,132,132,133,133,168,168,168,168,168&
        ,134,134,134,134,135,135,135,136,137,137,137,137,137,137,169&
        ,169,169,169,169,138,138,138,139,139,140,140,141,141,141,141&
        ,142,142,142,143,143,143,144,144,145,146,146,147,148,149,149&
        ,149,149,149,150,150,150,151,151,152,152,153,153,154,154,155&
        ,156,157,157,157,158,158,159,160,161,161,161,162,162,163,164&
        ,171,171,16,37,11,14,24,26,26,28,21,21,20,38,38,39,39,41,41&
        ,41,42,42,53,59,60,60,61,62,62,63,64,64,75,79,79,79,95,95,95&
        ,101,101,101,119,119,119,119,119,119,133,133,133,133,133,11&
        ,12,24,24,26,26,28,20,36,38,38,39,41,42,42,53,53,59,60,61,62&
        ,62,62,63,63,63,64,64,73,75,76,79,79,85,95,95,101,119,119,133&
        ,133,133,19,41,42,61,61,86,86,101,101,119,127,11,14,16,19,24&
        ,26,38,39,41,42,47,48,48,51,53,59,62,62,62,64,64,79,86,87,88&
        ,94,95,95,101,108,109,110,111,119,129,129,129,129,129,11,14&
        ,16,26,38,42,32,59,61,63,68,79,86,87,88,94,94,101,108,109,110&
        ,111,127,128,129,137,10,15,17,18,18,24,26,26,20,38,38,39,41&
        ,59,59,61,61,63,63,64,64,75,75,86,119,119,119,119,119,119,119&
        ,10,11,12,14,15,16,17,18,18,18,19,24,26,28,28,20,38,39,41,41&
        ,41,42,53,59,60,61,61,61,62,62,63,63,63,64,64,68,75,79,79,86&
        ,86,95,95,95,101,101,101,119,119,119,133,133,133,10,12,17,18&
        ,24,26,21,20,38,39,39,41,41,41,42,53,59,60,60,60,61,61,61,61&
        ,63,63,64,64,75,95,95,10,12,15,17,18,24,26,26,20,38,38,39,41&
        ,42,42,53,53,59,59,60,61,61,62,62,63,64,75,75,85,95,95,101&
        ,101,119,119,119,17,20,10,11,14,16,17,19,20,41,119,10,12,15&
        ,17,24,24,26,26,28,28,21,21,20,36,38,38,39,39,41,41,42,42,53&
        ,53,59,59,60,60,60,61,61,62,62,62,63,64,64,75,86,86,95,95,101&
        ,119,119,119,127,127,127,20,20,12,20,10,11,12,14,15,16,17,17&
        ,18,19,26,39,61,62,62,63,68,101,101,119,10,11,12,14,15,16,17&
        ,17,18,24,26,28,21,20,38,39,41,42,53,59,60,61,61,62,62,62,63&
        ,64,64,75,79,79,95,95,101,119,119,10,15,17,18,18,18,24,24,24&
        ,26,28,21,21,20,20,36,38,39,39,41,41,41,42,53,59,60,60,60,61&
        ,61,61,61,61,63,64,68,75,95,95,95,101,101,11,14,16,19,17,10&
        ,10,11,14,15,16,18,18,19,24,26,26,38,38,39,59,59,62,64,64,75&
        ,76,95,95,101,119,133,133,10,15,17,18,18,18,19,24,24,26,26,28&
        ,21,20,36,38,39,39,41,42,47,48,50,53,53,59,59,60,61,61,62,62&
        ,63,64,64,64,68,75,75,95,95,101,101,119,119,17,41,61,61,61,63&
        ,86,101,101,101,119,119,127,127,39,149,149,154,15,17,20,10,12&
        ,15,17,101,17,10,11,14,15,15,17,18,24,26,21,20,39,59,64,12,20&
        ,11,14,15,16,62,101,10,15,15,17,18,26,26,28,20,39,59,59,59,60&
        ,61,63,63,63,64,68,75,75,86,95,101,101,119,119,119,119,20,119&
        ,119,119,101,61,61,86,86,62,20,86,10,15,17,18,24,26,20,38,39&
        ,41,41,42,53,53,59,60,61,62,62,63,64,64,75,79,79,95,95,95,101&
        ,101,119,119,20,101,61,86,86,12,12,17,17,20,39,41,61,61,62&
        ,101,119,119,21,61,10,11,14,15,16,17,18,18,18,19,24,24,26,26&
        ,21,20,38,39,41,42,53,53,59,59,61,62,62,62,63,64,64,64,68,75&
        ,75,95,95,101,101,119,10,11,12,14,15,16,17,17,18,19,39,61,62&
        ,64,101,101,10,22,11,14,15,33,16,17,23,18,19,24,26,28,21,21&
        ,29,30,31,32,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49&
        ,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69&
        ,70,71,72,74,75,76,79,80,81,82,83,84,85,86,87,88,89,90,91,92&
        ,93,94,95,96,98,99,100,101,102,103,104,105,106,107,108,109&
        ,110,111,113,114,115,116,116,117,118,119,165,166,120,167,170&
        ,121,122,123,124,125,126,127,127,128,129,130,131,132,133,133&
        ,133,168,134,135,136,137,137,137,169,138,139,140,141,142,143&
        ,144,145,146,147,148,149,149,149,150,151,152,153,154,155,156&
        ,157,158,159,160,161,162,163,164,171,10,12,17,18,18,24,26,21&
        ,20,38,39,41,42,53,59,60,61,61,63,64,64,68,75,95,101,101,119&
        ,119,10,11,14,16,23,18,19,24,26,29,30,34,35,37,38,40,42,42,43&
        ,44,45,46,47,48,50,51,52,53,55,56,57,58,59,61,62,63,64,65,67&
        ,68,69,70,71,72,74,75,79,80,81,82,83,84,86,87,88,89,90,91,92&
        ,93,95,96,98,99,100,101,102,103,104,107,108,109,110,111,113&
        ,114,115,116,117,118,165,166,120,167,170,121,122,123,124,125&
        ,126,127,128,129,130,131,132,133,168,134,135,136,137,169,138&
        ,139,140,141,142,143,144,145,146,147,148,149,149,150,151,152&
        ,153,154,155,156,157,158,159,160,161,162,163,164,171,10,17,20&
        ,17,17,101,10,18,18,24,26,20,38,39,41,42,53,59,61,63,64,64,75&
        ,95,101,10,17,18,24,26,21,38,39,42,53,59,60,61,63,64,68,75,95&
        ,101,119,21,20,61,21,20,36,61,10,18,24,26,21,38,42,53,59,60&
        ,61,63,64,68,75,86,95,101,119,165,166,120,167,168,171,61,15&
        ,17,18,18,18,24,26,26,28,28,20,38,39,41,41,53,59,59,61,61,61&
        ,62,62,62,62,62,63,64,68,75,95,95,101,101,12,20,10,15,17,18&
        ,24,26,28,21,20,36,38,39,42,53,59,60,61,63,64,68,75,95,101&
        ,101,86,127,127,20,62,20,10,15,17,18,41,17,21,20,41,10,10,10&
        ,11,14,15,15,15,16,17,17,17,23,19,19,19,26,26,28,38,39,42,41&
        ,53,59,59,62,62,63,64,64,68,68,75,75,86,86,87,88,87,88,95,101&
        ,101,108,108,108,108,109,110,109,110,111,111,119,119,127,127&
        ,127,127,128,128,128,128,129,129,129,130,130,137,137,137,138&
        ,138,138,139,139,143,143,143,144,144,150,150,150,19,20,39,39&
        ,39,41,41,41,60,61,61,61,62,62,62,79,79,79,86,101,101,101,101&
        ,119,119,127,127,127,129,129,20,20,10,10,10,15,17,17,18,10,10&
        ,11,14,15,15,16,17,17,17,23,18,19,19,19,24,26,28,31,34,38,39&
        ,41,42,48,52,53,53,53,53,59,62,64,64,75,79,86,87,88,87,88,95&
        ,101,101,108,108,108,108,109,110,111,119,165,165,166,166,120&
        ,120,167,167,127,127,127,127,128,129,129,129,130,133,168,138&
        ,139,143,144,150,151,157,16,16,19,26,59,59,75,75,95,101,101&
        ,11,14,16,18,18,19,24,26,26,38,39,41,53,59,59,61,63,64,64,68&
        ,75,95,101,101,119,119,19,10,16,23,19,26,29,30,44,46,47,48,50&
        ,55,56,57,58,59,62,63,65,67,68,70,72,75,81,82,83,87,88,89,90&
        ,91,92,93,95,98,99,100,101,102,107,108,109,110,111,113,114&
        ,117,165,166,120,167,124,126,128,129,133,168,134,137,169,148&
        ,149,154,156,171,12,63,68,95,101,10,17,21,61,86,101,119,126&
        ,61,101,11,14,16,17,17,19,24,26,20,38,39,42,59,61,62,64,64,75&
        ,95,101,119,86,86,10,86,10,15,15,17,17,41,17,10,10,10,10,10&
        ,12,15,17,17,18,19,19,53,53,53,61,62,63,68,86,87,88,87,88,87&
        ,88,101,108,108,108,109,110,109,110,109,110,111,111,111,119&
        ,120,127,128,128,128,129,129,129,130,130,130,137,137,138,138&
        ,138,139,139,139,143,143,143,144,144,144,150,150,150,171,10&
        ,10,12,12,15,15,17,17,23,23,18,18,19,19,19,19,53,53,86,86,87&
        ,88,108,108,108,108,109,110,109,110,111,111,111,111,119,119&
        ,127,127,127,127,128,128,129,129,129,129,130,130,130,130,137&
        ,137,137,137,137,137,137,137,137,137,138,138,138,138,139,139&
        ,139,139,143,143,143,143,20,20,10,11,14,16,17,20,53,53,86,87&
        ,88,87,88,108,109,110,111,111,119,127,127,128,129,130,137,138&
        ,20,61,61,86,119,20,12,17,21,20,41,60,61,62,62,79,79,86,86,86&
        ,86,95,95,101,101,101,119,127,127,133,133,16,26,68,75,101,10&
        ,10,10,10,10,61,10,21,20,61,21,10,10,10,10,12,15,15,17,17,18&
        ,19,19,53,53,53,86,86,86,87,88,87,88,101,101,108,108,108,109&
        ,110,109,110,111,111,120,127,127,128,128,128,128,129,129,130&
        ,130,137,138,138,139,139,143,143,144,144,150,150,10,10,10,10&
        ,17,17,18,18,19,19,19,19,53,53,53,53,86,86,87,88,87,88,108&
        ,108,109,110,109,110,111,111,111,111,119,119,127,127,128,128&
        ,128,128,129,129,130,130,130,130,137,137,138,138,138,138,139&
        ,139,139,139,143,143,10,10,15,17,17,17,23,18,19,19,53,86,87&
        ,88,108,108,109,110,111,119,119,127,127,128,128,129,129,130&
        ,137,138,10,15,17,20,20,20,10,10,10,12,14,17,17,18,19,19,24&
        ,26,21,38,42,53,59,61,63,64,68,75,86,95,101,120,171,20,10,10&
        ,10,10,17,61,10,10,10,12,17,17,61,62,63,68,86,86,86,95,101&
        ,127,10,10,12,12,15,15,17,86,137,10,10,15,17,17,18,53,87,88&
        ,108,108,109,110,111,119,128,128,129,129,130,137,138,138,10&
        ,10,15,17,53,86,86,87,88,108,108,109,110,109,110,111,119,119&
        ,127,127,128,128,129,129,137,20,10,17,20,20,95,133,20,12,10&
        ,15,15,17,171,86,86,129,10,10,15,17,10,10,17,53,88,87,108,108&
        ,109,110,109,110,119,119,127,128,128,137,10,15,17,20,20,20,20&
        ,10,15,15,10,10,17,10,10,15,17,53,86,86,108,108,119,127,20,20&
        ,20,15,10,10,15,17,10,10,17,119,10,15,17,20,20,10,15,127,17&
        ,41,15,10,10,17,10,15,17,20,15,15,17,10,15,20,12,20,12,12,39&
        ,41,60,61,63,28,20,63,119,28,63,12,17,20,56,93,115,132,140&
        ,146,152,12,20,61,20,20,12,17,20,63,86,119,20,20,20,20,12,61&
        ,119,20,12,21,20,120,142,155,12,12,21,20,20,86,21,20,61,63&
        ,101,120,133,134,142,155,86,86,127,20,20,21,12,12,12,119,86&
        ,129,129,12,86,120,129,142,129,20,21,61,12,86,129,129,129,86&
        ,12,20,10,12,15,17,26,20,38,41,42,59,61,10,12,15,17,24,26,28&
        ,21,38,42,53,59,64,75,94,10,12,15,17,26,21,20,59,10,12,15,17&
        ,21,41,12,94,10,12,26,94,26,26,34,38,39,39,40,41,42,43,46,48&
        ,52,52,59,64,64,54,53,57,75,75,78,82,85,94,86,86,86,172,105&
        ,127,165,167,106,108,108,87,88,109,110,89,90,128,137,135,111&
        ,129,169,130,131,138,139,143,144,145,150,151,157,158,159,153&
        ,162,93,115,132,132,140,146,146,146,59,75,28,36,21,34,64,64&
        ,108,172,165,167,26,59,94,119,42,101,61,63,39,39,95,69,69,41&
        ,77,77,77,97,97,62,60,73,76,79,10,26,59,94,17,42,15,38,75,77&
        ,24,26,28,34,38,39,40,42,41,43,45,47,47,48,52,59,59,64,66,76&
        ,76,76,77,82,53,54,57,56,87,88,89,94,94,172,105,108,108,109&
        ,110,128,93,115,111,112,130,131,135,135,138,132,139,140,144&
        ,150,145,146,151,152,158,159,24,25,25,26,27,28,29,30,34,38,38&
        ,40,40,42,43,46,47,47,48,49,49,53,54,57,58,59,59,64,64,63,65&
        ,66,66,67,62,69,69,71,75,75,75,76,77,78,78,80,80,56,81,82,82&
        ,83,108,135,135,87,88,89,90,91,93,94,172,100,103,105,110,115&
        ,111,111,112,113,117,123,130,131,132,139,140,144,145,146,151&
        ,152,158,159,173,174,24,26,38,34,41,42,59,59,94,41,39,42,59&
        ,94,86,137,129,143,157,127,180,20,26,42,61,39,41,69,119,86&
        ,137,129,143,127,180,56,115,140,152,24,93,132,146,120,142,155&
        ,164,188,86,127,129,143,39,41,64,42,42,69,86,101,101,127,129&
        ,143,157,120,142,155,164,188,42,69,34,38,39,75,50,52,42,59,62&
        ,64,69,75,75,77,95,95,97,108,135,18,30,41,63,68,86,109,110&
        ,129,138,143,150,56,115,140,152,24,93,132,146,120,142,155,164&
        ,188,69,64,69,94,94,95,10,12,15,17,20,17,17,52,21,20,53,94,24&
        ,56,42,42,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1&
        ,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1&
        ,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1&
        ,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1&
        ,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1&
        ,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1&
        ,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1&
        ,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1&
        ,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1&
        ,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1&
        ,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1&
        ,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1&
        ,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1&
        ,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1&
        ,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1&
        ,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1&
        ,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1&
        ,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1&
        ,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,4,3,8,4,3,8,4,3,8,4,3,8,4&
        ,3,8,4,3,8,4,3,8,4,3,8,4,3,8,4,3,8,3,3,3,3,3,3,1,1,1,1,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456/)
    arr_p1(1:4429) = (/2,10,11,12,13,14,15,16,17,18,19&
        ,20,12,196,208,197,198,199,200,201,202,203,209,204,205,10,10&
        ,10,22,10,10,210,10,10,12,198,198,211,12,33,12,14,15,16,15,15&
        ,212,15,17,213,17,23,23,23,18,19,19,19,19,19,18,24,10,30,24&
        ,24,21,24,29,214,21,42,20,215,28,21,207,29,216,26,28,217,49&
        ,45,34,39,16,38,218,39,17,41,28,21,219,43,47,48,19,50,52,53&
        ,220,56,56,24,24,58,24,56,59,221,21,20,42,34,50,58,38,75,222&
        ,81,81,47,82,59,59,223,86,87,88,93,56,91,56,93,64,224,65,63&
        ,59,53,81,103,81,104,82,94,225,86,226,109,110,53,111,227,115&
        ,93,115,94,95,228,229,94,119,230,127,108,128,231,130,132,132&
        ,63,232,111,139,140,132,140,94,95,233,144,146,146,94,95,234&
        ,139,107,151,152,146,94,158,94,94,151,10,197,200,202,209,204&
        ,205,236,237,235,238,239,236,240,241,200,202,242,212,241,243&
        ,203,210,210,244,245,205,246,246,246,247,205,246,248,204,210&
        ,241,249,250,251,250,252,239,253,254,214,210,207,255,215,216&
        ,256,257,235,207,253,258,259,256,260,261,207,262,210,241,219&
        ,259,246,263,264,249,265,266,266,250,267,266,266,268,266,254&
        ,220,221,214,207,269,214,270,239,253,262,271,222,272,273,273&
        ,259,274,272,263,274,275,276,223,265,277,278,279,266,266,280&
        ,280,281,281,282,281,283,276,220,277,284,254,262,285,256,265&
        ,254,257,285,286,250,265,285,250,287,284,285,288,289,272,290&
        ,291,274,291,277,292,265,277,278,279,226,293,280,293,294,227&
        ,265,281,227,295,296,221,228,229,297,228,269,262,276,225,297&
        ,230,293,294,298,299,220,277,293,294,227,231,300,295,301,278&
        ,279,296,302,303,304,232,295,305,303,306,307,277,301,308,228&
        ,309,233,307,310,311,312,313,314,234,306,315,311,316,317,314&
        ,317,318,319,320,316,321,213,202,323,197,200,202,203,209,204&
        ,205,237,235,239,241,321,204,324,200,202,325,212,243,213,326&
        ,244,327,245,328,246,205,329,247,330,248,249,237,254,256,251&
        ,250,252,253,235,214,207,331,215,262,210,211,207,258,241,246&
        ,263,198,212,247,332,261,333,202,218,324,334,259,329,264,260&
        ,254,220,250,250,265,265,267,268,266,221,207,269,335,336,337&
        ,270,283,222,259,272,273,263,274,264,275,276,223,220,277,265&
        ,265,278,279,266,280,338,282,281,339,224,340,271,221,341,262&
        ,254,284,342,276,220,284,286,198,286,265,284,287,254,287,218&
        ,272,290,273,288,289,274,291,275,343,276,225,277,226,278,279&
        ,293,294,280,227,281,295,296,228,229,344,207,345,218,297,230&
        ,226,298,346,299,293,294,231,301,227,295,300,296,302,303,304&
        ,232,305,302,313,303,306,307,221,308,309,233,306,347,307,310&
        ,311,312,348,309,234,349,315,310,319,311,316,221,316,350,318&
        ,351,221,352,198,209,205,196,237,196,196,235,208,196,201,196&
        ,196,209,196,204,198,211,208,322,204,200,201,353,202,201,201&
        ,203,201,204,203,213,203,209,209,209,204,196,205,205,205,203&
        ,205,204,205,203,204,196,237,235,196,196,204,237,241,196,237&
        ,196,196,209,196,235,196,203,210,213,354,198,326,331,204,324&
        ,215,196,201,235,242,235,210,355,196,209,198,241,205,246,196&
        ,242,325,198,212,247,244,245,204,328,201,203,353,212,202,201&
        ,325,203,242,203,204,210,241,209,205,205,329,242,205,204,213&
        ,249,356,237,235,254,220,250,250,237,284,237,250,209,250,237&
        ,241,196,237,250,235,214,210,207,204,241,214,324,333,337,235&
        ,239,325,218,222,205,259,259,329,263,329,264,214,210,214,254&
        ,220,250,250,265,265,254,266,237,253,241,250,250,266,354,339&
        ,244,214,325,214,262,271,198,235,214,221,341,237,256,284,262&
        ,242,254,284,257,237,242,254,256,250,265,284,237,250,284,325&
        ,342,75,218,329,272,205,205,273,273,329,274,264,275,242,221&
        ,254,214,220,277,226,250,265,278,279,254,266,280,265,281,266&
        ,266,281,326,221,207,269,325,222,210,207,221,223,297,277,226&
        ,298,277,250,265,278,279,293,294,227,293,294,278,279,265,281&
        ,295,280,296,281,296,218,221,271,304,111,254,280,280,296,302&
        ,295,303,296,296,303,221,339,223,297,230,298,309,295,303,306&
        ,302,307,303,307,300,312,221,228,302,297,302,307,310,306,311&
        ,307,221,306,311,316,347,318,221,310,357,358,202,202,197,200&
        ,237,235,242,242,210,212,325,353,325,353,212,203,212,213,212&
        ,326,254,214,210,354,331,324,215,262,325,207,218,204,241,219&
        ,212,207,269,359,218,222,262,221,221,271,271,341,212,221,269&
        ,228,229,197,198,237,210,235,210,212,326,212,325,212,212,213&
        ,213,326,210,254,214,213,331,61,324,215,210,212,207,326,207&
        ,212,218,360,204,219,213,207,269,222,221,341,269,228,229,23&
        ,245,245,245,261,283,361,222,362,363,361,197,200,202,205,241&
        ,241,243,212,249,249,246,329,248,248,251,216,328,333,215,324&
        ,207,328,364,268,268,335,215,207,222,364,365,365,282,366,278&
        ,279,280,227,367,197,200,202,246,247,330,368,263,337,260,260&
        ,248,272,273,273,263,274,369,290,288,288,289,370,371,280,371&
        ,196,196,210,204,241,250,235,250,254,254,256,212,210,214,265&
        ,254,372,265,284,254,207,218,342,280,254,220,265,278,279,293&
        ,294,237,197,196,200,242,202,210,204,241,324,205,250,237,256&
        ,257,214,242,212,64,210,207,210,250,254,207,207,269,373,216&
        ,374,256,342,271,214,207,271,262,216,375,278,279,207,221,228&
        ,345,222,344,220,277,226,221,228,376,196,198,203,204,237,235&
        ,210,262,325,212,377,212,213,377,326,254,214,252,354,377,262&
        ,207,345,378,262,379,262,207,218,207,269,196,198,212,203,204&
        ,237,235,207,207,325,207,212,213,326,207,254,207,214,207,354&
        ,331,207,215,207,262,207,207,218,249,207,269,207,222,207,341&
        ,297,209,258,196,197,200,202,210,205,216,219,216,235,198,325&
        ,326,237,254,235,214,242,262,210,207,206,359,325,218,212,217&
        ,213,380,326,331,254,220,214,221,210,354,339,331,373,204,324&
        ,215,262,206,207,218,220,277,207,269,222,221,341,381,220,277&
        ,226,382,383,211,206,241,197,204,200,243,202,204,249,204,205&
        ,214,212,373,333,374,271,271,222,344,366,196,197,198,200,201&
        ,202,203,212,204,237,235,242,210,359,325,212,213,326,254,214&
        ,354,331,359,204,324,215,262,207,359,218,204,219,207,269,222&
        ,214,221,235,353,326,204,324,243,254,256,262,214,262,207,377&
        ,206,218,359,218,212,359,212,213,380,331,220,221,212,217,339&
        ,331,217,218,373,222,271,269,271,222,207,269,228,222,344,197&
        ,200,202,205,212,196,210,197,200,212,202,204,249,205,210,235&
        ,207,217,360,212,214,269,215,207,380,218,360,207,269,222,384&
        ,228,229,235,212,213,204,324,249,329,237,254,235,214,262,207&
        ,331,359,218,212,217,213,331,263,264,337,254,220,214,221,339&
        ,331,373,215,374,271,331,207,269,271,218,222,269,228,222,344&
        ,373,381,245,245,261,385,373,271,361,362,344,386,340,387,363&
        ,388,212,309,336,309,205,330,263,246,205,247,330,344,330,205&
        ,197,200,205,212,205,205,246,207,205,337,212,205,207,205,389&
        ,197,200,243,202,328,222,250,235,256,207,204,214,265,284,220&
        ,212,221,278,279,372,223,220,271,286,220,271,222,276,227,228&
        ,276,344,220,293,294,231,271,277,346,271,271,207,271,265,271&
        ,216,265,295,254,262,207,216,265,220,221,271,212,207,339,269&
        ,278,279,277,269,228,216,366,276,221,223,271,216,335,207,223&
        ,297,344,304,226,298,274,271,207,265,271,198,207,203,213,339&
        ,212,213,331,339,215,222,339,341,207,373,235,197,200,217,202&
        ,213,204,324,390,205,237,254,235,214,207,373,373,212,213,373&
        ,254,220,214,221,373,215,373,374,271,207,269,373,271,218,222&
        ,269,228,222,344,373,216,197,324,200,243,202,324,249,204,205&
        ,212,373,374,207,222,344,235,321,197,200,218,383,202,326,244&
        ,324,329,254,214,262,207,255,258,216,382,383,215,200,359,202&
        ,218,217,391,380,331,334,392,261,333,263,264,332,337,389,390&
        ,220,342,364,265,372,283,221,339,373,374,271,269,363,335,274&
        ,271,393,369,385,336,394,222,212,375,395,272,275,396,397,398&
        ,277,278,279,286,399,400,365,280,341,228,366,401,402,361,344&
        ,290,288,291,343,225,297,226,293,294,227,403,367,295,207,373&
        ,387,304,381,292,292,346,346,404,370,371,405,406,407,408,277&
        ,298,231,301,300,305,302,221,228,376,409,309,410,411,293,294&
        ,412,413,312,313,306,414,415,314,347,349,310,416,417,373,298&
        ,418,318,319,316,358,419,420,421,320,350,352,422,423,424,425&
        ,426,427,235,198,203,204,324,254,214,207,271,218,212,213,331&
        ,220,221,339,331,373,271,271,269,271,222,228,271,222,271,277&
        ,235,197,200,202,244,324,329,254,214,258,216,215,200,202,218&
        ,391,331,339,334,392,261,333,263,264,337,389,390,220,364,265&
        ,372,283,221,373,374,271,269,363,274,271,393,369,385,336,394&
        ,222,375,395,272,275,396,397,277,278,279,286,399,400,365,280&
        ,228,366,401,402,361,344,290,288,291,297,226,293,294,227,403&
        ,367,295,384,387,304,292,292,346,346,404,370,371,405,406,407&
        ,408,298,231,301,300,305,302,376,409,309,410,411,412,413,312&
        ,313,306,414,415,314,347,349,310,416,417,373,418,318,319,316&
        ,358,419,420,421,320,350,352,422,423,424,425,426,427,253,244&
        ,363,207,219,344,235,204,324,254,214,271,218,212,212,331,220&
        ,221,373,271,271,269,222,228,222,235,360,324,254,214,207,218&
        ,212,331,220,221,339,373,271,269,271,222,228,344,381,207,369&
        ,373,207,207,359,373,235,324,254,214,207,218,331,220,221,339&
        ,373,271,269,271,222,277,228,344,381,292,292,346,346,409,427&
        ,394,359,217,204,324,391,254,235,214,271,345,222,222,212,217&
        ,393,220,214,221,373,222,344,324,215,374,222,344,271,207,271&
        ,222,222,228,222,344,212,212,235,360,326,324,254,214,262,207&
        ,206,359,218,217,331,220,221,339,373,271,269,271,222,228,344&
        ,222,361,363,429,401,374,272,263,332,337,389,337,247,249,398&
        ,213,86,250,265,197,200,235,256,342,202,207,255,372,283,205&
        ,259,272,278,279,286,276,212,223,207,227,293,294,215,277,346&
        ,207,277,271,346,222,225,227,301,295,295,300,300,269,222,344&
        ,277,293,294,301,300,300,312,312,302,313,231,412,226,293,294&
        ,430,293,294,312,348,227,313,314,306,347,231,348,358,300,347&
        ,318,310,319,313,319,320,316,350,347,350,423,273,278,212,212&
        ,342,207,372,399,399,207,277,399,216,277,365,241,399,365,300&
        ,345,222,222,344,277,301,293,294,312,295,300,286,280,205,259&
        ,272,205,205,207,205,254,220,197,200,262,345,202,255,207,269&
        ,363,216,205,263,274,265,220,276,431,335,271,212,228,269,274&
        ,375,278,279,293,294,277,366,207,341,304,366,293,265,265,227&
        ,227,207,344,304,277,293,294,231,301,301,300,298,293,294,293&
        ,294,293,294,293,294,277,293,294,412,430,293,294,312,313,228&
        ,232,314,347,318,319,320,350,423,202,202,260,214,221,221,222&
        ,222,228,344,344,197,200,202,204,324,205,254,235,214,228,212&
        ,207,220,214,221,373,271,207,228,271,222,228,222,344,228,309&
        ,260,207,202,261,329,214,258,216,392,333,263,264,337,364,265&
        ,372,283,221,374,271,363,274,271,369,336,222,272,275,396,278&
        ,279,286,399,400,365,280,228,401,402,361,344,290,297,226,293&
        ,294,227,403,367,387,292,292,346,346,406,408,231,301,376,409&
        ,309,412,413,417,418,419,421,427,215,271,271,228,344,235,207&
        ,207,373,277,344,381,408,373,344,197,200,202,217,393,205,220&
        ,344,344,344,212,344,221,344,344,207,344,344,344,344,344,432&
        ,388,273,405,274,332,369,337,270,402,207,260,396,265,278,279&
        ,220,342,223,221,364,272,290,220,227,301,373,374,271,271,301&
        ,278,279,300,300,312,312,344,293,294,430,293,294,312,312,348&
        ,348,227,313,314,412,346,298,231,348,358,301,314,433,300,347&
        ,318,412,358,312,318,351,313,319,320,314,320,434,347,350,423&
        ,318,423,435,427,280,280,265,265,286,286,207,207,400,400,365&
        ,365,273,273,288,288,300,300,312,312,313,313,312,312,348,348&
        ,313,313,314,314,306,306,347,347,430,430,301,301,358,358,433&
        ,433,347,347,318,318,310,310,319,319,227,227,301,301,413,413&
        ,312,312,357,357,319,319,320,320,316,316,350,350,350,350,423&
        ,423,220,346,281,197,200,202,207,227,296,302,313,303,303,306&
        ,306,314,347,347,227,310,312,301,433,318,319,316,351,350,265&
        ,207,346,295,415,295,221,221,207,381,213,339,373,215,374,219&
        ,375,220,277,293,294,269,228,222,344,381,381,226,298,229,376&
        ,202,214,271,222,344,271,345,288,289,290,373,274,207,407,373&
        ,207,278,279,293,294,277,276,225,207,221,364,290,370,293,294&
        ,301,293,294,430,227,227,348,348,222,344,277,298,430,301,301&
        ,358,358,300,433,346,412,436,293,294,301,358,312,433,313,351&
        ,430,314,424,347,434,318,434,319,435,320,435,280,280,227,227&
        ,277,277,365,365,288,288,371,371,300,300,312,312,312,312,313&
        ,313,314,314,348,348,314,314,433,433,347,347,318,318,430,430&
        ,358,358,433,433,357,357,318,318,319,319,320,320,357,357,320&
        ,320,434,434,350,350,423,423,423,423,281,295,437,438,278,279&
        ,403,367,289,405,313,314,347,347,314,433,318,318,319,348,358&
        ,433,357,318,351,313,319,350,424,423,296,439,207,300,305,302&
        ,235,277,226,341,200,373,228,324,291,406,254,214,207,218,331&
        ,220,221,373,271,269,271,222,277,228,344,346,427,440,371,405&
        ,370,406,402,373,293,294,231,226,207,230,373,374,271,271,293&
        ,294,430,228,344,412,227,301,293,294,346,299,207,358,427,295&
        ,300,440,207,207,367,314,318,318,433,357,351,351,320,358,351&
        ,424,314,434,423,358,423,435,296,302,305,207,347,347,318,319&
        ,319,318,351,319,319,320,320,350,433,357,351,424,320,434,318&
        ,423,434,415,303,207,313,306,417,419,441,298,301,226,299,207&
        ,427,433,357,433,302,313,415,207,303,306,207,319,350,350,320&
        ,434,350,350,423,423,351,424,434,423,435,435,307,442,207,347&
        ,349,310,416,443,416,443,306,347,207,307,310,349,207,350,350&
        ,423,423,435,434,435,420,319,316,443,310,319,420,207,311,316&
        ,207,435,317,444,207,350,352,445,422,427,358,430,445,316,350&
        ,207,317,352,207,426,445,426,207,446,446,255,249,287,287,254&
        ,5,6,21,7,5,5,7,5,7,5,5,235,210,214,266,281,296,303,307,311&
        ,317,211,428,394,334,215,329,330,264,396,290,406,374,393,395&
        ,275,265,384,309,447,277,448,226,443,445,446,278,279,438,294&
        ,293,312,297,381,376,408,414,416,419,421,422,425,411,309,418&
        ,370,407,449,293,294,227,419,450,424,424,301,433,445,434,446&
        ,423,313,309,418,413,357,451,435,452,434,357,427,24,26,28,21&
        ,53,59,63,60,64,86,95,26,20,38,42,53,59,63,64,75,61,86,94,95&
        ,101,119,21,42,39,41,64,60,61,95,30,34,40,52,79,85,63,126,64&
        ,61,95,133,207,24,30,28,28,21,28,21,21,29,18,47,21,30,53,26&
        ,57,24,56,24,68,63,21,67,21,86,87,88,56,54,104,128,56,56,120&
        ,109,110,93,93,111,111,56,56,129,169,137,115,130,138,132,115&
        ,139,140,144,146,140,151,152,158,173,152,143,157,24,56,24,56&
        ,56,93,56,24,26,26,24,28,24,18,20,17,86,20,166,120,10,26,59&
        ,94,17,75,42,28,17,15,64,75,42,42,41,42,61,61,77,34,21,42,39&
        ,21,26,59,94,119,42,61,38,75,101,97,28,28,10,40,36,36,36,39&
        ,39,44,44,28,49,49,39,63,68,78,63,36,39,73,38,70,54,28,28,28&
        ,89,89,28,63,172,38,70,106,86,120,120,120,56,28,112,28,131,28&
        ,172,127,142,28,28,28,145,155,54,28,28,28,159,54,21,27,22,21&
        ,22,21,23,21,52,39,42,39,52,41,45,52,21,50,50,39,50,21,21,21&
        ,29,21,21,12,42,78,21,79,42,50,34,42,76,45,38,69,39,39,42,39&
        ,28,71,43,21,47,50,50,49,107,134,95,53,53,21,57,58,21,95,78&
        ,65,81,99,86,21,87,88,89,91,80,103,21,112,21,21,21,21,78,21&
        ,21,21,21,78,21,21,30,30,40,46,52,52,66,30,96,50,50,50,67,104&
        ,102,175,176,177,178,179,181,32,32,32,32,63,21,39,127,109,182&
        ,138,150,137,183,93,132,146,173,56,115,140,152,184,185,186&
        ,187,189,111,169,139,151,36,17,63,78,63,39,120,75,170,136,142&
        ,155,164,190,191,192,193,194,60,38,62,36,73,36,84,85,61,95,61&
        ,61,61,38,101,61,64,116,61,86,127,55,92,64,120,120,129,138&
        ,138,143,150,157,161,115,140,152,174,93,132,146,173,142,155&
        ,164,188,195,39,95,95,119,119,168,24,26,28,21,59,42,41,85,79&
        ,94,120,126,56,93,61,97,10,10,10,10,22,10,17,23,10,12,12,12&
        ,12,18,15,15,15,15,17,17,23,23,23,18,19,19,19,19,19,19,17,24&
        ,26,10,10,24,21,24,30,24,23,29,10,26,10,19,47,28,17,22,31,33&
        ,32,17,42,17,18,34,12,20,28,21,42,26,23,29,30,26,28,39,40,38&
        ,49,21,43,44,43,45,19,50,19,51,52,36,38,16,37,21,15,38,17,41&
        ,21,30,10,23,43,34,46,19,47,19,19,48,19,52,53,24,26,59,24,21&
        ,21,53,57,28,54,26,54,53,56,24,24,24,55,56,24,56,19,47,67,20&
        ,26,26,59,25,28,63,68,21,64,30,66,28,68,39,69,43,71,34,72,48&
        ,50,42,61,42,20,34,62,30,55,21,42,60,21,42,79,50,84,52,52,85&
        ,16,74,38,75,29,58,29,65,43,80,75,53,81,47,81,48,82,49,83,49&
        ,70,26,28,54,24,59,86,53,53,86,24,94,59,24,24,56,56,56,56,86&
        ,86,87,88,24,53,89,53,87,56,93,54,89,58,91,55,56,92,56,93,60&
        ,59,94,21,64,95,30,96,72,98,50,99,87,88,90,55,92,75,75,101,79&
        ,23,58,100,58,91,100,29,65,94,101,81,102,19,19,103,81,103,67&
        ,104,82,105,54,59,94,106,94,107,86,86,108,53,119,94,59,53,165&
        ,166,120,167,86,86,87,88,109,110,93,111,111,115,24,93,115,60&
        ,116,28,59,63,118,94,95,94,119,94,59,26,86,87,88,90,90,53,86&
        ,165,166,120,167,89,87,88,90,55,92,114,75,170,43,58,100,29,29&
        ,58,91,113,65,117,119,102,121,103,122,103,123,104,124,105,125&
        ,106,126,94,107,107,53,86,108,127,89,120,109,110,128,108,86&
        ,53,109,110,111,129,115,130,28,89,131,130,132,93,115,132,94&
        ,118,95,94,94,59,133,120,87,88,90,168,101,172,78,75,23,58,100&
        ,58,113,95,107,119,134,127,135,89,120,136,128,137,111,129,169&
        ,131,142,130,138,132,132,139,139,140,24,132,140,118,141,94&
        ,133,120,107,119,134,135,94,147,111,129,137,86,53,131,142,130&
        ,138,139,139,143,140,144,28,145,144,146,140,146,94,95,133,133&
        ,148,146,152,127,134,149,94,134,131,142,138,153,139,143,145&
        ,155,144,150,146,151,151,152,24,94,133,154,134,156,111,128&
        ,108,86,94,160,139,143,145,155,144,150,151,157,152,158,28,159&
        ,150,162,151,157,159,164,158,161,171,143,94,163,151,157,159&
        ,164,158,161,158,161,10,22,11,12,13,14,15,16,17,18,19,20,62&
        ,94,95,96,10,12,10,11,11,11,12,12,12,13,12,13,14,14,14,15,12&
        ,15,16,16,16,17,12,17,18,18,18,19,19,19,12,20,21,42,61,101,4&
        ,3,6,8,196,208,197,200,202,204,205,10,237,22,10,235,22,10,10&
        ,10,12,22,33,12,15,12,325,15,212,15,17,213,17,326,19,19,19,19&
        ,17,24,254,24,28,24,24,26,214,21,42,331,34,28,12,207,28,39,16&
        ,38,218,39,17,21,219,52,53,220,56,56,24,24,24,24,56,26,59,221&
        ,21,21,207,269,30,38,75,222,59,223,86,277,56,56,87,88,53,93&
        ,56,56,56,64,224,63,26,59,94,53,94,225,86,226,87,88,109,110&
        ,53,111,227,53,87,88,115,93,95,229,94,119,230,109,110,128,231&
        ,137,180,87,88,130,53,87,88,28,63,94,118,232,12,111,89,28,28&
        ,28,28,28,26,26,26,26,26,26,121,122,122,19,19,19,127,233,111&
        ,95,234,196,196,198,198,205,237,235,198,211,235,214,10,12,17&
        ,18,28,42/)
    arr_p2(1:4429) = (/456,9,9,9,9,9,9,9,9,9,9,12&
        ,21,1,1,1,1,1,1,1,1,1,1,1,1,10,22,12,17,15,17,1,23,18,12,12,3&
        ,1,22,12,18,12,15,12,12,17,1,18,17,1,12,12,15,17,18,10,12,15&
        ,17,18,17,12,28,10,10,17,10,23,10,1,17,12,18,1,12,12,1,12,1&
        ,19,12,1,12,12,18,15,42,12,1,17,42,12,17,18,1,12,10,12,28,17&
        ,17,12,1,12,12,28,21,10,30,10,12,1,20,30,42,34,20,12,20,12,1&
        ,12,10,20,12,28,21,1,12,12,12,12,28,10,30,10,42,1,20,20,20,28&
        ,20,12,24,12,20,28,1,20,1,12,12,53,12,1,12,28,10,42,20,12,1&
        ,64,21,1,12,28,12,1,12,12,10,20,1,28,12,12,28,10,89,95,1,12&
        ,12,10,111,119,1,28,119,12,12,28,131,12,139,145,28,198,10,10&
        ,10,10,10,10,10,12,10,10,10,12,12,12,26,26,12,10,15,10,21,17&
        ,12,10,10,24,10,12,15,10,21,18,10,21,18,17,10,12,10,18,10,24&
        ,10,12,10,21,12,12,10,12,12,12,21,10,12,10,12,12,12,10,16,12&
        ,28,21,10,10,20,12,10,21,12,12,12,21,10,17,23,10,18,20,12,10&
        ,21,26,10,30,10,53,26,20,12,10,10,12,10,20,10,12,20,12,10,10&
        ,10,20,10,12,12,20,20,12,12,12,23,10,18,20,12,20,12,26,54,56&
        ,12,53,28,54,53,12,10,63,28,12,68,56,26,12,12,12,20,12,10,20&
        ,12,28,12,20,26,20,20,10,12,20,10,10,12,53,20,10,12,12,64,26&
        ,10,15,28,63,95,42,17,26,10,20,20,10,10,86,53,26,26,20,10,12&
        ,20,10,53,53,20,12,12,26,10,28,10,20,12,12,89,28,10,108,26,10&
        ,20,12,12,26,20,12,10,28,10,20,12,12,28,20,26,20,28,28,12,22&
        ,11,12,12,12,12,12,12,12,12,12,12,12,12,12,20,12,20,20,12,12&
        ,12,12,12,12,12,12,12,12,20,12,12,12,12,12,20,12,12,12,12,12&
        ,12,20,12,17,12,12,12,20,21,12,12,20,20,12,63,20,20,12,12,12&
        ,61,12,21,12,12,20,12,12,20,12,20,20,12,12,12,12,12,12,20,12&
        ,12,12,20,12,12,12,20,12,12,20,12,20,12,12,12,20,12,20,20,12&
        ,12,20,12,12,12,12,20,12,12,20,20,12,53,63,20,26,10,28,20,12&
        ,120,12,38,20,53,68,75,68,20,12,20,12,12,20,12,20,12,20,12,20&
        ,12,20,20,12,12,20,12,20,12,12,20,12,21,101,61,95,20,12,20,12&
        ,20,12,20,20,12,12,20,20,12,20,12,12,20,12,12,20,12,20,12,12&
        ,120,12,20,12,20,12,20,12,12,20,12,20,12,12,12,20,12,20,12&
        ,142,20,12,20,12,155,12,13,13,13,10,13,22,12,13,17,15,10,17&
        ,23,10,18,10,12,13,12,12,12,12,15,13,12,12,17,15,18,15,17,13&
        ,12,12,15,17,18,19,10,12,15,19,17,19,18,18,17,26,12,10,28,30&
        ,24,18,10,24,10,21,29,24,20,12,41,21,17,10,13,42,12,13,20,12&
        ,13,15,26,15,12,17,12,21,43,26,30,12,26,12,15,12,10,39,12,12&
        ,17,12,34,12,39,36,17,15,42,20,12,28,17,30,21,18,17,20,24,20&
        ,12,19,41,41,18,17,13,20,26,12,13,12,12,28,13,21,17,56,23,30&
        ,24,56,24,10,20,12,20,12,59,20,18,34,12,12,29,26,20,12,13,53&
        ,12,10,26,12,20,12,28,59,21,20,12,20,20,12,12,24,12,58,24,56&
        ,30,24,10,12,12,59,43,59,38,20,12,94,20,20,12,13,63,26,12,24&
        ,53,28,12,26,63,53,28,26,38,15,12,68,38,12,56,10,242,28,53,12&
        ,87,88,12,10,59,12,20,12,94,28,12,59,20,12,13,12,20,12,12,53&
        ,20,12,24,12,28,24,10,94,42,75,38,95,21,101,94,64,20,12,20,12&
        ,13,28,20,13,13,13,13,13,13,13,13,26,26,53,20,12,24,12,24,10&
        ,94,75,12,12,242,89,28,53,20,12,24,12,28,24,10,89,94,20,12,20&
        ,42,12,53,20,12,24,12,24,10,20,12,95,94,28,94,53,20,12,24,12&
        ,28,131,53,20,12,20,12,145,28,12,26,14,35,15,15,15,15,12,15&
        ,15,10,12,12,15,17,15,39,17,15,12,15,15,15,39,15,15,38,15,15&
        ,21,15,15,21,39,15,59,38,15,20,38,15,20,15,38,12,20,15,94,39&
        ,38,38,15,17,17,17,10,17,12,10,12,15,17,12,17,17,12,17,26,17&
        ,17,21,17,204,42,17,38,26,15,21,17,39,17,17,60,17,52,42,17,17&
        ,42,17,61,42,17,205,17,12,20,12,12,456,23,12,20,20,18,18,18&
        ,18,10,12,12,18,17,12,18,18,12,18,12,12,20,12,18,21,18,21,12&
        ,12,12,12,21,34,18,20,12,12,12,12,30,30,34,18,12,19,19,19,12&
        ,12,12,12,12,12,12,12,21,12,12,12,20,12,12,12,12,12,12,12,12&
        ,48,20,24,28,10,24,10,10,24,12,12,15,12,24,21,24,12,42,12,15&
        ,12,21,24,24,12,12,94,59,20,20,20,12,12,12,26,20,26,12,26,12&
        ,26,12,10,26,12,20,12,12,12,20,26,203,42,17,20,20,20,21,20,12&
        ,10,20,10,20,12,10,21,26,10,20,21,10,12,12,59,21,10,20,26,10&
        ,20,20,12,95,59,10,28,28,28,28,28,28,28,12,28,28,15,21,28,17&
        ,28,28,28,39,28,21,42,38,17,12,28,12,21,28,28,63,28,21,21,10&
        ,21,21,21,21,10,12,21,15,21,21,21,17,21,24,21,26,21,21,42,21&
        ,34,21,21,38,21,60,64,21,75,21,94,21,12,21,12,30,30,30,30,18&
        ,30,12,17,94,12,20,12,12,20,12,20,12,20,12,20,12,12,12,20,12&
        ,20,12,20,12,20,12,20,12,20,12,61,20,12,20,12,20,12,20,20,21&
        ,20,20,20,12,12,20,20,12,20,12,20,20,20,12,12,13,13,12,34,20&
        ,34,12,34,42,12,34,34,18,34,18,20,18,18,18,34,18,20,36,36,36&
        ,36,36,36,36,15,36,36,36,36,36,12,36,36,36,36,36,36,36,36,42&
        ,36,36,36,36,36,21,36,36,36,36,36,36,20,36,15,12,15,38,15,12&
        ,15,12,10,15,15,15,12,15,12,15,15,38,17,42,38,15,15,15,15,64&
        ,21,15,38,20,42,15,17,15,15,15,15,75,38,15,38,15,39,39,39,39&
        ,18,41,17,41,41,17,41,41,17,41,21,41,17,17,12,41,41,17,41,41&
        ,21,41,41,41,41,41,12,41,41,17,12,12,42,17,12,17,42,17,42,17&
        ,17,17,12,17,17,42,17,42,17,17,17,17,42,17,42,17,17,42,17,42&
        ,17,17,21,42,17,17,42,17,42,17,42,17,59,17,12,42,20,12,23,23&
        ,12,20,23,12,20,12,94,20,46,72,134,72,28,10,12,12,20,12,12,19&
        ,15,21,50,50,39,19,41,52,21,19,60,12,50,95,50,34,12,52,52,17&
        ,52,61,52,12,28,12,10,53,24,12,12,12,53,24,12,12,21,12,28,24&
        ,12,21,24,24,12,12,24,20,24,94,20,20,12,10,63,20,86,63,63,21&
        ,63,56,63,12,12,12,12,12,12,12,12,12,12,59,42,12,12,12,12,12&
        ,21,12,20,12,12,21,12,20,64,21,94,20,12,26,12,20,12,12,63,63&
        ,63,56,60,17,60,21,12,60,60,60,42,60,60,94,60,31,31,42,61,61&
        ,12,61,20,61,42,12,61,61,42,61,42,42,12,15,61,61,17,61,42,61&
        ,42,42,61,34,42,42,61,42,21,42,61,42,61,42,61,42,94,12,62,20&
        ,62,20,62,42,20,62,62,62,34,34,62,62,34,20,20,12,12,12,12,12&
        ,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20&
        ,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20&
        ,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20&
        ,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20&
        ,20,20,20,20,20,20,20,20,20,20,61,21,20,20,20,20,20,20,20,20&
        ,20,20,20,20,20,20,20,20,20,20,20,20,20,61,20,20,20,20,20,20&
        ,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,127,61,20,20,20&
        ,20,20,20,20,20,20,20,20,20,20,20,20,20,20,28,63,63,63,28,28&
        ,28,28,12,28,63,63,28,28,28,28,63,28,28,21,28,28,28,28,75,63&
        ,94,75,21,64,64,64,21,21,21,21,21,21,21,21,21,21,21,21,21,12&
        ,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21&
        ,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21&
        ,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21&
        ,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21&
        ,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,127,21,21&
        ,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,12,21,12,18,12&
        ,30,28,68,28,28,28,12,28,68,64,28,28,28,28,28,21,28,28,28,68&
        ,39,12,39,39,39,39,39,69,39,39,39,39,39,39,39,39,39,39,39,39&
        ,49,12,49,21,20,21,45,36,36,36,36,36,36,36,36,36,36,36,36,36&
        ,36,36,36,36,36,36,36,36,36,36,36,36,20,12,12,75,38,12,38,75&
        ,38,15,15,12,15,75,42,17,38,75,38,38,42,17,101,75,38,34,18,38&
        ,75,38,38,64,38,75,38,42,61,41,12,41,41,41,41,41,41,41,41,41&
        ,41,41,41,41,41,41,41,41,41,41,41,41,79,20,119,20,456,46,12&
        ,12,12,12,12,42,21,60,12,85,196,20,12,86,86,63,20,12,86,26,26&
        ,12,12,86,20,12,12,12,12,12,86,12,64,12,12,12,86,34,12,86,21&
        ,53,12,53,12,20,12,20,20,12,12,86,86,53,86,59,59,20,20,20,12&
        ,12,20,12,20,12,86,94,94,12,86,86,20,12,86,20,12,20,12,86,20&
        ,12,86,20,12,20,12,86,20,12,20,12,86,20,12,12,12,87,88,21,57&
        ,21,17,21,86,21,20,86,30,20,90,30,21,12,86,87,88,56,86,20,86&
        ,86,20,86,53,12,12,86,20,12,63,95,48,96,20,12,94,94,20,12,94&
        ,20,20,12,12,20,94,20,12,20,20,12,20,20,20,94,17,20,20,20,20&
        ,20,12,12,20,20,94,21,12,21,20,94,94,20,20,119,59,20,94,12,12&
        ,20,20,20,20,20,63,63,63,63,63,63,68,68,119,20,20,20,12,86,86&
        ,20,20,119,64,20,20,20,20,20,20,20,63,68,20,63,63,68,63,68,63&
        ,63,68,95,95,95,95,64,95,64,95,64,15,95,77,64,95,64,64,64,95&
        ,21,64,64,64,95,64,94,12,20,20,61,20,61,61,61,61,61,61,61,61&
        ,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61&
        ,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61&
        ,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,20,62,62,62&
        ,62,60,41,60,60,60,60,60,60,85,85,101,101,101,20,12,101,38,10&
        ,12,15,101,17,75,42,34,101,21,38,64,75,94,12,20,12,20,12,20&
        ,12,20,12,17,49,20,12,20,12,12,20,20,12,21,20,20,12,86,20,12&
        ,86,86,86,86,20,86,86,20,20,12,12,86,94,94,12,86,86,20,20,12&
        ,12,86,20,12,20,86,86,86,20,12,86,20,12,86,20,12,86,20,86,20&
        ,12,86,20,12,86,20,12,86,20,12,86,20,12,86,12,12,20,20,12,12&
        ,53,53,12,12,12,12,20,20,12,12,12,12,12,12,12,12,20,20,12,12&
        ,20,20,12,12,20,20,12,12,12,12,94,94,12,12,12,12,20,20,12,12&
        ,20,20,12,12,127,127,108,108,86,86,94,94,12,12,20,20,12,12,20&
        ,20,12,12,20,20,12,12,63,12,12,111,111,111,56,12,20,12,12,20&
        ,20,12,12,12,12,12,93,12,20,86,12,12,12,12,12,12,63,120,21,63&
        ,20,12,20,42,94,12,119,94,94,119,94,119,94,119,94,20,20,119&
        ,94,119,94,75,94,119,94,119,94,95,95,95,95,95,20,20,12,12,12&
        ,104,20,105,12,105,106,20,20,12,12,20,20,12,94,64,20,20,12,59&
        ,59,20,94,94,12,94,94,12,12,127,108,127,86,20,94,94,12,12,94&
        ,12,108,94,12,127,127,119,20,94,20,94,12,94,94,12,94,12,94,20&
        ,94,12,94,20,20,20,12,12,21,21,20,20,20,20,12,12,20,20,12,12&
        ,20,20,20,20,12,12,20,20,20,20,12,12,20,20,12,12,20,20,20,20&
        ,20,20,12,12,20,20,20,20,12,12,20,20,20,20,12,12,20,20,12,12&
        ,20,20,20,12,12,12,21,21,12,12,20,12,12,12,12,12,20,12,12,12&
        ,12,20,12,20,12,20,12,86,20,12,12,12,12,12,93,12,12,12,119,20&
        ,12,20,119,59,20,119,20,12,119,119,119,119,119,119,119,119&
        ,119,119,119,119,119,119,119,119,119,12,12,12,12,12,20,125,20&
        ,20,12,20,119,12,127,127,127,127,119,119,20,127,127,119,20,12&
        ,20,20,20,12,108,12,12,20,12,12,109,110,20,12,12,12,20,12,12&
        ,12,12,20,20,12,86,12,12,86,20,12,20,12,12,111,12,20,12,12,12&
        ,20,12,20,20,12,12,12,20,12,20,12,20,12,53,12,20,12,12,115,12&
        ,12,20,61,12,20,20,63,20,127,137,20,12,86,20,12,12,129,20,12&
        ,130,12,12,12,20,12,20,20,12,12,20,12,20,20,12,20,12,12,132&
        ,12,12,12,12,12,12,12,20,12,138,20,12,12,139,12,20,12,20,12&
        ,20,20,12,12,12,20,20,12,12,143,20,12,144,20,12,12,146,12,12&
        ,12,12,86,21,21,12,20,12,150,20,12,151,12,20,12,157,12,12,12&
        ,42,12,28,36,17,21,21,20,20,17,12,42,94,42,61,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1&
        ,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,12,12,12,17,15,18&
        ,17,12,12,30,12,18,17,12,21,12,28,12,21,12,12,28,12,52,12,12&
        ,12,20,20,12,12,63,68,12,12,12,12,12,12,12,28,21,12,12,12,12&
        ,12,12,12,28,12,12,12,12,28,12,12,12,12,28,20,20,56,56,115,93&
        ,115,115,132,140,26,38,15,15,17,20,21,59,20,63,12,12,20,20,20&
        ,20,20,20,20,20,38,42,20,17,38,17,20,42,17,42,20,20,42,36,42&
        ,34,12,12,12,12,12,12,12,12,12,12,10,12,36,12,12,17,18,12,17&
        ,12,17,19,10,12,18,12,12,12,18,41,39,17,41,12,12,28,21,24,12&
        ,12,54,12,12,63,20,12,38,12,12,20,28,93,12,89,12,112,94,38,12&
        ,115,130,132,12,12,131,140,144,146,12,145,10,10,21,12,41,15&
        ,21,18,12,12,15,18,15,12,12,18,19,10,12,19,15,26,28,21,21,12&
        ,20,60,21,12,43,12,30,26,42,39,12,42,42,12,20,41,41,21,41,12&
        ,42,24,21,12,20,21,12,12,94,21,21,54,21,21,56,12,20,21,21,12&
        ,21,93,21,21,21,21,21,21,111,21,115,130,132,139,132,140,144&
        ,146,151,146,152,173,10,12,12,12,17,12,12,20,12,17,15,12,12&
        ,12,12,12,12,12,12,12,12,12,10,17,42,17,42,59,12,12,12,12,12&
        ,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,21&
        ,78,21,12,17,63,12,63,12,12,12,12,12,12,12,12,12,12,12,60,18&
        ,12,12,61,12,12,17,12,34,21,39,61,17,41,61,12,77,61,61,12,12&
        ,21,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12&
        ,12,12,12,94,21,39,21,39,12,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,10,22,33,12,17,15,10,10,18&
        ,12,22,33,13,12,15,12,17,18,17,12,12,15,17,18,10,12,15,17,18&
        ,33,18,12,10,10,28,15,10,18,10,10,24,10,20,12,12,26,12,10,21&
        ,12,12,12,12,20,12,12,12,12,12,12,12,12,10,17,26,12,12,18,12&
        ,12,12,19,12,12,15,12,17,12,42,12,34,12,12,12,15,20,12,15,12&
        ,12,39,12,18,17,52,20,12,18,12,24,10,12,20,12,28,17,12,12,26&
        ,10,20,10,26,17,12,28,15,28,12,10,12,28,21,30,10,18,24,10,59&
        ,20,12,10,12,20,12,12,12,12,12,12,12,12,12,20,12,20,12,42,12&
        ,34,12,42,20,12,12,20,12,12,12,26,12,12,21,12,38,30,12,42,12&
        ,12,42,12,61,12,12,12,26,12,20,12,20,12,23,19,12,24,10,20,12&
        ,26,12,20,12,63,59,20,61,21,17,12,20,12,12,10,26,59,59,12,12&
        ,20,20,10,10,12,12,63,28,12,24,10,26,12,24,10,24,10,24,30,10&
        ,24,10,12,12,12,12,12,12,12,12,20,12,20,12,17,17,12,26,12,12&
        ,20,12,20,86,20,12,26,12,10,20,20,23,23,20,12,87,88,12,24,10&
        ,20,12,20,12,20,63,28,12,21,12,12,20,12,20,10,26,59,68,12,12&
        ,12,12,26,26,20,20,12,12,20,12,10,12,89,24,10,20,12,20,75,12&
        ,12,42,20,20,12,12,20,20,21,42,42,12,20,63,28,12,12,12,12,26&
        ,21,21,26,53,26,12,68,12,86,20,20,87,88,53,26,12,20,12,23,20&
        ,12,20,12,26,12,20,12,20,12,12,12,64,12,20,20,20,20,12,20,20&
        ,20,20,12,26,59,94,12,12,20,12,20,12,111,53,12,10,12,56,24,10&
        ,75,20,20,61,42,61,12,26,61,61,20,12,21,61,20,95,127,20,20,86&
        ,20,94,20,21,12,20,12,20,20,12,20,12,20,20,12,20,12,20,12,12&
        ,20,12,10,12,131,24,10,20,12,60,21,59,20,95,20,42,120,12,20&
        ,12,26,108,127,20,20,12,20,12,20,12,20,12,139,12,10,12,24,10&
        ,94,119,59,64,12,24,10,61,20,12,94,59,20,20,20,12,20,20,20,12&
        ,20,12,20,12,10,12,145,119,94,12,94,12,20,119,127,135,142,12&
        ,20,20,20,20,20,20,20,12,20,12,151,12,20,12,20,20,20,12,20,12&
        ,12,20,155,12,20,12,20,20,20,20,20,20,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,10,10,18,10,12,18,10&
        ,12,18,10,13,18,10,12,18,10,15,18,10,12,18,10,17,18,10,12,18&
        ,10,12,18,20,20,20,20,20,20,456,456,456,456,1,1,1,1,1,1,1,10&
        ,1,10,12,1,17,15,17,18,12,12,12,18,15,15,1,17,1,18,17,1,12,1&
        ,10,12,17,18,18,12,1,15,10,18,10,12,1,17,12,1,12,12,21,1,12&
        ,12,42,12,1,17,28,18,1,17,12,1,12,12,28,21,30,24,10,20,12,1&
        ,12,20,12,1,20,20,12,1,21,1,12,1,20,20,12,12,24,12,28,30,24&
        ,42,1,20,12,20,12,28,28,1,20,1,20,20,12,12,53,12,1,56,24,24&
        ,12,28,20,1,64,21,1,20,20,12,1,10,10,53,53,12,93,56,56,20,20&
        ,75,12,1,131,28,94,28,28,28,28,28,24,93,132,146,173,174,12,20&
        ,20,111,139,151,61,1,94,119,1,10,12,12,17,12,12,12,20,12,20&
        ,12,1,1,1,1,1,1/)
    arr_p3(1:4429) = (/456,456,456,456,456&
        ,456,456,456,456,456,456,9,9,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,1&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,1,456,456,456,456,456,456,456,456,456&
        ,456,456,12,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,12,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,13,456,13,13,456,13&
        ,13,13,13,13,13,13,13,13,456,13,13,13,13,13,456,13,13,13,13&
        ,13,13,13,456,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13&
        ,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,456,13&
        ,13,456,13,13,456,12,13,13,13,13,13,456,13,13,13,13,13,13,12&
        ,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13&
        ,13,13,13,13,13,13,13,13,13,13,13,456,13,13,13,456,13,13,13&
        ,456,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13&
        ,13,13,13,13,456,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13&
        ,13,13,13,13,13,13,13,13,13,12,13,13,13,13,13,13,13,13,12,13&
        ,13,456,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13&
        ,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,20,13,13,13&
        ,456,20,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13&
        ,13,13,13,13,13,13,456,13,20,12,20,20,12,12,12,10,10,13,13,13&
        ,13,13,13,13,13,13,13,13,20,13,13,13,13,13,13,13,13,13,13,13&
        ,13,13,13,20,20,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13&
        ,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,15&
        ,456,456,456,456,456,456,456,456,12,12,456,12,456,456,12,12&
        ,12,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,12,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,12,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,20&
        ,20,456,456,456,456,456,456,456,20,456,456,20,456,456,20,12&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,20,12,456,456,456,456,456,21,456,12,456,456,36&
        ,12,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,12,456,456,456,12&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,12,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,20,20,456,456,20,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,20,456,20,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,42,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,20,20,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,20,456,456&
        ,456,456,456,456,20,20,456,456,456,456,456,20,20,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,20,20,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,20,20,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,21,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,12,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,12,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,20,20,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,20,20,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,12,12,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,12&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,12,12,456,456,456,456,456,456,456,456,456,456,12,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,12,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,12,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,21,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,1,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,12,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,12,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,12,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,12,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,12,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,12,456,456,456,456,456,456,456,456,456,456,12,456,456,456&
        ,456,12,456,12,456,456,456,12,12,456,12,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,12,456,456,456,456,456&
        ,456,456,456,456,456,456,456,12,456,456,456,456,456,12,456&
        ,456,456,12,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,12,12,456,456,12,12,456,456,12&
        ,456,12,456,456,456,456,456,456,456,456,456,456,456,12,456&
        ,456,17,12,456,456,456,17,456,456,456,456,456,456,456,17,456&
        ,456,456,456,12,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,12,456&
        ,456,20,456,456,456,456,12,12,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,12&
        ,12,456,20,12,456,20,456,456,456,12,456,456,456,456,456,456&
        ,12,456,456,456,456,456,456,456,456,456,12,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,12,456,456,456,456&
        ,456,12,456,456,12,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,12,456,20,456,20&
        ,456,456,456,456,456,12,12,20,456,456,456,12,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,12,456&
        ,456,456,456,456,456,12,456,456,456,456,456,456,456,456,456&
        ,456,456,456,12,456,456,12,456,20,12,456,456,12,456,456,456&
        ,456,456,456,456,12,12,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,12,456,12,12,456,456,456,456,12,456,12&
        ,456,20,456,456,20,12,456,456,456,12,12,456,456,456,20,12,456&
        ,456,456,12,456,456,456,456,456,456,12,456,456,456,456,456&
        ,456,456,12,456,12,456,456,20,456,456,456,456,456,20,20,456&
        ,456,456,12,456,20,456,12,456,456,456,456,456,456,456,456,456&
        ,456,17,456,456,456,456,456,456,12,12,456,21,456,20,12,12,456&
        ,12,456,456,456,456,456,456,456,456,456,456,17,456,456,456&
        ,456,20,456,456,456,456,456,20,12,12,456,12,456,456,456,456&
        ,456,456,456,12,456,12,456,456,456,456,456,456,20,456,456,20&
        ,20,12,456,12,456,20,12,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,12,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,12&
        ,456,1,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,20,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,20,12,456,12,456,456,456,456,24,93,132,146,173,28,28,28,28&
        ,28,28,456,456,20,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456/)
    arr_p4(1:4429) = (/456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,12,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,13,456,456,456,456,456,456,456,456,456,456,456&
        ,456,13,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,13,456,456,456,456,456,456,456,456,13,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,13,456,456,456,456,13,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,13,20,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,13,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,13,13,456,456,456,456&
        ,456,456,456,456,456,456,456,456,12,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,20,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,12,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,12,12,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456&
        ,456,456,456,456,456,456,456,456,456,456,456/)

  end subroutine load_arrays

  ! ************************************
  ! solves linear least squares
  subroutine llsq(n, x, y, a, b)

    !****************************************************
    !
    !! LLSQ solves a linear least squares problem matching a line to data.
    !
    !  Discussion:
    !
    !    A formula for a line of the form Y = A * X + B is sought, which
    !    will minimize the root-mean-square error to N data points
    !    ( X(I), Y(I) );
    !
    !  Licensing:
    !
    !    This code is distributed under the GNU LGPL license.
    !
    !  Modified:
    !
    !    07 March 2012
    !
    !  Author:
    !
    !    John Burkardt
    !
    !  Parameters:
    !
    !    In: N, the number of data values.
    !
    !    In: X(N), Y(N), the coordinates of the data points.
    !
    !    Out: A, B, the slope and Y-intercept of the
    !    least-squares approximant to the data.
    !
    implicit none
    integer,intent(in)::n
    real*8,intent(out)::a, b
    real*8,intent(in)::x(n), y(n)
    real*8::bot, top, xbar, ybar

    ! special case
    if(n == 1) then
      a = 0d0
      b = y(1)
      return
    end if

    ! average X and Y
    xbar = sum(x) / n
    ybar = sum(y) / n

    ! compute beta
    top = dot_product(x(:) - xbar, y(:) - ybar)
    bot = dot_product(x(:) - xbar, x(:) - xbar)

    ! if top is zero a is zero
    if(top==0d0) then
      a = 0d0
    else
      a = top / bot
    end if

    b = ybar - a * xbar

  end subroutine llsq

end module krome_subs
