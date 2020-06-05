function [] = secondCT (zeta, wn)
  %system is defined by its frequency response
  %H(jw) = (wn*wn/((jw)^2+2*zeta*wn*jw+wn^2)
  num = [wn*wn]; %coefficient vector in numerator of H(jw)
  den = [1 2*zeta*wn wn*wn]; %coefficient vector in denominator of H(jw)
  figure,freqs(num,den); %plots frequency response
  title(sprintf('frequency response of second order system with zeta and wn %f %f 070BEX443',zeta,wn));
  filename = sprintf('fresponse2ndCT%f-%f.png',zeta,wn);
  print('-dpng',filename);
  figure,subplot(2,1,1),impulse(num,den); %plots impulse response
  title(sprintf('impluse response of second order system with zeta and wn %f %f 070BEX443',zeta,wn));
  subplot(2,1,2),step(num,den); %plots step response
  title(sprintf('step response of second order system with zeta and wn %f %f 070BEX443',zeta,wn));
  filename = sprintf('impNstepResponse2ndCT%f-%f.png',zeta,wn);
  print('-dpng',filename); 
end
