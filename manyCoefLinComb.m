function manyCoefLinComb()
  
  facs = 0:0.025:1;
  %facs = 1;
  Lmax = 2;
  tracks=[1,2,7,8,28,29,101];
  %if strcmp(wht,'doit')

        % Condon Shortley
        [~,~,~,~,~,~,bigm] = addmon(Lmax);
        csphase = (-1).^bigm;
  
    for i=1:length(facs)
      
      %outname = sprintf('LinComb_fac%gpc',round(facs(i)*100));
      %if facs(i)==1
        % We only go to degree 2 if the factor for Lmax3 is zero
      %  coefLinComb('Lmax2','Lmax3',facs(i),outname);
      %else
      %  coefLinComb('Lmax2exp','Lmax3',facs(i),outname);
      %end
      % Wrote it such that it is always between Lmax=2 and Lmax=3
      coefs = coefLinComb(facs(i),tracks);

     rmse = getRMS(coefs, Lmax, tracks);
     rmsval(i) = rms(rmse(:)); 

     % Get Q/D
     fac = 2;
     coefSch = [0;coefs(1:(Lmax+1)^2-1)]*fac;
     coefSch = Simons2Olsen(coefSch);
     coefSch = coefSch.*csphase;
     D = 2*sum(coefSch(2:4).^2);
     Q = 3*sum(coefSch(5:9).^2);
     QD(i) = Q/D*(1/0.25)^2;

 
      
    end

    writematrix([facs(:),QD(:),rmsval(:)],'linCombResults.txt')

  % elseif strcmp(wht,'showspecs')

  %   rs = [965,954,942,930,917,905,892,879,866,853,840,826,812,797,783,768,753,737,721,705,688,671,654,635,617,597,577,557,535,512,489,464,438,409,379,346,310,268,219,155,182];
  %   % I got these from reading of the files from the output of 'doit';
    
  %   for i=1:length(facs)
  %     specname = fullfile('specs',sprintf('LinComb_fac%gpc_spec_rs_%dkm.txt',round(facs(i)*100),rs(i)));

  %     spec = load(specname);

  %     semilogy(spec(:,1),spec(:,2))
  %     hold on
  %   end
  %   hold off

  % elseif strcmp(wht,'calcrmse')

  %   rs = [965,954,942,930,917,905,892,879,866,853,840,826,812,797,783,768,753,737,721,705,688,671,654,635,617,597,577,557,535,512,489,464,438,409,379,346,310,268,219,155,182];
  
  %   % I got these from reading of the files from the output of 'doit';
    
  %   for i=1:length(facs)
  %     outname = sprintf('LinComb_fac%gpc',round(facs(i)*100));
  %     rmse = getRMSE(outname);
  %     rmsval(i) = rms(rmse(:));
  %   end
  %   writematrix([facs(:),rs(:),rmsval(:)],'linCombResults.txt')

  %   scatter(facs, rs, [], rmsval,'filled')
  %   c=colorbar;
  %   xlabel('fraction of Lmax=2');
  %   ylabel('source radius [km]');
  %   ylabel(c,'rmse [nT]')
  %   print('LinCombFig.pdf'  ,'-dpdf', '-bestfit')
    
      
  % end
    
