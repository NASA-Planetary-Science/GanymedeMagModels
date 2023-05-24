function JupBgTable(track)

  % Write out mean within time range and slope
  [starttime, endtime, Bbgx, Bbgy, Bbgz, time] = getTimeJupLinear(track);

  indices = time > starttime & time < endtime;
  
  meanX = mean(Bbgx(indices))
  meanY = mean(Bbgy(indices))
  meanZ = mean(Bbgz(indices))

  slopeX = (Bbgx(end)-Bbgx(1))/minutes(time(end)-time(1))
  slopeY = (Bbgy(end)-Bbgy(1))/minutes(time(end)-time(1))
  slopeZ = (Bbgz(end)-Bbgz(1))/minutes(time(end)-time(1))
  
  
  
