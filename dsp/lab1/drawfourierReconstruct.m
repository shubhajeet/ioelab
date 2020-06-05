#!/bin/octave
figure()
x = -5:0.01:5;
C = [1/3 1/2 1/4 1 1/4 1/2 1/3];
y = fourierReconstruct(x,C);
plot(x,y);
title("Fourier Reconstruct");
xlabel("Step");
ylabel("Value");
print -dpng "fourier.png";
