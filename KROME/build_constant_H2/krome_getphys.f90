!This module contains useful routines to get physical
! quantities, like mean molecular weight, mass density,
! mass, jeans length, etc. etc.

!############### MODULE ##############
module krome_getphys
contains

  !*****************************
  !get the mean molecular weight
  function get_mu(n)
    use krome_commons
    use krome_constants
    implicit none
    real*8::n(:),get_mu,m(nspec)
    m(:) = get_mass()

    !ip_mass is 1/proton_mass_in_g
    get_mu = max(sum(n(1:nmols)*m(1:nmols)),1d-40) &
        / max(sum(n(1:nmols)),1d-40) * ip_mass

  end function get_mu

  !***************************
  !get mean molecular weight
  function get_mu_rho(n,rhogas)
    use krome_commons
    use krome_constants
    implicit none
    real*8::get_mu_rho,rhogas,n(:)

    !ip_mass is 1/proton_mass_in_g
    get_mu_rho = rhogas / max(sum(n(1:nmols)),1d-40) * ip_mass

  end function get_mu_rho

  !************************
  !get species masses (g)
  function get_mass()
    use krome_commons
    implicit none
    real*8::get_mass(nspec)

    get_mass(1) = 9.10938188d-28	!E
    get_mass(2) = 2.00762042185d-21	!GRAIN-
    get_mass(3) = 1.67444345638d-24	!H-
    get_mass(4) = 2.00771060473d-23	!C-
    get_mass(5) = 4.34993336746d-23	!CN-
    get_mass(6) = 2.67691710837d-23	!O-
    get_mass(7) = 2.84427036019d-23	!OH-
    get_mass(8) = 5.35374312292d-23	!S-
    get_mass(9) = 2.00761951091d-21	!GRAIN0
    get_mass(10) = 2.00761951091d-23	!C
    get_mass(11) = 9.20143454729d-23	!FE
    get_mass(12) = 1.67353251819d-24	!H
    get_mass(13) = 6.69206503638d-24	!HE
    get_mass(14) = 4.01523902183d-23	!MG
    get_mass(15) = 2.34222276273d-23	!N
    get_mass(16) = 3.84788577001d-23	!NA
    get_mass(17) = 2.67682601455d-23	!O
    get_mass(18) = 5.3536520291d-23	!S
    get_mass(19) = 4.68444552546d-23	!SI
    get_mass(20) = 3.34706503638d-24	!H2
    get_mass(21) = 4.68444552546d-23	!CO
    get_mass(22) = 5.85550528092d-23	!CL
    get_mass(23) = 5.18629877728d-23	!P
    get_mass(24) = 4.01523902183d-23	!C2
    get_mass(25) = 7.86312479183d-23	!CCL
    get_mass(26) = 2.17497276273d-23	!CH
    get_mass(27) = 8.53233129547d-23	!CLO
    get_mass(28) = 4.34984227364d-23	!CN
    get_mass(29) = 7.19391828819d-23	!CP
    get_mass(30) = 7.36127154001d-23	!CS
    get_mass(31) = 6.02285853274d-23	!HCL
    get_mass(32) = 3.34603251819d-23	!HF
    get_mass(33) = 3.17867926637d-23	!F
    get_mass(34) = 5.52100528092d-23	!HS
    get_mass(35) = 4.18259227364d-23	!MGH
    get_mass(36) = 4.68444552546d-23	!N2
    get_mass(37) = 4.01523902183d-23	!NAH
    get_mass(38) = 2.50957601455d-23	!NH
    get_mass(39) = 5.01904877728d-23	!NO
    get_mass(40) = 7.69587479183d-23	!NS
    get_mass(41) = 5.3536520291d-23	!O2
    get_mass(42) = 2.84417926637d-23	!OH
    get_mass(43) = 5.3536520291d-23	!PH
    get_mass(44) = 7.52852154001d-23	!PN
    get_mass(45) = 7.86312479183d-23	!PO
    get_mass(46) = 1.07073040582d-22	!S2
    get_mass(47) = 6.69206503638d-23	!SIC
    get_mass(48) = 4.85179877728d-23	!SIH
    get_mass(49) = 7.02666828819d-23	!SIN
    get_mass(50) = 7.36127154001d-23	!SIO
    get_mass(51) = 1.00380975546d-22	!SIS
    get_mass(52) = 8.03047804365d-23	!SO
    get_mass(53) = 4.18259227364d-23	!C2H
    get_mass(54) = 6.35746178456d-23	!C2N
    get_mass(55) = 9.36889105093d-23	!C2S
    get_mass(56) = 6.02285853274d-23	!C3
    get_mass(57) = 6.69206503638d-23	!CCO
    get_mass(58) = 9.20153779911d-23	!CCP
    get_mass(59) = 2.34232601455d-23	!CH2
    get_mass(60) = 7.36127154001d-23	!CO2
    get_mass(61) = 3.01153251819d-23	!H2O
    get_mass(62) = 5.68835853274d-23	!H2S
    get_mass(63) = 4.51719552546d-23	!HCN
    get_mass(64) = 4.85179877728d-23	!HCO
    get_mass(65) = 7.36127154001d-23	!HCP
    get_mass(66) = 7.52862479183d-23	!HCS
    get_mass(67) = 6.85941828819d-23	!HCSI
    get_mass(68) = 4.51719552546d-23	!HNC
    get_mass(69) = 5.1864020291d-23	!HNO
    get_mass(70) = 7.19402154001d-23	!HNSI
    get_mass(71) = 8.03047804365d-23	!HPO
    get_mass(72) = 1.087465731d-22	!HS2
    get_mass(73) = 7.36127154001d-23	!N2O
    get_mass(74) = 6.69206503638d-23	!NAOH
    get_mass(75) = 2.67692926637d-23	!NH2
    get_mass(76) = 7.69587479183d-23	!NO2
    get_mass(77) = 5.52100528092d-23	!O2H
    get_mass(78) = 7.02666828819d-23	!OCN
    get_mass(79) = 1.00380975546d-22	!OCS
    get_mass(80) = 5.52100528092d-23	!PH2
    get_mass(81) = 8.69968454729d-23	!SIC2
    get_mass(82) = 5.0191520291d-23	!SIH2
    get_mass(83) = 9.03428779911d-23	!SINC
    get_mass(84) = 1.00380975546d-22	!SIO2
    get_mass(85) = 1.07073040582d-22	!SO2
    get_mass(86) = 4.34994552546d-23	!C2H2
    get_mass(87) = 6.19021178456d-23	!C3H
    get_mass(88) = 6.19021178456d-23	!HC3
    get_mass(89) = 8.36508129547d-23	!C3N
    get_mass(90) = 8.69968454729d-23	!C3O
    get_mass(91) = 1.120915731d-22	!C3P
    get_mass(92) = 1.13765105618d-22	!C3S
    get_mass(93) = 8.03047804365d-23	!C4
    get_mass(94) = 2.50967926637d-23	!CH3
    get_mass(95) = 5.0191520291d-23	!H2CO
    get_mass(96) = 7.69597804365d-23	!H2CS
    get_mass(97) = 5.68835853274d-23	!H2O2
    get_mass(98) = 1.10420105618d-22	!H2S2
    get_mass(99) = 7.69597804365d-23	!H2SIO
    get_mass(100) = 9.36889105093d-23	!HCCP
    get_mass(101) = 2.84428251819d-23	!NH3
    get_mass(102) = 8.86703779911d-23	!SIC2H
    get_mass(103) = 1.07073040582d-22	!SIC3
    get_mass(104) = 7.02677154001d-23	!SICH2
    get_mass(105) = 5.18650528092d-23	!SIH3
    get_mass(106) = 6.69216828819d-23	!C2H2N
    get_mass(107) = 7.02677154001d-23	!C2H2O
    get_mass(108) = 4.51729877728d-23	!C2H3
    get_mass(109) = 6.35756503638d-23	!C3H2
    get_mass(110) = 6.35756503638d-23	!H2C3
    get_mass(111) = 8.19783129547d-23	!C4H
    get_mass(112) = 1.03727008064d-22	!C4N
    get_mass(113) = 1.32167768209d-22	!C4P
    get_mass(114) = 1.33841300728d-22	!C4S
    get_mass(115) = 1.00380975546d-22	!C5
    get_mass(116) = 7.69597804365d-23	!CH2O2
    get_mass(117) = 7.69597804365d-23	!CH2PH
    get_mass(118) = 4.8519020291d-23	!CH3N
    get_mass(119) = 2.67703251819d-23	!CH4
    get_mass(120) = 8.53243454729d-23	!HC3N
    get_mass(121) = 9.03439105093d-23	!SIC2H2
    get_mass(122) = 1.087465731d-22	!SIC3H
    get_mass(123) = 1.27149235691d-22	!SIC4
    get_mass(124) = 7.19412479183d-23	!SICH3
    get_mass(125) = 5.35385853274d-23	!SIH4
    get_mass(126) = 6.85952154001d-23	!C2H3N
    get_mass(127) = 4.6846520291d-23	!C2H4
    get_mass(128) = 6.52491828819d-23	!C3H3
    get_mass(129) = 8.36518454729d-23	!C4H2
    get_mass(130) = 1.02054508064d-22	!C5H
    get_mass(131) = 1.23803203173d-22	!C5N
    get_mass(132) = 1.20457170655d-22	!C6
    get_mass(133) = 5.35385853274d-23	!CH4O
    get_mass(134) = 7.36147804365d-23	!C2H4O
    get_mass(135) = 4.85200528092d-23	!C2H5
    get_mass(136) = 8.86714105093d-23	!C3H3N
    get_mass(137) = 6.69227154001d-23	!C3H4
    get_mass(138) = 1.03728040582d-22	!C5H2
    get_mass(139) = 1.22130703173d-22	!C6H
    get_mass(140) = 1.40533365764d-22	!C7
    get_mass(141) = 5.18660853274d-23	!CH5N
    get_mass(142) = 1.25476735691d-22	!HC5N
    get_mass(143) = 1.23804235691d-22	!C6H2
    get_mass(144) = 1.42206898282d-22	!C7H
    get_mass(145) = 1.63955593391d-22	!C7N
    get_mass(146) = 1.60609560873d-22	!C8
    get_mass(147) = 1.08747605618d-22	!CH3C3N
    get_mass(148) = 1.00383040582d-22	!HCOOCH3
    get_mass(149) = 7.69618454729d-23	!C2H5OH
    get_mass(150) = 1.438804308d-22	!C7H2
    get_mass(151) = 1.62283093391d-22	!C8H
    get_mass(152) = 1.80685755982d-22	!C9
    get_mass(153) = 1.07075105618d-22	!CH3C4H
    get_mass(154) = 7.69618454729d-23	!CH3OCH3
    get_mass(155) = 1.65629125909d-22	!HC7N
    get_mass(156) = 9.7038040582d-23	!C2H6CO
    get_mass(157) = 1.63956625909d-22	!C8H2
    get_mass(158) = 1.823592885d-22	!C9H
    get_mass(159) = 2.04107983609d-22	!C9N
    get_mass(160) = 1.48899995837d-22	!CH3C5N
    get_mass(161) = 1.84032821019d-22	!C9H2
    get_mass(162) = 1.47227495837d-22	!CH3C6H
    get_mass(163) = 1.89052386055d-22	!CH3C7N
    get_mass(164) = 2.05781516128d-22	!HC9N
    get_mass(165) = 8.53243454729d-23	!HCNC2
    get_mass(166) = 8.53243454729d-23	!HC2NC
    get_mass(167) = 8.53243454729d-23	!HNC3
    get_mass(168) = 7.52872804365d-23	!NH2CHO
    get_mass(169) = 8.53253779911d-23	!C4H3
    get_mass(170) = 7.02677154001d-23	!NH2CN
    get_mass(171) = 1.30498365764d-22	!C6H6
    get_mass(172) = 4.68454877728d-23	!H2CN
    get_mass(173) = 2.00761951091d-22	!C10
    get_mass(174) = 2.208381462d-22	!C11
    get_mass(175) = 1.12093638137d-22	!SIC3H3
    get_mass(176) = 1.28822768209d-22	!SIC4H
    get_mass(177) = 1.68975158428d-22	!SIC6H
    get_mass(178) = 2.09127548646d-22	!SIC8H
    get_mass(179) = 9.20174430275d-23	!SIC2H3
    get_mass(180) = 7.02697804365d-23	!C3H6
    get_mass(181) = 1.15440703173d-22	!SIC3H5
    get_mass(182) = 8.69989105093d-23	!C4H4
    get_mass(183) = 9.03459755456d-23	!C4H6
    get_mass(184) = 1.05400540582d-22	!HC4N
    get_mass(185) = 1.455529308d-22	!HC6N
    get_mass(186) = 1.85705321019d-22	!HC8N
    get_mass(187) = 2.25857711237d-22	!HC10N
    get_mass(188) = 2.45933906346d-22	!HC11N
    get_mass(189) = 2.66010101455d-22	!HC12N
    get_mass(190) = 1.27149235691d-22	!NC4N
    get_mass(191) = 1.67301625909d-22	!NC6N
    get_mass(192) = 2.07454016128d-22	!NC8N
    get_mass(193) = 2.47606406346d-22	!NC10N
    get_mass(194) = 2.87758796564d-22	!NC12N
    get_mass(195) = 2.86086296564d-22	!HC13N
    get_mass(196) = 2.00752841709d-23	!C+
    get_mass(197) = 9.20134345347d-23	!FE+
    get_mass(198) = 1.67262158d-24	!H+
    get_mass(199) = 6.69115409819d-24	!HE+
    get_mass(200) = 4.01514792801d-23	!MG+
    get_mass(201) = 2.34213166891d-23	!N+
    get_mass(202) = 3.84779467619d-23	!NA+
    get_mass(203) = 2.67673492073d-23	!O+
    get_mass(204) = 5.35356093528d-23	!S+
    get_mass(205) = 4.68435443164d-23	!SI+
    get_mass(206) = 5.01968661638d-24	!H3+
    get_mass(207) = 4.85170768346d-23	!HCO+
    get_mass(208) = 5.8554141871d-23	!CL+
    get_mass(209) = 5.18620768346d-23	!P+
    get_mass(210) = 4.68435443164d-23	!CO+
    get_mass(211) = 3.34615409819d-24	!H2+
    get_mass(212) = 5.01895768346d-23	!NO+
    get_mass(213) = 5.35356093528d-23	!O2+
    get_mass(214) = 2.34223492073d-23	!CH2+
    get_mass(215) = 5.68826743892d-23	!H2S+
    get_mass(216) = 7.52853369801d-23	!HCS+
    get_mass(217) = 5.18631093528d-23	!HNO+
    get_mass(218) = 2.67683817255d-23	!NH2+
    get_mass(219) = 1.00380064607d-22	!OCS+
    get_mass(220) = 4.34985443164d-23	!C2H2+
    get_mass(221) = 2.50958817255d-23	!CH3+
    get_mass(222) = 2.84419142437d-23	!NH3+
    get_mass(223) = 7.02668044619d-23	!C2H2O+
    get_mass(224) = 7.69588694983d-23	!CH2O2+
    get_mass(225) = 6.85943044619d-23	!C2H3N+
    get_mass(226) = 4.68456093528d-23	!C2H4+
    get_mass(227) = 8.36509345347d-23	!C4H2+
    get_mass(228) = 5.1864141871d-23	!H3CO+
    get_mass(229) = 5.35376743892d-23	!CH4O+
    get_mass(230) = 7.36138694983d-23	!C2H4O+
    get_mass(231) = 6.69218044619d-23	!C3H4+
    get_mass(232) = 5.18651743892d-23	!CH5N+
    get_mass(233) = 7.69609345347d-23	!C2H5OH+
    get_mass(234) = 7.69609345347d-23	!CH3OCH3+
    get_mass(235) = 2.17488166891d-23	!CH+
    get_mass(236) = 7.86303369801d-23	!CCL+
    get_mass(237) = 4.01514792801d-23	!C2+
    get_mass(238) = 8.53224020165d-23	!CLO+
    get_mass(239) = 7.19382719438d-23	!CP+
    get_mass(240) = 5.18620768346d-23	!CF+
    get_mass(241) = 7.36118044619d-23	!CS+
    get_mass(242) = 4.34975117983d-23	!CN+
    get_mass(243) = 7.69578369801d-23	!NS+
    get_mass(244) = 5.35356093528d-23	!PH+
    get_mass(245) = 7.86303369801d-23	!PO+
    get_mass(246) = 6.69197394256d-23	!SIC+
    get_mass(247) = 7.02657719438d-23	!SIN+
    get_mass(248) = 1.00380064607d-22	!SIS+
    get_mass(249) = 8.03038694983d-23	!SO+
    get_mass(250) = 6.02276743892d-23	!C3+
    get_mass(251) = 9.36879995711d-23	!C2S+
    get_mass(252) = 6.69197394256d-23	!C2O+
    get_mass(253) = 9.20144670529d-23	!CCP+
    get_mass(254) = 4.18250117983d-23	!C2H+
    get_mass(255) = 4.85170768346d-23	!HOC+
    get_mass(256) = 6.35737069074d-23	!C2N+
    get_mass(257) = 6.35737069074d-23	!CNC+
    get_mass(258) = 7.36118044619d-23	!HCP+
    get_mass(259) = 8.69959345347d-23	!SIC2+
    get_mass(260) = 9.03419670529d-23	!SINC+
    get_mass(261) = 8.03038694983d-23	!HPO+
    get_mass(262) = 4.51710443164d-23	!HCN+
    get_mass(263) = 6.85932719438d-23	!CHSI+
    get_mass(264) = 5.01906093528d-23	!SIH2+
    get_mass(265) = 6.19012069074d-23	!C3H+
    get_mass(266) = 8.03038694983d-23	!C4+
    get_mass(267) = 8.69959345347d-23	!C3O+
    get_mass(268) = 1.1376419468d-22	!C3S+
    get_mass(269) = 5.01906093528d-23	!H2CO+
    get_mass(270) = 7.69588694983d-23	!H2SIO+
    get_mass(271) = 4.68445768346d-23	!HCNH+
    get_mass(272) = 8.86694670529d-23	!SIC2H+
    get_mass(273) = 1.07072129644d-22	!SIC3+
    get_mass(274) = 7.02668044619d-23	!CH2SI+
    get_mass(275) = 5.1864141871d-23	!SIH3+
    get_mass(276) = 6.69207719438d-23	!C2H2N+
    get_mass(277) = 4.51720768346d-23	!C2H3+
    get_mass(278) = 6.35747394256d-23	!C3H2+
    get_mass(279) = 6.35747394256d-23	!H2C3+
    get_mass(280) = 8.19774020165d-23	!C4H+
    get_mass(281) = 1.00380064607d-22	!C5+
    get_mass(282) = 1.33840389789d-22	!C4S+
    get_mass(283) = 9.36879995711d-23	!PC2H+
    get_mass(284) = 8.36499020165d-23	!C3N+
    get_mass(285) = 1.03726097126d-22	!C4N+
    get_mass(286) = 8.53234345347d-23	!C3HN+
    get_mass(287) = 4.51710443164d-23	!HNC+
    get_mass(288) = 1.08745662162d-22	!SIC3H+
    get_mass(289) = 1.27148324753d-22	!SIC4+
    get_mass(290) = 9.03429995711d-23	!SIC2H2+
    get_mass(291) = 7.19403369801d-23	!SICH3+
    get_mass(292) = 8.69969670529d-23	!HC2NCH+
    get_mass(293) = 6.52482719438d-23	!C3H3+
    get_mass(294) = 6.52482719438d-23	!H3C3+
    get_mass(295) = 1.02053597126d-22	!C5H+
    get_mass(296) = 1.20456259717d-22	!C6+
    get_mass(297) = 7.19403369801d-23	!C2H3O+
    get_mass(298) = 4.8519141871d-23	!C2H5+
    get_mass(299) = 8.86704995711d-23	!C3H3N+
    get_mass(300) = 1.03727129644d-22	!C5H2+
    get_mass(301) = 8.53244670529d-23	!C4H3+
    get_mass(302) = 1.22129792235d-22	!C6H+
    get_mass(303) = 1.40532454826d-22	!C7+
    get_mass(304) = 5.0191641871d-23	!CH4N+
    get_mass(305) = 1.25475824753d-22	!C5HN+
    get_mass(306) = 1.42205987344d-22	!C7H+
    get_mass(307) = 1.60608649935d-22	!C8+
    get_mass(308) = 1.00382129644d-22	!COOCH4+
    get_mass(309) = 7.52874020165d-23	!C2H5O+
    get_mass(310) = 1.62282182453d-22	!C8H+
    get_mass(311) = 1.80684845044d-22	!C9+
    get_mass(312) = 1.05400662162d-22	!C5H3+
    get_mass(313) = 1.23803324753d-22	!C6H2+
    get_mass(314) = 1.25476857271d-22	!C6H3+
    get_mass(315) = 9.70371296438d-23	!C2H6CO+
    get_mass(316) = 1.82358377562d-22	!C9H+
    get_mass(317) = 2.00761040153d-22	!C10+
    get_mass(318) = 1.4555305238d-22	!C7H3+
    get_mass(319) = 1.63955714971d-22	!C8H2+
    get_mass(320) = 1.65629247489d-22	!C8H3+
    get_mass(321) = 6.02276743892d-23	!HCL+
    get_mass(322) = 3.17858817255d-23	!F+
    get_mass(323) = 3.34594142437d-23	!HF+
    get_mass(324) = 5.5209141871d-23	!HS+
    get_mass(325) = 2.50948492073d-23	!NH+
    get_mass(326) = 2.84408817255d-23	!OH+
    get_mass(327) = 7.52843044619d-23	!PN+
    get_mass(328) = 1.07072129644d-22	!S2+
    get_mass(329) = 4.85170768346d-23	!SIH+
    get_mass(330) = 7.36118044619d-23	!SIO+
    get_mass(331) = 3.01144142437d-23	!H2O+
    get_mass(332) = 7.19393044619d-23	!HNSI+
    get_mass(333) = 1.08745662162d-22	!S2H+
    get_mass(334) = 5.5209141871d-23	!PH2+
    get_mass(335) = 7.69588694983d-23	!H2CS+
    get_mass(336) = 1.1041919468d-22	!H2S2+
    get_mass(337) = 7.52853369801d-23	!HSIO+
    get_mass(338) = 1.32166857271d-22	!C4P+
    get_mass(339) = 7.52853369801d-23	!HCO2+
    get_mass(340) = 7.69588694983d-23	!PCH3+
    get_mass(341) = 2.67694142437d-23	!CH4+
    get_mass(342) = 6.52472394256d-23	!C2NH+
    get_mass(343) = 5.35376743892d-23	!SIH4+
    get_mass(344) = 3.01154467619d-23	!NH4+
    get_mass(345) = 4.68445768346d-23	!H2NC+
    get_mass(346) = 8.69969670529d-23	!C3H2N+
    get_mass(347) = 1.43879519862d-22	!C7H2+
    get_mass(348) = 1.0707419468d-22	!C5H4+
    get_mass(349) = 1.65628214971d-22	!C7HN+
    get_mass(350) = 1.8403191008d-22	!C9H2+
    get_mass(351) = 1.47226584898d-22	!C7H4+
    get_mass(352) = 2.05780605189d-22	!C9HN+
    get_mass(353) = 4.68435443164d-23	!N2+
    get_mass(354) = 7.36118044619d-23	!CO2+
    get_mass(355) = 8.36468661638d-24	!HEH+
    get_mass(356) = 1.07072129644d-22	!SO2+
    get_mass(357) = 1.28823922308d-22	!C6H5+
    get_mass(358) = 1.08747727198d-22	!C5H5+
    get_mass(359) = 4.85170768346d-23	!N2H+
    get_mass(360) = 7.69578369801d-23	!NO2+
    get_mass(361) = 9.53615320893d-23	!PC2H2+
    get_mass(362) = 7.86313694983d-23	!PNH2+
    get_mass(363) = 7.52853369801d-23	!PCH2+
    get_mass(364) = 9.53615320893d-23	!HC2S+
    get_mass(365) = 1.15437727198d-22	!HC3S+
    get_mass(366) = 7.86324020165d-23	!H3CS+
    get_mass(367) = 1.35513922308d-22	!HC4S+
    get_mass(368) = 7.86303369801d-23	!SIF+
    get_mass(369) = 7.36128369801d-23	!SINH2+
    get_mass(370) = 9.20165320893d-23	!SIC2H3+
    get_mass(371) = 1.1041919468d-22	!SIC3H2+
    get_mass(372) = 6.85932719438d-23	!C2HO+
    get_mass(373) = 3.17879467619d-23	!H3O+
    get_mass(374) = 5.85562069074d-23	!H3S+
    get_mass(375) = 1.02053597126d-22	!HOCS+
    get_mass(376) = 5.52112069074d-23	!CH5O+
    get_mass(377) = 7.02657719438d-23	!NCO+
    get_mass(378) = 7.19393044619d-23	!HNCO+
    get_mass(379) = 8.69959345347d-23	!C2N2+
    get_mass(380) = 5.5209141871d-23	!O2H+
    get_mass(381) = 2.84429467619d-23	!CH5+
    get_mass(382) = 6.19012069074d-23	!H2CL+
    get_mass(383) = 3.51329467619d-23	!H2F+
    get_mass(384) = 7.86324020165d-23	!CH3O2+
    get_mass(385) = 8.19774020165d-23	!H2PO+
    get_mass(386) = 8.03049020165d-23	!PNH3+
    get_mass(387) = 7.86324020165d-23	!PCH4+
    get_mass(388) = 9.70350646075d-23	!PC2H3+
    get_mass(389) = 1.02053597126d-22	!HSIS+
    get_mass(390) = 8.19774020165d-23	!HSO+
    get_mass(391) = 7.86313694983d-23	!HNS+
    get_mass(392) = 7.69578369801d-23	!HPN+
    get_mass(393) = 5.3536641871d-23	!H2NO+
    get_mass(394) = 6.85932719438d-23	!NAH2O+
    get_mass(395) = 5.68826743892d-23	!PH3+
    get_mass(396) = 9.20154995711d-23	!SINCH+
    get_mass(397) = 1.02053597126d-22	!HSIO2+
    get_mass(398) = 1.08745662162d-22	!HSO2+
    get_mass(399) = 8.86694670529d-23	!HC3O+
    get_mass(400) = 1.1376419468d-22	!PC3H+
    get_mass(401) = 1.12092727198d-22	!H3S2+
    get_mass(402) = 7.86324020165d-23	!H3SIO+
    get_mass(403) = 1.33840389789d-22	!PC4H+
    get_mass(404) = 7.19403369801d-23	!NH2CNH+
    get_mass(405) = 1.28821857271d-22	!SIC4H+
    get_mass(406) = 7.36138694983d-23	!SICH4+
    get_mass(407) = 5.52112069074d-23	!SIH5+
    get_mass(408) = 7.02678369801d-23	!C2H4N+
    get_mass(409) = 7.69599020165d-23	!NH2CH2O+
    get_mass(410) = 5.01926743892d-23	!C2H6+
    get_mass(411) = 9.03440320893d-23	!C3H4N+
    get_mass(412) = 6.85953369801d-23	!C3H5+
    get_mass(413) = 8.69979995711d-23	!C4H4+
    get_mass(414) = 5.35387069074d-23	!CH6N+
    get_mass(415) = 1.27149357271d-22	!C5H2N+
    get_mass(416) = 1.10420227198d-22	!C4H4N+
    get_mass(417) = 1.02055662162d-22	!H5C2O2+
    get_mass(418) = 7.86344670529d-23	!C2H5OH2+
    get_mass(419) = 7.86344670529d-23	!CH3OCH4+
    get_mass(420) = 1.67301747489d-22	!C7H2N+
    get_mass(421) = 9.8710662162d-23	!C3H6OH+
    get_mass(422) = 1.50572617417d-22	!C6H4N+
    get_mass(423) = 1.85705442599d-22	!C9H3+
    get_mass(424) = 1.48900117417d-22	!C7H5+
    get_mass(425) = 1.90725007635d-22	!C8H4N+
    get_mass(426) = 2.07454137708d-22	!C9H2N+
    get_mass(427) = 1.32170987344d-22	!C6H7+
    get_mass(428) = 4.18250117983d-23	!NAH2+
    get_mass(429) = 9.87085971256d-23	!PC2H4+
    get_mass(430) = 8.86715320893d-23	!C4H5+
    get_mass(431) = 8.19774020165d-23	!H2CCL+
    get_mass(432) = 1.35513922308d-22	!PC4H2+
    get_mass(433) = 1.27150389789d-22	!C6H4+
    get_mass(434) = 1.67302780008d-22	!C8H4+
    get_mass(435) = 1.87378975117d-22	!C9H4+
    get_mass(436) = 9.20185971256d-23	!C4H7+
    get_mass(437) = 1.05399629644d-22	!HC4N+
    get_mass(438) = 1.08745662162d-22	!HC4O+
    get_mass(439) = 1.23802292235d-22	!C5N+
    get_mass(440) = 1.07073162162d-22	!H2C4N+
    get_mass(441) = 1.0874669468d-22	!H3C4N+
    get_mass(442) = 1.63954682453d-22	!C7N+
    get_mass(443) = 1.28822889789d-22	!C5H3N+
    get_mass(444) = 2.04107072671d-22	!C9N+
    get_mass(445) = 1.68975280008d-22	!C7H3N+
    get_mass(446) = 2.09127670226d-22	!C9H3N+
    get_mass(447) = 1.03727129644d-22	!OCS+H2
    get_mass(448) = 9.03429995711d-23	!H2C3O+
    get_mass(449) = 9.20165320893d-23	!H3C3O+
    get_mass(450) = 1.30496422308d-22	!C5H4N+
    get_mass(451) = 1.68976312526d-22	!C8H5+
    get_mass(452) = 1.89052507635d-22	!C9H5+
    get_mass(453) = 6.69024316d-24	!HE++
    get_mass(454) = 0.d0	!dust_C_1
    get_mass(455) = 0.d0	!dust_C_2
    get_mass(456) = 0.d0	!dust_C_3
    get_mass(457) = 0.d0	!dust_C_4
    get_mass(458) = 0.d0	!dust_C_5
    get_mass(459) = 0.d0	!dust_C_6
    get_mass(460) = 0.d0	!dust_C_7
    get_mass(461) = 0.d0	!dust_C_8
    get_mass(462) = 0.d0	!dust_C_9
    get_mass(463) = 0.d0	!dust_C_10
    get_mass(464) = 0.d0	!dust_Si_1
    get_mass(465) = 0.d0	!dust_Si_2
    get_mass(466) = 0.d0	!dust_Si_3
    get_mass(467) = 0.d0	!dust_Si_4
    get_mass(468) = 0.d0	!dust_Si_5
    get_mass(469) = 0.d0	!dust_Si_6
    get_mass(470) = 0.d0	!dust_Si_7
    get_mass(471) = 0.d0	!dust_Si_8
    get_mass(472) = 0.d0	!dust_Si_9
    get_mass(473) = 0.d0	!dust_Si_10
    get_mass(474) = 0.d0	!CR
    get_mass(475) = 0.d0	!g
    get_mass(476) = 0.d0	!Tgas
    get_mass(477) = 0.d0	!dummy

  end function get_mass

  !************************
  !get sqrt of the inverse of the masses (1/sqrt(g))
  function get_imass_sqrt()
    use krome_commons
    implicit none
    real*8::get_imass_sqrt(nspec)

    get_imass_sqrt(1) = 3.31326021505d+13	!E
    get_imass_sqrt(2) = 22318201671.2	!GRAIN-
    get_imass_sqrt(3) = 7.72795806394d+11	!H-
    get_imass_sqrt(4) = 2.23177004181d+11	!C-
    get_imass_sqrt(5) = 1.5162076997d+11	!CN-
    get_imass_sqrt(6) = 1.93278051341d+11	!O-
    get_imass_sqrt(7) = 1.87505737904d+11	!OH-
    get_imass_sqrt(8) = 1.36669383456d+11	!S-
    get_imass_sqrt(9) = 22318206734.6	!GRAIN0
    get_imass_sqrt(10) = 2.23182067346d+11	!C
    get_imass_sqrt(11) = 1.04249079615d+11	!FE
    get_imass_sqrt(12) = 7.73006102111d+11	!H
    get_imass_sqrt(13) = 3.86562679981d+11	!HE
    get_imass_sqrt(14) = 1.57813553259d+11	!MG
    get_imass_sqrt(15) = 2.06626443857d+11	!N
    get_imass_sqrt(16) = 1.61208862859d+11	!NA
    get_imass_sqrt(17) = 1.93281339991d+11	!O
    get_imass_sqrt(18) = 1.36670546184d+11	!S
    get_imass_sqrt(19) = 1.46106959624d+11	!SI
    get_imass_sqrt(20) = 5.46597856701d+11	!H2
    get_imass_sqrt(21) = 1.46106959624d+11	!CO
    get_imass_sqrt(22) = 1.30682613569d+11	!CL
    get_imass_sqrt(23) = 1.38858104892d+11	!P
    get_imass_sqrt(24) = 1.57813553259d+11	!C2
    get_imass_sqrt(25) = 1.12772294263d+11	!CCL
    get_imass_sqrt(26) = 2.14423849574d+11	!CH
    get_imass_sqrt(27) = 1.08259531918d+11	!CLO
    get_imass_sqrt(28) = 1.51622357573d+11	!CN
    get_imass_sqrt(29) = 1.17900935128d+11	!CP
    get_imass_sqrt(30) = 1.16553033405d+11	!CS
    get_imass_sqrt(31) = 1.2885422666d+11	!HCL
    get_imass_sqrt(32) = 1.72876086d+11	!HF
    get_imass_sqrt(33) = 1.77368562161d+11	!F
    get_imass_sqrt(34) = 1.34583221186d+11	!HS
    get_imass_sqrt(35) = 1.54624117718d+11	!MGH
    get_imass_sqrt(36) = 1.46106959624d+11	!N2
    get_imass_sqrt(37) = 1.57813553259d+11	!NAH
    get_imass_sqrt(38) = 1.99618056318d+11	!NH
    get_imass_sqrt(39) = 1.41152733144d+11	!NO
    get_imass_sqrt(40) = 1.13991115426d+11	!NS
    get_imass_sqrt(41) = 1.36670546184d+11	!O2
    get_imass_sqrt(42) = 1.87508740611d+11	!OH
    get_imass_sqrt(43) = 1.36670546184d+11	!PH
    get_imass_sqrt(44) = 1.15251119158d+11	!PN
    get_imass_sqrt(45) = 1.12772294263d+11	!PO
    get_imass_sqrt(46) = 96640669995.3	!S2
    get_imass_sqrt(47) = 1.22241852716d+11	!SIC
    get_imass_sqrt(48) = 1.43565011358d+11	!SIH
    get_imass_sqrt(49) = 1.19295832983d+11	!SIN
    get_imass_sqrt(50) = 1.16553033405d+11	!SIO
    get_imass_sqrt(51) = 99810054788.8	!SIS
    get_imass_sqrt(52) = 1.11591033673d+11	!SO
    get_imass_sqrt(53) = 1.54624117718d+11	!C2H
    get_imass_sqrt(54) = 1.25417494605d+11	!C2N
    get_imass_sqrt(55) = 1.03313221929d+11	!C2S
    get_imass_sqrt(56) = 1.2885422666d+11	!C3
    get_imass_sqrt(57) = 1.22241852716d+11	!CCO
    get_imass_sqrt(58) = 1.04248494716d+11	!CCP
    get_imass_sqrt(59) = 2.06621889668d+11	!CH2
    get_imass_sqrt(60) = 1.16553033405d+11	!CO2
    get_imass_sqrt(61) = 1.82224271009d+11	!H2O
    get_imass_sqrt(62) = 1.32588702018d+11	!H2S
    get_imass_sqrt(63) = 1.48787194664d+11	!HCN
    get_imass_sqrt(64) = 1.43565011358d+11	!HCO
    get_imass_sqrt(65) = 1.16553033405d+11	!HCP
    get_imass_sqrt(66) = 1.15250328846d+11	!HCS
    get_imass_sqrt(67) = 1.20741441507d+11	!HCSI
    get_imass_sqrt(68) = 1.48787194664d+11	!HNC
    get_imass_sqrt(69) = 1.38856722679d+11	!HNO
    get_imass_sqrt(70) = 1.17900089041d+11	!HNSI
    get_imass_sqrt(71) = 1.11591033673d+11	!HPO
    get_imass_sqrt(72) = 95894171204.2	!HS2
    get_imass_sqrt(73) = 1.16553033405d+11	!N2O
    get_imass_sqrt(74) = 1.22241852716d+11	!NAOH
    get_imass_sqrt(75) = 1.93277612428d+11	!NH2
    get_imass_sqrt(76) = 1.13991115426d+11	!NO2
    get_imass_sqrt(77) = 1.34583221186d+11	!O2H
    get_imass_sqrt(78) = 1.19295832983d+11	!OCN
    get_imass_sqrt(79) = 99810054788.8	!OCS
    get_imass_sqrt(80) = 1.34583221186d+11	!PH2
    get_imass_sqrt(81) = 1.07213197219d+11	!SIC2
    get_imass_sqrt(82) = 1.4115128127d+11	!SIH2
    get_imass_sqrt(83) = 1.05209035506d+11	!SINC
    get_imass_sqrt(84) = 99810054788.8	!SIO2
    get_imass_sqrt(85) = 96640669995.3	!SO2
    get_imass_sqrt(86) = 1.51620558082d+11	!C2H2
    get_imass_sqrt(87) = 1.2710049623d+11	!C3H
    get_imass_sqrt(88) = 1.2710049623d+11	!HC3
    get_imass_sqrt(89) = 1.09336436947d+11	!C3N
    get_imass_sqrt(90) = 1.07213197219d+11	!C3O
    get_imass_sqrt(91) = 94452513153.1	!C3P
    get_imass_sqrt(92) = 93755221204.9	!C3S
    get_imass_sqrt(93) = 1.11591033673d+11	!C4
    get_imass_sqrt(94) = 1.99613949989d+11	!CH3
    get_imass_sqrt(95) = 1.4115128127d+11	!H2CO
    get_imass_sqrt(96) = 1.13990350752d+11	!H2CS
    get_imass_sqrt(97) = 1.32588702018d+11	!H2O2
    get_imass_sqrt(98) = 95164708334.7	!H2S2
    get_imass_sqrt(99) = 1.13990350752d+11	!H2SIO
    get_imass_sqrt(100) = 1.03313221929d+11	!HCCP
    get_imass_sqrt(101) = 1.87505337153d+11	!NH3
    get_imass_sqrt(102) = 1.06196626296d+11	!SIC2H
    get_imass_sqrt(103) = 96640669995.3	!SIC3
    get_imass_sqrt(104) = 1.19294956509d+11	!SICH2
    get_imass_sqrt(105) = 1.38855340508d+11	!SIH3
    get_imass_sqrt(106) = 1.22240909693d+11	!C2H2N
    get_imass_sqrt(107) = 1.19294956509d+11	!C2H2O
    get_imass_sqrt(108) = 1.48785494241d+11	!C2H3
    get_imass_sqrt(109) = 1.25416476162d+11	!C3H2
    get_imass_sqrt(110) = 1.25416476162d+11	!H2C3
    get_imass_sqrt(111) = 1.10446132225d+11	!C4H
    get_imass_sqrt(112) = 98187018902.3	!C4N
    get_imass_sqrt(113) = 86983568721.5	!C4P
    get_imass_sqrt(114) = 86438043000.2	!C4S
    get_imass_sqrt(115) = 99810054788.8	!C5
    get_imass_sqrt(116) = 1.13990350752d+11	!CH2O2
    get_imass_sqrt(117) = 1.13990350752d+11	!CH2PH
    get_imass_sqrt(118) = 1.43563483769d+11	!CH3N
    get_imass_sqrt(119) = 1.93273885081d+11	!CH4
    get_imass_sqrt(120) = 1.08258876887d+11	!HC3N
    get_imass_sqrt(121) = 1.05208434301d+11	!SIC2H2
    get_imass_sqrt(122) = 95894171204.2	!SIC3H
    get_imass_sqrt(123) = 88683560914.8	!SIC4
    get_imass_sqrt(124) = 1.17899242973d+11	!SICH3
    get_imass_sqrt(125) = 1.36667910399d+11	!SIH4
    get_imass_sqrt(126) = 1.20740532783d+11	!C2H3N
    get_imass_sqrt(127) = 1.46103739326d+11	!C2H4
    get_imass_sqrt(128) = 1.23797667272d+11	!C3H3
    get_imass_sqrt(129) = 1.09335762173d+11	!C4H2
    get_imass_sqrt(130) = 98988308511.5	!C5H
    get_imass_sqrt(131) = 89873997548.6	!C5N
    get_imass_sqrt(132) = 91113697456.1	!C6
    get_imass_sqrt(133) = 1.36667910399d+11	!CH4O
    get_imass_sqrt(134) = 1.16551398625d+11	!C2H4O
    get_imass_sqrt(135) = 1.43561956229d+11	!C2H5
    get_imass_sqrt(136) = 1.06196008d+11	!C3H3N
    get_imass_sqrt(137) = 1.22239966691d+11	!C3H4
    get_imass_sqrt(138) = 98186530219.9	!C5H2
    get_imass_sqrt(139) = 90487287806.2	!C6H
    get_imass_sqrt(140) = 84354892469.4	!C7
    get_imass_sqrt(141) = 1.38853958377d+11	!CH5N
    get_imass_sqrt(142) = 89272643286.9	!HC5N
    get_imass_sqrt(143) = 89873622776.5	!C6H2
    get_imass_sqrt(144) = 83857066928.7	!C7H
    get_imass_sqrt(145) = 78097454962.4	!C7N
    get_imass_sqrt(146) = 78906776629.7	!C8
    get_imass_sqrt(147) = 95893715963.3	!CH3C3N
    get_imass_sqrt(148) = 99809028158.9	!HCOOCH3
    get_imass_sqrt(149) = 1.1398882145d+11	!C2H5OH
    get_imass_sqrt(150) = 83367952463.5	!C7H2
    get_imass_sqrt(151) = 78498862078.9	!C8H
    get_imass_sqrt(152) = 74394022448.6	!C9
    get_imass_sqrt(153) = 96639738091.2	!CH3C4H
    get_imass_sqrt(154) = 1.1398882145d+11	!CH3OCH3
    get_imass_sqrt(155) = 77701901172.7	!HC7N
    get_imass_sqrt(156) = 1.01514712904d+11	!C2H6CO
    get_imass_sqrt(157) = 78097209052.3	!C8H2
    get_imass_sqrt(158) = 74051874333.6	!C9H
    get_imass_sqrt(159) = 69995481248.6	!C9N
    get_imass_sqrt(160) = 81950698047.1	!CH3C5N
    get_imass_sqrt(161) = 73714403963.5	!C9H2
    get_imass_sqrt(162) = 82414862300.2	!CH3C6H
    get_imass_sqrt(163) = 72729218087.0	!CH3C7N
    get_imass_sqrt(164) = 69710278643.1	!HC9N
    get_imass_sqrt(165) = 1.08258876887d+11	!HCNC2
    get_imass_sqrt(166) = 1.08258876887d+11	!HC2NC
    get_imass_sqrt(167) = 1.08258876887d+11	!HNC3
    get_imass_sqrt(168) = 1.1524953855d+11	!NH2CHO
    get_imass_sqrt(169) = 1.08258221867d+11	!C4H3
    get_imass_sqrt(170) = 1.19294956509d+11	!NH2CN
    get_imass_sqrt(171) = 87538170023.3	!C6H6
    get_imass_sqrt(172) = 1.46105349448d+11	!H2CN
    get_imass_sqrt(173) = 70576366571.8	!C10
    get_imass_sqrt(174) = 67291925211.1	!C11
    get_imass_sqrt(175) = 94451643127.1	!SIC3H3
    get_imass_sqrt(176) = 88105635154.0	!SIC4H
    get_imass_sqrt(177) = 76928731067.7	!SIC6H
    get_imass_sqrt(178) = 69150349046.6	!SIC8H
    get_imass_sqrt(179) = 1.04247324948d+11	!SIC2H3
    get_imass_sqrt(180) = 1.19293203621d+11	!C3H6
    get_imass_sqrt(181) = 93072315418.7	!SIC3H5
    get_imass_sqrt(182) = 1.07211924787d+11	!C4H4
    get_imass_sqrt(183) = 1.0520723192d+11	!C4H6
    get_imass_sqrt(184) = 97404401201.8	!HC4N
    get_imass_sqrt(185) = 82887591945.0	!HC6N
    get_imass_sqrt(186) = 73381709712.3	!HC8N
    get_imass_sqrt(187) = 66539960478.2	!HC10N
    get_imass_sqrt(188) = 63766238027.5	!HC11N
    get_imass_sqrt(189) = 61312769771.2	!HC12N
    get_imass_sqrt(190) = 88683560914.8	!NC4N
    get_imass_sqrt(191) = 77312535996.2	!NC6N
    get_imass_sqrt(192) = 69428706890.3	!NC8N
    get_imass_sqrt(193) = 63550513118.9	!NC10N
    get_imass_sqrt(194) = 58950256041.1	!NC12N
    get_imass_sqrt(195) = 59122320598.3	!HC13N
    get_imass_sqrt(196) = 2.23187130855d+11	!C+
    get_imass_sqrt(197) = 1.0424959565d+11	!FE+
    get_imass_sqrt(198) = 7.732165696d+11	!H+
    get_imass_sqrt(199) = 3.86588992536d+11	!HE+
    get_imass_sqrt(200) = 1.5781534345d+11	!MG+
    get_imass_sqrt(201) = 2.06630462037d+11	!N+
    get_imass_sqrt(202) = 1.61210771101d+11	!NA+
    get_imass_sqrt(203) = 1.93284628808d+11	!O+
    get_imass_sqrt(204) = 1.36671708942d+11	!S+
    get_imass_sqrt(205) = 1.46108380244d+11	!SI+
    get_imass_sqrt(206) = 4.463357746d+11	!H3+
    get_imass_sqrt(207) = 1.43566359113d+11	!HCO+
    get_imass_sqrt(208) = 1.30683630093d+11	!CL+
    get_imass_sqrt(209) = 1.38859324382d+11	!P+
    get_imass_sqrt(210) = 1.46108380244d+11	!CO+
    get_imass_sqrt(211) = 5.46672253003d+11	!H2+
    get_imass_sqrt(212) = 1.41154014095d+11	!NO+
    get_imass_sqrt(213) = 1.36671708942d+11	!O2+
    get_imass_sqrt(214) = 2.06625907582d+11	!CH2+
    get_imass_sqrt(215) = 1.32589763674d+11	!H2S+
    get_imass_sqrt(216) = 1.15251026098d+11	!HCS+
    get_imass_sqrt(217) = 1.38857942133d+11	!HNO+
    get_imass_sqrt(218) = 1.93280901055d+11	!NH2+
    get_imass_sqrt(219) = 99810507670.5	!OCS+
    get_imass_sqrt(220) = 1.51622145678d+11	!C2H2+
    get_imass_sqrt(221) = 1.99617572781d+11	!CH3+
    get_imass_sqrt(222) = 1.87508339841d+11	!NH3+
    get_imass_sqrt(223) = 1.19295729776d+11	!C2H2O+
    get_imass_sqrt(224) = 1.13991025384d+11	!CH2O2+
    get_imass_sqrt(225) = 1.20741334503d+11	!C2H3N+
    get_imass_sqrt(226) = 1.46105159852d+11	!C2H4+
    get_imass_sqrt(227) = 1.09336357491d+11	!C4H2+
    get_imass_sqrt(228) = 1.38856559925d+11	!H3CO+
    get_imass_sqrt(229) = 1.3666907309d+11	!CH4O+
    get_imass_sqrt(230) = 1.16552119758d+11	!C2H4O+
    get_imass_sqrt(231) = 1.22240798652d+11	!C3H4+
    get_imass_sqrt(232) = 1.38855177758d+11	!CH5N+
    get_imass_sqrt(233) = 1.13989496055d+11	!C2H5OH+
    get_imass_sqrt(234) = 1.13989496055d+11	!CH3OCH3+
    get_imass_sqrt(235) = 2.14428340044d+11	!CH+
    get_imass_sqrt(236) = 1.12772947499d+11	!CCL+
    get_imass_sqrt(237) = 1.5781534345d+11	!C2+
    get_imass_sqrt(238) = 1.08260109829d+11	!CLO+
    get_imass_sqrt(239) = 1.17901681602d+11	!CP+
    get_imass_sqrt(240) = 1.38859324382d+11	!CF+
    get_imass_sqrt(241) = 1.16553754568d+11	!CS+
    get_imass_sqrt(242) = 1.51623945226d+11	!CN+
    get_imass_sqrt(243) = 1.13991790072d+11	!NS+
    get_imass_sqrt(244) = 1.36671708942d+11	!PH+
    get_imass_sqrt(245) = 1.12772947499d+11	!PO+
    get_imass_sqrt(246) = 1.22242684716d+11	!SIC+
    get_imass_sqrt(247) = 1.19296606267d+11	!SIN+
    get_imass_sqrt(248) = 99810507670.5	!SIS+
    get_imass_sqrt(249) = 1.11591666595d+11	!SO+
    get_imass_sqrt(250) = 1.28855201111d+11	!C3+
    get_imass_sqrt(251) = 1.0331372419d+11	!C2S+
    get_imass_sqrt(252) = 1.22242684716d+11	!C2O+
    get_imass_sqrt(253) = 1.04249010742d+11	!CCP+
    get_imass_sqrt(254) = 1.54625801546d+11	!C2H+
    get_imass_sqrt(255) = 1.43566359113d+11	!HOC+
    get_imass_sqrt(256) = 1.25418393146d+11	!C2N+
    get_imass_sqrt(257) = 1.25418393146d+11	!CNC+
    get_imass_sqrt(258) = 1.16553754568d+11	!HCP+
    get_imass_sqrt(259) = 1.07213758535d+11	!SIC2+
    get_imass_sqrt(260) = 1.05209565928d+11	!SINC+
    get_imass_sqrt(261) = 1.11591666595d+11	!HPO+
    get_imass_sqrt(262) = 1.48788694909d+11	!HCN+
    get_imass_sqrt(263) = 1.20742243245d+11	!CHSI+
    get_imass_sqrt(264) = 1.41152562182d+11	!SIH2+
    get_imass_sqrt(265) = 1.27101431432d+11	!C3H+
    get_imass_sqrt(266) = 1.11591666595d+11	!C4+
    get_imass_sqrt(267) = 1.07213758535d+11	!C3O+
    get_imass_sqrt(268) = 93755596564.9	!C3S+
    get_imass_sqrt(269) = 1.41152562182d+11	!H2CO+
    get_imass_sqrt(270) = 1.13991025384d+11	!H2SIO+
    get_imass_sqrt(271) = 1.46106770022d+11	!HCNH+
    get_imass_sqrt(272) = 1.06197171795d+11	!SIC2H+
    get_imass_sqrt(273) = 96641081089.6	!SIC3+
    get_imass_sqrt(274) = 1.19295729776d+11	!CH2SI+
    get_imass_sqrt(275) = 1.38856559925d+11	!SIH3+
    get_imass_sqrt(276) = 1.22241741673d+11	!C2H2N+
    get_imass_sqrt(277) = 1.48786994434d+11	!C2H3+
    get_imass_sqrt(278) = 1.25417374681d+11	!C3H2+
    get_imass_sqrt(279) = 1.25417374681d+11	!H2C3+
    get_imass_sqrt(280) = 1.10446745866d+11	!C4H+
    get_imass_sqrt(281) = 99810507670.5	!C5+
    get_imass_sqrt(282) = 86438337155.0	!C4S+
    get_imass_sqrt(283) = 1.0331372419d+11	!PC2H+
    get_imass_sqrt(284) = 1.09337032277d+11	!C3N+
    get_imass_sqrt(285) = 98187450047.9	!C4N+
    get_imass_sqrt(286) = 1.08259454787d+11	!C3HN+
    get_imass_sqrt(287) = 1.48788694909d+11	!HNC+
    get_imass_sqrt(288) = 95894572845.4	!SIC3H+
    get_imass_sqrt(289) = 88683878595.4	!SIC4+
    get_imass_sqrt(290) = 1.05208964713d+11	!SIC2H2+
    get_imass_sqrt(291) = 1.17899989415d+11	!SICH3+
    get_imass_sqrt(292) = 1.07213122303d+11	!HC2NCH+
    get_imass_sqrt(293) = 1.23798531446d+11	!C3H3+
    get_imass_sqrt(294) = 1.23798531446d+11	!H3C3+
    get_imass_sqrt(295) = 98988750299.1	!C5H+
    get_imass_sqrt(296) = 91114041974.5	!C6+
    get_imass_sqrt(297) = 1.17899989415d+11	!C2H3O+
    get_imass_sqrt(298) = 1.43563303897d+11	!C2H5+
    get_imass_sqrt(299) = 1.0619655349d+11	!C3H3N+
    get_imass_sqrt(300) = 98186961359.1	!C5H2+
    get_imass_sqrt(301) = 1.08258799757d+11	!C4H3+
    get_imass_sqrt(302) = 90487625267.6	!C6H+
    get_imass_sqrt(303) = 84355165865.3	!C7+
    get_imass_sqrt(304) = 1.41151110313d+11	!CH4N+
    get_imass_sqrt(305) = 89272967340.2	!C5HN+
    get_imass_sqrt(306) = 83857335512.7	!C7H+
    get_imass_sqrt(307) = 78907000400.6	!C8+
    get_imass_sqrt(308) = 99809481026.6	!COOCH4+
    get_imass_sqrt(309) = 1.15249445493d+11	!C2H5O+
    get_imass_sqrt(310) = 78499082397.4	!C8H+
    get_imass_sqrt(311) = 74394209980.3	!C9+
    get_imass_sqrt(312) = 97404345023.6	!C5H3+
    get_imass_sqrt(313) = 89873953418.6	!C6H2+
    get_imass_sqrt(314) = 89272600036.8	!C6H3+
    get_imass_sqrt(315) = 1.01515189389d+11	!C2H6CO+
    get_imass_sqrt(316) = 74052059289.8	!C9H+
    get_imass_sqrt(317) = 70576526689.1	!C10+
    get_imass_sqrt(318) = 82887557327.1	!C7H3+
    get_imass_sqrt(319) = 78097426006.1	!C8H2+
    get_imass_sqrt(320) = 77701872654.2	!C8H3+
    get_imass_sqrt(321) = 1.28855201111d+11	!HCL+
    get_imass_sqrt(322) = 1.77371103708d+11	!F+
    get_imass_sqrt(323) = 1.72878439275d+11	!HF+
    get_imass_sqrt(324) = 1.34584331478d+11	!HS+
    get_imass_sqrt(325) = 1.99621679333d+11	!NH+
    get_imass_sqrt(326) = 1.87511743463d+11	!OH+
    get_imass_sqrt(327) = 1.15251816424d+11	!PN+
    get_imass_sqrt(328) = 96641081089.6	!S2+
    get_imass_sqrt(329) = 1.43566359113d+11	!SIH+
    get_imass_sqrt(330) = 1.16553754568d+11	!SIO+
    get_imass_sqrt(331) = 1.82227027061d+11	!H2O+
    get_imass_sqrt(332) = 1.17900835499d+11	!HNSI+
    get_imass_sqrt(333) = 95894572845.4	!S2H+
    get_imass_sqrt(334) = 1.34584331478d+11	!PH2+
    get_imass_sqrt(335) = 1.13991025384d+11	!H2CS+
    get_imass_sqrt(336) = 95165100879.6	!H2S2+
    get_imass_sqrt(337) = 1.15251026098d+11	!HSIO+
    get_imass_sqrt(338) = 86983868481.0	!C4P+
    get_imass_sqrt(339) = 1.15251026098d+11	!HCO2+
    get_imass_sqrt(340) = 1.13991025384d+11	!PCH3+
    get_imass_sqrt(341) = 1.93277173518d+11	!CH4+
    get_imass_sqrt(342) = 1.23799510979d+11	!C2NH+
    get_imass_sqrt(343) = 1.3666907309d+11	!SIH4+
    get_imass_sqrt(344) = 1.82223903177d+11	!NH4+
    get_imass_sqrt(345) = 1.46106770022d+11	!H2NC+
    get_imass_sqrt(346) = 1.07213122303d+11	!C3H2N+
    get_imass_sqrt(347) = 83368216375.0	!C7H2+
    get_imass_sqrt(348) = 96640149173.6	!C5H4+
    get_imass_sqrt(349) = 77702114848.7	!C7HN+
    get_imass_sqrt(350) = 73714586402.5	!C9H2+
    get_imass_sqrt(351) = 82415117263.4	!C7H4+
    get_imass_sqrt(352) = 69710432937.8	!C9HN+
    get_imass_sqrt(353) = 1.46108380244d+11	!N2+
    get_imass_sqrt(354) = 1.16553754568d+11	!CO2+
    get_imass_sqrt(355) = 3.45760328884d+11	!HEH+
    get_imass_sqrt(356) = 96641081089.6	!SO2+
    get_imass_sqrt(357) = 88105240496.0	!C6H5+
    get_imass_sqrt(358) = 95893662358.7	!C5H5+
    get_imass_sqrt(359) = 1.43566359113d+11	!N2H+
    get_imass_sqrt(360) = 1.13991790072d+11	!NO2+
    get_imass_sqrt(361) = 1.02403167444d+11	!PC2H2+
    get_imass_sqrt(362) = 1.12772207079d+11	!PNH2+
    get_imass_sqrt(363) = 1.15251026098d+11	!PCH2+
    get_imass_sqrt(364) = 1.02403167444d+11	!HC2S+
    get_imass_sqrt(365) = 93073515109.0	!HC3S+
    get_imass_sqrt(366) = 1.12771466673d+11	!H3CS+
    get_imass_sqrt(367) = 85902942867.8	!HC4S+
    get_imass_sqrt(368) = 1.12772947499d+11	!SIF+
    get_imass_sqrt(369) = 1.16552937154d+11	!SINH2+
    get_imass_sqrt(370) = 1.04247840957d+11	!SIC2H3+
    get_imass_sqrt(371) = 95165100879.6	!SIC3H2+
    get_imass_sqrt(372) = 1.20742243245d+11	!C2HO+
    get_imass_sqrt(373) = 1.77365342346d+11	!H3O+
    get_imass_sqrt(374) = 1.30681325736d+11	!H3S+
    get_imass_sqrt(375) = 98988750299.1	!HOCS+
    get_imass_sqrt(376) = 1.3458181456d+11	!CH5O+
    get_imass_sqrt(377) = 1.19296606267d+11	!NCO+
    get_imass_sqrt(378) = 1.17900835499d+11	!HNCO+
    get_imass_sqrt(379) = 1.07213758535d+11	!C2N2+
    get_imass_sqrt(380) = 1.34584331478d+11	!O2H+
    get_imass_sqrt(381) = 1.87504936405d+11	!CH5+
    get_imass_sqrt(382) = 1.27101431432d+11	!H2CL+
    get_imass_sqrt(383) = 1.68710732568d+11	!H2F+
    get_imass_sqrt(384) = 1.12771466673d+11	!CH3O2+
    get_imass_sqrt(385) = 1.10446745866d+11	!H2PO+
    get_imass_sqrt(386) = 1.115909492d+11	!PNH3+
    get_imass_sqrt(387) = 1.12771466673d+11	!PCH4+
    get_imass_sqrt(388) = 1.01516269573d+11	!PC2H3+
    get_imass_sqrt(389) = 98988750299.1	!HSIS+
    get_imass_sqrt(390) = 1.10446745866d+11	!HSO+
    get_imass_sqrt(391) = 1.12772207079d+11	!HNS+
    get_imass_sqrt(392) = 1.13991790072d+11	!HPN+
    get_imass_sqrt(393) = 1.36670390997d+11	!H2NO+
    get_imass_sqrt(394) = 1.20742243245d+11	!NAH2O+
    get_imass_sqrt(395) = 1.32589763674d+11	!PH3+
    get_imass_sqrt(396) = 1.04248425845d+11	!SINCH+
    get_imass_sqrt(397) = 98988750299.1	!HSIO2+
    get_imass_sqrt(398) = 95894572845.4	!HSO2+
    get_imass_sqrt(399) = 1.06197171795d+11	!HC3O+
    get_imass_sqrt(400) = 93755596564.9	!PC3H+
    get_imass_sqrt(401) = 94452026913.9	!H3S2+
    get_imass_sqrt(402) = 1.12771466673d+11	!H3SIO+
    get_imass_sqrt(403) = 86438337155.0	!PC4H+
    get_imass_sqrt(404) = 1.17899989415d+11	!NH2CNH+
    get_imass_sqrt(405) = 88105946664.2	!SIC4H+
    get_imass_sqrt(406) = 1.16552119758d+11	!SICH4+
    get_imass_sqrt(407) = 1.3458181456d+11	!SIH5+
    get_imass_sqrt(408) = 1.19294853305d+11	!C2H4N+
    get_imass_sqrt(409) = 1.13990260712d+11	!NH2CH2O+
    get_imass_sqrt(410) = 1.41149658489d+11	!C2H6+
    get_imass_sqrt(411) = 1.05208363509d+11	!C3H4N+
    get_imass_sqrt(412) = 1.20740425782d+11	!C3H5+
    get_imass_sqrt(413) = 1.07212486083d+11	!C4H4+
    get_imass_sqrt(414) = 1.36667755221d+11	!CH6N+
    get_imass_sqrt(415) = 88683518515.3	!C5H2N+
    get_imass_sqrt(416) = 95164655943.3	!C4H4N+
    get_imass_sqrt(417) = 98987748804.4	!H5C2O2+
    get_imass_sqrt(418) = 1.12769985906d+11	!C2H5OH2+
    get_imass_sqrt(419) = 1.12769985906d+11	!CH3OCH4+
    get_imass_sqrt(420) = 77312507904.3	!C7H2N+
    get_imass_sqrt(421) = 1.00650970635d+11	!C3H6OH+
    get_imass_sqrt(422) = 81494256159.8	!C6H4N+
    get_imass_sqrt(423) = 73381685691.0	!C9H3+
    get_imass_sqrt(424) = 81950664589.9	!C7H5+
    get_imass_sqrt(425) = 72409605191.2	!C8H4N+
    get_imass_sqrt(426) = 69428686545.7	!C9H2N+
    get_imass_sqrt(427) = 86982509436.4	!C6H7+
    get_imass_sqrt(428) = 1.54625801546d+11	!NAH2+
    get_imass_sqrt(429) = 1.00652023465d+11	!PC2H4+
    get_imass_sqrt(430) = 1.06195935196d+11	!C4H5+
    get_imass_sqrt(431) = 1.10446745866d+11	!H2CCL+
    get_imass_sqrt(432) = 85902942867.8	!PC4H2+
    get_imass_sqrt(433) = 88683158439.6	!C6H4+
    get_imass_sqrt(434) = 77312269334.7	!C8H4+
    get_imass_sqrt(435) = 73053254837.4	!C9H4+
    get_imass_sqrt(436) = 1.04246671211d+11	!C4H7+
    get_imass_sqrt(437) = 97404822119.8	!HC4N+
    get_imass_sqrt(438) = 95894572845.4	!HC4O+
    get_imass_sqrt(439) = 89874328194.7	!C5N+
    get_imass_sqrt(440) = 96640615128.2	!H2C4N+
    get_imass_sqrt(441) = 95894117598.8	!H3C4N+
    get_imass_sqrt(442) = 78097671918.2	!C7N+
    get_imass_sqrt(443) = 88105593578.0	!C5H3N+
    get_imass_sqrt(444) = 69995637444.7	!C9N+
    get_imass_sqrt(445) = 76928703392.0	!C7H3N+
    get_imass_sqrt(446) = 69150328945.7	!C9H3N+
    get_imass_sqrt(447) = 98186961359.1	!OCS+H2
    get_imass_sqrt(448) = 1.05208964713d+11	!H2C3O+
    get_imass_sqrt(449) = 1.04247840957d+11	!H3C3O+
    get_imass_sqrt(450) = 87538821864.8	!C5H4N+
    get_imass_sqrt(451) = 76928468357.9	!C8H5+
    get_imass_sqrt(452) = 72729194700.9	!C9H5+
    get_imass_sqrt(453) = 3.86615310465d+11	!HE++
    get_imass_sqrt(454) = 0.d0	!dust_C_1
    get_imass_sqrt(455) = 0.d0	!dust_C_2
    get_imass_sqrt(456) = 0.d0	!dust_C_3
    get_imass_sqrt(457) = 0.d0	!dust_C_4
    get_imass_sqrt(458) = 0.d0	!dust_C_5
    get_imass_sqrt(459) = 0.d0	!dust_C_6
    get_imass_sqrt(460) = 0.d0	!dust_C_7
    get_imass_sqrt(461) = 0.d0	!dust_C_8
    get_imass_sqrt(462) = 0.d0	!dust_C_9
    get_imass_sqrt(463) = 0.d0	!dust_C_10
    get_imass_sqrt(464) = 0.d0	!dust_Si_1
    get_imass_sqrt(465) = 0.d0	!dust_Si_2
    get_imass_sqrt(466) = 0.d0	!dust_Si_3
    get_imass_sqrt(467) = 0.d0	!dust_Si_4
    get_imass_sqrt(468) = 0.d0	!dust_Si_5
    get_imass_sqrt(469) = 0.d0	!dust_Si_6
    get_imass_sqrt(470) = 0.d0	!dust_Si_7
    get_imass_sqrt(471) = 0.d0	!dust_Si_8
    get_imass_sqrt(472) = 0.d0	!dust_Si_9
    get_imass_sqrt(473) = 0.d0	!dust_Si_10
    get_imass_sqrt(474) = 0.d0	!CR
    get_imass_sqrt(475) = 0.d0	!g
    get_imass_sqrt(476) = 0.d0	!Tgas
    get_imass_sqrt(477) = 0.d0	!dummy

  end function get_imass_sqrt

  !************************
  !get inverse of the species masses (1/g)
  function get_imass()
    use krome_commons
    implicit none
    real*8::get_imass(nspec)

    get_imass(1) = 1.09776932527d+27	!E
    get_imass(2) = 4.98102125838d+20	!GRAIN-
    get_imass(3) = 5.9721335838d+23	!H-
    get_imass(4) = 4.98079751954d+22	!C-
    get_imass(5) = 2.29888578864d+22	!CN-
    get_imass(6) = 3.73564051301d+22	!O-
    get_imass(7) = 3.51584017468d+22	!OH-
    get_imass(8) = 1.86785203743d+22	!S-
    get_imass(9) = 4.98102351847d+20	!GRAIN0
    get_imass(10) = 4.98102351847d+22	!C
    get_imass(11) = 1.08678706006d+22	!FE
    get_imass(12) = 5.97538433901d+23	!H
    get_imass(13) = 1.49430705554d+23	!HE
    get_imass(14) = 2.49051175924d+22	!MG
    get_imass(15) = 4.26944873012d+22	!N
    get_imass(16) = 2.59882974644d+22	!NA
    get_imass(17) = 3.73576763885d+22	!O
    get_imass(18) = 1.86788381943d+22	!S
    get_imass(19) = 2.13472436506d+22	!SI
    get_imass(20) = 2.9876921695d+23	!H2
    get_imass(21) = 2.13472436506d+22	!CO
    get_imass(22) = 1.70779454893d+22	!CL
    get_imass(23) = 1.92815732942d+22	!P
    get_imass(24) = 2.49051175924d+22	!C2
    get_imass(25) = 1.27175903534d+22	!CCL
    get_imass(26) = 4.59775872662d+22	!CH
    get_imass(27) = 1.17201262512d+22	!CLO
    get_imass(28) = 2.2989339316d+22	!CN
    get_imass(29) = 1.3900630504d+22	!CP
    get_imass(30) = 1.35846095958d+22	!CS
    get_imass(31) = 1.66034117282d+22	!HCL
    get_imass(32) = 2.98861411108d+22	!HF
    get_imass(33) = 3.1459606843d+22	!F
    get_imass(34) = 1.81126434248d+22	!HS
    get_imass(35) = 2.390861778d+22	!MGH
    get_imass(36) = 2.13472436506d+22	!N2
    get_imass(37) = 2.49051175924d+22	!NAH
    get_imass(38) = 3.98473684081d+22	!NH
    get_imass(39) = 1.99240940739d+22	!NO
    get_imass(40) = 1.2993974396d+22	!NS
    get_imass(41) = 1.86788381943d+22	!O2
    get_imass(42) = 3.51595278056d+22	!OH
    get_imass(43) = 1.86788381943d+22	!PH
    get_imass(44) = 1.32828204673d+22	!PN
    get_imass(45) = 1.27175903534d+22	!PO
    get_imass(46) = 9.33941909714d+21	!S2
    get_imass(47) = 1.49430705554d+22	!SIC
    get_imass(48) = 2.06109124864d+22	!SIH
    get_imass(49) = 1.42314957671d+22	!SIN
    get_imass(50) = 1.35846095958d+22	!SIO
    get_imass(51) = 9.96204703694d+21	!SIS
    get_imass(52) = 1.24525587962d+22	!SO
    get_imass(53) = 2.390861778d+22	!C2H
    get_imass(54) = 1.57295479531d+22	!C2N
    get_imass(55) = 1.06736218253d+22	!C2S
    get_imass(56) = 1.66034117282d+22	!C3
    get_imass(57) = 1.49430705554d+22	!CCO
    get_imass(58) = 1.08677486506d+22	!CCP
    get_imass(59) = 4.26926052901d+22	!CH2
    get_imass(60) = 1.35846095958d+22	!CO2
    get_imass(61) = 3.32056849448d+22	!H2O
    get_imass(62) = 1.75797639028d+22	!H2S
    get_imass(63) = 2.21376292959d+22	!HCN
    get_imass(64) = 2.06109124864d+22	!HCO
    get_imass(65) = 1.35846095958d+22	!HCP
    get_imass(66) = 1.32826382992d+22	!HCS
    get_imass(67) = 1.45784956972d+22	!HCSI
    get_imass(68) = 2.21376292959d+22	!HNC
    get_imass(69) = 1.92811894332d+22	!HNO
    get_imass(70) = 1.39004309959d+22	!HNSI
    get_imass(71) = 1.24525587962d+22	!HPO
    get_imass(72) = 9.19569207095d+21	!HS2
    get_imass(73) = 1.35846095958d+22	!N2O
    get_imass(74) = 1.49430705554d+22	!NAOH
    get_imass(75) = 3.73562354659d+22	!NH2
    get_imass(76) = 1.2993974396d+22	!NO2
    get_imass(77) = 1.81126434248d+22	!O2H
    get_imass(78) = 1.42314957671d+22	!OCN
    get_imass(79) = 9.96204703694d+21	!OCS
    get_imass(80) = 1.81126434248d+22	!PH2
    get_imass(81) = 1.1494669658d+22	!SIC2
    get_imass(82) = 1.99236842041d+22	!SIH2
    get_imass(83) = 1.10689411522d+22	!SINC
    get_imass(84) = 9.96204703694d+21	!SIO2
    get_imass(85) = 9.33941909714d+21	!SO2
    get_imass(86) = 2.29887936331d+22	!C2H2
    get_imass(87) = 1.6154536142d+22	!C3H
    get_imass(88) = 1.6154536142d+22	!HC3
    get_imass(89) = 1.19544564443d+22	!C3N
    get_imass(90) = 1.1494669658d+22	!C3O
    get_imass(91) = 8.92127724094d+21	!C3P
    get_imass(92) = 8.79004150319d+21	!C3S
    get_imass(93) = 1.24525587962d+22	!C4
    get_imass(94) = 3.984572903d+22	!CH3
    get_imass(95) = 1.99236842041d+22	!H2CO
    get_imass(96) = 1.29938000645d+22	!H2CS
    get_imass(97) = 1.75797639028d+22	!H2O2
    get_imass(98) = 9.05632171242d+21	!H2S2
    get_imass(99) = 1.29938000645d+22	!H2SIO
    get_imass(100) = 1.06736218253d+22	!HCCP
    get_imass(101) = 3.51582514608d+22	!NH3
    get_imass(102) = 1.12777234366d+22	!SIC2H
    get_imass(103) = 9.33941909714d+21	!SIC3
    get_imass(104) = 1.42312866486d+22	!SICH2
    get_imass(105) = 1.92808055875d+22	!SIH3
    get_imass(106) = 1.49428400025d+22	!C2H2N
    get_imass(107) = 1.42312866486d+22	!C2H2O
    get_imass(108) = 2.21371232965d+22	!C2H3
    get_imass(109) = 1.57292924929d+22	!C3H2
    get_imass(110) = 1.57292924929d+22	!H2C3
    get_imass(111) = 1.21983481235d+22	!C4H
    get_imass(112) = 9.64069068091d+21	!C4N
    get_imass(113) = 7.56614122754d+21	!C4P
    get_imass(114) = 7.47153527771d+21	!C4S
    get_imass(115) = 9.96204703694d+21	!C5
    get_imass(116) = 1.29938000645d+22	!CH2O2
    get_imass(117) = 1.29938000645d+22	!CH2PH
    get_imass(118) = 2.06104738719d+22	!CH3N
    get_imass(119) = 3.73547946544d+22	!CH4
    get_imass(120) = 1.17199844248d+22	!HC3N
    get_imass(121) = 1.1068814648d+22	!SIC2H2
    get_imass(122) = 9.19569207095d+21	!SIC3H
    get_imass(123) = 7.86477397653d+21	!SIC4
    get_imass(124) = 1.39002314936d+22	!SICH3
    get_imass(125) = 1.86781177329d+22	!SIH4
    get_imass(126) = 1.45782762568d+22	!C2H3N
    get_imass(127) = 2.13463026451d+22	!C2H4
    get_imass(128) = 1.53258624221d+22	!C3H3
    get_imass(129) = 1.195430889d+22	!C4H2
    get_imass(130) = 9.79868522197d+21	!C5H
    get_imass(131) = 8.07733543536d+21	!C5N
    get_imass(132) = 8.30170586412d+21	!C6
    get_imass(133) = 1.86781177329d+22	!CH4O
    get_imass(134) = 1.35842285214d+22	!C2H4O
    get_imass(135) = 2.06100352762d+22	!C2H5
    get_imass(136) = 1.12775921152d+22	!C3H3N
    get_imass(137) = 1.49426094566d+22	!C3H4
    get_imass(138) = 9.64059471662d+21	!C5H2
    get_imass(139) = 8.18794925453d+21	!C6H
    get_imass(140) = 7.11574788353d+21	!C7
    get_imass(141) = 1.92804217571d+22	!CH5N
    get_imass(142) = 7.96960483943d+21	!HC5N
    get_imass(143) = 8.07726807098d+21	!C6H2
    get_imass(144) = 7.03200767389d+21	!C7H
    get_imass(145) = 6.0992124716d+21	!C7N
    get_imass(146) = 6.22627939809d+21	!C8
    get_imass(147) = 9.19560476126d+21	!CH3C3N
    get_imass(148) = 9.96184210203d+21	!HCOOCH3
    get_imass(149) = 1.29934514155d+22	!C2H5OH
    get_imass(150) = 6.95021549795d+21	!C7H2
    get_imass(151) = 6.16207134769d+21	!C8H
    get_imass(152) = 5.53447057608d+21	!C9
    get_imass(153) = 9.33923897833d+21	!CH3C4H
    get_imass(154) = 1.29934514155d+22	!CH3OCH3
    get_imass(155) = 6.03758544585d+21	!HC7N
    get_imass(156) = 1.0305236936d+22	!C2H6CO
    get_imass(157) = 6.09917406176d+21	!C8H2
    get_imass(158) = 5.48368009233d+21	!C9H
    get_imass(159) = 4.89936739522d+21	!C9N
    get_imass(160) = 6.71591691041d+21	!CH3C5N
    get_imass(161) = 5.43381335169d+21	!C9H2
    get_imass(162) = 6.79220952796d+21	!CH3C6H
    get_imass(163) = 5.28953916355d+21	!CH3C7N
    get_imass(164) = 4.8595229485d+21	!HC9N
    get_imass(165) = 1.17199844248d+22	!HCNC2
    get_imass(166) = 1.17199844248d+22	!HC2NC
    get_imass(167) = 1.17199844248d+22	!HNC3
    get_imass(168) = 1.3282456136d+22	!NH2CHO
    get_imass(169) = 1.17198426019d+22	!C4H3
    get_imass(170) = 1.42312866486d+22	!NH2CN
    get_imass(171) = 7.66293121103d+21	!C6H6
    get_imass(172) = 2.13467731375d+22	!H2CN
    get_imass(173) = 4.98102351847d+21	!C10
    get_imass(174) = 4.52820319861d+21	!C11
    get_imass(175) = 8.9211128894d+21	!SIC3H3
    get_imass(176) = 7.76260294589d+21	!SIC4H
    get_imass(177) = 5.91802966368d+21	!SIC6H
    get_imass(178) = 4.78177077327d+21	!SIC8H
    get_imass(179) = 1.08675047589d+22	!SIC2H3
    get_imass(180) = 1.423086843d+22	!C3H6
    get_imass(181) = 8.6624558974d+21	!SIC3H5
    get_imass(182) = 1.14943968165d+22	!C4H4
    get_imass(183) = 1.10685616483d+22	!C4H6
    get_imass(184) = 9.48761737348d+21	!HC4N
    get_imass(185) = 6.87035289844d+21	!HC6N
    get_imass(186) = 5.38487532029d+21	!HC8N
    get_imass(187) = 4.42756634044d+21	!HC10N
    get_imass(188) = 4.06613311218d+21	!HC11N
    get_imass(189) = 3.75925573702d+21	!HC12N
    get_imass(190) = 7.86477397653d+21	!NC4N
    get_imass(191) = 5.97722822217d+21	!NC6N
    get_imass(192) = 4.82034534046d+21	!NC8N
    get_imass(193) = 4.03866771768d+21	!NC10N
    get_imass(194) = 3.47513268731d+21	!NC12N
    get_imass(195) = 3.49544879293d+21	!HC13N
    get_imass(196) = 4.98124953791d+22	!C+
    get_imass(197) = 1.08679781932d+22	!FE+
    get_imass(198) = 5.97863863505d+23	!H+
    get_imass(199) = 1.4945104915d+23	!HE+
    get_imass(200) = 2.49056826281d+22	!MG+
    get_imass(201) = 4.26961478414d+22	!N+
    get_imass(202) = 2.5988912719d+22	!NA+
    get_imass(203) = 3.73589477335d+22	!O+
    get_imass(204) = 1.86791560251d+22	!S+
    get_imass(205) = 2.13476587776d+22	!SI+
    get_imass(206) = 1.99215623688d+23	!H3+
    get_imass(207) = 2.0611299469d+22	!HCO+
    get_imass(208) = 1.70782111742d+22	!CL+
    get_imass(209) = 1.92819119679d+22	!P+
    get_imass(210) = 2.13476587776d+22	!CO+
    get_imass(211) = 2.98850552203d+23	!H2+
    get_imass(212) = 1.99244556952d+22	!NO+
    get_imass(213) = 1.86791560251d+22	!O2+
    get_imass(214) = 4.2694265684d+22	!CH2+
    get_imass(215) = 1.7580045431d+22	!H2S+
    get_imass(216) = 1.32827990165d+22	!HCS+
    get_imass(217) = 1.92815280934d+22	!HNO+
    get_imass(218) = 3.73575067128d+22	!NH2+
    get_imass(219) = 9.96213744144d+21	!OCS+
    get_imass(220) = 2.298927506d+22	!C2H2+
    get_imass(221) = 3.98471753628d+22	!CH3+
    get_imass(222) = 3.515937751d+22	!NH3+
    get_imass(223) = 1.42314711428d+22	!C2H2O+
    get_imass(224) = 1.29939538681d+22	!CH2O2+
    get_imass(225) = 1.45784698576d+22	!C2H3N+
    get_imass(226) = 2.13467177355d+22	!C2H4+
    get_imass(227) = 1.19544390695d+22	!C4H2+
    get_imass(228) = 1.92811442342d+22	!H3CO+
    get_imass(229) = 1.86784355393d+22	!CH4O+
    get_imass(230) = 1.358439662d+22	!C2H4O+
    get_imass(231) = 1.49428128551d+22	!C3H4+
    get_imass(232) = 1.92807603903d+22	!CH5N+
    get_imass(233) = 1.29936052108d+22	!C2H5OH+
    get_imass(234) = 1.29936052108d+22	!CH3OCH3+
    get_imass(235) = 4.59795130141d+22	!CH+
    get_imass(236) = 1.27177376876d+22	!CCL+
    get_imass(237) = 2.49056826281d+22	!C2+
    get_imass(238) = 1.17202513802d+22	!CLO+
    get_imass(239) = 1.39008065245d+22	!CP+
    get_imass(240) = 1.92819119679d+22	!CF+
    get_imass(241) = 1.35847777039d+22	!CS+
    get_imass(242) = 2.29898207658d+22	!CN+
    get_imass(243) = 1.29941282037d+22	!NS+
    get_imass(244) = 1.86791560251d+22	!PH+
    get_imass(245) = 1.27177376876d+22	!PO+
    get_imass(246) = 1.49432739665d+22	!SIC+
    get_imass(247) = 1.42316802668d+22	!SIN+
    get_imass(248) = 9.96213744144d+21	!SIS+
    get_imass(249) = 1.24527000535d+22	!SO+
    get_imass(250) = 1.66036628534d+22	!C3+
    get_imass(251) = 1.0673725606d+22	!C2S+
    get_imass(252) = 1.49432739665d+22	!C2O+
    get_imass(253) = 1.08678562407d+22	!CCP+
    get_imass(254) = 2.39091385036d+22	!C2H+
    get_imass(255) = 2.0611299469d+22	!HOC+
    get_imass(256) = 1.57297733394d+22	!C2N+
    get_imass(257) = 1.57297733394d+22	!CNC+
    get_imass(258) = 1.35847777039d+22	!HCP+
    get_imass(259) = 1.14947900192d+22	!SIC2+
    get_imass(260) = 1.10690527628d+22	!SINC+
    get_imass(261) = 1.24527000535d+22	!HPO+
    get_imass(262) = 2.21380757326d+22	!HCN+
    get_imass(263) = 1.45786893038d+22	!CHSI+
    get_imass(264) = 1.99240458105d+22	!SIH2+
    get_imass(265) = 1.61547738721d+22	!C3H+
    get_imass(266) = 1.24527000535d+22	!C4+
    get_imass(267) = 1.14947900192d+22	!C3O+
    get_imass(268) = 8.79011188723d+21	!C3S+
    get_imass(269) = 1.99240458105d+22	!H2CO+
    get_imass(270) = 1.29939538681d+22	!H2SIO+
    get_imass(271) = 2.13471882461d+22	!HCNH+
    get_imass(272) = 1.12778392973d+22	!SIC2H+
    get_imass(273) = 9.33949855417d+21	!SIC3+
    get_imass(274) = 1.42314711428d+22	!CH2SI+
    get_imass(275) = 1.92811442342d+22	!SIH3+
    get_imass(276) = 1.49430434072d+22	!C2H2N+
    get_imass(277) = 2.21375697128d+22	!C2H3+
    get_imass(278) = 1.5729517872d+22	!C3H2+
    get_imass(279) = 1.5729517872d+22	!H2C3+
    get_imass(280) = 1.21984836723d+22	!C4H+
    get_imass(281) = 9.96213744144d+21	!C5+
    get_imass(282) = 7.47158613012d+21	!C4S+
    get_imass(283) = 1.0673725606d+22	!PC2H+
    get_imass(284) = 1.1954586627d+22	!C3N+
    get_imass(285) = 9.64077534691d+21	!C4N+
    get_imass(286) = 1.17201095508d+22	!C3HN+
    get_imass(287) = 2.21380757326d+22	!HNC+
    get_imass(288) = 9.19576910121d+21	!SIC3H+
    get_imass(289) = 7.86483032272d+21	!SIC4+
    get_imass(290) = 1.1068926256d+22	!SIC2H2+
    get_imass(291) = 1.3900407504d+22	!SICH3+
    get_imass(292) = 1.1494653594d+22	!HC2NCH+
    get_imass(293) = 1.53260763881d+22	!C3H3+
    get_imass(294) = 1.53260763881d+22	!H3C3+
    get_imass(295) = 9.79877268578d+21	!C5H+
    get_imass(296) = 8.30176864492d+21	!C6+
    get_imass(297) = 1.3900407504d+22	!C2H3O+
    get_imass(298) = 2.06104222259d+22	!C2H5+
    get_imass(299) = 1.12777079732d+22	!C3H3N+
    get_imass(300) = 9.64067938093d+21	!C5H2+
    get_imass(301) = 1.17199677249d+22	!C4H3+
    get_imass(302) = 8.18801032657d+21	!C6H+
    get_imass(303) = 7.11579400815d+21	!C7+
    get_imass(304) = 1.99236359426d+22	!CH4N+
    get_imass(305) = 7.96966269773d+21	!C5HN+
    get_imass(306) = 7.03205271928d+21	!C7H+
    get_imass(307) = 6.22631471223d+21	!C8+
    get_imass(308) = 9.96193250281d+21	!COOCH4+
    get_imass(309) = 1.32824346865d+22	!C2H5O+
    get_imass(310) = 6.16210593723d+21	!C8H+
    get_imass(311) = 5.53449847859d+21	!C9+
    get_imass(312) = 9.48760642948d+21	!C5H3+
    get_imass(313) = 8.07732750308d+21	!C6H2+
    get_imass(314) = 7.96959711733d+21	!C6H3+
    get_imass(315) = 1.03053336766d+22	!C2H6CO+
    get_imass(316) = 5.48370748505d+21	!C9H+
    get_imass(317) = 4.98104611949d+21	!C10+
    get_imass(318) = 6.87034715966d+21	!C7H3+
    get_imass(319) = 6.09920794878d+21	!C8H2+
    get_imass(320) = 6.03758101397d+21	!C8H3+
    get_imass(321) = 1.66036628534d+22	!HCL+
    get_imass(322) = 3.14605084306d+22	!F+
    get_imass(323) = 2.98869547661d+22	!HF+
    get_imass(324) = 1.81129422793d+22	!HS+
    get_imass(325) = 3.98488148599d+22	!NH+
    get_imass(326) = 3.51606539365d+22	!OH+
    get_imass(327) = 1.32829811891d+22	!PN+
    get_imass(328) = 9.33949855417d+21	!S2+
    get_imass(329) = 2.0611299469d+22	!SIH+
    get_imass(330) = 1.35847777039d+22	!SIO+
    get_imass(331) = 3.32066893916d+22	!H2O+
    get_imass(332) = 1.39006070114d+22	!HNSI+
    get_imass(333) = 9.19576910121d+21	!S2H+
    get_imass(334) = 1.81129422793d+22	!PH2+
    get_imass(335) = 1.29939538681d+22	!H2CS+
    get_imass(336) = 9.05639642542d+21	!H2S2+
    get_imass(337) = 1.32827990165d+22	!HSIO+
    get_imass(338) = 7.56619337591d+21	!C4P+
    get_imass(339) = 1.32827990165d+22	!HCO2+
    get_imass(340) = 1.29939538681d+22	!PCH3+
    get_imass(341) = 3.73560658032d+22	!CH4+
    get_imass(342) = 1.53263189187d+22	!C2NH+
    get_imass(343) = 1.86784355393d+22	!SIH4+
    get_imass(344) = 3.32055508891d+22	!NH4+
    get_imass(345) = 2.13471882461d+22	!H2NC+
    get_imass(346) = 1.1494653594d+22	!C3H2N+
    get_imass(347) = 6.95025950155d+21	!C7H2+
    get_imass(348) = 9.3393184323d+21	!C5H4+
    get_imass(349) = 6.03761865195d+21	!C7HN+
    get_imass(350) = 5.43384024848d+21	!C9H2+
    get_imass(351) = 6.79225155355d+21	!C7H4+
    get_imass(352) = 4.85954446037d+21	!C9HN+
    get_imass(353) = 2.13476587776d+22	!N2+
    get_imass(354) = 1.35847777039d+22	!CO2+
    get_imass(355) = 1.1955020503d+23	!HEH+
    get_imass(356) = 9.33949855417d+21	!SO2+
    get_imass(357) = 7.76253340286d+21	!C6H5+
    get_imass(358) = 9.19559448057d+21	!C5H5+
    get_imass(359) = 2.0611299469d+22	!N2H+
    get_imass(360) = 1.29941282037d+22	!NO2+
    get_imass(361) = 1.04864087027d+22	!PC2H2+
    get_imass(362) = 1.27175706894d+22	!PNH2+
    get_imass(363) = 1.32827990165d+22	!PCH2+
    get_imass(364) = 1.04864087027d+22	!HC2S+
    get_imass(365) = 8.66267921475d+21	!HC3S+
    get_imass(366) = 1.27174036956d+22	!H3CS+
    get_imass(367) = 7.37931559335d+21	!HC4S+
    get_imass(368) = 1.27177376876d+22	!SIF+
    get_imass(369) = 1.35845871593d+22	!SINH2+
    get_imass(370) = 1.08676123442d+22	!SIC2H3+
    get_imass(371) = 9.05639642542d+21	!SIC3H2+
    get_imass(372) = 1.45786893038d+22	!C2HO+
    get_imass(373) = 3.14584646656d+22	!H3O+
    get_imass(374) = 1.7077608896d+22	!H3S+
    get_imass(375) = 9.79877268578d+21	!HOCS+
    get_imass(376) = 1.81122648102d+22	!CH5O+
    get_imass(377) = 1.42316802668d+22	!NCO+
    get_imass(378) = 1.39006070114d+22	!HNCO+
    get_imass(379) = 1.14947900192d+22	!C2N2+
    get_imass(380) = 1.81129422793d+22	!O2H+
    get_imass(381) = 3.51581011761d+22	!CH5+
    get_imass(382) = 1.61547738721d+22	!H2CL+
    get_imass(383) = 2.84633112838d+22	!H2F+
    get_imass(384) = 1.27174036956d+22	!CH3O2+
    get_imass(385) = 1.21984836723d+22	!H2PO+
    get_imass(386) = 1.24525399433d+22	!PNH3+
    get_imass(387) = 1.27174036956d+22	!PCH4+
    get_imass(388) = 1.03055529879d+22	!PC2H3+
    get_imass(389) = 9.79877268578d+21	!HSIS+
    get_imass(390) = 1.21984836723d+22	!HSO+
    get_imass(391) = 1.27175706894d+22	!HNS+
    get_imass(392) = 1.29941282037d+22	!HPN+
    get_imass(393) = 1.86787957752d+22	!H2NO+
    get_imass(394) = 1.45786893038d+22	!NAH2O+
    get_imass(395) = 1.7580045431d+22	!PH3+
    get_imass(396) = 1.08677342911d+22	!SINCH+
    get_imass(397) = 9.79877268578d+21	!HSIO2+
    get_imass(398) = 9.19576910121d+21	!HSO2+
    get_imass(399) = 1.12778392973d+22	!HC3O+
    get_imass(400) = 8.79011188723d+21	!PC3H+
    get_imass(401) = 8.92118538815d+21	!H3S2+
    get_imass(402) = 1.27174036956d+22	!H3SIO+
    get_imass(403) = 7.47158613012d+21	!PC4H+
    get_imass(404) = 1.3900407504d+22	!NH2CNH+
    get_imass(405) = 7.7626578376d+21	!SIC4H+
    get_imass(406) = 1.358439662d+22	!SICH4+
    get_imass(407) = 1.81122648102d+22	!SIH5+
    get_imass(408) = 1.42312620251d+22	!C2H4N+
    get_imass(409) = 1.29937795371d+22	!NH2CH2O+
    get_imass(410) = 1.99232260916d+22	!C2H6+
    get_imass(411) = 1.10687997522d+22	!C3H4N+
    get_imass(412) = 1.45782504179d+22	!C3H5+
    get_imass(413) = 1.1494517172d+22	!C4H4+
    get_imass(414) = 1.86780753172d+22	!CH6N+
    get_imass(415) = 7.86476645625d+21	!C5H2N+
    get_imass(416) = 9.05631174081d+21	!C4H4N+
    get_imass(417) = 9.79857441337d+21	!H5C2O2+
    get_imass(418) = 1.27170697212d+22	!C2H5OH2+
    get_imass(419) = 1.27170697212d+22	!CH3OCH4+
    get_imass(420) = 5.97722387845d+21	!C7H2N+
    get_imass(421) = 1.01306178897d+22	!C3H6OH+
    get_imass(422) = 6.64131378704d+21	!C6H4N+
    get_imass(423) = 5.38487179486d+21	!C9H3+
    get_imass(424) = 6.71591142673d+21	!C7H5+
    get_imass(425) = 5.24315092394d+21	!C8H4N+
    get_imass(426) = 4.82034251546d+21	!C9H2N+
    get_imass(427) = 7.56595694786d+21	!C6H7+
    get_imass(428) = 2.39091385036d+22	!NAH2+
    get_imass(429) = 1.01308298276d+22	!PC2H4+
    get_imass(430) = 1.12775766521d+22	!C4H5+
    get_imass(431) = 1.21984836723d+22	!H2CCL+
    get_imass(432) = 7.37931559335d+21	!PC4H2+
    get_imass(433) = 7.86470259082d+21	!C6H4+
    get_imass(434) = 5.97718698969d+21	!C8H4+
    get_imass(435) = 5.33677804235d+21	!C9H4+
    get_imass(436) = 1.08673684585d+22	!C4H7+
    get_imass(437) = 9.48769937218d+21	!HC4N+
    get_imass(438) = 9.19576910121d+21	!HC4O+
    get_imass(439) = 8.07739486845d+21	!C5N+
    get_imass(440) = 9.33940849236d+21	!H2C4N+
    get_imass(441) = 9.19568179006d+21	!H3C4N+
    get_imass(442) = 6.09924635905d+21	!C7N+
    get_imass(443) = 7.76259561973d+21	!C5H3N+
    get_imass(444) = 4.89938926129d+21	!C9N+
    get_imass(445) = 5.91802540558d+21	!C7H3N+
    get_imass(446) = 4.7817679933d+21	!C9H3N+
    get_imass(447) = 9.64067938093d+21	!OCS+H2
    get_imass(448) = 1.1068926256d+22	!H2C3O+
    get_imass(449) = 1.08676123442d+22	!H3C3O+
    get_imass(450) = 7.66304533348d+21	!C5H4N+
    get_imass(451) = 5.91798924389d+21	!C8H5+
    get_imass(452) = 5.28953576184d+21	!C9H5+
    get_imass(453) = 1.49471398286d+23	!HE++
    get_imass(454) = 0.d0	!dust_C_1
    get_imass(455) = 0.d0	!dust_C_2
    get_imass(456) = 0.d0	!dust_C_3
    get_imass(457) = 0.d0	!dust_C_4
    get_imass(458) = 0.d0	!dust_C_5
    get_imass(459) = 0.d0	!dust_C_6
    get_imass(460) = 0.d0	!dust_C_7
    get_imass(461) = 0.d0	!dust_C_8
    get_imass(462) = 0.d0	!dust_C_9
    get_imass(463) = 0.d0	!dust_C_10
    get_imass(464) = 0.d0	!dust_Si_1
    get_imass(465) = 0.d0	!dust_Si_2
    get_imass(466) = 0.d0	!dust_Si_3
    get_imass(467) = 0.d0	!dust_Si_4
    get_imass(468) = 0.d0	!dust_Si_5
    get_imass(469) = 0.d0	!dust_Si_6
    get_imass(470) = 0.d0	!dust_Si_7
    get_imass(471) = 0.d0	!dust_Si_8
    get_imass(472) = 0.d0	!dust_Si_9
    get_imass(473) = 0.d0	!dust_Si_10
    get_imass(474) = 0.d0	!CR
    get_imass(475) = 0.d0	!g
    get_imass(476) = 0.d0	!Tgas
    get_imass(477) = 0.d0	!dummy

  end function get_imass

  !************************
  !species binding energies (surface=BARE), K
  function get_EbindBare()
    use krome_commons
    implicit none
    real*8::get_EbindBare(nspec)

    get_EbindBare(:) = 1d99

    get_EbindBare(idx_H) = 500.0d0
    get_EbindBare(idx_O) = 1700.0d0
    get_EbindBare(idx_H2) = 300.0d0
    get_EbindBare(idx_CO) = 1100.0d0
    get_EbindBare(idx_O2) = 1250.0d0
    get_EbindBare(idx_OH) = 1360.0d0
    get_EbindBare(idx_CO2) = 2300.0d0
    get_EbindBare(idx_H2O) = 4800.0d0
    get_EbindBare(idx_HCO) = 1100.0d0
    get_EbindBare(idx_H2CO) = 1100.0d0
    get_EbindBare(idx_H2O2) = 6000.0d0

  end function get_EbindBare

  !************************
  !species binding energies (surface=ICE), K
  function get_EbindIce()
    use krome_commons
    implicit none
    real*8::get_EbindIce(nspec)

    get_EbindIce(:) = 1d99

    get_EbindIce(idx_H) = 650.0d0
    get_EbindIce(idx_O) = 1700.0d0
    get_EbindIce(idx_H2) = 300.0d0
    get_EbindIce(idx_CO) = 1300.0d0
    get_EbindIce(idx_O2) = 900.0d0
    get_EbindIce(idx_OH) = 3500.0d0
    get_EbindIce(idx_CO2) = 2300.0d0
    get_EbindIce(idx_H2O) = 4800.0d0
    get_EbindIce(idx_HCO) = 3100.0d0
    get_EbindIce(idx_H2CO) = 3100.0d0
    get_EbindIce(idx_H2O2) = 5000.0d0

  end function get_EbindIce

  !************************
  function get_kevap70()
    use krome_commons
    implicit none
    real*8::get_kevap70(nspec)

    get_kevap70(idx_E) = 0d0
    get_kevap70(idx_GRAINk) = 0d0
    get_kevap70(idx_Hk) = 0d0
    get_kevap70(idx_Ck) = 0d0
    get_kevap70(idx_CNk) = 0d0
    get_kevap70(idx_Ok) = 0d0
    get_kevap70(idx_OHk) = 0d0
    get_kevap70(idx_Sk) = 0d0
    get_kevap70(idx_GRAIN0) = 0d0
    get_kevap70(idx_C) = 0d0
    get_kevap70(idx_FE) = 0d0
    get_kevap70(idx_H) = 790490323.12
    get_kevap70(idx_HE) = 0d0
    get_kevap70(idx_MG) = 0d0
    get_kevap70(idx_N) = 0d0
    get_kevap70(idx_NA) = 0d0
    get_kevap70(idx_O) = 28.3692788833
    get_kevap70(idx_S) = 0d0
    get_kevap70(idx_SI) = 0d0
    get_kevap70(idx_H2) = 13763786733.1
    get_kevap70(idx_CO) = 149751.929641
    get_kevap70(idx_CL) = 0d0
    get_kevap70(idx_P) = 0d0
    get_kevap70(idx_C2) = 0d0
    get_kevap70(idx_CCL) = 0d0
    get_kevap70(idx_CH) = 0d0
    get_kevap70(idx_CLO) = 0d0
    get_kevap70(idx_CN) = 0d0
    get_kevap70(idx_CP) = 0d0
    get_kevap70(idx_CS) = 0d0
    get_kevap70(idx_HCL) = 0d0
    get_kevap70(idx_HF) = 0d0
    get_kevap70(idx_F) = 0d0
    get_kevap70(idx_HS) = 0d0
    get_kevap70(idx_MGH) = 0d0
    get_kevap70(idx_N2) = 0d0
    get_kevap70(idx_NAH) = 0d0
    get_kevap70(idx_NH) = 0d0
    get_kevap70(idx_NO) = 0d0
    get_kevap70(idx_NS) = 0d0
    get_kevap70(idx_O2) = 17568.7715065
    get_kevap70(idx_OH) = 3649.88043081
    get_kevap70(idx_PH) = 0d0
    get_kevap70(idx_PN) = 0d0
    get_kevap70(idx_PO) = 0d0
    get_kevap70(idx_S2) = 0d0
    get_kevap70(idx_SIC) = 0d0
    get_kevap70(idx_SIH) = 0d0
    get_kevap70(idx_SIN) = 0d0
    get_kevap70(idx_SIO) = 0d0
    get_kevap70(idx_SIS) = 0d0
    get_kevap70(idx_SO) = 0d0
    get_kevap70(idx_C2H) = 0d0
    get_kevap70(idx_C2N) = 0d0
    get_kevap70(idx_C2S) = 0d0
    get_kevap70(idx_C3) = 0d0
    get_kevap70(idx_CCO) = 0d0
    get_kevap70(idx_CCP) = 0d0
    get_kevap70(idx_CH2) = 0d0
    get_kevap70(idx_CO2) = 0.00537432797219
    get_kevap70(idx_H2O) = 1.65884938156e-18
    get_kevap70(idx_H2S) = 0d0
    get_kevap70(idx_HCN) = 0d0
    get_kevap70(idx_HCO) = 149751.929641
    get_kevap70(idx_HCP) = 0d0
    get_kevap70(idx_HCS) = 0d0
    get_kevap70(idx_HCSI) = 0d0
    get_kevap70(idx_HNC) = 0d0
    get_kevap70(idx_HNO) = 0d0
    get_kevap70(idx_HNSI) = 0d0
    get_kevap70(idx_HPO) = 0d0
    get_kevap70(idx_HS2) = 0d0
    get_kevap70(idx_N2O) = 0d0
    get_kevap70(idx_NAOH) = 0d0
    get_kevap70(idx_NH2) = 0d0
    get_kevap70(idx_NO2) = 0d0
    get_kevap70(idx_O2H) = 0d0
    get_kevap70(idx_OCN) = 0d0
    get_kevap70(idx_OCS) = 0d0
    get_kevap70(idx_PH2) = 0d0
    get_kevap70(idx_SIC2) = 0d0
    get_kevap70(idx_SIH2) = 0d0
    get_kevap70(idx_SINC) = 0d0
    get_kevap70(idx_SIO2) = 0d0
    get_kevap70(idx_SO2) = 0d0
    get_kevap70(idx_C2H2) = 0d0
    get_kevap70(idx_C3H) = 0d0
    get_kevap70(idx_HC3) = 0d0
    get_kevap70(idx_C3N) = 0d0
    get_kevap70(idx_C3O) = 0d0
    get_kevap70(idx_C3P) = 0d0
    get_kevap70(idx_C3S) = 0d0
    get_kevap70(idx_C4) = 0d0
    get_kevap70(idx_CH3) = 0d0
    get_kevap70(idx_H2CO) = 149751.929641
    get_kevap70(idx_H2CS) = 0d0
    get_kevap70(idx_H2O2) = 5.95331269142e-26
    get_kevap70(idx_H2S2) = 0d0
    get_kevap70(idx_H2SIO) = 0d0
    get_kevap70(idx_HCCP) = 0d0
    get_kevap70(idx_NH3) = 0d0
    get_kevap70(idx_SIC2H) = 0d0
    get_kevap70(idx_SIC3) = 0d0
    get_kevap70(idx_SICH2) = 0d0
    get_kevap70(idx_SIH3) = 0d0
    get_kevap70(idx_C2H2N) = 0d0
    get_kevap70(idx_C2H2O) = 0d0
    get_kevap70(idx_C2H3) = 0d0
    get_kevap70(idx_C3H2) = 0d0
    get_kevap70(idx_H2C3) = 0d0
    get_kevap70(idx_C4H) = 0d0
    get_kevap70(idx_C4N) = 0d0
    get_kevap70(idx_C4P) = 0d0
    get_kevap70(idx_C4S) = 0d0
    get_kevap70(idx_C5) = 0d0
    get_kevap70(idx_CH2O2) = 0d0
    get_kevap70(idx_CH2PH) = 0d0
    get_kevap70(idx_CH3N) = 0d0
    get_kevap70(idx_CH4) = 0d0
    get_kevap70(idx_HC3N) = 0d0
    get_kevap70(idx_SIC2H2) = 0d0
    get_kevap70(idx_SIC3H) = 0d0
    get_kevap70(idx_SIC4) = 0d0
    get_kevap70(idx_SICH3) = 0d0
    get_kevap70(idx_SIH4) = 0d0
    get_kevap70(idx_C2H3N) = 0d0
    get_kevap70(idx_C2H4) = 0d0
    get_kevap70(idx_C3H3) = 0d0
    get_kevap70(idx_C4H2) = 0d0
    get_kevap70(idx_C5H) = 0d0
    get_kevap70(idx_C5N) = 0d0
    get_kevap70(idx_C6) = 0d0
    get_kevap70(idx_CH4O) = 0d0
    get_kevap70(idx_C2H4O) = 0d0
    get_kevap70(idx_C2H5) = 0d0
    get_kevap70(idx_C3H3N) = 0d0
    get_kevap70(idx_C3H4) = 0d0
    get_kevap70(idx_C5H2) = 0d0
    get_kevap70(idx_C6H) = 0d0
    get_kevap70(idx_C7) = 0d0
    get_kevap70(idx_CH5N) = 0d0
    get_kevap70(idx_HC5N) = 0d0
    get_kevap70(idx_C6H2) = 0d0
    get_kevap70(idx_C7H) = 0d0
    get_kevap70(idx_C7N) = 0d0
    get_kevap70(idx_C8) = 0d0
    get_kevap70(idx_CH3C3N) = 0d0
    get_kevap70(idx_HCOOCH3) = 0d0
    get_kevap70(idx_C2H5OH) = 0d0
    get_kevap70(idx_C7H2) = 0d0
    get_kevap70(idx_C8H) = 0d0
    get_kevap70(idx_C9) = 0d0
    get_kevap70(idx_CH3C4H) = 0d0
    get_kevap70(idx_CH3OCH3) = 0d0
    get_kevap70(idx_HC7N) = 0d0
    get_kevap70(idx_C2H6CO) = 0d0
    get_kevap70(idx_C8H2) = 0d0
    get_kevap70(idx_C9H) = 0d0
    get_kevap70(idx_C9N) = 0d0
    get_kevap70(idx_CH3C5N) = 0d0
    get_kevap70(idx_C9H2) = 0d0
    get_kevap70(idx_CH3C6H) = 0d0
    get_kevap70(idx_CH3C7N) = 0d0
    get_kevap70(idx_HC9N) = 0d0
    get_kevap70(idx_HCNC2) = 0d0
    get_kevap70(idx_HC2NC) = 0d0
    get_kevap70(idx_HNC3) = 0d0
    get_kevap70(idx_NH2CHO) = 0d0
    get_kevap70(idx_C4H3) = 0d0
    get_kevap70(idx_NH2CN) = 0d0
    get_kevap70(idx_C6H6) = 0d0
    get_kevap70(idx_H2CN) = 0d0
    get_kevap70(idx_C10) = 0d0
    get_kevap70(idx_C11) = 0d0
    get_kevap70(idx_SIC3H3) = 0d0
    get_kevap70(idx_SIC4H) = 0d0
    get_kevap70(idx_SIC6H) = 0d0
    get_kevap70(idx_SIC8H) = 0d0
    get_kevap70(idx_SIC2H3) = 0d0
    get_kevap70(idx_C3H6) = 0d0
    get_kevap70(idx_SIC3H5) = 0d0
    get_kevap70(idx_C4H4) = 0d0
    get_kevap70(idx_C4H6) = 0d0
    get_kevap70(idx_HC4N) = 0d0
    get_kevap70(idx_HC6N) = 0d0
    get_kevap70(idx_HC8N) = 0d0
    get_kevap70(idx_HC10N) = 0d0
    get_kevap70(idx_HC11N) = 0d0
    get_kevap70(idx_HC12N) = 0d0
    get_kevap70(idx_NC4N) = 0d0
    get_kevap70(idx_NC6N) = 0d0
    get_kevap70(idx_NC8N) = 0d0
    get_kevap70(idx_NC10N) = 0d0
    get_kevap70(idx_NC12N) = 0d0
    get_kevap70(idx_HC13N) = 0d0
    get_kevap70(idx_Cj) = 0d0
    get_kevap70(idx_FEj) = 0d0
    get_kevap70(idx_Hj) = 0d0
    get_kevap70(idx_HEj) = 0d0
    get_kevap70(idx_MGj) = 0d0
    get_kevap70(idx_Nj) = 0d0
    get_kevap70(idx_NAj) = 0d0
    get_kevap70(idx_Oj) = 0d0
    get_kevap70(idx_Sj) = 0d0
    get_kevap70(idx_SIj) = 0d0
    get_kevap70(idx_H3j) = 0d0
    get_kevap70(idx_HCOj) = 0d0
    get_kevap70(idx_CLj) = 0d0
    get_kevap70(idx_Pj) = 0d0
    get_kevap70(idx_COj) = 0d0
    get_kevap70(idx_H2j) = 0d0
    get_kevap70(idx_NOj) = 0d0
    get_kevap70(idx_O2j) = 0d0
    get_kevap70(idx_CH2j) = 0d0
    get_kevap70(idx_H2Sj) = 0d0
    get_kevap70(idx_HCSj) = 0d0
    get_kevap70(idx_HNOj) = 0d0
    get_kevap70(idx_NH2j) = 0d0
    get_kevap70(idx_OCSj) = 0d0
    get_kevap70(idx_C2H2j) = 0d0
    get_kevap70(idx_CH3j) = 0d0
    get_kevap70(idx_NH3j) = 0d0
    get_kevap70(idx_C2H2Oj) = 0d0
    get_kevap70(idx_CH2O2j) = 0d0
    get_kevap70(idx_C2H3Nj) = 0d0
    get_kevap70(idx_C2H4j) = 0d0
    get_kevap70(idx_C4H2j) = 0d0
    get_kevap70(idx_H3COj) = 0d0
    get_kevap70(idx_CH4Oj) = 0d0
    get_kevap70(idx_C2H4Oj) = 0d0
    get_kevap70(idx_C3H4j) = 0d0
    get_kevap70(idx_CH5Nj) = 0d0
    get_kevap70(idx_C2H5OHj) = 0d0
    get_kevap70(idx_CH3OCH3j) = 0d0
    get_kevap70(idx_CHj) = 0d0
    get_kevap70(idx_CCLj) = 0d0
    get_kevap70(idx_C2j) = 0d0
    get_kevap70(idx_CLOj) = 0d0
    get_kevap70(idx_CPj) = 0d0
    get_kevap70(idx_CFj) = 0d0
    get_kevap70(idx_CSj) = 0d0
    get_kevap70(idx_CNj) = 0d0
    get_kevap70(idx_NSj) = 0d0
    get_kevap70(idx_PHj) = 0d0
    get_kevap70(idx_POj) = 0d0
    get_kevap70(idx_SICj) = 0d0
    get_kevap70(idx_SINj) = 0d0
    get_kevap70(idx_SISj) = 0d0
    get_kevap70(idx_SOj) = 0d0
    get_kevap70(idx_C3j) = 0d0
    get_kevap70(idx_C2Sj) = 0d0
    get_kevap70(idx_C2Oj) = 0d0
    get_kevap70(idx_CCPj) = 0d0
    get_kevap70(idx_C2Hj) = 0d0
    get_kevap70(idx_HOCj) = 0d0
    get_kevap70(idx_C2Nj) = 0d0
    get_kevap70(idx_CNCj) = 0d0
    get_kevap70(idx_HCPj) = 0d0
    get_kevap70(idx_SIC2j) = 0d0
    get_kevap70(idx_SINCj) = 0d0
    get_kevap70(idx_HPOj) = 0d0
    get_kevap70(idx_HCNj) = 0d0
    get_kevap70(idx_CHSIj) = 0d0
    get_kevap70(idx_SIH2j) = 0d0
    get_kevap70(idx_C3Hj) = 0d0
    get_kevap70(idx_C4j) = 0d0
    get_kevap70(idx_C3Oj) = 0d0
    get_kevap70(idx_C3Sj) = 0d0
    get_kevap70(idx_H2COj) = 0d0
    get_kevap70(idx_H2SIOj) = 0d0
    get_kevap70(idx_HCNHj) = 0d0
    get_kevap70(idx_SIC2Hj) = 0d0
    get_kevap70(idx_SIC3j) = 0d0
    get_kevap70(idx_CH2SIj) = 0d0
    get_kevap70(idx_SIH3j) = 0d0
    get_kevap70(idx_C2H2Nj) = 0d0
    get_kevap70(idx_C2H3j) = 0d0
    get_kevap70(idx_C3H2j) = 0d0
    get_kevap70(idx_H2C3j) = 0d0
    get_kevap70(idx_C4Hj) = 0d0
    get_kevap70(idx_C5j) = 0d0
    get_kevap70(idx_C4Sj) = 0d0
    get_kevap70(idx_PC2Hj) = 0d0
    get_kevap70(idx_C3Nj) = 0d0
    get_kevap70(idx_C4Nj) = 0d0
    get_kevap70(idx_C3HNj) = 0d0
    get_kevap70(idx_HNCj) = 0d0
    get_kevap70(idx_SIC3Hj) = 0d0
    get_kevap70(idx_SIC4j) = 0d0
    get_kevap70(idx_SIC2H2j) = 0d0
    get_kevap70(idx_SICH3j) = 0d0
    get_kevap70(idx_HC2NCHj) = 0d0
    get_kevap70(idx_C3H3j) = 0d0
    get_kevap70(idx_H3C3j) = 0d0
    get_kevap70(idx_C5Hj) = 0d0
    get_kevap70(idx_C6j) = 0d0
    get_kevap70(idx_C2H3Oj) = 0d0
    get_kevap70(idx_C2H5j) = 0d0
    get_kevap70(idx_C3H3Nj) = 0d0
    get_kevap70(idx_C5H2j) = 0d0
    get_kevap70(idx_C4H3j) = 0d0
    get_kevap70(idx_C6Hj) = 0d0
    get_kevap70(idx_C7j) = 0d0
    get_kevap70(idx_CH4Nj) = 0d0
    get_kevap70(idx_C5HNj) = 0d0
    get_kevap70(idx_C7Hj) = 0d0
    get_kevap70(idx_C8j) = 0d0
    get_kevap70(idx_COOCH4j) = 0d0
    get_kevap70(idx_C2H5Oj) = 0d0
    get_kevap70(idx_C8Hj) = 0d0
    get_kevap70(idx_C9j) = 0d0
    get_kevap70(idx_C5H3j) = 0d0
    get_kevap70(idx_C6H2j) = 0d0
    get_kevap70(idx_C6H3j) = 0d0
    get_kevap70(idx_C2H6COj) = 0d0
    get_kevap70(idx_C9Hj) = 0d0
    get_kevap70(idx_C10j) = 0d0
    get_kevap70(idx_C7H3j) = 0d0
    get_kevap70(idx_C8H2j) = 0d0
    get_kevap70(idx_C8H3j) = 0d0
    get_kevap70(idx_HCLj) = 0d0
    get_kevap70(idx_Fj) = 0d0
    get_kevap70(idx_HFj) = 0d0
    get_kevap70(idx_HSj) = 0d0
    get_kevap70(idx_NHj) = 0d0
    get_kevap70(idx_OHj) = 0d0
    get_kevap70(idx_PNj) = 0d0
    get_kevap70(idx_S2j) = 0d0
    get_kevap70(idx_SIHj) = 0d0
    get_kevap70(idx_SIOj) = 0d0
    get_kevap70(idx_H2Oj) = 0d0
    get_kevap70(idx_HNSIj) = 0d0
    get_kevap70(idx_S2Hj) = 0d0
    get_kevap70(idx_PH2j) = 0d0
    get_kevap70(idx_H2CSj) = 0d0
    get_kevap70(idx_H2S2j) = 0d0
    get_kevap70(idx_HSIOj) = 0d0
    get_kevap70(idx_C4Pj) = 0d0
    get_kevap70(idx_HCO2j) = 0d0
    get_kevap70(idx_PCH3j) = 0d0
    get_kevap70(idx_CH4j) = 0d0
    get_kevap70(idx_C2NHj) = 0d0
    get_kevap70(idx_SIH4j) = 0d0
    get_kevap70(idx_NH4j) = 0d0
    get_kevap70(idx_H2NCj) = 0d0
    get_kevap70(idx_C3H2Nj) = 0d0
    get_kevap70(idx_C7H2j) = 0d0
    get_kevap70(idx_C5H4j) = 0d0
    get_kevap70(idx_C7HNj) = 0d0
    get_kevap70(idx_C9H2j) = 0d0
    get_kevap70(idx_C7H4j) = 0d0
    get_kevap70(idx_C9HNj) = 0d0
    get_kevap70(idx_N2j) = 0d0
    get_kevap70(idx_CO2j) = 0d0
    get_kevap70(idx_HEHj) = 0d0
    get_kevap70(idx_SO2j) = 0d0
    get_kevap70(idx_C6H5j) = 0d0
    get_kevap70(idx_C5H5j) = 0d0
    get_kevap70(idx_N2Hj) = 0d0
    get_kevap70(idx_NO2j) = 0d0
    get_kevap70(idx_PC2H2j) = 0d0
    get_kevap70(idx_PNH2j) = 0d0
    get_kevap70(idx_PCH2j) = 0d0
    get_kevap70(idx_HC2Sj) = 0d0
    get_kevap70(idx_HC3Sj) = 0d0
    get_kevap70(idx_H3CSj) = 0d0
    get_kevap70(idx_HC4Sj) = 0d0
    get_kevap70(idx_SIFj) = 0d0
    get_kevap70(idx_SINH2j) = 0d0
    get_kevap70(idx_SIC2H3j) = 0d0
    get_kevap70(idx_SIC3H2j) = 0d0
    get_kevap70(idx_C2HOj) = 0d0
    get_kevap70(idx_H3Oj) = 0d0
    get_kevap70(idx_H3Sj) = 0d0
    get_kevap70(idx_HOCSj) = 0d0
    get_kevap70(idx_CH5Oj) = 0d0
    get_kevap70(idx_NCOj) = 0d0
    get_kevap70(idx_HNCOj) = 0d0
    get_kevap70(idx_C2N2j) = 0d0
    get_kevap70(idx_O2Hj) = 0d0
    get_kevap70(idx_CH5j) = 0d0
    get_kevap70(idx_H2CLj) = 0d0
    get_kevap70(idx_H2Fj) = 0d0
    get_kevap70(idx_CH3O2j) = 0d0
    get_kevap70(idx_H2POj) = 0d0
    get_kevap70(idx_PNH3j) = 0d0
    get_kevap70(idx_PCH4j) = 0d0
    get_kevap70(idx_PC2H3j) = 0d0
    get_kevap70(idx_HSISj) = 0d0
    get_kevap70(idx_HSOj) = 0d0
    get_kevap70(idx_HNSj) = 0d0
    get_kevap70(idx_HPNj) = 0d0
    get_kevap70(idx_H2NOj) = 0d0
    get_kevap70(idx_NAH2Oj) = 0d0
    get_kevap70(idx_PH3j) = 0d0
    get_kevap70(idx_SINCHj) = 0d0
    get_kevap70(idx_HSIO2j) = 0d0
    get_kevap70(idx_HSO2j) = 0d0
    get_kevap70(idx_HC3Oj) = 0d0
    get_kevap70(idx_PC3Hj) = 0d0
    get_kevap70(idx_H3S2j) = 0d0
    get_kevap70(idx_H3SIOj) = 0d0
    get_kevap70(idx_PC4Hj) = 0d0
    get_kevap70(idx_NH2CNHj) = 0d0
    get_kevap70(idx_SIC4Hj) = 0d0
    get_kevap70(idx_SICH4j) = 0d0
    get_kevap70(idx_SIH5j) = 0d0
    get_kevap70(idx_C2H4Nj) = 0d0
    get_kevap70(idx_NH2CH2Oj) = 0d0
    get_kevap70(idx_C2H6j) = 0d0
    get_kevap70(idx_C3H4Nj) = 0d0
    get_kevap70(idx_C3H5j) = 0d0
    get_kevap70(idx_C4H4j) = 0d0
    get_kevap70(idx_CH6Nj) = 0d0
    get_kevap70(idx_C5H2Nj) = 0d0
    get_kevap70(idx_C4H4Nj) = 0d0
    get_kevap70(idx_H5C2O2j) = 0d0
    get_kevap70(idx_C2H5OH2j) = 0d0
    get_kevap70(idx_CH3OCH4j) = 0d0
    get_kevap70(idx_C7H2Nj) = 0d0
    get_kevap70(idx_C3H6OHj) = 0d0
    get_kevap70(idx_C6H4Nj) = 0d0
    get_kevap70(idx_C9H3j) = 0d0
    get_kevap70(idx_C7H5j) = 0d0
    get_kevap70(idx_C8H4Nj) = 0d0
    get_kevap70(idx_C9H2Nj) = 0d0
    get_kevap70(idx_C6H7j) = 0d0
    get_kevap70(idx_NAH2j) = 0d0
    get_kevap70(idx_PC2H4j) = 0d0
    get_kevap70(idx_C4H5j) = 0d0
    get_kevap70(idx_H2CCLj) = 0d0
    get_kevap70(idx_PC4H2j) = 0d0
    get_kevap70(idx_C6H4j) = 0d0
    get_kevap70(idx_C8H4j) = 0d0
    get_kevap70(idx_C9H4j) = 0d0
    get_kevap70(idx_C4H7j) = 0d0
    get_kevap70(idx_HC4Nj) = 0d0
    get_kevap70(idx_HC4Oj) = 0d0
    get_kevap70(idx_C5Nj) = 0d0
    get_kevap70(idx_H2C4Nj) = 0d0
    get_kevap70(idx_H3C4Nj) = 0d0
    get_kevap70(idx_C7Nj) = 0d0
    get_kevap70(idx_C5H3Nj) = 0d0
    get_kevap70(idx_C9Nj) = 0d0
    get_kevap70(idx_C7H3Nj) = 0d0
    get_kevap70(idx_C9H3Nj) = 0d0
    get_kevap70(idx_OCSjH2) = 0d0
    get_kevap70(idx_H2C3Oj) = 0d0
    get_kevap70(idx_H3C3Oj) = 0d0
    get_kevap70(idx_C5H4Nj) = 0d0
    get_kevap70(idx_C8H5j) = 0d0
    get_kevap70(idx_C9H5j) = 0d0
    get_kevap70(idx_HEjj) = 0d0
    get_kevap70(idx_dust_C_1) = 0d0
    get_kevap70(idx_dust_C_2) = 0d0
    get_kevap70(idx_dust_C_3) = 0d0
    get_kevap70(idx_dust_C_4) = 0d0
    get_kevap70(idx_dust_C_5) = 0d0
    get_kevap70(idx_dust_C_6) = 0d0
    get_kevap70(idx_dust_C_7) = 0d0
    get_kevap70(idx_dust_C_8) = 0d0
    get_kevap70(idx_dust_C_9) = 0d0
    get_kevap70(idx_dust_C_10) = 0d0
    get_kevap70(idx_dust_Si_1) = 0d0
    get_kevap70(idx_dust_Si_2) = 0d0
    get_kevap70(idx_dust_Si_3) = 0d0
    get_kevap70(idx_dust_Si_4) = 0d0
    get_kevap70(idx_dust_Si_5) = 0d0
    get_kevap70(idx_dust_Si_6) = 0d0
    get_kevap70(idx_dust_Si_7) = 0d0
    get_kevap70(idx_dust_Si_8) = 0d0
    get_kevap70(idx_dust_Si_9) = 0d0
    get_kevap70(idx_dust_Si_10) = 0d0
    get_kevap70(idx_CR) = 0d0
    get_kevap70(idx_g) = 0d0
    get_kevap70(idx_Tgas) = 0d0
    get_kevap70(idx_dummy) = 0d0

  end function get_kevap70

  !************************
  !get verbatim reaction names
  function get_rnames()
    use krome_commons
    implicit none
    character*50::get_rnames(nrea)

    !reaction names are loaded from file
    get_rnames(:) = reactionNames(:)

  end function get_rnames

  !************************
  !get species names
  function get_names()
    use krome_commons
    implicit none
    character*16::get_names(nspec)

    get_names(1) = "E"
    get_names(2) = "GRAIN-"
    get_names(3) = "H-"
    get_names(4) = "C-"
    get_names(5) = "CN-"
    get_names(6) = "O-"
    get_names(7) = "OH-"
    get_names(8) = "S-"
    get_names(9) = "GRAIN0"
    get_names(10) = "C"
    get_names(11) = "FE"
    get_names(12) = "H"
    get_names(13) = "HE"
    get_names(14) = "MG"
    get_names(15) = "N"
    get_names(16) = "NA"
    get_names(17) = "O"
    get_names(18) = "S"
    get_names(19) = "SI"
    get_names(20) = "H2"
    get_names(21) = "CO"
    get_names(22) = "CL"
    get_names(23) = "P"
    get_names(24) = "C2"
    get_names(25) = "CCL"
    get_names(26) = "CH"
    get_names(27) = "CLO"
    get_names(28) = "CN"
    get_names(29) = "CP"
    get_names(30) = "CS"
    get_names(31) = "HCL"
    get_names(32) = "HF"
    get_names(33) = "F"
    get_names(34) = "HS"
    get_names(35) = "MGH"
    get_names(36) = "N2"
    get_names(37) = "NAH"
    get_names(38) = "NH"
    get_names(39) = "NO"
    get_names(40) = "NS"
    get_names(41) = "O2"
    get_names(42) = "OH"
    get_names(43) = "PH"
    get_names(44) = "PN"
    get_names(45) = "PO"
    get_names(46) = "S2"
    get_names(47) = "SIC"
    get_names(48) = "SIH"
    get_names(49) = "SIN"
    get_names(50) = "SIO"
    get_names(51) = "SIS"
    get_names(52) = "SO"
    get_names(53) = "C2H"
    get_names(54) = "C2N"
    get_names(55) = "C2S"
    get_names(56) = "C3"
    get_names(57) = "CCO"
    get_names(58) = "CCP"
    get_names(59) = "CH2"
    get_names(60) = "CO2"
    get_names(61) = "H2O"
    get_names(62) = "H2S"
    get_names(63) = "HCN"
    get_names(64) = "HCO"
    get_names(65) = "HCP"
    get_names(66) = "HCS"
    get_names(67) = "HCSI"
    get_names(68) = "HNC"
    get_names(69) = "HNO"
    get_names(70) = "HNSI"
    get_names(71) = "HPO"
    get_names(72) = "HS2"
    get_names(73) = "N2O"
    get_names(74) = "NAOH"
    get_names(75) = "NH2"
    get_names(76) = "NO2"
    get_names(77) = "O2H"
    get_names(78) = "OCN"
    get_names(79) = "OCS"
    get_names(80) = "PH2"
    get_names(81) = "SIC2"
    get_names(82) = "SIH2"
    get_names(83) = "SINC"
    get_names(84) = "SIO2"
    get_names(85) = "SO2"
    get_names(86) = "C2H2"
    get_names(87) = "C3H"
    get_names(88) = "HC3"
    get_names(89) = "C3N"
    get_names(90) = "C3O"
    get_names(91) = "C3P"
    get_names(92) = "C3S"
    get_names(93) = "C4"
    get_names(94) = "CH3"
    get_names(95) = "H2CO"
    get_names(96) = "H2CS"
    get_names(97) = "H2O2"
    get_names(98) = "H2S2"
    get_names(99) = "H2SIO"
    get_names(100) = "HCCP"
    get_names(101) = "NH3"
    get_names(102) = "SIC2H"
    get_names(103) = "SIC3"
    get_names(104) = "SICH2"
    get_names(105) = "SIH3"
    get_names(106) = "C2H2N"
    get_names(107) = "C2H2O"
    get_names(108) = "C2H3"
    get_names(109) = "C3H2"
    get_names(110) = "H2C3"
    get_names(111) = "C4H"
    get_names(112) = "C4N"
    get_names(113) = "C4P"
    get_names(114) = "C4S"
    get_names(115) = "C5"
    get_names(116) = "CH2O2"
    get_names(117) = "CH2PH"
    get_names(118) = "CH3N"
    get_names(119) = "CH4"
    get_names(120) = "HC3N"
    get_names(121) = "SIC2H2"
    get_names(122) = "SIC3H"
    get_names(123) = "SIC4"
    get_names(124) = "SICH3"
    get_names(125) = "SIH4"
    get_names(126) = "C2H3N"
    get_names(127) = "C2H4"
    get_names(128) = "C3H3"
    get_names(129) = "C4H2"
    get_names(130) = "C5H"
    get_names(131) = "C5N"
    get_names(132) = "C6"
    get_names(133) = "CH4O"
    get_names(134) = "C2H4O"
    get_names(135) = "C2H5"
    get_names(136) = "C3H3N"
    get_names(137) = "C3H4"
    get_names(138) = "C5H2"
    get_names(139) = "C6H"
    get_names(140) = "C7"
    get_names(141) = "CH5N"
    get_names(142) = "HC5N"
    get_names(143) = "C6H2"
    get_names(144) = "C7H"
    get_names(145) = "C7N"
    get_names(146) = "C8"
    get_names(147) = "CH3C3N"
    get_names(148) = "HCOOCH3"
    get_names(149) = "C2H5OH"
    get_names(150) = "C7H2"
    get_names(151) = "C8H"
    get_names(152) = "C9"
    get_names(153) = "CH3C4H"
    get_names(154) = "CH3OCH3"
    get_names(155) = "HC7N"
    get_names(156) = "C2H6CO"
    get_names(157) = "C8H2"
    get_names(158) = "C9H"
    get_names(159) = "C9N"
    get_names(160) = "CH3C5N"
    get_names(161) = "C9H2"
    get_names(162) = "CH3C6H"
    get_names(163) = "CH3C7N"
    get_names(164) = "HC9N"
    get_names(165) = "HCNC2"
    get_names(166) = "HC2NC"
    get_names(167) = "HNC3"
    get_names(168) = "NH2CHO"
    get_names(169) = "C4H3"
    get_names(170) = "NH2CN"
    get_names(171) = "C6H6"
    get_names(172) = "H2CN"
    get_names(173) = "C10"
    get_names(174) = "C11"
    get_names(175) = "SIC3H3"
    get_names(176) = "SIC4H"
    get_names(177) = "SIC6H"
    get_names(178) = "SIC8H"
    get_names(179) = "SIC2H3"
    get_names(180) = "C3H6"
    get_names(181) = "SIC3H5"
    get_names(182) = "C4H4"
    get_names(183) = "C4H6"
    get_names(184) = "HC4N"
    get_names(185) = "HC6N"
    get_names(186) = "HC8N"
    get_names(187) = "HC10N"
    get_names(188) = "HC11N"
    get_names(189) = "HC12N"
    get_names(190) = "NC4N"
    get_names(191) = "NC6N"
    get_names(192) = "NC8N"
    get_names(193) = "NC10N"
    get_names(194) = "NC12N"
    get_names(195) = "HC13N"
    get_names(196) = "C+"
    get_names(197) = "FE+"
    get_names(198) = "H+"
    get_names(199) = "HE+"
    get_names(200) = "MG+"
    get_names(201) = "N+"
    get_names(202) = "NA+"
    get_names(203) = "O+"
    get_names(204) = "S+"
    get_names(205) = "SI+"
    get_names(206) = "H3+"
    get_names(207) = "HCO+"
    get_names(208) = "CL+"
    get_names(209) = "P+"
    get_names(210) = "CO+"
    get_names(211) = "H2+"
    get_names(212) = "NO+"
    get_names(213) = "O2+"
    get_names(214) = "CH2+"
    get_names(215) = "H2S+"
    get_names(216) = "HCS+"
    get_names(217) = "HNO+"
    get_names(218) = "NH2+"
    get_names(219) = "OCS+"
    get_names(220) = "C2H2+"
    get_names(221) = "CH3+"
    get_names(222) = "NH3+"
    get_names(223) = "C2H2O+"
    get_names(224) = "CH2O2+"
    get_names(225) = "C2H3N+"
    get_names(226) = "C2H4+"
    get_names(227) = "C4H2+"
    get_names(228) = "H3CO+"
    get_names(229) = "CH4O+"
    get_names(230) = "C2H4O+"
    get_names(231) = "C3H4+"
    get_names(232) = "CH5N+"
    get_names(233) = "C2H5OH+"
    get_names(234) = "CH3OCH3+"
    get_names(235) = "CH+"
    get_names(236) = "CCL+"
    get_names(237) = "C2+"
    get_names(238) = "CLO+"
    get_names(239) = "CP+"
    get_names(240) = "CF+"
    get_names(241) = "CS+"
    get_names(242) = "CN+"
    get_names(243) = "NS+"
    get_names(244) = "PH+"
    get_names(245) = "PO+"
    get_names(246) = "SIC+"
    get_names(247) = "SIN+"
    get_names(248) = "SIS+"
    get_names(249) = "SO+"
    get_names(250) = "C3+"
    get_names(251) = "C2S+"
    get_names(252) = "C2O+"
    get_names(253) = "CCP+"
    get_names(254) = "C2H+"
    get_names(255) = "HOC+"
    get_names(256) = "C2N+"
    get_names(257) = "CNC+"
    get_names(258) = "HCP+"
    get_names(259) = "SIC2+"
    get_names(260) = "SINC+"
    get_names(261) = "HPO+"
    get_names(262) = "HCN+"
    get_names(263) = "CHSI+"
    get_names(264) = "SIH2+"
    get_names(265) = "C3H+"
    get_names(266) = "C4+"
    get_names(267) = "C3O+"
    get_names(268) = "C3S+"
    get_names(269) = "H2CO+"
    get_names(270) = "H2SIO+"
    get_names(271) = "HCNH+"
    get_names(272) = "SIC2H+"
    get_names(273) = "SIC3+"
    get_names(274) = "CH2SI+"
    get_names(275) = "SIH3+"
    get_names(276) = "C2H2N+"
    get_names(277) = "C2H3+"
    get_names(278) = "C3H2+"
    get_names(279) = "H2C3+"
    get_names(280) = "C4H+"
    get_names(281) = "C5+"
    get_names(282) = "C4S+"
    get_names(283) = "PC2H+"
    get_names(284) = "C3N+"
    get_names(285) = "C4N+"
    get_names(286) = "C3HN+"
    get_names(287) = "HNC+"
    get_names(288) = "SIC3H+"
    get_names(289) = "SIC4+"
    get_names(290) = "SIC2H2+"
    get_names(291) = "SICH3+"
    get_names(292) = "HC2NCH+"
    get_names(293) = "C3H3+"
    get_names(294) = "H3C3+"
    get_names(295) = "C5H+"
    get_names(296) = "C6+"
    get_names(297) = "C2H3O+"
    get_names(298) = "C2H5+"
    get_names(299) = "C3H3N+"
    get_names(300) = "C5H2+"
    get_names(301) = "C4H3+"
    get_names(302) = "C6H+"
    get_names(303) = "C7+"
    get_names(304) = "CH4N+"
    get_names(305) = "C5HN+"
    get_names(306) = "C7H+"
    get_names(307) = "C8+"
    get_names(308) = "COOCH4+"
    get_names(309) = "C2H5O+"
    get_names(310) = "C8H+"
    get_names(311) = "C9+"
    get_names(312) = "C5H3+"
    get_names(313) = "C6H2+"
    get_names(314) = "C6H3+"
    get_names(315) = "C2H6CO+"
    get_names(316) = "C9H+"
    get_names(317) = "C10+"
    get_names(318) = "C7H3+"
    get_names(319) = "C8H2+"
    get_names(320) = "C8H3+"
    get_names(321) = "HCL+"
    get_names(322) = "F+"
    get_names(323) = "HF+"
    get_names(324) = "HS+"
    get_names(325) = "NH+"
    get_names(326) = "OH+"
    get_names(327) = "PN+"
    get_names(328) = "S2+"
    get_names(329) = "SIH+"
    get_names(330) = "SIO+"
    get_names(331) = "H2O+"
    get_names(332) = "HNSI+"
    get_names(333) = "S2H+"
    get_names(334) = "PH2+"
    get_names(335) = "H2CS+"
    get_names(336) = "H2S2+"
    get_names(337) = "HSIO+"
    get_names(338) = "C4P+"
    get_names(339) = "HCO2+"
    get_names(340) = "PCH3+"
    get_names(341) = "CH4+"
    get_names(342) = "C2NH+"
    get_names(343) = "SIH4+"
    get_names(344) = "NH4+"
    get_names(345) = "H2NC+"
    get_names(346) = "C3H2N+"
    get_names(347) = "C7H2+"
    get_names(348) = "C5H4+"
    get_names(349) = "C7HN+"
    get_names(350) = "C9H2+"
    get_names(351) = "C7H4+"
    get_names(352) = "C9HN+"
    get_names(353) = "N2+"
    get_names(354) = "CO2+"
    get_names(355) = "HEH+"
    get_names(356) = "SO2+"
    get_names(357) = "C6H5+"
    get_names(358) = "C5H5+"
    get_names(359) = "N2H+"
    get_names(360) = "NO2+"
    get_names(361) = "PC2H2+"
    get_names(362) = "PNH2+"
    get_names(363) = "PCH2+"
    get_names(364) = "HC2S+"
    get_names(365) = "HC3S+"
    get_names(366) = "H3CS+"
    get_names(367) = "HC4S+"
    get_names(368) = "SIF+"
    get_names(369) = "SINH2+"
    get_names(370) = "SIC2H3+"
    get_names(371) = "SIC3H2+"
    get_names(372) = "C2HO+"
    get_names(373) = "H3O+"
    get_names(374) = "H3S+"
    get_names(375) = "HOCS+"
    get_names(376) = "CH5O+"
    get_names(377) = "NCO+"
    get_names(378) = "HNCO+"
    get_names(379) = "C2N2+"
    get_names(380) = "O2H+"
    get_names(381) = "CH5+"
    get_names(382) = "H2CL+"
    get_names(383) = "H2F+"
    get_names(384) = "CH3O2+"
    get_names(385) = "H2PO+"
    get_names(386) = "PNH3+"
    get_names(387) = "PCH4+"
    get_names(388) = "PC2H3+"
    get_names(389) = "HSIS+"
    get_names(390) = "HSO+"
    get_names(391) = "HNS+"
    get_names(392) = "HPN+"
    get_names(393) = "H2NO+"
    get_names(394) = "NAH2O+"
    get_names(395) = "PH3+"
    get_names(396) = "SINCH+"
    get_names(397) = "HSIO2+"
    get_names(398) = "HSO2+"
    get_names(399) = "HC3O+"
    get_names(400) = "PC3H+"
    get_names(401) = "H3S2+"
    get_names(402) = "H3SIO+"
    get_names(403) = "PC4H+"
    get_names(404) = "NH2CNH+"
    get_names(405) = "SIC4H+"
    get_names(406) = "SICH4+"
    get_names(407) = "SIH5+"
    get_names(408) = "C2H4N+"
    get_names(409) = "NH2CH2O+"
    get_names(410) = "C2H6+"
    get_names(411) = "C3H4N+"
    get_names(412) = "C3H5+"
    get_names(413) = "C4H4+"
    get_names(414) = "CH6N+"
    get_names(415) = "C5H2N+"
    get_names(416) = "C4H4N+"
    get_names(417) = "H5C2O2+"
    get_names(418) = "C2H5OH2+"
    get_names(419) = "CH3OCH4+"
    get_names(420) = "C7H2N+"
    get_names(421) = "C3H6OH+"
    get_names(422) = "C6H4N+"
    get_names(423) = "C9H3+"
    get_names(424) = "C7H5+"
    get_names(425) = "C8H4N+"
    get_names(426) = "C9H2N+"
    get_names(427) = "C6H7+"
    get_names(428) = "NAH2+"
    get_names(429) = "PC2H4+"
    get_names(430) = "C4H5+"
    get_names(431) = "H2CCL+"
    get_names(432) = "PC4H2+"
    get_names(433) = "C6H4+"
    get_names(434) = "C8H4+"
    get_names(435) = "C9H4+"
    get_names(436) = "C4H7+"
    get_names(437) = "HC4N+"
    get_names(438) = "HC4O+"
    get_names(439) = "C5N+"
    get_names(440) = "H2C4N+"
    get_names(441) = "H3C4N+"
    get_names(442) = "C7N+"
    get_names(443) = "C5H3N+"
    get_names(444) = "C9N+"
    get_names(445) = "C7H3N+"
    get_names(446) = "C9H3N+"
    get_names(447) = "OCS+H2"
    get_names(448) = "H2C3O+"
    get_names(449) = "H3C3O+"
    get_names(450) = "C5H4N+"
    get_names(451) = "C8H5+"
    get_names(452) = "C9H5+"
    get_names(453) = "HE++"
    get_names(454) = "dust_C_1"
    get_names(455) = "dust_C_2"
    get_names(456) = "dust_C_3"
    get_names(457) = "dust_C_4"
    get_names(458) = "dust_C_5"
    get_names(459) = "dust_C_6"
    get_names(460) = "dust_C_7"
    get_names(461) = "dust_C_8"
    get_names(462) = "dust_C_9"
    get_names(463) = "dust_C_10"
    get_names(464) = "dust_Si_1"
    get_names(465) = "dust_Si_2"
    get_names(466) = "dust_Si_3"
    get_names(467) = "dust_Si_4"
    get_names(468) = "dust_Si_5"
    get_names(469) = "dust_Si_6"
    get_names(470) = "dust_Si_7"
    get_names(471) = "dust_Si_8"
    get_names(472) = "dust_Si_9"
    get_names(473) = "dust_Si_10"
    get_names(474) = "CR"
    get_names(475) = "g"
    get_names(476) = "Tgas"
    get_names(477) = "dummy"

  end function get_names

  !************************
  !get cooling names list (empty element if cooling not present)
  function get_cooling_names()
    use krome_commons
    implicit none
    character*16::get_cooling_names(ncools)

    get_cooling_names(:) = ""

    get_cooling_names(idx_cool_h2) = "H2"
    get_cooling_names(idx_cool_h2gp) = "H2GP"
    get_cooling_names(idx_cool_atomic) = "ATOMIC"
    get_cooling_names(idx_cool_cen) = "CEN"
    get_cooling_names(idx_cool_hd) = "HD"
    get_cooling_names(idx_cool_metal) = "METAL"
    get_cooling_names(idx_cool_z) = "Z"
    get_cooling_names(idx_cool_dh) = "DH"
    get_cooling_names(idx_cool_enthalpic) = "ENTHALPIC"
    get_cooling_names(idx_cool_dust) = "DUST"
    get_cooling_names(idx_cool_compton) = "COMPTON"
    get_cooling_names(idx_cool_cie) = "CIE"
    get_cooling_names(idx_cool_cont) = "CONT"
    get_cooling_names(idx_cool_continuum) = "CONTINUUM"
    get_cooling_names(idx_cool_expansion) = "EXPANSION"
    get_cooling_names(idx_cool_exp) = "EXP"
    get_cooling_names(idx_cool_ff) = "FF"
    get_cooling_names(idx_cool_bss) = "BSS"
    get_cooling_names(idx_cool_custom) = "CUSTOM"
    get_cooling_names(idx_cool_co) = "CO"
    get_cooling_names(idx_cool_zcie) = "ZCIE"
    get_cooling_names(idx_cool_zcienouv) = "ZCIENOUV"
    get_cooling_names(idx_cool_zextend) = "ZEXTEND"
    get_cooling_names(idx_cool_gh) = "GH"

  end function get_cooling_names

  !************************
  !get heating names list (empty element if heating not present)
  function get_heating_names()
    use krome_commons
    implicit none
    character*16::get_heating_names(nheats)

    get_heating_names(:) = ""

    get_heating_names(idx_heat_chem) = "CHEM"
    get_heating_names(idx_heat_compress) = "COMPRESS"
    get_heating_names(idx_heat_compr) = "COMPR"
    get_heating_names(idx_heat_photo) = "PHOTO"
    get_heating_names(idx_heat_dh) = "DH"
    get_heating_names(idx_heat_enthalpic) = "ENTHALPIC"
    get_heating_names(idx_heat_av) = "AV"
    get_heating_names(idx_heat_photoav) = "PHOTOAV"
    get_heating_names(idx_heat_cr) = "CR"
    get_heating_names(idx_heat_dust) = "DUST"
    get_heating_names(idx_heat_xray) = "XRAY"
    get_heating_names(idx_heat_viscous) = "VISCOUS"
    get_heating_names(idx_heat_visc) = "VISC"
    get_heating_names(idx_heat_custom) = "CUSTOM"
    get_heating_names(idx_heat_zcie) = "ZCIE"

  end function get_heating_names

  !******************************
  !get the total number of H nuclei
  function get_Hnuclei(n)
    use krome_commons
    real*8::n(:),get_Hnuclei,nH

    nH = n(idx_Hk) + &
        n(idx_OHk) + &
        n(idx_H) + &
        n(idx_H2)*2d0 + &
        n(idx_CH) + &
        n(idx_HCL) + &
        n(idx_HF) + &
        n(idx_HS) + &
        n(idx_MGH) + &
        n(idx_NAH) + &
        n(idx_NH) + &
        n(idx_OH) + &
        n(idx_PH) + &
        n(idx_SIH) + &
        n(idx_C2H) + &
        n(idx_CH2)*2d0 + &
        n(idx_H2O)*2d0 + &
        n(idx_H2S)*2d0 + &
        n(idx_HCN) + &
        n(idx_HCO) + &
        n(idx_HCP) + &
        n(idx_HCS) + &
        n(idx_HCSI) + &
        n(idx_HNC) + &
        n(idx_HNO) + &
        n(idx_HNSI) + &
        n(idx_HPO) + &
        n(idx_HS2) + &
        n(idx_NAOH) + &
        n(idx_NH2)*2d0 + &
        n(idx_O2H) + &
        n(idx_PH2)*2d0 + &
        n(idx_SIH2)*2d0 + &
        n(idx_C2H2)*2d0 + &
        n(idx_C3H) + &
        n(idx_HC3) + &
        n(idx_CH3)*3d0 + &
        n(idx_H2CO)*2d0 + &
        n(idx_H2CS)*2d0 + &
        n(idx_H2O2)*2d0 + &
        n(idx_H2S2)*2d0 + &
        n(idx_H2SIO)*2d0 + &
        n(idx_HCCP) + &
        n(idx_NH3)*3d0 + &
        n(idx_SIC2H) + &
        n(idx_SICH2)*2d0 + &
        n(idx_SIH3)*3d0 + &
        n(idx_C2H2N)*2d0 + &
        n(idx_C2H2O)*2d0 + &
        n(idx_C2H3)*3d0 + &
        n(idx_C3H2)*2d0 + &
        n(idx_H2C3)*2d0 + &
        n(idx_C4H) + &
        n(idx_CH2O2)*2d0 + &
        n(idx_CH2PH)*3d0 + &
        n(idx_CH3N)*3d0 + &
        n(idx_CH4)*4d0 + &
        n(idx_HC3N) + &
        n(idx_SIC2H2)*2d0 + &
        n(idx_SIC3H) + &
        n(idx_SICH3)*3d0 + &
        n(idx_SIH4)*4d0 + &
        n(idx_C2H3N)*3d0 + &
        n(idx_C2H4)*4d0 + &
        n(idx_C3H3)*3d0 + &
        n(idx_C4H2)*2d0 + &
        n(idx_C5H) + &
        n(idx_CH4O)*4d0 + &
        n(idx_C2H4O)*4d0 + &
        n(idx_C2H5)*5d0 + &
        n(idx_C3H3N)*3d0 + &
        n(idx_C3H4)*4d0 + &
        n(idx_C5H2)*2d0 + &
        n(idx_C6H) + &
        n(idx_CH5N)*5d0 + &
        n(idx_HC5N) + &
        n(idx_C6H2)*2d0 + &
        n(idx_C7H) + &
        n(idx_CH3C3N)*3d0 + &
        n(idx_HCOOCH3)*4d0 + &
        n(idx_C2H5OH)*6d0 + &
        n(idx_C7H2)*2d0 + &
        n(idx_C8H) + &
        n(idx_CH3C4H)*4d0 + &
        n(idx_CH3OCH3)*6d0 + &
        n(idx_HC7N) + &
        n(idx_C2H6CO)*6d0 + &
        n(idx_C8H2)*2d0 + &
        n(idx_C9H) + &
        n(idx_CH3C5N)*3d0 + &
        n(idx_C9H2)*2d0 + &
        n(idx_CH3C6H)*4d0 + &
        n(idx_CH3C7N)*3d0 + &
        n(idx_HC9N) + &
        n(idx_HCNC2) + &
        n(idx_HC2NC) + &
        n(idx_HNC3) + &
        n(idx_NH2CHO)*3d0 + &
        n(idx_C4H3)*3d0 + &
        n(idx_NH2CN)*2d0 + &
        n(idx_C6H6)*6d0 + &
        n(idx_H2CN)*2d0 + &
        n(idx_SIC3H3)*3d0 + &
        n(idx_SIC4H) + &
        n(idx_SIC6H) + &
        n(idx_SIC8H) + &
        n(idx_SIC2H3)*3d0 + &
        n(idx_C3H6)*6d0 + &
        n(idx_SIC3H5)*5d0 + &
        n(idx_C4H4)*4d0 + &
        n(idx_C4H6)*6d0 + &
        n(idx_HC4N) + &
        n(idx_HC6N) + &
        n(idx_HC8N) + &
        n(idx_HC10N) + &
        n(idx_HC11N) + &
        n(idx_HC12N) + &
        n(idx_HC13N) + &
        n(idx_Hj) + &
        n(idx_H3j)*3d0 + &
        n(idx_HCOj) + &
        n(idx_H2j)*2d0 + &
        n(idx_CH2j)*2d0 + &
        n(idx_H2Sj)*2d0 + &
        n(idx_HCSj) + &
        n(idx_HNOj) + &
        n(idx_NH2j)*2d0 + &
        n(idx_C2H2j)*2d0 + &
        n(idx_CH3j)*3d0 + &
        n(idx_NH3j)*3d0 + &
        n(idx_C2H2Oj)*2d0 + &
        n(idx_CH2O2j)*2d0 + &
        n(idx_C2H3Nj)*3d0 + &
        n(idx_C2H4j)*4d0 + &
        n(idx_C4H2j)*2d0 + &
        n(idx_H3COj)*3d0 + &
        n(idx_CH4Oj)*4d0 + &
        n(idx_C2H4Oj)*4d0 + &
        n(idx_C3H4j)*4d0 + &
        n(idx_CH5Nj)*5d0 + &
        n(idx_C2H5OHj)*6d0 + &
        n(idx_CH3OCH3j)*6d0 + &
        n(idx_CHj) + &
        n(idx_PHj) + &
        n(idx_C2Hj) + &
        n(idx_HOCj) + &
        n(idx_HCPj) + &
        n(idx_HPOj) + &
        n(idx_HCNj) + &
        n(idx_CHSIj) + &
        n(idx_SIH2j)*2d0 + &
        n(idx_C3Hj) + &
        n(idx_H2COj)*2d0 + &
        n(idx_H2SIOj)*2d0 + &
        n(idx_HCNHj)*2d0 + &
        n(idx_SIC2Hj) + &
        n(idx_CH2SIj)*2d0 + &
        n(idx_SIH3j)*3d0 + &
        n(idx_C2H2Nj)*2d0 + &
        n(idx_C2H3j)*3d0 + &
        n(idx_C3H2j)*2d0 + &
        n(idx_H2C3j)*2d0 + &
        n(idx_C4Hj) + &
        n(idx_PC2Hj) + &
        n(idx_C3HNj) + &
        n(idx_HNCj) + &
        n(idx_SIC3Hj) + &
        n(idx_SIC2H2j)*2d0 + &
        n(idx_SICH3j)*3d0 + &
        n(idx_HC2NCHj)*2d0 + &
        n(idx_C3H3j)*3d0 + &
        n(idx_H3C3j)*3d0 + &
        n(idx_C5Hj) + &
        n(idx_C2H3Oj)*3d0 + &
        n(idx_C2H5j)*5d0 + &
        n(idx_C3H3Nj)*3d0 + &
        n(idx_C5H2j)*2d0 + &
        n(idx_C4H3j)*3d0 + &
        n(idx_C6Hj) + &
        n(idx_CH4Nj)*4d0 + &
        n(idx_C5HNj) + &
        n(idx_C7Hj) + &
        n(idx_COOCH4j)*4d0 + &
        n(idx_C2H5Oj)*5d0 + &
        n(idx_C8Hj) + &
        n(idx_C5H3j)*3d0 + &
        n(idx_C6H2j)*2d0 + &
        n(idx_C6H3j)*3d0 + &
        n(idx_C2H6COj)*6d0 + &
        n(idx_C9Hj) + &
        n(idx_C7H3j)*3d0 + &
        n(idx_C8H2j)*2d0 + &
        n(idx_C8H3j)*3d0 + &
        n(idx_HCLj) + &
        n(idx_HFj) + &
        n(idx_HSj) + &
        n(idx_NHj) + &
        n(idx_OHj) + &
        n(idx_SIHj) + &
        n(idx_H2Oj)*2d0 + &
        n(idx_HNSIj) + &
        n(idx_S2Hj) + &
        n(idx_PH2j)*2d0 + &
        n(idx_H2CSj)*2d0 + &
        n(idx_H2S2j)*2d0 + &
        n(idx_HSIOj) + &
        n(idx_HCO2j) + &
        n(idx_PCH3j)*3d0 + &
        n(idx_CH4j)*4d0 + &
        n(idx_C2NHj) + &
        n(idx_SIH4j)*4d0 + &
        n(idx_NH4j)*4d0 + &
        n(idx_H2NCj)*2d0 + &
        n(idx_C3H2Nj)*2d0 + &
        n(idx_C7H2j)*2d0 + &
        n(idx_C5H4j)*4d0 + &
        n(idx_C7HNj) + &
        n(idx_C9H2j)*2d0 + &
        n(idx_C7H4j)*4d0 + &
        n(idx_C9HNj) + &
        n(idx_HEHj) + &
        n(idx_C6H5j)*5d0 + &
        n(idx_C5H5j)*5d0 + &
        n(idx_N2Hj) + &
        n(idx_PC2H2j)*2d0 + &
        n(idx_PNH2j)*2d0 + &
        n(idx_PCH2j)*2d0 + &
        n(idx_HC2Sj) + &
        n(idx_HC3Sj) + &
        n(idx_H3CSj)*3d0 + &
        n(idx_HC4Sj) + &
        n(idx_SINH2j)*2d0 + &
        n(idx_SIC2H3j)*3d0 + &
        n(idx_SIC3H2j)*2d0 + &
        n(idx_C2HOj) + &
        n(idx_H3Oj)*3d0 + &
        n(idx_H3Sj)*3d0 + &
        n(idx_HOCSj) + &
        n(idx_CH5Oj)*5d0 + &
        n(idx_HNCOj) + &
        n(idx_O2Hj) + &
        n(idx_CH5j)*5d0 + &
        n(idx_H2CLj)*2d0 + &
        n(idx_H2Fj)*2d0 + &
        n(idx_CH3O2j)*3d0 + &
        n(idx_H2POj)*2d0 + &
        n(idx_PNH3j)*3d0 + &
        n(idx_PCH4j)*4d0 + &
        n(idx_PC2H3j)*3d0 + &
        n(idx_HSISj) + &
        n(idx_HSOj) + &
        n(idx_HNSj) + &
        n(idx_HPNj) + &
        n(idx_H2NOj)*2d0 + &
        n(idx_NAH2Oj)*2d0 + &
        n(idx_PH3j)*3d0 + &
        n(idx_SINCHj) + &
        n(idx_HSIO2j) + &
        n(idx_HSO2j) + &
        n(idx_HC3Oj) + &
        n(idx_PC3Hj) + &
        n(idx_H3S2j)*3d0 + &
        n(idx_H3SIOj)*3d0 + &
        n(idx_PC4Hj) + &
        n(idx_NH2CNHj)*3d0 + &
        n(idx_SIC4Hj) + &
        n(idx_SICH4j)*4d0 + &
        n(idx_SIH5j)*5d0 + &
        n(idx_C2H4Nj)*4d0 + &
        n(idx_NH2CH2Oj)*4d0 + &
        n(idx_C2H6j)*6d0 + &
        n(idx_C3H4Nj)*4d0 + &
        n(idx_C3H5j)*5d0 + &
        n(idx_C4H4j)*4d0 + &
        n(idx_CH6Nj)*6d0 + &
        n(idx_C5H2Nj)*2d0 + &
        n(idx_C4H4Nj)*4d0 + &
        n(idx_H5C2O2j)*5d0 + &
        n(idx_C2H5OH2j)*7d0 + &
        n(idx_CH3OCH4j)*7d0 + &
        n(idx_C7H2Nj)*2d0 + &
        n(idx_C3H6OHj)*7d0 + &
        n(idx_C6H4Nj)*4d0 + &
        n(idx_C9H3j)*3d0 + &
        n(idx_C7H5j)*5d0 + &
        n(idx_C8H4Nj)*4d0 + &
        n(idx_C9H2Nj)*2d0 + &
        n(idx_C6H7j)*7d0 + &
        n(idx_NAH2j)*2d0 + &
        n(idx_PC2H4j)*4d0 + &
        n(idx_C4H5j)*5d0 + &
        n(idx_H2CCLj)*2d0 + &
        n(idx_PC4H2j)*2d0 + &
        n(idx_C6H4j)*4d0 + &
        n(idx_C8H4j)*4d0 + &
        n(idx_C9H4j)*4d0 + &
        n(idx_C4H7j)*7d0 + &
        n(idx_HC4Nj) + &
        n(idx_HC4Oj) + &
        n(idx_H2C4Nj)*2d0 + &
        n(idx_H3C4Nj)*3d0 + &
        n(idx_C5H3Nj)*3d0 + &
        n(idx_C7H3Nj)*3d0 + &
        n(idx_C9H3Nj)*3d0 + &
        n(idx_OCSjH2)*2d0 + &
        n(idx_H2C3Oj)*2d0 + &
        n(idx_H3C3Oj)*3d0 + &
        n(idx_C5H4Nj)*4d0 + &
        n(idx_C8H5j)*5d0 + &
        n(idx_C9H5j)*5d0
    get_Hnuclei = nH

  end function get_Hnuclei

  !***************************
  function get_zatoms()
    use krome_commons
    implicit none
    integer::get_zatoms(nspec)

    get_zatoms(1) = 0	!E
    get_zatoms(2) = 0	!GRAIN-
    get_zatoms(3) = 1	!H-
    get_zatoms(4) = 6	!C-
    get_zatoms(5) = 13	!CN-
    get_zatoms(6) = 8	!O-
    get_zatoms(7) = 9	!OH-
    get_zatoms(8) = 16	!S-
    get_zatoms(9) = 0	!GRAIN0
    get_zatoms(10) = 6	!C
    get_zatoms(11) = 26	!FE
    get_zatoms(12) = 1	!H
    get_zatoms(13) = 2	!HE
    get_zatoms(14) = 12	!MG
    get_zatoms(15) = 7	!N
    get_zatoms(16) = 11	!NA
    get_zatoms(17) = 8	!O
    get_zatoms(18) = 16	!S
    get_zatoms(19) = 14	!SI
    get_zatoms(20) = 2	!H2
    get_zatoms(21) = 14	!CO
    get_zatoms(22) = 17	!CL
    get_zatoms(23) = 15	!P
    get_zatoms(24) = 12	!C2
    get_zatoms(25) = 23	!CCL
    get_zatoms(26) = 7	!CH
    get_zatoms(27) = 25	!CLO
    get_zatoms(28) = 13	!CN
    get_zatoms(29) = 21	!CP
    get_zatoms(30) = 22	!CS
    get_zatoms(31) = 18	!HCL
    get_zatoms(32) = 10	!HF
    get_zatoms(33) = 9	!F
    get_zatoms(34) = 17	!HS
    get_zatoms(35) = 13	!MGH
    get_zatoms(36) = 14	!N2
    get_zatoms(37) = 12	!NAH
    get_zatoms(38) = 8	!NH
    get_zatoms(39) = 15	!NO
    get_zatoms(40) = 23	!NS
    get_zatoms(41) = 16	!O2
    get_zatoms(42) = 9	!OH
    get_zatoms(43) = 16	!PH
    get_zatoms(44) = 22	!PN
    get_zatoms(45) = 23	!PO
    get_zatoms(46) = 32	!S2
    get_zatoms(47) = 20	!SIC
    get_zatoms(48) = 15	!SIH
    get_zatoms(49) = 21	!SIN
    get_zatoms(50) = 22	!SIO
    get_zatoms(51) = 30	!SIS
    get_zatoms(52) = 24	!SO
    get_zatoms(53) = 13	!C2H
    get_zatoms(54) = 19	!C2N
    get_zatoms(55) = 28	!C2S
    get_zatoms(56) = 18	!C3
    get_zatoms(57) = 20	!CCO
    get_zatoms(58) = 27	!CCP
    get_zatoms(59) = 8	!CH2
    get_zatoms(60) = 22	!CO2
    get_zatoms(61) = 10	!H2O
    get_zatoms(62) = 18	!H2S
    get_zatoms(63) = 14	!HCN
    get_zatoms(64) = 15	!HCO
    get_zatoms(65) = 22	!HCP
    get_zatoms(66) = 23	!HCS
    get_zatoms(67) = 21	!HCSI
    get_zatoms(68) = 14	!HNC
    get_zatoms(69) = 16	!HNO
    get_zatoms(70) = 22	!HNSI
    get_zatoms(71) = 24	!HPO
    get_zatoms(72) = 33	!HS2
    get_zatoms(73) = 22	!N2O
    get_zatoms(74) = 20	!NAOH
    get_zatoms(75) = 9	!NH2
    get_zatoms(76) = 23	!NO2
    get_zatoms(77) = 17	!O2H
    get_zatoms(78) = 21	!OCN
    get_zatoms(79) = 30	!OCS
    get_zatoms(80) = 17	!PH2
    get_zatoms(81) = 26	!SIC2
    get_zatoms(82) = 16	!SIH2
    get_zatoms(83) = 27	!SINC
    get_zatoms(84) = 30	!SIO2
    get_zatoms(85) = 32	!SO2
    get_zatoms(86) = 14	!C2H2
    get_zatoms(87) = 19	!C3H
    get_zatoms(88) = 19	!HC3
    get_zatoms(89) = 25	!C3N
    get_zatoms(90) = 26	!C3O
    get_zatoms(91) = 33	!C3P
    get_zatoms(92) = 34	!C3S
    get_zatoms(93) = 24	!C4
    get_zatoms(94) = 9	!CH3
    get_zatoms(95) = 16	!H2CO
    get_zatoms(96) = 24	!H2CS
    get_zatoms(97) = 18	!H2O2
    get_zatoms(98) = 34	!H2S2
    get_zatoms(99) = 24	!H2SIO
    get_zatoms(100) = 28	!HCCP
    get_zatoms(101) = 10	!NH3
    get_zatoms(102) = 27	!SIC2H
    get_zatoms(103) = 32	!SIC3
    get_zatoms(104) = 22	!SICH2
    get_zatoms(105) = 17	!SIH3
    get_zatoms(106) = 21	!C2H2N
    get_zatoms(107) = 22	!C2H2O
    get_zatoms(108) = 15	!C2H3
    get_zatoms(109) = 20	!C3H2
    get_zatoms(110) = 20	!H2C3
    get_zatoms(111) = 25	!C4H
    get_zatoms(112) = 31	!C4N
    get_zatoms(113) = 39	!C4P
    get_zatoms(114) = 40	!C4S
    get_zatoms(115) = 30	!C5
    get_zatoms(116) = 24	!CH2O2
    get_zatoms(117) = 24	!CH2PH
    get_zatoms(118) = 16	!CH3N
    get_zatoms(119) = 10	!CH4
    get_zatoms(120) = 26	!HC3N
    get_zatoms(121) = 28	!SIC2H2
    get_zatoms(122) = 33	!SIC3H
    get_zatoms(123) = 38	!SIC4
    get_zatoms(124) = 23	!SICH3
    get_zatoms(125) = 18	!SIH4
    get_zatoms(126) = 22	!C2H3N
    get_zatoms(127) = 16	!C2H4
    get_zatoms(128) = 21	!C3H3
    get_zatoms(129) = 26	!C4H2
    get_zatoms(130) = 31	!C5H
    get_zatoms(131) = 37	!C5N
    get_zatoms(132) = 36	!C6
    get_zatoms(133) = 18	!CH4O
    get_zatoms(134) = 24	!C2H4O
    get_zatoms(135) = 17	!C2H5
    get_zatoms(136) = 28	!C3H3N
    get_zatoms(137) = 22	!C3H4
    get_zatoms(138) = 32	!C5H2
    get_zatoms(139) = 37	!C6H
    get_zatoms(140) = 42	!C7
    get_zatoms(141) = 18	!CH5N
    get_zatoms(142) = 38	!HC5N
    get_zatoms(143) = 38	!C6H2
    get_zatoms(144) = 43	!C7H
    get_zatoms(145) = 49	!C7N
    get_zatoms(146) = 48	!C8
    get_zatoms(147) = 34	!CH3C3N
    get_zatoms(148) = 32	!HCOOCH3
    get_zatoms(149) = 26	!C2H5OH
    get_zatoms(150) = 44	!C7H2
    get_zatoms(151) = 49	!C8H
    get_zatoms(152) = 54	!C9
    get_zatoms(153) = 34	!CH3C4H
    get_zatoms(154) = 26	!CH3OCH3
    get_zatoms(155) = 50	!HC7N
    get_zatoms(156) = 32	!C2H6CO
    get_zatoms(157) = 50	!C8H2
    get_zatoms(158) = 55	!C9H
    get_zatoms(159) = 61	!C9N
    get_zatoms(160) = 46	!CH3C5N
    get_zatoms(161) = 56	!C9H2
    get_zatoms(162) = 46	!CH3C6H
    get_zatoms(163) = 58	!CH3C7N
    get_zatoms(164) = 62	!HC9N
    get_zatoms(165) = 26	!HCNC2
    get_zatoms(166) = 26	!HC2NC
    get_zatoms(167) = 26	!HNC3
    get_zatoms(168) = 24	!NH2CHO
    get_zatoms(169) = 27	!C4H3
    get_zatoms(170) = 22	!NH2CN
    get_zatoms(171) = 42	!C6H6
    get_zatoms(172) = 15	!H2CN
    get_zatoms(173) = 60	!C10
    get_zatoms(174) = 66	!C11
    get_zatoms(175) = 35	!SIC3H3
    get_zatoms(176) = 39	!SIC4H
    get_zatoms(177) = 51	!SIC6H
    get_zatoms(178) = 63	!SIC8H
    get_zatoms(179) = 29	!SIC2H3
    get_zatoms(180) = 24	!C3H6
    get_zatoms(181) = 37	!SIC3H5
    get_zatoms(182) = 28	!C4H4
    get_zatoms(183) = 30	!C4H6
    get_zatoms(184) = 32	!HC4N
    get_zatoms(185) = 44	!HC6N
    get_zatoms(186) = 56	!HC8N
    get_zatoms(187) = 68	!HC10N
    get_zatoms(188) = 74	!HC11N
    get_zatoms(189) = 80	!HC12N
    get_zatoms(190) = 38	!NC4N
    get_zatoms(191) = 50	!NC6N
    get_zatoms(192) = 62	!NC8N
    get_zatoms(193) = 74	!NC10N
    get_zatoms(194) = 86	!NC12N
    get_zatoms(195) = 86	!HC13N
    get_zatoms(196) = 6	!C+
    get_zatoms(197) = 26	!FE+
    get_zatoms(198) = 1	!H+
    get_zatoms(199) = 2	!HE+
    get_zatoms(200) = 12	!MG+
    get_zatoms(201) = 7	!N+
    get_zatoms(202) = 11	!NA+
    get_zatoms(203) = 8	!O+
    get_zatoms(204) = 16	!S+
    get_zatoms(205) = 14	!SI+
    get_zatoms(206) = 3	!H3+
    get_zatoms(207) = 15	!HCO+
    get_zatoms(208) = 17	!CL+
    get_zatoms(209) = 15	!P+
    get_zatoms(210) = 14	!CO+
    get_zatoms(211) = 2	!H2+
    get_zatoms(212) = 15	!NO+
    get_zatoms(213) = 16	!O2+
    get_zatoms(214) = 8	!CH2+
    get_zatoms(215) = 18	!H2S+
    get_zatoms(216) = 23	!HCS+
    get_zatoms(217) = 16	!HNO+
    get_zatoms(218) = 9	!NH2+
    get_zatoms(219) = 30	!OCS+
    get_zatoms(220) = 14	!C2H2+
    get_zatoms(221) = 9	!CH3+
    get_zatoms(222) = 10	!NH3+
    get_zatoms(223) = 22	!C2H2O+
    get_zatoms(224) = 24	!CH2O2+
    get_zatoms(225) = 22	!C2H3N+
    get_zatoms(226) = 16	!C2H4+
    get_zatoms(227) = 26	!C4H2+
    get_zatoms(228) = 17	!H3CO+
    get_zatoms(229) = 18	!CH4O+
    get_zatoms(230) = 24	!C2H4O+
    get_zatoms(231) = 22	!C3H4+
    get_zatoms(232) = 18	!CH5N+
    get_zatoms(233) = 26	!C2H5OH+
    get_zatoms(234) = 26	!CH3OCH3+
    get_zatoms(235) = 7	!CH+
    get_zatoms(236) = 23	!CCL+
    get_zatoms(237) = 12	!C2+
    get_zatoms(238) = 25	!CLO+
    get_zatoms(239) = 21	!CP+
    get_zatoms(240) = 15	!CF+
    get_zatoms(241) = 22	!CS+
    get_zatoms(242) = 13	!CN+
    get_zatoms(243) = 23	!NS+
    get_zatoms(244) = 16	!PH+
    get_zatoms(245) = 23	!PO+
    get_zatoms(246) = 20	!SIC+
    get_zatoms(247) = 21	!SIN+
    get_zatoms(248) = 30	!SIS+
    get_zatoms(249) = 24	!SO+
    get_zatoms(250) = 18	!C3+
    get_zatoms(251) = 28	!C2S+
    get_zatoms(252) = 20	!C2O+
    get_zatoms(253) = 27	!CCP+
    get_zatoms(254) = 13	!C2H+
    get_zatoms(255) = 15	!HOC+
    get_zatoms(256) = 19	!C2N+
    get_zatoms(257) = 19	!CNC+
    get_zatoms(258) = 22	!HCP+
    get_zatoms(259) = 26	!SIC2+
    get_zatoms(260) = 27	!SINC+
    get_zatoms(261) = 24	!HPO+
    get_zatoms(262) = 14	!HCN+
    get_zatoms(263) = 21	!CHSI+
    get_zatoms(264) = 16	!SIH2+
    get_zatoms(265) = 19	!C3H+
    get_zatoms(266) = 24	!C4+
    get_zatoms(267) = 26	!C3O+
    get_zatoms(268) = 34	!C3S+
    get_zatoms(269) = 16	!H2CO+
    get_zatoms(270) = 24	!H2SIO+
    get_zatoms(271) = 15	!HCNH+
    get_zatoms(272) = 27	!SIC2H+
    get_zatoms(273) = 32	!SIC3+
    get_zatoms(274) = 22	!CH2SI+
    get_zatoms(275) = 17	!SIH3+
    get_zatoms(276) = 21	!C2H2N+
    get_zatoms(277) = 15	!C2H3+
    get_zatoms(278) = 20	!C3H2+
    get_zatoms(279) = 20	!H2C3+
    get_zatoms(280) = 25	!C4H+
    get_zatoms(281) = 30	!C5+
    get_zatoms(282) = 40	!C4S+
    get_zatoms(283) = 28	!PC2H+
    get_zatoms(284) = 25	!C3N+
    get_zatoms(285) = 31	!C4N+
    get_zatoms(286) = 26	!C3HN+
    get_zatoms(287) = 14	!HNC+
    get_zatoms(288) = 33	!SIC3H+
    get_zatoms(289) = 38	!SIC4+
    get_zatoms(290) = 28	!SIC2H2+
    get_zatoms(291) = 23	!SICH3+
    get_zatoms(292) = 27	!HC2NCH+
    get_zatoms(293) = 21	!C3H3+
    get_zatoms(294) = 21	!H3C3+
    get_zatoms(295) = 31	!C5H+
    get_zatoms(296) = 36	!C6+
    get_zatoms(297) = 23	!C2H3O+
    get_zatoms(298) = 17	!C2H5+
    get_zatoms(299) = 28	!C3H3N+
    get_zatoms(300) = 32	!C5H2+
    get_zatoms(301) = 27	!C4H3+
    get_zatoms(302) = 37	!C6H+
    get_zatoms(303) = 42	!C7+
    get_zatoms(304) = 17	!CH4N+
    get_zatoms(305) = 38	!C5HN+
    get_zatoms(306) = 43	!C7H+
    get_zatoms(307) = 48	!C8+
    get_zatoms(308) = 32	!COOCH4+
    get_zatoms(309) = 25	!C2H5O+
    get_zatoms(310) = 49	!C8H+
    get_zatoms(311) = 54	!C9+
    get_zatoms(312) = 33	!C5H3+
    get_zatoms(313) = 38	!C6H2+
    get_zatoms(314) = 39	!C6H3+
    get_zatoms(315) = 32	!C2H6CO+
    get_zatoms(316) = 55	!C9H+
    get_zatoms(317) = 60	!C10+
    get_zatoms(318) = 45	!C7H3+
    get_zatoms(319) = 50	!C8H2+
    get_zatoms(320) = 51	!C8H3+
    get_zatoms(321) = 18	!HCL+
    get_zatoms(322) = 9	!F+
    get_zatoms(323) = 10	!HF+
    get_zatoms(324) = 17	!HS+
    get_zatoms(325) = 8	!NH+
    get_zatoms(326) = 9	!OH+
    get_zatoms(327) = 22	!PN+
    get_zatoms(328) = 32	!S2+
    get_zatoms(329) = 15	!SIH+
    get_zatoms(330) = 22	!SIO+
    get_zatoms(331) = 10	!H2O+
    get_zatoms(332) = 22	!HNSI+
    get_zatoms(333) = 33	!S2H+
    get_zatoms(334) = 17	!PH2+
    get_zatoms(335) = 24	!H2CS+
    get_zatoms(336) = 34	!H2S2+
    get_zatoms(337) = 23	!HSIO+
    get_zatoms(338) = 39	!C4P+
    get_zatoms(339) = 23	!HCO2+
    get_zatoms(340) = 24	!PCH3+
    get_zatoms(341) = 10	!CH4+
    get_zatoms(342) = 20	!C2NH+
    get_zatoms(343) = 18	!SIH4+
    get_zatoms(344) = 11	!NH4+
    get_zatoms(345) = 15	!H2NC+
    get_zatoms(346) = 27	!C3H2N+
    get_zatoms(347) = 44	!C7H2+
    get_zatoms(348) = 34	!C5H4+
    get_zatoms(349) = 50	!C7HN+
    get_zatoms(350) = 56	!C9H2+
    get_zatoms(351) = 46	!C7H4+
    get_zatoms(352) = 62	!C9HN+
    get_zatoms(353) = 14	!N2+
    get_zatoms(354) = 22	!CO2+
    get_zatoms(355) = 3	!HEH+
    get_zatoms(356) = 32	!SO2+
    get_zatoms(357) = 41	!C6H5+
    get_zatoms(358) = 35	!C5H5+
    get_zatoms(359) = 15	!N2H+
    get_zatoms(360) = 23	!NO2+
    get_zatoms(361) = 29	!PC2H2+
    get_zatoms(362) = 24	!PNH2+
    get_zatoms(363) = 23	!PCH2+
    get_zatoms(364) = 29	!HC2S+
    get_zatoms(365) = 35	!HC3S+
    get_zatoms(366) = 25	!H3CS+
    get_zatoms(367) = 41	!HC4S+
    get_zatoms(368) = 23	!SIF+
    get_zatoms(369) = 23	!SINH2+
    get_zatoms(370) = 29	!SIC2H3+
    get_zatoms(371) = 34	!SIC3H2+
    get_zatoms(372) = 21	!C2HO+
    get_zatoms(373) = 11	!H3O+
    get_zatoms(374) = 19	!H3S+
    get_zatoms(375) = 31	!HOCS+
    get_zatoms(376) = 19	!CH5O+
    get_zatoms(377) = 21	!NCO+
    get_zatoms(378) = 22	!HNCO+
    get_zatoms(379) = 26	!C2N2+
    get_zatoms(380) = 17	!O2H+
    get_zatoms(381) = 11	!CH5+
    get_zatoms(382) = 19	!H2CL+
    get_zatoms(383) = 11	!H2F+
    get_zatoms(384) = 25	!CH3O2+
    get_zatoms(385) = 25	!H2PO+
    get_zatoms(386) = 25	!PNH3+
    get_zatoms(387) = 25	!PCH4+
    get_zatoms(388) = 30	!PC2H3+
    get_zatoms(389) = 31	!HSIS+
    get_zatoms(390) = 25	!HSO+
    get_zatoms(391) = 24	!HNS+
    get_zatoms(392) = 23	!HPN+
    get_zatoms(393) = 17	!H2NO+
    get_zatoms(394) = 21	!NAH2O+
    get_zatoms(395) = 18	!PH3+
    get_zatoms(396) = 28	!SINCH+
    get_zatoms(397) = 31	!HSIO2+
    get_zatoms(398) = 33	!HSO2+
    get_zatoms(399) = 27	!HC3O+
    get_zatoms(400) = 34	!PC3H+
    get_zatoms(401) = 35	!H3S2+
    get_zatoms(402) = 25	!H3SIO+
    get_zatoms(403) = 40	!PC4H+
    get_zatoms(404) = 23	!NH2CNH+
    get_zatoms(405) = 39	!SIC4H+
    get_zatoms(406) = 24	!SICH4+
    get_zatoms(407) = 19	!SIH5+
    get_zatoms(408) = 23	!C2H4N+
    get_zatoms(409) = 25	!NH2CH2O+
    get_zatoms(410) = 18	!C2H6+
    get_zatoms(411) = 29	!C3H4N+
    get_zatoms(412) = 23	!C3H5+
    get_zatoms(413) = 28	!C4H4+
    get_zatoms(414) = 19	!CH6N+
    get_zatoms(415) = 39	!C5H2N+
    get_zatoms(416) = 35	!C4H4N+
    get_zatoms(417) = 33	!H5C2O2+
    get_zatoms(418) = 27	!C2H5OH2+
    get_zatoms(419) = 27	!CH3OCH4+
    get_zatoms(420) = 51	!C7H2N+
    get_zatoms(421) = 33	!C3H6OH+
    get_zatoms(422) = 47	!C6H4N+
    get_zatoms(423) = 57	!C9H3+
    get_zatoms(424) = 47	!C7H5+
    get_zatoms(425) = 59	!C8H4N+
    get_zatoms(426) = 63	!C9H2N+
    get_zatoms(427) = 43	!C6H7+
    get_zatoms(428) = 13	!NAH2+
    get_zatoms(429) = 31	!PC2H4+
    get_zatoms(430) = 29	!C4H5+
    get_zatoms(431) = 25	!H2CCL+
    get_zatoms(432) = 41	!PC4H2+
    get_zatoms(433) = 40	!C6H4+
    get_zatoms(434) = 52	!C8H4+
    get_zatoms(435) = 58	!C9H4+
    get_zatoms(436) = 31	!C4H7+
    get_zatoms(437) = 32	!HC4N+
    get_zatoms(438) = 33	!HC4O+
    get_zatoms(439) = 37	!C5N+
    get_zatoms(440) = 33	!H2C4N+
    get_zatoms(441) = 34	!H3C4N+
    get_zatoms(442) = 49	!C7N+
    get_zatoms(443) = 40	!C5H3N+
    get_zatoms(444) = 61	!C9N+
    get_zatoms(445) = 52	!C7H3N+
    get_zatoms(446) = 64	!C9H3N+
    get_zatoms(447) = 32	!OCS+H2
    get_zatoms(448) = 28	!H2C3O+
    get_zatoms(449) = 29	!H3C3O+
    get_zatoms(450) = 41	!C5H4N+
    get_zatoms(451) = 53	!C8H5+
    get_zatoms(452) = 59	!C9H5+
    get_zatoms(453) = 2	!HE++
    get_zatoms(454) = 0	!dust_C_1
    get_zatoms(455) = 0	!dust_C_2
    get_zatoms(456) = 0	!dust_C_3
    get_zatoms(457) = 0	!dust_C_4
    get_zatoms(458) = 0	!dust_C_5
    get_zatoms(459) = 0	!dust_C_6
    get_zatoms(460) = 0	!dust_C_7
    get_zatoms(461) = 0	!dust_C_8
    get_zatoms(462) = 0	!dust_C_9
    get_zatoms(463) = 0	!dust_C_10
    get_zatoms(464) = 0	!dust_Si_1
    get_zatoms(465) = 0	!dust_Si_2
    get_zatoms(466) = 0	!dust_Si_3
    get_zatoms(467) = 0	!dust_Si_4
    get_zatoms(468) = 0	!dust_Si_5
    get_zatoms(469) = 0	!dust_Si_6
    get_zatoms(470) = 0	!dust_Si_7
    get_zatoms(471) = 0	!dust_Si_8
    get_zatoms(472) = 0	!dust_Si_9
    get_zatoms(473) = 0	!dust_Si_10
    get_zatoms(474) = 0	!CR
    get_zatoms(475) = 0	!g
    get_zatoms(476) = 0	!Tgas
    get_zatoms(477) = 0	!dummy

  end function get_zatoms

  !******************************
  function get_qeff()
    use krome_commons
    implicit none
    real*8::get_qeff(nrea)

    get_qeff(:) = 0e0

  end function get_qeff

  !**************************
  function get_free_fall_time(n)
    use krome_constants
    use krome_commons
    implicit none
    real*8::n(:),m(nspec)
    real*8::rhogas,get_free_fall_time

    m(:) = get_mass()
    rhogas = sum(n(1:nmols)*m(1:nmols))
    get_free_fall_time = sqrt(3d0*pi/32d0/gravity/rhogas)

  end function get_free_fall_time

  !**************************
  function get_free_fall_time_rho(rhogas)
    use krome_constants
    implicit none
    real*8::rhogas,get_free_fall_time_rho

    get_free_fall_time_rho = sqrt(3d0*pi/32d0/gravity/rhogas)

  end function get_free_fall_time_rho

  !********************************
  function get_jeans_length(n,Tgas)
    !get jeans length in cm
    use krome_constants
    use krome_commons
    implicit none
    real*8::n(:),Tgas,mu,rhogas
    real*8::m(nspec),get_jeans_length
    m(:) = get_mass()
    rhogas = max(sum(n(1:nmols)*m(1:nmols)),1d-40)
    mu = get_mu_rho(n(:),rhogas)
    get_jeans_length = sqrt(pi*boltzmann_erg*Tgas/rhogas&
        /p_mass/gravity/mu)

  end function get_jeans_length

  !********************************
  function get_jeans_length_rho(n,Tgas,rhogas)
    !get jeans length in cm
    use krome_constants
    use krome_commons
    implicit none
    real*8::n(:),Tgas,mu,rhogas
    real*8::get_jeans_length_rho

    mu = get_mu_rho(n(:),rhogas)
    get_jeans_length_rho = sqrt(pi*boltzmann_erg*Tgas/rhogas&
        /p_mass/gravity/mu)

  end function get_jeans_length_rho

  !***************************
  !number density to column density conversion
  function num2col(ncalc,n)
    use krome_commons
    implicit none
    real*8::num2col,ncalc,n(:),Tgas
    Tgas = max(n(idx_Tgas),phys_Tcmb)

    num2col = 0.5d0 * max(ncalc,1d-40) * get_jeans_length(n(:),Tgas)

  end function num2col

  !***********************
  !column density to number density conversion
  function col2num(ncalc,n)
    use krome_commons
    implicit none
    real*8::col2num,ncalc,n(:),Tgas
    Tgas = max(n(idx_Tgas),phys_Tcmb)

    col2num = 2d0 * max(ncalc,1d-40) / get_jeans_length(n(:),Tgas)

  end function col2num
  !************************
  !get electrons by balancing charges
  function get_electrons(n)
    use krome_commons
    implicit none
    real*8::get_electrons,n(nspec)

    get_electrons =  - n(idx_GRAINk) &
        - n(idx_Hk) &
        - n(idx_Ck) &
        - n(idx_CNk) &
        - n(idx_Ok) &
        - n(idx_OHk) &
        - n(idx_Sk) &
        + n(idx_Cj) &
        + n(idx_FEj) &
        + n(idx_Hj) &
        + n(idx_HEj) &
        + n(idx_MGj) &
        + n(idx_Nj) &
        + n(idx_NAj) &
        + n(idx_Oj) &
        + n(idx_Sj) &
        + n(idx_SIj) &
        + n(idx_H3j) &
        + n(idx_HCOj) &
        + n(idx_CLj) &
        + n(idx_Pj) &
        + n(idx_COj) &
        + n(idx_H2j) &
        + n(idx_NOj) &
        + n(idx_O2j) &
        + n(idx_CH2j) &
        + n(idx_H2Sj) &
        + n(idx_HCSj) &
        + n(idx_HNOj) &
        + n(idx_NH2j) &
        + n(idx_OCSj) &
        + n(idx_C2H2j) &
        + n(idx_CH3j) &
        + n(idx_NH3j) &
        + n(idx_C2H2Oj) &
        + n(idx_CH2O2j) &
        + n(idx_C2H3Nj) &
        + n(idx_C2H4j) &
        + n(idx_C4H2j) &
        + n(idx_H3COj) &
        + n(idx_CH4Oj) &
        + n(idx_C2H4Oj) &
        + n(idx_C3H4j) &
        + n(idx_CH5Nj) &
        + n(idx_C2H5OHj) &
        + n(idx_CH3OCH3j) &
        + n(idx_CHj) &
        + n(idx_CCLj) &
        + n(idx_C2j) &
        + n(idx_CLOj) &
        + n(idx_CPj) &
        + n(idx_CFj) &
        + n(idx_CSj) &
        + n(idx_CNj) &
        + n(idx_NSj) &
        + n(idx_PHj) &
        + n(idx_POj) &
        + n(idx_SICj) &
        + n(idx_SINj) &
        + n(idx_SISj) &
        + n(idx_SOj) &
        + n(idx_C3j) &
        + n(idx_C2Sj) &
        + n(idx_C2Oj) &
        + n(idx_CCPj) &
        + n(idx_C2Hj) &
        + n(idx_HOCj) &
        + n(idx_C2Nj) &
        + n(idx_CNCj) &
        + n(idx_HCPj) &
        + n(idx_SIC2j) &
        + n(idx_SINCj) &
        + n(idx_HPOj) &
        + n(idx_HCNj) &
        + n(idx_CHSIj) &
        + n(idx_SIH2j) &
        + n(idx_C3Hj) &
        + n(idx_C4j) &
        + n(idx_C3Oj) &
        + n(idx_C3Sj) &
        + n(idx_H2COj) &
        + n(idx_H2SIOj) &
        + n(idx_HCNHj) &
        + n(idx_SIC2Hj) &
        + n(idx_SIC3j) &
        + n(idx_CH2SIj) &
        + n(idx_SIH3j) &
        + n(idx_C2H2Nj) &
        + n(idx_C2H3j) &
        + n(idx_C3H2j) &
        + n(idx_H2C3j) &
        + n(idx_C4Hj) &
        + n(idx_C5j) &
        + n(idx_C4Sj) &
        + n(idx_PC2Hj) &
        + n(idx_C3Nj) &
        + n(idx_C4Nj) &
        + n(idx_C3HNj) &
        + n(idx_HNCj) &
        + n(idx_SIC3Hj) &
        + n(idx_SIC4j) &
        + n(idx_SIC2H2j) &
        + n(idx_SICH3j) &
        + n(idx_HC2NCHj) &
        + n(idx_C3H3j) &
        + n(idx_H3C3j) &
        + n(idx_C5Hj) &
        + n(idx_C6j) &
        + n(idx_C2H3Oj) &
        + n(idx_C2H5j) &
        + n(idx_C3H3Nj) &
        + n(idx_C5H2j) &
        + n(idx_C4H3j) &
        + n(idx_C6Hj) &
        + n(idx_C7j) &
        + n(idx_CH4Nj) &
        + n(idx_C5HNj) &
        + n(idx_C7Hj) &
        + n(idx_C8j) &
        + n(idx_COOCH4j) &
        + n(idx_C2H5Oj) &
        + n(idx_C8Hj) &
        + n(idx_C9j) &
        + n(idx_C5H3j) &
        + n(idx_C6H2j) &
        + n(idx_C6H3j) &
        + n(idx_C2H6COj) &
        + n(idx_C9Hj) &
        + n(idx_C10j) &
        + n(idx_C7H3j) &
        + n(idx_C8H2j) &
        + n(idx_C8H3j) &
        + n(idx_HCLj) &
        + n(idx_Fj) &
        + n(idx_HFj) &
        + n(idx_HSj) &
        + n(idx_NHj) &
        + n(idx_OHj) &
        + n(idx_PNj) &
        + n(idx_S2j) &
        + n(idx_SIHj) &
        + n(idx_SIOj) &
        + n(idx_H2Oj) &
        + n(idx_HNSIj) &
        + n(idx_S2Hj) &
        + n(idx_PH2j) &
        + n(idx_H2CSj) &
        + n(idx_H2S2j) &
        + n(idx_HSIOj) &
        + n(idx_C4Pj) &
        + n(idx_HCO2j) &
        + n(idx_PCH3j) &
        + n(idx_CH4j) &
        + n(idx_C2NHj) &
        + n(idx_SIH4j) &
        + n(idx_NH4j) &
        + n(idx_H2NCj) &
        + n(idx_C3H2Nj) &
        + n(idx_C7H2j) &
        + n(idx_C5H4j) &
        + n(idx_C7HNj) &
        + n(idx_C9H2j) &
        + n(idx_C7H4j) &
        + n(idx_C9HNj) &
        + n(idx_N2j) &
        + n(idx_CO2j) &
        + n(idx_HEHj) &
        + n(idx_SO2j) &
        + n(idx_C6H5j) &
        + n(idx_C5H5j) &
        + n(idx_N2Hj) &
        + n(idx_NO2j) &
        + n(idx_PC2H2j) &
        + n(idx_PNH2j) &
        + n(idx_PCH2j) &
        + n(idx_HC2Sj) &
        + n(idx_HC3Sj) &
        + n(idx_H3CSj) &
        + n(idx_HC4Sj) &
        + n(idx_SIFj) &
        + n(idx_SINH2j) &
        + n(idx_SIC2H3j) &
        + n(idx_SIC3H2j) &
        + n(idx_C2HOj) &
        + n(idx_H3Oj) &
        + n(idx_H3Sj) &
        + n(idx_HOCSj) &
        + n(idx_CH5Oj) &
        + n(idx_NCOj) &
        + n(idx_HNCOj) &
        + n(idx_C2N2j) &
        + n(idx_O2Hj) &
        + n(idx_CH5j) &
        + n(idx_H2CLj) &
        + n(idx_H2Fj) &
        + n(idx_CH3O2j) &
        + n(idx_H2POj) &
        + n(idx_PNH3j) &
        + n(idx_PCH4j) &
        + n(idx_PC2H3j) &
        + n(idx_HSISj) &
        + n(idx_HSOj) &
        + n(idx_HNSj) &
        + n(idx_HPNj) &
        + n(idx_H2NOj) &
        + n(idx_NAH2Oj) &
        + n(idx_PH3j) &
        + n(idx_SINCHj) &
        + n(idx_HSIO2j) &
        + n(idx_HSO2j) &
        + n(idx_HC3Oj) &
        + n(idx_PC3Hj) &
        + n(idx_H3S2j) &
        + n(idx_H3SIOj) &
        + n(idx_PC4Hj) &
        + n(idx_NH2CNHj) &
        + n(idx_SIC4Hj) &
        + n(idx_SICH4j) &
        + n(idx_SIH5j) &
        + n(idx_C2H4Nj) &
        + n(idx_NH2CH2Oj) &
        + n(idx_C2H6j) &
        + n(idx_C3H4Nj) &
        + n(idx_C3H5j) &
        + n(idx_C4H4j) &
        + n(idx_CH6Nj) &
        + n(idx_C5H2Nj) &
        + n(idx_C4H4Nj) &
        + n(idx_H5C2O2j) &
        + n(idx_C2H5OH2j) &
        + n(idx_CH3OCH4j) &
        + n(idx_C7H2Nj) &
        + n(idx_C3H6OHj) &
        + n(idx_C6H4Nj) &
        + n(idx_C9H3j) &
        + n(idx_C7H5j) &
        + n(idx_C8H4Nj) &
        + n(idx_C9H2Nj) &
        + n(idx_C6H7j) &
        + n(idx_NAH2j) &
        + n(idx_PC2H4j) &
        + n(idx_C4H5j) &
        + n(idx_H2CCLj) &
        + n(idx_PC4H2j) &
        + n(idx_C6H4j) &
        + n(idx_C8H4j) &
        + n(idx_C9H4j) &
        + n(idx_C4H7j) &
        + n(idx_HC4Nj) &
        + n(idx_HC4Oj) &
        + n(idx_C5Nj) &
        + n(idx_H2C4Nj) &
        + n(idx_H3C4Nj) &
        + n(idx_C7Nj) &
        + n(idx_C5H3Nj) &
        + n(idx_C9Nj) &
        + n(idx_C7H3Nj) &
        + n(idx_C9H3Nj) &
        + n(idx_OCSjH2) &
        + n(idx_H2C3Oj) &
        + n(idx_H3C3Oj) &
        + n(idx_C5H4Nj) &
        + n(idx_C8H5j) &
        + n(idx_C9H5j) &
        + 2d0*n(idx_HEjj)
    get_electrons = max(get_electrons,0d0)

  end function get_electrons

  !************************
  !get species charges
  function get_charges()
    use krome_commons
    implicit none
    integer::get_charges(nspec)

    get_charges(1) = -1.d0 	!E
    get_charges(2) = -1.d0 	!GRAIN-
    get_charges(3) = -1.d0 	!H-
    get_charges(4) = -1.d0 	!C-
    get_charges(5) = -1.d0 	!CN-
    get_charges(6) = -1.d0 	!O-
    get_charges(7) = -1.d0 	!OH-
    get_charges(8) = -1.d0 	!S-
    get_charges(9) = 0.d0 	!GRAIN0
    get_charges(10) = 0.d0 	!C
    get_charges(11) = 0.d0 	!FE
    get_charges(12) = 0.d0 	!H
    get_charges(13) = 0.d0 	!HE
    get_charges(14) = 0.d0 	!MG
    get_charges(15) = 0.d0 	!N
    get_charges(16) = 0.d0 	!NA
    get_charges(17) = 0.d0 	!O
    get_charges(18) = 0.d0 	!S
    get_charges(19) = 0.d0 	!SI
    get_charges(20) = 0.d0 	!H2
    get_charges(21) = 0.d0 	!CO
    get_charges(22) = 0.d0 	!CL
    get_charges(23) = 0.d0 	!P
    get_charges(24) = 0.d0 	!C2
    get_charges(25) = 0.d0 	!CCL
    get_charges(26) = 0.d0 	!CH
    get_charges(27) = 0.d0 	!CLO
    get_charges(28) = 0.d0 	!CN
    get_charges(29) = 0.d0 	!CP
    get_charges(30) = 0.d0 	!CS
    get_charges(31) = 0.d0 	!HCL
    get_charges(32) = 0.d0 	!HF
    get_charges(33) = 0.d0 	!F
    get_charges(34) = 0.d0 	!HS
    get_charges(35) = 0.d0 	!MGH
    get_charges(36) = 0.d0 	!N2
    get_charges(37) = 0.d0 	!NAH
    get_charges(38) = 0.d0 	!NH
    get_charges(39) = 0.d0 	!NO
    get_charges(40) = 0.d0 	!NS
    get_charges(41) = 0.d0 	!O2
    get_charges(42) = 0.d0 	!OH
    get_charges(43) = 0.d0 	!PH
    get_charges(44) = 0.d0 	!PN
    get_charges(45) = 0.d0 	!PO
    get_charges(46) = 0.d0 	!S2
    get_charges(47) = 0.d0 	!SIC
    get_charges(48) = 0.d0 	!SIH
    get_charges(49) = 0.d0 	!SIN
    get_charges(50) = 0.d0 	!SIO
    get_charges(51) = 0.d0 	!SIS
    get_charges(52) = 0.d0 	!SO
    get_charges(53) = 0.d0 	!C2H
    get_charges(54) = 0.d0 	!C2N
    get_charges(55) = 0.d0 	!C2S
    get_charges(56) = 0.d0 	!C3
    get_charges(57) = 0.d0 	!CCO
    get_charges(58) = 0.d0 	!CCP
    get_charges(59) = 0.d0 	!CH2
    get_charges(60) = 0.d0 	!CO2
    get_charges(61) = 0.d0 	!H2O
    get_charges(62) = 0.d0 	!H2S
    get_charges(63) = 0.d0 	!HCN
    get_charges(64) = 0.d0 	!HCO
    get_charges(65) = 0.d0 	!HCP
    get_charges(66) = 0.d0 	!HCS
    get_charges(67) = 0.d0 	!HCSI
    get_charges(68) = 0.d0 	!HNC
    get_charges(69) = 0.d0 	!HNO
    get_charges(70) = 0.d0 	!HNSI
    get_charges(71) = 0.d0 	!HPO
    get_charges(72) = 0.d0 	!HS2
    get_charges(73) = 0.d0 	!N2O
    get_charges(74) = 0.d0 	!NAOH
    get_charges(75) = 0.d0 	!NH2
    get_charges(76) = 0.d0 	!NO2
    get_charges(77) = 0.d0 	!O2H
    get_charges(78) = 0.d0 	!OCN
    get_charges(79) = 0.d0 	!OCS
    get_charges(80) = 0.d0 	!PH2
    get_charges(81) = 0.d0 	!SIC2
    get_charges(82) = 0.d0 	!SIH2
    get_charges(83) = 0.d0 	!SINC
    get_charges(84) = 0.d0 	!SIO2
    get_charges(85) = 0.d0 	!SO2
    get_charges(86) = 0.d0 	!C2H2
    get_charges(87) = 0.d0 	!C3H
    get_charges(88) = 0.d0 	!HC3
    get_charges(89) = 0.d0 	!C3N
    get_charges(90) = 0.d0 	!C3O
    get_charges(91) = 0.d0 	!C3P
    get_charges(92) = 0.d0 	!C3S
    get_charges(93) = 0.d0 	!C4
    get_charges(94) = 0.d0 	!CH3
    get_charges(95) = 0.d0 	!H2CO
    get_charges(96) = 0.d0 	!H2CS
    get_charges(97) = 0.d0 	!H2O2
    get_charges(98) = 0.d0 	!H2S2
    get_charges(99) = 0.d0 	!H2SIO
    get_charges(100) = 0.d0 	!HCCP
    get_charges(101) = 0.d0 	!NH3
    get_charges(102) = 0.d0 	!SIC2H
    get_charges(103) = 0.d0 	!SIC3
    get_charges(104) = 0.d0 	!SICH2
    get_charges(105) = 0.d0 	!SIH3
    get_charges(106) = 0.d0 	!C2H2N
    get_charges(107) = 0.d0 	!C2H2O
    get_charges(108) = 0.d0 	!C2H3
    get_charges(109) = 0.d0 	!C3H2
    get_charges(110) = 0.d0 	!H2C3
    get_charges(111) = 0.d0 	!C4H
    get_charges(112) = 0.d0 	!C4N
    get_charges(113) = 0.d0 	!C4P
    get_charges(114) = 0.d0 	!C4S
    get_charges(115) = 0.d0 	!C5
    get_charges(116) = 0.d0 	!CH2O2
    get_charges(117) = 0.d0 	!CH2PH
    get_charges(118) = 0.d0 	!CH3N
    get_charges(119) = 0.d0 	!CH4
    get_charges(120) = 0.d0 	!HC3N
    get_charges(121) = 0.d0 	!SIC2H2
    get_charges(122) = 0.d0 	!SIC3H
    get_charges(123) = 0.d0 	!SIC4
    get_charges(124) = 0.d0 	!SICH3
    get_charges(125) = 0.d0 	!SIH4
    get_charges(126) = 0.d0 	!C2H3N
    get_charges(127) = 0.d0 	!C2H4
    get_charges(128) = 0.d0 	!C3H3
    get_charges(129) = 0.d0 	!C4H2
    get_charges(130) = 0.d0 	!C5H
    get_charges(131) = 0.d0 	!C5N
    get_charges(132) = 0.d0 	!C6
    get_charges(133) = 0.d0 	!CH4O
    get_charges(134) = 0.d0 	!C2H4O
    get_charges(135) = 0.d0 	!C2H5
    get_charges(136) = 0.d0 	!C3H3N
    get_charges(137) = 0.d0 	!C3H4
    get_charges(138) = 0.d0 	!C5H2
    get_charges(139) = 0.d0 	!C6H
    get_charges(140) = 0.d0 	!C7
    get_charges(141) = 0.d0 	!CH5N
    get_charges(142) = 0.d0 	!HC5N
    get_charges(143) = 0.d0 	!C6H2
    get_charges(144) = 0.d0 	!C7H
    get_charges(145) = 0.d0 	!C7N
    get_charges(146) = 0.d0 	!C8
    get_charges(147) = 0.d0 	!CH3C3N
    get_charges(148) = 0.d0 	!HCOOCH3
    get_charges(149) = 0.d0 	!C2H5OH
    get_charges(150) = 0.d0 	!C7H2
    get_charges(151) = 0.d0 	!C8H
    get_charges(152) = 0.d0 	!C9
    get_charges(153) = 0.d0 	!CH3C4H
    get_charges(154) = 0.d0 	!CH3OCH3
    get_charges(155) = 0.d0 	!HC7N
    get_charges(156) = 0.d0 	!C2H6CO
    get_charges(157) = 0.d0 	!C8H2
    get_charges(158) = 0.d0 	!C9H
    get_charges(159) = 0.d0 	!C9N
    get_charges(160) = 0.d0 	!CH3C5N
    get_charges(161) = 0.d0 	!C9H2
    get_charges(162) = 0.d0 	!CH3C6H
    get_charges(163) = 0.d0 	!CH3C7N
    get_charges(164) = 0.d0 	!HC9N
    get_charges(165) = 0.d0 	!HCNC2
    get_charges(166) = 0.d0 	!HC2NC
    get_charges(167) = 0.d0 	!HNC3
    get_charges(168) = 0.d0 	!NH2CHO
    get_charges(169) = 0.d0 	!C4H3
    get_charges(170) = 0.d0 	!NH2CN
    get_charges(171) = 0.d0 	!C6H6
    get_charges(172) = 0.d0 	!H2CN
    get_charges(173) = 0.d0 	!C10
    get_charges(174) = 0.d0 	!C11
    get_charges(175) = 0.d0 	!SIC3H3
    get_charges(176) = 0.d0 	!SIC4H
    get_charges(177) = 0.d0 	!SIC6H
    get_charges(178) = 0.d0 	!SIC8H
    get_charges(179) = 0.d0 	!SIC2H3
    get_charges(180) = 0.d0 	!C3H6
    get_charges(181) = 0.d0 	!SIC3H5
    get_charges(182) = 0.d0 	!C4H4
    get_charges(183) = 0.d0 	!C4H6
    get_charges(184) = 0.d0 	!HC4N
    get_charges(185) = 0.d0 	!HC6N
    get_charges(186) = 0.d0 	!HC8N
    get_charges(187) = 0.d0 	!HC10N
    get_charges(188) = 0.d0 	!HC11N
    get_charges(189) = 0.d0 	!HC12N
    get_charges(190) = 0.d0 	!NC4N
    get_charges(191) = 0.d0 	!NC6N
    get_charges(192) = 0.d0 	!NC8N
    get_charges(193) = 0.d0 	!NC10N
    get_charges(194) = 0.d0 	!NC12N
    get_charges(195) = 0.d0 	!HC13N
    get_charges(196) = 1.d0 	!C+
    get_charges(197) = 1.d0 	!FE+
    get_charges(198) = 1.d0 	!H+
    get_charges(199) = 1.d0 	!HE+
    get_charges(200) = 1.d0 	!MG+
    get_charges(201) = 1.d0 	!N+
    get_charges(202) = 1.d0 	!NA+
    get_charges(203) = 1.d0 	!O+
    get_charges(204) = 1.d0 	!S+
    get_charges(205) = 1.d0 	!SI+
    get_charges(206) = 1.d0 	!H3+
    get_charges(207) = 1.d0 	!HCO+
    get_charges(208) = 1.d0 	!CL+
    get_charges(209) = 1.d0 	!P+
    get_charges(210) = 1.d0 	!CO+
    get_charges(211) = 1.d0 	!H2+
    get_charges(212) = 1.d0 	!NO+
    get_charges(213) = 1.d0 	!O2+
    get_charges(214) = 1.d0 	!CH2+
    get_charges(215) = 1.d0 	!H2S+
    get_charges(216) = 1.d0 	!HCS+
    get_charges(217) = 1.d0 	!HNO+
    get_charges(218) = 1.d0 	!NH2+
    get_charges(219) = 1.d0 	!OCS+
    get_charges(220) = 1.d0 	!C2H2+
    get_charges(221) = 1.d0 	!CH3+
    get_charges(222) = 1.d0 	!NH3+
    get_charges(223) = 1.d0 	!C2H2O+
    get_charges(224) = 1.d0 	!CH2O2+
    get_charges(225) = 1.d0 	!C2H3N+
    get_charges(226) = 1.d0 	!C2H4+
    get_charges(227) = 1.d0 	!C4H2+
    get_charges(228) = 1.d0 	!H3CO+
    get_charges(229) = 1.d0 	!CH4O+
    get_charges(230) = 1.d0 	!C2H4O+
    get_charges(231) = 1.d0 	!C3H4+
    get_charges(232) = 1.d0 	!CH5N+
    get_charges(233) = 1.d0 	!C2H5OH+
    get_charges(234) = 1.d0 	!CH3OCH3+
    get_charges(235) = 1.d0 	!CH+
    get_charges(236) = 1.d0 	!CCL+
    get_charges(237) = 1.d0 	!C2+
    get_charges(238) = 1.d0 	!CLO+
    get_charges(239) = 1.d0 	!CP+
    get_charges(240) = 1.d0 	!CF+
    get_charges(241) = 1.d0 	!CS+
    get_charges(242) = 1.d0 	!CN+
    get_charges(243) = 1.d0 	!NS+
    get_charges(244) = 1.d0 	!PH+
    get_charges(245) = 1.d0 	!PO+
    get_charges(246) = 1.d0 	!SIC+
    get_charges(247) = 1.d0 	!SIN+
    get_charges(248) = 1.d0 	!SIS+
    get_charges(249) = 1.d0 	!SO+
    get_charges(250) = 1.d0 	!C3+
    get_charges(251) = 1.d0 	!C2S+
    get_charges(252) = 1.d0 	!C2O+
    get_charges(253) = 1.d0 	!CCP+
    get_charges(254) = 1.d0 	!C2H+
    get_charges(255) = 1.d0 	!HOC+
    get_charges(256) = 1.d0 	!C2N+
    get_charges(257) = 1.d0 	!CNC+
    get_charges(258) = 1.d0 	!HCP+
    get_charges(259) = 1.d0 	!SIC2+
    get_charges(260) = 1.d0 	!SINC+
    get_charges(261) = 1.d0 	!HPO+
    get_charges(262) = 1.d0 	!HCN+
    get_charges(263) = 1.d0 	!CHSI+
    get_charges(264) = 1.d0 	!SIH2+
    get_charges(265) = 1.d0 	!C3H+
    get_charges(266) = 1.d0 	!C4+
    get_charges(267) = 1.d0 	!C3O+
    get_charges(268) = 1.d0 	!C3S+
    get_charges(269) = 1.d0 	!H2CO+
    get_charges(270) = 1.d0 	!H2SIO+
    get_charges(271) = 1.d0 	!HCNH+
    get_charges(272) = 1.d0 	!SIC2H+
    get_charges(273) = 1.d0 	!SIC3+
    get_charges(274) = 1.d0 	!CH2SI+
    get_charges(275) = 1.d0 	!SIH3+
    get_charges(276) = 1.d0 	!C2H2N+
    get_charges(277) = 1.d0 	!C2H3+
    get_charges(278) = 1.d0 	!C3H2+
    get_charges(279) = 1.d0 	!H2C3+
    get_charges(280) = 1.d0 	!C4H+
    get_charges(281) = 1.d0 	!C5+
    get_charges(282) = 1.d0 	!C4S+
    get_charges(283) = 1.d0 	!PC2H+
    get_charges(284) = 1.d0 	!C3N+
    get_charges(285) = 1.d0 	!C4N+
    get_charges(286) = 1.d0 	!C3HN+
    get_charges(287) = 1.d0 	!HNC+
    get_charges(288) = 1.d0 	!SIC3H+
    get_charges(289) = 1.d0 	!SIC4+
    get_charges(290) = 1.d0 	!SIC2H2+
    get_charges(291) = 1.d0 	!SICH3+
    get_charges(292) = 1.d0 	!HC2NCH+
    get_charges(293) = 1.d0 	!C3H3+
    get_charges(294) = 1.d0 	!H3C3+
    get_charges(295) = 1.d0 	!C5H+
    get_charges(296) = 1.d0 	!C6+
    get_charges(297) = 1.d0 	!C2H3O+
    get_charges(298) = 1.d0 	!C2H5+
    get_charges(299) = 1.d0 	!C3H3N+
    get_charges(300) = 1.d0 	!C5H2+
    get_charges(301) = 1.d0 	!C4H3+
    get_charges(302) = 1.d0 	!C6H+
    get_charges(303) = 1.d0 	!C7+
    get_charges(304) = 1.d0 	!CH4N+
    get_charges(305) = 1.d0 	!C5HN+
    get_charges(306) = 1.d0 	!C7H+
    get_charges(307) = 1.d0 	!C8+
    get_charges(308) = 1.d0 	!COOCH4+
    get_charges(309) = 1.d0 	!C2H5O+
    get_charges(310) = 1.d0 	!C8H+
    get_charges(311) = 1.d0 	!C9+
    get_charges(312) = 1.d0 	!C5H3+
    get_charges(313) = 1.d0 	!C6H2+
    get_charges(314) = 1.d0 	!C6H3+
    get_charges(315) = 1.d0 	!C2H6CO+
    get_charges(316) = 1.d0 	!C9H+
    get_charges(317) = 1.d0 	!C10+
    get_charges(318) = 1.d0 	!C7H3+
    get_charges(319) = 1.d0 	!C8H2+
    get_charges(320) = 1.d0 	!C8H3+
    get_charges(321) = 1.d0 	!HCL+
    get_charges(322) = 1.d0 	!F+
    get_charges(323) = 1.d0 	!HF+
    get_charges(324) = 1.d0 	!HS+
    get_charges(325) = 1.d0 	!NH+
    get_charges(326) = 1.d0 	!OH+
    get_charges(327) = 1.d0 	!PN+
    get_charges(328) = 1.d0 	!S2+
    get_charges(329) = 1.d0 	!SIH+
    get_charges(330) = 1.d0 	!SIO+
    get_charges(331) = 1.d0 	!H2O+
    get_charges(332) = 1.d0 	!HNSI+
    get_charges(333) = 1.d0 	!S2H+
    get_charges(334) = 1.d0 	!PH2+
    get_charges(335) = 1.d0 	!H2CS+
    get_charges(336) = 1.d0 	!H2S2+
    get_charges(337) = 1.d0 	!HSIO+
    get_charges(338) = 1.d0 	!C4P+
    get_charges(339) = 1.d0 	!HCO2+
    get_charges(340) = 1.d0 	!PCH3+
    get_charges(341) = 1.d0 	!CH4+
    get_charges(342) = 1.d0 	!C2NH+
    get_charges(343) = 1.d0 	!SIH4+
    get_charges(344) = 1.d0 	!NH4+
    get_charges(345) = 1.d0 	!H2NC+
    get_charges(346) = 1.d0 	!C3H2N+
    get_charges(347) = 1.d0 	!C7H2+
    get_charges(348) = 1.d0 	!C5H4+
    get_charges(349) = 1.d0 	!C7HN+
    get_charges(350) = 1.d0 	!C9H2+
    get_charges(351) = 1.d0 	!C7H4+
    get_charges(352) = 1.d0 	!C9HN+
    get_charges(353) = 1.d0 	!N2+
    get_charges(354) = 1.d0 	!CO2+
    get_charges(355) = 1.d0 	!HEH+
    get_charges(356) = 1.d0 	!SO2+
    get_charges(357) = 1.d0 	!C6H5+
    get_charges(358) = 1.d0 	!C5H5+
    get_charges(359) = 1.d0 	!N2H+
    get_charges(360) = 1.d0 	!NO2+
    get_charges(361) = 1.d0 	!PC2H2+
    get_charges(362) = 1.d0 	!PNH2+
    get_charges(363) = 1.d0 	!PCH2+
    get_charges(364) = 1.d0 	!HC2S+
    get_charges(365) = 1.d0 	!HC3S+
    get_charges(366) = 1.d0 	!H3CS+
    get_charges(367) = 1.d0 	!HC4S+
    get_charges(368) = 1.d0 	!SIF+
    get_charges(369) = 1.d0 	!SINH2+
    get_charges(370) = 1.d0 	!SIC2H3+
    get_charges(371) = 1.d0 	!SIC3H2+
    get_charges(372) = 1.d0 	!C2HO+
    get_charges(373) = 1.d0 	!H3O+
    get_charges(374) = 1.d0 	!H3S+
    get_charges(375) = 1.d0 	!HOCS+
    get_charges(376) = 1.d0 	!CH5O+
    get_charges(377) = 1.d0 	!NCO+
    get_charges(378) = 1.d0 	!HNCO+
    get_charges(379) = 1.d0 	!C2N2+
    get_charges(380) = 1.d0 	!O2H+
    get_charges(381) = 1.d0 	!CH5+
    get_charges(382) = 1.d0 	!H2CL+
    get_charges(383) = 1.d0 	!H2F+
    get_charges(384) = 1.d0 	!CH3O2+
    get_charges(385) = 1.d0 	!H2PO+
    get_charges(386) = 1.d0 	!PNH3+
    get_charges(387) = 1.d0 	!PCH4+
    get_charges(388) = 1.d0 	!PC2H3+
    get_charges(389) = 1.d0 	!HSIS+
    get_charges(390) = 1.d0 	!HSO+
    get_charges(391) = 1.d0 	!HNS+
    get_charges(392) = 1.d0 	!HPN+
    get_charges(393) = 1.d0 	!H2NO+
    get_charges(394) = 1.d0 	!NAH2O+
    get_charges(395) = 1.d0 	!PH3+
    get_charges(396) = 1.d0 	!SINCH+
    get_charges(397) = 1.d0 	!HSIO2+
    get_charges(398) = 1.d0 	!HSO2+
    get_charges(399) = 1.d0 	!HC3O+
    get_charges(400) = 1.d0 	!PC3H+
    get_charges(401) = 1.d0 	!H3S2+
    get_charges(402) = 1.d0 	!H3SIO+
    get_charges(403) = 1.d0 	!PC4H+
    get_charges(404) = 1.d0 	!NH2CNH+
    get_charges(405) = 1.d0 	!SIC4H+
    get_charges(406) = 1.d0 	!SICH4+
    get_charges(407) = 1.d0 	!SIH5+
    get_charges(408) = 1.d0 	!C2H4N+
    get_charges(409) = 1.d0 	!NH2CH2O+
    get_charges(410) = 1.d0 	!C2H6+
    get_charges(411) = 1.d0 	!C3H4N+
    get_charges(412) = 1.d0 	!C3H5+
    get_charges(413) = 1.d0 	!C4H4+
    get_charges(414) = 1.d0 	!CH6N+
    get_charges(415) = 1.d0 	!C5H2N+
    get_charges(416) = 1.d0 	!C4H4N+
    get_charges(417) = 1.d0 	!H5C2O2+
    get_charges(418) = 1.d0 	!C2H5OH2+
    get_charges(419) = 1.d0 	!CH3OCH4+
    get_charges(420) = 1.d0 	!C7H2N+
    get_charges(421) = 1.d0 	!C3H6OH+
    get_charges(422) = 1.d0 	!C6H4N+
    get_charges(423) = 1.d0 	!C9H3+
    get_charges(424) = 1.d0 	!C7H5+
    get_charges(425) = 1.d0 	!C8H4N+
    get_charges(426) = 1.d0 	!C9H2N+
    get_charges(427) = 1.d0 	!C6H7+
    get_charges(428) = 1.d0 	!NAH2+
    get_charges(429) = 1.d0 	!PC2H4+
    get_charges(430) = 1.d0 	!C4H5+
    get_charges(431) = 1.d0 	!H2CCL+
    get_charges(432) = 1.d0 	!PC4H2+
    get_charges(433) = 1.d0 	!C6H4+
    get_charges(434) = 1.d0 	!C8H4+
    get_charges(435) = 1.d0 	!C9H4+
    get_charges(436) = 1.d0 	!C4H7+
    get_charges(437) = 1.d0 	!HC4N+
    get_charges(438) = 1.d0 	!HC4O+
    get_charges(439) = 1.d0 	!C5N+
    get_charges(440) = 1.d0 	!H2C4N+
    get_charges(441) = 1.d0 	!H3C4N+
    get_charges(442) = 1.d0 	!C7N+
    get_charges(443) = 1.d0 	!C5H3N+
    get_charges(444) = 1.d0 	!C9N+
    get_charges(445) = 1.d0 	!C7H3N+
    get_charges(446) = 1.d0 	!C9H3N+
    get_charges(447) = 1.d0 	!OCS+H2
    get_charges(448) = 1.d0 	!H2C3O+
    get_charges(449) = 1.d0 	!H3C3O+
    get_charges(450) = 1.d0 	!C5H4N+
    get_charges(451) = 1.d0 	!C8H5+
    get_charges(452) = 1.d0 	!C9H5+
    get_charges(453) = 2.d0 	!HE++
    get_charges(454) = 0.d0 	!dust_C_1
    get_charges(455) = 0.d0 	!dust_C_2
    get_charges(456) = 0.d0 	!dust_C_3
    get_charges(457) = 0.d0 	!dust_C_4
    get_charges(458) = 0.d0 	!dust_C_5
    get_charges(459) = 0.d0 	!dust_C_6
    get_charges(460) = 0.d0 	!dust_C_7
    get_charges(461) = 0.d0 	!dust_C_8
    get_charges(462) = 0.d0 	!dust_C_9
    get_charges(463) = 0.d0 	!dust_C_10
    get_charges(464) = 0.d0 	!dust_Si_1
    get_charges(465) = 0.d0 	!dust_Si_2
    get_charges(466) = 0.d0 	!dust_Si_3
    get_charges(467) = 0.d0 	!dust_Si_4
    get_charges(468) = 0.d0 	!dust_Si_5
    get_charges(469) = 0.d0 	!dust_Si_6
    get_charges(470) = 0.d0 	!dust_Si_7
    get_charges(471) = 0.d0 	!dust_Si_8
    get_charges(472) = 0.d0 	!dust_Si_9
    get_charges(473) = 0.d0 	!dust_Si_10
    get_charges(474) = 0.d0 	!CR
    get_charges(475) = 0.d0 	!g
    get_charges(476) = 0.d0 	!Tgas
    get_charges(477) = 0.d0 	!dummy

  end function get_charges

  !*****************************
  ! get metallicity using C as reference
  function get_metallicityC(n)
    use krome_commons
    implicit none
    real*8::n(:),get_metallicityC,zC,nH

    nH = get_Hnuclei(n(:))

    zC = n(idx_Ck) &
        + n(idx_CNk) &
        + n(idx_C) &
        + n(idx_CO) &
        + 2d0*n(idx_C2) &
        + n(idx_CCL) &
        + n(idx_CH) &
        + n(idx_CN) &
        + n(idx_CP) &
        + n(idx_CS) &
        + n(idx_SIC) &
        + 2d0*n(idx_C2H) &
        + 2d0*n(idx_C2N) &
        + 2d0*n(idx_C2S) &
        + 3d0*n(idx_C3) &
        + 2d0*n(idx_CCO) &
        + 2d0*n(idx_CCP) &
        + n(idx_CH2) &
        + n(idx_CO2) &
        + n(idx_HCN) &
        + n(idx_HCO) &
        + n(idx_HCP) &
        + n(idx_HCS) &
        + n(idx_HCSI) &
        + n(idx_HNC) &
        + n(idx_OCN) &
        + n(idx_OCS) &
        + 2d0*n(idx_SIC2) &
        + n(idx_SINC) &
        + 2d0*n(idx_C2H2) &
        + 3d0*n(idx_C3H) &
        + 3d0*n(idx_HC3) &
        + 3d0*n(idx_C3N) &
        + 3d0*n(idx_C3O) &
        + 3d0*n(idx_C3P) &
        + 3d0*n(idx_C3S) &
        + 4d0*n(idx_C4) &
        + n(idx_CH3) &
        + n(idx_H2CO) &
        + n(idx_H2CS) &
        + 2d0*n(idx_HCCP) &
        + 2d0*n(idx_SIC2H) &
        + 3d0*n(idx_SIC3) &
        + n(idx_SICH2) &
        + 2d0*n(idx_C2H2N) &
        + 2d0*n(idx_C2H2O) &
        + 2d0*n(idx_C2H3) &
        + 3d0*n(idx_C3H2) &
        + 3d0*n(idx_H2C3) &
        + 4d0*n(idx_C4H) &
        + 4d0*n(idx_C4N) &
        + 4d0*n(idx_C4P) &
        + 4d0*n(idx_C4S) &
        + 5d0*n(idx_C5) &
        + n(idx_CH2O2) &
        + n(idx_CH2PH) &
        + n(idx_CH3N) &
        + n(idx_CH4) &
        + 3d0*n(idx_HC3N) &
        + 2d0*n(idx_SIC2H2) &
        + 3d0*n(idx_SIC3H) &
        + 4d0*n(idx_SIC4) &
        + n(idx_SICH3) &
        + 2d0*n(idx_C2H3N) &
        + 2d0*n(idx_C2H4) &
        + 3d0*n(idx_C3H3) &
        + 4d0*n(idx_C4H2) &
        + 5d0*n(idx_C5H) &
        + 5d0*n(idx_C5N) &
        + 6d0*n(idx_C6) &
        + n(idx_CH4O) &
        + 2d0*n(idx_C2H4O) &
        + 2d0*n(idx_C2H5) &
        + 3d0*n(idx_C3H3N) &
        + 3d0*n(idx_C3H4) &
        + 5d0*n(idx_C5H2) &
        + 6d0*n(idx_C6H) &
        + 7d0*n(idx_C7) &
        + n(idx_CH5N) &
        + 5d0*n(idx_HC5N) &
        + 6d0*n(idx_C6H2) &
        + 7d0*n(idx_C7H) &
        + 7d0*n(idx_C7N) &
        + 8d0*n(idx_C8) &
        + 4d0*n(idx_CH3C3N) &
        + 2d0*n(idx_HCOOCH3) &
        + 2d0*n(idx_C2H5OH) &
        + 7d0*n(idx_C7H2) &
        + 8d0*n(idx_C8H) &
        + 9d0*n(idx_C9) &
        + 5d0*n(idx_CH3C4H) &
        + 2d0*n(idx_CH3OCH3) &
        + 7d0*n(idx_HC7N) &
        + 3d0*n(idx_C2H6CO) &
        + 8d0*n(idx_C8H2) &
        + 9d0*n(idx_C9H) &
        + 9d0*n(idx_C9N) &
        + 6d0*n(idx_CH3C5N) &
        + 9d0*n(idx_C9H2) &
        + 7d0*n(idx_CH3C6H) &
        + 8d0*n(idx_CH3C7N) &
        + 9d0*n(idx_HC9N) &
        + 3d0*n(idx_HCNC2) &
        + 3d0*n(idx_HC2NC) &
        + 3d0*n(idx_HNC3) &
        + n(idx_NH2CHO) &
        + 4d0*n(idx_C4H3) &
        + n(idx_NH2CN) &
        + 6d0*n(idx_C6H6) &
        + n(idx_H2CN) &
        + 10d0*n(idx_C10) &
        + 11d0*n(idx_C11) &
        + 3d0*n(idx_SIC3H3) &
        + 4d0*n(idx_SIC4H) &
        + 6d0*n(idx_SIC6H) &
        + 8d0*n(idx_SIC8H) &
        + 2d0*n(idx_SIC2H3) &
        + 3d0*n(idx_C3H6) &
        + 3d0*n(idx_SIC3H5) &
        + 4d0*n(idx_C4H4) &
        + 4d0*n(idx_C4H6) &
        + 4d0*n(idx_HC4N) &
        + 6d0*n(idx_HC6N) &
        + 8d0*n(idx_HC8N) &
        + 10d0*n(idx_HC10N) &
        + 11d0*n(idx_HC11N) &
        + 12d0*n(idx_HC12N) &
        + 4d0*n(idx_NC4N) &
        + 6d0*n(idx_NC6N) &
        + 8d0*n(idx_NC8N) &
        + 10d0*n(idx_NC10N) &
        + 12d0*n(idx_NC12N) &
        + 13d0*n(idx_HC13N) &
        + n(idx_Cj) &
        + n(idx_HCOj) &
        + n(idx_COj) &
        + n(idx_CH2j) &
        + n(idx_HCSj) &
        + n(idx_OCSj) &
        + 2d0*n(idx_C2H2j) &
        + n(idx_CH3j) &
        + 2d0*n(idx_C2H2Oj) &
        + n(idx_CH2O2j) &
        + 2d0*n(idx_C2H3Nj) &
        + 2d0*n(idx_C2H4j) &
        + 4d0*n(idx_C4H2j) &
        + n(idx_H3COj) &
        + n(idx_CH4Oj) &
        + 2d0*n(idx_C2H4Oj) &
        + 3d0*n(idx_C3H4j) &
        + n(idx_CH5Nj) &
        + 2d0*n(idx_C2H5OHj) &
        + 2d0*n(idx_CH3OCH3j) &
        + n(idx_CHj) &
        + n(idx_CCLj) &
        + 2d0*n(idx_C2j) &
        + n(idx_CPj) &
        + n(idx_CFj) &
        + n(idx_CSj) &
        + n(idx_CNj) &
        + n(idx_SICj) &
        + 3d0*n(idx_C3j) &
        + 2d0*n(idx_C2Sj) &
        + 2d0*n(idx_C2Oj) &
        + 2d0*n(idx_CCPj) &
        + 2d0*n(idx_C2Hj) &
        + n(idx_HOCj) &
        + 2d0*n(idx_C2Nj) &
        + 2d0*n(idx_CNCj) &
        + n(idx_HCPj) &
        + 2d0*n(idx_SIC2j) &
        + n(idx_SINCj) &
        + n(idx_HCNj) &
        + n(idx_CHSIj) &
        + 3d0*n(idx_C3Hj) &
        + 4d0*n(idx_C4j) &
        + 3d0*n(idx_C3Oj) &
        + 3d0*n(idx_C3Sj) &
        + n(idx_H2COj) &
        + n(idx_HCNHj) &
        + 2d0*n(idx_SIC2Hj) &
        + 3d0*n(idx_SIC3j) &
        + n(idx_CH2SIj) &
        + 2d0*n(idx_C2H2Nj) &
        + 2d0*n(idx_C2H3j) &
        + 3d0*n(idx_C3H2j) &
        + 3d0*n(idx_H2C3j) &
        + 4d0*n(idx_C4Hj) &
        + 5d0*n(idx_C5j) &
        + 4d0*n(idx_C4Sj) &
        + 2d0*n(idx_PC2Hj) &
        + 3d0*n(idx_C3Nj) &
        + 4d0*n(idx_C4Nj) &
        + 3d0*n(idx_C3HNj) &
        + n(idx_HNCj) &
        + 3d0*n(idx_SIC3Hj) &
        + 4d0*n(idx_SIC4j) &
        + 2d0*n(idx_SIC2H2j) &
        + n(idx_SICH3j) &
        + 3d0*n(idx_HC2NCHj) &
        + 3d0*n(idx_C3H3j) &
        + 3d0*n(idx_H3C3j) &
        + 5d0*n(idx_C5Hj) &
        + 6d0*n(idx_C6j) &
        + 2d0*n(idx_C2H3Oj) &
        + 2d0*n(idx_C2H5j) &
        + 3d0*n(idx_C3H3Nj) &
        + 5d0*n(idx_C5H2j) &
        + 4d0*n(idx_C4H3j) &
        + 6d0*n(idx_C6Hj) &
        + 7d0*n(idx_C7j) &
        + n(idx_CH4Nj) &
        + 5d0*n(idx_C5HNj) &
        + 7d0*n(idx_C7Hj) &
        + 8d0*n(idx_C8j) &
        + 2d0*n(idx_COOCH4j) &
        + 2d0*n(idx_C2H5Oj) &
        + 8d0*n(idx_C8Hj) &
        + 9d0*n(idx_C9j) &
        + 5d0*n(idx_C5H3j) &
        + 6d0*n(idx_C6H2j) &
        + 6d0*n(idx_C6H3j) &
        + 3d0*n(idx_C2H6COj) &
        + 9d0*n(idx_C9Hj) &
        + 10d0*n(idx_C10j) &
        + 7d0*n(idx_C7H3j) &
        + 8d0*n(idx_C8H2j) &
        + 8d0*n(idx_C8H3j) &
        + n(idx_H2CSj) &
        + 4d0*n(idx_C4Pj) &
        + n(idx_HCO2j) &
        + n(idx_PCH3j) &
        + n(idx_CH4j) &
        + 2d0*n(idx_C2NHj) &
        + n(idx_H2NCj) &
        + 3d0*n(idx_C3H2Nj) &
        + 7d0*n(idx_C7H2j) &
        + 5d0*n(idx_C5H4j) &
        + 7d0*n(idx_C7HNj) &
        + 9d0*n(idx_C9H2j) &
        + 7d0*n(idx_C7H4j) &
        + 9d0*n(idx_C9HNj) &
        + n(idx_CO2j) &
        + 6d0*n(idx_C6H5j) &
        + 5d0*n(idx_C5H5j) &
        + 2d0*n(idx_PC2H2j) &
        + n(idx_PCH2j) &
        + 2d0*n(idx_HC2Sj) &
        + 3d0*n(idx_HC3Sj) &
        + n(idx_H3CSj) &
        + 4d0*n(idx_HC4Sj) &
        + 2d0*n(idx_SIC2H3j) &
        + 3d0*n(idx_SIC3H2j) &
        + 2d0*n(idx_C2HOj) &
        + n(idx_HOCSj) &
        + n(idx_CH5Oj) &
        + n(idx_NCOj) &
        + n(idx_HNCOj) &
        + 2d0*n(idx_C2N2j) &
        + n(idx_CH5j) &
        + n(idx_CH3O2j) &
        + n(idx_PCH4j) &
        + 2d0*n(idx_PC2H3j) &
        + n(idx_SINCHj) &
        + 3d0*n(idx_HC3Oj) &
        + 3d0*n(idx_PC3Hj) &
        + 4d0*n(idx_PC4Hj) &
        + n(idx_NH2CNHj) &
        + 4d0*n(idx_SIC4Hj) &
        + n(idx_SICH4j) &
        + 2d0*n(idx_C2H4Nj) &
        + n(idx_NH2CH2Oj) &
        + 2d0*n(idx_C2H6j) &
        + 3d0*n(idx_C3H4Nj) &
        + 3d0*n(idx_C3H5j) &
        + 4d0*n(idx_C4H4j) &
        + n(idx_CH6Nj) &
        + 5d0*n(idx_C5H2Nj) &
        + 4d0*n(idx_C4H4Nj) &
        + 2d0*n(idx_H5C2O2j) &
        + 2d0*n(idx_C2H5OH2j) &
        + 2d0*n(idx_CH3OCH4j) &
        + 7d0*n(idx_C7H2Nj) &
        + 3d0*n(idx_C3H6OHj) &
        + 6d0*n(idx_C6H4Nj) &
        + 9d0*n(idx_C9H3j) &
        + 7d0*n(idx_C7H5j) &
        + 8d0*n(idx_C8H4Nj) &
        + 9d0*n(idx_C9H2Nj) &
        + 6d0*n(idx_C6H7j) &
        + 2d0*n(idx_PC2H4j) &
        + 4d0*n(idx_C4H5j) &
        + n(idx_H2CCLj) &
        + 4d0*n(idx_PC4H2j) &
        + 6d0*n(idx_C6H4j) &
        + 8d0*n(idx_C8H4j) &
        + 9d0*n(idx_C9H4j) &
        + 4d0*n(idx_C4H7j) &
        + 4d0*n(idx_HC4Nj) &
        + 4d0*n(idx_HC4Oj) &
        + 5d0*n(idx_C5Nj) &
        + 4d0*n(idx_H2C4Nj) &
        + 4d0*n(idx_H3C4Nj) &
        + 7d0*n(idx_C7Nj) &
        + 5d0*n(idx_C5H3Nj) &
        + 9d0*n(idx_C9Nj) &
        + 7d0*n(idx_C7H3Nj) &
        + 9d0*n(idx_C9H3Nj) &
        + n(idx_OCSjH2) &
        + 3d0*n(idx_H2C3Oj) &
        + 3d0*n(idx_H3C3Oj) &
        + 5d0*n(idx_C5H4Nj) &
        + 8d0*n(idx_C8H5j) &
        + 9d0*n(idx_C9H5j)

    zC = max(zC, 0d0)

    get_metallicityC = log10(zC/nH+1d-40) - (-3.57)

    phys_metallicity = get_metallicityC

  end function get_metallicityC

  !*****************************
  ! get metallicity using Si as reference
  function get_metallicitySi(n)
    use krome_commons
    implicit none
    real*8::n(:),get_metallicitySi,zSi,nH

    nH = get_Hnuclei(n(:))

    zSi = n(idx_SI) &
        + n(idx_SIC) &
        + n(idx_SIH) &
        + n(idx_SIN) &
        + n(idx_SIO) &
        + n(idx_SIS) &
        + n(idx_HCSI) &
        + n(idx_HNSI) &
        + n(idx_SIC2) &
        + n(idx_SIH2) &
        + n(idx_SINC) &
        + n(idx_SIO2) &
        + n(idx_H2SIO) &
        + n(idx_SIC2H) &
        + n(idx_SIC3) &
        + n(idx_SICH2) &
        + n(idx_SIH3) &
        + n(idx_SIC2H2) &
        + n(idx_SIC3H) &
        + n(idx_SIC4) &
        + n(idx_SICH3) &
        + n(idx_SIH4) &
        + n(idx_SIC3H3) &
        + n(idx_SIC4H) &
        + n(idx_SIC6H) &
        + n(idx_SIC8H) &
        + n(idx_SIC2H3) &
        + n(idx_SIC3H5) &
        + n(idx_SIj) &
        + n(idx_SICj) &
        + n(idx_SINj) &
        + n(idx_SISj) &
        + n(idx_SIC2j) &
        + n(idx_SINCj) &
        + n(idx_CHSIj) &
        + n(idx_SIH2j) &
        + n(idx_H2SIOj) &
        + n(idx_SIC2Hj) &
        + n(idx_SIC3j) &
        + n(idx_CH2SIj) &
        + n(idx_SIH3j) &
        + n(idx_SIC3Hj) &
        + n(idx_SIC4j) &
        + n(idx_SIC2H2j) &
        + n(idx_SICH3j) &
        + n(idx_SIHj) &
        + n(idx_SIOj) &
        + n(idx_HNSIj) &
        + n(idx_HSIOj) &
        + n(idx_SIH4j) &
        + n(idx_SIFj) &
        + n(idx_SINH2j) &
        + n(idx_SIC2H3j) &
        + n(idx_SIC3H2j) &
        + n(idx_HSISj) &
        + n(idx_SINCHj) &
        + n(idx_HSIO2j) &
        + n(idx_H3SIOj) &
        + n(idx_SIC4Hj) &
        + n(idx_SICH4j) &
        + n(idx_SIH5j)

    zSi = max(zSi, 0d0)

    get_metallicitySi = log10(zSi/nH+1d-40) - (-4.49)

    phys_metallicity = get_metallicitySi

  end function get_metallicitySi

  !*****************************
  ! get metallicity using Cl as reference
  function get_metallicityCl(n)
    use krome_commons
    implicit none
    real*8::n(:),get_metallicityCl,zCl,nH

    nH = get_Hnuclei(n(:))

    zCl = n(idx_CL) &
        + n(idx_CCL) &
        + n(idx_CLO) &
        + n(idx_HCL) &
        + n(idx_CLj) &
        + n(idx_CCLj) &
        + n(idx_CLOj) &
        + n(idx_HCLj) &
        + n(idx_H2CLj) &
        + n(idx_H2CCLj)

    zCl = max(zCl, 0d0)

    get_metallicityCl = log10(zCl/nH+1d-40) - (-6.5)

    phys_metallicity = get_metallicityCl

  end function get_metallicityCl

  !*****************************
  ! get metallicity using F as reference
  function get_metallicityF(n)
    use krome_commons
    implicit none
    real*8::n(:),get_metallicityF,zF,nH

    nH = get_Hnuclei(n(:))

    zF = n(idx_HF) &
        + n(idx_F) &
        + n(idx_CFj) &
        + n(idx_Fj) &
        + n(idx_HFj) &
        + n(idx_SIFj) &
        + n(idx_H2Fj)

    zF = max(zF, 0d0)

    get_metallicityF = log10(zF/nH+1d-40) - (-7.44)

    phys_metallicity = get_metallicityF

  end function get_metallicityF

  !*****************************
  ! get metallicity using Mg as reference
  function get_metallicityMg(n)
    use krome_commons
    implicit none
    real*8::n(:),get_metallicityMg,zMg,nH

    nH = get_Hnuclei(n(:))

    zMg = n(idx_MG) &
        + n(idx_MGH) &
        + n(idx_MGj)

    zMg = max(zMg, 0d0)

    get_metallicityMg = log10(zMg/nH+1d-40) - (-4.4)

    phys_metallicity = get_metallicityMg

  end function get_metallicityMg

  !*****************************
  ! get metallicity using O as reference
  function get_metallicityO(n)
    use krome_commons
    implicit none
    real*8::n(:),get_metallicityO,zO,nH

    nH = get_Hnuclei(n(:))

    zO = n(idx_Ok) &
        + n(idx_OHk) &
        + n(idx_O) &
        + n(idx_CO) &
        + n(idx_CLO) &
        + n(idx_NO) &
        + 2d0*n(idx_O2) &
        + n(idx_OH) &
        + n(idx_PO) &
        + n(idx_SIO) &
        + n(idx_SO) &
        + n(idx_CCO) &
        + 2d0*n(idx_CO2) &
        + n(idx_H2O) &
        + n(idx_HCO) &
        + n(idx_HNO) &
        + n(idx_HPO) &
        + n(idx_N2O) &
        + n(idx_NAOH) &
        + 2d0*n(idx_NO2) &
        + 2d0*n(idx_O2H) &
        + n(idx_OCN) &
        + n(idx_OCS) &
        + 2d0*n(idx_SIO2) &
        + 2d0*n(idx_SO2) &
        + n(idx_C3O) &
        + n(idx_H2CO) &
        + 2d0*n(idx_H2O2) &
        + n(idx_H2SIO) &
        + n(idx_C2H2O) &
        + 2d0*n(idx_CH2O2) &
        + n(idx_CH4O) &
        + n(idx_C2H4O) &
        + 2d0*n(idx_HCOOCH3) &
        + n(idx_C2H5OH) &
        + n(idx_CH3OCH3) &
        + n(idx_C2H6CO) &
        + n(idx_NH2CHO) &
        + n(idx_Oj) &
        + n(idx_HCOj) &
        + n(idx_COj) &
        + n(idx_NOj) &
        + 2d0*n(idx_O2j) &
        + n(idx_HNOj) &
        + n(idx_OCSj) &
        + n(idx_C2H2Oj) &
        + 2d0*n(idx_CH2O2j) &
        + n(idx_H3COj) &
        + n(idx_CH4Oj) &
        + n(idx_C2H4Oj) &
        + n(idx_C2H5OHj) &
        + n(idx_CH3OCH3j) &
        + n(idx_CLOj) &
        + n(idx_POj) &
        + n(idx_SOj) &
        + n(idx_C2Oj) &
        + n(idx_HOCj) &
        + n(idx_HPOj) &
        + n(idx_C3Oj) &
        + n(idx_H2COj) &
        + n(idx_H2SIOj) &
        + n(idx_C2H3Oj) &
        + 2d0*n(idx_COOCH4j) &
        + n(idx_C2H5Oj) &
        + n(idx_C2H6COj) &
        + n(idx_OHj) &
        + n(idx_SIOj) &
        + n(idx_H2Oj) &
        + n(idx_HSIOj) &
        + 2d0*n(idx_HCO2j) &
        + 2d0*n(idx_CO2j) &
        + 2d0*n(idx_SO2j) &
        + 2d0*n(idx_NO2j) &
        + n(idx_C2HOj) &
        + n(idx_H3Oj) &
        + n(idx_HOCSj) &
        + n(idx_CH5Oj) &
        + n(idx_NCOj) &
        + n(idx_HNCOj) &
        + 2d0*n(idx_O2Hj) &
        + 2d0*n(idx_CH3O2j) &
        + n(idx_H2POj) &
        + n(idx_HSOj) &
        + n(idx_H2NOj) &
        + n(idx_NAH2Oj) &
        + 2d0*n(idx_HSIO2j) &
        + 2d0*n(idx_HSO2j) &
        + n(idx_HC3Oj) &
        + n(idx_H3SIOj) &
        + n(idx_NH2CH2Oj) &
        + 2d0*n(idx_H5C2O2j) &
        + n(idx_C2H5OH2j) &
        + n(idx_CH3OCH4j) &
        + n(idx_C3H6OHj) &
        + n(idx_HC4Oj) &
        + n(idx_OCSjH2) &
        + n(idx_H2C3Oj) &
        + n(idx_H3C3Oj)

    zO = max(zO, 0d0)

    get_metallicityO = log10(zO/nH+1d-40) - (-3.31)

    phys_metallicity = get_metallicityO

  end function get_metallicityO

  !*****************************
  ! get metallicity using N as reference
  function get_metallicityN(n)
    use krome_commons
    implicit none
    real*8::n(:),get_metallicityN,zN,nH

    nH = get_Hnuclei(n(:))

    zN = n(idx_CNk) &
        + n(idx_N) &
        + n(idx_CN) &
        + 2d0*n(idx_N2) &
        + n(idx_NH) &
        + n(idx_NO) &
        + n(idx_NS) &
        + n(idx_PN) &
        + n(idx_SIN) &
        + n(idx_C2N) &
        + n(idx_HCN) &
        + n(idx_HNC) &
        + n(idx_HNO) &
        + n(idx_HNSI) &
        + 2d0*n(idx_N2O) &
        + n(idx_NH2) &
        + n(idx_NO2) &
        + n(idx_OCN) &
        + n(idx_SINC) &
        + n(idx_C3N) &
        + n(idx_NH3) &
        + n(idx_C2H2N) &
        + n(idx_C4N) &
        + n(idx_CH3N) &
        + n(idx_HC3N) &
        + n(idx_C2H3N) &
        + n(idx_C5N) &
        + n(idx_C3H3N) &
        + n(idx_CH5N) &
        + n(idx_HC5N) &
        + n(idx_C7N) &
        + n(idx_CH3C3N) &
        + n(idx_HC7N) &
        + n(idx_C9N) &
        + n(idx_CH3C5N) &
        + n(idx_CH3C7N) &
        + n(idx_HC9N) &
        + n(idx_HCNC2) &
        + n(idx_HC2NC) &
        + n(idx_HNC3) &
        + n(idx_NH2CHO) &
        + 2d0*n(idx_NH2CN) &
        + n(idx_H2CN) &
        + n(idx_HC4N) &
        + n(idx_HC6N) &
        + n(idx_HC8N) &
        + n(idx_HC10N) &
        + n(idx_HC11N) &
        + n(idx_HC12N) &
        + 2d0*n(idx_NC4N) &
        + 2d0*n(idx_NC6N) &
        + 2d0*n(idx_NC8N) &
        + 2d0*n(idx_NC10N) &
        + 2d0*n(idx_NC12N) &
        + n(idx_HC13N) &
        + n(idx_Nj) &
        + n(idx_NOj) &
        + n(idx_HNOj) &
        + n(idx_NH2j) &
        + n(idx_NH3j) &
        + n(idx_C2H3Nj) &
        + n(idx_CH5Nj) &
        + n(idx_CNj) &
        + n(idx_NSj) &
        + n(idx_SINj) &
        + n(idx_C2Nj) &
        + n(idx_CNCj) &
        + n(idx_SINCj) &
        + n(idx_HCNj) &
        + n(idx_HCNHj) &
        + n(idx_C2H2Nj) &
        + n(idx_C3Nj) &
        + n(idx_C4Nj) &
        + n(idx_C3HNj) &
        + n(idx_HNCj) &
        + n(idx_HC2NCHj) &
        + n(idx_C3H3Nj) &
        + n(idx_CH4Nj) &
        + n(idx_C5HNj) &
        + n(idx_NHj) &
        + n(idx_PNj) &
        + n(idx_HNSIj) &
        + n(idx_C2NHj) &
        + n(idx_NH4j) &
        + n(idx_H2NCj) &
        + n(idx_C3H2Nj) &
        + n(idx_C7HNj) &
        + n(idx_C9HNj) &
        + 2d0*n(idx_N2j) &
        + 2d0*n(idx_N2Hj) &
        + n(idx_NO2j) &
        + n(idx_PNH2j) &
        + n(idx_SINH2j) &
        + n(idx_NCOj) &
        + n(idx_HNCOj) &
        + 2d0*n(idx_C2N2j) &
        + n(idx_PNH3j) &
        + n(idx_HNSj) &
        + n(idx_HPNj) &
        + n(idx_H2NOj) &
        + n(idx_SINCHj) &
        + 2d0*n(idx_NH2CNHj) &
        + n(idx_C2H4Nj) &
        + n(idx_NH2CH2Oj) &
        + n(idx_C3H4Nj) &
        + n(idx_CH6Nj) &
        + n(idx_C5H2Nj) &
        + n(idx_C4H4Nj) &
        + n(idx_C7H2Nj) &
        + n(idx_C6H4Nj) &
        + n(idx_C8H4Nj) &
        + n(idx_C9H2Nj) &
        + n(idx_HC4Nj) &
        + n(idx_C5Nj) &
        + n(idx_H2C4Nj) &
        + n(idx_H3C4Nj) &
        + n(idx_C7Nj) &
        + n(idx_C5H3Nj) &
        + n(idx_C9Nj) &
        + n(idx_C7H3Nj) &
        + n(idx_C9H3Nj) &
        + n(idx_C5H4Nj)

    zN = max(zN, 0d0)

    get_metallicityN = log10(zN/nH+1d-40) - (-4.17)

    phys_metallicity = get_metallicityN

  end function get_metallicityN

  !*****************************
  ! get metallicity using P as reference
  function get_metallicityP(n)
    use krome_commons
    implicit none
    real*8::n(:),get_metallicityP,zP,nH

    nH = get_Hnuclei(n(:))

    zP = n(idx_P) &
        + n(idx_CP) &
        + n(idx_PH) &
        + n(idx_PN) &
        + n(idx_PO) &
        + n(idx_CCP) &
        + n(idx_HCP) &
        + n(idx_HPO) &
        + n(idx_PH2) &
        + n(idx_C3P) &
        + n(idx_HCCP) &
        + n(idx_C4P) &
        + n(idx_CH2PH) &
        + n(idx_Pj) &
        + n(idx_CPj) &
        + n(idx_PHj) &
        + n(idx_POj) &
        + n(idx_CCPj) &
        + n(idx_HCPj) &
        + n(idx_HPOj) &
        + n(idx_PC2Hj) &
        + n(idx_PNj) &
        + n(idx_PH2j) &
        + n(idx_C4Pj) &
        + n(idx_PCH3j) &
        + n(idx_PC2H2j) &
        + n(idx_PNH2j) &
        + n(idx_PCH2j) &
        + n(idx_H2POj) &
        + n(idx_PNH3j) &
        + n(idx_PCH4j) &
        + n(idx_PC2H3j) &
        + n(idx_HPNj) &
        + n(idx_PH3j) &
        + n(idx_PC3Hj) &
        + n(idx_PC4Hj) &
        + n(idx_PC2H4j) &
        + n(idx_PC4H2j)

    zP = max(zP, 0d0)

    get_metallicityP = log10(zP/nH+1d-40) - (-6.59)

    phys_metallicity = get_metallicityP

  end function get_metallicityP

  !*****************************
  ! get metallicity using S as reference
  function get_metallicityS(n)
    use krome_commons
    implicit none
    real*8::n(:),get_metallicityS,zS,nH

    nH = get_Hnuclei(n(:))

    zS = n(idx_Sk) &
        + n(idx_S) &
        + n(idx_CS) &
        + n(idx_HS) &
        + n(idx_NS) &
        + 2d0*n(idx_S2) &
        + n(idx_SIS) &
        + n(idx_SO) &
        + n(idx_C2S) &
        + n(idx_H2S) &
        + n(idx_HCS) &
        + 2d0*n(idx_HS2) &
        + n(idx_OCS) &
        + n(idx_SO2) &
        + n(idx_C3S) &
        + n(idx_H2CS) &
        + 2d0*n(idx_H2S2) &
        + n(idx_C4S) &
        + n(idx_Sj) &
        + n(idx_H2Sj) &
        + n(idx_HCSj) &
        + n(idx_OCSj) &
        + n(idx_CSj) &
        + n(idx_NSj) &
        + n(idx_SISj) &
        + n(idx_SOj) &
        + n(idx_C2Sj) &
        + n(idx_C3Sj) &
        + n(idx_C4Sj) &
        + n(idx_HSj) &
        + 2d0*n(idx_S2j) &
        + 2d0*n(idx_S2Hj) &
        + n(idx_H2CSj) &
        + 2d0*n(idx_H2S2j) &
        + n(idx_SO2j) &
        + n(idx_HC2Sj) &
        + n(idx_HC3Sj) &
        + n(idx_H3CSj) &
        + n(idx_HC4Sj) &
        + n(idx_H3Sj) &
        + n(idx_HOCSj) &
        + n(idx_HSISj) &
        + n(idx_HSOj) &
        + n(idx_HNSj) &
        + n(idx_HSO2j) &
        + 2d0*n(idx_H3S2j) &
        + n(idx_OCSjH2)

    zS = max(zS, 0d0)

    get_metallicityS = log10(zS/nH+1d-40) - (-4.88)

    phys_metallicity = get_metallicityS

  end function get_metallicityS

  !*****************************
  ! get metallicity using Fe as reference
  function get_metallicityFe(n)
    use krome_commons
    implicit none
    real*8::n(:),get_metallicityFe,zFe,nH

    nH = get_Hnuclei(n(:))

    zFe = n(idx_FE) &
        + n(idx_FEj)

    zFe = max(zFe, 0d0)

    get_metallicityFe = log10(zFe/nH+1d-40) - (-4.5)

    phys_metallicity = get_metallicityFe

  end function get_metallicityFe

  !*****************************
  ! get metallicity using Na as reference
  function get_metallicityNa(n)
    use krome_commons
    implicit none
    real*8::n(:),get_metallicityNa,zNa,nH

    nH = get_Hnuclei(n(:))

    zNa = n(idx_NA) &
        + n(idx_NAH) &
        + n(idx_NAOH) &
        + n(idx_NAj) &
        + n(idx_NAH2Oj) &
        + n(idx_NAH2j)

    zNa = max(zNa, 0d0)

    get_metallicityNa = log10(zNa/nH+1d-40) - (-5.76)

    phys_metallicity = get_metallicityNa

  end function get_metallicityNa

end module krome_getphys
