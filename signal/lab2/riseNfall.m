function [x] = trapezoid(t)
T = 6;
t = rem(abs(t),T);
x = [t>=5 | t<=1] + [t>4 & t<5] .* (t-4) + [t>1 & t<2] .* (-t+2);
end