function showManyg10(grng,Lmax)
  
  foldername = fullfile('manyg10',sprintf('Lmax%d',Lmax));

  rmsvalues = nan(size(grng));
  rsvalues = nan(size(grng));
  
  for i=1:length(grng)

    filename = sprintf('Lmax%d-g10Kiv_%g',Lmax,grng(i));
    loadname = fullfile(foldername,filename);
    
    load(loadname)

    rmsvalues(i) = rmsval;
    rsvalues(i) = rs;
    
  end
    
keyboard
