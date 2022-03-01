# Plotting the spectra of our four models

gmt begin figures/paperSpecFig pdf

lt=1p
sym=5p
colfit=120/120/120
gmt set FONT 14

gmt basemap -R0.8/3.2/2e3/3e6 -JX10c/5cl  -Bxa1 -Bya10p -Bx+l"spherical-harmonic degree @[l@[" -By+l"power [nT@+2@+]"

gmt plot specs/KivelsonEtAl2002_spec_rs_229km.txt -W${lt}
gmt plot specs/KivelsonEtAl2002_spec_rs_229km.txt -Sc${sym} -W1p -l"K 2002"

gmt plot specs/Lmax2_alsoG8andJuno_spec_rs_185km.txt -W${lt}
gmt plot specs/Lmax2_alsoG8andJuno_spec_rs_185km.txt -Ss${sym} -W1p -l"@%2%L@%%@-max@- = 2"

gmt plot specs/Lmax3_alsoG8andJuno_spec_rs_971km.txt -W${lt}
gmt plot specs/Lmax3_alsoG8andJuno_spec_rs_971km.txt -St${sym} -W1p  -l"@%2%L@%%@-max@- = 3"
gmt plot specs/Lmax3_alsoG8andJuno_spec_rs_971km_fittedMcLeod.txt -W${lt},${colfit},-

gmt plot specs/Lmax3_g10_-921_alsoG8andJuno_spec_rs_1489km.txt -W${lt}
gmt plot specs/Lmax3_g10_-921_alsoG8andJuno_spec_rs_1489km.txt -Sa${sym} -W1p  -l"@%2%g@%%@-10@- = -900"
gmt plot specs/Lmax3_g10_-921_alsoG8andJuno_spec_rs_1489km_fittedMcLeod.txt -W${lt},${colfit},-

gmt legend -DjBL

gmt end show
