gmt begin figures/paperSpatialSameRangeTalkOnly2 pdf

gmt set FONT_LABEL 12p
gmt set FONT_ANNOT 12p

#gmt set FONT_LABEL 12p
#gmt set FONT_ANNOT 11p
gmt set PS_PAGE_COLOR black
gmt set MAP_FRAME_PEN white
gmt set FONT white

#gmt subplot begin 2x2 -Fs10c/5c -Cw-0.4c -Aa+o-0.3c/0c --FONT_TAG=20p

trshp=p3p
trc=150

wid=7c
widhalf=3.5c
#shftX=7.5c
shftY=-3.8c
#shftY=-6c


col=1650
step=800

gmt makecpt -Cvik -T-${col}/${col}/10 -Z
gmt grdimage fields/Lmax2_manycoefs_field_cmp1.nc -JW${wid} -Rd -C -Ba30g30  -BnEsw 
# Plot magnetic equator
gmt grdcontour fields/Lmax2_manycoefs_field_cmp1.nc -An -C0, -W1p,black,-
gmt plot exportedTracks/Galileo1.txt -S${trshp}  -G${trc}
gmt plot exportedTracks/Galileo2.txt -S${trshp} -G${trc}
gmt plot exportedTracks/Galileo7.txt -S${trshp} -G${trc}
gmt plot exportedTracks/Galileo8.txt -S${trshp} -G${trc}
gmt plot exportedTracks/Galileo28.txt -S${trshp} -G${trc}
gmt plot exportedTracks/Galileo29.txt -S${trshp} -G${trc}
gmt plot exportedTracks/Juno1.txt -S${trshp} -G${trc}

gmt makecpt -Cvik -T-${col}/${col}/10 -Z
gmt grdimage fields/Lmax2_B_i6_v-37p25_manycoefs_field_cmp1.nc -JW${wid} -Rd -C -Ba30g30 -BnEsw -Y${shftY}
# Plot magnetic equator
gmt grdcontour  fields/Lmax2_B_i6_v-37p25_manycoefs_field_cmp1.nc -An -C0, -W1p,black,-
#gmt colorbar -DJBC+o5.7c/0.3c+w21c/0.5c -B${step}+l"radial magnetic field [nT]"
gmt plot exportedTracks/Galileo1.txt -S${trshp}  -G${trc}
gmt plot exportedTracks/Galileo2.txt -S${trshp} -G${trc}
gmt plot exportedTracks/Galileo7.txt -S${trshp} -G${trc}
gmt plot exportedTracks/Galileo8.txt -S${trshp} -G${trc}
gmt plot exportedTracks/Galileo28.txt -S${trshp} -G${trc}
gmt plot exportedTracks/Galileo29.txt -S${trshp} -G${trc}
gmt plot exportedTracks/Juno1.txt -S${trshp} -G${trc}
#gmt colorbar -DJBC+o3.75c/0.3c+w15c/0.3c -B${step}+l"radial magnetic field [nT]"
gmt colorbar -DJBC+o0c/0.3c+w${wid}/0.25c -B${step}+l"radial magnetic field [nT]"






gmt end show
