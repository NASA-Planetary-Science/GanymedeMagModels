function rmse=getRMSE(model,tracks)
  % rmse = getRMS(model,tracks)
  %
  % After exportSimData for all tracks, you can run this function
  % to calculate the RMS error
  %
  % Also calculate velocity


  defval('tracks',[1,2,28,7,8,29,101]);

  rmse = nan(3,length(tracks));

  for i=1:length(tracks)

    if tracks(i)<100 % Galileo data

      % BX
      data = readtable(fullfile('data','GalileoData',sprintf('G%d_BX.txt',tracks(i))),'delimiter','\t');
      sim = readtable(fullfile('data',[model,'_simData'],sprintf('G%d_BX_sim.txt',tracks(i))),'delimiter','\t');
      rmse(1,i) = rms(data.Bx - sim.Var2);


      % BY
      data = readtable(fullfile('data','GalileoData',sprintf('G%d_BY.txt',tracks(i))),'delimiter','\t');
      sim = readtable(fullfile('data',[model,'_simData'],sprintf('G%d_BY_sim.txt',tracks(i))),'delimiter','\t');
      rmse(2,i) = rms(data.By - sim.Var2);

      % BZ
      data = readtable(fullfile('data','GalileoData',sprintf('G%d_BZ.txt',tracks(i))),'delimiter','\t');
      sim = readtable(fullfile('data',[model,'_simData'],sprintf('G%d_BZ_sim.txt',tracks(i))),'delimiter','\t');
      rmse(3,i) = rms(data.Bz - sim.Var2);
   
    else  % Juno data

       % BX
      data = readtable(fullfile('data','JunoData',sprintf('J%d_BX.txt',tracks(i)-100)),'delimiter','\t');
      sim = readtable(fullfile('data',[model,'_simData'],sprintf('G%d_BX_sim.txt',tracks(i))),'delimiter','\t');
      rmse(1,i) = rms(data.Bx - sim.Var2);


      % BY
      data = readtable(fullfile('data','JunoData',sprintf('J%d_BY.txt',tracks(i)-100)),'delimiter','\t');
      sim = readtable(fullfile('data',[model,'_simData'],sprintf('G%d_BY_sim.txt',tracks(i))),'delimiter','\t');
      rmse(2,i) = rms(data.By - sim.Var2);

      % BZ
      data = readtable(fullfile('data','JunoData',sprintf('J%d_BZ.txt',tracks(i)-100)),'delimiter','\t');
      sim = readtable(fullfile('data',[model,'_simData'],sprintf('G%d_BZ_sim.txt',tracks(i))),'delimiter','\t');
      rmse(3,i) = rms(data.Bz - sim.Var2);

      
      
    end


  end
