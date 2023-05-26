function showSingValField(Lmax,svdnr,alt)
  % showSingValField(svdnr,alt)
  %
  % Expands the spherical harmonics of the removed singular value
  % into the spatial domain (radial component) at alt km above rplanet
  %
  %

  rplanet = 2631.2;

  [~,~,svremoved] = solveEig(Lmax,true,[],[],[],1,false,svdnr,false);
  
  fname = sprintf('Lmax2_svd%d_alt%g_field',svdnr,alt)
  %keyboard
  exportThisField(svremoved(1:(Lmax+1)^2-1),fname,alt)
