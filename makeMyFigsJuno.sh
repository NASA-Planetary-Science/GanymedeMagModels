# Provide the filename that you used in makeMyField,
# and the source radius for the spec. You can find it in
# the file name in the folder "specs"
# For example
# ./makeMyFigs.sh Lmax_3_g10_-700_allGalileoTracks 1119.86
# or
# ./makeMyFigs.sh Lmax3_g10_-700_JunoAndAllGalileo 1116

#cmax=1600
#cstep=800

#cmax=2000
#cstep=1000

cmax=3000
cstep=1500

./plotDataJuno.sh ${1}_simData
./plotDataJunoTalk.sh ${1}_simData

./plotFields.sh ${1}_field_cmp1 ${cmax} ${cstep}
./plotFieldsTalk.sh ${1}_field_cmp1 ${cmax} ${cstep}
./plotFieldsTracksTalk.sh ${1}_field_cmp1 ${cmax} ${cstep}
# The last two numbers in plotFieldsTalk
# give the max abs color and the label step in the colorbar

./plotSpec.sh ${1}_spec_rs_${2}km ${2}
./plotSpecTalk.sh ${1}_spec_rs_${2}km ${2}
