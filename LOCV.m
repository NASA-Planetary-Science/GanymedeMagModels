function rmsvals = LOCV(Lmax,ind,fix)
  % fix = [] : either L1 or L2A
  % fix = 1 : L2B
  % fix = 2 : L2C
  % fix = 3 : L2D
  % fix = 4 : L2E

  
% Do skipTrack for all orbits, then calculate rms
rmsvals = nan(1,7);
for i=1:7
    rmsvals(i) = skipTrack(Lmax,i,ind,fix);
end

% The following was to test what happens if we skip G28...
% rmsvals(5)=[];
