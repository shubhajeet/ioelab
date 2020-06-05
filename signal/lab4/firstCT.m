function [] = firstCT (tau)
  %system is defined by its frequency response
  %H(jw) = (1/tau)/(jw+1/tau)
  num = [1/tau]; %coefficient vector in numerator of H(jw)
  den = [1 1/tau]; %coefficient vector in denominator of H(jw)
  figure,freqz(num,den); %plots frequency response
  title(sprintf('frequency response of first order system with tau %f 070BEX443',tau));
  filename = sprintf('fresponse1stCT%f.png',tau);
  print('-dpng',filename);
  figure,subplot(2,1,1),impulse(num,den); %plots impulse response
  title(sprintf('impulse response of first order system with tau %f 070BEX443',tau));
  subplot(2,1,2),step(num,den); %plots step response
  title(sprintf('step response of first order system with tau %f 070BEX443',tau));
  filename = sprintf('impNstepResponse1stCT%f.png',tau);
  print('-dpng',filename); 
end
