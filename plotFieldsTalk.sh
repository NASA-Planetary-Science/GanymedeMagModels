# 1 filename
# 2 cmax
# 3 cstep

gmt begin figures/${1}_talk pdf


gmt set PS_PAGE_COLOR black
gmt set MAP_FRAME_PEN white
gmt set FONT 16,white

#gmt set FONT 9

gmt makecpt -Cvik -T-${2}/${2}/500 -Z
gmt grdimage fields/${1}.nc -JW0/10c -Rd -C -Bg30

gmt colorbar -DJBC+o0c/0.3c+w10c -B${3}+l"radial magnetic field [nT]"
#+o-0.5c/0c

gmt end show
