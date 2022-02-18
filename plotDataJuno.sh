# INPUT
# 1 foldername
#
# example
# ./plotData.sh KivPaperL2

gmt begin figures/${1} pdf


# To make it with black background
# gmt set PS_PAGE_COLOR black
# gmt set MAP_FRAME_PEN white
# gmt set FONT+white


#gmt set FORMAT_DATE_MAP "o dd" FORMAT_CLOCK_MAP hh:mm
gmt set FORMAT_DATE_IN yyyy-mm-dd
gmt set FORMAT_CLOCK_MAP hh:mmam
gmt set FORMAT_DATE_MAP yyyy-mm-dd
gmt set FONT_LABEL 12p
gmt set FONT_ANNOT 12p

thick=1p
colmod=black   #blue
coldat=100
type='--'

xlims=-500/0
ylims=-500/550
zlims=-1100/400

xstep=100
ystep=200
zstep=300

trfont=15p
trloc=1.2

gmt subplot begin 3x4 -Fs5c/3c -Scb -Srl

gmt subplot set 0,0
dates=1996-06-27T06:24:56.226/1996-06-27T06:35:57.926
gmt plot data/GalileoData/G1_BX.txt -JX? -R${dates}/${xlims} -Bya${xstep} -By+l"Bx [nT]" -Bpxa5M -Bx+l"June 27, 1996" -W${thick},${coldat} #-B+t"G1"
gmt plot data/${1}/G1_BX_sim.txt -W${thick},${colmod},$type
rmsX=$(gmt math data/GalileoData/G1_BX.txt data/${1}/G1_BX_sim.txt NEG ADD RMS -S 10 MUL RINT 10 DIV -o1 =)
gmt text -R0/1/0/1 <<EOF
0.3 0.87 rmse = ${rmsX} nT
EOF
gmt text -R0/1/0/1 -N --FONT=${trfont} <<EOF
0.5 ${trloc} G1
EOF

gmt subplot set 1,0
gmt plot data/GalileoData/G1_BY.txt -JX? -R${dates}/${ylims} -Bya${ystep} -By+l"By [nT]" -Bpxa5M -Bx+l"June 27, 1996" -W${thick},${coldat}
gmt plot data/${1}/G1_BY_sim.txt -W${thick},${colmod},$type
rmsY=$(gmt math data/GalileoData/G1_BY.txt data/${1}/G1_BY_sim.txt NEG ADD RMS -S 10 MUL RINT 10 DIV -o1 =)
gmt text -R0/1/0/1 <<EOF
0.3 0.87 rmse = ${rmsY} nT
EOF


gmt subplot set 2,0
gmt plot data/GalileoData/G1_BZ.txt -JX? -R${dates}/${zlims} -Bya${zstep} -By+l"Bz [nT]" -Bpxa5M -Bx+l"June 27, 1996" -W${thick},${coldat}
gmt plot data/${1}/G1_BZ_sim.txt -W${thick},${colmod},$type
rmsZ=$(gmt math data/GalileoData/G1_BZ.txt data/${1}/G1_BZ_sim.txt NEG ADD RMS -S 10 MUL RINT 10 DIV -o1 =)
gmt text -R0/1/0/1 <<EOF
0.31 0.12 rmse = ${rmsZ} nT
EOF



gmt subplot set 0,1
dates=1996-09-06T18:57:38.120/1996-09-06T19:05:26.786
gmt plot data/GalileoData/G2_BX.txt -JX? -R${dates}/${xlims} -Bya${xstep} -By+l"Bx [nT]" -Bpxa5M -Bx+l"Sept 06, 1996" -W${thick},${coldat} #-B+t"G2"
gmt plot data/${1}/G2_BX_sim.txt -W${thick},${colmod},$type
rmsX=$(gmt math data/GalileoData/G2_BX.txt data/${1}/G2_BX_sim.txt NEG ADD RMS -S 10 MUL RINT 10 DIV -o1 =)
gmt text <<EOF 
1996-09-06T18:59:50 -60 rmse = ${rmsX} nT
EOF
gmt text -R0/1/0/1 -N --FONT=${trfont} <<EOF
0.5 ${trloc} G2
EOF


gmt subplot set 1,1
gmt plot data/GalileoData/G2_BY.txt -JX? -R${dates}/${ylims} -Bya${ystep} -By+l"By [nT]" -Bpxa5M -Bx+l"Sept 06, 1996" -W${thick},${coldat}
gmt plot data/${1}/G2_BY_sim.txt -W${thick},${colmod},$type
rmsY=$(gmt math data/GalileoData/G2_BY.txt data/${1}/G2_BY_sim.txt NEG ADD RMS -S 10 MUL RINT 10 DIV -o1 =)
gmt text <<EOF
1996-09-06T19:03:10 430 rmse = ${rmsY} nT
EOF

gmt subplot set 2,1
gmt plot data/GalileoData/G2_BZ.txt -JX? -R${dates}/${zlims} -Bya${zstep} -By+l"Bz [nT]" -Bpxa5M -Bx+l"Sept 06, 1996" -W${thick},${coldat}
gmt plot data/${1}/G2_BZ_sim.txt -W${thick},${colmod},$type
rmsZ=$(gmt math data/GalileoData/G2_BZ.txt data/${1}/G2_BZ_sim.txt NEG ADD RMS -S 10 MUL RINT 10 DIV -o1 =)
gmt text <<EOF
1996-09-06T19:00:00 230 rmse = ${rmsZ} nT
EOF

gmt subplot set 0,2
dates=2000-05-20T10:08:05.225/2000-05-20T10:12:18.89
gmt plot data/GalileoData/G28_BX.txt -JX? -R${dates}/${xlims} -Bya${xstep} -By+l"Bx [nT]" -Bpxa2M -Bx+l"May 20, 2000" -W${thick},${coldat} #-B+t"G28"
gmt plot data/${1}/G28_BX_sim.txt -W${thick},${colmod},$type
rmsX=$(gmt math data/GalileoData/G28_BX.txt data/${1}/G28_BX_sim.txt NEG ADD RMS -S 10 MUL RINT 10 DIV -o1 =)
gmt text <<EOF
2000-05-20T10:09:20 -60 rmse = ${rmsX} nT
EOF
gmt text -R0/1/0/1 -N --FONT=${trfont} <<EOF
0.5 ${trloc} G28
EOF


gmt subplot set 1,2
gmt plot data/GalileoData/G28_BY.txt -JX? -R${dates}/${ylims} -Bya${ystep} -By+l"By [nT]" -Bpxa2M -Bx+l"May 20, 2000" -W${thick},${coldat}
gmt plot data/${1}/G28_BY_sim.txt -W${thick},${colmod},$type
rmsY=$(gmt math data/GalileoData/G28_BY.txt data/${1}/G28_BY_sim.txt NEG ADD RMS -S 10 MUL RINT 10 DIV -o1 =)
gmt text <<EOF
2000-05-20T10:09:20 430 rmse = ${rmsY} nT
EOF

gmt subplot set 2,2
gmt plot data/GalileoData/G28_BZ.txt -JX? -R${dates}/${zlims} -Bya${zstep} -By+l"Bz [nT]" -Bpxa2M -Bx+l"May 20, 2000" -W${thick},${coldat}
gmt plot data/${1}/G28_BZ_sim.txt -W${thick},${colmod},$type
rmsZ=$(gmt math data/GalileoData/G28_BZ.txt data/${1}/G28_BZ_sim.txt NEG ADD RMS -S 10 MUL RINT 10 DIV -o1 =)
gmt text <<EOF
2000-05-20T10:09:20 -900 rmse = ${rmsZ} nT
EOF


gmt subplot set 0,3
dates=2021-06-07T16:53:40/2021-06-07T16:58:00
gmt plot data/JunoData/J1_BX.txt -JX? -R${dates}/${xlims} -Bya${xstep} -By+l"Bx [nT]" -Bpxa5M -Bx+l"June 07, 2021" -W${thick},${coldat} #-B+t"J"
gmt plot data/${1}/G101_BX_sim.txt -W${thick},${colmod},$type
rmsX=$(gmt math data/JunoData/J1_BX.txt data/${1}/G101_BX_sim.txt NEG ADD RMS -S 10 MUL RINT 10 DIV -o1 =)
gmt text <<EOF
2021-06-07T16:54:55 -60 rmse = ${rmsX} nT
EOF
gmt text -R0/1/0/1 -N --FONT=${trfont} <<EOF
0.5 ${trloc} J
EOF


gmt subplot set 1,3
gmt plot data/JunoData/J1_BY.txt -JX? -R${dates}/${ylims} -Bya${ystep} -By+l"By [nT]" -Bpxa5M -Bx+l"June 07, 2021" -W${thick},${coldat}
gmt plot data/${1}/G101_BY_sim.txt -W${thick},${colmod},$type
rmsY=$(gmt math data/JunoData/J1_BY.txt data/${1}/G101_BY_sim.txt NEG ADD RMS -S 10 MUL RINT 10 DIV -o1 =)
gmt text <<EOF
2021-06-07T16:54:55 430 rmse = ${rmsY} nT
EOF


gmt subplot set 2,3
#gmt basemap  -JX?  -R${dates}/${zlims}  -BpxcJtimelabels.txt
gmt plot data/JunoData/J1_BZ.txt -Bya${zstep} -By+l"Bz [nT]"  -JX?  -R${dates}/${zlims}  -BpxcJtimelabels.txt -Bx+l"June 07, 2021" -W${thick},${coldat}
gmt plot data/${1}/G101_BZ_sim.txt -W${thick},${colmod},$type
rmsZ=$(gmt math data/JunoData/J1_BZ.txt data/${1}/G101_BZ_sim.txt NEG ADD RMS -S 10 MUL RINT 10 DIV -o1 =)
gmt text <<EOF
2021-06-07T16:54:55 -900 rmse = ${rmsZ} nT
EOF


gmt subplot end

gmt end show
