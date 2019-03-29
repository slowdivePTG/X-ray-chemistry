
!############### MODULE ##############
module krome_user
  implicit none

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
  integer,parameter::KROME_idx_CH4O = 133	!CH4O
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
  integer,parameter::KROME_idx_Cj = 196	!C+
  integer,parameter::KROME_idx_FEj = 197	!FE+
  integer,parameter::KROME_idx_Hj = 198	!H+
  integer,parameter::KROME_idx_HEj = 199	!HE+
  integer,parameter::KROME_idx_MGj = 200	!MG+
  integer,parameter::KROME_idx_Nj = 201	!N+
  integer,parameter::KROME_idx_NAj = 202	!NA+
  integer,parameter::KROME_idx_Oj = 203	!O+
  integer,parameter::KROME_idx_Sj = 204	!S+
  integer,parameter::KROME_idx_SIj = 205	!SI+
  integer,parameter::KROME_idx_H3j = 206	!H3+
  integer,parameter::KROME_idx_HCOj = 207	!HCO+
  integer,parameter::KROME_idx_CLj = 208	!CL+
  integer,parameter::KROME_idx_Pj = 209	!P+
  integer,parameter::KROME_idx_COj = 210	!CO+
  integer,parameter::KROME_idx_H2j = 211	!H2+
  integer,parameter::KROME_idx_NOj = 212	!NO+
  integer,parameter::KROME_idx_O2j = 213	!O2+
  integer,parameter::KROME_idx_CH2j = 214	!CH2+
  integer,parameter::KROME_idx_H2Sj = 215	!H2S+
  integer,parameter::KROME_idx_HCSj = 216	!HCS+
  integer,parameter::KROME_idx_HNOj = 217	!HNO+
  integer,parameter::KROME_idx_NH2j = 218	!NH2+
  integer,parameter::KROME_idx_OCSj = 219	!OCS+
  integer,parameter::KROME_idx_C2H2j = 220	!C2H2+
  integer,parameter::KROME_idx_CH3j = 221	!CH3+
  integer,parameter::KROME_idx_NH3j = 222	!NH3+
  integer,parameter::KROME_idx_C2H2Oj = 223	!C2H2O+
  integer,parameter::KROME_idx_CH2O2j = 224	!CH2O2+
  integer,parameter::KROME_idx_C2H3Nj = 225	!C2H3N+
  integer,parameter::KROME_idx_C2H4j = 226	!C2H4+
  integer,parameter::KROME_idx_C4H2j = 227	!C4H2+
  integer,parameter::KROME_idx_H3COj = 228	!H3CO+
  integer,parameter::KROME_idx_CH4Oj = 229	!CH4O+
  integer,parameter::KROME_idx_C2H4Oj = 230	!C2H4O+
  integer,parameter::KROME_idx_C3H4j = 231	!C3H4+
  integer,parameter::KROME_idx_CH5Nj = 232	!CH5N+
  integer,parameter::KROME_idx_C2H5OHj = 233	!C2H5OH+
  integer,parameter::KROME_idx_CH3OCH3j = 234	!CH3OCH3+
  integer,parameter::KROME_idx_CHj = 235	!CH+
  integer,parameter::KROME_idx_CCLj = 236	!CCL+
  integer,parameter::KROME_idx_C2j = 237	!C2+
  integer,parameter::KROME_idx_CLOj = 238	!CLO+
  integer,parameter::KROME_idx_CPj = 239	!CP+
  integer,parameter::KROME_idx_CFj = 240	!CF+
  integer,parameter::KROME_idx_CSj = 241	!CS+
  integer,parameter::KROME_idx_CNj = 242	!CN+
  integer,parameter::KROME_idx_NSj = 243	!NS+
  integer,parameter::KROME_idx_PHj = 244	!PH+
  integer,parameter::KROME_idx_POj = 245	!PO+
  integer,parameter::KROME_idx_SICj = 246	!SIC+
  integer,parameter::KROME_idx_SINj = 247	!SIN+
  integer,parameter::KROME_idx_SISj = 248	!SIS+
  integer,parameter::KROME_idx_SOj = 249	!SO+
  integer,parameter::KROME_idx_C3j = 250	!C3+
  integer,parameter::KROME_idx_C2Sj = 251	!C2S+
  integer,parameter::KROME_idx_C2Oj = 252	!C2O+
  integer,parameter::KROME_idx_CCPj = 253	!CCP+
  integer,parameter::KROME_idx_C2Hj = 254	!C2H+
  integer,parameter::KROME_idx_HOCj = 255	!HOC+
  integer,parameter::KROME_idx_C2Nj = 256	!C2N+
  integer,parameter::KROME_idx_CNCj = 257	!CNC+
  integer,parameter::KROME_idx_HCPj = 258	!HCP+
  integer,parameter::KROME_idx_SIC2j = 259	!SIC2+
  integer,parameter::KROME_idx_SINCj = 260	!SINC+
  integer,parameter::KROME_idx_HPOj = 261	!HPO+
  integer,parameter::KROME_idx_HCNj = 262	!HCN+
  integer,parameter::KROME_idx_CHSIj = 263	!CHSI+
  integer,parameter::KROME_idx_SIH2j = 264	!SIH2+
  integer,parameter::KROME_idx_C3Hj = 265	!C3H+
  integer,parameter::KROME_idx_C4j = 266	!C4+
  integer,parameter::KROME_idx_C3Oj = 267	!C3O+
  integer,parameter::KROME_idx_C3Sj = 268	!C3S+
  integer,parameter::KROME_idx_H2COj = 269	!H2CO+
  integer,parameter::KROME_idx_H2SIOj = 270	!H2SIO+
  integer,parameter::KROME_idx_HCNHj = 271	!HCNH+
  integer,parameter::KROME_idx_SIC2Hj = 272	!SIC2H+
  integer,parameter::KROME_idx_SIC3j = 273	!SIC3+
  integer,parameter::KROME_idx_CH2SIj = 274	!CH2SI+
  integer,parameter::KROME_idx_SIH3j = 275	!SIH3+
  integer,parameter::KROME_idx_C2H2Nj = 276	!C2H2N+
  integer,parameter::KROME_idx_C2H3j = 277	!C2H3+
  integer,parameter::KROME_idx_C3H2j = 278	!C3H2+
  integer,parameter::KROME_idx_H2C3j = 279	!H2C3+
  integer,parameter::KROME_idx_C4Hj = 280	!C4H+
  integer,parameter::KROME_idx_C5j = 281	!C5+
  integer,parameter::KROME_idx_C4Sj = 282	!C4S+
  integer,parameter::KROME_idx_PC2Hj = 283	!PC2H+
  integer,parameter::KROME_idx_C3Nj = 284	!C3N+
  integer,parameter::KROME_idx_C4Nj = 285	!C4N+
  integer,parameter::KROME_idx_C3HNj = 286	!C3HN+
  integer,parameter::KROME_idx_HNCj = 287	!HNC+
  integer,parameter::KROME_idx_SIC3Hj = 288	!SIC3H+
  integer,parameter::KROME_idx_SIC4j = 289	!SIC4+
  integer,parameter::KROME_idx_SIC2H2j = 290	!SIC2H2+
  integer,parameter::KROME_idx_SICH3j = 291	!SICH3+
  integer,parameter::KROME_idx_HC2NCHj = 292	!HC2NCH+
  integer,parameter::KROME_idx_C3H3j = 293	!C3H3+
  integer,parameter::KROME_idx_H3C3j = 294	!H3C3+
  integer,parameter::KROME_idx_C5Hj = 295	!C5H+
  integer,parameter::KROME_idx_C6j = 296	!C6+
  integer,parameter::KROME_idx_C2H3Oj = 297	!C2H3O+
  integer,parameter::KROME_idx_C2H5j = 298	!C2H5+
  integer,parameter::KROME_idx_C3H3Nj = 299	!C3H3N+
  integer,parameter::KROME_idx_C5H2j = 300	!C5H2+
  integer,parameter::KROME_idx_C4H3j = 301	!C4H3+
  integer,parameter::KROME_idx_C6Hj = 302	!C6H+
  integer,parameter::KROME_idx_C7j = 303	!C7+
  integer,parameter::KROME_idx_CH4Nj = 304	!CH4N+
  integer,parameter::KROME_idx_C5HNj = 305	!C5HN+
  integer,parameter::KROME_idx_C7Hj = 306	!C7H+
  integer,parameter::KROME_idx_C8j = 307	!C8+
  integer,parameter::KROME_idx_COOCH4j = 308	!COOCH4+
  integer,parameter::KROME_idx_C2H5Oj = 309	!C2H5O+
  integer,parameter::KROME_idx_C8Hj = 310	!C8H+
  integer,parameter::KROME_idx_C9j = 311	!C9+
  integer,parameter::KROME_idx_C5H3j = 312	!C5H3+
  integer,parameter::KROME_idx_C6H2j = 313	!C6H2+
  integer,parameter::KROME_idx_C6H3j = 314	!C6H3+
  integer,parameter::KROME_idx_C2H6COj = 315	!C2H6CO+
  integer,parameter::KROME_idx_C9Hj = 316	!C9H+
  integer,parameter::KROME_idx_C10j = 317	!C10+
  integer,parameter::KROME_idx_C7H3j = 318	!C7H3+
  integer,parameter::KROME_idx_C8H2j = 319	!C8H2+
  integer,parameter::KROME_idx_C8H3j = 320	!C8H3+
  integer,parameter::KROME_idx_HCLj = 321	!HCL+
  integer,parameter::KROME_idx_Fj = 322	!F+
  integer,parameter::KROME_idx_HFj = 323	!HF+
  integer,parameter::KROME_idx_HSj = 324	!HS+
  integer,parameter::KROME_idx_NHj = 325	!NH+
  integer,parameter::KROME_idx_OHj = 326	!OH+
  integer,parameter::KROME_idx_PNj = 327	!PN+
  integer,parameter::KROME_idx_S2j = 328	!S2+
  integer,parameter::KROME_idx_SIHj = 329	!SIH+
  integer,parameter::KROME_idx_SIOj = 330	!SIO+
  integer,parameter::KROME_idx_H2Oj = 331	!H2O+
  integer,parameter::KROME_idx_HNSIj = 332	!HNSI+
  integer,parameter::KROME_idx_S2Hj = 333	!S2H+
  integer,parameter::KROME_idx_PH2j = 334	!PH2+
  integer,parameter::KROME_idx_H2CSj = 335	!H2CS+
  integer,parameter::KROME_idx_H2S2j = 336	!H2S2+
  integer,parameter::KROME_idx_HSIOj = 337	!HSIO+
  integer,parameter::KROME_idx_C4Pj = 338	!C4P+
  integer,parameter::KROME_idx_HCO2j = 339	!HCO2+
  integer,parameter::KROME_idx_PCH3j = 340	!PCH3+
  integer,parameter::KROME_idx_CH4j = 341	!CH4+
  integer,parameter::KROME_idx_C2NHj = 342	!C2NH+
  integer,parameter::KROME_idx_SIH4j = 343	!SIH4+
  integer,parameter::KROME_idx_NH4j = 344	!NH4+
  integer,parameter::KROME_idx_H2NCj = 345	!H2NC+
  integer,parameter::KROME_idx_C3H2Nj = 346	!C3H2N+
  integer,parameter::KROME_idx_C7H2j = 347	!C7H2+
  integer,parameter::KROME_idx_C5H4j = 348	!C5H4+
  integer,parameter::KROME_idx_C7HNj = 349	!C7HN+
  integer,parameter::KROME_idx_C9H2j = 350	!C9H2+
  integer,parameter::KROME_idx_C7H4j = 351	!C7H4+
  integer,parameter::KROME_idx_C9HNj = 352	!C9HN+
  integer,parameter::KROME_idx_N2j = 353	!N2+
  integer,parameter::KROME_idx_CO2j = 354	!CO2+
  integer,parameter::KROME_idx_HEHj = 355	!HEH+
  integer,parameter::KROME_idx_SO2j = 356	!SO2+
  integer,parameter::KROME_idx_C6H5j = 357	!C6H5+
  integer,parameter::KROME_idx_C5H5j = 358	!C5H5+
  integer,parameter::KROME_idx_N2Hj = 359	!N2H+
  integer,parameter::KROME_idx_NO2j = 360	!NO2+
  integer,parameter::KROME_idx_PC2H2j = 361	!PC2H2+
  integer,parameter::KROME_idx_PNH2j = 362	!PNH2+
  integer,parameter::KROME_idx_PCH2j = 363	!PCH2+
  integer,parameter::KROME_idx_HC2Sj = 364	!HC2S+
  integer,parameter::KROME_idx_HC3Sj = 365	!HC3S+
  integer,parameter::KROME_idx_H3CSj = 366	!H3CS+
  integer,parameter::KROME_idx_HC4Sj = 367	!HC4S+
  integer,parameter::KROME_idx_SIFj = 368	!SIF+
  integer,parameter::KROME_idx_SINH2j = 369	!SINH2+
  integer,parameter::KROME_idx_SIC2H3j = 370	!SIC2H3+
  integer,parameter::KROME_idx_SIC3H2j = 371	!SIC3H2+
  integer,parameter::KROME_idx_C2HOj = 372	!C2HO+
  integer,parameter::KROME_idx_H3Oj = 373	!H3O+
  integer,parameter::KROME_idx_H3Sj = 374	!H3S+
  integer,parameter::KROME_idx_HOCSj = 375	!HOCS+
  integer,parameter::KROME_idx_CH5Oj = 376	!CH5O+
  integer,parameter::KROME_idx_NCOj = 377	!NCO+
  integer,parameter::KROME_idx_HNCOj = 378	!HNCO+
  integer,parameter::KROME_idx_C2N2j = 379	!C2N2+
  integer,parameter::KROME_idx_O2Hj = 380	!O2H+
  integer,parameter::KROME_idx_CH5j = 381	!CH5+
  integer,parameter::KROME_idx_H2CLj = 382	!H2CL+
  integer,parameter::KROME_idx_H2Fj = 383	!H2F+
  integer,parameter::KROME_idx_CH3O2j = 384	!CH3O2+
  integer,parameter::KROME_idx_H2POj = 385	!H2PO+
  integer,parameter::KROME_idx_PNH3j = 386	!PNH3+
  integer,parameter::KROME_idx_PCH4j = 387	!PCH4+
  integer,parameter::KROME_idx_PC2H3j = 388	!PC2H3+
  integer,parameter::KROME_idx_HSISj = 389	!HSIS+
  integer,parameter::KROME_idx_HSOj = 390	!HSO+
  integer,parameter::KROME_idx_HNSj = 391	!HNS+
  integer,parameter::KROME_idx_HPNj = 392	!HPN+
  integer,parameter::KROME_idx_H2NOj = 393	!H2NO+
  integer,parameter::KROME_idx_NAH2Oj = 394	!NAH2O+
  integer,parameter::KROME_idx_PH3j = 395	!PH3+
  integer,parameter::KROME_idx_SINCHj = 396	!SINCH+
  integer,parameter::KROME_idx_HSIO2j = 397	!HSIO2+
  integer,parameter::KROME_idx_HSO2j = 398	!HSO2+
  integer,parameter::KROME_idx_HC3Oj = 399	!HC3O+
  integer,parameter::KROME_idx_PC3Hj = 400	!PC3H+
  integer,parameter::KROME_idx_H3S2j = 401	!H3S2+
  integer,parameter::KROME_idx_H3SIOj = 402	!H3SIO+
  integer,parameter::KROME_idx_PC4Hj = 403	!PC4H+
  integer,parameter::KROME_idx_NH2CNHj = 404	!NH2CNH+
  integer,parameter::KROME_idx_SIC4Hj = 405	!SIC4H+
  integer,parameter::KROME_idx_SICH4j = 406	!SICH4+
  integer,parameter::KROME_idx_SIH5j = 407	!SIH5+
  integer,parameter::KROME_idx_C2H4Nj = 408	!C2H4N+
  integer,parameter::KROME_idx_NH2CH2Oj = 409	!NH2CH2O+
  integer,parameter::KROME_idx_C2H6j = 410	!C2H6+
  integer,parameter::KROME_idx_C3H4Nj = 411	!C3H4N+
  integer,parameter::KROME_idx_C3H5j = 412	!C3H5+
  integer,parameter::KROME_idx_C4H4j = 413	!C4H4+
  integer,parameter::KROME_idx_CH6Nj = 414	!CH6N+
  integer,parameter::KROME_idx_C5H2Nj = 415	!C5H2N+
  integer,parameter::KROME_idx_C4H4Nj = 416	!C4H4N+
  integer,parameter::KROME_idx_H5C2O2j = 417	!H5C2O2+
  integer,parameter::KROME_idx_C2H5OH2j = 418	!C2H5OH2+
  integer,parameter::KROME_idx_CH3OCH4j = 419	!CH3OCH4+
  integer,parameter::KROME_idx_C7H2Nj = 420	!C7H2N+
  integer,parameter::KROME_idx_C3H6OHj = 421	!C3H6OH+
  integer,parameter::KROME_idx_C6H4Nj = 422	!C6H4N+
  integer,parameter::KROME_idx_C9H3j = 423	!C9H3+
  integer,parameter::KROME_idx_C7H5j = 424	!C7H5+
  integer,parameter::KROME_idx_C8H4Nj = 425	!C8H4N+
  integer,parameter::KROME_idx_C9H2Nj = 426	!C9H2N+
  integer,parameter::KROME_idx_C6H7j = 427	!C6H7+
  integer,parameter::KROME_idx_NAH2j = 428	!NAH2+
  integer,parameter::KROME_idx_PC2H4j = 429	!PC2H4+
  integer,parameter::KROME_idx_C4H5j = 430	!C4H5+
  integer,parameter::KROME_idx_H2CCLj = 431	!H2CCL+
  integer,parameter::KROME_idx_PC4H2j = 432	!PC4H2+
  integer,parameter::KROME_idx_C6H4j = 433	!C6H4+
  integer,parameter::KROME_idx_C8H4j = 434	!C8H4+
  integer,parameter::KROME_idx_C9H4j = 435	!C9H4+
  integer,parameter::KROME_idx_C4H7j = 436	!C4H7+
  integer,parameter::KROME_idx_HC4Nj = 437	!HC4N+
  integer,parameter::KROME_idx_HC4Oj = 438	!HC4O+
  integer,parameter::KROME_idx_C5Nj = 439	!C5N+
  integer,parameter::KROME_idx_H2C4Nj = 440	!H2C4N+
  integer,parameter::KROME_idx_H3C4Nj = 441	!H3C4N+
  integer,parameter::KROME_idx_C7Nj = 442	!C7N+
  integer,parameter::KROME_idx_C5H3Nj = 443	!C5H3N+
  integer,parameter::KROME_idx_C9Nj = 444	!C9N+
  integer,parameter::KROME_idx_C7H3Nj = 445	!C7H3N+
  integer,parameter::KROME_idx_C9H3Nj = 446	!C9H3N+
  integer,parameter::KROME_idx_OCSjH2 = 447	!OCS+H2
  integer,parameter::KROME_idx_H2C3Oj = 448	!H2C3O+
  integer,parameter::KROME_idx_H3C3Oj = 449	!H3C3O+
  integer,parameter::KROME_idx_C5H4Nj = 450	!C5H4N+
  integer,parameter::KROME_idx_C8H5j = 451	!C8H5+
  integer,parameter::KROME_idx_C9H5j = 452	!C9H5+
  integer,parameter::KROME_idx_CR = 453	!CR
  integer,parameter::KROME_idx_g = 454	!g
  integer,parameter::KROME_idx_Tgas = 455	!Tgas
  integer,parameter::KROME_idx_dummy = 456	!dummy

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

  integer,parameter::krome_nrea=4429
  integer,parameter::krome_nmols=452
  integer,parameter::krome_nspec=456
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
    character*2336::krome_get_names_header
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
