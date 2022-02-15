function showMoreData()
  % Prepares the data of all tracks to be shown. This is a longer
  % range than when comparing data misfit


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

    filename = sprintf('G%d_BX',track);
    fname = fullfile('data','extendedData',[filename,'.txt']);
    writetable(table(time,data(:,1)),fname,'delimiter','\t');

    filename = sprintf('G%d_BY',track);
    fname = fullfile('data','extendedData',[filename,'.txt']);
    writetable(table(time,data(:,2)),fname,'delimiter','\t');

    filename = sprintf('G%d_BZ',track);
    fname = fullfile('data','extendedData',[filename,'.txt']);
    writetable(table(time,data(:,3)),fname,'delimiter','\t');
    
  end


  % Now Juno Track
  track=101;
  
  filename = sprintf('JunoData/ORB%02d_GAN_GPHIO.TAB',track);
  [data,time] = importJunoData(filename);
  
  [starttime,endtime,Bbgx,Bbgy,Bbgz] = getTimeJup(track);
  
  index = time >= starttime - minutes(dtime) & time <= endtime + minutes(dtime);
  
  data = data(index,:);
  
  time = time(index);
  
  filename = sprintf('J_BX',track);
  fname = fullfile('data','extendedData',[filename,'.txt']);
  writetable(table(time,data(:,1)),fname,'delimiter','\t')
  
  filename = sprintf('J_BY',track);
  fname = fullfile('data','extendedData',[filename,'.txt']);
  writetable(table(time,data(:,2)),fname,'delimiter','\t')
  
  filename = sprintf('J_BZ',track);
  fname = fullfile('data','extendedData',[filename,'.txt']);
  writetable(table(time,data(:,3)),fname,'delimiter','\t')
  
