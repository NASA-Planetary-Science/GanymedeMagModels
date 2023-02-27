# 1 filename
# 2 cmax
# 3 cstep

gmt begin figures/${1} pdf


#gmt set PS_PAGE_COLOR black
#gmt set MAP_FRAME_PEN white
gmt set FONT 15 #,white

#gmt set FONT 9

gmt makecpt -Cimola -T0/${2}/${3} -Z
gmt grdmath fields/${1}.nc ABS = diff.nc
gmt grdimage diff.nc -JW0/10c -Rd -C -Bg30
rm diff.nc
#gmt makecpt -Cvik -T-${2}/${2}/${3} -Z
#gmt grdimage fields/${1}.nc -JW0/10c -Rd -C -Bg30

col=black

gmt plot exportedTracks/Galileo1.txt -Sc0.1c -W${col}
gmt plot exportedTracks/Galileo2.txt -Sc0.1c -W${col}
gmt plot exportedTracks/Galileo7.txt -Sc0.1c -W${col}
gmt plot exportedTracks/Galileo8.txt -Sc0.1c -W${col}
gmt plot exportedTracks/Galileo28.txt -Sc0.1c -W${col}
gmt plot exportedTracks/Galileo29.txt -Sc0.1c -W${col}

gmt plot exportedTracks/Juno1.txt -Sc0.1c -W${col}


gmt colorbar -DJBC+o0c/0.3c+w10c -B${3}+l"radial magnetic field absolute difference [nT]"
#+o-0.5c/0c

gmt end show
