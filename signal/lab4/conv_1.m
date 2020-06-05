del = 0.01;
[f1 t1] = x1(-3,8,del);
subplot(3,1,1);
plot(t1,f1);
title(' signal x1 070BEX443');
xlabel('time');
ylabel('value of x1');

[f2 t2] = x2(-3,13,del);
subplot(3,1,2);
plot(t2,f2);
xlabel('time');
ylabel('value of x2');
title(' signal x2 070BEX443');

[y t] = convolve(f1,t1,f2,t2,del);
subplot(3,1,3);
plot(t,y);
xlabel('time');
ylabel('value of x1*x2');
title(' signal convolution of x1 and x2 070BEX443');
print -dpng conv_1.png;