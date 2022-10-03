function splitCoef()
  % Writes out the Schmidt coefficients split into their degrees for plotting
  % in the uncertainty figure

  modlist = {'Lmax1','Lmax2','Lmax3'};

  modindlist = {'Lmax1_indhigh','Lmax1_indlow','Lmax1_indsimple','Lmax2_indhigh','Lmax2_indlow','Lmax2_indsimple','Lmax3_indhigh','Lmax3_indlow','Lmax3_indsimple'};

  modl = [1,2,3];

  modindl = [1,1,1,2,2,2,3,3,3];

  % first only the coef without induced fields
  L1m0 = [];
  Lrest = [];
  
  for i=1:length(modlist)
    [coef,lmcosi] = SchmidtCoef(modlist{i},modl(i));

    L1m0 = [L1m0;[0,coef(2)]];

    Lrest = [Lrest;[(1:2)',coef(3:4)]];
    
    if modl(i) >= 2
      Lrest = [Lrest;[(3:7)',coef(5:9)]];
    else
      Lrest = [Lrest;[(3:7)',zeros(5,1)]];
    end

    if modl(i) >= 3
      Lrest = [Lrest;[(8:14)',coef(10:16)]];
    else
      Lrest = [Lrest;[(8:14)',zeros(7,1)]];
    end
      
  end

  dlmwrite(fullfile('coefs','split_L1m0.txt'), L1m0);
  dlmwrite(fullfile('coefs','split_Lrest.txt'), Lrest);


  %% Now for the coef including induced fields
  L1m0 = [];
  Lrest = [];
  
  for i=1:length(modindlist)
    [coef,lmcosi] = SchmidtCoef(modindlist{i},modindl(i));

    L1m0 = [L1m0;[0,coef(2)]];

    Lrest = [Lrest;[(1:2)',coef(3:4)]];
    
    if modindl(i) >= 2
      Lrest = [Lrest;[(3:7)',coef(5:9)]];
    else
      Lrest = [Lrest;[(3:7)',zeros(5,1)]];
    end

    if modindl(i) >= 3
      Lrest = [Lrest;[(8:14)',coef(10:16)]];
    else
      Lrest = [Lrest;[(8:14)',zeros(7,1)]];
    end
      
  end

  dlmwrite(fullfile('coefs','split_ind_L1m0.txt'), L1m0);
  dlmwrite(fullfile('coefs','split_ind_Lrest.txt'), Lrest);
  
