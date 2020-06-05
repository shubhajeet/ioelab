#!/bin/octave
figure()
x = -5:5 ;
y = impulse(x);
stem(x,y);
title("Impulse");
xlabel("Step");
ylabel("Value");
