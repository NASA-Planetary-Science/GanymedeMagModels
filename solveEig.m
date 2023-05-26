function [coefs,lam,svremoved] = solveEig(Lmax,useUF,tracks,relweights,ind,subselect,useConstant,J,invweight)
  % INPUT:
  %
  % Lmax         maximum spherical=harmonic degree
  % useUF        also solve for constant uniform fields?
  % tracks       which tracks to use and in what order?
  % relweights   relative weights besides max value weighting
  % ind          want to subtract an induced field? Use 'high', 'low', 'simple'
  %              or a number for alpha, or [] to not subtract an induced field
  %              before model calculation
  % subselect    random data subselection fraction (e.g. 0.5 is 50%)
  % useConstant  To use a constant Jupiter Background field instead of linear
  % J            number of eigenvalues to use in inversion
  % invweight    weight each track with the inverse of its max abs value?
  %
  % OUTPUT:
  %
  % coef         coefficients
  % lam          all eigenvalues
  
%%%%% First part is same as invMoreTracks
  
  defval('tracks',[1,2,7,8,28,29,101]);
  defval('relweights',ones(size(tracks)))
  defval('ind',[])
  defval('subselect',[])
  defval('useConstant',false)
  defval('invweight',false)
  
  rplanet = 2631.2
  fact=-2;

  SphMat = [];
  d=[];
  dAddBack=[];
  datlen = zeros(size(tracks));
  
  weights = [];
  
  rmsvals = zeros(size(tracks));

  for i=1:length(tracks)
    if useConstant
      [Bx{i},By{i},Bz{i},X,Y,Z] = prepDataConstant(tracks(i),rplanet);
    else
      [Bx{i},By{i},Bz{i},X,Y,Z] = prepData(tracks(i),rplanet);
    end

    if subselect
      subind = rand(size(X))<=subselect;
    else
      subind = true(size(X));
    end

    X = X(subind);
    Y = Y(subind);
    Z = Z(subind);
    Bx{i} = Bx{i}(subind);
    By{i} = By{i}(subind);
    Bz{i} = Bz{i}(subind);
    
    rGcart = evalSpHarm(X, Y, Z, rplanet, Lmax, fact, true((Lmax+1)^2-1, 1));

    if isstr(ind)
      disp(sprintf('Subtracting induced model %s',ind))

      [starttime,endtime,~,~,~,~] = getTimeJupLinear(tracks(i));
      % Get induced field
      [Bindx,Bindy,Bindz] = getInduced(tracks(i),ind,starttime,endtime);

      Bindx = Bindx(subind);
      Bindy = Bindy(subind);
      Bindz = Bindz(subind);
      
      % Now subtract this induced field from the data
      Bx{i} = Bx{i} - Bindx;
      By{i} = By{i} - Bindy;
      Bz{i} = Bz{i} - Bindz;

    end

    SphMat = [SphMat;rGcart'];
    
    datlen(i) = length(X);
    
    d = [d;Bx{i};By{i};Bz{i}];

    if invweight
      wfac = 1/max(abs([Bx{i}(:);By{i}(:);Bz{i}(:)]));
    else
      wfac = 1;
    end
    weights = [weights;  
            wfac * ones(size(Bx{i})) * relweights(i);
            wfac * ones(size(By{i})) * relweights(i);
            wfac * ones(size(Bz{i})) * relweights(i)];

  end
    
  if useUF
    Muftot = prepareUFmatrix(Bx, By, Bz, datlen);    
    M = [SphMat, Muftot];
  else
    M = [SphMat];
  end

  % Now weighting
  Mw = weights.*M;
  dw = weights.*d;

%%%%% Same as invMoreTracks until here

%%%% HERE: SVD
  %coefs = Mw\dw;
  %keyboard
  %%%% Test: Use J to determine which one to cut
  [U,S,V] = svd(Mw,'econ');
  %J = round(retainfrac*length(V));
  %%UJ = U(:,1:J);
  %%VJ = V(:,1:J);
  UJ = U; UJ(:,J)=[];
  VJ = V; VJ(:,J)=[];
  lam = diag(S(1:length(V), 1:length(V)));
  lam(J) = [];
  %%SJinv = diag(lam(1:J).^(-1));
  SJinv = diag(lam.^(-1));
  coefs = VJ*(SJinv*(UJ'*dw));

  svremoved = V(:,J);
  
  % Large number of data points -> SVD too costly
  %% Instead of SVD of Mw, do Cholesky decomposition of Mw'Mw
  % Solving M'M c = M'd

  %%% The formulation below uses less memory, but hasn't worked that well.
  % MM = Mw'*Mw;
  % Md = Mw'*dw;
  % [V,D] = eig(MM);
  % lam = diag(D);
  % [lam,isrt] = sort(lam,'descend');
  % V = V(:,isrt);
  % J = round(retainfrac*length(lam))
  % VJ = V(:,1:J);
  % DJinv = diag(1./lam(1:J));
  % coefs = VJ*(DJinv*(VJ'*Md));
  
  

  
%%%% UNTIL HERE: SVD


  
  
