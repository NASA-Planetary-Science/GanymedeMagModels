function exportThisField(coef,fname,alt)
  % e.g. 
  % [coefs,dtr,dtrc,rmstr] = invSkipCoefSubMoreTracks(3,-700*rplanet,true,[1,2,28,7,29]);
  % Lmax=3;
  % coefs = coefs(1:(Lmax+1)^2-1)/rplanet;
  % exportThisField(coefs,'L3_moreTracks_gio-700')
  

  
  %rplanet = 1;
  %alt = 0; % altfact*rplanet - rplanet;
  rplanet = 2631.2;
  defval('alt',0);%0.32*rplanet;
  
  coef = [0;coef]*rplanet;

  % Normalization difference between Kivelson and our coefficients
  coef = -2*coef;

%%%% Check what "evalSpHarm" does:
%%%% Calculates rGvec, then multiplies the output with fact.
%%%% fact = -2

  [datB, lon, lat] = GMTexportfield2(coef/sqrt(4*pi),fullfile('fields',fname),rplanet,alt,1,[],[],[],1,0);

%%% Maybe also show the field
  % Lmax=sqrt(length(coef))-1;
  % coefBalt = coefBalt=vecupderivative(coef,rplanet+alt,rplanet,Lmax,0);
  % lmcosiBalt=coef2lmcosi(coefBalt,0);
  % [datB,lon,lat]=elm2xyz(lmcosiBalt,1,[0 90 360 -90]);

  imagesc(lon, lat, datB{1})
  kelicol()
  caxis([-1,1]*max(abs(caxis)))
  colorbar
  axis xy
