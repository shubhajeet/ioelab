t = -5:0.01:5;
x = signal(t);

[x1, t1] = trans(x,t,1,-2.5,0.01);

subplot(3,1,1);
plot(t1,x1);
xlabel('time');
ylabel('x(t)');
title('x(t+2.5)');

subplot(3,1,2);
[x2, t2] = trans(x,t,-0.75,-7,0.01);
plot(t2,x2);
xlabel('time');
ylabel('x(t)');
title('x(-0.75t+7)');

subplot(3,1,3);
[x3, t3] = trans(x,t,1.6,4,0.01);
plot(t3,x3);
xlabel('time');
ylabel('x(t)');
title('x(1.6t-4)');
