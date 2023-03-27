# 1 filename


# For Lmax = 3
#cells=15.5
# For Lmax = 2
cells=8.5

gmt begin figures/${1} pdf

gmt set FONT 10

gmt makecpt -Cvik -T-1/1/0.25 -Z
gmt grdimage correlation/${1}.grd -JX7c/-7c -R0.5/${cells}/0.5/${cells} -C -Bpxccorrelation/labelsUD.txt -Bpyccorrelation/labelsUD.txt
#-Balabels.txt
#-Bpx+a-30

gmt colorbar -DJRC+o3.8c/0c+w7c -B0.5+l"correlation coefficient"
#+o-0.5c/0c

gmt end show
