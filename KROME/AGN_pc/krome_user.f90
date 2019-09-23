
!############### MODULE ##############
module krome_user
  implicit none

  ! *************************************************************
  !  This file has been generated with:
  !  KROME 14.08.dev on 2019-09-22 21:54:30
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

  integer,parameter::KROME_idx_E = 1	!E
  integer,parameter::KROME_idx_GRAINk = 2	!GRAIN-
  integer,parameter::KROME_idx_Hk = 3	!H-
  integer,parameter::KROME_idx_Ck = 4	!C-
  integer,parameter::KROME_idx_CNk = 5	!CN-
  integer,parameter::KROME_idx_Ok = 6	!O-
  integer,parameter::KROME_idx_OHk = 7	!OH-
  integer,parameter::KROME_idx_Sk = 8	!S-
  integer,parameter::KROME_idx_GRAIN0 = 9	!GRAIN0
  integer,parameter::KROME_idx_C = 10	!C
  integer,parameter::KROME_idx_FE = 11	!FE
  integer,parameter::KROME_idx_H = 12	!H
  integer,parameter::KROME_idx_HE = 13	!HE
  integer,parameter::KROME_idx_MG = 14	!MG
  integer,parameter::KROME_idx_N = 15	!N
  integer,parameter::KROME_idx_NA = 16	!NA
  integer,parameter::KROME_idx_O = 17	!O
  integer,parameter::KROME_idx_S = 18	!S
  integer,parameter::KROME_idx_SI = 19	!SI
  integer,parameter::KROME_idx_H2 = 20	!H2
  integer,parameter::KROME_idx_CO = 21	!CO
  integer,parameter::KROME_idx_CL = 22	!CL
  integer,parameter::KROME_idx_P = 23	!P
  integer,parameter::KROME_idx_C2 = 24	!C2
  integer,parameter::KROME_idx_CCL = 25	!CCL
  integer,parameter::KROME_idx_CH = 26	!CH
  integer,parameter::KROME_idx_CLO = 27	!CLO
  integer,parameter::KROME_idx_CN = 28	!CN
  integer,parameter::KROME_idx_CP = 29	!CP
  integer,parameter::KROME_idx_CS = 30	!CS
  integer,parameter::KROME_idx_HCL = 31	!HCL
  integer,parameter::KROME_idx_HF = 32	!HF
  integer,parameter::KROME_idx_F = 33	!F
  integer,parameter::KROME_idx_HS = 34	!HS
  integer,parameter::KROME_idx_MGH = 35	!MGH
  integer,parameter::KROME_idx_N2 = 36	!N2
  integer,parameter::KROME_idx_NAH = 37	!NAH
  integer,parameter::KROME_idx_NH = 38	!NH
  integer,parameter::KROME_idx_NO = 39	!NO
  integer,parameter::KROME_idx_NS = 40	!NS
  integer,parameter::KROME_idx_O2 = 41	!O2
  integer,parameter::KROME_idx_OH = 42	!OH
  integer,parameter::KROME_idx_PH = 43	!PH
  integer,parameter::KROME_idx_PN = 44	!PN
  integer,parameter::KROME_idx_PO = 45	!PO
  integer,parameter::KROME_idx_S2 = 46	!S2
  integer,parameter::KROME_idx_SIC = 47	!SIC
  integer,parameter::KROME_idx_SIH = 48	!SIH
  integer,parameter::KROME_idx_SIN = 49	!SIN
  integer,parameter::KROME_idx_SIO = 50	!SIO
  integer,parameter::KROME_idx_SIS = 51	!SIS
  integer,parameter::KROME_idx_SO = 52	!SO
  integer,parameter::KROME_idx_C2H = 53	!C2H
  integer,parameter::KROME_idx_C2N = 54	!C2N
  integer,parameter::KROME_idx_C2S = 55	!C2S
  integer,parameter::KROME_idx_C3 = 56	!C3
  integer,parameter::KROME_idx_CCO = 57	!CCO
  integer,parameter::KROME_idx_CCP = 58	!CCP
  integer,parameter::KROME_idx_CH2 = 59	!CH2
  integer,parameter::KROME_idx_CO2 = 60	!CO2
  integer,parameter::KROME_idx_H2O = 61	!H2O
  integer,parameter::KROME_idx_H2S = 62	!H2S
  integer,parameter::KROME_idx_HCN = 63	!HCN
  integer,parameter::KROME_idx_HCO = 64	!HCO
  integer,parameter::KROME_idx_HCP = 65	!HCP
  integer,parameter::KROME_idx_HCS = 66	!HCS
  integer,parameter::KROME_idx_HCSI = 67	!HCSI
  integer,parameter::KROME_idx_HNC = 68	!HNC
  integer,parameter::KROME_idx_HNO = 69	!HNO
  integer,parameter::KROME_idx_HNSI = 70	!HNSI
  integer,parameter::KROME_idx_HPO = 71	!HPO
  integer,parameter::KROME_idx_HS2 = 72	!HS2
  integer,parameter::KROME_idx_N2O = 73	!N2O
  integer,parameter::KROME_idx_NAOH = 74	!NAOH
  integer,parameter::KROME_idx_NH2 = 75	!NH2
  integer,parameter::KROME_idx_NO2 = 76	!NO2
  integer,parameter::KROME_idx_O2H = 77	!O2H
  integer,parameter::KROME_idx_OCN = 78	!OCN
  integer,parameter::KROME_idx_OCS = 79	!OCS
  integer,parameter::KROME_idx_PH2 = 80	!PH2
  integer,parameter::KROME_idx_SIC2 = 81	!SIC2
  integer,parameter::KROME_idx_SIH2 = 82	!SIH2
  integer,parameter::KROME_idx_SINC = 83	!SINC
  integer,parameter::KROME_idx_SIO2 = 84	!SIO2
  integer,parameter::KROME_idx_SO2 = 85	!SO2
  integer,parameter::KROME_idx_C2H2 = 86	!C2H2
  integer,parameter::KROME_idx_C3H = 87	!C3H
  integer,parameter::KROME_idx_HC3 = 88	!HC3
  integer,parameter::KROME_idx_C3N = 89	!C3N
  integer,parameter::KROME_idx_C3O = 90	!C3O
  integer,parameter::KROME_idx_C3P = 91	!C3P
  integer,parameter::KROME_idx_C3S = 92	!C3S
  integer,parameter::KROME_idx_C4 = 93	!C4
  integer,parameter::KROME_idx_CH3 = 94	!CH3
  integer,parameter::KROME_idx_H2CO = 95	!H2CO
  integer,parameter::KROME_idx_H2CS = 96	!H2CS
  integer,parameter::KROME_idx_H2O2 = 97	!H2O2
  integer,parameter::KROME_idx_H2S2 = 98	!H2S2
  integer,parameter::KROME_idx_H2SIO = 99	!H2SIO
  integer,parameter::KROME_idx_HCCP = 100	!HCCP
  integer,parameter::KROME_idx_NH3 = 101	!NH3
  integer,parameter::KROME_idx_SIC2H = 102	!SIC2H
  integer,parameter::KROME_idx_SIC3 = 103	!SIC3
  integer,parameter::KROME_idx_SICH2 = 104	!SICH2
  integer,parameter::KROME_idx_SIH3 = 105	!SIH3
  integer,parameter::KROME_idx_C2H2N = 106	!C2H2N
  integer,parameter::KROME_idx_C2H2O = 107	!C2H2O
  integer,parameter::KROME_idx_C2H3 = 108	!C2H3
  integer,parameter::KROME_idx_C3H2 = 109	!C3H2
  integer,parameter::KROME_idx_H2C3 = 110	!H2C3
  integer,parameter::KROME_idx_C4H = 111	!C4H
  integer,parameter::KROME_idx_C4N = 112	!C4N
  integer,parameter::KROME_idx_C4P = 113	!C4P
  integer,parameter::KROME_idx_C4S = 114	!C4S
  integer,parameter::KROME_idx_C5 = 115	!C5
  integer,parameter::KROME_idx_CH2O2 = 116	!CH2O2
  integer,parameter::KROME_idx_CH2PH = 117	!CH2PH
  integer,parameter::KROME_idx_CH3N = 118	!CH3N
  integer,parameter::KROME_idx_CH4 = 119	!CH4
  integer,parameter::KROME_idx_HC3N = 120	!HC3N
  integer,parameter::KROME_idx_SIC2H2 = 121	!SIC2H2
  integer,parameter::KROME_idx_SIC3H = 122	!SIC3H
  integer,parameter::KROME_idx_SIC4 = 123	!SIC4
  integer,parameter::KROME_idx_SICH3 = 124	!SICH3
  integer,parameter::KROME_idx_SIH4 = 125	!SIH4
  integer,parameter::KROME_idx_C2H3N = 126	!C2H3N
  integer,parameter::KROME_idx_C2H4 = 127	!C2H4
  integer,parameter::KROME_idx_C3H3 = 128	!C3H3
  integer,parameter::KROME_idx_C4H2 = 129	!C4H2
  integer,parameter::KROME_idx_C5H = 130	!C5H
  integer,parameter::KROME_idx_C5N = 131	!C5N
  integer,parameter::KROME_idx_C6 = 132	!C6
  integer,parameter::KROME_idx_CH3OH = 133	!CH3OH
  integer,parameter::KROME_idx_C2H4O = 134	!C2H4O
  integer,parameter::KROME_idx_C2H5 = 135	!C2H5
  integer,parameter::KROME_idx_C3H3N = 136	!C3H3N
  integer,parameter::KROME_idx_C3H4 = 137	!C3H4
  integer,parameter::KROME_idx_C5H2 = 138	!C5H2
  integer,parameter::KROME_idx_C6H = 139	!C6H
  integer,parameter::KROME_idx_C7 = 140	!C7
  integer,parameter::KROME_idx_CH5N = 141	!CH5N
  integer,parameter::KROME_idx_HC5N = 142	!HC5N
  integer,parameter::KROME_idx_C6H2 = 143	!C6H2
  integer,parameter::KROME_idx_C7H = 144	!C7H
  integer,parameter::KROME_idx_C7N = 145	!C7N
  integer,parameter::KROME_idx_C8 = 146	!C8
  integer,parameter::KROME_idx_CH3C3N = 147	!CH3C3N
  integer,parameter::KROME_idx_HCOOCH3 = 148	!HCOOCH3
  integer,parameter::KROME_idx_C2H5OH = 149	!C2H5OH
  integer,parameter::KROME_idx_C7H2 = 150	!C7H2
  integer,parameter::KROME_idx_C8H = 151	!C8H
  integer,parameter::KROME_idx_C9 = 152	!C9
  integer,parameter::KROME_idx_CH3C4H = 153	!CH3C4H
  integer,parameter::KROME_idx_CH3OCH3 = 154	!CH3OCH3
  integer,parameter::KROME_idx_HC7N = 155	!HC7N
  integer,parameter::KROME_idx_C2H6CO = 156	!C2H6CO
  integer,parameter::KROME_idx_C8H2 = 157	!C8H2
  integer,parameter::KROME_idx_C9H = 158	!C9H
  integer,parameter::KROME_idx_C9N = 159	!C9N
  integer,parameter::KROME_idx_CH3C5N = 160	!CH3C5N
  integer,parameter::KROME_idx_C9H2 = 161	!C9H2
  integer,parameter::KROME_idx_CH3C6H = 162	!CH3C6H
  integer,parameter::KROME_idx_CH3C7N = 163	!CH3C7N
  integer,parameter::KROME_idx_HC9N = 164	!HC9N
  integer,parameter::KROME_idx_HCNC2 = 165	!HCNC2
  integer,parameter::KROME_idx_HC2NC = 166	!HC2NC
  integer,parameter::KROME_idx_HNC3 = 167	!HNC3
  integer,parameter::KROME_idx_NH2CHO = 168	!NH2CHO
  integer,parameter::KROME_idx_C4H3 = 169	!C4H3
  integer,parameter::KROME_idx_NH2CN = 170	!NH2CN
  integer,parameter::KROME_idx_C6H6 = 171	!C6H6
  integer,parameter::KROME_idx_H2CN = 172	!H2CN
  integer,parameter::KROME_idx_C10 = 173	!C10
  integer,parameter::KROME_idx_C11 = 174	!C11
  integer,parameter::KROME_idx_SIC3H3 = 175	!SIC3H3
  integer,parameter::KROME_idx_SIC4H = 176	!SIC4H
  integer,parameter::KROME_idx_SIC6H = 177	!SIC6H
  integer,parameter::KROME_idx_SIC8H = 178	!SIC8H
  integer,parameter::KROME_idx_SIC2H3 = 179	!SIC2H3
  integer,parameter::KROME_idx_C3H6 = 180	!C3H6
  integer,parameter::KROME_idx_SIC3H5 = 181	!SIC3H5
  integer,parameter::KROME_idx_C4H4 = 182	!C4H4
  integer,parameter::KROME_idx_C4H6 = 183	!C4H6
  integer,parameter::KROME_idx_HC4N = 184	!HC4N
  integer,parameter::KROME_idx_HC6N = 185	!HC6N
  integer,parameter::KROME_idx_HC8N = 186	!HC8N
  integer,parameter::KROME_idx_HC10N = 187	!HC10N
  integer,parameter::KROME_idx_HC11N = 188	!HC11N
  integer,parameter::KROME_idx_HC12N = 189	!HC12N
  integer,parameter::KROME_idx_NC4N = 190	!NC4N
  integer,parameter::KROME_idx_NC6N = 191	!NC6N
  integer,parameter::KROME_idx_NC8N = 192	!NC8N
  integer,parameter::KROME_idx_NC10N = 193	!NC10N
  integer,parameter::KROME_idx_NC12N = 194	!NC12N
  integer,parameter::KROME_idx_HC13N = 195	!HC13N
  integer,parameter::KROME_idx_H_DUST = 196	!H_DUST
  integer,parameter::KROME_idx_O_DUST = 197	!O_DUST
  integer,parameter::KROME_idx_C_DUST = 198	!C_DUST
  integer,parameter::KROME_idx_H_DUSTH_DUST = 199	!H_DUSTH_DUST
  integer,parameter::KROME_idx_C_DUSTH_DUST = 200	!C_DUSTH_DUST
  integer,parameter::KROME_idx_O_DUSTH_DUST = 201	!O_DUSTH_DUST
  integer,parameter::KROME_idx_C_DUSTO_DUST = 202	!C_DUSTO_DUST
  integer,parameter::KROME_idx_H_DUSTH_DUSTO_DUST = 203	!H_DUSTH_DUSTO_DUST
  integer,parameter::KROME_idx_C_DUSTH_DUSTH_DUST = 204	!C_DUSTH_DUSTH_DUST
  integer,parameter::KROME_idx_C_DUSTH_DUSTH_DUSTH_DUST = 205	!C_DUSTH_DUSTH_DUSTH_DUST
  integer,parameter::KROME_idx_HOC = 206	!HOC
  integer,parameter::KROME_idx_H_DUSTO_DUSTC_DUST = 207	!H_DUSTO_DUSTC_DUST
  integer,parameter::KROME_idx_H_DUSTC_DUSTO_DUST = 208	!H_DUSTC_DUSTO_DUST
  integer,parameter::KROME_idx_CHOH = 209	!CHOH
  integer,parameter::KROME_idx_C_DUSTH_DUSTO_DUSTH_DUST = 210	!C_DUSTH_DUSTO_DUSTH_DUST
  integer,parameter::KROME_idx_HCHO = 211	!HCHO
  integer,parameter::KROME_idx_H_DUSTC_DUSTH_DUSTO_DUST = 212	!H_DUSTC_DUSTH_DUSTO_DUST
  integer,parameter::KROME_idx_C_DUSTH_DUSTH_DUSTH_DUSTH_DUST = 213	!C_DUSTH_DUSTH_DUSTH_DUSTH_DUST
  integer,parameter::KROME_idx_CH2OH = 214	!CH2OH
  integer,parameter::KROME_idx_C_DUSTH_DUSTH_DUSTO_DUSTH_DUST = 215	!C_DUSTH_DUSTH_DUSTO_DUSTH_DUST
  integer,parameter::KROME_idx_C_DUSTH_DUSTH_DUSTH_DUSTO_DUSTH_DUST = 216	!C_DUSTH_DUSTH_DUSTH_DUSTO_DUSTH_DUST
  integer,parameter::KROME_idx_Cj = 217	!C+
  integer,parameter::KROME_idx_FEj = 218	!FE+
  integer,parameter::KROME_idx_Hj = 219	!H+
  integer,parameter::KROME_idx_HEj = 220	!HE+
  integer,parameter::KROME_idx_MGj = 221	!MG+
  integer,parameter::KROME_idx_Nj = 222	!N+
  integer,parameter::KROME_idx_NAj = 223	!NA+
  integer,parameter::KROME_idx_Oj = 224	!O+
  integer,parameter::KROME_idx_Sj = 225	!S+
  integer,parameter::KROME_idx_SIj = 226	!SI+
  integer,parameter::KROME_idx_H3j = 227	!H3+
  integer,parameter::KROME_idx_HCOj = 228	!HCO+
  integer,parameter::KROME_idx_CLj = 229	!CL+
  integer,parameter::KROME_idx_Pj = 230	!P+
  integer,parameter::KROME_idx_COj = 231	!CO+
  integer,parameter::KROME_idx_H2j = 232	!H2+
  integer,parameter::KROME_idx_NOj = 233	!NO+
  integer,parameter::KROME_idx_O2j = 234	!O2+
  integer,parameter::KROME_idx_CH2j = 235	!CH2+
  integer,parameter::KROME_idx_H2Sj = 236	!H2S+
  integer,parameter::KROME_idx_HCSj = 237	!HCS+
  integer,parameter::KROME_idx_HNOj = 238	!HNO+
  integer,parameter::KROME_idx_NH2j = 239	!NH2+
  integer,parameter::KROME_idx_OCSj = 240	!OCS+
  integer,parameter::KROME_idx_C2H2j = 241	!C2H2+
  integer,parameter::KROME_idx_CH3j = 242	!CH3+
  integer,parameter::KROME_idx_NH3j = 243	!NH3+
  integer,parameter::KROME_idx_C2H2Oj = 244	!C2H2O+
  integer,parameter::KROME_idx_CH2O2j = 245	!CH2O2+
  integer,parameter::KROME_idx_C2H3Nj = 246	!C2H3N+
  integer,parameter::KROME_idx_C2H4j = 247	!C2H4+
  integer,parameter::KROME_idx_C4H2j = 248	!C4H2+
  integer,parameter::KROME_idx_H3COj = 249	!H3CO+
  integer,parameter::KROME_idx_CH4Oj = 250	!CH4O+
  integer,parameter::KROME_idx_C2H4Oj = 251	!C2H4O+
  integer,parameter::KROME_idx_C3H4j = 252	!C3H4+
  integer,parameter::KROME_idx_CH5Nj = 253	!CH5N+
  integer,parameter::KROME_idx_C2H5OHj = 254	!C2H5OH+
  integer,parameter::KROME_idx_CH3OCH3j = 255	!CH3OCH3+
  integer,parameter::KROME_idx_CHj = 256	!CH+
  integer,parameter::KROME_idx_CCLj = 257	!CCL+
  integer,parameter::KROME_idx_C2j = 258	!C2+
  integer,parameter::KROME_idx_CLOj = 259	!CLO+
  integer,parameter::KROME_idx_CPj = 260	!CP+
  integer,parameter::KROME_idx_CFj = 261	!CF+
  integer,parameter::KROME_idx_CSj = 262	!CS+
  integer,parameter::KROME_idx_CNj = 263	!CN+
  integer,parameter::KROME_idx_NSj = 264	!NS+
  integer,parameter::KROME_idx_PHj = 265	!PH+
  integer,parameter::KROME_idx_POj = 266	!PO+
  integer,parameter::KROME_idx_SICj = 267	!SIC+
  integer,parameter::KROME_idx_SINj = 268	!SIN+
  integer,parameter::KROME_idx_SISj = 269	!SIS+
  integer,parameter::KROME_idx_SOj = 270	!SO+
  integer,parameter::KROME_idx_C3j = 271	!C3+
  integer,parameter::KROME_idx_C2Sj = 272	!C2S+
  integer,parameter::KROME_idx_C2Oj = 273	!C2O+
  integer,parameter::KROME_idx_CCPj = 274	!CCP+
  integer,parameter::KROME_idx_C2Hj = 275	!C2H+
  integer,parameter::KROME_idx_HOCj = 276	!HOC+
  integer,parameter::KROME_idx_C2Nj = 277	!C2N+
  integer,parameter::KROME_idx_CNCj = 278	!CNC+
  integer,parameter::KROME_idx_HCPj = 279	!HCP+
  integer,parameter::KROME_idx_SIC2j = 280	!SIC2+
  integer,parameter::KROME_idx_SINCj = 281	!SINC+
  integer,parameter::KROME_idx_HPOj = 282	!HPO+
  integer,parameter::KROME_idx_HCNj = 283	!HCN+
  integer,parameter::KROME_idx_CHSIj = 284	!CHSI+
  integer,parameter::KROME_idx_SIH2j = 285	!SIH2+
  integer,parameter::KROME_idx_C3Hj = 286	!C3H+
  integer,parameter::KROME_idx_C4j = 287	!C4+
  integer,parameter::KROME_idx_C3Oj = 288	!C3O+
  integer,parameter::KROME_idx_C3Sj = 289	!C3S+
  integer,parameter::KROME_idx_H2COj = 290	!H2CO+
  integer,parameter::KROME_idx_H2SIOj = 291	!H2SIO+
  integer,parameter::KROME_idx_HCNHj = 292	!HCNH+
  integer,parameter::KROME_idx_SIC2Hj = 293	!SIC2H+
  integer,parameter::KROME_idx_SIC3j = 294	!SIC3+
  integer,parameter::KROME_idx_CH2SIj = 295	!CH2SI+
  integer,parameter::KROME_idx_SIH3j = 296	!SIH3+
  integer,parameter::KROME_idx_C2H2Nj = 297	!C2H2N+
  integer,parameter::KROME_idx_C2H3j = 298	!C2H3+
  integer,parameter::KROME_idx_C3H2j = 299	!C3H2+
  integer,parameter::KROME_idx_H2C3j = 300	!H2C3+
  integer,parameter::KROME_idx_C4Hj = 301	!C4H+
  integer,parameter::KROME_idx_C5j = 302	!C5+
  integer,parameter::KROME_idx_C4Sj = 303	!C4S+
  integer,parameter::KROME_idx_PC2Hj = 304	!PC2H+
  integer,parameter::KROME_idx_C3Nj = 305	!C3N+
  integer,parameter::KROME_idx_C4Nj = 306	!C4N+
  integer,parameter::KROME_idx_C3HNj = 307	!C3HN+
  integer,parameter::KROME_idx_HNCj = 308	!HNC+
  integer,parameter::KROME_idx_SIC3Hj = 309	!SIC3H+
  integer,parameter::KROME_idx_SIC4j = 310	!SIC4+
  integer,parameter::KROME_idx_SIC2H2j = 311	!SIC2H2+
  integer,parameter::KROME_idx_SICH3j = 312	!SICH3+
  integer,parameter::KROME_idx_HC2NCHj = 313	!HC2NCH+
  integer,parameter::KROME_idx_C3H3j = 314	!C3H3+
  integer,parameter::KROME_idx_H3C3j = 315	!H3C3+
  integer,parameter::KROME_idx_C5Hj = 316	!C5H+
  integer,parameter::KROME_idx_C6j = 317	!C6+
  integer,parameter::KROME_idx_C2H3Oj = 318	!C2H3O+
  integer,parameter::KROME_idx_C2H5j = 319	!C2H5+
  integer,parameter::KROME_idx_C3H3Nj = 320	!C3H3N+
  integer,parameter::KROME_idx_C5H2j = 321	!C5H2+
  integer,parameter::KROME_idx_C4H3j = 322	!C4H3+
  integer,parameter::KROME_idx_C6Hj = 323	!C6H+
  integer,parameter::KROME_idx_C7j = 324	!C7+
  integer,parameter::KROME_idx_CH4Nj = 325	!CH4N+
  integer,parameter::KROME_idx_C5HNj = 326	!C5HN+
  integer,parameter::KROME_idx_C7Hj = 327	!C7H+
  integer,parameter::KROME_idx_C8j = 328	!C8+
  integer,parameter::KROME_idx_COOCH4j = 329	!COOCH4+
  integer,parameter::KROME_idx_C2H5Oj = 330	!C2H5O+
  integer,parameter::KROME_idx_C8Hj = 331	!C8H+
  integer,parameter::KROME_idx_C9j = 332	!C9+
  integer,parameter::KROME_idx_C5H3j = 333	!C5H3+
  integer,parameter::KROME_idx_C6H2j = 334	!C6H2+
  integer,parameter::KROME_idx_C6H3j = 335	!C6H3+
  integer,parameter::KROME_idx_C2H6COj = 336	!C2H6CO+
  integer,parameter::KROME_idx_C9Hj = 337	!C9H+
  integer,parameter::KROME_idx_C10j = 338	!C10+
  integer,parameter::KROME_idx_C7H3j = 339	!C7H3+
  integer,parameter::KROME_idx_C8H2j = 340	!C8H2+
  integer,parameter::KROME_idx_C8H3j = 341	!C8H3+
  integer,parameter::KROME_idx_HCLj = 342	!HCL+
  integer,parameter::KROME_idx_Fj = 343	!F+
  integer,parameter::KROME_idx_HFj = 344	!HF+
  integer,parameter::KROME_idx_HSj = 345	!HS+
  integer,parameter::KROME_idx_NHj = 346	!NH+
  integer,parameter::KROME_idx_OHj = 347	!OH+
  integer,parameter::KROME_idx_PNj = 348	!PN+
  integer,parameter::KROME_idx_S2j = 349	!S2+
  integer,parameter::KROME_idx_SIHj = 350	!SIH+
  integer,parameter::KROME_idx_SIOj = 351	!SIO+
  integer,parameter::KROME_idx_H2Oj = 352	!H2O+
  integer,parameter::KROME_idx_HNSIj = 353	!HNSI+
  integer,parameter::KROME_idx_S2Hj = 354	!S2H+
  integer,parameter::KROME_idx_PH2j = 355	!PH2+
  integer,parameter::KROME_idx_H2CSj = 356	!H2CS+
  integer,parameter::KROME_idx_H2S2j = 357	!H2S2+
  integer,parameter::KROME_idx_HSIOj = 358	!HSIO+
  integer,parameter::KROME_idx_C4Pj = 359	!C4P+
  integer,parameter::KROME_idx_HCO2j = 360	!HCO2+
  integer,parameter::KROME_idx_PCH3j = 361	!PCH3+
  integer,parameter::KROME_idx_CH4j = 362	!CH4+
  integer,parameter::KROME_idx_C2NHj = 363	!C2NH+
  integer,parameter::KROME_idx_SIH4j = 364	!SIH4+
  integer,parameter::KROME_idx_NH4j = 365	!NH4+
  integer,parameter::KROME_idx_H2NCj = 366	!H2NC+
  integer,parameter::KROME_idx_C3H2Nj = 367	!C3H2N+
  integer,parameter::KROME_idx_C7H2j = 368	!C7H2+
  integer,parameter::KROME_idx_C5H4j = 369	!C5H4+
  integer,parameter::KROME_idx_C7HNj = 370	!C7HN+
  integer,parameter::KROME_idx_C9H2j = 371	!C9H2+
  integer,parameter::KROME_idx_C7H4j = 372	!C7H4+
  integer,parameter::KROME_idx_C9HNj = 373	!C9HN+
  integer,parameter::KROME_idx_N2j = 374	!N2+
  integer,parameter::KROME_idx_CO2j = 375	!CO2+
  integer,parameter::KROME_idx_HEHj = 376	!HEH+
  integer,parameter::KROME_idx_SO2j = 377	!SO2+
  integer,parameter::KROME_idx_C6H5j = 378	!C6H5+
  integer,parameter::KROME_idx_C5H5j = 379	!C5H5+
  integer,parameter::KROME_idx_N2Hj = 380	!N2H+
  integer,parameter::KROME_idx_NO2j = 381	!NO2+
  integer,parameter::KROME_idx_PC2H2j = 382	!PC2H2+
  integer,parameter::KROME_idx_PNH2j = 383	!PNH2+
  integer,parameter::KROME_idx_PCH2j = 384	!PCH2+
  integer,parameter::KROME_idx_HC2Sj = 385	!HC2S+
  integer,parameter::KROME_idx_HC3Sj = 386	!HC3S+
  integer,parameter::KROME_idx_H3CSj = 387	!H3CS+
  integer,parameter::KROME_idx_HC4Sj = 388	!HC4S+
  integer,parameter::KROME_idx_SIFj = 389	!SIF+
  integer,parameter::KROME_idx_SINH2j = 390	!SINH2+
  integer,parameter::KROME_idx_SIC2H3j = 391	!SIC2H3+
  integer,parameter::KROME_idx_SIC3H2j = 392	!SIC3H2+
  integer,parameter::KROME_idx_C2HOj = 393	!C2HO+
  integer,parameter::KROME_idx_H3Oj = 394	!H3O+
  integer,parameter::KROME_idx_H3Sj = 395	!H3S+
  integer,parameter::KROME_idx_HOCSj = 396	!HOCS+
  integer,parameter::KROME_idx_CH5Oj = 397	!CH5O+
  integer,parameter::KROME_idx_NCOj = 398	!NCO+
  integer,parameter::KROME_idx_HNCOj = 399	!HNCO+
  integer,parameter::KROME_idx_C2N2j = 400	!C2N2+
  integer,parameter::KROME_idx_O2Hj = 401	!O2H+
  integer,parameter::KROME_idx_CH5j = 402	!CH5+
  integer,parameter::KROME_idx_H2CLj = 403	!H2CL+
  integer,parameter::KROME_idx_H2Fj = 404	!H2F+
  integer,parameter::KROME_idx_CH3O2j = 405	!CH3O2+
  integer,parameter::KROME_idx_H2POj = 406	!H2PO+
  integer,parameter::KROME_idx_PNH3j = 407	!PNH3+
  integer,parameter::KROME_idx_PCH4j = 408	!PCH4+
  integer,parameter::KROME_idx_PC2H3j = 409	!PC2H3+
  integer,parameter::KROME_idx_HSISj = 410	!HSIS+
  integer,parameter::KROME_idx_HSOj = 411	!HSO+
  integer,parameter::KROME_idx_HNSj = 412	!HNS+
  integer,parameter::KROME_idx_HPNj = 413	!HPN+
  integer,parameter::KROME_idx_H2NOj = 414	!H2NO+
  integer,parameter::KROME_idx_NAH2Oj = 415	!NAH2O+
  integer,parameter::KROME_idx_PH3j = 416	!PH3+
  integer,parameter::KROME_idx_SINCHj = 417	!SINCH+
  integer,parameter::KROME_idx_HSIO2j = 418	!HSIO2+
  integer,parameter::KROME_idx_HSO2j = 419	!HSO2+
  integer,parameter::KROME_idx_HC3Oj = 420	!HC3O+
  integer,parameter::KROME_idx_PC3Hj = 421	!PC3H+
  integer,parameter::KROME_idx_H3S2j = 422	!H3S2+
  integer,parameter::KROME_idx_H3SIOj = 423	!H3SIO+
  integer,parameter::KROME_idx_PC4Hj = 424	!PC4H+
  integer,parameter::KROME_idx_NH2CNHj = 425	!NH2CNH+
  integer,parameter::KROME_idx_SIC4Hj = 426	!SIC4H+
  integer,parameter::KROME_idx_SICH4j = 427	!SICH4+
  integer,parameter::KROME_idx_SIH5j = 428	!SIH5+
  integer,parameter::KROME_idx_C2H4Nj = 429	!C2H4N+
  integer,parameter::KROME_idx_NH2CH2Oj = 430	!NH2CH2O+
  integer,parameter::KROME_idx_C2H6j = 431	!C2H6+
  integer,parameter::KROME_idx_C3H4Nj = 432	!C3H4N+
  integer,parameter::KROME_idx_C3H5j = 433	!C3H5+
  integer,parameter::KROME_idx_C4H4j = 434	!C4H4+
  integer,parameter::KROME_idx_CH6Nj = 435	!CH6N+
  integer,parameter::KROME_idx_C5H2Nj = 436	!C5H2N+
  integer,parameter::KROME_idx_C4H4Nj = 437	!C4H4N+
  integer,parameter::KROME_idx_H5C2O2j = 438	!H5C2O2+
  integer,parameter::KROME_idx_C2H5OH2j = 439	!C2H5OH2+
  integer,parameter::KROME_idx_CH3OCH4j = 440	!CH3OCH4+
  integer,parameter::KROME_idx_C7H2Nj = 441	!C7H2N+
  integer,parameter::KROME_idx_C3H6OHj = 442	!C3H6OH+
  integer,parameter::KROME_idx_C6H4Nj = 443	!C6H4N+
  integer,parameter::KROME_idx_C9H3j = 444	!C9H3+
  integer,parameter::KROME_idx_C7H5j = 445	!C7H5+
  integer,parameter::KROME_idx_C8H4Nj = 446	!C8H4N+
  integer,parameter::KROME_idx_C9H2Nj = 447	!C9H2N+
  integer,parameter::KROME_idx_C6H7j = 448	!C6H7+
  integer,parameter::KROME_idx_NAH2j = 449	!NAH2+
  integer,parameter::KROME_idx_PC2H4j = 450	!PC2H4+
  integer,parameter::KROME_idx_C4H5j = 451	!C4H5+
  integer,parameter::KROME_idx_H2CCLj = 452	!H2CCL+
  integer,parameter::KROME_idx_PC4H2j = 453	!PC4H2+
  integer,parameter::KROME_idx_C6H4j = 454	!C6H4+
  integer,parameter::KROME_idx_C8H4j = 455	!C8H4+
  integer,parameter::KROME_idx_C9H4j = 456	!C9H4+
  integer,parameter::KROME_idx_C4H7j = 457	!C4H7+
  integer,parameter::KROME_idx_HC4Nj = 458	!HC4N+
  integer,parameter::KROME_idx_HC4Oj = 459	!HC4O+
  integer,parameter::KROME_idx_C5Nj = 460	!C5N+
  integer,parameter::KROME_idx_H2C4Nj = 461	!H2C4N+
  integer,parameter::KROME_idx_H3C4Nj = 462	!H3C4N+
  integer,parameter::KROME_idx_C7Nj = 463	!C7N+
  integer,parameter::KROME_idx_C5H3Nj = 464	!C5H3N+
  integer,parameter::KROME_idx_C9Nj = 465	!C9N+
  integer,parameter::KROME_idx_C7H3Nj = 466	!C7H3N+
  integer,parameter::KROME_idx_C9H3Nj = 467	!C9H3N+
  integer,parameter::KROME_idx_OCSjH2 = 468	!OCS+H2
  integer,parameter::KROME_idx_H2C3Oj = 469	!H2C3O+
  integer,parameter::KROME_idx_H3C3Oj = 470	!H3C3O+
  integer,parameter::KROME_idx_C5H4Nj = 471	!C5H4N+
  integer,parameter::KROME_idx_C8H5j = 472	!C8H5+
  integer,parameter::KROME_idx_C9H5j = 473	!C9H5+
  integer,parameter::KROME_idx_CR = 474	!CR
  integer,parameter::KROME_idx_g = 475	!g
  integer,parameter::KROME_idx_Tgas = 476	!Tgas
  integer,parameter::KROME_idx_dummy = 477	!dummy

  integer,parameter::krome_idx_cool_h2 = 1
  integer,parameter::krome_idx_cool_h2gp = 2
  integer,parameter::krome_idx_cool_atomic = 3
  integer,parameter::krome_idx_cool_cen = 3
  integer,parameter::krome_idx_cool_hd = 4
  integer,parameter::krome_idx_cool_metal = 5
  integer,parameter::krome_idx_cool_z = 5
  integer,parameter::krome_idx_cool_dh = 6
  integer,parameter::krome_idx_cool_enthalpic = 6
  integer,parameter::krome_idx_cool_dust = 7
  integer,parameter::krome_idx_cool_compton = 8
  integer,parameter::krome_idx_cool_cie = 9
  integer,parameter::krome_idx_cool_cont = 10
  integer,parameter::krome_idx_cool_continuum = 10
  integer,parameter::krome_idx_cool_expansion = 11
  integer,parameter::krome_idx_cool_exp = 11
  integer,parameter::krome_idx_cool_ff = 12
  integer,parameter::krome_idx_cool_bss = 12
  integer,parameter::krome_idx_cool_custom = 13
  integer,parameter::krome_idx_cool_co = 14
  integer,parameter::krome_idx_cool_zcie = 15
  integer,parameter::krome_idx_cool_zcienouv = 16
  integer,parameter::krome_idx_cool_zextend = 17
  integer,parameter::krome_idx_cool_gh = 18
  integer,parameter::krome_idx_cool_oh = 19
  integer,parameter::krome_idx_cool_h2o = 20
  integer,parameter::krome_idx_cool_hcn = 21
  integer,parameter::krome_ncools = 21

  integer,parameter::krome_idx_heat_chem = 1
  integer,parameter::krome_idx_heat_compress = 2
  integer,parameter::krome_idx_heat_compr = 2
  integer,parameter::krome_idx_heat_photo = 3
  integer,parameter::krome_idx_heat_dh = 4
  integer,parameter::krome_idx_heat_enthalpic = 4
  integer,parameter::krome_idx_heat_av = 5
  integer,parameter::krome_idx_heat_photoav = 5
  integer,parameter::krome_idx_heat_cr = 6
  integer,parameter::krome_idx_heat_dust = 7
  integer,parameter::krome_idx_heat_xray = 8
  integer,parameter::krome_idx_heat_viscous = 9
  integer,parameter::krome_idx_heat_visc = 9
  integer,parameter::krome_idx_heat_custom = 10
  integer,parameter::krome_idx_heat_zcie = 11
  integer,parameter::krome_nheats = 11

  integer,parameter::krome_nrea=4484
  integer,parameter::krome_nmols=473
  integer,parameter::krome_nspec=477
  integer,parameter::krome_natoms=16
  integer,parameter::krome_ndust=0
  integer,parameter::krome_ndustTypes=0
  integer,parameter::krome_nPhotoBins=0
  integer,parameter::krome_nPhotoRates=0

  real*8,parameter::krome_boltzmann_eV = 8.617332478d-5 !eV / K
  real*8,parameter::krome_boltzmann_J = 1.380648d-23 !J / K
  real*8,parameter::krome_boltzmann_erg = 1.380648d-16 !erg / K
  real*8,parameter::krome_iboltzmann_eV = 1d0/krome_boltzmann_eV !K / eV
  real*8,parameter::krome_iboltzmann_erg = 1d0/krome_boltzmann_erg !K / erg
  real*8,parameter::krome_planck_eV = 4.135667516d-15 !eV s
  real*8,parameter::krome_planck_J = 6.62606957d-34 !J s
  real*8,parameter::krome_planck_erg = 6.62606957d-27 !erg s
  real*8,parameter::krome_iplanck_eV = 1d0/krome_planck_eV !1 / eV / s
  real*8,parameter::krome_iplanck_J = 1d0/krome_planck_J !1 / J / s
  real*8,parameter::krome_iplanck_erg = 1d0/krome_planck_erg !1 / erg / s
  real*8,parameter::krome_gravity = 6.674d-8 !cm3 / g / s2
  real*8,parameter::krome_e_mass = 9.10938188d-28 !g
  real*8,parameter::krome_p_mass = 1.67262158d-24 !g
  real*8,parameter::krome_n_mass = 1.674920d-24 !g
  real*8,parameter::krome_ip_mass = 1d0/krome_p_mass !1/g
  real*8,parameter::krome_clight = 2.99792458e10 !cm/s
  real*8,parameter::krome_pi = 3.14159265359d0 !#
  real*8,parameter::krome_eV_to_erg = 1.60217646d-12 !eV -> erg
  real*8,parameter::krome_ry_to_eV = 13.60569d0 !rydberg -> eV
  real*8,parameter::krome_ry_to_erg = 2.179872d-11 !rydberg -> erg
  real*8,parameter::krome_seconds_per_year = 365d0*24d0*3600d0 !yr -> s
  real*8,parameter::krome_km_to_cm = 1d5 !km -> cm
  real*8,parameter::krome_cm_to_Mpc = 1.d0/3.08d24 !cm -> Mpc
  real*8,parameter::krome_kvgas_erg = 8.d0*krome_boltzmann_erg/krome_pi/krome_p_mass !
  real*8,parameter::krome_pre_kvgas_sqrt = sqrt(8.d0*krome_boltzmann_erg/krome_pi) !
  real*8,parameter::krome_pre_planck = 2.d0*krome_planck_erg/krome_clight**2 !erg/cm2*s3
  real*8,parameter::krome_exp_planck = krome_planck_erg / krome_boltzmann_erg !s*K
  real*8,parameter::krome_stefboltz_erg = 5.670373d-5 !erg/s/cm2/K4
  real*8,parameter::krome_N_avogadro = 6.0221d23 !#
  real*8,parameter::krome_Rgas_J = 8.3144621d0 !J/K/mol
  real*8,parameter::krome_Rgas_kJ = 8.3144621d-3 !kJ/K/mol
  real*8,parameter::krome_hubble = 0.704d0 !dimensionless
  real*8,parameter::krome_Omega0 = 1.0d0 !dimensionless
  real*8,parameter::krome_Omegab = 0.0456d0 !dimensionless
  real*8,parameter::krome_Hubble0 = 1.d2*krome_hubble*krome_km_to_cm*krome_cm_to_Mpc !1/s

contains

  !*******************
  subroutine krome_set_user_Av(argset)
    use krome_commons
    implicit none
    real*8 :: argset
    user_Av = argset
  end subroutine krome_set_user_Av

  !*******************
  function krome_get_user_Av()
    use krome_commons
    implicit none
    real*8 :: krome_get_user_Av
    krome_get_user_Av = user_Av
  end function krome_get_user_Av

  !*******************
  subroutine krome_set_user_crate(argset)
    use krome_commons
    implicit none
    real*8 :: argset
    user_crate = argset
  end subroutine krome_set_user_crate

  !*******************
  function krome_get_user_crate()
    use krome_commons
    implicit none
    real*8 :: krome_get_user_crate
    krome_get_user_crate = user_crate
  end function krome_get_user_crate

  !*******************
  subroutine krome_set_user_gas_dust_ratio(argset)
    use krome_commons
    implicit none
    real*8 :: argset
    user_gas_dust_ratio = argset
  end subroutine krome_set_user_gas_dust_ratio

  !*******************
  function krome_get_user_gas_dust_ratio()
    use krome_commons
    implicit none
    real*8 :: krome_get_user_gas_dust_ratio
    krome_get_user_gas_dust_ratio = user_gas_dust_ratio
  end function krome_get_user_gas_dust_ratio

  !*******************
  subroutine krome_set_user_J21xr(argset)
    use krome_commons
    implicit none
    real*8 :: argset
    user_J21xr = argset
  end subroutine krome_set_user_J21xr

  !*******************
  function krome_get_user_J21xr()
    use krome_commons
    implicit none
    real*8 :: krome_get_user_J21xr
    krome_get_user_J21xr = user_J21xr
  end function krome_get_user_J21xr

  !************************
  !returns the Tdust averaged over the number density
  ! as computed in the tables
  function krome_get_table_Tdust(x,Tgas)
    use krome_commons
    use krome_grfuncs
    implicit none
    real*8 :: Tgas
    real*8 :: x(nmols), krome_get_table_Tdust
    real*8::n(nspec)

    n(:) = 0d0
    n(1:nmols) = x(:)
    n(idx_Tgas) = Tgas

    krome_get_table_Tdust = get_table_Tdust(n(:))

  end function krome_get_table_Tdust

  !**********************
  !convert from MOCASSIN abundances to KROME
  ! xmoc(i,j): MOCASSIN matrix (note: cm-3, real*4)
  !  i=species, j=ionization level
  ! imap: matrix position index map, integer
  ! returns KROME abundances (cm-3, real*8)
  function krome_convert_xmoc(xmoc,imap) result(x)
    use krome_commons
    use krome_subs
    use krome_getphys
    implicit none
    real*4,intent(in):: xmoc(:,:)
    real*8::x(nmols),n(nspec)
    integer,intent(in)::imap(:)

    x(:) = 0d0

    x(idx_C) = xmoc(imap(6), 1)
    x(idx_FE) = xmoc(imap(26), 1)
    x(idx_H) = xmoc(imap(1), 1)
    x(idx_HE) = xmoc(imap(2), 1)
    x(idx_MG) = xmoc(imap(12), 1)
    x(idx_N) = xmoc(imap(7), 1)
    x(idx_NA) = xmoc(imap(11), 1)
    x(idx_O) = xmoc(imap(8), 1)
    x(idx_S) = xmoc(imap(16), 1)
    x(idx_SI) = xmoc(imap(14), 1)
    x(idx_CL) = xmoc(imap(17), 1)
    x(idx_P) = xmoc(imap(15), 1)
    x(idx_F) = xmoc(imap(9), 1)
    x(idx_Cj) = xmoc(imap(6), 2)
    x(idx_FEj) = xmoc(imap(26), 2)
    x(idx_Hj) = xmoc(imap(1), 2)
    x(idx_HEj) = xmoc(imap(2), 2)
    x(idx_MGj) = xmoc(imap(12), 2)
    x(idx_Nj) = xmoc(imap(7), 2)
    x(idx_NAj) = xmoc(imap(11), 2)
    x(idx_Oj) = xmoc(imap(8), 2)
    x(idx_Sj) = xmoc(imap(16), 2)
    x(idx_SIj) = xmoc(imap(14), 2)
    x(idx_CLj) = xmoc(imap(17), 2)
    x(idx_Pj) = xmoc(imap(15), 2)
    x(idx_Fj) = xmoc(imap(9), 2)

    n(1:nmols) = x(:)
    n(nmols+1:nspec) = 0d0
    x(idx_e) = get_electrons(n(:))

  end function krome_convert_xmoc

  !*************************
  !convert from KROME abundances to MOCASSIN
  ! x: KROME abuances (cm-3, real*8)
  ! imap: matrix position index map, integer
  ! xmoc(i,j): MOCASSIN matrix (note: cm-3, real*4)
  !  i=species, j=ionization level
  subroutine krome_return_xmoc(x,imap,xmoc)
    use krome_commons
    implicit none
    real*8,intent(in)::x(nmols)
    real*4,intent(out)::xmoc(:,:)
    integer,intent(in)::imap(:)

    xmoc(:,:) = 0d0

    xmoc(imap(6), 1) = x(idx_C)
    xmoc(imap(26), 1) = x(idx_FE)
    xmoc(imap(1), 1) = x(idx_H)
    xmoc(imap(2), 1) = x(idx_HE)
    xmoc(imap(12), 1) = x(idx_MG)
    xmoc(imap(7), 1) = x(idx_N)
    xmoc(imap(11), 1) = x(idx_NA)
    xmoc(imap(8), 1) = x(idx_O)
    xmoc(imap(16), 1) = x(idx_S)
    xmoc(imap(14), 1) = x(idx_SI)
    xmoc(imap(17), 1) = x(idx_CL)
    xmoc(imap(15), 1) = x(idx_P)
    xmoc(imap(9), 1) = x(idx_F)
    xmoc(imap(6), 2) = x(idx_Cj)
    xmoc(imap(26), 2) = x(idx_FEj)
    xmoc(imap(1), 2) = x(idx_Hj)
    xmoc(imap(2), 2) = x(idx_HEj)
    xmoc(imap(12), 2) = x(idx_MGj)
    xmoc(imap(7), 2) = x(idx_Nj)
    xmoc(imap(11), 2) = x(idx_NAj)
    xmoc(imap(8), 2) = x(idx_Oj)
    xmoc(imap(16), 2) = x(idx_Sj)
    xmoc(imap(14), 2) = x(idx_SIj)
    xmoc(imap(17), 2) = x(idx_CLj)
    xmoc(imap(15), 2) = x(idx_Pj)
    xmoc(imap(9), 2) = x(idx_Fj)

  end subroutine krome_return_xmoc

  !**********************
  !convert number density (cm-3) into column
  ! density (cm-2) using the specific density
  ! column method (see help for option
  ! -columnDensityMethod)
  ! num is the number density, x(:) is the species
  ! array, Tgas is the gas temperature
  ! If the method is not JEANS, x(:) and Tgas
  ! are dummy variables
  function krome_num2col(num,x,Tgas)
    use krome_subs
    use krome_commons
    use krome_getphys
    implicit none
    real*8 :: x(nmols),krome_num2col
    real*8 :: Tgas,num
    real*8::n(nspec)

    n(:) = 0d0
    n(1:nmols) = x(:)
    n(idx_Tgas) = Tgas

    krome_num2col = num2col(num,n(:))

  end function krome_num2col

  !***********************
  !print on screen the current values of all phys variables
  subroutine krome_print_phys_variables()
    use krome_commons
    implicit none

    print *, "Tcmb:", phys_Tcmb
    print *, "zredshift:", phys_zredshift
    print *, "orthoParaRatio:", phys_orthoParaRatio
    print *, "metallicity:", phys_metallicity
    print *, "Tfloor:", phys_Tfloor

  end subroutine krome_print_phys_variables

  !*******************
  subroutine krome_set_Tcmb(arg)
    use krome_commons
    implicit none
    real*8 :: arg
    phys_Tcmb = arg
  end subroutine krome_set_Tcmb

  !*******************
  function krome_get_Tcmb()
    use krome_commons
    implicit none
    real*8 :: krome_get_Tcmb
    krome_get_Tcmb = phys_Tcmb
  end function krome_get_Tcmb

  !*******************
  subroutine krome_set_zredshift(arg)
    use krome_commons
    implicit none
    real*8 :: arg
    phys_zredshift = arg
  end subroutine krome_set_zredshift

  !*******************
  function krome_get_zredshift()
    use krome_commons
    implicit none
    real*8 :: krome_get_zredshift
    krome_get_zredshift = phys_zredshift
  end function krome_get_zredshift

  !*******************
  subroutine krome_set_orthoParaRatio(arg)
    use krome_commons
    implicit none
    real*8 :: arg
    phys_orthoParaRatio = arg
  end subroutine krome_set_orthoParaRatio

  !*******************
  function krome_get_orthoParaRatio()
    use krome_commons
    implicit none
    real*8 :: krome_get_orthoParaRatio
    krome_get_orthoParaRatio = phys_orthoParaRatio
  end function krome_get_orthoParaRatio

  !*******************
  subroutine krome_set_metallicity(arg)
    use krome_commons
    implicit none
    real*8 :: arg
    phys_metallicity = arg
  end subroutine krome_set_metallicity

  !*******************
  function krome_get_metallicity()
    use krome_commons
    implicit none
    real*8 :: krome_get_metallicity
    krome_get_metallicity = phys_metallicity
  end function krome_get_metallicity

  !*******************
  subroutine krome_set_Tfloor(arg)
    use krome_commons
    implicit none
    real*8 :: arg
    phys_Tfloor = arg
  end subroutine krome_set_Tfloor

  !*******************
  function krome_get_Tfloor()
    use krome_commons
    implicit none
    real*8 :: krome_get_Tfloor
    krome_get_Tfloor = phys_Tfloor
  end function krome_get_Tfloor

  !****************************
  !set value of J21xrays for tabulated
  ! heating and corresponding rate
  subroutine krome_set_J21xray(xarg)
    use krome_commons
    implicit none
    real*8 :: xarg

    J21xray = xarg

  end subroutine krome_set_J21xray

  !*****************************
  !dump the data for restart (UNDER DEVELOPEMENT!)
  !arguments: the species array and the gas temperature
  subroutine krome_store(x,Tgas,dt)
    use krome_commons
    implicit none
    integer::nfile,i
    real*8 :: x(nmols)
    real*8 :: Tgas,dt

    nfile = 92

    open(nfile,file="krome_dump.dat",status="replace")
    !dump temperature
    write(nfile,*) Tgas
    write(nfile,*) dt
    !dump species
    do i=1,nmols
      write(nfile,*) x(i)
    end do
    close(nfile)

  end subroutine krome_store

  !*****************************
  !restore the data from a dump (UNDER DEVELOPEMENT!)
  !arguments: the species array and the gas temperature
  subroutine krome_restore(x,Tgas,dt)
    use krome_commons
    implicit none
    integer::nfile,i
    real*8 :: x(nmols)
    real*8 :: Tgas,dt

    nfile = 92

    open(nfile,file="krome_dump.dat",status="old")
    !restore temperature
    read(nfile,*) Tgas
    read(nfile,*) dt
    !restore species
    do i=1,nmols
      read(nfile,*) x(i)
    end do
    close(nfile)

  end subroutine krome_restore

  !****************************
  !switch on the thermal calculation
  subroutine krome_thermo_on()
    use krome_commons
    krome_thermo_toggle = 1
  end subroutine krome_thermo_on

  !****************************
  !switch off the thermal calculation
  subroutine krome_thermo_off()
    use krome_commons
    krome_thermo_toggle = 0
  end subroutine krome_thermo_off

  !***************************
  !alias for coe in krome_subs
  ! returns the coefficient array of size krome_nrea
  ! for a given Tgas
  function krome_get_coef(Tgas,x)
    use krome_commons
    use krome_subs
    use krome_tabs
    real*8 :: krome_get_coef(nrea),x(nmols)
    real*8,value:: Tgas
    real*8::n(nspec)
    n(:) = 0d0
    n(1:nmols) = x(:)
    n(idx_Tgas) = Tgas

    call makeStoreOnceRates(n(:))

    krome_get_coef(:) = coe(n(:))

  end function krome_get_coef

  !****************************
  !get the mean molecular weight from
  ! mass fractions
  function krome_get_mu_x(xin)
    use krome_commons
    implicit none
    real*8 :: xin(nmols), krome_get_mu_x
    real*8::n(nmols)
    n(:) = krome_x2n(xin(:),1d0)
    krome_get_mu_x = krome_get_mu(n(:))
  end function krome_get_mu_x

  !****************************
  !return the adiabatic index from mass fractions
  ! and temperature in K
  function krome_get_gamma_x(xin,inTgas)
    use krome_commons
    implicit none
    real*8 :: inTgas
    real*8 :: xin(nmols), krome_get_gamma_x
    real*8::x(nmols),Tgas,rhogas

    Tgas = inTgas
    x(:) = krome_x2n(xin(:),1d0)
    krome_get_gamma_x = krome_get_gamma(x(:),Tgas)

  end function krome_get_gamma_x

  !***************************
  !normalize mass fractions and
  ! set charge to zero
  subroutine krome_consistent_x(x)
    use krome_commons
    use krome_constants
    implicit none
    real*8 :: x(nmols)
    real*8::isumx,sumx,xerr,imass(nmols),ee

    !1. charge consistency
    imass(:) = krome_get_imass()

    x(idx_e) = 0.d0

    ee = sum(krome_get_charges()*x(:)*imass(:))
    ee = max(ee*e_mass,0d0)
    x(idx_e) = ee

    !2. mass fraction consistency
    sumx = sum(x)

    !NOTE: uncomment here if you want some additional control
    !conservation error threshold: rise an error if above xerr
    !xerr = 1d-2
    !if(abs(sum-1d0)>xerr) then
    !   print *,"ERROR: some problem with conservation!"
    !   print *,"|sum(x)-1|=",abs(sum-1d0)
    !   stop
    !end if

    isumx = 1d0/sumx
    x(:) = x(:) * isumx

  end subroutine krome_consistent_x

  !*********************
  !return an array sized krome_nmols containing
  ! the mass fractions (#), computed from the number
  ! densities (1/cm3) and the total density in g/cm3
  function krome_n2x(n,rhogas)
    use krome_commons
    implicit none
    real*8 :: n(nmols),krome_n2x(nmols)
    real*8,value :: rhogas

    krome_n2x(:) = n(:) * krome_get_mass() / rhogas

  end function krome_n2x

  !********************
  !return an array sized krome_nmols containing
  ! the number densities (1/cm3), computed from the mass
  ! fractions and the total density in g/cm3
  function krome_x2n(x,rhogas)
    use krome_commons
    implicit none
    real*8 :: x(nmols),krome_x2n(nmols)
    real*8,value :: rhogas

    !compute densities from fractions
    krome_x2n(:) = rhogas * x(:) * krome_get_imass()

  end function krome_x2n

  !******************
  !returns free-fall time using the number density
  ! abundances of array x(:)
  function krome_get_free_fall_time(x)
    use krome_commons
    use krome_getphys
    implicit none
    real*8::krome_get_free_fall_time
    real*8::x(:),n(nspec)

    n(1:nmols) = x(:)
    n(nmols+1:nspec) = 0d0
    krome_get_free_fall_time = get_free_fall_time(n(:))

  end function krome_get_free_fall_time

  !******************
  !returns free-fall time using the total mass density
  !  of gas, rhogas (g/cm3)
  function krome_get_free_fall_time_rho(rhogas)
    use krome_getphys
    implicit none
    real*8::krome_get_free_fall_time_rho
    real*8::rhogas

    krome_get_free_fall_time_rho = get_free_fall_time_rho(rhogas)

  end function krome_get_free_fall_time_rho

  !*******************
  !do only cooling and heating
  subroutine krome_thermo(x,Tgas,dt)
    use krome_commons
    use krome_cooling
    use krome_heating
    use krome_subs
    use krome_tabs
    use krome_constants
    use krome_gadiab
    implicit none
    real*8 :: x(nmols)
    real*8 :: Tgas,dt
    real*8::n(nspec),nH2dust,dTgas,k(nrea),krome_gamma

  end subroutine krome_thermo

  !*************************
  !get heating (erg/cm3/s) for a given species
  ! array x(:) and Tgas
  function krome_get_heating(x,inTgas)
    use krome_heating
    use krome_subs
    use krome_commons
    implicit none
    real*8 :: inTgas
    real*8 :: x(nmols), krome_get_heating
    real*8::Tgas,k(nrea),nH2dust,n(nspec)
    n(1:nmols) = x(:)
    Tgas = inTgas
    n(idx_Tgas) = Tgas
    k(:) = coe(n(:))
    nH2dust = 0d0
    krome_get_heating = heating(n(:),Tgas,k(:),nH2dust)
  end function krome_get_heating

  !*****************************
  ! get an array containing individual heatings (erg/cm3/s)
  ! the array has size krome_nheats. see heatcool.gps
  ! for index list
  function krome_get_heating_array(x,inTgas)
    use krome_heating
    use krome_subs
    use krome_commons
    implicit none
    real*8::n(nspec),Tgas,k(nrea),nH2dust
    real*8 :: x(nmols),krome_get_heating_array(nheats)
    real*8,value :: inTgas

    n(:) = 0d0
    n(1:nmols) = x(:)
    n(idx_Tgas) = inTgas
    !#KROME_Tdust_copy
    k(:) = coe(n(:))
    Tgas = inTgas
    nH2dust = 0d0
    krome_get_heating_array(:) = get_heating_array(n(:),Tgas,k(:),nH2dust)

  end function krome_get_heating_array

  !************************
  !conserve the total amount of nucleii,
  ! alias for conserveLin_x in subs
  subroutine krome_conserveLin_x(x,ref)
    use krome_commons
    use krome_subs
    implicit none
    real*8 :: x(nmols),ref(natoms)

    call conserveLin_x(x(:),ref(:))

  end subroutine krome_conserveLin_x

  !************************
  !conserve the total amount of nucleii,
  ! alias for conserveLin_x in subs
  function krome_conserveLinGetRef_x(x)
    use krome_commons
    use krome_subs
    implicit none
    real*8 :: x(nmols),krome_conserveLinGetRef_x(natoms)

    krome_conserveLinGetRef_x(:) = &
        conserveLinGetRef_x(x(:))

  end function krome_conserveLinGetRef_x

  !*************************
  !force conservation to array x(:)
  !using xi(:) as initial abundances.
  !alias for conserve in krome_subs
  function krome_conserve(x,xi)
    use krome_subs
    implicit none
    real*8 :: x(krome_nmols),xi(krome_nmols),krome_conserve(krome_nmols)
    real*8::n(krome_nspec),ni(krome_nspec)

    n(:) = 0d0
    ni(:) = 0d0
    n(1:krome_nmols) = x(1:krome_nmols)
    ni(1:krome_nmols) = xi(1:krome_nmols)
    n(:) = conserve(n(:), ni(:))
    krome_conserve(:) = n(1:krome_nmols)

  end function krome_conserve

  !***************************
  !get the adiabatic index for x(:) species abundances
  ! and Tgas.
  ! alias for gamma_index in krome_subs
  function krome_get_gamma(x,Tgas)
    use krome_subs
    use krome_commons
    use krome_gadiab
    real*8 :: Tgas
    real*8 :: x(nmols), krome_get_gamma
    real*8::n(nspec)
    n(:) = 0.d0
    n(1:nmols) = x(:)
    n(idx_Tgas) = Tgas
    krome_get_gamma = gamma_index(n(:))
  end function krome_get_gamma

  !***************************
  !get an integer array containing the atomic numbers Z
  ! of the spcecies.
  ! alias for get_zatoms
  function krome_get_zatoms()
    use krome_subs
    use krome_commons
    use krome_getphys
    implicit none
    integer :: krome_get_zatoms(nmols)
    integer::zatoms(nspec)

    zatoms(:) = get_zatoms()
    krome_get_zatoms(:) = zatoms(1:nmols)

  end function krome_get_zatoms

  !****************************
  !get the mean molecular weight from
  ! number density and mass density.
  ! alias for get_mu in krome_subs module
  function krome_get_mu(x)
    use krome_commons
    use krome_subs
    use krome_getphys
    implicit none
    real*8 :: x(nmols), krome_get_mu
    real*8::n(1:nspec)
    n(:) = 0d0
    n(1:nmols) = x(:)
    krome_get_mu = get_mu(n(:))
  end function krome_get_mu

  !***************************
  !get the names of the reactions as a
  ! character*50 array of krome_nrea
  ! elements
  !! !! cannot yet be called from C
  function krome_get_rnames()
    use krome_commons
    use krome_subs
    use krome_getphys
    implicit none
    character*50 :: krome_get_rnames(nrea)

    krome_get_rnames(:) = get_rnames()

  end function krome_get_rnames

  !*****************
  !get an array of double containing the masses in g
  ! of the species.
  ! alias for get_mass in krome_subs
  function krome_get_mass()
    use krome_subs
    use krome_commons
    use krome_getphys
    implicit none
    real*8::tmp(nspec)
    real*8 :: krome_get_mass(nmols)
    tmp(:) = get_mass()
    krome_get_mass = tmp(1:nmols)
  end function krome_get_mass

  !*****************
  !get an array of double containing the inverse
  ! of the mass (1/g) of the species
  !alias for get_imass in krome_subs
  function krome_get_imass()
    use krome_subs
    use krome_commons
    use krome_getphys
    implicit none
    real*8::tmp(nspec)
    real*8 :: krome_get_imass(nmols)
    tmp(:) = get_imass()
    krome_get_imass = tmp(1:nmols)
  end function krome_get_imass

  !***********************
  !get the total number of H nuclei
  function krome_get_Hnuclei(x)
    use krome_commons
    use krome_subs
    use krome_getphys
    real*8::n(nspec)
    real*8 :: krome_get_Hnuclei, x(nmols)
    n(:) = 0d0
    n(1:nmols) = x(:)

    krome_get_Hnuclei = get_Hnuclei(n(:))

  end function krome_get_Hnuclei

  !*****************
  !get an array of size krome_nmols containing the
  ! charges of the species.
  ! alias for get_charges
  function krome_get_charges()
    use krome_subs
    use krome_commons
    use krome_getphys
    implicit none
    real*8::tmp(nspec)
    real*8 :: krome_get_charges(nmols)
    tmp(:) = get_charges()
    krome_get_charges = tmp(1:nmols)
  end function krome_get_charges

  !*****************
  !get an array of character*16 and size krome_nmols
  ! containing the names of all the species.
  ! alias for get_names
  !!  !! cannot yet be called from C
  function krome_get_names()
    use krome_subs
    use krome_commons
    use krome_getphys
    implicit none
    character*16 :: krome_get_names(nmols)
    character*16::tmp(nspec)
    tmp(:) = get_names()
    krome_get_names = tmp(1:nmols)
  end function krome_get_names

  !********************
  !get space-separated header of chemical species
  function krome_get_names_header()
    use krome_commons
    use krome_getphys
    implicit none
    character*2680::krome_get_names_header
    character*16::tmp(nspec)
    integer::i

    tmp(:) = get_names()

    krome_get_names_header = ""
    do i=1,nmols
      krome_get_names_header = trim(krome_get_names_header)//" "//trim(tmp(i))
    end do

  end function krome_get_names_header

  !********************
  !get space-separated header of coolings
  function krome_get_cooling_names_header()
    use krome_commons
    use krome_getphys
    implicit none
    character*141::krome_get_cooling_names_header
    character*16::tmp(ncools)
    integer::i

    tmp(:) = get_cooling_names()

    krome_get_cooling_names_header = ""
    do i=1,ncools
      if(trim(tmp(i))=="") cycle
      krome_get_cooling_names_header = trim(krome_get_cooling_names_header)//" "//trim(tmp(i))
    end do

  end function krome_get_cooling_names_header

  !********************
  !get space-separated header of heatings
  function krome_get_heating_names_header()
    use krome_commons
    use krome_getphys
    implicit none
    character*87::krome_get_heating_names_header
    character*16::tmp(nheats)
    integer::i

    tmp(:) = get_heating_names()

    krome_get_heating_names_header = ""
    do i=1,nheats
      if(trim(tmp(i))=="") cycle
      krome_get_heating_names_header = trim(krome_get_heating_names_header)//" "//trim(tmp(i))
    end do

  end function krome_get_heating_names_header

  !*****************
  !get the index of the species with name name.
  ! alias for get_index
  !! !! cannot yet be called from C
  function krome_get_index(name)
    use krome_subs
    implicit none
    integer :: krome_get_index
    character*(*) :: name
    krome_get_index = get_index(name)
  end function krome_get_index

  !*******************
  !get the total density of the gas in g/cm3
  ! giving all the number densities n(:)
  function krome_get_rho(n)
    use krome_commons
    real*8 :: krome_get_rho, n(nmols)
    real*8::m(nmols)
    m(:) = krome_get_mass()
    krome_get_rho = sum(m(:)*n(:))
  end function krome_get_rho

  !*************************
  !scale the abundances of the metals contained in n(:)
  ! to Z according to Asplund+2009.
  ! note that this applies only to neutral atoms.
  subroutine krome_scale_Z(x,Z)
    use krome_commons
    use krome_getphys
    real*8 :: x(nmols)
    real*8 :: Z
    real*8::Htot,n(nspec)

    n(1:nmols) = x(:)
    n(nmols+1:nspec) = 0d0

    Htot = get_Hnuclei(n(:))
    x(idx_NA) = max(Htot * 1d1**(Z+(-5.76)), 1d-40)
    x(idx_C) = max(Htot * 1d1**(Z+(-3.57)), 1d-40)
    x(idx_FE) = max(Htot * 1d1**(Z+(-4.5)), 1d-40)
    x(idx_HF) = max(Htot * 1d1**(Z+(-11.15)), 1d-40)
    x(idx_MG) = max(Htot * 1d1**(Z+(-4.4)), 1d-40)
    x(idx_F) = max(Htot * 1d1**(Z+(-7.44)), 1d-40)
    x(idx_O) = max(Htot * 1d1**(Z+(-3.31)), 1d-40)
    x(idx_P) = max(Htot * 1d1**(Z+(-6.59)), 1d-40)
    x(idx_SI) = max(Htot * 1d1**(Z+(-4.49)), 1d-40)
    x(idx_N) = max(Htot * 1d1**(Z+(-4.17)), 1d-40)
    x(idx_CL) = max(Htot * 1d1**(Z+(-6.5)), 1d-40)
    x(idx_S) = max(Htot * 1d1**(Z+(-4.88)), 1d-40)

  end subroutine krome_scale_Z

  !*************************
  !set the total metallicity
  ! in terms of Z/Z_solar
  subroutine krome_set_Z(xarg)
    use krome_commons
    real*8 :: xarg

    total_Z = xarg

  end subroutine krome_set_Z

  !*************************
  !set D is in terms of D_solar (D/D_sol).
  subroutine krome_set_dust_to_gas(xarg)
    use krome_commons
    real*8 :: xarg

    dust2gas_ratio = xarg

  end subroutine

  !*************************
  !set the clumping factor
  subroutine krome_set_clump(xarg)
    use krome_commons
    real*8 :: xarg

    clump_factor = xarg

  end subroutine krome_set_clump

  !***********************
  !get the number of electrons assuming
  ! total neutral charge (cations-anions)
  function krome_get_electrons(x)
    use krome_commons
    use krome_subs
    use krome_getphys
    real*8 :: x(nmols), krome_get_electrons
    real*8::n(nspec)
    n(1:nmols) = x(:)
    n(nmols+1:nspec) = 0d0
    krome_get_electrons = get_electrons(n(:))
  end function krome_get_electrons

  !**********************
  !print on screen the first nbest highest reaction fluxes
  subroutine krome_print_best_flux(xin,Tgas,nbest)
    use krome_subs
    use krome_commons
    implicit none
    real*8 :: xin(nmols)
    real*8 :: Tgas
    real*8::x(nmols),n(nspec)
    integer :: nbest
    n(1:nmols) = xin(:)
    n(idx_Tgas) = Tgas
    call print_best_flux(n,Tgas,nbest)

  end subroutine krome_print_best_flux

  !*********************
  !print only the highest fluxes greater than a fraction frac
  ! of the maximum flux
  subroutine krome_print_best_flux_frac(xin,Tgas,frac)
    use krome_subs
    use krome_commons
    implicit none
    real*8 :: xin(nmols)
    real*8 :: Tgas,frac
    real*8::n(nspec)
    n(1:nmols) = xin(:)
    n(idx_Tgas) = Tgas
    call print_best_flux_frac(n,Tgas,frac)

  end subroutine krome_print_best_flux_frac

  !**********************
  !print the highest nbest fluxes for reactions involving
  !a given species using the index idx_find (e.g. krome_idx_H2)
  subroutine krome_print_best_flux_spec(xin,Tgas,nbest,idx_find)
    use krome_subs
    use krome_commons
    implicit none
    real*8 :: xin(nmols)
    real*8 :: Tgas
    real*8::n(nspec)
    integer :: nbest,idx_find
    n(1:nmols) = xin(:)
    n(idx_Tgas) = Tgas
    call print_best_flux_spec(n,Tgas,nbest,idx_find)
  end subroutine krome_print_best_flux_spec

  !*******************************
  !get an array of size krome_nrea with
  ! the fluxes of all the reactions in cm-3/s
  function krome_get_flux(n,Tgas)
    use krome_commons
    use krome_subs
    real*8 :: krome_get_flux(nrea),n(nmols)
    real*8,value :: Tgas
    real*8::x(nspec)
    x(:) = 0.d0
    x(1:nmols) = n(:)
    x(idx_Tgas) = Tgas
    krome_get_flux(:) = get_flux(x(:), Tgas)
  end function krome_get_flux

  !*****************************
  !store the fluxes to the file unit ifile
  ! using the chemical composition x(:), and the
  ! gas temperature Tgas. xvar is th value of an
  ! user-defined independent variable that
  ! can be employed for plots.
  ! the file columns are as follow
  ! rate number, xvar, absolute flux,
  !  flux/maxflux, flux fraction wrt total,
  !  reaction name (*50 string)
  subroutine krome_explore_flux(x,Tgas,ifile,xvar)
    use krome_commons
    use krome_subs
    use krome_getphys
    implicit none
    real*8 :: x(nmols)
    real*8 :: Tgas,xvar
    real*8::flux(nrea),fluxmax,sumflux,n(nspec)
    integer :: ifile
    integer::i
    character*50::rname(nrea)

    !get reaction names
    rname(:) = get_rnames()
    n(:) = 0d0
    n(1:nmols) = x(:)
    n(idx_Tgas) = Tgas
    !get fluxes
    flux(:) = get_flux(n(:), Tgas)
    fluxmax = maxval(flux) !maximum flux
    sumflux = sum(flux) !sum of all the fluxes
    !loop on reactions
    do i=1,nrea
      write(ifile,'(I8,5E17.8e3,a3,a50)') i,xvar,Tgas,flux(i),&
          flux(i)/fluxmax, flux(i)/sumflux," ",rname(i)
    end do
    write(ifile,*)

  end subroutine krome_explore_flux

  !*********************
  !get nulcear qeff for the reactions
  function krome_get_qeff()
    use krome_commons
    use krome_subs
    use krome_getphys
    implicit none
    real*8 :: krome_get_qeff(nrea)

    krome_get_qeff(:) = get_qeff()

  end function krome_get_qeff

  !************************
  !dump the fluxes to the file unit nfile
  subroutine krome_dump_flux(n,Tgas,nfile)
    use krome_commons
    real*8 :: n(nmols)
    real*8 :: Tgas
    real*8::flux(nrea)
    integer :: nfile
    integer::i

    flux(:) = krome_get_flux(n(:),Tgas)
    do i=1,nrea
      write(nfile,'(I8,E17.8e3)') i,flux(i)
    end do
    write(nfile,*)

  end subroutine krome_dump_flux

  !************************
  !dump all the evaluation of the coefficient rates in
  ! the file funit, in the range inTmin, inTmax, using
  ! imax points
  subroutine krome_dump_rates(inTmin,inTmax,imax,funit)
    use krome_commons
    use krome_subs
    implicit none
    integer::i,j
    integer :: funit,imax
    real*8 :: inTmin,inTmax
    real*8::Tmin,Tmax,Tgas,k(nrea),n(nspec)

    Tmin = log10(inTmin)
    Tmax = log10(inTmax)

    n(:) = 1d-40
    do i=1,imax
      Tgas = 1d1**((i-1)*(Tmax-Tmin)/(imax-1)+Tmin)
      n(idx_Tgas) = Tgas
      k(:) = coe(n(:))
      do j=1,nrea
        write(funit,'(E17.8e3,I8,E17.8e3)') Tgas,j,k(j)
      end do
      write(funit,*)
    end do

  end subroutine krome_dump_rates

  !************************
  !print species informations on screen
  subroutine krome_get_info(x, Tgas)
    use krome_commons
    use krome_subs
    use krome_getphys
    implicit none
    integer::i,charges(nspec)
    real*8 :: x(nmols)
    real*8 :: Tgas
    real*8::masses(nspec)
    character*16::names(nspec)

    names(:) = get_names()
    charges(:) = get_charges()
    masses(:) = get_mass()

    print '(a4,a10,a11,a5,a11)',"#","Name","m (g)","Chrg","x"
    do i=1,size(x)
      print '(I4,a10,E11.3,I5,E11.3)',i," "//names(i),masses(i),charges(i),x(i)
    end do
    print '(a30,E11.3)'," sum",sum(x)

    print '(a14,E11.3)',"Tgas",Tgas
  end subroutine krome_get_info

  !*****************************
  subroutine krome_set_mpi_rank(xarg)
    use krome_commons
    implicit none
    integer :: xarg
    krome_mpi_rank=xarg
  end subroutine krome_set_mpi_rank

end module krome_user
