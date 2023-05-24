function [Bbgx, Bbgy, Bbgz, time] = createLinearBJ(track)
  % This function creates a linear approximation of Jupiter's external field
  % the slope depends on the spacecraft velocity

  % avgtime determines the time range on each side of the data to create
  % the starting and end values of the linear interpolation
  avgtime = 1; % in minutes
  
  rplanet = 2631.2;

  if track < 100
    filename = sprintf('GalileoData/ORB%02d_GAN_IAU.txt',track);
    [data,time] = importData(filename);
  else
    filename = sprintf('JunoData/ORB%03d_GAN_IAU.TAB',track);
    [data,time] = importJunoData(filename);
    % This one has a very long time before and after. Trim it
    % to make it more similar to the Galileo ones
    starttime=datetime(2021,6,7,16,35,00);
    endtime=datetime(2021,6,7,17,10,00);
    indices = time > starttime & time < endtime;
    time = time(indices);
    data = data(indices,:);
  end

  
  Bx = data(:,1);
  By = data(:,2);
  Bz = data(:,3);

  indices1 = time < time(1)+minutes(avgtime);
  indices2 = time > time(end)-minutes(avgtime);
  tm1 = mean(time(indices1));
  tm2 = mean(time(indices2));

  Bx1 = mean(Bx(indices1)); Bx2 = mean(Bx(indices2));
  Bbgx= interp1([tm1,tm2],[Bx1,Bx2],time,'linear','extrap');
  
  By1 = mean(By(indices1)); By2 = mean(By(indices2));
  Bbgy= interp1([tm1,tm2],[By1,By2],time,'linear','extrap');

  Bz1 = mean(Bz(indices1)); Bz2 = mean(Bz(indices2));
  Bbgz= interp1([tm1,tm2],[Bz1,Bz2],time,'linear','extrap');
