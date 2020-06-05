#!/bin/octave
pkg load signal;

s1b = 0.104948 .* [1 1 0];
s1a = [1 -0.790103 0];
s1 = [s1b s1a]
s2b = [0.102450 -0.007817 0.102232];
s2a = [1 -1.51723 0.714088];
s2 = [s2b s2a]
s3b = [0.420100 -0.399842 0.419864];
s3a = [1 -1.0421773 0.861895];
s3 = [s3b s3a]
s4b = [0.714929 -0.8267432 0.71484];
s4a = [1 -1.387447 0.962242];
s4 = [s4b s4a]
s = [s1;
     s2;
     s3;
     s4]
strunc = ceil(s*1000)./1000

hold on;
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
print -dpng "frespnsenon4.png" ;

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
print -dpng "frespnsenontruc4.png" ;

[z, p, k] = sos2zp(s);

figure()
hold on;
plot(z,'o');
plot(p,'x');
title("Poles and Zeors of the equation");
xlabel("real axis");
ylabel("complex axis");
print -dpng "poleZeros4.png"

[z, p, k] = sos2zp(strunc);

figure()
hold on;
plot(z,'o');
plot(p,'x');
title("Poles and Zeors of the trunc equation");
xlabel("real axis");
ylabel("complex axis");
print -dpng "poleZerostrunc4.png"
