function manyCoefLinComb(wht)
  
  facs = 0:0.025:1;
  %facs = 1;
  
  if strcmp(wht,'doit')
  
    for i=1:length(facs)
      
      outname = sprintf('LinComb_fac%gpc',round(facs(i)*100));
      if facs(i)==1
        % We only go to degree 2 if the factor for Lmax3 is zero
        coefLinComb('Lmax2','Lmax3',facs(i),outname);
      else
        coefLinComb('Lmax2exp','Lmax3',facs(i),outname);
      end
      
    end

  elseif strcmp(wht,'showspecs')

    %rs = [918,867,812,753,689,617,535,438,310];
    %rs = [918,905,893,880,867,853,840,826,812,798,783,768,753,738,722,705,689,671,654,636,617,598,578,557,535,513,489,464,438,410,379,346,310];
    rs = [966,954,942,930,918,905,893,880,867,853,840,826,812,798,783,768,753,738,722,705,689,671,654,636,617,598,578,557,535,513,489,464,438,410,379,346,310,269,219,155,182];
    % I got these from reading of the files from the output of 'doit';
    
    for i=1:length(facs)
      specname = fullfile('specs',sprintf('LinComb_fac%gpc_spec_rs_%dkm.txt',round(facs(i)*100),rs(i)));

      spec = load(specname);

      semilogy(spec(:,1),spec(:,2))
      hold on
    end
    hold off

  elseif strcmp(wht,'calcrmse')

    %rs = [918,867,812,753,689,617,535,438,310];
    rs = [966,954,942,930,918,905,893,880,867,853,840,826,812,798,783,768,753,738,722,705,689,671,654,636,617,598,578,557,535,513,489,464,438,410,379,346,310,269,219,155,182];
    % I got these from reading of the files from the output of 'doit';
    
    for i=1:length(facs)
      outname = sprintf('LinComb_fac%gpc',round(facs(i)*100));
      rmse = getRMSE(outname);
      rmsval(i) = rms(rmse(:));
    end
    writematrix([facs(:),rs(:),rmsval(:)],'linCombResults.txt')

    scatter(facs, rs, [], rmsval,'filled')
    c=colorbar;
    xlabel('fraction of Lmax=2');
    ylabel('source radius [km]');
    ylabel(c,'rmse [nT]')
    print('LinCombFig.pdf'  ,'-dpdf', '-bestfit')
    
      
  end
    
