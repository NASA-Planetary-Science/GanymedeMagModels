# Plotting the spectra of our four models

gmt begin figures/paperSpecFig pdf


gmt set FONT 14

gmt basemap -R0.8/3.2/1e3/3e6 -JX10c/3cl  -Bxa1 -Bya10p -Bx+l"spherical-harmonic degree @[l@[" -By+l"power [nT@+2@+]"


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




gmt end show
