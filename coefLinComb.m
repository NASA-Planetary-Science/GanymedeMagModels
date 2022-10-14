%function coefLinComb(coef1name,coef2name,fac1,outname)
function coefLinComb(fac1,outname)

  if fac1==1
    Lmax=2;
  else
    Lmax=3;
  end
  tracks=[1,2,7,8,28,29,101];
    
  if(fac1>1 | fac1<0)
    error('fac1 needs to be between 0 and 1')
  end


  % Need to be same max sphharm degree
  if fac1==1
    cfinfo = load(fullfile('coefs','Lmax2_manycoefs'));
    coefs = mean(cfinfo.cfmat,2);
    
  %  coefs = coefs1;
  else
    %coefs1 = readmatrix(fullfile('coefs',[coef1name,'_coefs']));
    %coefs2 = readmatrix(fullfile('coefs',[coef2name,'_coefs']));
    cfinfo1 = load(fullfile('coefs','Lmax2_manycoefs'));
    cf = mean(cfinfo1.cfmat,2);
    % Transform this from Lmax=2 to Lmax=3 coefficients
    Lnew=3; Lold=2;
    coefs1=zeros( (Lnew+1)^2-1 + 3*length(tracks) ,1);
    coefs1( 1:(Lold+1)^2-1 ) = cf( 1:(Lold+1)^2-1 );
    coefs1( (Lnew+1)^2:end ) = cf( (Lold+1)^2:end );
    clear cfinfo1,cf;
  
    cfinfo2 = load(fullfile('coefs','Lmax3_manycoefs'));
    coefs2 = mean(cfinfo2.cfmat,2);

    coefs = coefs1*fac1 + coefs2*(1-fac1);
  end
  
  cf = coefs(1:(Lmax+1)^2-1);

  writematrix(coefs,fullfile('coefs',[outname,'_coefs']))
  
  % Export the spatial field for GMT to plot
  exportThisField(cf,[outname,'_field'],0);

  % Write out data for data comparison in GMT plot
  exportTracks = tracks; % You can change for which tracks you want to export
  % This could be different from the tracks for which you calculated the field
  exportSimData(coefs, tracks, [outname,'_simData'], exportTracks);

  % Write out the power spectrum and print the source depth
  writeSpec(coefs(1:(Lmax+1)^2-1),[outname,'_spec'])
  
