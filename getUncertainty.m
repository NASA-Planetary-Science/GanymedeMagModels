function cfmat=getUncertainty(index,value,Lmax,filename,tracks,relweights,ind,subselect,nruns,useConstant,invweight)
  % [cf,MM]=getUncertainty(g10,Lmax,filename,tracks,relweights,ind,subselect,nruns,useConstant,invweight)
  %
  % INPUT:
  %
  % index        Singular value to remove (if value=[]) OR index of coefficient to fix (if value is provided)
  %              To do least squares without fixed value, set index=[]
  % value        value for coefficient to fix in Kivelson normalization
  % Lmax         maximum spherical=harmonic degree
  % filename     name for model
  % tracks       which tracks to use and in what order?
  % relweights   relative weights besides max value weighting
  % ind          want to subtract an induced field? Use 'high', 'low', 'simple'
  %              or a number for alpha, or [] to not subtract an induced field
  %              before model calculation
  % subselect    random data subselection fraction (e.g. 0.5 is 50%)
  % nruns        how many calculations for random subselections?
  % useConstant  To use a constant Jupiter Background field instead of linear
  % invweight    weight each track with the inverse of its max abs value?
  %
  % Based on makeMyField.
  % Calculates many field solutions and reports their mean and standard deviations.
  %
  % You can choose which tracks to use. Track 101 is Juno's first track
  % From June 07, 2021
  %
  % Last modified by plattner-at-alumni.ethz.ch, 5/24/2023

  


  %defval('tracks',[1,2,28,7,8,29,101]);
  defval('index',[])
  defval('tracks',[1,2,7,8,28,29,101]);
  defval('relweights',ones(size(tracks)))
  defval('ind',[])
  defval('useConstant',false)
  defval('invweight',false)

  rplanet = 2631.2;

  parfor i=1:nruns
  %for i=1
  
    if index
      %      [coefs,~,~,~,MM] = invSkipCoefSubMoreTracks(Lmax,g10*rplanet,true,tracks,relweights,ind);
      if value
        disp('check fix')
        [coefs,~,~,~,~] = invSkipChosenCoefSubMoreTracks(Lmax,index,value*rplanet,true,tracks,relweights,ind,subselect,useConstant,invweight);
      else
        disp('check svd')
        [coefs,~] = solveEig(Lmax,true,tracks,relweights,ind,subselect,useConstant,index,invweight);
      end
    else
      disp('check lsq')
      [coefs,~,~,~,~] = invMoreTracks(Lmax,true,tracks,relweights,ind,subselect,useConstant,invweight);
    end
  
    % The spherical-harmonic coefficients still have the planet's radius in them.
    % To have the same normalization as Kivelson, need to divide this out
    cf = coefs(1:(Lmax+1)^2-1)/rplanet;
    coefs(1:(Lmax+1)^2-1) = cf;

    cfmat(:,i) = coefs;
     
  end
  
  % Calculate the source radius
  fac = -2;
  parfor i=1:nruns
    coef = [0;cfmat(1:(Lmax+1)^2-1,i)]*fac;
    coef = Simons2Olsen(coef);
    lmcosi = coef2lmcosi(coef,0);
    spc = plm2spec(lmcosi,1);
    ls = 1:Lmax;
    rs(i) = findDepthMinDiff_McLeod(spc,ls,rplanet,rplanet,200,0,Lmax,false);
  end

  % Save everything
  %writematrix(cfmat,fullfile('coefs',[filename,'_manycoefs']))
%  save(fullfile('coefs',[filename,'_manycoefs']),'cfmat','rs')
  save(fullfile('coefs',[filename,'_manycoefs']),'cfmat')
  
  % % Export the spatial field for GMT to plot
  % exportThisField(cf,[filename,'_field'],0);

  % % Write out data for data comparison in GMT plot
  % exportTracks = tracks; % You can change for which tracks you want to export
  % % This could be different from the tracks for which you calculated the field
  % exportSimData(coefs, tracks, [filename,'_simData'], exportTracks);

  % % Write out the power spectrum and print the source depth
  % writeSpec(coefs(1:(Lmax+1)^2-1),[filename,'_spec'])
  
