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

  % For plotting, turn g10 values from Kivelson to Schmidt seminormalized
  sfc = (-1).^(0)./(sqrt((2*1+1)/(4*pi)));
  grng = grng * 2 / sfc;
  
  scatter(grng,rsvalues,[],rmsvalues,'filled');
  c=colorbar;
  xlabel('g_{10}');
  ylabel('source radius [km]');
  ylabel(c,'rmse [nT]')
  print(sprintf('Lmax%d_manyg10.pdf',Lmax)  ,'-dpdf', '-bestfit')
 
