#!/bin/octave
y = unit(x);
stem(x,y);
title("Unit");
xlabel("Step");
ylabel("Value");
print -dpng "unit.png";
