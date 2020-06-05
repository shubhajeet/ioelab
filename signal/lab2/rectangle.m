function [x] = rectangle(t)
  T = 4;
  t = rem(abs(t),T);
  x = [t <=1 | t>=3];  
end

