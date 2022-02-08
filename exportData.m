function exportData()
  % Writes out the Galileo data after Jupiter field subtraction

  rplanet = 2631.2;
  
  for track=[1,2,28];

    filename = sprintf('../data/ORB%02d_GAN_GPHIO.TAB',track);
    [starttime,endtime,Bbgx,Bbgy,Bbgz] = getTimeJup(track);
    
    [data,time] = importData(filename);
    index = time >= starttime & time <= endtime;

    time = time(index);
    
    [Bx, By, Bz, X, Y, Z] = prepData(track,rplanet);
    
    filename = sprintf('G%d_BX',track);
    fname = fullfile('data','GalileoData',[filename,'.txt']);
    writetable(table(time,Bx),fname,'delimiter','\t')


    filename = sprintf('G%d_BY',track);
    fname = fullfile('data','GalileoData',[filename,'.txt']);
    writetable(table(time,By),fname,'delimiter','\t')

    filename = sprintf('G%d_BZ',track);
    fname = fullfile('data','GalileoData',[filename,'.txt']);
    writetable(table(time,Bz),fname,'delimiter','\t')
    
  end
