function showMoreData()
  % Prepares the data of all tracks to be shown. This is a longer
  % range than when comparing data misfit

  rplanet = 2631.2;

  dtime = 25; % How many minutes before and after  

  for track = [1,2,7,8,28,29]

    filename = sprintf('originalData/ORB%02d_GAN_GPHIO.TAB',track);
    [data,time] = importData(filename);
    
    [starttime,endtime,Bbgx,Bbgy,Bbgz] = getTimeJup(track);

    index = time >= starttime - minutes(dtime) & time <= endtime + minutes(dtime);

    starttime - minutes(dtime)

    endtime + minutes(dtime)
    
    data = data(index,:);

    time = time(index);

    alt = sqrt(data(:,5).^2 + data(:,6).^2 + data(:,7).^2)*rplanet - rplanet;

    filename = sprintf('G%d_BX',track);
    fname = fullfile('data','extendedData',[filename,'.txt']);
    writetable(table(time,data(:,1)),fname,'delimiter','\t');

    filename = sprintf('G%d_BY',track);
    fname = fullfile('data','extendedData',[filename,'.txt']);
    writetable(table(time,data(:,2)),fname,'delimiter','\t');

    filename = sprintf('G%d_BZ',track);
    fname = fullfile('data','extendedData',[filename,'.txt']);
    writetable(table(time,data(:,3)),fname,'delimiter','\t');

    filename = sprintf('G%d_alt',track);
    fname = fullfile('data','extendedData',[filename,'.txt']);
    writetable(table(time,alt),fname,'delimiter','\t');
    
  end


  % Now Juno Track
  track=101;
  
  filename = sprintf('JunoData/ORB%02d_GAN_GPHIO.TAB',track);
  [data,time] = importJunoData(filename);
  
  [starttime,endtime,Bbgx,Bbgy,Bbgz] = getTimeJup(track);
  
  index = time >= starttime - minutes(dtime) & time <= endtime + minutes(dtime);
  
  data = data(index,:);
  
  time = time(index);

  alt = sqrt(data(:,5).^2 + data(:,6).^2 + data(:,7).^2)*rplanet - rplanet;
  
  filename = 'J_BX';
  fname = fullfile('data','extendedData',[filename,'.txt']);
  writetable(table(time,data(:,1)),fname,'delimiter','\t')
  
  filename = 'J_BY';
  fname = fullfile('data','extendedData',[filename,'.txt']);
  writetable(table(time,data(:,2)),fname,'delimiter','\t')
  
  filename = 'J_BZ';
  fname = fullfile('data','extendedData',[filename,'.txt']);
  writetable(table(time,data(:,3)),fname,'delimiter','\t')
  
  filename = 'J_alt';
  fname = fullfile('data','extendedData',[filename,'.txt']);
  writetable(table(time,alt),fname,'delimiter','\t');
