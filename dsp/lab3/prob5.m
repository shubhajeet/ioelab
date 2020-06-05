#!/bin/octave
pkg load signal;

s1b = [0.287 -0.447 0];
s1a = [1 -1.297 0.695];
s1 = [s1b s1a];
s2b = [-2.143 1.145 0];
s2a = [1 -1.069 0.370];
s2 = [s2b s2a];
s3b = [1.856 -0.630 0];
s3a = [1 -0.997 0.257];
s3 = [s3b s3a];
s = [s1; s2; s3];

strunc = ceil(s*100)/100;

figure()
[a, b] = sos2tf(s)
W = -pi:pi/100:pi;
[H,w] = freqz(b,a,W);
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
print -dpng "frespnsenon5.png" ;

figure()
[a, b] = sos2tf(strunc)
W = -pi:pi/100:pi;
[H,w] = freqz(b,a,W);
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
print -dpng "frespnsenontruc5.png" ;


[z, p, k] = sos2zp(s);

figure()
hold on;
plot(z,'o');
plot(p,'x');
title("Poles and Zeors of the equation");
xlabel("real axis");
ylabel("complex axis");
print -dpng "poleZeros5.png"

[z, p, k] = sos2zp(strunc);

figure()
hold on;
plot(z,'o');
plot(p,'x');
title("Poles and Zeors of the trunc equation");
xlabel("real axis");
ylabel("complex axis");
print -dpng "poleZerostrunc5.png"
