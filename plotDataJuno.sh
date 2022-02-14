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
col=blue
type='--'

xlims=-500/0
ylims=-500/550
zlims=-1100/400

xstep=100
ystep=200
zstep=300


gmt subplot begin 3x4 -Fs5c/3c -Scb -Srl

gmt subplot set 0,0
dates=1996-06-27T06:24:56.226/1996-06-27T06:35:57.926
gmt plot data/GalileoData/G1_BX.txt -JX? -R${dates}/${xlims} -Bya${xstep} -By+l"Bx [nT]" -Bpxa5M -Bx+l"June 27, 1996" -W${thick} -B+t"G1"
gmt plot data/${1}/G1_BX_sim.txt -W${thick},${col},$type

gmt subplot set 1,0
gmt plot data/GalileoData/G1_BY.txt -JX? -R${dates}/${ylims} -Bya${ystep} -By+l"By [nT]" -Bpxa5M -Bx+l"June 27, 1996" -W${thick}
gmt plot data/${1}/G1_BY_sim.txt -W${thick},${col},$type

gmt subplot set 2,0
gmt plot data/GalileoData/G1_BZ.txt -JX? -R${dates}/${zlims} -Bya${zstep} -By+l"Bz [nT]" -Bpxa5M -Bx+l"June 27, 1996" -W${thick}
gmt plot data/${1}/G1_BZ_sim.txt -W${thick},${col},$type




gmt subplot set 0,1
dates=1996-09-06T18:57:38.120/1996-09-06T19:05:26.786
gmt plot data/GalileoData/G2_BX.txt -JX? -R${dates}/${xlims} -Bya${xstep} -By+l"Bx [nT]" -Bpxa5M -Bx+l"Sept 06, 1996" -W${thick} -B+t"G2"
gmt plot data/${1}/G2_BX_sim.txt -W${thick},${col},$type

gmt subplot set 1,1
gmt plot data/GalileoData/G2_BY.txt -JX? -R${dates}/${ylims} -Bya${ystep} -By+l"By [nT]" -Bpxa5M -Bx+l"Sept 06, 1996" -W${thick}
gmt plot data/${1}/G2_BY_sim.txt -W${thick},${col},$type

gmt subplot set 2,1
gmt plot data/GalileoData/G2_BZ.txt -JX? -R${dates}/${zlims} -Bya${zstep} -By+l"Bz [nT]" -Bpxa5M -Bx+l"Sept 06, 1996" -W${thick}
gmt plot data/${1}/G2_BZ_sim.txt -W${thick},${col},$type


gmt subplot set 0,2
dates=2000-05-20T10:08:05.225/2000-05-20T10:12:18.89
gmt plot data/GalileoData/G28_BX.txt -JX? -R${dates}/${xlims} -Bya${xstep} -By+l"Bx [nT]" -Bpxa5M -Bx+l"May 20, 2000" -W${thick} -B+t"G28"
gmt plot data/${1}/G28_BX_sim.txt -W${thick},${col},$type

gmt subplot set 1,2
gmt plot data/GalileoData/G28_BY.txt -JX? -R${dates}/${ylims} -Bya${ystep} -By+l"By [nT]" -Bpxa5M -Bx+l"May 20, 2000" -W${thick}
gmt plot data/${1}/G28_BY_sim.txt -W${thick},${col},$type

gmt subplot set 2,2
gmt plot data/GalileoData/G28_BZ.txt -JX? -R${dates}/${zlims} -Bya${zstep} -By+l"Bz [nT]" -Bpxa5M -Bx+l"May 20, 2000" -W${thick}
gmt plot data/${1}/G28_BZ_sim.txt -W${thick},${col},$type


gmt subplot set 0,3
dates=2021-06-07T16:53:40/2021-06-07T16:58:00
gmt plot data/JunoData/J1_BX.txt -JX? -R${dates}/${xlims} -Bya${xstep} -By+l"Bx [nT]" -Bpxa5M -Bx+l"June 07, 2021" -W${thick} -B+t"J"
gmt plot data/${1}/G101_BX_sim.txt -W${thick},${col},$type

gmt subplot set 1,3
gmt plot data/JunoData/J1_BY.txt -JX? -R${dates}/${ylims} -Bya${ystep} -By+l"By [nT]" -Bpxa5M -Bx+l"June 07, 2021" -W${thick}
gmt plot data/${1}/G101_BY_sim.txt -W${thick},${col},$type

gmt subplot set 2,3
gmt plot data/JunoData/J1_BZ.txt -JX? -R${dates}/${zlims} -Bya${zstep} -By+l"Bz [nT]" -Bpxa5M -Bx+l"June 07, 2021" -W${thick}
gmt plot data/${1}/G101_BZ_sim.txt -W${thick},${col},$type



gmt subplot end

gmt end show
