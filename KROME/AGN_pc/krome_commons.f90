
!############### MODULE ##############
module krome_commons
  implicit none

  ! *************************************************************
  !  This file has been generated with:
  !  KROME 14.08.dev on 2019-10-18 23:43:50
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
  integer,parameter::idx_E=1
  integer,parameter::idx_GRAINk=2
  integer,parameter::idx_Hk=3
  integer,parameter::idx_Ck=4
  integer,parameter::idx_CNk=5
  integer,parameter::idx_Ok=6
  integer,parameter::idx_OHk=7
  integer,parameter::idx_Sk=8
  integer,parameter::idx_GRAIN0=9
  integer,parameter::idx_C=10
  integer,parameter::idx_FE=11
  integer,parameter::idx_H=12
  integer,parameter::idx_HE=13
  integer,parameter::idx_MG=14
  integer,parameter::idx_N=15
  integer,parameter::idx_NA=16
  integer,parameter::idx_O=17
  integer,parameter::idx_S=18
  integer,parameter::idx_SI=19
  integer,parameter::idx_H2=20
  integer,parameter::idx_CO=21
  integer,parameter::idx_CL=22
  integer,parameter::idx_P=23
  integer,parameter::idx_C2=24
  integer,parameter::idx_CCL=25
  integer,parameter::idx_CH=26
  integer,parameter::idx_CLO=27
  integer,parameter::idx_CN=28
  integer,parameter::idx_CP=29
  integer,parameter::idx_CS=30
  integer,parameter::idx_HCL=31
  integer,parameter::idx_HF=32
  integer,parameter::idx_F=33
  integer,parameter::idx_HS=34
  integer,parameter::idx_MGH=35
  integer,parameter::idx_N2=36
  integer,parameter::idx_NAH=37
  integer,parameter::idx_NH=38
  integer,parameter::idx_NO=39
  integer,parameter::idx_NS=40
  integer,parameter::idx_O2=41
  integer,parameter::idx_OH=42
  integer,parameter::idx_PH=43
  integer,parameter::idx_PN=44
  integer,parameter::idx_PO=45
  integer,parameter::idx_S2=46
  integer,parameter::idx_SIC=47
  integer,parameter::idx_SIH=48
  integer,parameter::idx_SIN=49
  integer,parameter::idx_SIO=50
  integer,parameter::idx_SIS=51
  integer,parameter::idx_SO=52
  integer,parameter::idx_C2H=53
  integer,parameter::idx_C2N=54
  integer,parameter::idx_C2S=55
  integer,parameter::idx_C3=56
  integer,parameter::idx_CCO=57
  integer,parameter::idx_CCP=58
  integer,parameter::idx_CH2=59
  integer,parameter::idx_CO2=60
  integer,parameter::idx_H2O=61
  integer,parameter::idx_H2S=62
  integer,parameter::idx_HCN=63
  integer,parameter::idx_HCO=64
  integer,parameter::idx_HCP=65
  integer,parameter::idx_HCS=66
  integer,parameter::idx_HCSI=67
  integer,parameter::idx_HNC=68
  integer,parameter::idx_HNO=69
  integer,parameter::idx_HNSI=70
  integer,parameter::idx_HPO=71
  integer,parameter::idx_HS2=72
  integer,parameter::idx_N2O=73
  integer,parameter::idx_NAOH=74
  integer,parameter::idx_NH2=75
  integer,parameter::idx_NO2=76
  integer,parameter::idx_O2H=77
  integer,parameter::idx_OCN=78
  integer,parameter::idx_OCS=79
  integer,parameter::idx_PH2=80
  integer,parameter::idx_SIC2=81
  integer,parameter::idx_SIH2=82
  integer,parameter::idx_SINC=83
  integer,parameter::idx_SIO2=84
  integer,parameter::idx_SO2=85
  integer,parameter::idx_C2H2=86
  integer,parameter::idx_C3H=87
  integer,parameter::idx_HC3=88
  integer,parameter::idx_C3N=89
  integer,parameter::idx_C3O=90
  integer,parameter::idx_C3P=91
  integer,parameter::idx_C3S=92
  integer,parameter::idx_C4=93
  integer,parameter::idx_CH3=94
  integer,parameter::idx_H2CO=95
  integer,parameter::idx_H2CS=96
  integer,parameter::idx_H2O2=97
  integer,parameter::idx_H2S2=98
  integer,parameter::idx_H2SIO=99
  integer,parameter::idx_HCCP=100
  integer,parameter::idx_NH3=101
  integer,parameter::idx_SIC2H=102
  integer,parameter::idx_SIC3=103
  integer,parameter::idx_SICH2=104
  integer,parameter::idx_SIH3=105
  integer,parameter::idx_CH2CN=106
  integer,parameter::idx_C2H2O=107
  integer,parameter::idx_C2H3=108
  integer,parameter::idx_C3H2=109
  integer,parameter::idx_H2C3=110
  integer,parameter::idx_C4H=111
  integer,parameter::idx_C4N=112
  integer,parameter::idx_C4P=113
  integer,parameter::idx_C4S=114
  integer,parameter::idx_C5=115
  integer,parameter::idx_CH2O2=116
  integer,parameter::idx_CH2PH=117
  integer,parameter::idx_CH3N=118
  integer,parameter::idx_CH4=119
  integer,parameter::idx_HC3N=120
  integer,parameter::idx_SIC2H2=121
  integer,parameter::idx_SIC3H=122
  integer,parameter::idx_SIC4=123
  integer,parameter::idx_SICH3=124
  integer,parameter::idx_SIH4=125
  integer,parameter::idx_CH3CN=126
  integer,parameter::idx_C2H4=127
  integer,parameter::idx_C3H3=128
  integer,parameter::idx_C4H2=129
  integer,parameter::idx_C5H=130
  integer,parameter::idx_C5N=131
  integer,parameter::idx_C6=132
  integer,parameter::idx_CH3OH=133
  integer,parameter::idx_C2H4O=134
  integer,parameter::idx_C2H5=135
  integer,parameter::idx_C3H3N=136
  integer,parameter::idx_C3H4=137
  integer,parameter::idx_C5H2=138
  integer,parameter::idx_C6H=139
  integer,parameter::idx_C7=140
  integer,parameter::idx_CH5N=141
  integer,parameter::idx_HC5N=142
  integer,parameter::idx_C6H2=143
  integer,parameter::idx_C7H=144
  integer,parameter::idx_C7N=145
  integer,parameter::idx_C8=146
  integer,parameter::idx_CH3C3N=147
  integer,parameter::idx_HCOOCH3=148
  integer,parameter::idx_C2H5OH=149
  integer,parameter::idx_C7H2=150
  integer,parameter::idx_C8H=151
  integer,parameter::idx_C9=152
  integer,parameter::idx_CH3C4H=153
  integer,parameter::idx_CH3OCH3=154
  integer,parameter::idx_HC7N=155
  integer,parameter::idx_C2H6CO=156
  integer,parameter::idx_C8H2=157
  integer,parameter::idx_C9H=158
  integer,parameter::idx_C9N=159
  integer,parameter::idx_CH3C5N=160
  integer,parameter::idx_C9H2=161
  integer,parameter::idx_CH3C6H=162
  integer,parameter::idx_CH3C7N=163
  integer,parameter::idx_HC9N=164
  integer,parameter::idx_HCNC2=165
  integer,parameter::idx_HC2NC=166
  integer,parameter::idx_HNC3=167
  integer,parameter::idx_NH2CHO=168
  integer,parameter::idx_C4H3=169
  integer,parameter::idx_NH2CN=170
  integer,parameter::idx_C6H6=171
  integer,parameter::idx_H2CN=172
  integer,parameter::idx_C10=173
  integer,parameter::idx_C11=174
  integer,parameter::idx_SIC3H3=175
  integer,parameter::idx_SIC4H=176
  integer,parameter::idx_SIC6H=177
  integer,parameter::idx_SIC8H=178
  integer,parameter::idx_SIC2H3=179
  integer,parameter::idx_C3H6=180
  integer,parameter::idx_SIC3H5=181
  integer,parameter::idx_C4H4=182
  integer,parameter::idx_C4H6=183
  integer,parameter::idx_HC4N=184
  integer,parameter::idx_HC6N=185
  integer,parameter::idx_HC8N=186
  integer,parameter::idx_HC10N=187
  integer,parameter::idx_HC11N=188
  integer,parameter::idx_HC12N=189
  integer,parameter::idx_NC4N=190
  integer,parameter::idx_NC6N=191
  integer,parameter::idx_NC8N=192
  integer,parameter::idx_NC10N=193
  integer,parameter::idx_NC12N=194
  integer,parameter::idx_HC13N=195
  integer,parameter::idx_H_DUST=196
  integer,parameter::idx_C_DUST=197
  integer,parameter::idx_N_DUST=198
  integer,parameter::idx_O_DUST=199
  integer,parameter::idx_H_DUSTH_DUST=200
  integer,parameter::idx_C_DUSTC_DUST=201
  integer,parameter::idx_N_DUSTN_DUST=202
  integer,parameter::idx_O_DUSTO_DUST=203
  integer,parameter::idx_C_DUSTH_DUST=204
  integer,parameter::idx_N_DUSTH_DUST=205
  integer,parameter::idx_O_DUSTH_DUST=206
  integer,parameter::idx_C_DUSTN_DUST=207
  integer,parameter::idx_C_DUSTO_DUST=208
  integer,parameter::idx_N_DUSTO_DUST=209
  integer,parameter::idx_O3=210
  integer,parameter::idx_O_DUSTO_DUSTO_DUST=211
  integer,parameter::idx_C_DUSTC_DUSTH_DUST=212
  integer,parameter::idx_N2H=213
  integer,parameter::idx_N_DUSTN_DUSTH_DUST=214
  integer,parameter::idx_O_DUSTO_DUSTH_DUST=215
  integer,parameter::idx_C_DUSTH_DUSTH_DUST=216
  integer,parameter::idx_N_DUSTH_DUSTH_DUST=217
  integer,parameter::idx_H_DUSTH_DUSTO_DUST=218
  integer,parameter::idx_C_DUSTC_DUSTN_DUST=219
  integer,parameter::idx_C_DUSTO_DUSTO_DUST=220
  integer,parameter::idx_H_DUSTC_DUSTN_DUST=221
  integer,parameter::idx_H_DUSTN_DUSTC_DUST=222
  integer,parameter::idx_H_DUSTC_DUSTO_DUST=223
  integer,parameter::idx_HOC=224
  integer,parameter::idx_H_DUSTO_DUSTC_DUST=225
  integer,parameter::idx_H_DUSTN_DUSTO_DUST=226
  integer,parameter::idx_O_DUSTC_DUSTN_DUST=227
  integer,parameter::idx_C_DUSTH_DUSTH_DUSTH_DUST=228
  integer,parameter::idx_N_DUSTH_DUSTH_DUSTH_DUST=229
  integer,parameter::idx_C_DUSTC_DUSTH_DUSTH_DUST=230
  integer,parameter::idx_N2H2=231
  integer,parameter::idx_N_DUSTN_DUSTH_DUSTH_DUST=232
  integer,parameter::idx_H_DUSTH_DUSTO_DUSTO_DUST=233
  integer,parameter::idx_H_DUSTH_DUSTC_DUSTO_DUST=234
  integer,parameter::idx_CHOH=235
  integer,parameter::idx_C_DUSTH_DUSTO_DUSTH_DUST=236
  integer,parameter::idx_HCCN=237
  integer,parameter::idx_H_DUSTC_DUSTC_DUSTN_DUST=238
  integer,parameter::idx_C_DUSTH_DUSTH_DUSTH_DUSTH_DUST=239
  integer,parameter::idx_C_DUSTC_DUSTH_DUSTH_DUSTH_DUST=240
  integer,parameter::idx_CH2OH=241
  integer,parameter::idx_C_DUSTH_DUSTH_DUSTO_DUSTH_DUST=242
  integer,parameter::idx_C_DUSTH_DUSTH_DUSTC_DUSTN_DUST=243
  integer,parameter::idx_C_DUSTC_DUSTH_DUSTH_DUSTH_DUSTH_DUST=244
  integer,parameter::idx_C_DUSTH_DUSTH_DUSTH_DUSTO_DUSTH_DUST=245
  integer,parameter::idx_C_DUSTH_DUSTH_DUSTH_DUSTC_DUSTN_DUST=246
  integer,parameter::idx_C_DUSTC_DUSTH_DUSTH_DUSTH_DUSTH_DUSTH_DUST=247
  integer,parameter::idx_C2H6=248
  integer,parameter::idx_C_DUSTC_DUSTH_DUSTH_DUSTH_DUSTH_DUSTH_DUSTH_DUST=249
  integer,parameter::idx_Cj=250
  integer,parameter::idx_FEj=251
  integer,parameter::idx_Hj=252
  integer,parameter::idx_HEj=253
  integer,parameter::idx_MGj=254
  integer,parameter::idx_Nj=255
  integer,parameter::idx_NAj=256
  integer,parameter::idx_Oj=257
  integer,parameter::idx_Sj=258
  integer,parameter::idx_SIj=259
  integer,parameter::idx_H3j=260
  integer,parameter::idx_HCOj=261
  integer,parameter::idx_CLj=262
  integer,parameter::idx_Pj=263
  integer,parameter::idx_COj=264
  integer,parameter::idx_H2j=265
  integer,parameter::idx_NOj=266
  integer,parameter::idx_O2j=267
  integer,parameter::idx_CH2j=268
  integer,parameter::idx_H2Sj=269
  integer,parameter::idx_HCSj=270
  integer,parameter::idx_HNOj=271
  integer,parameter::idx_NH2j=272
  integer,parameter::idx_OCSj=273
  integer,parameter::idx_C2H2j=274
  integer,parameter::idx_CH3j=275
  integer,parameter::idx_NH3j=276
  integer,parameter::idx_C2H2Oj=277
  integer,parameter::idx_CH2O2j=278
  integer,parameter::idx_CH3CNj=279
  integer,parameter::idx_C2H4j=280
  integer,parameter::idx_C4H2j=281
  integer,parameter::idx_H3COj=282
  integer,parameter::idx_CH4Oj=283
  integer,parameter::idx_C2H4Oj=284
  integer,parameter::idx_C3H4j=285
  integer,parameter::idx_CH5Nj=286
  integer,parameter::idx_C2H5OHj=287
  integer,parameter::idx_CH3OCH3j=288
  integer,parameter::idx_CHj=289
  integer,parameter::idx_CCLj=290
  integer,parameter::idx_C2j=291
  integer,parameter::idx_CLOj=292
  integer,parameter::idx_CPj=293
  integer,parameter::idx_CFj=294
  integer,parameter::idx_CSj=295
  integer,parameter::idx_CNj=296
  integer,parameter::idx_NSj=297
  integer,parameter::idx_PHj=298
  integer,parameter::idx_POj=299
  integer,parameter::idx_SICj=300
  integer,parameter::idx_SINj=301
  integer,parameter::idx_SISj=302
  integer,parameter::idx_SOj=303
  integer,parameter::idx_C3j=304
  integer,parameter::idx_C2Sj=305
  integer,parameter::idx_C2Oj=306
  integer,parameter::idx_CCPj=307
  integer,parameter::idx_C2Hj=308
  integer,parameter::idx_HOCj=309
  integer,parameter::idx_C2Nj=310
  integer,parameter::idx_CNCj=311
  integer,parameter::idx_HCPj=312
  integer,parameter::idx_SIC2j=313
  integer,parameter::idx_SINCj=314
  integer,parameter::idx_HPOj=315
  integer,parameter::idx_HCNj=316
  integer,parameter::idx_CHSIj=317
  integer,parameter::idx_SIH2j=318
  integer,parameter::idx_C3Hj=319
  integer,parameter::idx_C4j=320
  integer,parameter::idx_C3Oj=321
  integer,parameter::idx_C3Sj=322
  integer,parameter::idx_H2COj=323
  integer,parameter::idx_H2SIOj=324
  integer,parameter::idx_HCNHj=325
  integer,parameter::idx_SIC2Hj=326
  integer,parameter::idx_SIC3j=327
  integer,parameter::idx_CH2SIj=328
  integer,parameter::idx_SIH3j=329
  integer,parameter::idx_CH2CNj=330
  integer,parameter::idx_C2H3j=331
  integer,parameter::idx_C3H2j=332
  integer,parameter::idx_H2C3j=333
  integer,parameter::idx_C4Hj=334
  integer,parameter::idx_C5j=335
  integer,parameter::idx_C4Sj=336
  integer,parameter::idx_PC2Hj=337
  integer,parameter::idx_C3Nj=338
  integer,parameter::idx_C4Nj=339
  integer,parameter::idx_C3HNj=340
  integer,parameter::idx_HNCj=341
  integer,parameter::idx_SIC3Hj=342
  integer,parameter::idx_SIC4j=343
  integer,parameter::idx_SIC2H2j=344
  integer,parameter::idx_SICH3j=345
  integer,parameter::idx_HC2NCHj=346
  integer,parameter::idx_C3H3j=347
  integer,parameter::idx_H3C3j=348
  integer,parameter::idx_C5Hj=349
  integer,parameter::idx_C6j=350
  integer,parameter::idx_C2H3Oj=351
  integer,parameter::idx_C2H5j=352
  integer,parameter::idx_C3H3Nj=353
  integer,parameter::idx_C5H2j=354
  integer,parameter::idx_C4H3j=355
  integer,parameter::idx_C6Hj=356
  integer,parameter::idx_C7j=357
  integer,parameter::idx_CH4Nj=358
  integer,parameter::idx_C5HNj=359
  integer,parameter::idx_C7Hj=360
  integer,parameter::idx_C8j=361
  integer,parameter::idx_COOCH4j=362
  integer,parameter::idx_C2H5Oj=363
  integer,parameter::idx_C8Hj=364
  integer,parameter::idx_C9j=365
  integer,parameter::idx_C5H3j=366
  integer,parameter::idx_C6H2j=367
  integer,parameter::idx_C6H3j=368
  integer,parameter::idx_C2H6COj=369
  integer,parameter::idx_C9Hj=370
  integer,parameter::idx_C10j=371
  integer,parameter::idx_C7H3j=372
  integer,parameter::idx_C8H2j=373
  integer,parameter::idx_C8H3j=374
  integer,parameter::idx_HCLj=375
  integer,parameter::idx_Fj=376
  integer,parameter::idx_HFj=377
  integer,parameter::idx_HSj=378
  integer,parameter::idx_NHj=379
  integer,parameter::idx_OHj=380
  integer,parameter::idx_PNj=381
  integer,parameter::idx_S2j=382
  integer,parameter::idx_SIHj=383
  integer,parameter::idx_SIOj=384
  integer,parameter::idx_H2Oj=385
  integer,parameter::idx_HNSIj=386
  integer,parameter::idx_S2Hj=387
  integer,parameter::idx_PH2j=388
  integer,parameter::idx_H2CSj=389
  integer,parameter::idx_H2S2j=390
  integer,parameter::idx_HSIOj=391
  integer,parameter::idx_C4Pj=392
  integer,parameter::idx_HCO2j=393
  integer,parameter::idx_PCH3j=394
  integer,parameter::idx_CH4j=395
  integer,parameter::idx_C2NHj=396
  integer,parameter::idx_SIH4j=397
  integer,parameter::idx_NH4j=398
  integer,parameter::idx_H2NCj=399
  integer,parameter::idx_C3H2Nj=400
  integer,parameter::idx_C7H2j=401
  integer,parameter::idx_C5H4j=402
  integer,parameter::idx_C7HNj=403
  integer,parameter::idx_C9H2j=404
  integer,parameter::idx_C7H4j=405
  integer,parameter::idx_C9HNj=406
  integer,parameter::idx_N2j=407
  integer,parameter::idx_CO2j=408
  integer,parameter::idx_HEHj=409
  integer,parameter::idx_SO2j=410
  integer,parameter::idx_C6H5j=411
  integer,parameter::idx_C5H5j=412
  integer,parameter::idx_N2Hj=413
  integer,parameter::idx_NO2j=414
  integer,parameter::idx_PC2H2j=415
  integer,parameter::idx_PNH2j=416
  integer,parameter::idx_PCH2j=417
  integer,parameter::idx_HC2Sj=418
  integer,parameter::idx_HC3Sj=419
  integer,parameter::idx_H3CSj=420
  integer,parameter::idx_HC4Sj=421
  integer,parameter::idx_SIFj=422
  integer,parameter::idx_SINH2j=423
  integer,parameter::idx_SIC2H3j=424
  integer,parameter::idx_SIC3H2j=425
  integer,parameter::idx_C2HOj=426
  integer,parameter::idx_H3Oj=427
  integer,parameter::idx_H3Sj=428
  integer,parameter::idx_HOCSj=429
  integer,parameter::idx_CH5Oj=430
  integer,parameter::idx_NCOj=431
  integer,parameter::idx_HNCOj=432
  integer,parameter::idx_C2N2j=433
  integer,parameter::idx_O2Hj=434
  integer,parameter::idx_CH5j=435
  integer,parameter::idx_H2CLj=436
  integer,parameter::idx_H2Fj=437
  integer,parameter::idx_CH3O2j=438
  integer,parameter::idx_H2POj=439
  integer,parameter::idx_PNH3j=440
  integer,parameter::idx_PCH4j=441
  integer,parameter::idx_PC2H3j=442
  integer,parameter::idx_HSISj=443
  integer,parameter::idx_HSOj=444
  integer,parameter::idx_HNSj=445
  integer,parameter::idx_HPNj=446
  integer,parameter::idx_H2NOj=447
  integer,parameter::idx_NAH2Oj=448
  integer,parameter::idx_PH3j=449
  integer,parameter::idx_SINCHj=450
  integer,parameter::idx_HSIO2j=451
  integer,parameter::idx_HSO2j=452
  integer,parameter::idx_HC3Oj=453
  integer,parameter::idx_PC3Hj=454
  integer,parameter::idx_H3S2j=455
  integer,parameter::idx_H3SIOj=456
  integer,parameter::idx_PC4Hj=457
  integer,parameter::idx_NH2CNHj=458
  integer,parameter::idx_SIC4Hj=459
  integer,parameter::idx_SICH4j=460
  integer,parameter::idx_SIH5j=461
  integer,parameter::idx_C2H4Nj=462
  integer,parameter::idx_NH2CH2Oj=463
  integer,parameter::idx_C2H6j=464
  integer,parameter::idx_C3H4Nj=465
  integer,parameter::idx_C3H5j=466
  integer,parameter::idx_C4H4j=467
  integer,parameter::idx_CH6Nj=468
  integer,parameter::idx_C5H2Nj=469
  integer,parameter::idx_C4H4Nj=470
  integer,parameter::idx_H5C2O2j=471
  integer,parameter::idx_C2H5OH2j=472
  integer,parameter::idx_CH3OCH4j=473
  integer,parameter::idx_C7H2Nj=474
  integer,parameter::idx_C3H6OHj=475
  integer,parameter::idx_C6H4Nj=476
  integer,parameter::idx_C9H3j=477
  integer,parameter::idx_C7H5j=478
  integer,parameter::idx_C8H4Nj=479
  integer,parameter::idx_C9H2Nj=480
  integer,parameter::idx_C6H7j=481
  integer,parameter::idx_NAH2j=482
  integer,parameter::idx_PC2H4j=483
  integer,parameter::idx_C4H5j=484
  integer,parameter::idx_H2CCLj=485
  integer,parameter::idx_PC4H2j=486
  integer,parameter::idx_C6H4j=487
  integer,parameter::idx_C8H4j=488
  integer,parameter::idx_C9H4j=489
  integer,parameter::idx_C4H7j=490
  integer,parameter::idx_HC4Nj=491
  integer,parameter::idx_HC4Oj=492
  integer,parameter::idx_C5Nj=493
  integer,parameter::idx_H2C4Nj=494
  integer,parameter::idx_H3C4Nj=495
  integer,parameter::idx_C7Nj=496
  integer,parameter::idx_C5H3Nj=497
  integer,parameter::idx_C9Nj=498
  integer,parameter::idx_C7H3Nj=499
  integer,parameter::idx_C9H3Nj=500
  integer,parameter::idx_OCSjH2=501
  integer,parameter::idx_H2C3Oj=502
  integer,parameter::idx_H3C3Oj=503
  integer,parameter::idx_C5H4Nj=504
  integer,parameter::idx_C8H5j=505
  integer,parameter::idx_C9H5j=506
  integer,parameter::idx_CR=507
  integer,parameter::idx_g=508
  integer,parameter::idx_Tgas=509
  integer,parameter::idx_dummy=510
  integer,parameter::nrea=4595
  integer,parameter::nmols=506
  integer,parameter::nspec=510
  integer,parameter::natoms=16
  integer,parameter::ndust=0
  integer,parameter::ndustTypes=0
  integer,parameter::nPhotoBins=0
  integer,parameter::nPhotoRea=0

  !cooling index
  integer,parameter::idx_cool_h2 = 1
  integer,parameter::idx_cool_h2gp = 2
  integer,parameter::idx_cool_atomic = 3
  integer,parameter::idx_cool_cen = 3
  integer,parameter::idx_cool_hd = 4
  integer,parameter::idx_cool_metal = 5
  integer,parameter::idx_cool_z = 5
  integer,parameter::idx_cool_dh = 6
  integer,parameter::idx_cool_enthalpic = 6
  integer,parameter::idx_cool_dust = 7
  integer,parameter::idx_cool_compton = 8
  integer,parameter::idx_cool_cie = 9
  integer,parameter::idx_cool_cont = 10
  integer,parameter::idx_cool_continuum = 10
  integer,parameter::idx_cool_expansion = 11
  integer,parameter::idx_cool_exp = 11
  integer,parameter::idx_cool_ff = 12
  integer,parameter::idx_cool_bss = 12
  integer,parameter::idx_cool_custom = 13
  integer,parameter::idx_cool_co = 14
  integer,parameter::idx_cool_zcie = 15
  integer,parameter::idx_cool_zcienouv = 16
  integer,parameter::idx_cool_zextend = 17
  integer,parameter::idx_cool_gh = 18
  integer,parameter::idx_cool_oh = 19
  integer,parameter::idx_cool_h2o = 20
  integer,parameter::idx_cool_hcn = 21
  integer,parameter::ncools = 21

  !heating index
  integer,parameter::idx_heat_chem = 1
  integer,parameter::idx_heat_compress = 2
  integer,parameter::idx_heat_compr = 2
  integer,parameter::idx_heat_photo = 3
  integer,parameter::idx_heat_dh = 4
  integer,parameter::idx_heat_enthalpic = 4
  integer,parameter::idx_heat_av = 5
  integer,parameter::idx_heat_photoav = 5
  integer,parameter::idx_heat_cr = 6
  integer,parameter::idx_heat_dust = 7
  integer,parameter::idx_heat_xray = 8
  integer,parameter::idx_heat_viscous = 9
  integer,parameter::idx_heat_visc = 9
  integer,parameter::idx_heat_custom = 10
  integer,parameter::idx_heat_zcie = 11
  integer,parameter::nheats = 11

  real*8::arr_k(nrea)

  !commons for rate tables
  !modify ktab_n according to the required precision
  integer,parameter::ktab_n=int(1e3)
  real*8::ktab(nrea,ktab_n),ktab_logTlow, ktab_logTup, ktab_T(ktab_n)
  real*8::inv_ktab_T(ktab_n-1), inv_ktab_idx

  !thermo toggle (when >0 do cooling/heating)
  integer::krome_thermo_toggle
  !$omp threadprivate(krome_thermo_toggle)

  !debug bit flag, print and array with fallback values for extreme environments
  integer:: red_flag
  real*8::n_global(nspec)
  integer, save :: nprint_negative=10
  !$omp threadprivate(n_global,nprint_negative,red_flag)

  !commons for implicit RHS
  integer::arr_r1(nrea)
  integer::arr_r2(nrea)
  integer::arr_p1(nrea)
  integer::arr_p2(nrea)
  integer::arr_p3(nrea)
  integer::arr_p4(nrea)

  !commons for reduction
  integer::arr_u(nrea)
  real*8::arr_flux(nrea)

  !commons for frequency bins

  ! Draine dust absorption data loaded from file, via load_kabs
  ! in krome_photo module
  real*8::find_Av_draine_kabs(nPhotoBins)

  !commons for H2 photodissociation (Solomon)
  ! note: paramters here are set depending on the data
  ! but if you have a different file you should modify them
  integer,parameter::H2pdData_nvibX=15
  integer,parameter::H2pdData_nvibB=37
  real*8::H2pdData_dE(H2pdData_nvibX,H2pdData_nvibB)
  real*8::H2pdData_pre(H2pdData_nvibX,H2pdData_nvibB)
  real*8::H2pdData_EX(H2pdData_nvibX)
  integer::H2pdData_binMap(H2pdData_nvibX,H2pdData_nvibB)

  !commons for dust optical properties

  !square of turbulence velocity for broadening
  real*8::broadeningVturb2

  !mpi rank of process. If 0, ignored
  integer::krome_mpi_rank=0, krome_omp_thread
  !$omp threadprivate(krome_omp_thread)

  !user-defined commons variables from the reaction file
  real*8::user_Av,user_crate,user_gas_dust_ratio,user_J21xr
  !$omp threadprivate(user_Av,user_crate,user_gas_dust_ratio,user_J21xr)

  !commons for anytab
  real*8::user_xray_H_anytabx(30)
  real*8::user_xray_H_anytaby(30)
  real*8::user_xray_H_anytabz(30,30)
  real*8::user_xray_H_anytabxmul
  real*8::user_xray_H_anytabymul
  real*8::user_xheat_H_anytabx(30)
  real*8::user_xheat_H_anytaby(30)
  real*8::user_xheat_H_anytabz(30,30)
  real*8::user_xheat_H_anytabxmul
  real*8::user_xheat_H_anytabymul
  real*8::user_xray_He_anytabx(30)
  real*8::user_xray_He_anytaby(30)
  real*8::user_xray_He_anytabz(30,30)
  real*8::user_xray_He_anytabxmul
  real*8::user_xray_He_anytabymul
  real*8::user_xheat_He_anytabx(30)
  real*8::user_xheat_He_anytaby(30)
  real*8::user_xheat_He_anytabz(30,30)
  real*8::user_xheat_He_anytabxmul
  real*8::user_xheat_He_anytabymul

  !physical commons
  real*8::phys_Tcmb
  real*8::phys_zredshift
  real*8::phys_orthoParaRatio
  real*8::phys_metallicity
  real*8::phys_Tfloor
  !$omp threadprivate(phys_Tcmb)
  !$omp threadprivate(phys_zredshift)
  !$omp threadprivate(phys_orthoParaRatio)
  !$omp threadprivate(phys_metallicity)
  !$omp threadprivate(phys_Tfloor)

  !machine precision
  real*8::krome_epsilon

  !xrayJ21 for tabulated heating and rate
  real*8::J21xray

  !total metallicity relative to solar Z/Z_solar
  real*8::total_Z
  real*8::dust2gas_ratio

  !commons for dust tabs (cool,H2,Tdust)
  integer,parameter::dust_tab_imax=50, dust_tab_jmax=50
  real*8::dust_tab_ngas(dust_tab_imax)
  real*8::dust_tab_Tgas(dust_tab_jmax)
  real*8::dust_mult_Tgas,dust_mult_ngas
  real*8::dust_table_AvVariable_log

  real*8::dust_tab_cool(dust_tab_imax, dust_tab_jmax)
  real*8::dust_tab_heat(dust_tab_imax, dust_tab_jmax)
  real*8::dust_tab_Tdust(dust_tab_imax, dust_tab_jmax)
  real*8::dust_tab_H2(dust_tab_imax, dust_tab_jmax)

  !commons for exp(-a) table
  integer,parameter::exp_table_na=int(1d5)
  real*8,parameter::exp_table_aMax=1d4,exp_table_aMin=0d0
  real*8,parameter::exp_table_multa=(exp_table_na-1) &
      / (exp_table_aMax-exp_table_aMin)
  real*8,parameter::exp_table_da=1d0/exp_table_multa
  real*8::exp_table(exp_table_na)

  !stores the last evaluation of the rates in the fex
  real*8::last_coe(nrea)
  !$omp threadprivate(last_coe)

  !xsecs from file variables

  ! Gibbs free energy data from file variables

  !partition function from file
  integer,parameter::zpart_nCO=641
  integer,parameter::zpart_nH2even=2000
  integer,parameter::zpart_nH2odd=2000
  real*8::zpart_CO(zpart_nCO),minpart_CO,partdT_CO
  real*8::zpart_H2even(zpart_nH2even),minpart_H2even,partdT_H2even
  real*8::zpart_H2odd(zpart_nH2odd),minpart_H2odd,partdT_H2odd

  !Habing flux for the photoelectric heating by dust
  ! and clumping factor for H2 formation
  ! on dust by Jura/Gnedin
  real*8::GHabing,Ghabing_thin,clump_factor
  !$omp threadprivate(GHabing,GHabing_thin)

  !partition functions common vars

  !verbatim reactions
  character*50::reactionNames(nrea)

  !store evaluate once rate
  real*8::rateEvaluateOnce(nrea)
  !$omp threadprivate(rateEvaluateOnce)

end module krome_commons
