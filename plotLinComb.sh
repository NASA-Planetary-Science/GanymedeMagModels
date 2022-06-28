gmt begin figures/linComb pdf

gmt set FONT 14
lt=1p
#sym=5p
sym=0.25c
colfit=120/120/120

gmt makecpt -Cdavos -D -I -T5/6.5/0.1 -Z

#### Models

gmt basemap -JX10c/5c -R-0.03/1.03/100/1010 -Bx0.1+l"fraction of model @%2%L@%%@-max@- = 2" -By200+l"source radius @[r_s@[" -BneSW
# gmt plot -Sc0.28c -G160 <<EOF
# 0,966
# 1,182
# EOF
gmt plot linCombResultsPlotting.txt -C -Wblack -Sc0.17c

gmt plot -C -Wblack -Sc0.25c <<EOF
0,966,4.9722319842808
1,182,6.45129176269421
EOF

othersyms=0.285c
otherlt=0.4p

gmt plot -C -W${otherlt},black -Ss${othersyms} <<EOF
0.25,840,5.03042747986655
EOF

gmt plot -C -W${otherlt},black -St${othersyms} <<EOF
0.5,689,5.32120753420473
EOF

gmt plot -C -W${otherlt},black -Sd${othersyms} <<EOF
0.75,489,5.80975368506678
EOF

#gmt colorbar -DJCR+w4c/0.3c+o0.2c/0c -B0.2+l"rmse [nT]"
gmt colorbar -DJTC+w10c/0.3c+o0c/0.25c -B0.2+l"rmse [nT]"

gmt text -R0/1/0/1 -N  --FONT=20 <<EOF
-0.1 1.135 a
EOF



#### Specs

gmt basemap -X10.5c -R0.8/3.2/3e2/3e6 -JX10c/5cl  -Bxa1 -Bya10p -Bx+l"spherical-harmonic degree @[l@[" -By+l"power [nT@+2@+]" -BnESw

gmt plot specs/LinComb_fac25pc_spec_rs_840km.txt -W${lt}
gmt plot specs/LinComb_fac25pc_spec_rs_840km.txt -Ss${sym} -W0.8p -l"fraction 0.25"
#gmt plot specs/LinComb_fac25pc_spec_rs_840km_fittedMcLeod.txt -W${lt},${colfit},-

gmt plot specs/LinComb_fac50pc_spec_rs_689km.txt -W${lt}
gmt plot specs/LinComb_fac50pc_spec_rs_689km.txt -St${sym} -W0.8p  -l"fraction 0.5"
#gmt plot specs/LinComb_fac50pc_spec_rs_689km_fittedMcLeod.txt -W${lt},${colfit},-

gmt plot specs/LinComb_fac75pc_spec_rs_489km.txt -W${lt} 
gmt plot specs/LinComb_fac75pc_spec_rs_489km.txt -Sd${sym} -W0.8p  -l"fraction 0.75"
#gmt plot specs/LinComb_fac75pc_spec_rs_489km_fittedMcLeod.txt -W${lt},${colfit},-

gmt legend -DjBL

gmt text -R0/1/0.0000001/1 -N  --FONT=20 <<EOF
0.02 10 b
EOF

gmt end show
