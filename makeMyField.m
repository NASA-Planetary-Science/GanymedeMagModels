function makeMyField(g10,Lmax,filename,tracks,relweights)
  % makeMyField(g10,Lmax,filename)
  %
  % Example:
  %
  % makeMyField(-700,3,'Lmax_3_g10_-700_allGalileoTracks',[1,2,28,7,29])
  % or
  % makeMyField(-700,3,'Lmax3_g10_-700_JunoAndAllGalileo',[1,2,28,7,101],[1,1,1,1,1])
  % or 
  % makeMyField([],3,'Lmax3_JunoAndAllGalileo',[1,2,28,7,101],[1,1,1,1,1])
  %
  % Calculates a magnetic field model for Ganymede given a maximum
  % spherical-harmonic degree Lmax and a choice for g10. Try for
  % example g10 = -700
  %
  % You also need to provide a filename as which the coefficients
  % will be saved
  %
  % You can choose which tracks to use. Track 101 is Juno's first track
  % From June 07, 2021
  %
  % The saved coefficients are normalized in the same way as the
  % coefficients published by Kivelson (fully normalized, with a
  % factor 2), because they used the cartesian formulation.
  %
  % The uniform field values are also saved in the coefficients. They
  % are ordered by tracks as is set in the variable "tracks" in this
  % function. For each track the order of the uniform field values is
  % X, Y, Z. So you have G1 X, G1 Y, G1 Z, G2 X, G2 Y, etc
  %
  % Last modified by plattner-at-alumni.ethz.ch, 02/08/2022

  defval('tracks',[1,2,28,7,29,101]);
  defval('relweights',ones(size(tracks)))

  rplanet = 2631.2;


  if g10
    [coefs,~,~,~] = invSkipCoefSubMoreTracks(Lmax,g10*rplanet,true,tracks,relweights);
  else
    [coefs,~,~,~] = invMoreTracks(Lmax,true,tracks,relweights);
  end
  
  % The spherical-harmonic coefficients still have the planet's radius in them.
  % To have the same normalization as Kivelson, need to divide this out
  cf = coefs(1:(Lmax+1)^2-1)/rplanet;
  coefs(1:(Lmax+1)^2-1) = cf;
  % Save the coefficients
  writematrix(coefs,fullfile('coefs',[filename,'_coefs']))
  
  % Export the spatial field for GMT to plot
  exportThisField(cf,[filename,'_field']);

  % Write out data for data comparison in GMT plot
  exportTracks = tracks; % You can change for which tracks you want to export
  % This could be different from the tracks for which you calculated the field
  exportSimData(coefs, tracks, [filename,'_simData'], exportTracks);

  % Write out the power spectrum and print the source depth
  writeSpec(coefs(1:(Lmax+1)^2-1),[filename,'_spec'])
  
