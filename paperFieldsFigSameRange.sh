gmt begin figures/paperSpatialSameRange pdf

gmt set FONT_LABEL 12p
gmt set FONT_ANNOT 12p

gmt subplot begin 2x2 -Fs10c/5c -Cw-0.4c -Aa+o-0.3c/0c --FONT_TAG=20p

trshp=p3p
trc=150

gmt subplot set 0,0
col=3000
step=1000
gmt makecpt -Cvik -T-${col}/${col}/10 -Z
gmt grdimage fields/Lmax1_field_cmp1.nc -JW? -Rd -C -Ba30g30 -BnesW
gmt colorbar -DJTC+o0c/0.3c+w9.5c -B${step}+l"radial magnetic field [nT]"
gmt plot exportedTracks/Galileo1.txt -S${trshp}  -G${trc}
gmt plot exportedTracks/Galileo2.txt -S${trshp} -G${trc}
gmt plot exportedTracks/Galileo7.txt -S${trshp} -G${trc}
gmt plot exportedTracks/Galileo8.txt -S${trshp} -G${trc}
gmt plot exportedTracks/Galileo28.txt -S${trshp} -G${trc}
gmt plot exportedTracks/Galileo29.txt -S${trshp} -G${trc}
gmt plot exportedTracks/Juno1.txt -S${trshp} -G${trc}

gmt subplot set 0,1
col=3000
step=1000
gmt makecpt -Cvik -T-${col}/${col}/10 -Z
gmt grdimage fields/Lmax2_field_cmp1.nc -JW? -Rd -C -Ba30g30  -BnEsw
gmt colorbar -DJTC+o0c/0.3c+w9.5c -B${step}+l"radial magnetic field [nT]"
gmt plot exportedTracks/Galileo1.txt -S${trshp}  -G${trc}
gmt plot exportedTracks/Galileo2.txt -S${trshp} -G${trc}
gmt plot exportedTracks/Galileo7.txt -S${trshp} -G${trc}
gmt plot exportedTracks/Galileo8.txt -S${trshp} -G${trc}
gmt plot exportedTracks/Galileo28.txt -S${trshp} -G${trc}
gmt plot exportedTracks/Galileo29.txt -S${trshp} -G${trc}
gmt plot exportedTracks/Juno1.txt -S${trshp} -G${trc}

gmt subplot set 1,0
col=3000
step=1000
gmt makecpt -Cvik -T-${col}/${col}/10 -Z
gmt grdimage fields/Lmax3_field_cmp1.nc -JW? -Rd -C -Ba30g30 -BnesW
gmt colorbar -DJBC+o0c/0.3c+w9.5c -B${step}+l"radial magnetic field [nT]"
gmt plot exportedTracks/Galileo1.txt -S${trshp}  -G${trc}
gmt plot exportedTracks/Galileo2.txt -S${trshp} -G${trc}
gmt plot exportedTracks/Galileo7.txt -S${trshp} -G${trc}
gmt plot exportedTracks/Galileo8.txt -S${trshp} -G${trc}
gmt plot exportedTracks/Galileo28.txt -S${trshp} -G${trc}
gmt plot exportedTracks/Galileo29.txt -S${trshp} -G${trc}
gmt plot exportedTracks/Juno1.txt -S${trshp} -G${trc}

gmt subplot set 1,1
col=3000
step=1000
gmt makecpt -Cvik -T-${col}/${col}/10 -Z
gmt grdimage fields/Lmax3_g10-900_field_cmp1.nc -JW? -Rd -C -Ba30g30  -BnEsw
gmt colorbar -DJBC+o0c/0.3c+w9.5c -B${step}+l"radial magnetic field [nT]"
gmt plot exportedTracks/Galileo1.txt -S${trshp}  -G${trc}
gmt plot exportedTracks/Galileo2.txt -S${trshp} -G${trc}
gmt plot exportedTracks/Galileo7.txt -S${trshp} -G${trc}
gmt plot exportedTracks/Galileo8.txt -S${trshp} -G${trc}
gmt plot exportedTracks/Galileo28.txt -S${trshp} -G${trc}
gmt plot exportedTracks/Galileo29.txt -S${trshp} -G${trc}
gmt plot exportedTracks/Juno1.txt -S${trshp} -G${trc}


gmt subplot end


gmt end show
