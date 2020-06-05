#!/bin/octave
figure()
x= -5:0.01:5;
y = exponential(x,1,1);
plot(x,y);
title("expotential rise");
xlabel("Time");
ylabel("Value");
print -dpng "exp.png";

figure()
y = exponential(x,-1,-1);
plot(x,y);
title("inverted expotential rise");
ylabel("Value");
xlabel("Step");
print -dpng "invexpdecay.png";

figure()
subplot(2,1,1);
x= -5:0.01:5;
y = exponential(x,1,i);
plot(x,real(y));
title("expotential imag");
xlabel("Time");
ylabel("Value");
subplot(2,1,2);
plot(x,imag(y));
title("expotential imag");
xlabel("Time");
ylabel("Value");
print -dpng "expimag.png";
