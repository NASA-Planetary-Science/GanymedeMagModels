function comparePO2IAU(track)
  % Loads the cartesian field values and coordinates of GPhiO and IAU and compares them

  fnamePO = sprintf('originalData/ORB%02d_GAN_GPHIO.TAB',track);
  [dataPO, timePO] = importData(fnamePO);
  % data: BX, BY, BZ, Babs, X, Y, Z
  
  fnameIAU = sprintf('GalileoData/ORB%02d_GAN_IAU.txt',track);
  dataIAU = readtable(fnameIAU,'Delimiter','\t');
  timeIAU = datetime(dataIAU.Var1, 'Format', 'yyyy-MM-dd''T''HH:mm:ss.SSS');
  dataIAU = [dataIAU.Var2, dataIAU.Var3, dataIAU.Var4, dataIAU.Var5, dataIAU.Var6, dataIAU.Var7, dataIAU.Var8];
  % data: Bx, By, Bz, x, y, z

  
  subplot(2,3,1)
  plot(timePO, dataPO(:,2),'-')
  hold on
  plot(timeIAU, dataIAU(:,1),'--')
  hold off
  title('Bx =? BY')

  subplot(2,3,2)
  plot(timePO, -dataPO(:,1),'-')
  hold on
  plot(timeIAU, dataIAU(:,2),'--')
  hold off
  title('By =? -BX')

  subplot(2,3,3)
  plot(timePO, dataPO(:,3),'-')
  hold on
  plot(timeIAU, dataIAU(:,3),'--')
  hold off
  title('Bz =? BZ')

  subplot(2,3,4)
  plot(timePO, dataPO(:,6),'-')
  hold on
  plot(timeIAU, dataIAU(:,5),'--')
  hold off
  title('x =? Y')

  subplot(2,3,5)
  plot(timePO, -dataPO(:,5),'-')
  hold on
  plot(timeIAU, dataIAU(:,6),'--')
  hold off
  title('y =? -X')

  
  subplot(2,3,6)
  plot(timePO, dataPO(:,7),'-')
  hold on
  plot(timeIAU, dataIAU(:,7),'--')
  hold off
  title('z =? Z')
  
  %print(sprintf('../figsForMarshall/PhiOvsIAUswitch_Track%d',track),'-dpdf')
