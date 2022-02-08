function [data,time] = importJunoData(filename)
  % data =  Bx, By, Bz, Babs, X, Y, Z
  % time: can use month(time) or hour(time) or second(time)

  formatSpec = '%s\t%f\t%f\t%f\t%f\t%f\t%f\t%f\n';
  
  fileID = fopen(filename,'r');
  dataArray = textscan(fileID, formatSpec, 'Delimiter', '\t', 'WhiteSpace', '', 'TextType', 'string', 'EmptyValue', NaN,  'ReturnOnError', false);
  dataArray{1} = strtrim(dataArray{1});
  fclose(fileID);

  time=datetime(dataArray{1}, 'Format', 'yyyy-MM-dd''T''HH:mm:ss.SSS');
  
  data=load(filename);
  data=data(:,2:end);

  % Output of data:
  % Bx, By, Bz, Bbs, X, Y, Z
