# INPUT
# 1 foldername
#
# example
# ./plotData.sh KivPaperL2

gmt begin figures/${1}_diff pdf


# To make it with black background
# gmt set PS_PAGE_COLOR black
# gmt set MAP_FRAME_PEN white
# gmt set FONT+white


#gmt set FORMAT_DATE_MAP "o dd" FORMAT_CLOCK_MAP hh:mm
gmt set FORMAT_DATE_IN yyyy-mm-dd
#gmt set FORMAT_CLOCK_MAP hh:mmam
gmt set FORMAT_CLOCK_MAP hh:mm
gmt set FORMAT_DATE_MAP yyyy-mm-dd
gmt set FONT_LABEL 12p
gmt set FONT_ANNOT 12p

thick=1p
colmod=black   #blue
coldat=100
type='--'

ylims=-24/24
xlims=-24/24
zlims=-24/24

ystep=12
xstep=12
zstep=12

trfont=15p
trloc=1.2

gmt subplot begin 3x4 -Fs5c/3c -Scb -Srl

gmt subplot set 0,0
dates=1996-06-27T06:24:56.226/1996-06-27T06:35:57.926

gmt math data/${1}/G1_BX_sim.txt  data/GalileoData/G1_BX.txt NEG ADD = diff.txt
gmt plot diff.txt -JX? -R${dates}/${xlims} -Bya${xstep} -By+l"B@-x@- [nT]" -Bpxa5M -Bx+l"1996 Jun 27" -W${thick},${coldat} #-B+t"G1"
rm diff.txt
rmsX=$(gmt math data/GalileoData/G1_BX.txt data/${1}/G1_BX_sim.txt NEG ADD RMS -S 10 MUL RINT 10 DIV -o1 =)
gmt text -R0/1/0/1 <<EOF
0.3 0.87 rmse = ${rmsX} nT
EOF
gmt text -R0/1/0/1 -N --FONT=${trfont} <<EOF
0.5 ${trloc} G1
EOF

gmt subplot set 1,0
gmt math data/${1}/G1_BY_sim.txt  data/GalileoData/G1_BY.txt NEG ADD = diff.txt
gmt plot diff.txt -JX? -R${dates}/${ylims} -Bya${ystep} -By+l"B@-y@- [nT]" -Bpxa5M -Bx+l"1996 Jun 27" -W${thick},${coldat}
rm diff.txt
rmsY=$(gmt math data/GalileoData/G1_BY.txt data/${1}/G1_BY_sim.txt NEG ADD RMS -S 10 MUL RINT 10 DIV -o1 =)
gmt text -R0/1/0/1 <<EOF
0.3 0.12 rmse = ${rmsY} nT
EOF


gmt subplot set 2,0
gmt math data/${1}/G1_BZ_sim.txt  data/GalileoData/G1_BZ.txt NEG ADD = diff.txt
gmt plot diff.txt -JX? -R${dates}/${zlims} -Bya${zstep} -By+l"B@-z@- [nT]" -Bpxa5M -Bx+l"1996 Jun 27" -W${thick},${coldat}
rm diff.txt
rmsZ=$(gmt math data/GalileoData/G1_BZ.txt data/${1}/G1_BZ_sim.txt NEG ADD RMS -S 10 MUL RINT 10 DIV -o1 =)
gmt text -R0/1/0/1 <<EOF
0.68 0.87 rmse = ${rmsZ} nT
EOF



gmt subplot set 0,1
dates=1996-09-06T18:57:38.120/1996-09-06T19:05:26.786
gmt math data/${1}/G2_BX_sim.txt  data/GalileoData/G2_BX.txt NEG ADD = diff.txt
gmt plot diff.txt -JX? -R${dates}/${xlims} -Bya${xstep} -By+l"Bx [nT]" -Bpxa5M -Bx+l"1996 Sep 6" -W${thick},${coldat} #-B+t"G2"
rm diff.txt
rmsX=$(gmt math data/GalileoData/G2_BX.txt data/${1}/G2_BX_sim.txt NEG ADD RMS -S 10 MUL RINT 10 DIV -o1 =)
gmt text -R0/1/0/1 <<EOF 
0.31 0.12 rmse = ${rmsX} nT
EOF
gmt text -R0/1/0/1 -N --FONT=${trfont} <<EOF
0.5 ${trloc} G2
EOF


gmt subplot set 1,1
gmt math data/${1}/G2_BY_sim.txt  data/GalileoData/G2_BY.txt NEG ADD = diff.txt
gmt plot diff.txt -JX? -R${dates}/${ylims} -Bya${ystep} -By+l"By [nT]" -Bpxa5M -Bx+l"1996 Sep 6" -W${thick},${coldat}
rm diff.txt
rmsY=$(gmt math data/GalileoData/G2_BY.txt data/${1}/G2_BY_sim.txt NEG ADD RMS -S 10 MUL RINT 10 DIV -o1 =)
gmt text -R0/1/0/1 <<EOF
0.31 0.12 rmse = ${rmsY} nT
EOF

gmt subplot set 2,1
gmt math data/${1}/G2_BZ_sim.txt  data/GalileoData/G2_BZ.txt NEG ADD = diff.txt
gmt plot diff.txt -JX? -R${dates}/${zlims} -Bya${zstep} -By+l"Bz [nT]" -Bpxa5M -Bx+l"1996 Sep 6" -W${thick},${coldat}
rm diff.txt
rmsZ=$(gmt math data/GalileoData/G2_BZ.txt data/${1}/G2_BZ_sim.txt NEG ADD RMS -S 10 MUL RINT 10 DIV -o1 =)
gmt text -R0/1/0/1 <<EOF
0.31 0.12 rmse = ${rmsZ} nT
EOF

gmt subplot set 0,2
dates=2000-05-20T10:08:05.225/2000-05-20T10:12:18.89
gmt math data/${1}/G28_BX_sim.txt  data/GalileoData/G28_BX.txt NEG ADD = diff.txt
gmt plot diff.txt -JX? -R${dates}/${xlims} -Bya${xstep} -By+l"Bx [nT]" -Bpxa2M -Bx+l"2000 May 20" -W${thick},${coldat} #-B+t"G28"
rm diff.txt
rmsX=$(gmt math data/GalileoData/G28_BX.txt data/${1}/G28_BX_sim.txt NEG ADD RMS -S 10 MUL RINT 10 DIV -o1 =)
gmt text -R0/1/0/1 <<EOF
0.31 0.12 rmse = ${rmsX} nT
EOF
gmt text -R0/1/0/1 -N --FONT=${trfont} <<EOF
0.5 ${trloc} G28
EOF


gmt subplot set 1,2
gmt math data/${1}/G28_BY_sim.txt  data/GalileoData/G28_BY.txt NEG ADD = diff.txt
gmt plot diff.txt -JX? -R${dates}/${ylims} -Bya${ystep} -By+l"By [nT]" -Bpxa2M -Bx+l"2000 May 20" -W${thick},${coldat}
rm diff.txt
rmsY=$(gmt math data/GalileoData/G28_BY.txt data/${1}/G28_BY_sim.txt NEG ADD RMS -S 10 MUL RINT 10 DIV -o1 =)
gmt text -R0/1/0/1 <<EOF
0.31 0.87 rmse = ${rmsY} nT
EOF

gmt subplot set 2,2
gmt math data/${1}/G28_BZ_sim.txt  data/GalileoData/G28_BZ.txt NEG ADD = diff.txt
gmt plot diff.txt -JX? -R${dates}/${zlims} -Bya${zstep} -By+l"Bz [nT]" -Bpxa2M -Bx+l"2000 May 20" -W${thick},${coldat}
rm diff.txt
rmsZ=$(gmt math data/GalileoData/G28_BZ.txt data/${1}/G28_BZ_sim.txt NEG ADD RMS -S 10 MUL RINT 10 DIV -o1 =)
gmt text -R0/1/0/1 <<EOF
0.68 0.12 rmse = ${rmsZ} nT
EOF


gmt subplot set 0,3
dates=2021-06-07T16:53:40/2021-06-07T16:58:00
gmt math data/${1}/G101_BX_sim.txt  data/JunoData/J1_BX.txt NEG ADD = diff.txt
gmt plot diff.txt -JX? -R${dates}/${xlims} -Bya${xstep} -By+l"Bx [nT]" -Bpxa5M -Bx+l"2021 Jun 7" -W${thick},${coldat} #-B+t"J"
rm diff.txt
rmsX=$(gmt math data/JunoData/J1_BX.txt data/${1}/G101_BX_sim.txt NEG ADD RMS -S 10 MUL RINT 10 DIV -o1 =)
gmt text -R0/1/0/1 <<EOF
0.31 0.12 rmse = ${rmsX} nT
EOF
gmt text -R0/1/0/1 -N --FONT=${trfont} <<EOF
0.5 ${trloc} J34
EOF


gmt subplot set 1,3
gmt math data/${1}/G101_BY_sim.txt  data/JunoData/J1_BY.txt NEG ADD = diff.txt
gmt plot diff.txt -JX? -R${dates}/${ylims} -Bya${ystep} -By+l"By [nT]" -Bpxa5M -Bx+l"2021 Jun 7" -W${thick},${coldat}
rm diff.txt
rmsY=$(gmt math data/JunoData/J1_BY.txt data/${1}/G101_BY_sim.txt NEG ADD RMS -S 10 MUL RINT 10 DIV -o1 =)
gmt text -R0/1/0/1 <<EOF
0.31 0.87 rmse = ${rmsY} nT
EOF


gmt subplot set 2,3
#gmt basemap  -JX?  -R${dates}/${zlims}  -BpxcJtimelabels.txt
gmt math data/${1}/G101_BZ_sim.txt  data/JunoData/J1_BZ.txt NEG ADD = diff.txt
gmt plot diff.txt -Bya${zstep} -By+l"Bz [nT]"  -JX?  -R${dates}/${zlims}  -BpxcJtimelabels.txt -Bx+l"2021 Jun 7" -W${thick},${coldat}
rm diff.txt
rmsZ=$(gmt math data/JunoData/J1_BZ.txt data/${1}/G101_BZ_sim.txt NEG ADD RMS -S 10 MUL RINT 10 DIV -o1 =)
gmt text -R0/1/0/1 <<EOF
0.31 0.12 rmse = ${rmsZ} nT
EOF


gmt subplot end

gmt end show
