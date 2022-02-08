function exportTracks()

  rplanet = 2631.2;

  %defval('maxalt',3000);
  
  tracks=[1,2,28,7,29,101];

  for i=1:length(tracks)
    if tracks(i) < 100
      [Bx,By,Bz,X,Y,Z] = prepData(tracks(i),rplanet);
      sat = 'Galileo';
      nr = tracks(i);
    else 
      [Bx,By,Bz,X,Y,Z] = prepData(tracks(i),rplanet);
      sat = 'Juno';
      nr = tracks(i)-100;
    end
    
    xi = Y;
    eta = -X;
    zeta = Z;
    
    [phi,lat,rad]=cart2sph(xi,eta,zeta);

    % Remove above maxalt km above rplanet
    %indx = (rad <= rplanet+maxalt);
    %phi=phi(indx); lat = lat(indx); rad = rad(indx);
    
    dlmwrite(fullfile('exportedTracks',sprintf('%s%d.txt',sat,nr)),[180*phi(:)/pi, 180*lat(:)/pi, rad-rplanet] )
    
  end


  
  % Juno = load(fullfile('..','SpiceKernels','Juno','JunoGanymede_2021_06_07.txt'));

  % X = Juno(:,1);
  % Y = Juno(:,2);
  % Z = Juno(:,3);

  % % Need to figure out...
  % xi = Y;
  % eta = -X;
  % zeta = Z;

  % % Spice Kernel coordinates are typically the standard SPRH coordinate system. So should not need to change
  
  % %[phi,lat,rad]=cart2sph(X,Y,Z);
  % [phi,lat,rad]=cart2sph(xi,eta,zeta);

  % % Remove above maxalt km above rplanet
  % %indx = (rad <= rplanet+maxalt);
  % %phi=phi(indx); lat = lat(indx); rad = rad(indx);
  
  % dlmwrite(fullfile('exportedTracks','Juno-June2021.txt'),[180*phi(:)/pi, 180*lat(:)/pi, rad-rplanet] )
