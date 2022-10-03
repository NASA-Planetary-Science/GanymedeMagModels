gmt begin figures/splitCoefs pdf

gmt set FONT 9

#range=-850/-650
#inc=50
range=-850/850
inc=200

gmt basemap -R-0.5/0.5/${range} -JX1c/4c -Bxa1 -Bya${inc} -By+l"coefficient [nT]" -BneSW -Bpxccoefs/coeflabels.txt 
gmt plot coefs/split_L1m0.txt -Sp4p

gmt basemap -X1.5c -R0.5/14.5/-100/100 -JX14c/4c -Bxa1 -Bya50 -By+l"coefficient [nT]" -BnESw -Bpxccoefs/coeflabels.txt 
gmt plot coefs/split_Lrest.txt -Sp4p

gmt end show
