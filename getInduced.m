function [Bindx,Bindy,Bindz] = getInduced(track,modname,starttime,endtime)  

  % Load model values
  tab = readtable(fullfile('inducedFields','GanymedeInduced',sprintf('indORB%02d_GAN_IAU.txt',track)));
  time = tab.UTCTime;
  time = datetime(time,'InputFormat','yyyy-MM-dd''T''HH:mm:ss.SSS');
  
  x = tab.x_R_G_;
  y = tab.y_R_G_;
  z = tab.z_R_G_;
  if strcmp(modname,'high')
      Bindx = tab.Bx_high;
      Bindy = tab.By_high;
      Bindz = tab.Bz_high;
  elseif strcmp(modname,'low')
      Bindx = tab.Bx_low;
      Bindy = tab.By_low;
      Bindz = tab.Bz_low;
  elseif strcmp(modname,'simple')
      Bindx = tab.Bx_simple;
      Bindy = tab.By_simple;
      Bindz = tab.Bz_simple;
  else
      error('For modname, give either high or low or simple')
  end

  if 0 
    subplot(3,1,1)
    plot(time,Bindx)
    subplot(3,1,2)
    plot(time,Bindy)
    subplot(3,1,3)
    plot(time,Bindz)
  end

  % Cut to desired time range
  index = time >= starttime & time <= endtime;
  Bindx = Bindx(index);
  Bindy = Bindy(index);
  Bindz = Bindz(index);

      
