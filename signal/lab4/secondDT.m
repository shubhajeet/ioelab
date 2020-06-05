function [] = secodnDT (theta,r)
  %system is defined by its frequency response
  %H(jw) = 1/(1-2rcos theta e-jw + r^2 e-j2w)
  num = [1]; %coefficient vector in numerator of H(jw)
  den = [1 -2*r*cos(theta) r*r]; %coefficient vector in denominator of H(jw)
  figure,freqz(num,den); %plots frequency response
  title(sprintf('frequency response of second order system with theta and r %f %f 070BEX443',theta,r));
  filename = sprintf('fresponse2ndDT%f-%f.png',theta,r);
  print('-dpng',filename);
  figure,subplot(2,1,1),dimpulse(num,den); %plots impulse response
  title(sprintf('impluse response of second order system with theta and r %f %f 070BEX443',theta,r));
  subplot(2,1,2),dstep(num,den); %plots step response
  title(sprintf('step response of second order system with theta and r %f %f 070BEX443',theta,r));
  filename = sprintf('impluseNstepResponse2ndDT%f-%f.png',theta,r);
  print('-dpng',filename);
  
end
