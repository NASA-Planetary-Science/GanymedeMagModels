function rGcart = evalSpHarm(X, Y, Z, rplanet, Lmax, fact, usecoef, phiO)
  % usecoef    array of length (Lmax+1)^2 - 1 with
  %            true if you want to use that coefficient and
  %            false if you don't.
  %            e.g. Lmax=1, usecoef = [false, true, true]
  %            uses only c_11 and c_1-1
  
  onorout=0;

  defval('usecoef', true( (Lmax+1)^2-1, 1));
  defval('phiO', false)
  
  % fact is a factor to relate our spherical-harmonics to the ones used by
  % Kivelson
  
  
  % This is a redundant part from the function phiO2sph.
  % But by repeating it here, I avoid needing to pass additional variables

  
  
  if phiO
    error('disabled using phiO')
    %xi = Y;
    %eta = -X;
    %zeta = Z;
  else
    xi = X;
    eta = Y;
    zeta = Z;
  end

  [phi,lat,rad]=cart2sph(xi,eta,zeta);
  theta = pi/2-lat;

  % Until here redundant

  % Need to get also he monopole. See "testSph.m" to show that this is
  % correct
  rG = rGvec(eye((Lmax+1)^2), theta, phi, rad, rplanet, onorout);
  % remove the monopole
  rG = rG(2:end,:);

  % Here is where we use of skip the coefficients
  rG = rG(usecoef,:);
  
  rGcart = zeros(size(rG));
  for i=1:size(rG,1)
    Frad = rG(i,1:length(rad));
    Ftheta = rG(i,length(rad)+1 : 2*length(rad));
    Fphi = rG(i,2*length(rad)+1 : end);
    
    [Xc,Yc,Zc,Bxc,Byc,Bzc] = sph2IAU(rad,theta,phi,Frad,Ftheta,Fphi);
    rGcart(i,:) = fact*[Bxc(:)', Byc(:)', Bzc(:)'];
  end
