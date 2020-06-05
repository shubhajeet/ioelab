#!/bin/octave
n1 = -2:6
x = n1 >= 1 & n1 <= 100;
n2 = -2:7
r = 1
T = 1
h = 2.*r ./T .* sinc(n2.*2.*r./T)
y = conv(x,h)
nmin = min(min(n1),min(n2))
n= nmin:nmin+length(n1)+length(n2)-2
stem(n,y)
title("Convolution product of 4")
xlabel("Step")
ylabel("Value")
print -dpng "Conv4.png"
