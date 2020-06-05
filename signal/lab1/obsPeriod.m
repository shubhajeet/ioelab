function obsPeriod()
t = [-6*pi:0.01:6*pi];

x1 = 2 .* cos(pi*t/3);
x2 = 3 .* cos(2*pi*t/9);
x3 = x1 + x2;

subplot(3,1,1);
plot(t,x1);
title('x1 = 2 * cos(pi*t/3)');
xlabel('time');
ylabel('x1');

subplot(3,1,2);
plot(t,x2);
title('x2 = 3 * cos(2pi*t/9)');
xlabel('time');
ylabel('x2');

subplot(3,1,3);
plot(t,x3);
title('x3 = x1 + x2');
xlabel('time');
ylabel('x3');
end