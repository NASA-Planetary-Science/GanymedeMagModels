# Plotting the spectra of our four models

gmt begin figures/paperSpecFig pdf

gmt basemap -R0.8/3.2/1e3/3e6 -JX7c/5cl  -Bxa1 -Bya10p -Bx+l"spherical-harmonic degree @[l@[" -By+l"power [nT@+2@+]"

gmt plot specs/.txt -W2p
gmt plot specs/${1}.txt -Sc4p -W1p

gmt end show
