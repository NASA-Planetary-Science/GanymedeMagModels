gmt begin figures/coefSpec pdf

gmt set FONT 12

#range=-850/-650
#inc=50
range=-850/850
inc=400

gmt basemap -R-0.5/0.5/${range} -JX0.5c/3.5c -Bxa1 -Bya${inc} -By+l"coefficient [nT]" -BNesW -Bpxccoefs/coeflabels.txt --MAP_ANNOT_OFFSET=4p
gmt plot coefs/split_ind_L1m0.txt -Sc4p -G150
gmt plot coefs/split_L1m0.txt -Ss4p -W1p

gmt basemap -X1c -R0.5/14.5/-100/100 -JX9c/3.5c -Bxa1 -Bya50 -By+l"coefficient [nT]" -BNEsw -Bpxccoefs/coeflabels.txt  --MAP_ANNOT_OFFSET=4p
gmt plot coefs/split_ind_Lrest.txt -Sc4p -G150
gmt plot coefs/split_Lrest.txt -Ss4p  -W1p

gmt text  -X-1c -R0/1/0/1 --FONT=20 -N  <<EOF
-0.15 1.02 a
EOF


gmt basemap  -Y-4c   -R0.8/3.2/1e3/3e6 -JX10c/3.5cl  -Bxa1 -Bya10p -Bx+l"spherical-harmonic degree @[l@[" -By+l"power [nT@+2@+]"

lt=1p
lcol=150/150/150
sym=c4p
scol=150/150/150


gmt plot specs/Lmax1_indhigh_spec_rs_200km.txt -S${sym} -G${scol}

gmt plot specs/Lmax2_indhigh_spec_rs_138km.txt -W${lt},${lcol}
gmt plot specs/Lmax2_indhigh_spec_rs_138km.txt -S${sym} -G${scol}

gmt plot specs/Lmax3_indhigh_spec_rs_1077km.txt -W${lt},${lcol}
gmt plot specs/Lmax3_indhigh_spec_rs_1077km.txt -S${sym} -G${scol} 



gmt plot specs/Lmax1_indlow_spec_rs_210km.txt -S${sym} -G${scol} 

gmt plot specs/Lmax2_indlow_spec_rs_137km.txt -W${lt},${lcol}
gmt plot specs/Lmax2_indlow_spec_rs_137km.txt -S${sym} -G${scol} 

gmt plot specs/Lmax3_indlow_spec_rs_1059km.txt -W${lt},${lcol}
gmt plot specs/Lmax3_indlow_spec_rs_1059km.txt -S${sym} -G${scol}




gmt plot specs/Lmax1_indsimple_spec_rs_210km.txt -S${sym} -G${scol}

gmt plot specs/Lmax2_indsimple_spec_rs_137km.txt -W${lt},${lcol}
gmt plot specs/Lmax2_indsimple_spec_rs_137km.txt -S${sym} -G${scol}

gmt plot specs/Lmax3_indsimple_spec_rs_1058km.txt -W${lt},${lcol}
gmt plot specs/Lmax3_indsimple_spec_rs_1058km.txt -S${sym} -G${scol}




lt=1p
lcol=black
sym=s4p


gmt plot specs/Lmax1_spec_rs_210km.txt -S${sym} -W1p

gmt plot specs/Lmax2_spec_rs_182km.txt -W${lt},${lcol}
gmt plot specs/Lmax2_spec_rs_182km.txt -S${sym}  -W1p

gmt plot specs/Lmax3_spec_rs_966km.txt -W${lt},${lcol}
gmt plot specs/Lmax3_spec_rs_966km.txt -S${sym}  -W1p



gmt text  -X-1c -R0/1/0/1 -JX10c/3.5c --FONT=20 -N  <<EOF
-0.027 1.02 b
EOF




gmt end show
