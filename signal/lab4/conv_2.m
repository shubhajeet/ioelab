del = 0.01;
[f1 t1] = h(-10,3,del);
subplot(3,1,1);
plot(t1,f1);
title(' signal h(t) 070BEX443');
xlabel('time');
ylabel('value of h(t)');

[f2 t2] = x(0,10,del);
subplot(3,1,2);
plot(t2,f2);
xlabel('time');
ylabel('value of x');
title(' signal x(t) 070BEX443');

[y t] = convolve(f1,t1,f2,t2,del);
subplot(3,1,3);
plot(t,y);
xlabel('time');
ylabel('value of h*x');
title(' signal convolution of h(t) and x(t) 070BEX443');

print -dpng conv_2.png;