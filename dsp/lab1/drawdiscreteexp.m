#!/bin/octave
figure()
x = -5:5;
y = discreteexp(x,2,pi);
stem(x,y);
title("discrete expotential");
xlabel("Step");
ylabel("Value");
print -dpng "discreteexp.png";
