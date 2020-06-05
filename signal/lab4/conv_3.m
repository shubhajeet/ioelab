del = 1;
[f1 t1] = xn(-3,7);
subplot(3,1,1);
stem(t1,f1);
title('signal x[n] 070BEX443');
xlabel('step');
ylabel('value of x[n]');

[f2 t2] = yn(-3,10);
subplot(3,1,2);
stem(t2,f2);
xlabel('step');
ylabel('value of y[n]');
title('signal y[n] 070BEX443');

[y t] = convolve(f1,t1,f2,t2,del);
subplot(3,1,3);
stem(t,y);
xlabel('step');
ylabel('value of x[n]*y[n]');
title('signal convolution of x[n] and y[n] 070BEX443');
print -dpng conv_3.png;