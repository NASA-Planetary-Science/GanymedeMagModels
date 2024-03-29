function [starttime, endtime, Bbgx, Bbgy, Bbgz, time] = getTimeJupLinear(track)

  % Set the time limits for the individual tracks and the Jupiter field
  [Bbgx, Bbgy, Bbgz, time] = createLinearBJ(track);
  
  switch track
    case 1
      starttime=datetime(1996,06,27,6,24,56);
      endtime=datetime(1996,06,27,6,35,58);
      %Bbgx = -79; %6;
      %Bbgy =  -6; %-79;
      %Bbgz = -79;
    case 2
      starttime=datetime(1996,09,06,18,57,38);
      endtime=datetime(1996,09,06,19,05,27);
      %Bbgx = -73; %17;
      %Bbgy = -17; %-73
      %Bbgz = -85;
    case 7
      starttime=datetime(1997,04,05,07,07,53);
      endtime=datetime(1997,04,05,07,17,52);
      %Bbgx = 74; % -3;
      %Bbgy =  3; % 84;
      %Bbgz = -76;
    case 8
      starttime=datetime(1997,05,07,15,53,42);
      endtime=datetime(1997,05,07,15,57,51);
      %Bbgx = 11;% -11;
      %Bbgy = 11;% 11;
      %Bbgz = -87;
    case 28
      starttime=datetime(2000,05,20,10,08,05);
      endtime=datetime(2000,05,20,10,12,19);
      %Bbgx = 78; % -7;
      %Bbgy =  7; % 78;
      %Bbgz = -76;
    case 29
      starttime=datetime(2000,12,28,08,19,49);
      endtime=datetime(2000,12,28,08,34,19);
      %Bbgx = -83; % -9;
      %Bbgy =   9; % -83;
      %Bbgz = -79;
    case 101
      starttime=datetime(2021,6,7,16,53,40);
      endtime=datetime(2021,6,7,16,58,00);
      %Bbgx =  19; % -12.6; % I got -13.9 before and -11.3 after...
      %Bbgy =   6; %18.75; % I got 0.3 before and 37.2 after.
      %Bbgz = -74; % I got -66.9 before and -81.3 after
    %case 0 
    %    warning('Also using fantasy track 0')
    otherwise
      error('No such track')
  end

