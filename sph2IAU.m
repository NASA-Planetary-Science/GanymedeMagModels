function [X,Y,Z,Bx,By,Bz] = sph2IAU(rad,theta,phi,Brad,Btheta,Bphi)

  [X,Y,Z] = sph2cart(phi, pi/2-theta, rad);
  [Bx,By,Bz] = dsph2dcart(phi,theta,Bphi,Btheta,Brad);

