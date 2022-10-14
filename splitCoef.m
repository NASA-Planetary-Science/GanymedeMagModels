function splitCoef()
  % Writes out the Schmidt coefficients split into their degrees for plotting
  % in the uncertainty figure

  modlist = {'Lmax1_manycoefs','Lmax2_manycoefs','Lmax3_manycoefs'};

  modindlist = {'Lmax1_indhigh_manycoefs','Lmax1_indlow_manycoefs','Lmax1_indsimple_manycoefs','Lmax2_indhigh_manycoefs','Lmax2_indlow_manycoefs','Lmax2_indsimple_manycoefs','Lmax3_indhigh_manycoefs','Lmax3_indlow_manycoefs','Lmax3_indsimple_manycoefs'};

  modl = [1,2,3];

  modindl = [1,1,1,2,2,2,3,3,3];

  % first only the coef without induced fields
  L1m0 = [];
  Lrest = [];
  
  for i=1:length(modlist)
    % With the manymodels, we need to load the unnormalized coefs
    cf=load(fullfile('coefs',modlist{i}));
    cfunnorm=mean(cf.cfmat,2);
    [coef,lmcosi] = SchmidtCoef(cfunnorm,modl(i));
%    [coef,lmcosi] = SchmidtCoef(modlist{i},modl(i));
    
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
    cf=load(fullfile('coefs',modindlist{i}));
    cfunnorm=mean(cf.cfmat,2);
    [coef,lmcosi] = SchmidtCoef(cfunnorm,modindl(i));
%    [coef,lmcosi] = SchmidtCoef(modindlist{i},modindl(i));

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
  
