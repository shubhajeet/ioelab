#!/bin/octave
figure()
x = -5:5 ;
y = rect(x/2);
stem(x,y);
title("Rect");
xlabel("Step");
ylabel("Value");
print -dpng "rect.png";
