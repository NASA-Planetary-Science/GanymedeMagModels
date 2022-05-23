function doManyg10(g10,Lmax)
  % doManyg10(g10,Lmax)
  %
  % Calculates spectra, rms misfits, and source depths for a range
  % of choices for g10


  tracks = [1,2,7,8,28,29,101];
  relweights = ones(size(tracks));
  ind = [];

  rplanet = 2631.2;
  
  for i=1:length(g10)

    % Solve for model
    [coefs,~,~,~] = invSkipCoefSubMoreTracks(Lmax,g10*rplanet,true,tracks,relweights,ind);
    cf = coefs(1:(Lmax+1)^2-1)/rplanet;
    coefs(1:(Lmax+1)^2-1) = cf;
    
    % Get rms
    rmsval = getRMS(coefs,Lmax,tracks);
    
    % get spec
    fac = -2; % This is because of Kivelson's normalization.
    % I had set up all the codes to follow their normalization to
    % be able to compare.
    % Now must transform the coefficients to Schmidt seminormalized
    cfspc = Simons2Olsen([0;cf]*fac);
    lmcosi = coef2lmcosi(cfspc,0);
    spc = plm2spec(lmcosi,1);
    
    % get source depth
    ls = 1:Lmax;
    rs = findDepthMinDiff_McLeod(spc,ls,rplanet,rplanet,200,0,Lmax,false);
    
    % Save
    filename = sprintf('Lmax%d-g10Kiv_%g',Lmax,g10);
    foldername = fullfile('manyg10',sprintf('Lmax%d',Lmax));
    mkdir(foldername);
    savename = fullfile(foldername,filename);
    
    save(savename, 'coefs','rmsval','spc','rs')

  end
