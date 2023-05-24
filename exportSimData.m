function exportSimData(coefs,tracks,foldername,trExport)
  % exportSimData(coef,tracks,foldername,trExport)
  %
  % coef        including the values for the uniform field
  % tracks      the tracks for wich the uniform field is provided
  % foldername  name of folder into which to write the result
  % trExport    which tracks to export
  %
  % The coefs saved in the coef folder may not contain the uniform field
  % You can easily recalculate them:
  % [coefs,dtr,dtrc,rmstr] = invSkipCoefSubMoreTracks(3,-700*2631.2,true,[1,2,28,7,29]);
  %Only issue is that the first (L+1)^2-1 need to be divided by rplanet, but the remainder don't need to
  % coefs(1:(Lmax+1)^2-1) = coefs(1:(Lmax+1)^2-1)/rplanet
  % Then use these for exportSimData
  
  rplanet = 2631.2;
  fact=-2;

  
  SphMat = [];
  d=[];
  dAddBack=[];

  Lmax = sqrt((length(coefs) - 3*length(tracks))+1) -1;

  cf = coefs(1:end-3*length(tracks))*rplanet;
  UFvals = coefs(length(cf)+1:end);

  mkdir(fullfile('data',foldername))
  
  for tr = trExport
    
    
    [starttime,endtime,~,~,~,~] = getTimeJupLinear(tr);
    if tr < 100
      filename = sprintf('GalileoData/ORB%02d_GAN_IAU.txt',tr);
      [data,time] = importData(filename);
    else
      filename = sprintf('JunoData/ORB%03d_GAN_IAU.TAB',tr);
      [data,time] = importJunoData(filename);
    end
    index = time >= starttime & time <= endtime;
    time = time(index);

    [Bx,By,Bz,X,Y,Z] = prepData(tr,rplanet);
    rGcart = evalSpHarm(X, Y, Z, rplanet, Lmax, fact, true((Lmax+1)^2-1, 1));
    
    dcalc = rGcart'*cf;

    % Add the uniform field back in
    ind = find(tracks==tr);

    UBX = UFvals(3*(ind-1)+1);
    UBY = UFvals(3*(ind-1)+2);
    UBZ = UFvals(3*(ind-1)+3);

    BXsim = dcalc(1:length(X));
    BYsim = dcalc(length(X)+1:2*length(X));
    BZsim = dcalc(2*length(X)+1:end);

    filename = sprintf('G%d_BX_sim',tr);
    fname = fullfile('data',foldername,[filename,'.txt']);
    writetable(table(time,BXsim+UBX),fname,'delimiter','\t')
    
    filename = sprintf('G%d_BY_sim',tr);
    fname = fullfile('data',foldername,[filename,'.txt']);
    writetable(table(time,BYsim+UBY),fname,'delimiter','\t')

    filename = sprintf('G%d_BZ_sim',tr);
    fname = fullfile('data',foldername,[filename,'.txt']);
    writetable(table(time,BZsim+UBZ),fname,'delimiter','\t')
    


    
  end
