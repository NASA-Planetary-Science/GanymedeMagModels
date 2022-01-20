function writeSpec(coef,filename)
  % example:
  %
  % coefs=load('coefs/coefsKivPaper.txt');
  % Lmax=2;
  % writeSpec(coefs(1:(Lmax+1)^2-1),'KivOriginal')

  fac = -2;
  
  coef = [0;coef]*fac;
  coef = Simons2Olsen(coef);
  
  rplanet = 2631.2;
  
  lmcosi = coef2lmcosi(coef,0);

  spc = plm2spec(lmcosi,1);
  % Get source depth
  Lmax=length(spc)-1;
  ls = 1:Lmax;
  
  rs = findDepthMinDiff_McLeod(spc,ls,rplanet,rplanet,1000,0,Lmax,false);

  round(rs)


  spc=spc(2:end);
  
  dlmwrite(fullfile('specs',[filename,sprintf('_rs_%gkm.txt',rs)]),[ls(:),spc],'delimiter','\t');

