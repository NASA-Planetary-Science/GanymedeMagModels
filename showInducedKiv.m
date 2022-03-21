function showInducedKiv(track)
  %  Plot the spatial expression of one of the induced fields

  rplanet = 2631.2;

  alpha=1;
  
  Lmax=1;
  fact=-2;
  
  step = 1;
  
  r = rplanet;
  cola = 1:step:179;
  lon = 0:step:360;
  [RAD,COLA,LON] = meshgrid(r,cola,lon);
  [X,Y,Z] = sph2cart(LON(:)*pi/180, (90-COLA(:))*pi/180, RAD(:));

  rGcart = evalSpHarm(X, Y, Z, rplanet, Lmax, fact, true((Lmax+1)^2-1, 1));

  [starttime,endtime,Bbgx,Bbgy,Bbgz] = getTimeJup(track);

  indfact = -alpha*Bbgx/2 * rplanet;
  
  BindX = indfact * rGcart(2,  1:length(X));
  BindY = indfact * rGcart(2,   length(X)+1:2*length(X) );
  BindZ = indfact * rGcart(2, 2*length(X)+1:end );

  % Bix = reshape(BindX,length(lon),length(cola));
  % Biy = reshape(BindY,length(lon),length(cola));
  % Biz = reshape(BindZ,length(lon),length(cola));

  Bix = reshape(BindX,length(cola),length(lon));
  Biy = reshape(BindY,length(cola),length(lon));
  Biz = reshape(BindZ,length(cola),length(lon));

  subplot(3,1,1)
  imagesc(lon,cola,Bix)
  max(abs(Bix(:)))
  colorbar
  
  subplot(3,1,2)
  imagesc(lon,cola,Biy)
  colorbar
  
  subplot(3,1,3)
  imagesc(lon,cola,Biz)
  colorbar
