# 1 filename
# 2 cmax
# 3 cstep

gmt begin figures/${1} pdf

gmt set FONT 9

gmt makecpt -Cvik -T-${2}/${2}/500 -Z
gmt grdimage fields/${1}.nc -JW7c -Rd -C -Ba30g30
#-Balabels.txt

gmt colorbar -DJBC+o0c/0.3c+w7c -B${3}+l"radial magnetic field [nT]"
#+o-0.5c/0c

gmt end show
