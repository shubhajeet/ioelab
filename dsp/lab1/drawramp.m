#!/bin/octave
figure()
x = -5:5 ;
y = ramp(x);
stem(x,y);
title("Ramp");
xlabel("Step");
ylabel("Value");
print -dpng "ramp.png";
