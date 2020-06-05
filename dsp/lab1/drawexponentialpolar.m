#!/bin/octave

subplot(2,1,1);
t= -5:0.01:5;
y = exponentialpolar(t,0,4*pi,pi);
plot(t,real(y));
title("expotential with r 0");
xlabel("Time");
ylabel("Real Value");
subplot(2,1,2);
plot(t,imag(y));
title("expotential with r 0");
xlabel("Time");
ylabel("Imag Value");
print -dpng "exppolar.png";

subplot(2,1,1);
t= -5:0.01:5;
y = exponentialpolar(t,1,4*pi,pi);
plot(t,real(y));
title("expotential with r +ve");
xlabel("Time");
ylabel("Real Value");
subplot(2,1,2);
plot(t,imag(y));
title("expotential with r +ve");
xlabel("Time");
ylabel("Imag Value");
print -dpng "expr+.png";

subplot(2,1,1);
y = exponentialpolar(t,-1,4*pi,pi);
plot(t,real(y));
title("expotential with r -ve");
xlabel("Time");
ylabel("Real Value");
subplot(2,1,2);
plot(t,imag(y));
title("expotential with r -ve");
xlabel("Time");
ylabel("Imag Value");
print -dpng "expr-.png";
