#!/bin/octave
figure()
x = -5:0.01:5;
n = 5;
y = sumharm(x,3*pi,n);
plot(x,y);
title("harmonics");
xlabel("Step");
ylabel("Value");
print -dpng "harmonics.png";
