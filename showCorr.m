function R=showCorr()

  Lmax = 3;
  weighting = true;
  
  tracks = [1,2,28,7,29,101];
  relweights = ones(size(tracks));
  
  rplanet = 2631.2;
  fact=-2;

  SphMat = [];
  weights = [];
  
  for i=1:length(tracks)

    [Bx{i},By{i},Bz{i},X,Y,Z] = prepData(tracks(i),rplanet);

    rGcart = evalSpHarm(X, Y, Z, rplanet, Lmax, fact, true((Lmax+1)^2-1, 1));

    SphMat = [SphMat;rGcart'];

    if weighting
      % This sets up the weights that Kivelson et al used.
      if tracks(i)==28
        specialfact = 2;
      else
        specialfact = 1;
      end
      
      wfac = 1/max(abs([Bx{i}(:);By{i}(:);Bz{i}(:)]));
      weights = [weights;  
                 wfac * ones(size(Bx{i})) * relweights(i);
                 wfac * ones(size(By{i})) * relweights(i);
                 wfac * ones(size(Bz{i})) * relweights(i)];
    end

  end

  if weighting
    SphMat = weights.*SphMat;
  end
    
  R = corrcoef(SphMat);
  %Rp = corrcov(SphMat'*SphMat);
  % I think I need corrcov instead of corrcoef! No, I don't think that anymore.

  
  imagesc(R)
  colorbar
  caxis([-1,1])

  dlmwrite(fullfile('correlation', sprintf('CorrMat_Lmax%d_weighting_%s_alltracks.txt',Lmax,string(weighting))), R)

  grdwrite2p(1:(Lmax+1)^2-1, 1:(Lmax+1)^2-1, R, fullfile('correlation', sprintf('CorrMat_Lmax%d_weighting_%s_allTracks.grd',Lmax,string(weighting))));

  %%%%% Output in ADDMON!!! %%%%%
