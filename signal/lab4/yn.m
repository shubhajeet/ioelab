function [yn, n] = yn(start,stop)
  %return xn and n
  n = start:stop;
  yn = (n >= 0 & n <= 6) .* 2.^n; 
end
