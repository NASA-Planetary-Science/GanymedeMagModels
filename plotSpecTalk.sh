# INPUT
# 1 filename
# 2 source radius

# e.g.
# ./plotSpec.sh KivOriginal 229
# ./plotSpec.sh L3_moreTracks_gio-700 1120
# ./plotSpec.sh L3_moreTracks_gio-900 1622


gmt begin figures/${1}_talk pdf

gmt set PS_PAGE_COLOR black
gmt set MAP_FRAME_PEN white
gmt set FONT 18,white
gmt set MAP_DEFAULT_PEN +white

gmt basemap -R0.8/3.2/1e3/3e6 -JX7c/5cl  -Bxa1 -Bya10p -Bx+l"spherical-harmonic degree @[l@[" -By+l"power [nT@+2@+]"

gmt plot specs/${1}.txt -W2p,white
gmt plot specs/${1}.txt -Sc4p -W1p,white

gmt text <<EOF
2.3 1.3e6 @[r_s =@[ ${2} km
EOF


gmt end show
