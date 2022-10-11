function [coefs,dtr,dtrc,rmstr,MM] = invMoreTracks(Lmax,useUF,tracks,relweights,ind)
  % INPUT:
  %
  % Lmax         maximum spherical=harmonic degree
  % useUF        also solve for constant uniform fields?
  % tracks       which tracks to use and in what order?
  % relweights   relative weights besides max value weighting
  % ind          want to subtract an induced field? Use 'high', 'low', 'simple'
  %              or a number for alpha, or [] to not subtract an induced field
  %              before model calculation
  %
  % This is basically the same as invSkipCoefSubMoreTracks, but doesn't fix c10


  
  
  %tracks=[1,2,28,7,29,0];
  defval('tracks',[1,2,28,7,29,101]);
  defval('relweights',ones(size(tracks)))
  defval('ind',[])
  
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

    if isstr(ind)
      disp(sprintf('Subtracting induced model %s',ind))

      [starttime,endtime,Bbgx,Bbgy,Bbgz] = getTimeJup(tracks(i));
      % Get induced field
      [Bindx,Bindy,Bindz] = getInduced(tracks(i),ind,starttime,endtime);

      % Now subtract this induced field from the data
      Bx{i} = Bx{i} - Bindx;
      By{i} = By{i} - Bindy;
      Bz{i} = Bz{i} - Bindz;
      
    else

      if length(ind)>0
        alpha = ind;
        % This option subtracts an induced field created by Jupiter's
        % background field from the data. For reasons argued by
        % Kivelson et al. (2002), the strongest parts of the induced field
        % Will be along the axis pointing toward Jupiter, so that is with
        % the Y_{1,-1} spherical harmonic. The factor alpha decides how
        % effective Ganymede is at getting induced.
        
        % We need Jupiter's background field
        [starttime,endtime,Bbgx,Bbgy,Bbgz] = getTimeJup(tracks(i));
        
        % The second row of rGcart corresponds to g_{1,-1} indfact =
        % -alpha*Bbgy * rplanet;
        indfact = -alpha*Bbgx/2 * rplanet; % changed after switching to
        % IAU I think this needs to be divided by 2, otherwise the field
        % is too large???
        
        % The factor rplanet is necessary, because that's one of the differences
        % in normalization between the spherical harmonics of Kivelson and ours.
        % The other difference is the factor -2, but that one is taken care of
        % in the function evalSpHarm
        
        BindX = indfact * rGcart(2,  1:length(Bx{i}));
        BindY = indfact * rGcart(2,   length(Bx{i})+1:2*length(Bx{i}) );
        BindZ = indfact * rGcart(2, 2*length(Bx{i})+1:end );
        
        % Now subtract this induced field from the data
        Bx{i} = Bx{i} - BindX(:);
        By{i} = By{i} - BindY(:);
        Bz{i} = Bz{i} - BindZ(:);
        
      else
        disp('No induced fields')        
      end
   end
      

    SphMat = [SphMat;rGcart'];
    
    datlen(i) = length(X);
    
    
    d = [d;Bx{i};By{i};Bz{i}];
    %dAddBack = [dAddBack;c10x(:);c10y(:);c10z(:)];
    


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

  
  dcalc = M*coefs; 
  d = d; 
  %dcalc = M*coefs;
  MM = M'*M;
  
  % Now put the c10 coefficient back in
  %coefs = [c10sub;coefs];  
  %coefs = [0;coefs];
  
  % split into tracks
  indx = [1,cumsum(3*datlen)];
  for i=1:length(datlen)
      dtr{i} = d(indx(i):indx(i+1));
      dtrc{i} = dcalc(indx(i):indx(i+1));
      rmstr(i) = sqrt(mean((dtr{i} - dtrc{i}).^2));
  end
  
  
  
