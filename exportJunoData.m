function exportJunoData()

  rplanet = 2631.2;
  
  track=101;
  %filename = sprintf('JunoData/ORB%03d_GAN_GPHIO.TAB',track);
  filename = sprintf('JunoData/ORB%03d_GAN_IAU.TAB',track);

  [data,time] = importJunoData(filename);
  [starttime,endtime,Bbgx,Bbgy,Bbgz] = getTimeJup(track);

  index = time >= starttime & time <= endtime;
  time = time(index);

  [Bx, By, Bz, X, Y, Z] = prepData(track,rplanet);

  filename = 'J1_BX';
  fname =  fullfile('data','JunoData',[filename,'.txt']);
  writetable(table(time,Bx), fname ,'delimiter','\t')

  filename = 'J1_BY';
  fname =  fullfile('data','JunoData',[filename,'.txt']);
  writetable(table(time,By), fname ,'delimiter','\t')

  filename = 'J1_BZ';
  fname =  fullfile('data','JunoData',[filename,'.txt']);
  writetable(table(time,Bz), fname ,'delimiter','\t')
