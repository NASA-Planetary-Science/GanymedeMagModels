function [data,time] = importDataGSPRH(filename)
  % data =  Bx, By, Bz, Babs, X, Y, Z
  % time: can use month(time) or hour(time) or second(time)
  
  formatSpec = '%23s%11f%10f%10f%10f%10f%7f%f%[^\n\r]';
  fileID = fopen(filename,'r');
  dataArray = textscan(fileID, formatSpec, 'Delimiter', '', 'WhiteSpace', '', 'TextType', 'string', 'EmptyValue', NaN,  'ReturnOnError', false);
  dataArray{1} = strtrim(dataArray{1});
  fclose(fileID);

  time=datetime(dataArray{1}, 'Format', 'yyyy-MM-dd''T''HH:mm:ss.SSS');
  
  data=load(filename);
  data=data(:,2:end);

  % Output of data:
  % Bx, By, Bz, Bbs, X, Y, Z
