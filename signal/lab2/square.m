function x = square(t)
T = 9;
t = rem(abs(t),T);
x = [t >=7 | t<=2];
end