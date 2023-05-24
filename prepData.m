function [Bx, By, Bz, X, Y, Z] = prepData(track,rplanet)

  if track < 100
    %filename = sprintf('originalData/ORB%02d_GAN_GPHIO.TAB',track);
    filename = sprintf('GalileoData/ORB%02d_GAN_IAU.txt',track);
  else
    %filename = sprintf('JunoData/ORB%03d_GAN_GPHIO.TAB',track);
    filename = sprintf('JunoData/ORB%03d_GAN_IAU.TAB',track);
  end
    
  [starttime,endtime,Bbgx,Bbgy,Bbgz,timebg] = getTimeJupLinear(track);

  
  % Load the data
  if track < 100
    [data,time] = importData(filename);
  else
    [data,time] = importJunoData(filename);
  end
  
  % Keep only data within time limits
  index = time >= starttime & time <= endtime;
  data = data(index,:);
  indexbg = timebg >= starttime & timebg <= endtime;
  Bbgx = Bbgx(indexbg,:); Bbgy = Bbgy(indexbg,:); Bbgz = Bbgz(indexbg,:);
  
  % Distribute data into the variables
  Bx = data(:,1) - Bbgx; % in nT
  By = data(:,2) - Bbgy; % in nT
  Bz = data(:,3) - Bbgz; % in nT
  
  X = data(:,5)*rplanet; 
  Y = data(:,6)*rplanet; 
  Z = data(:,7)*rplanet;
    
