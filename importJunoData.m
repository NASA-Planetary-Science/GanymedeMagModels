function [data,time] = importJunoData(filename)
  % data =  Bx, By, Bz, Babs, X, Y, Z
  % time: can use month(time) or hour(time) or second(time)

  rplanet = 2631.2;
  
  formatSpec = '%s\t%f\t%f\t%f\t%f\t%f\t%f\t%f\n';
  
  fileID = fopen(filename,'r');
  dataArray = textscan(fileID, formatSpec, 'Delimiter', '\t', 'WhiteSpace', '', 'TextType', 'string', 'EmptyValue', NaN,  'ReturnOnError', false);
  dataArray{1} = strtrim(dataArray{1});
  fclose(fileID);

  time=datetime(dataArray{1}, 'Format', 'yyyy-MM-dd''T''HH:mm:ss.SSS');
  
  data=load(filename);
  data=data(:,2:end);

  data(:,5:7) = data(:,5:7)/rplanet;
  
  % The Galileo data is normalized by the planet's radius.
  % So we need to do that too here
  
  % Output of data:
  % Bx, By, Bz, Babs, X, Y, Z
