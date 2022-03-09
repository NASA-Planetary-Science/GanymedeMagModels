function inducedComparison(tr,coef,UB,alpha)
  % tr = track number
  % coef = coefficients [g10, g11, h11]
  % UB = [UBX, UBY, UBZ]
  %  
  % For example:
  % tr=1; coef=[-716.8, 49.3, 22.2]; UB=[-55, 26, -4];
  % tr=2; coef=[-716.8, 49.3, 22.2]; UB=[-84, 27, 13];
  % tr=28; coef=[-716.8, 49.3, 22.2]; UB=[39, -13, 78];
  % alpha = 0.82;
  %
  %
  %
  % For testing without induced:
  % tr=1; coef = [-727.3, 52.8, 18.4]; UB = [-56.4, 20.4, -10.1]; alpha=0;
  %  
  % For testing single, only obtained from G1:
  % tr=1; coef = [-673,85,53]; UB = [-63,26,12]; alpha=0;
  

  % Compare simulated field with collected field

  rplanet = 2631.2;
  Lmax=1;

  % Load data after subtraction of Jupiter field
  [Bx,By,Bz,X,Y,Z] = prepData(tr,rplanet);

  % Calculate Kivelson field 
  fact=-2;
  [starttime,endtime,Bbgx,Bbgy,Bbgz] = getTimeJup(tr);
  filename = sprintf('originalData/ORB%02d_GAN_GPHIO.TAB',tr);
  rGcart = evalSpHarm(X, Y, Z, rplanet, Lmax, fact, true((Lmax+1)^2-1, 1));

  % Get updated spherical-harmonic coefficient
  coef(2) = coef(2) - alpha*Bbgy;
  
  dcalc = rGcart'*coef(:)*rplanet;
  BXsim = dcalc(1:length(X));
  BYsim = dcalc(length(X)+1:2*length(X));
  BZsim = dcalc(2*length(X)+1:end);
  
  [data,time] = importData(filename);
  index = time >= starttime & time <= endtime;
  time = time(index);

  
  
  subplot(3,1,1)
  plot(time, Bx)
  hold on
  plot(time, BXsim + UB(1),'--')
  hold off
  title('Bx')
  rmsX = rms(Bx - (BXsim+UB(1)))

  subplot(3,1,2)
  plot(time, By)
  hold on
  %plot(time, BYsim + UB(2) + alpha*Bbgy,'--')
  plot(time, BYsim + UB(2),'--')
  hold off
  title('By')
  rmsY = rms(By - (BYsim+UB(2)))
  
  subplot(3,1,3)
  plot(time, Bz)
  hold on
  plot(time, BZsim + UB(3),'--')
  hold off
  title('Bz')
  rmsZ = rms(Bz - (BZsim+UB(3)))

  totrms = rms([rmsX,rmsY,rmsZ])
  %figure
  %plot(time, BYsim + UB(2) - By)
