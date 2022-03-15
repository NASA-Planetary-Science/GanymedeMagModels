function GSPRH2IAU()

% Transforms the Galileo data from GSPRH (spherical) to Cartesian IAU

  tracks=[1,2,7,8,9,12,28,29];

  for track=tracks
  
    filename = sprintf('originalData/ORB%02d_GAN_GSPRH.TAB',track);
    [data,time] = importDataGSPRH(filename);

    % Transform data to IAU
    Br = data(:,1);
    Bth = data(:,2);
    Bph = data(:,3);
    Babs = data(:,4);
    rad = data(:,5);
    theta = pi/2 - data(:,6)*pi/180;
    phi = data(:,7)*pi/180;
    
    [x,y,z] = sph2cart( phi, pi/2 - theta, rad);
    [Bx,By,Bz] = dsph2dcart(phi,theta,Bph,Bth,Br);
    Babs2 = sqrt(Bx(:).^2 + By(:).^2 + Bz(:).^2);

    % Write out transformed data
    outname = sprintf('GalileoData/ORB%02d_GAN_IAU.txt',track);
    writetable(table(time,[Bx(:),By(:),Bz(:),Babs2(:),x(:),y(:),z(:)]),...
               outname, 'Delimiter', '\t', 'WriteVariableNames', false);

  end
