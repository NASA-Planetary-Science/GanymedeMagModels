function getJupBgField(filename,cmp,ind1,ind2,showbg,juno)
  % Plots the data to estimate a Jupiter bg field.
  % Provide t1 and t2 to give an average value for that index range
  % Provide cmp to select a component: 1=Bx, 2=By, 3=Bz

  defval('juno',false)
  
  % Load data
  if juno
    [data,time] = importJunoData(filename);
  else
    [data,time] = importData(filename);
  end

  % Plot data
  plot(data(:,cmp))
  hold on
  plot([1,length(time)],[1,1]*showbg)
  hold off
  
  % Calculate average
  bg = mean(data(ind1:ind2,cmp))

  % Write out time range
  t1=time(ind1)
  t2=time(ind2)
