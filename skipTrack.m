function skipTrack(Lmax,wch)

tracks=[1,2,7,8,28,29,101];

tracksinv = tracks;
tracksinv(wch) = [];

coefs =  invMoreTracks(Lmax,useUF,tracksinv,[],[],[]);
cf = coefs(1:(Lmax+1)^2-1)/rplanet;
coefs(1:(Lmax+1)^2-1) = cf;

rmstracks = getRMS(coefs,Lmax)
totalrms = rms(rmstracks)

rmsval = 