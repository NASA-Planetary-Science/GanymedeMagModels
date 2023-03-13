# This script plots the extended data figure in the paper
#
# First, run showMoreData.m in Matlab / Octave to prepare the data

gmt begin figures/extendedData pdf

gmt set FORMAT_DATE_IN yyyy-mm-dd
#gmt set FORMAT_CLOCK_MAP hh:mmam
gmt set FORMAT_CLOCK_MAP hh:mm
gmt set FORMAT_DATE_MAP yyyy-mm-dd
gmt set FONT_LABEL 12p
gmt set FONT_ANNOT 12p

abot=0
atop=5000

titleshift=1.25

thick=0.5p
#col=blue
#type='--'
dats=1.08

col=0.8p,150/150/150,-
#coltrans=0.5p,150/150/150,.
cut=1p,50/50/50,.
shadecol=220

labpos=-0.25

gmt subplot begin 7x4 -Fs5c/3c -Cw-0.4c
# 6x3


#### G1

tstep=20M
date1=1996-06-27T06:07:08.894
date2=1996-06-27T06:52:37.259
cut1=1996-06-27T06:24:56
cut2=1996-06-27T06:35:58

trans1=1996-06-27T06:17:57
#trans1=1996-06-27T06:19:30


gmt subplot set 0,0
Blim=200
gmt basemap -JX? -R${date1}/${date2}/-${Blim}/${Blim} -Bnswe
gmt plot -G${shadecol} <<EOF
${date1} ${Blim}
${date1} -${Blim}
${cut1} -${Blim}
${cut1} ${Blim}
${date1} ${Blim}
EOF
gmt plot -G${shadecol} <<EOF
${cut2} ${Blim}
${cut2} -${Blim}
${date2} -${Blim}
${date2} ${Blim}
${cut2} ${Blim}
EOF
gmt plot data/extendedData/G1_BX.txt  -Bpxa${tstep}  -W${thick} #-B+t"@%2%B@%%@-X@-"
# Jupiter bg field
gmt plot -W${col} <<EOF
$date1 -79
$date2 -79
EOF
# Transitions
gmt plot -W${cut} <<EOF
$trans1 $Blim
$trans1 -$Blim
EOF

gmt text -JX? -R0/1/0/1 -N --FONT=20 <<EOF
0.5 ${titleshift} @%2%B@%%@-x@- [nT]
EOF
gmt text -JX? -R0/1/0/1 <<EOF
0.1 0.9 ${Blim}
0.1 0.1 -${Blim}
EOF
gmt text -JX? -R0/1/-${Blim}/${Blim} -N <<EOF
-0.07 0 0
EOF
gmt text -JX? -R0/1/-${Blim}/${Blim} -N --FONT=20 <<EOF
${labpos} 0 G1
EOF



gmt subplot set 0,1
Blim=500
gmt basemap -JX? -R${date1}/${date2}/-${Blim}/${Blim} -Bnswe
gmt plot -G${shadecol} <<EOF
${date1} ${Blim}
${date1} -${Blim}
${cut1} -${Blim}
${cut1} ${Blim}
${date1} ${Blim}
EOF
gmt plot -G${shadecol} <<EOF
${cut2} ${Blim}
${cut2} -${Blim}
${date2} -${Blim}
${date2} ${Blim}
${cut2} ${Blim}
EOF
gmt plot data/extendedData/G1_BY.txt  -Bpxa${tstep}  -W${thick} #-B+t"@%2%B@%%@-Y@-"
# Jupiter bg field
gmt plot -W${col} <<EOF
$date1 -6
$date2 -6
EOF
# Transitions
gmt plot -W${cut} <<EOF
$trans1 $Blim
$trans1 -$Blim
EOF

gmt text -JX? -R0/1/0/1 -N --FONT=20 <<EOF
0.5 ${titleshift} @%2%B@%%@-y@- [nT]
EOF
gmt text -JX? -R0/1/0/1 -N <<EOF
0.1 0.9 ${Blim}
0.1 0.1 -${Blim}
EOF


gmt subplot set 0,2
Blim=150
gmt basemap -JX? -R${date1}/${date2}/-${Blim}/${Blim} -Bnswe
gmt plot -G${shadecol} <<EOF
${date1} ${Blim}
${date1} -${Blim}
${cut1} -${Blim}
${cut1} ${Blim}
${date1} ${Blim}
EOF
gmt plot -G${shadecol} <<EOF
${cut2} ${Blim}
${cut2} -${Blim}
${date2} -${Blim}
${date2} ${Blim}
${cut2} ${Blim}
EOF
gmt plot data/extendedData/G1_BZ.txt   -Bpxa${tstep}  -W${thick} 
# Jupiter bg field
gmt plot -W${col} <<EOF
$date1 -79
$date2 -79
EOF
# Transitions
gmt plot -W${cut} <<EOF
$trans1 $Blim
$trans1 -$Blim
EOF

gmt text -JX? -R0/1/0/1 -N --FONT=20 <<EOF
0.5 ${titleshift} @%2%B@%%@-z@- [nT]
EOF
gmt text -JX? -R0/1/0/1 -N <<EOF
0.1 0.9 ${Blim}
0.1 0.1 -${Blim}
EOF



gmt subplot set 0,3
#atop=3000
#abot=500
gmt basemap -JX? -R${date1}/${date2}/${abot}/${atop} -Bnswe
gmt plot -G${shadecol} <<EOF
${date1} ${atop}
${date1} ${abot}
${cut1} ${abot}
${cut1} ${atop}
${date1} ${atop}
EOF
gmt plot -G${shadecol} <<EOF
${cut2} ${atop}
${cut2} ${abot}
${date2} ${abot}
${date2} ${atop}
${cut2} ${atop}
EOF
gmt plot data/extendedData/G1_alt.txt   -Bpxa${tstep}  -W${thick}
gmt text -JX? -R0/1/0/1 -N --FONT=20 <<EOF
0.5 ${titleshift} altitude [km]
EOF
gmt text -JX? -R0/1/0/1 -N <<EOF
0.1 0.9 ${atop}
0.075 0.167 834
EOF
gmt text -JX? -R0/1/-${Blim}/${Blim} -N -F+a90 <<EOF
${dats} 0  1996 Jun 27
EOF




#### G2

tstep=25M
date1=1996-09-06T18:32:00
date2=1996-09-06T19:28:00
cut1=1996-09-06T18:57:38
cut2=1996-09-06T19:05:27

trans1=1996-09-06T18:50:02
trans2=1996-09-06T19:22:26

gmt subplot set 1,0
Blim=550
gmt basemap -JX? -R${date1}/${date2}/-${Blim}/${Blim} -Bnswe
gmt plot -G${shadecol} <<EOF
${date1} ${Blim}
${date1} -${Blim}
${cut1} -${Blim}
${cut1} ${Blim}
${date1} ${Blim}
EOF
gmt plot -G${shadecol} <<EOF
${cut2} ${Blim}
${cut2} -${Blim}
${date2} -${Blim}
${date2} ${Blim}
${cut2} ${Blim}
EOF
gmt plot data/extendedData/G2_BX.txt -Bpxa${tstep}  -W${thick}
# Jupiter bg field
gmt plot -W${col} <<EOF
$date1 -73
$date2 -73
EOF
# Transitions
gmt plot -W${cut} <<EOF
$trans1 $Blim
$trans1 -$Blim
EOF
gmt plot -W${cut} <<EOF
$trans2 $Blim
$trans2 -$Blim
EOF
gmt text -JX? -R0/1/0/1 <<EOF
0.1 0.9 ${Blim}
0.1 0.1 -${Blim}
EOF
gmt text -JX? -R0/1/-${Blim}/${Blim} -N <<EOF
-0.07 0 0
EOF
gmt text -JX? -R0/1/-${Blim}/${Blim} -N --FONT=20 <<EOF
${labpos} 0 G2
EOF

gmt subplot set 1,1
Blim=380
gmt basemap -JX? -R${date1}/${date2}/-${Blim}/${Blim} -Bnswe
gmt plot -G${shadecol} <<EOF
${date1} ${Blim}
${date1} -${Blim}
${cut1} -${Blim}
${cut1} ${Blim}
${date1} ${Blim}
EOF
gmt plot -G${shadecol} <<EOF
${cut2} ${Blim}
${cut2} -${Blim}
${date2} -${Blim}
${date2} ${Blim}
${cut2} ${Blim}
EOF
gmt plot data/extendedData/G2_BY.txt  -Bpxa${tstep}  -W${thick}
# Jupiter bg field
gmt plot -W${col} <<EOF
$date1 -17
$date2 -17
EOF
# Transitions
gmt plot -W${cut} <<EOF
$trans1 $Blim
$trans1 -$Blim
EOF
gmt plot -W${cut} <<EOF
$trans2 $Blim
$trans2 -$Blim
EOF
gmt text -JX? -R0/1/0/1 <<EOF
0.1 0.9 ${Blim}
0.1 0.1 -${Blim}
EOF

gmt subplot set 1,2
Blim=1200
gmt basemap -JX? -R${date1}/${date2}/-${Blim}/${Blim} -Bnswe
gmt plot -G${shadecol} <<EOF
${date1} ${Blim}
${date1} -${Blim}
${cut1} -${Blim}
${cut1} ${Blim}
${date1} ${Blim}
EOF
gmt plot -G${shadecol} <<EOF
${cut2} ${Blim}
${cut2} -${Blim}
${date2} -${Blim}
${date2} ${Blim}
${cut2} ${Blim}
EOF
gmt plot data/extendedData/G2_BZ.txt -Bpxa${tstep}  -W${thick}
# Jupiter bg field
gmt plot -W${col} <<EOF
$date1 -85
$date2 -85
EOF
# Transitions
gmt plot -W${cut} <<EOF
$trans1 $Blim
$trans1 -$Blim
EOF
gmt plot -W${cut} <<EOF
$trans2 $Blim
$trans2 -$Blim
EOF
gmt text -JX? -R0/1/0/1 <<EOF
0.1 0.9 ${Blim}
0.1 0.1 -${Blim}
EOF



gmt subplot set 1,3
#atop=3000
#abot=500
gmt basemap -JX? -R${date1}/${date2}/${abot}/${atop} -Bnswe
gmt plot -G${shadecol} <<EOF
${date1} ${atop}
${date1} ${abot}
${cut1} ${abot}
${cut1} ${atop}
${date1} ${atop}
EOF
gmt plot -G${shadecol} <<EOF
${cut2} ${atop}
${cut2} ${abot}
${date2} ${abot}
${date2} ${atop}
${cut2} ${atop}
EOF
gmt plot data/extendedData/G2_alt.txt   -Bpxa${tstep}  -W${thick}
gmt text -JX? -R0/1/0/1 -N <<EOF
0.1 0.9 ${atop}
0.075 0.075 261
EOF
gmt text -JX? -R0/1/-${Blim}/${Blim} -N -F+a90 <<EOF
${dats} 0  1996 Sep 6
EOF




#### G7

tstep=25M
date1=1997-04-05T06:44:41.073
date2=1997-04-05T07:40:18.737
cut1=1997-04-05T07:07:53
cut2=1997-04-05T07:17:52
trans1=1997-04-05T07:00:07
trans2=1997-04-05T07:36:35

gmt subplot set 2,0
Blim=150
gmt basemap -JX? -R${date1}/${date2}/-${Blim}/${Blim} -Bnswe
gmt plot -G${shadecol} <<EOF
${date1} ${Blim}
${date1} -${Blim}
${cut1} -${Blim}
${cut1} ${Blim}
${date1} ${Blim}
EOF
gmt plot -G${shadecol} <<EOF
${cut2} ${Blim}
${cut2} -${Blim}
${date2} -${Blim}
${date2} ${Blim}
${cut2} ${Blim}
EOF
gmt plot data/extendedData/G7_BX.txt -Bpxa${tstep}  -W${thick}
# Jupiter bg field
gmt plot -W${col} <<EOF
$date1 74
$date2 74
EOF
# Transitions
gmt plot -W${cut} <<EOF
$trans1 $Blim
$trans1 -$Blim
EOF
gmt plot -W${cut} <<EOF
$trans2 $Blim
$trans2 -$Blim
EOF
gmt text -JX? -R0/1/0/1 <<EOF
0.1 0.9 ${Blim}
0.1 0.1 -${Blim}
EOF
gmt text -JX? -R0/1/-${Blim}/${Blim} -N <<EOF
-0.07 0 0
EOF
gmt text -JX? -R0/1/-${Blim}/${Blim} -N --FONT=20 <<EOF
${labpos} 0 G7
EOF

gmt subplot set 2,1
Blim=180
gmt basemap -JX? -R${date1}/${date2}/-${Blim}/${Blim} -Bnswe
gmt plot -G${shadecol} <<EOF
${date1} ${Blim}
${date1} -${Blim}
${cut1} -${Blim}
${cut1} ${Blim}
${date1} ${Blim}
EOF
gmt plot -G${shadecol} <<EOF
${cut2} ${Blim}
${cut2} -${Blim}
${date2} -${Blim}
${date2} ${Blim}
${cut2} ${Blim}
EOF
gmt plot data/extendedData/G7_BY.txt  -Bpxa${tstep}  -W${thick}
# Jupiter bg field
gmt plot -W${col} <<EOF
$date1 3
$date2 3
EOF
# Transitions
gmt plot -W${cut} <<EOF
$trans1 $Blim
$trans1 -$Blim
EOF
gmt plot -W${cut} <<EOF
$trans2 $Blim
$trans2 -$Blim
EOF
gmt text -JX? -R0/1/0/1 <<EOF
0.1 0.9 ${Blim}
0.1 0.1 -${Blim}
EOF

gmt subplot set 2,2
Blim=180
gmt basemap -JX? -R${date1}/${date2}/-${Blim}/${Blim} -Bnswe
gmt plot -G${shadecol} <<EOF
${date1} ${Blim}
${date1} -${Blim}
${cut1} -${Blim}
${cut1} ${Blim}
${date1} ${Blim}
EOF
gmt plot -G${shadecol} <<EOF
${cut2} ${Blim}
${cut2} -${Blim}
${date2} -${Blim}
${date2} ${Blim}
${cut2} ${Blim}
EOF
gmt plot data/extendedData/G7_BZ.txt -Bpxa${tstep}  -W${thick}
# Jupiter bg field
gmt plot -W${col} <<EOF
$date1 -76
$date2 -76
EOF
# Transitions
gmt plot -W${cut} <<EOF
$trans1 $Blim
$trans1 -$Blim
EOF
gmt plot -W${cut} <<EOF
$trans2 $Blim
$trans2 -$Blim
EOF
gmt text -JX? -R0/1/0/1 <<EOF
0.1 0.9 ${Blim}
0.1 0.1 -${Blim}
EOF




gmt subplot set 2,3
#atop=3000
#abot=500
gmt basemap -JX? -R${date1}/${date2}/${abot}/${atop} -Bnswe
gmt plot -G${shadecol} <<EOF
${date1} ${atop}
${date1} ${abot}
${cut1} ${abot}
${cut1} ${atop}
${date1} ${atop}
EOF
gmt plot -G${shadecol} <<EOF
${cut2} ${atop}
${cut2} ${abot}
${date2} ${abot}
${date2} ${atop}
${cut2} ${atop}
EOF
gmt plot data/extendedData/G7_alt.txt   -Bpxa${tstep}  -W${thick}

gmt text -JX? -R0/1/0/1 -N <<EOF
0.1 0.9 ${atop}
0.1 0.62 3099
EOF
gmt text -JX? -R0/1/-${Blim}/${Blim} -N -F+a90 <<EOF
${dats} 0  1997 Apr 5
EOF






#### G8

tstep=25M
date1=1997-05-07T15:36:55.133
date2=1997-05-07T16:22:23.465
cut1=1997-05-07T15:53:42
cut2=1997-05-07T15:57:51
trans1=1997-05-07T15:51:53
trans2=1997-05-07T16:01:56

gmt subplot set 3,0
Blim=150
gmt basemap -JX? -R${date1}/${date2}/-${Blim}/${Blim} -Bnswe
gmt plot -G${shadecol} <<EOF
${date1} ${Blim}
${date1} -${Blim}
${cut1} -${Blim}
${cut1} ${Blim}
${date1} ${Blim}
EOF
gmt plot -G${shadecol} <<EOF
${cut2} ${Blim}
${cut2} -${Blim}
${date2} -${Blim}
${date2} ${Blim}
${cut2} ${Blim}
EOF
gmt plot data/extendedData/G8_BX.txt -Bpxa${tstep}  -W${thick}
# Jupiter bg field
gmt plot -W${col} <<EOF
$date1 11
$date2 11
EOF
# Transitions
gmt plot -W${cut} <<EOF
$trans1 $Blim
$trans1 -$Blim
EOF
gmt plot -W${cut} <<EOF
$trans2 $Blim
$trans2 -$Blim
EOF
gmt text -JX? -R0/1/0/1 <<EOF
0.1 0.9 ${Blim}
0.1 0.1 -${Blim}
EOF
gmt text -JX? -R0/1/-${Blim}/${Blim} -N <<EOF
-0.07 0 0
EOF
gmt text -JX? -R0/1/-${Blim}/${Blim} -N --FONT=20 <<EOF
${labpos} 0 G8
EOF

gmt subplot set 3,1
Blim=200
gmt basemap -JX? -R${date1}/${date2}/-${Blim}/${Blim} -Bnswe
gmt plot -G${shadecol} <<EOF
${date1} ${Blim}
${date1} -${Blim}
${cut1} -${Blim}
${cut1} ${Blim}
${date1} ${Blim}
EOF
gmt plot -G${shadecol} <<EOF
${cut2} ${Blim}
${cut2} -${Blim}
${date2} -${Blim}
${date2} ${Blim}
${cut2} ${Blim}
EOF
gmt plot data/extendedData/G8_BY.txt  -Bpxa${tstep}  -W${thick}
# Jupiter bg field
gmt plot -W${col} <<EOF
$date1 11
$date2 11
EOF
# Transitions
gmt plot -W${cut} <<EOF
$trans1 $Blim
$trans1 -$Blim
EOF
gmt plot -W${cut} <<EOF
$trans2 $Blim
$trans2 -$Blim
EOF
gmt text -JX? -R0/1/0/1 <<EOF
0.1 0.9 ${Blim}
0.1 0.1 -${Blim}
EOF

gmt subplot set 3,2
Blim=150
gmt basemap -JX? -R${date1}/${date2}/-${Blim}/${Blim} -Bnswe
gmt plot -G${shadecol} <<EOF
${date1} ${Blim}
${date1} -${Blim}
${cut1} -${Blim}
${cut1} ${Blim}
${date1} ${Blim}
EOF
gmt plot -G${shadecol} <<EOF
${cut2} ${Blim}
${cut2} -${Blim}
${date2} -${Blim}
${date2} ${Blim}
${cut2} ${Blim}
EOF
gmt plot data/extendedData/G8_BZ.txt -Bpxa${tstep}  -W${thick}
# Jupiter bg field
gmt plot -W${col} <<EOF
$date1 -77
$date2 -77
EOF
# Transitions
gmt plot -W${cut} <<EOF
$trans1 $Blim
$trans1 -$Blim
EOF
gmt plot -W${cut} <<EOF
$trans2 $Blim
$trans2 -$Blim
EOF
gmt text -JX? -R0/1/0/1 <<EOF
0.1 0.9 ${Blim}
0.1 0.1 -${Blim}
EOF




gmt subplot set 3,3
#atop=3000
#abot=500
gmt basemap -JX? -R${date1}/${date2}/${abot}/${atop} -Bnswe
gmt plot -G${shadecol} <<EOF
${date1} ${atop}
${date1} ${abot}
${cut1} ${abot}
${cut1} ${atop}
${date1} ${atop}
EOF
gmt plot -G${shadecol} <<EOF
${cut2} ${atop}
${cut2} ${abot}
${date2} ${abot}
${date2} ${atop}
${cut2} ${atop}
EOF
gmt plot data/extendedData/G8_alt.txt   -Bpxa${tstep}  -W${thick}
gmt text -JX? -R0/1/0/1 -N <<EOF
0.1 0.9 ${atop}
0.1 0.32 1602
EOF
gmt text -JX? -R0/1/-${Blim}/${Blim} -N -F+a90 <<EOF
${dats} 0  1997 May 7
EOF





#### G28

tstep=25M
date1=2000-05-20T09:43:05.226
date2=2000-05-20T10:36:41.22
cut1=2000-05-20T10:08:05
cut2=2000-05-20T10:12:19
trans1=2000-05-20T10:04:44
trans2=2000-05-20T10:18:39

gmt subplot set 4,0
Blim=200
gmt basemap -JX? -R${date1}/${date2}/-${Blim}/${Blim} -Bnswe
gmt plot -G${shadecol} <<EOF
${date1} ${Blim}
${date1} -${Blim}
${cut1} -${Blim}
${cut1} ${Blim}
${date1} ${Blim}
EOF
gmt plot -G${shadecol} <<EOF
${cut2} ${Blim}
${cut2} -${Blim}
${date2} -${Blim}
${date2} ${Blim}
${cut2} ${Blim}
EOF
gmt plot data/extendedData/G28_BX.txt -Bpxa${tstep}  -W${thick}
# Jupiter bg field
gmt plot -W${col} <<EOF
$date1 78
$date2 78
EOF
# Transitions
gmt plot -W${cut} <<EOF
$trans1 $Blim
$trans1 -$Blim
EOF
gmt plot -W${cut} <<EOF
$trans2 $Blim
$trans2 -$Blim
EOF
gmt text -JX? -R0/1/0/1 <<EOF
0.1 0.9 ${Blim}
0.1 0.1 -${Blim}
EOF
gmt text -JX? -R0/1/-${Blim}/${Blim} -N <<EOF
-0.07 0 0
EOF
gmt text -JX? -R0/1/-${Blim}/${Blim} -N --FONT=20 <<EOF
${labpos} 0 G28
EOF

gmt subplot set 4,1
Blim=300
gmt basemap -JX? -R${date1}/${date2}/-${Blim}/${Blim} -Bnswe
gmt plot -G${shadecol} <<EOF
${date1} ${Blim}
${date1} -${Blim}
${cut1} -${Blim}
${cut1} ${Blim}
${date1} ${Blim}
EOF
gmt plot -G${shadecol} <<EOF
${cut2} ${Blim}
${cut2} -${Blim}
${date2} -${Blim}
${date2} ${Blim}
${cut2} ${Blim}
EOF
gmt plot data/extendedData/G28_BY.txt  -Bpxa${tstep}  -W${thick}
# Jupiter bg field
gmt plot -W${col} <<EOF
$date1 -7
$date2 -7
EOF
# Transitions
gmt plot -W${cut} <<EOF
$trans1 $Blim
$trans1 -$Blim
EOF
gmt plot -W${cut} <<EOF
$trans2 $Blim
$trans2 -$Blim
EOF
gmt text -JX? -R0/1/0/1 <<EOF
0.1 0.9 ${Blim}
0.1 0.1 -${Blim}
EOF

gmt subplot set 4,2
Blim=250
gmt basemap -JX? -R${date1}/${date2}/-${Blim}/${Blim} -Bnswe
gmt plot -G${shadecol} <<EOF
${date1} ${Blim}
${date1} -${Blim}
${cut1} -${Blim}
${cut1} ${Blim}
${date1} ${Blim}
EOF
gmt plot -G${shadecol} <<EOF
${cut2} ${Blim}
${cut2} -${Blim}
${date2} -${Blim}
${date2} ${Blim}
${cut2} ${Blim}
EOF
gmt plot data/extendedData/G28_BZ.txt -Bpxa${tstep}  -W${thick}
# Jupiter bg field
gmt plot -W${col} <<EOF
$date1 -76
$date2 -76
EOF
# Transitions
gmt plot -W${cut} <<EOF
$trans1 $Blim
$trans1 -$Blim
EOF
gmt plot -W${cut} <<EOF
$trans2 $Blim
$trans2 -$Blim
EOF
gmt text -JX? -R0/1/0/1 <<EOF
0.1 0.9 ${Blim}
0.1 0.1 -${Blim}
EOF




gmt subplot set 4,3
#atop=3000
#abot=500
gmt basemap -JX? -R${date1}/${date2}/${abot}/${atop} -Bnswe
gmt plot -G${shadecol} <<EOF
${date1} ${atop}
${date1} ${abot}
${cut1} ${abot}
${cut1} ${atop}
${date1} ${atop}
EOF
gmt plot -G${shadecol} <<EOF
${cut2} ${atop}
${cut2} ${abot}
${date2} ${abot}
${date2} ${atop}
${cut2} ${atop}
EOF
gmt plot data/extendedData/G28_alt.txt   -Bpxa${tstep}  -W${thick}
gmt text -JX? -R0/1/0/1 -N <<EOF
0.1 0.9 ${atop}
0.075 0.16 808
EOF
gmt text -JX? -R0/1/-${Blim}/${Blim} -N -F+a90 <<EOF
${dats} 0  2000 May 20
EOF








#### G29

tstep=30M
date1=2000-12-28T07:54:49.130
date2=2000-12-28T08:55:20.794
cut1=2000-12-28T08:19:49
cut2=2000-12-28T08:34:19
trans1=2000-12-28T08:16:33
trans2=2000-12-28T08:43:36

gmt subplot set 5,0
Blim=200
gmt basemap -JX? -R${date1}/${date2}/-${Blim}/${Blim} -Bnswe
gmt plot -G${shadecol} <<EOF
${date1} ${Blim}
${date1} -${Blim}
${cut1} -${Blim}
${cut1} ${Blim}
${date1} ${Blim}
EOF
gmt plot -G${shadecol} <<EOF
${cut2} ${Blim}
${cut2} -${Blim}
${date2} -${Blim}
${date2} ${Blim}
${cut2} ${Blim}
EOF
gmt plot data/extendedData/G29_BX.txt -Bpxa${tstep}  -W${thick}
# Jupiter bg field
gmt plot -W${col} <<EOF
$date1 -83
$date2 -83
EOF
# Transitions
gmt plot -W${cut} <<EOF
$trans1 $Blim
$trans1 -$Blim
EOF
gmt plot -W${cut} <<EOF
$trans2 $Blim
$trans2 -$Blim
EOF
gmt text -JX? -R0/1/0/1 <<EOF
0.1 0.9 ${Blim}
0.1 0.1 -${Blim}
EOF
gmt text -JX? -R0/1/-${Blim}/${Blim} -N <<EOF
-0.07 0 0
EOF
gmt text -JX? -R0/1/-${Blim}/${Blim} -N --FONT=20 <<EOF
${labpos} 0 G29
EOF

gmt subplot set 5,1
Blim=200
gmt basemap -JX? -R${date1}/${date2}/-${Blim}/${Blim} -Bnswe
gmt plot -G${shadecol} <<EOF
${date1} ${Blim}
${date1} -${Blim}
${cut1} -${Blim}
${cut1} ${Blim}
${date1} ${Blim}
EOF
gmt plot -G${shadecol} <<EOF
${cut2} ${Blim}
${cut2} -${Blim}
${date2} -${Blim}
${date2} ${Blim}
${cut2} ${Blim}
EOF
gmt plot data/extendedData/G29_BY.txt  -Bpxa${tstep}  -W${thick}
# Jupiter bg field
gmt plot -W${col} <<EOF
$date1 9
$date2 9
EOF
# Transitions
gmt plot -W${cut} <<EOF
$trans1 $Blim
$trans1 -$Blim
EOF
gmt plot -W${cut} <<EOF
$trans2 $Blim
$trans2 -$Blim
EOF
gmt text -JX? -R0/1/0/1 <<EOF
0.1 0.9 ${Blim}
0.1 0.1 -${Blim}
EOF

gmt subplot set 5,2
Blim=250
gmt basemap -JX? -R${date1}/${date2}/-${Blim}/${Blim} -Bnswe
gmt plot -G${shadecol} <<EOF
${date1} ${Blim}
${date1} -${Blim}
${cut1} -${Blim}
${cut1} ${Blim}
${date1} ${Blim}
EOF
gmt plot -G${shadecol} <<EOF
${cut2} ${Blim}
${cut2} -${Blim}
${date2} -${Blim}
${date2} ${Blim}
${cut2} ${Blim}
EOF
gmt plot data/extendedData/G29_BZ.txt -Bpxa${tstep}  -W${thick}
# Jupiter bg field
gmt plot -W${col} <<EOF
$date1 -79
$date2 -79
EOF
# Transitions
gmt plot -W${cut} <<EOF
$trans1 $Blim
$trans1 -$Blim
EOF
gmt plot -W${cut} <<EOF
$trans2 $Blim
$trans2 -$Blim
EOF
gmt text -JX? -R0/1/0/1 <<EOF
0.1 0.9 ${Blim}
0.1 0.1 -${Blim}
EOF



gmt subplot set 5,3
#atop=3000
#abot=500
gmt basemap -JX? -R${date1}/${date2}/${abot}/${atop} -Bnswe
gmt plot -G${shadecol} <<EOF
${date1} ${atop}
${date1} ${abot}
${cut1} ${abot}
${cut1} ${atop}
${date1} ${atop}
EOF
gmt plot -G${shadecol} <<EOF
${cut2} ${atop}
${cut2} ${abot}
${date2} ${abot}
${date2} ${atop}
${cut2} ${atop}
EOF
gmt plot data/extendedData/G29_alt.txt   -Bpxa${tstep}  -W${thick}
gmt text -JX? -R0/1/0/1 -N <<EOF
0.1 0.9 ${atop}
0.1 0.47 2335
EOF
gmt text -JX? -R0/1/-${Blim}/${Blim} -N -F+a90 <<EOF
${dats} 0  2000 Dec 28
EOF






#### J34

tstep=20M
#date1=2021-06-07T16:28:40.507
#date2=2021-06-07T17:22:59.503
date1=2021-06-07T16:35:00
date2=2021-06-07T17:10:00
cut1=2021-06-07T16:53:40
cut2=2021-06-07T16:58:00
trans1=2021-06-07T16:44:56
trans2=2021-06-07T17:00:57

gmt subplot set 6,0
Blim=220
gmt basemap -JX? -R${date1}/${date2}/-${Blim}/${Blim} -Bnswe
gmt plot -G${shadecol} <<EOF
${date1} ${Blim}
${date1} -${Blim}
${cut1} -${Blim}
${cut1} ${Blim}
${date1} ${Blim}
EOF
gmt plot -G${shadecol} <<EOF
${cut2} ${Blim}
${cut2} -${Blim}
${date2} -${Blim}
${date2} ${Blim}
${cut2} ${Blim}
EOF
gmt plot data/extendedData/G101_BX.txt -Bpxa${tstep}  -W${thick}
# Jupiter bg field
gmt plot -W${col} <<EOF
$date1 19
$date2 19
EOF
# Transitions
gmt plot -W${cut} <<EOF
$trans1 $Blim
$trans1 -$Blim
EOF
gmt plot -W${cut} <<EOF
$trans2 $Blim
$trans2 -$Blim
EOF
gmt text -JX? -R0/1/0/1 <<EOF
0.1 0.9 ${Blim}
0.1 0.1 -${Blim}
EOF
gmt text -JX? -R0/1/-${Blim}/${Blim} -N <<EOF
-0.07 0 0
EOF
gmt text -JX? -R0/1/-${Blim}/${Blim} -N --FONT=20 <<EOF
${labpos} 0 J34
EOF

gmt subplot set 6,1
Blim=320
gmt basemap -JX? -R${date1}/${date2}/-${Blim}/${Blim} -Bnswe
gmt plot -G${shadecol} <<EOF
${date1} ${Blim}
${date1} -${Blim}
${cut1} -${Blim}
${cut1} ${Blim}
${date1} ${Blim}
EOF
gmt plot -G${shadecol} <<EOF
${cut2} ${Blim}
${cut2} -${Blim}
${date2} -${Blim}
${date2} ${Blim}
${cut2} ${Blim}
EOF
gmt plot data/extendedData/G101_BY.txt  -Bpxa${tstep}  -W${thick}
# Jupiter bg field
gmt plot -W${col} <<EOF
$date1 6
$date2 6
EOF
# Transitions
gmt plot -W${cut} <<EOF
$trans1 $Blim
$trans1 -$Blim
EOF
gmt plot -W${cut} <<EOF
$trans2 $Blim
$trans2 -$Blim
EOF
gmt text -JX? -R0/1/0/1 <<EOF
0.1 0.9 ${Blim}
0.1 0.1 -${Blim}
EOF

gmt subplot set 6,2
Blim=100
gmt basemap -JX? -R${date1}/${date2}/-${Blim}/${Blim} -Bnswe
gmt plot -G${shadecol} <<EOF
${date1} ${Blim}
${date1} -${Blim}
${cut1} -${Blim}
${cut1} ${Blim}
${date1} ${Blim}
EOF
gmt plot -G${shadecol} <<EOF
${cut2} ${Blim}
${cut2} -${Blim}
${date2} -${Blim}
${date2} ${Blim}
${cut2} ${Blim}
EOF
gmt plot data/extendedData/G101_BZ.txt -Bpxa${tstep}  -W${thick}
# Jupiter bg field
gmt plot -W${col} <<EOF
$date1 -74
$date2 -74
EOF
# Transitions
gmt plot -W${cut} <<EOF
$trans1 $Blim
$trans1 -$Blim
EOF
gmt plot -W${cut} <<EOF
$trans2 $Blim
$trans2 -$Blim
EOF
gmt text -JX? -R0/1/0/1 <<EOF
0.1 0.9 ${Blim}
0.1 0.1 -${Blim}
EOF



gmt subplot set 6,3
#atop=3000
gmt basemap -JX? -R${date1}/${date2}/${abot}/${atop} -Bnswe
gmt plot -G${shadecol} <<EOF
${date1} ${atop}
${date1} ${abot}
${cut1} ${abot}
${cut1} ${atop}
${date1} ${atop}
EOF
gmt plot -G${shadecol} <<EOF
${cut2} ${atop}
${cut2} ${abot}
${date2} ${abot}
${date2} ${atop}
${cut2} ${atop}
EOF
gmt plot data/extendedData/G101_alt.txt   -Bpxa${tstep}  -W${thick}
gmt text -JX? -R0/1/0/1 -N <<EOF
0.1 0.9 ${atop}
0.1 0.21 1038
EOF
gmt text -JX? -R0/1/-${Blim}/${Blim} -N -F+a90 <<EOF
${dats} 0  2021 Jun 7
EOF




gmt subplot end

gmt end show
