function [vel,tout] = getVelocity(track)
  % Velocity is in km/sec.
  % tout is middle-time of the interval between sampling points

  rplanet = 2631.2;

  [Bx, By, Bz, X, Y, Z, time] = prepDataTime(track,rplanet);

  dist = sqrt(diff(X).^2 + diff(Y).^2 + diff(Z).^2);

  t = seconds(diff(time))

  vel=dist./t;

  tout = time(1:end-1) + diff(time)/2;
  
  
  
