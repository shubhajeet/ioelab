function [xn, n] = xn(start,stop)
  %return xn and n
  n = start:stop;
  xn = (n >= 0 & n <= 4); 
end
  
