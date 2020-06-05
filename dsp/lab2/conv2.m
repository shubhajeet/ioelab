#!/bin/octave
n1 = 0:6
x = n1 ./ 3;
n2 = -2:2
h = n2 >= -2 & n2 <= -2
y = conv(x,h)
nmin = min(min(n1),min(n2))
n= nmin:nmin+length(n1)+length(n2)-2
stem(n,y)
title("Convolution product of 2a")
xlabel("Step")
ylabel("Value")
print -dpng "Conv2a.png"
