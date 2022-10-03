gmt begin figures/paperSpatialSameRange-spec pdf

#gmt set FONT_LABEL 12p
#gmt set FONT_ANNOT 12p

gmt set FONT_LABEL 12p
gmt set FONT_ANNOT 11p


#gmt subplot begin 2x2 -Fs10c/5c -Cw-0.4c -Aa+o-0.3c/0c --FONT_TAG=20p

trshp=p3p
trc=150

wid=7c
widhalf=3.5c
shftX=7.5c
shftY=-3.8c

#gmt subplot set 0,0
col=2000
step=1000
gmt makecpt -Cvik -T-${col}/${col}/10 -Z
gmt grdimage fields/Lmax1_field_cmp1.nc -JW${wid} -Rd -C -Ba30g30 -BnesW
# Plot magnetic equator
gmt grdcontour fields/Lmax1_field_cmp1.nc -An -C0, -W1p,black,-
#gmt colorbar -DJTC+o0c/0.3c+w9.5c -B${step}+l"radial magnetic field [nT]"
gmt plot exportedTracks/Galileo1.txt -S${trshp}  -G${trc}
gmt plot exportedTracks/Galileo2.txt -S${trshp} -G${trc}
gmt plot exportedTracks/Galileo7.txt -S${trshp} -G${trc}
gmt plot exportedTracks/Galileo8.txt -S${trshp} -G${trc}
gmt plot exportedTracks/Galileo28.txt -S${trshp} -G${trc}
gmt plot exportedTracks/Galileo29.txt -S${trshp} -G${trc}
gmt plot exportedTracks/Juno1.txt -S${trshp} -G${trc}
gmt text -R0/1/0/1 -JX${wid}/${widhalf} -N --FONT=19 <<EOF
-0.1 0.92 a
EOF


#gmt subplot set 0,1
#col=3000
#step=1000
gmt makecpt -Cvik -T-${col}/${col}/10 -Z
gmt grdimage fields/Lmax2_field_cmp1.nc -JW${wid} -Rd -C -Ba30g30  -BnEsw -X${shftX} 
# Plot magnetic equator
gmt grdcontour fields/Lmax2_field_cmp1.nc -An -C0, -W1p,black,-
#gmt colorbar -DJTC+o0c/0.3c+w9.5c -B${step}+l"radial magnetic field [nT]"
gmt plot exportedTracks/Galileo1.txt -S${trshp}  -G${trc}
gmt plot exportedTracks/Galileo2.txt -S${trshp} -G${trc}
gmt plot exportedTracks/Galileo7.txt -S${trshp} -G${trc}
gmt plot exportedTracks/Galileo8.txt -S${trshp} -G${trc}
gmt plot exportedTracks/Galileo28.txt -S${trshp} -G${trc}
gmt plot exportedTracks/Galileo29.txt -S${trshp} -G${trc}
gmt plot exportedTracks/Juno1.txt -S${trshp} -G${trc}
gmt text -R0/1/0/1 -JX${wid}/${widhalf} -N --FONT=19 <<EOF
0 0.92 b
EOF

#gmt subplot set 1,0
#col=3000
#step=1000
gmt makecpt -Cvik -T-${col}/${col}/10 -Z
gmt grdimage fields/Lmax3_field_cmp1.nc -JW${wid} -Rd -C -Ba30g30 -BnesW -X-${shftX} -Y${shftY}
# Plot magnetic equator
gmt grdcontour fields/Lmax3_field_cmp1.nc -An -C0, -W1p,black,-
#gmt colorbar -DJBC+o3.75c/0.3c+w15c/0.3c -B${step}+l"radial magnetic field [nT]"
gmt colorbar -DJBC+o0c/0.3c+w${wid}/0.3c -B${step}+l"radial magnetic field [nT]"
gmt plot exportedTracks/Galileo1.txt -S${trshp}  -G${trc}
gmt plot exportedTracks/Galileo2.txt -S${trshp} -G${trc}
gmt plot exportedTracks/Galileo7.txt -S${trshp} -G${trc}
gmt plot exportedTracks/Galileo8.txt -S${trshp} -G${trc}
gmt plot exportedTracks/Galileo28.txt -S${trshp} -G${trc}
gmt plot exportedTracks/Galileo29.txt -S${trshp} -G${trc}
gmt plot exportedTracks/Juno1.txt -S${trshp} -G${trc}
gmt text -R0/1/0/1 -JX${wid}/${widhalf} -N --FONT=19 <<EOF
-0.1 0.92 c
EOF




lt=1p
sym=5p
colfit=120/120/120
#gmt set FONT 14

gmt basemap -R0.8/3.2/2e3/2e6 -JX6.5c/3cl  -Bxa1 -Bya10p -Bx+l"spherical-harmonic degree @[l@[" -By+l"power [nT@+2@+]" -X${shftX} -BnESw

#gmt plot specs/KivelsonEtAl2002_spec_rs_229km.txt -W${lt}
#gmt plot specs/KivelsonEtAl2002_spec_rs_229km.txt -Sc${sym} -W1p -l"K 2002"

gmt plot specs/Lmax1_spec_rs_210km.txt -Sa${sym} -W1p  -l"@%2%L@%%@-max@- = 1"

gmt plot specs/Lmax2_spec_rs_182km.txt -W${lt}
gmt plot specs/Lmax2_spec_rs_182km.txt -Ss${sym} -W1p -l"@%2%L@%%@-max@- = 2"

gmt plot specs/Lmax3_spec_rs_966km.txt -W${lt}
gmt plot specs/Lmax3_spec_rs_966km.txt -St${sym} -W1p  -l"@%2%L@%%@-max@- = 3"
#gmt plot specs/Lmax3_spec_rs_966km_fittedMcLeod.txt -W${lt},${colfit},-

# gmt plot specs/Lmax3_g10-900_spec_rs_1488km.txt -W${lt} 
# gmt plot specs/Lmax3_g10-900_spec_rs_1488km.txt -Sa${sym} -W1p  -l"@%2%g@%%@-1@-@+0@+ = -900"
# gmt plot specs/Lmax3_g10-900_spec_rs_1488km_fittedMcLeod.txt -W${lt},${colfit},-

#-l"@%2%g@%%@-1@-@+0@+ = -900"

gmt legend -DjBL #--FONT=13

gmt text -R0/1/0/1 -JX${wid}/${widhalf} -N --FONT=19 <<EOF
-0.05 0.92 d
EOF



# #gmt subplot set 1,1
# #col=3000
# #step=1000
# gmt makecpt -Cvik -T-${col}/${col}/10 -Z
# gmt grdimage fields/Lmax3_g10-900_field_cmp1.nc -JW${wid} -Rd -C -Ba30g30  -BnEsw -X${shftX}
# # Plot magnetic equator
# gmt grdcontour fields/Lmax3_g10-900_field_cmp1.nc -An -C0, -W1p,black,-
# #gmt colorbar -DJBC+o0c/0.3c+w9.5c -B${step}+l"radial magnetic field [nT]"
# gmt plot exportedTracks/Galileo1.txt -S${trshp}  -G${trc}
# gmt plot exportedTracks/Galileo2.txt -S${trshp} -G${trc}
# gmt plot exportedTracks/Galileo7.txt -S${trshp} -G${trc}
# gmt plot exportedTracks/Galileo8.txt -S${trshp} -G${trc}
# gmt plot exportedTracks/Galileo28.txt -S${trshp} -G${trc}
# gmt plot exportedTracks/Galileo29.txt -S${trshp} -G${trc}
# gmt plot exportedTracks/Juno1.txt -S${trshp} -G${trc}
# gmt text -R0/1/0/1 -JX${wid}/${widhalf} -N --FONT=19 <<EOF
# 0 0.92 d
# EOF

#gmt subplot end


gmt end show
