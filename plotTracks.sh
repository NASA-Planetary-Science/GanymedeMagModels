
gmt begin figures/GanymedeData pdf

gmt set FONT 9

# Plotting a data file with three columns: lon, lat, value

# Here I just create a color scheme from some colors I like
# (smooth transition between navy, orange).
# Create a step every 200 units between 200 and 2000
# MAke it continuous (-Z)

#gmt makecpt -Cnavy,orange -T0/3000/200 -Z
gmt makecpt -Corange,navy -T0/3000/200 -Z -D

# Plot data points as circles, therefore -Sc Size: 0.1cm
# Plot the entire globe, therefore -Rg
# Mollweide projection, therefore -JW the figure should be 14 cm wide, therefore 14c
# Gridlines every 30 degrees, and want them all marked, so -Bag30
# More things to come, therefore -K

gmt plot exportedTracks/Galileo1.txt -C -Sc0.1c -Rd -JW7c  -Ba30g30
gmt plot exportedTracks/Galileo2.txt -C -Sc0.1c
gmt plot exportedTracks/Galileo7.txt -C -Sc0.1c
gmt plot exportedTracks/Galileo8.txt -C -Sc0.1c
gmt plot exportedTracks/Galileo28.txt -C -Sc0.1c 
gmt plot exportedTracks/Galileo29.txt -C -Sc0.1c 

#gmt plot exportedTracks/Juno1.txt -Wfaint,200 -Sc0.20c 
gmt plot exportedTracks/Juno1.txt -C -Sc0.1c

gmt text <<EOF
-160 18 G1
-10 75 G2
-155 38 G7
138 -17 G28
122 25 G8
0 35 G29
-100 5 J
EOF


# Plot the scale at the bottom (-Dx0c/0c),
# 14c wide and 0.5cm thick (+w14c/0.5c),
# make it horizontal (+h)
# Append this to a preexisting figure (-O)
# Write label "altitude [km]"

gmt colorbar -DJBC+o0c/0.3c+w7c+ef -B+l"altitude [km]" 
#-D0c/-0.7c+w14c/0.5c+h

gmt end show
