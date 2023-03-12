gmt begin figures/linComb pdf

gmt set FONT 14
lt=1p
#sym=5p
sym=0.25c
colfit=120/120/120

#gmt makecpt -Cdavos -D -I -T6.2/7/0.2 -Z
gmt makecpt -Cdavos -D -I -T6.5/6.8/0.1 -Z

#### Models

gmt basemap -JX10c/5c -R-0.03/1.03/0.04/0.14 -Bx0.1+l"weight of model L2A@[-@[" -By0.02+l"@[Q/D@[ at @[0.25\,r_G@[" -BneSW
# gmt plot -Sc0.28c -G160 <<EOF
# 0,965
# 1,182
# EOF
gmt plot linCombResults.txt -C -Wblack -Sc0.17c

# gmt plot -C -Wblack -Sc0.25c <<EOF
# 0,965,4.97372631579815
# 1,182,6.4547790442089
# EOF

# othersyms=0.285c
# otherlt=0.4p

# gmt plot -C -W${otherlt},black -Ss${othersyms} <<EOF
# 0.25,840,5.03240757148502
# EOF

# gmt plot -C -W${otherlt},black -St${othersyms} <<EOF
# 0.5,688,5.32370985686497
# EOF

# gmt plot -C -W${otherlt},black -Sd${othersyms} <<EOF
# 0.75,489,5.81276487466054
# EOF

#gmt colorbar -DJCR+w4c/0.3c+o0.2c/0c -B0.2+l"rmse [nT]"
gmt colorbar -DJTC+w10c/0.3c+o0c/0.25c -B0.1+l"rmse [nT]"

# gmt text -R0/1/0/1 -N  --FONT=20 <<EOF
# -0.1 1.135 a
# EOF



# #### Specs

# gmt basemap -X10.5c -R0.8/3.2/3e2/3e6 -JX10c/5cl  -Bxa1 -Bya10p -Bx+l"spherical-harmonic degree @[l@[" -By+l"power [nT@+2@+]" -BnESw

# gmt plot specs/LinComb_fac25pc_spec_rs_840km.txt -W${lt}
# gmt plot specs/LinComb_fac25pc_spec_rs_840km.txt -Ss${sym} -W0.8p -l"fraction 0.25"
# #gmt plot specs/LinComb_fac25pc_spec_rs_840km_fittedMcLeod.txt -W${lt},${colfit},-

# gmt plot specs/LinComb_fac50pc_spec_rs_688km.txt -W${lt}
# gmt plot specs/LinComb_fac50pc_spec_rs_688km.txt -St${sym} -W0.8p  -l"fraction 0.5"
# #gmt plot specs/LinComb_fac50pc_spec_rs_689km_fittedMcLeod.txt -W${lt},${colfit},-

# gmt plot specs/LinComb_fac75pc_spec_rs_489km.txt -W${lt} 
# gmt plot specs/LinComb_fac75pc_spec_rs_489km.txt -Sd${sym} -W0.8p  -l"fraction 0.75"
# #gmt plot specs/LinComb_fac75pc_spec_rs_489km_fittedMcLeod.txt -W${lt},${colfit},-

# gmt legend -DjBL

# gmt text -R0/1/0.0000001/1 -N  --FONT=20 <<EOF
# 0.02 10 b
# EOF

gmt end show
