function showModelDifference(model1, Lmax1, model2, Lmax2)
  % showModelDifference(model1, Lmax1, model2, Lmax2)
  %
  % Calculates and exports the spatial difference between model1 and
  % model2 at satellite altitude. Model names without "coef" at the
  % end. Must also provide the maximum spherical-harmonic degree of
  % each model.
  %
  % For example:
  %
  % showModelDifference('Lmax2_manycoefs',2,'Lmax3_manycoefs',3)
  %
  % Last modified by plattner-at-alumni.ethz.ch, 02/14/2022

  alts = [0,800,2000];

  rplanet = 2631.2;

  %coefs1 = load(fullfile('coefs',[model1,'_coefs.txt']));
  %coefs2 = load(fullfile('coefs',[model2,'_coefs.txt']));

  cmat1 = load(fullfile('coefs',model1));
  coefs1 = mean(cmat1.cfmat,2);

  cmat2 = load(fullfile('coefs',model2));
  coefs2 = mean(cmat2.cfmat,2);  

  cf1 = zeros( (max(Lmax1,Lmax2) +1)^2-1 ,1);
  cf1(1:(Lmax1+1)^2-1) = coefs1(1:(Lmax1+1)^2-1);

  cf2 = zeros( (max(Lmax1,Lmax2) +1)^2-1 ,1);
  cf2(1:(Lmax2+1)^2-1) = coefs2(1:(Lmax2+1)^2-1);

  cf = cf1 - cf2;

  for i=1:length(alts)
    fname = [model1,'_minus_',model2,sprintf('_alt%g_field',alts(i))]
    exportThisField(cf,fname,alts(i))
  end
