# INPUT
# 1 foldername
#
# example
# ./plotData.sh KivPaperL2

gmt begin figures/${1}_talk pdf


# To make it with black background
gmt set PS_PAGE_COLOR black
gmt set MAP_FRAME_PEN white
gmt set FONT white
gmt set MAP_DEFAULT_PEN +white

#gmt set FORMAT_DATE_MAP "o dd" FORMAT_CLOCK_MAP hh:mm
gmt set FORMAT_DATE_IN yyyy-mm-dd
gmt set FORMAT_CLOCK_MAP hh:mmam
gmt set FORMAT_DATE_MAP yyyy-mm-dd
gmt set FONT_LABEL 12p
gmt set FONT_ANNOT 12p

thick=1p
thick2=1.5p
col=green
type='--'

xlims=-500/0
ylims=-500/550
zlims=-1100/400

xstep=100
ystep=200
zstep=300




gmt subplot begin 3x3 -Fs5c/3c -Scb -Srl


dates=1996-06-27T06:24:56.226/1996-06-27T06:35:57.926
tstep=5

gmt subplot set 0,0
gmt plot data/GalileoData/G1_BX.txt -JX? -R${dates}/${xlims} -Bya${xstep} -By+l"Bx [nT]" -Bpxa${tstep}M -Bx+l"June 27, 1996" -W${thick} -B+t"G1"
gmt plot data/${1}/G1_BX_sim.txt -W${thick2},${col},$type
rmsX=$(gmt math data/GalileoData/G1_BX.txt data/${1}/G1_BX_sim.txt NEG ADD RMS -S 10 MUL RINT 10 DIV -o1 =)
gmt text -R0/1/0/1 <<EOF
0.28 0.87 rms = ${rmsX} nT
EOF

gmt subplot set 1,0
gmt plot data/GalileoData/G1_BY.txt -JX? -R${dates}/${ylims} -Bya${ystep} -By+l"By [nT]" -Bpxa${tstep}M -Bx+l"June 27, 1996" -W${thick}
gmt plot data/${1}/G1_BY_sim.txt -W${thick2},${col},$type
rmsY=$(gmt math data/GalileoData/G1_BY.txt data/${1}/G1_BY_sim.txt NEG ADD RMS -S 10 MUL RINT 10 DIV -o1 =)
gmt text -R0/1/0/1 <<EOF
0.28 0.87 rms = ${rmsY} nT
EOF

gmt subplot set 2,0
gmt plot data/GalileoData/G1_BZ.txt -JX? -R${dates}/${zlims} -Bya${zstep} -By+l"Bz [nT]" -Bpxa${tstep}M -Bx+l"June 27, 1996" -W${thick}
gmt plot data/${1}/G1_BZ_sim.txt -W${thick2},${col},$type
rmsZ=$(gmt math data/GalileoData/G1_BZ.txt data/${1}/G1_BZ_sim.txt NEG ADD RMS -S 10 MUL RINT 10 DIV -o1 =)
gmt text -R0/1/0/1 <<EOF
0.28 0.12 rms = ${rmsZ} nT
EOF

echo "sqrt( (${rmsX}^2 + ${rmsY}^2 + ${rmsZ}^2) /3 )" | bc



dates=1996-09-06T18:57:38.120/1996-09-06T19:05:26.786
tstep=3

gmt subplot set 0,1
gmt plot data/GalileoData/G2_BX.txt -JX? -R${dates}/${xlims} -Bya${xstep} -By+l"Bx [nT]" -Bpxa${tstep}M -Bx+l"Sept 06, 1996" -W${thick} -B+t"G2"
gmt plot data/${1}/G2_BX_sim.txt -W${thick2},${col},$type
rmsX=$(gmt math data/GalileoData/G2_BX.txt data/${1}/G2_BX_sim.txt NEG ADD RMS -S 10 MUL RINT 10 DIV -o1 =)
gmt text <<EOF 
1996-09-06T18:59:50 -60 rms = ${rmsX} nT
EOF

gmt subplot set 1,1
gmt plot data/GalileoData/G2_BY.txt -JX? -R${dates}/${ylims} -Bya${ystep} -By+l"By [nT]" -Bpxa${tstep}M -Bx+l"Sept 06, 1996" -W${thick}
gmt plot data/${1}/G2_BY_sim.txt -W${thick2},${col},$type
rmsY=$(gmt math data/GalileoData/G2_BY.txt data/${1}/G2_BY_sim.txt NEG ADD RMS -S 10 MUL RINT 10 DIV -o1 =)
gmt text <<EOF
1996-09-06T19:03:10 430 rms = ${rmsY} nT
EOF


gmt subplot set 2,1
gmt plot data/GalileoData/G2_BZ.txt -JX? -R${dates}/${zlims} -Bya${zstep} -By+l"Bz [nT]" -Bpxa${tstep}M -Bx+l"Sept 06, 1996" -W${thick}
gmt plot data/${1}/G2_BZ_sim.txt -W${thick2},${col},$type
rmsZ=$(gmt math data/GalileoData/G2_BZ.txt data/${1}/G2_BZ_sim.txt NEG ADD RMS -S 10 MUL RINT 10 DIV -o1 =)
gmt text <<EOF
1996-09-06T19:00:00 230 rms = ${rmsZ} nT
EOF

echo "sqrt( (${rmsX}^2 + ${rmsY}^2 + ${rmsZ}^2) /3 )" | bc


dates=2000-05-20T10:08:05.225/2000-05-20T10:12:18.89
tstep=2

gmt subplot set 0,2
gmt plot data/GalileoData/G28_BX.txt -JX? -R${dates}/${xlims} -Bya${xstep} -By+l"Bx [nT]" -Bpxa${tstep}M -Bx+l"May 20, 2000" -W${thick} -B+t"G28"
gmt plot data/${1}/G28_BX_sim.txt -W${thick2},${col},$type
rmsX=$(gmt math data/GalileoData/G28_BX.txt data/${1}/G28_BX_sim.txt NEG ADD RMS -S 10 MUL RINT 10 DIV -o1 =)
gmt text <<EOF
2000-05-20T10:09:20 -60 rms = ${rmsX} nT
EOF

gmt subplot set 1,2
gmt plot data/GalileoData/G28_BY.txt -JX? -R${dates}/${ylims} -Bya${ystep} -By+l"By [nT]" -Bpxa${tstep}M -Bx+l"May 20, 2000" -W${thick}
gmt plot data/${1}/G28_BY_sim.txt -W${thick2},${col},$type
rmsY=$(gmt math data/GalileoData/G28_BY.txt data/${1}/G28_BY_sim.txt NEG ADD RMS -S 10 MUL RINT 10 DIV -o1 =)
gmt text <<EOF
2000-05-20T10:09:20 430 rms = ${rmsY} nT
EOF

gmt subplot set 2,2
gmt plot data/GalileoData/G28_BZ.txt -JX? -R${dates}/${zlims} -Bya${zstep} -By+l"Bz [nT]" -Bpxa${tstep}M -Bx+l"May 20, 2000" -W${thick}
gmt plot data/${1}/G28_BZ_sim.txt -W${thick2},${col},$type
rmsZ=$(gmt math data/GalileoData/G28_BZ.txt data/${1}/G28_BZ_sim.txt NEG ADD RMS -S 10 MUL RINT 10 DIV -o1 =)
gmt text <<EOF
2000-05-20T10:09:20 -900 rms = ${rmsZ} nT
EOF

echo "sqrt( (${rmsX}^2 + ${rmsY}^2 + ${rmsZ}^2) /3 )" | bc


gmt subplot end

gmt end show
