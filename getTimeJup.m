function [starttime,endtime,Bbgx,Bbgy,Bbgz] = getTimeJup(track)

  % Set the time limits for the individual tracks and the Jupiter field
  switch track
    case 1
      starttime=datetime(1996,06,27,6,24,56);
      endtime=datetime(1996,06,27,6,35,58);
      Bbgx = 6;
      Bbgy = -79;
      Bbgz = -79;
    case 2
      starttime=datetime(1996,09,06,18,57,38);
      endtime=datetime(1996,09,06,19,05,27);
      Bbgx = 17;
      Bbgy = -73;
      Bbgz = -85;
    case 7
      starttime=datetime(1997,04,05,07,07,53);
      endtime=datetime(1997,04,05,07,17,52);
      Bbgx = -3;
      Bbgy = 84;
      Bbgz = -76;
    case 8
      starttime=datetime(1997,05,07,15,53,42);
      endtime=datetime(1997,05,07,15,57,51);
      Bbgx = -11;
      Bbgy = 11;
      Bbgz = -77;
    case 28
      starttime=datetime(2000,05,20,10,08,05);
      endtime=datetime(2000,05,20,10,12,19);
      Bbgx = -7;
      Bbgy = 78;
      Bbgz = -76;
    case 29
      starttime=datetime(2000,12,28,08,19,49);
      endtime=datetime(2000,12,28,08,34,19);
      Bbgx = -9;
      Bbgy = -83;
      Bbgz = -79;
    case 0 
        warning('Also using fantasy track 0')
    otherwise
      error('No such track')
  end

