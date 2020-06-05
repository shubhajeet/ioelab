function [x,t] = x1(start, stop, del)
                                %returns 1 for t in range 0 to 5
  t = start:del:stop;
  x = (t <= 5 & t >= 0);
end
