function rmsvals = LOCV(Lmax)

% Do skipTrack for all orbits, then calculate rms
rmsvals = nan(1,7);
for i=1:7
    rmsvals(i) = skipTrack(Lmax,i);
end
rmsvals(5)=[];