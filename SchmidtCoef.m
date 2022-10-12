function [coef,lmcosi] = SchmidtCoef(model,Lmax)
  % [coef,lmcosi] = SchmidtCoef(model,Lmax)
  %
  % Writes out the Schmidt semi-normalized coefficients for a chosen
  % model and its maximum spherical-harmonic degree

  if isstr(model)
    coefs = load(fullfile('coefs',[model,'_coefs.txt']));
  else
    coefs = model;
  end
    
  coef = coefs(1:(Lmax+1)^2-1,:);
  clear coefs;

  fac = 2; % The factor between fully normalized spherical-harmonics
  % and the normalization used by Kivelson et al. (2002)

  %keyboard
  coef = [zeros(1,size(coef,2));coef]*fac;
  for i=1:size(coef,2)
    coef(:,i) = Simons2Olsen(coef(:,i));
  end
  
  % Do I need to include the Condon Shortley phase??? Or is it just
  % negative? g10 definitely needs to be negative... But g10 is not
  % affected by the Condon Shortley phase... Condon shortley is by
  % default excluded... Let's see if my codes include them... In rGvec
  % I have a "phase shift" for the longitudinal component. This is the
  % same as multiplying with (-1)^m. I do this before feeding the
  % locations into cos(m*phi) or sin(m*phi). So in my codes, I have
  % the condon-shortley phase built in. Because it seems to not be the
  % standard in Geomag (check some more papers). In Blakely 1996
  % "Potential Theory in Gravity & Magnetic Applciations" I found on
  % page 166 that "P_1^1(\theta) = sin(\theta)". This is the case
  % without the Condon-Shortley phase. Checking, this holds
  % in the definition of P in rGvec, but before then, we do the phase
  % shift. So our coefficients have the Condon-Shortley phase, but
  % geomag shouldn't. 

  
  % Undoing the Condon-Shortley phase
  [~,~,~,~,~,~,bigm] = addmon(Lmax);
  csphase = (-1).^bigm;

  for i=1:size(coef,2)
    %keyboard
    coef(:,i) = coef(:,i).*csphase;
  end

  if size(coef,2)==1
    lmcosi = coef2lmcosi(coef,0);
  else
    lmcosi = [];
  end
