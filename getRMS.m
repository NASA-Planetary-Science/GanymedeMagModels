function rmstracks = getRMS(coefs,Lmax,tracks)
% Should give same results as getRMSE, but this one doesn't require exporting the evaluated model at the tracks.

  defval('tracks',[1,2,7,8,28,29,101]);
  
  rplanet = 2631.2;
  fact=-2;
  cf = coefs(1:end-3*length(tracks))*rplanet;
  UFvals = coefs(length(cf)+1:end);

  % The sum of the squares of differences
  sumsq = nan(size(tracks));

  % The number of data points along each rack
  numdat = nan(size(tracks));
  
  
  for i = 1:length(tracks)

    [starttime,endtime,Bbgx,Bbgy,Bbgz] = getTimeJup(tracks(i));
    if tracks(i) < 100
      filename = sprintf('GalileoData/ORB%02d_GAN_IAU.txt',tracks(i));
      [data,time] = importData(filename);
    else
      filename = sprintf('JunoData/ORB%03d_GAN_IAU.TAB',tracks(i));
      [data,time] = importJunoData(filename);
    end
    index = time >= starttime & time <= endtime;
    time = time(index);

    [Bx,By,Bz,X,Y,Z] = prepData(tracks(i),rplanet);

    % Evaluate data from model
    rGcart = evalSpHarm(X, Y, Z, rplanet, Lmax, fact, true((Lmax+1)^2-1, 1));

    dcalc = rGcart'*cf;

    % Add the uniform field back in
    ind = find(tracks==tracks(i));

    UBX = UFvals(3*(ind-1)+1);
    UBY = UFvals(3*(ind-1)+2);
    UBZ = UFvals(3*(ind-1)+3);

    BXsim = dcalc(1:length(X)) + UBX;
    BYsim = dcalc(length(X)+1:2*length(X)) + UBY;
    BZsim = dcalc(2*length(X)+1:end) + UBZ;

    sumsq(i) = sum( (Bx-BXsim).^2 + (By-BYsim).^2 + (Bz-BZsim).^2  );
    numdat(i) = 3*length(BXsim);

    %keyboard
    
  end

  %rmsval = sqrt(sum(sumsq)/sum(numdat));

  rmstracks = sqrt(sumsq./numdat);
  %rmsval = rms(rmstracks);
  
