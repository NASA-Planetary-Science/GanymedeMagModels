function coefLinComb(coef1name,coef2name,fac1,outname)

  Lmax=3;
  tracks=[1,2,7,8,28,29,101];
    
  if(fac1>1 | fac1<0)
    error('fac1 needs to be between 0 and 1')
  end
  
  coefs1 = readmatrix(fullfile('coefs',[coef1name,'_coefs']));
  coefs2 = readmatrix(fullfile('coefs',[coef2name,'_coefs']));

  % Need to be same max sphharm degree
  coefs = coefs1*fac1 + coefs2*(1-fac1);

  
  cf = coefs(1:(Lmax+1)^2-1);

  try
  writematrix(coefs,fullfile('coefs',[outname,'_coefs']))
  catch
    keyboard
  end
  
  % Export the spatial field for GMT to plot
  exportThisField(cf,[outname,'_field'],0);

  % Write out data for data comparison in GMT plot
  exportTracks = tracks; % You can change for which tracks you want to export
  % This could be different from the tracks for which you calculated the field
  exportSimData(coefs, tracks, [outname,'_simData'], exportTracks);

  % Write out the power spectrum and print the source depth
  writeSpec(coefs(1:(Lmax+1)^2-1),[outname,'_spec'])
  
