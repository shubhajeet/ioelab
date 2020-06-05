#!/bin/octave
pkg load signal;

b = [0.0018 0.0073 0.011 0.007 0.008];
a = [1 -3.0544 3.8291 -2.2925 0.55072];

[z p k] = tf2zp(b,a);
"zeros"
for i = 1:numel(z)
  z(i)
endfor

"ploes"
for i = 1:numel(p)
  p(i)
endfor

figure();
plot(z,'o');
hold on;
plot(p,'x');
title("Poles and Zeros of the system")
xlabel("real axis");
ylabel("complex axis")
print -dpng "poleZero2.png" ;

"Second order section"
for i = 1:2:numel(z)
  [sos,k] = zp2sos(z(i:i+1),p(i:i+1));
  sos
endfor

figure();
W = -pi:pi/1001:pi;
[H, w] = freqz(b,a,W);
subplot(2,1,1);
mag = 20 * log(abs(H));
plot(w,mag);
xlabel("frequency");
ylabel("magnitude in db");
title("Frequency response");
subplot(2,1,2);
plot(w,angle(H));
xlabel("frequency");
ylabel("phase");
title("Frequency respose");
print -dpng "frespnse2.png" ;
