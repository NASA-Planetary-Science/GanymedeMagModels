function Muftot = prepareUFmatrix(Bx, By, Bz, datlen)

  Muftot = [];
  ntr = length(Bx);

  for i=1:ntr

    Mufx = repmat([1,0,0],length(Bx{i}),1);
    Mufy = repmat([0,1,0],length(By{i}),1);
    Mufz = repmat([0,0,1],length(Bz{i}),1);
    
    if i>1
      Zerolen = 3*sum(datlen(1:i-1));
      MufZero1 = zeros(Zerolen,3);
    else
      MufZero1 = [];
    end
    
    if i<ntr
      Zerolen = 3*sum(datlen(i+1:end));
      MufZero2 = zeros(Zerolen,3);
    else
      MufZero2 = [];
    end
    
    Muf{i} = [MufZero1;Mufx;Mufy;Mufz;MufZero2];
    
    Muftot = [Muftot, Muf{i}];
    
  end
  
