function [x,t] = x2(start, stop, del)
  %returns 1 for t in range 0 to 10
  t = start:del:stop;
x = (t <= 10 & t >= 0);
end
