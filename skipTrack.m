function rmsval = skipTrack(Lmax,wch)
% wch is index of track. For example, wch=3 is track 7.

rplanet = 2631.2;
tracks=[1,2,7,8,28,29,101];

tracksinv = tracks;
tracksinv(wch) = [];

coefs =  invMoreTracks(Lmax,true,tracksinv,[],[],[]);
cf = coefs(1:(Lmax+1)^2-1)/rplanet;

% Need to put the corresponding BU values back into the coefficients
% I use the BU values from the paper, Table 2. These are also stored in the
% coefficients for Lmax2 and Lmax3

LmaxBU = Lmax;
fullcoefs = load(fullfile('coefs',sprintf('Lmax%d_coefs.txt',LmaxBU)));
BUvals = fullcoefs((LmaxBU+1)^2:end);

% Replace the resulting track BU values with the stored track BU values.
coefs = [cf;BUvals];

rmstracks = getRMS(coefs,Lmax);
rmsval = rmstracks(wch);

