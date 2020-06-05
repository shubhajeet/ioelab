function [h t] = h(start,stop,del)
  t = start:del:stop;
  h = exp(0.5.*t) .* (t <= 0);
end
