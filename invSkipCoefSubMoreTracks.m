function [coefs,dtr,dtrc,rmstr] = invSkipCoefSubMoreTracks(Lmax,c10sub,useUF,tracks,relweights)

  % This is basically the same as invSkipCoef, but I add the option
  % To subtract a pre-given value for the c10 coefficient

  % Need to then solve without it of course!!!
  
  %tracks=[1,2,28,7,29,0];
  defval('tracks',[1,2,28,7,29,101]);
  defval('relweights',ones(size(tracks)))
  
  %rplanet=1;
  rplanet = 2631.2
  fact=-2;

  SphMat = [];
  %SphMatAll = [];
  d=[];
  dAddBack=[];
  datlen = zeros(size(tracks));
  
  weights = [];
  
  rmsvals = zeros(size(tracks));

  for i=1:length(tracks)

    
    [Bx{i},By{i},Bz{i},X,Y,Z] = prepData(tracks(i),rplanet);
    
    rGcart = evalSpHarm(X, Y, Z, rplanet, Lmax, fact, true((Lmax+1)^2-1, 1));
    
    % Now subtract the evaluated coefficient.
    % The first row of rGcart contains the values for the spherical-harmonic
    % corresponding to c10

    E10 = rGcart(1,:);
    
    c10x = E10(1:length(Bx{i}))*c10sub;
    Bx{i} = Bx{i} - c10x(:);

    c10y = E10(length(By{i})+1:2*length(Bx{i}))*c10sub;
    By{i} = By{i} - c10y(:);

    c10z = E10(2*length(Bz{i})+1:end)*c10sub;
    Bz{i} = Bz{i} - c10z(:);

    % Now remove the c10 spherical-harmonic from rGcart
    % but before you do that, save a copy of the matrix
    %SphMatAll = [SphMatAll;rGcart'];
    
    rGcart = rGcart(2:end,:);
    SphMat = [SphMat;rGcart'];
    
    datlen(i) = length(X);
    
    
    d = [d;Bx{i};By{i};Bz{i}];
    dAddBack = [dAddBack;c10x(:);c10y(:);c10z(:)];
    
    if tracks(i)==28
      specialfact = 2;
    else
      specialfact = 1;
    end

    % This sets up the weights that Kivelson et al used.
    wfac = 1/max(abs([Bx{i}(:);By{i}(:);Bz{i}(:)]));
    weights = [weights;  
            wfac * ones(size(Bx{i})) * relweights(i);
            wfac * ones(size(By{i})) * relweights(i);
            wfac * ones(size(Bz{i})) * relweights(i)];
    
  end

  % This part prepares the uniform field matrix
  if useUF
    Muftot = prepareUFmatrix(Bx, By, Bz, datlen);    
    M = [SphMat, Muftot];
  else
    M = [SphMat];
  end
  
  % Now weighting
  Mw = weights.*M;
  dw = weights.*d;
  
  coefs = Mw\dw;
  %coefs = itweighres(Mw',dw,coefs,200);
  %coefs = (Mw'*Mw)^(-1)*(Mw'*dw);

  
  
  % Now put the c10 coefficient back in and also the data
  dcalc = M*coefs + dAddBack;
  d = d + dAddBack;
  %dcalc = M*coefs;
  
  % Now put the c10 coefficient back in
  coefs = [c10sub;coefs];  
  %coefs = [0;coefs];
  
  % split into tracks
  indx = [1,cumsum(3*datlen)];
  for i=1:length(datlen)
      dtr{i} = d(indx(i):indx(i+1));
      dtrc{i} = dcalc(indx(i):indx(i+1));
      rmstr(i) = sqrt(mean((dtr{i} - dtrc{i}).^2));
  end
  
  
  
