#!/bin/octave
pkg load signal;

b = [0.0663, 0.1989, 0.1989, 0.0663];
a = [1, -0.9349, 0.5668, -0.1015];

figure();
W = -pi:pi/100:pi;
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
print -dpng "frespnse1.png" ;

maxMag = max(mag)-3;
w(maxMag<=mag)(1)

figure();
h = ifft(H);
stem(h);
xlabel("step");
ylabel("magnitude");
title("impulse response");
print -dpng "imprespnse1.png" ;

figure();
subplot(2,1,1);
x = [1 2 3 1 0 0 0 1 2 3 1];
X = fft(x);
mag = 20 * log(abs(X));
w = [-pi:2*pi/(numel(mag)-1):pi];
plot(w,mag);
xlabel("frequency");
ylabel("magnitude in db");
title("Input Frequency response");
subplot(2,1,2);
plot(w,angle(X));
xlabel("frequency");
ylabel("phase");
title("Input Frequency respose");
print -dpng "infrespnse1.png" ;

figure();
y = conv(x,h);
stem(y);
xlabel("output step");
ylabel("magnitude");
title("response of x[n]");
print -dpng "respnse1.png";

figure();
Y = fft(y);
subplot(2,1,1);
mag = 20 * log(abs(Y));
w = [-pi:2*pi/(numel(mag)-1):pi];
plot(w,mag);
xlabel("frequency");
ylabel("magnitude in db");
title("Output Frequency response");
subplot(2,1,2);
plot(w,angle(Y));
xlabel("frequency");
ylabel("phase");
title("Output Frequency respose");
print -dpng "outfrespnse1.png" ;

figure();
y = filter(b,a,x);
stem(y);
xlabel("step");
ylabel("magnitude");
title("filter response of x[n]");
print -dpng "respnsefilter1.png" ;

figure();
Y = fft(y);
subplot(2,1,1);
mag = 20 * log(abs(Y));
w = [-pi:2*pi/(numel(mag)-1):pi];
plot(w,mag);
xlabel("frequency");
ylabel("magnitude in db");
title("Frequency response");
subplot(2,1,2);
plot(w,angle(Y));
xlabel("frequency");
ylabel("phase");
title("Frequency respose");
print -dpng "outfrespnsefilter1.png" ;

figure();
x = [1 2 3 1 0 0 0 1 2 3 1];
filpx = fliplr(x)
y = filter(b,a,filpx);
stem(y);
xlabel("step");
ylabel("magnitude");
title("response of x[n]");
print -dpng "respnsefilterflip1.png" ;

figure();
Y = fft(y);
subplot(2,1,1);
mag = 20 * log(abs(Y));
plot(w,mag);
xlabel("frequency");
ylabel("magnitude in db");
title("Fliped output Frequency response");
subplot(2,1,2);
plot(w,angle(Y));
xlabel("frequency");
ylabel("phase");
title("Fliped output Frequency respose");
print -dpng "outfrespnsefilterflip1.png" ;

figure();
title("Cross Correaltion between input and its flip sequence")
R = xcorr(x,filpx)
plot(R)
print -dpng "correlation1.png" ;
