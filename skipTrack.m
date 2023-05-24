function rmsval = skipTrack(Lmax,wch,ind,fix)
% wch is index of track. For example, wch=3 is track 7.

defval('ind',[]) % which induction model
defval('fix',[]) % the index to fix

rplanet = 2631.2;
tracks=[1,2,7,8,28,29,101];

tracksinv = tracks;
tracksinv(wch) = [];

if fix==1
  coefs = invSkipChosenCoefSubMoreTracks(Lmax,6,-35,true,tracksinv,[],ind,[]);
elseif fix==2
  coefs = invSkipChosenCoefSubMoreTracks(Lmax,7,24,true,tracksinv,[],ind,[]);
else
  coefs =  invMoreTracks(Lmax,true,tracksinv,[],ind,[]);
end
cf = coefs(1:(Lmax+1)^2-1)/rplanet;
coefs = [cf; coefs((Lmax+1)^2:end)];

% Need to put the corresponding BU values back into the coefficients
% I use the BU values from the paper, Table 2. These are also stored in the
% coefficients for Lmax2 and Lmax3

%LmaxBU = Lmax;
%fullcoefs = load(fullfile('coefs',sprintf('Lmax%d_coefs.txt',LmaxBU)));
if fix==1
  fixname = '_B_i6_v-35'; 
elseif fix==2
  fixname = '_C_i7_v24';
else
  fixname = '';
end

if strcmp(ind,'high')
  indname = '_indhigh';
elseif strcmp(ind,'low')
  indname = '_indlow';
elseif strcmp(ind,'simple')
  indname = '_indsimple';
else
  indname = '';
end
  
  
load(fullfile('coefs',sprintf('Lmax%d%s%s_manycoefs',Lmax,fixname,indname)));
fullcoefs = mean(cfmat,2);
%BUvals = fullcoefs((Lmax+1)^2:end);
% Replace the resulting track BU values with the stored track BU values.
%coefs = [cf;BUvals];
% This is what I did originally: Replace all BU values. Try to only replace one!!
%%%% HERE WE NEED TO ASSUME THAT THE TRACK ORDER IS THE SAME IN THE SAVED AS THE SKIPPED INVERSION
skippedIndex = (Lmax+1)^2 + (wch-1)*3;
BUvalsSkipped = fullcoefs(skippedIndex:skippedIndex+2);
coefsComplete = [coefs(1:skippedIndex-1); BUvalsSkipped; coefs(skippedIndex:end)];


if ind
  rmstracks = getRMSind(coefsComplete,Lmax,tracks,ind);
else
  rmstracks = getRMS(coefsComplete,Lmax);
end

rmsval = rmstracks(wch);

