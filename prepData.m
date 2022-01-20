function [Bx, By, Bz, X, Y, Z] = prepData(track,rplanet)

  % I am also adding a fantasy track
  
  filename = sprintf('originalData/ORB%02d_GAN_GPHIO.TAB',track);

  [starttime,endtime,Bbgx,Bbgy,Bbgz] = getTimeJup(track);

  
  % Load the data
  if track % If it is a positive track number
    [data,time] = importData(filename);

    % Keep only data within time limits
    index = time >= starttime & time <= endtime;
    data = data(index,:);
    
    % Distribute data into the variables
    Bx = data(:,1) - Bbgx; % in nT
    By = data(:,2) - Bbgy; % in nT
    Bz = data(:,3) - Bbgz; % in nT
    
    X = data(:,5)*rplanet; 
    Y = data(:,6)*rplanet; 
    Z = data(:,7)*rplanet;
    
  else
    % How many points?
    n=1000;
    % This doesn't seem to work. It destroys the calculations...
    time = linspace(datetime(2021,08,30,9,0,0), datetime(2021,08,30,9,30,0) );
    %Create the points in lon/ lat, then translate
    lon =linspace(50,300,n)';
    lat = -83*ones(size(lon));
    rad = rplanet*ones(size(lon));
    Bphi = zeros(size(lon));
    Bth = zeros(size(lon));
    Br = 1e2*ones(size(lon));
    % Now translate to GphiO
    [X,Y,Z,Bx,By,Bz] = sph2phiO(rad,(90-lat)*pi/180,lon*pi/180,Br,Bth,Bphi);
    
  end
