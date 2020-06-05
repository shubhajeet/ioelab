function [x t] = x(start,stop,del)
  %returns 1 between 2 and 8
  t = start:del:stop;
  x = (t <= 8 & t >= 2);
end
