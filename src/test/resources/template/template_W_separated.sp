﻿******************** STL ver 2.3 T element basic model ********************

*** Notice *** ------------------------------------------------------*
* WエレメントによるSTL基本形（バス配線で寄生容量接続有り）のテンプレート

*--------------------------------------------------------------------*


*** STL Circuit *** -------------------------------------------------*

Vs1             101     0       PWL(
.INCLUDE ./data/input_data/250mhz-isolation )
Rin1            101     102     50

*** Subspaces ***
W1_SEG_1 102 0 2000 0 RLGCMODEL=Z50 N=1 L=20.000000m
W1_SEG_2 2000 0 2001 0 RLGCMODEL=Z50 N=1 L=20.000000m
W1_SEG_3 2001 0 2002 0 RLGCMODEL=Z50 N=1 L=20.000000m
W1_SEG_4 2002 0 2003 0 RLGCMODEL=Z50 N=1 L=20.000000m
W1_SEG_5 2003 0 optpt1 0 RLGCMODEL=Z50 N=1 L=20.000000m
L1              optpt1  103     10n
C1              103     0       10p
W2_SEG_1 optpt1 0 4000 0 RLGCMODEL=Z50 N=1 L=70.000000m
W2_SEG_2 4000 0 4001 0 RLGCMODEL=Z50 N=1 L=70.000000m
W2_SEG_3 4001 0 4002 0 RLGCMODEL=Z50 N=1 L=70.000000m
W2_SEG_4 4002 0 4003 0 RLGCMODEL=Z50 N=1 L=70.000000m
W2_SEG_5 4003 0 optpt2 0 RLGCMODEL=Z50 N=1 L=70.000000m
L2              optpt2  104     10n
C2              104     0       10p
W3_SEG_1 optpt2 0 6000 0 RLGCMODEL=Z50 N=1 L=30.000000m
W3_SEG_2 6000 0 6001 0 RLGCMODEL=Z50 N=1 L=30.000000m
W3_SEG_3 6001 0 6002 0 RLGCMODEL=Z50 N=1 L=30.000000m
W3_SEG_4 6002 0 6003 0 RLGCMODEL=Z50 N=1 L=30.000000m
W3_SEG_5 6003 0 optpt3 0 RLGCMODEL=Z50 N=1 L=30.000000m
*****************

RT1             optpt3  0       50

*--------------------------------------------------------------------*


*** Versus Circuit *** ----------------------------------------------*

Vsvs1          1001    0       PWL(
.INCLUDE ./data/input_data/250mhz-isolation )
Rinvs1         1001    1002    50
Tvs1           1002    0       vspt1   0       z0=50   TD=630.8p
Tvs2           vspt1   0       vspt2   0       z0=50   TD=2207.8p
Tvs3           vspt2   0       vspt3   0       z0=50   TD=946.2p
RTvs1          vspt3   0       50

*--------------------------------------------------------------------*


*** Trigger Circuit *** ---------------------------------------------*

*--------------------------------------------------------------------*


*** Netlist Commands *** --------------------------------------------*

.WIDTH OUT=132
.TRAN 5p 100n 0n
.PRINT v(optpt1) v(optpt2) v(optpt3) v(vspt1) v(vspt2) v(vspt3)


*---------------------------------
* W model
*---------------------------------
.MODEL Z30 W ModelType=RLGC N=1
+ Lo=
+ 195.8626245e-9
+ Co=
+ 204.4185703e-12
+ Ro=
+ 0.16151175
+ Go=
+ 0
+ Rs=
+ 8.86911e-05
+ Gd=
+ 2.36459e-11

*---------------------------------
.MODEL Z35 W ModelType=RLGC N=1
+ Lo=
+ 226.6180669e-9
+ Co=
+ 173.161471e-12
+ Ro=
+ 0.201065648
+ Go=
+ 0
+ Rs=
+ 0.000111623
+ Gd=
+ 1.98579e-11

*---------------------------------
.MODEL Z40 W ModelType=RLGC N=1
+ Lo=
+ 256.5548152e-9
+ Co=
+ 149.9708398e-12
+ Ro=
+ 0.246305419
+ Go=
+ 0
+ Rs=
+ 0.000129568
+ Gd=
+ 1.70406e-11

*---------------------------------
.MODEL Z45 W ModelType=RLGC N=1
+ Lo=
+ 286.1832825e-9
+ Co=
+ 132.0964622e-12
+ Ro=
+ 0.296753517
+ Go=
+ 0
+ Rs=
+ 0.000156514
+ Gd=
+ 1.48948e-11

*---------------------------------
.MODEL Z50 W ModelType=RLGC N=1
+ Lo=
+ 314.4612481e-9
+ Co=
+ 118.2503472e-12
+ Ro=
+ 0.354396286
+ Go=
+ 0
+ Rs=
+ 0.000172186
+ Gd=
+ 1.32191e-11

*---------------------------------
.MODEL Z55 W ModelType=RLGC N=1
+ Lo=
+ 342.4542448e-9
+ Co=
+ 107.0104958e-12
+ Ro=
+ 0.417466811
+ Go=
+ 0
+ Rs=
+ 0.000202169
+ Gd=
+ 1.18864e-11

*---------------------------------
.MODEL Z60 W ModelType=RLGC N=1
+ Lo=
+ 371.2631432e-9
+ Co=
+ 97.30288471e-12
+ Ro=
+ 0.492610837
+ Go=
+ 0
+ Rs=
+ 0.000237138
+ Gd=
+ 1.07397e-11

*---------------------------------
.MODEL Z65 W ModelType=RLGC N=1
+ Lo=
+ 399.8740936e-9
+ Co=
+ 89.12927955e-12
+ Ro=
+ 0.579542162
+ Go=
+ 0
+ Rs=
+ 0.000276343
+ Gd=
+ 9.77793e-12

*---------------------------------
.MODEL Z70 W ModelType=RLGC N=1
+ Lo=
+ 426.8033526e-9
+ Co=
+ 82.50170696e-12
+ Ro=
+ 0.674809366
+ Go=
+ 0
+ Rs=
+ 0.000317648
+ Gd=
+ 9.00119e-12

*---------------------------------
.MODEL Z75 W ModelType=RLGC N=1
+ Lo=
+ 455.698894e-9
+ Co=
+ 76.32375927e-12
+ Ro=
+ 0.794533609
+ Go=
+ 0
+ Rs=
+ 0.000367131
+ Gd=
+ 8.27958e-12

*---------------------------------
.MODEL Z80 W ModelType=RLGC N=1
+ Lo=
+ 483.3152145e-9
+ Co=
+ 71.16152363e-12
+ Ro=
+ 0.92945441
+ Go=
+ 0
+ Rs=
+ 0.000419908
+ Gd=
+ 7.6784e-12

*---------------------------------
.MODEL Z85 W ModelType=RLGC N=1
+ Lo=
+ 511.8675139e-9
+ Co=
+ 66.45439571e-12
+ Ro=
+ 1.09469075
+ Go=
+ 0
+ Rs=
+ 0.000480757
+ Gd=
+ 7.13155e-12

*---------------------------------
.MODEL Z90 W ModelType=RLGC N=1
+ Lo=
+ 536.3253761e-9
+ Co=
+ 62.83579215e-12
+ Ro=
+ 1.263104711
+ Go=
+ 0
+ Rs=
+ 0.000565794
+ Gd=
+ 6.71056e-12

*---------------------------------
.MODEL Z95 W ModelType=RLGC N=1
+ Lo=
+ 564.2884856e-9
+ Co=
+ 59.10429483e-12
+ Ro=
+ 1.492760113
+ Go=
+ 0
+ Rs=
+ 0.000632639
+ Gd=
+ 6.27622e-12

*---------------------------------
.MODEL Z100 W ModelType=RLGC N=1
+ Lo=
+ 591.3459733e-9
+ Co=
+ 55.85876276e-12
+ Ro=
+ 1.759324419
+ Go=
+ 0
+ Rs=
+ 0.000706407
+ Gd=
+ 5.8994e-12

*---------------------------------
.MODEL Z105 W ModelType=RLGC N=1
+ Lo=
+ 616.2488904e-9
+ Co=
+ 53.14071975e-12
+ Ro=
+ 2.052545156
+ Go=
+ 0
+ Rs=
+ 0.00078322
+ Gd=
+ 5.58426e-12

*---------------------------------
.MODEL Z110 W ModelType=RLGC N=1
+ Lo=
+ 644.9185142e-9
+ Co=
+ 50.28008245e-12
+ Ro=
+ 2.463054187
+ Go=
+ 0
+ Rs=
+ 0.00089857
+ Gd=
+ 5.25233e-12

*---------------------------------
.MODEL Z115 W ModelType=RLGC N=1
+ Lo=
+ 669.6082546e-9
+ Co=
+ 48.01275848e-12
+ Ro=
+ 2.897710808
+ Go=
+ 0
+ Rs=
+ 0.000991856
+ Gd=
+ 4.98844e-12

*---------------------------------
.MODEL Z120 W ModelType=RLGC N=1
+ Lo=
+ 688.1753022e-9
+ Co=
+ 46.41807648e-12
+ Ro=
+ 3.28407225
+ Go=
+ 0
+ Rs=
+ 0.001070005
+ Gd=
+ 4.8028e-12
*---------------------------------

.END
*--------------------------------------------------------------------*
