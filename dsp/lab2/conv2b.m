#!/bin/octave
n1 = -2:4
x = n1 >= 0;
n2 = -2:2
a = 1
h = n2 >= 0 .* exp(-a.*n2)
y = conv(x,h)
nmin = min(min(n1),min(n2))
n= nmin:nmin+length(n1)+length(n2)-2
stem(n,y)
title("Convolution product of 2b")
xlabel("Step")
ylabel("Value")
print -dpng "Conv2b.png"
