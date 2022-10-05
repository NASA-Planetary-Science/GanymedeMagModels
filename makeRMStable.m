function vals=makeRMStable()

  indname={'high','low','simple'};

  vals=nan(3,3);

  tracks=[1,2,7,8,28,29,101];
  
  for Lmax=1:3

    for ind=1:3

      coefs=load(fullfile('coefs',sprintf('Lmax%d_ind%s_coefs.txt',Lmax,indname{ind})));
      vals(Lmax,ind)= getRMSind(coefs,Lmax,tracks,indname{ind});
      
    end

  end
  
    



  
