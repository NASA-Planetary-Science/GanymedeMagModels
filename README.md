# GanymedeMagModels

Calculate alternative Ganymede mag models using Galileo data (and soon Juno data).

## Prerequisites

For calculations:

Matlab or Octave: https://www.gnu.org/software/octave/index

Slepian software package: https://github.com/Slepian/Slepian

For plotting:

GMT 6: https://www.generic-mapping-tools.org/

## Instructions

### Calculations

Edit the initialize.m file to set the slepdir variable to the directory of your Slepian software package.

In Matlab or Octave, run

`initialize`

to set the paths to the Slepian software package. 
Then calculate your model by running makeMyField and provide the desired value for g10, 
the maximum spherical-harmonic degree Lmax, and the filename under which you want to store the result.

For example:

`makeMyField(-700,3,'Lmax_3_g10_-700_allGalileoTracks')`

### Plotting

In a terminal / command prompt that has GMT installed and which can understand Unix syntax, run makeMyFigs.sh. 
You will need to provide the filename and the source radius, which you can find in the filename of the corresponding spectrum 
in the folder "spec".

For example:

`./makeMyFigs.sh Lmax_3_g10_-700_allGalileoTracks 1119.86`

The figures are saved in the "figures" folder

