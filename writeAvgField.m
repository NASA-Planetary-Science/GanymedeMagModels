function writeAvgField(g10,Lmax,filename,tracks,relweights,ind)
  % writeAvgField(g10,Lmax,filename,tracks,relweights,ind)
  %
  % INPUT:
  %
  % g10          value for g10 in Kivelson normalization
  % Lmax         maximum spherical=harmonic degree
  % filename     name for model
  % tracks       which tracks to use and in what order?
  % relweights   relative weights besides max value weighting
  % ind          want to subtract an induced field? Use 'high', 'low', 'simple'
  %              or a number for alpha, or [] to not subtract an induced field
  %              before model calculation
  %
  % Loads a file with many models and writes out the average like the function
  % makeMyField did with its result
  %
  % Last modified by plattner-at-alumni.ethz.ch, 10/12/2022

  %defval('tracks',[1,2,28,7,8,29,101]);
  defval('tracks',[1,2,7,8,28,29,101]);
  defval('relweights',ones(size(tracks)))
  defval('ind',[])

  rplanet = 2631.2;

  % Load the matrix of coefficients
  load(fullfile('coefs',[filename,'.mat']))
  coefs=mean(cfmat,2);
  cf = coefs(1:(Lmax+1)^2-1);
  
  % Export the spatial field for GMT to plot
  exportThisField(cf,[filename,'_field'],0);

  % Write out data for data comparison in GMT plot
  exportTracks = tracks; % You can change for which tracks you want to export
  % This could be different from the tracks for which you calculated the field
  exportSimData(coefs, tracks, [filename,'_simData'], exportTracks);

  % Write out the power spectrum and print the source depth
  writeSpec(coefs(1:(Lmax+1)^2-1),[filename,'_spec'])
  
