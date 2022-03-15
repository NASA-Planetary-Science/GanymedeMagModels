function [data,time] = importData(filename)
  % data =  Bx, By, Bz, Babs, X, Y, Z
  % time: can use month(time) or hour(time) or second(time)
  
  dataIAU = readtable(filename,'Delimiter','\t');
  time = datetime(dataIAU.Var1, 'Format', 'yyyy-MM-dd''T''HH:mm:ss.SSS');
  data = [dataIAU.Var2, dataIAU.Var3, dataIAU.Var4, dataIAU.Var5, dataIAU.Var6, dataIAU.Var7, dataIAU.Var8];

  
