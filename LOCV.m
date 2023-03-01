function rmsvals = LOCV(Lmax,ind,fix)

% Do skipTrack for all orbits, then calculate rms
rmsvals = nan(1,7);
for i=1:7
    rmsvals(i) = skipTrack(Lmax,i,ind,fix);
end

% The following was to test what happens if we skip G28...
% rmsvals(5)=[];
