#!/bin/octave
n1 = -2:6
x = n1 >= 0 & n1 <= 4;
n2 = -2:7
h = n2 >= 0 & n2 <= 6.* exp(2.^n2)
y = conv(x,h)
nmin = min(min(n1),min(n2))
n= nmin:nmin+length(n1)+length(n2)-2
stem(n,y)
title("Convolution product of 3")
xlabel("Step")
ylabel("Value")
print -dpng "Conv3.png"
