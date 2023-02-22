function coefs = tryDifferentLtwo(index, value)

rplanet = 2631.2;

Lmax = 2;
% Set value of coefficient and calculate rmse
coefs =  invSkipChoosenCoefSubMoreTracks(Lmax,index,value*rplanet,true);
%coefs = invMoreTracks(Lmax,true,[],[],[]);

cf = coefs(1:(Lmax+1)^2-1)/rplanet;
coefs(1:(Lmax+1)^2-1) = cf;

rmstracks = getRMS(coefs,Lmax)
totalrms = rms(rmstracks)


% Get Q/D ratio
%%% First: Transform to Schmidt coefficients
fac = 2; % The factor between fully normalized spherical-harmonics and the normalization used by Kivelson et al. (2002)
coefSch = [0;coefs(1:(Lmax+1)^2-1)]*fac;
% 
coefSch = Simons2Olsen(coefSch);
% Condon Shortley
[~,~,~,~,~,~,bigm] = addmon(Lmax);
csphase = (-1).^bigm;
coefSch = coefSch.*csphase;
D = 2*sum(coefSch(2:4).^2);
Q = 3*sum(coefSch(5:9).^2);
QtoDsurf = Q/D
rCMB = 658;
QtoDcmb = QtoDsurf*(rplanet/rCMB)^2

rsa = sqrt(QtoDsurf)*rplanet


