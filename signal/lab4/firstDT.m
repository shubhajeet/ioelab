function [] = firstDT (a)
  %system is defined by its frequency response
  %H(jw) = 1/(1-a)
  
  num = [1]; %coefficient vector in numerator of H(jw)
  den = [1 -a]; %coefficient vector in denominator of H(jw)
  figure,freqz(num,den); %plots frequency response
  title(sprintf('frequency response of first order system with a %f 070BEX443',a));
sys = tf(num,den);
  filename = sprintf('fresponse1stDT%f.png',a);
  print('-dpng',filename); 
  figure,subplot(2,1,1),dimpulse(num,den); %plots impulse response
  title(sprintf('impulse response of first order system with a %f 070BEX443',a));
  subplot(2,1,2),dstep(num,den); %plots step response
  title(sprintf('step response of first order system with a %f 070BEX443',a));
  filename = sprintf('impNstepResponse1stDT%f.png',a);
  print('-dpng',filename);  
end
