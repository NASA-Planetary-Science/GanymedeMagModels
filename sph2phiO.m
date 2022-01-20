function [X,Y,Z,Bx,By,Bz] = sph2phiO(rad,theta,phi,Brad,Btheta,Bphi)

  % First to cartesian Ganymede

  [xi,eta,zeta] = sph2cart(phi, pi/2-theta, rad);
  [Bxi,Beta,Bzeta] = dsph2dcart(phi,theta,Bphi,Btheta,Brad);

  % Then into flow Ganymede
  X = -eta;
  Y = xi;
  Z = zeta;

  Bx = -Beta;
  By = Bxi;
  Bz = Bzeta;
  
