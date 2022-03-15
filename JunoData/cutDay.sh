# For first Juno flyby, only keep times between 4pm and 6pm
sed '54000,68400!d' ORB101_GAN_IAU_fullDay.TAB > ORB101_GAN_IAU.TAB 
