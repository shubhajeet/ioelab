#!/bin/octave
figure()
x = -5:0.01:5;
n = 5;
y = sumharm(x,2*pi/10,n);
plot(x,y);
title("harmonics");
xlabel("Step");
ylabel("Value");
print -dpng "harmonics.png";
