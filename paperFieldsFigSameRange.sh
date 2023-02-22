gmt begin figures/paperSpatialSameRange pdf

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
col=1600
step=500
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
gmt grdimage fields/Lmax2_B_i6_v-35_coef_manycoefs_field_cmp1.nc -JW${wid} -Rd -C -Ba30g30 -BnesW -X-${shftX} -Y${shftY}
# Plot magnetic equator
gmt grdcontour  fields/Lmax2_B_i6_v-35_coef_manycoefs_field_cmp1.nc -An -C0, -W1p,black,-
#gmt colorbar -DJBC+o5.7c/0.3c+w21c/0.5c -B${step}+l"radial magnetic field [nT]"
gmt colorbar -DJBC+o3.75c/0.3c+w15c/0.3c -B${step}+l"radial magnetic field [nT]"
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


#gmt subplot set 1,1
#col=3000
#step=1000
gmt makecpt -Cvik -T-${col}/${col}/10 -Z
gmt grdimage  fields/Lmax2_C_i7_v24_coef_manycoefs_field_cmp1.nc -JW${wid} -Rd -C -Ba30g30  -BnEsw -X${shftX}
# Plot magnetic equator
gmt grdcontour  fields/Lmax2_C_i7_v24_coef_manycoefs_field_cmp1.nc -An -C0, -W1p,black,-
#gmt colorbar -DJBC+o0c/0.3c+w9.5c -B${step}+l"radial magnetic field [nT]"
gmt plot exportedTracks/Galileo1.txt -S${trshp}  -G${trc}
gmt plot exportedTracks/Galileo2.txt -S${trshp} -G${trc}
gmt plot exportedTracks/Galileo7.txt -S${trshp} -G${trc}
gmt plot exportedTracks/Galileo8.txt -S${trshp} -G${trc}
gmt plot exportedTracks/Galileo28.txt -S${trshp} -G${trc}
gmt plot exportedTracks/Galileo29.txt -S${trshp} -G${trc}
gmt plot exportedTracks/Juno1.txt -S${trshp} -G${trc}
gmt text -R0/1/0/1 -JX${wid}/${widhalf} -N --FONT=19 <<EOF
0 0.92 d
EOF

#gmt subplot end


gmt end show
