#!/bin/octave
X1 = [1 1 1 1 1];
n1 = -2:2;
X2 = [1 0 0 0 0 0 0 0 0 0];
n2 = -4:5;
nmin = min(min(n1),min(n2));
n= nmin:nmin+length(n1)+length(n2)-2;
product = X1' .* X2
size = length(n);
y = zeros(1,size);
sX1 = length(X1);
sX2 = length(X2);
shift = zeros(1,size);
for i = 1:sX1
  y(i:i+sX2-1) = y(i:i+sX2-1) + product(i,:)
end
#y = conv(X1,X2)

stem(n,y)
title("Convolution product")
xlabel("Step")
ylabel("Value")
print -dpng "Conv1.png"
