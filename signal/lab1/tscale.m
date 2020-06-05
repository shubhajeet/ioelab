% time scale x(t) -> x(alph*t)
function [x1,t1] = tscale (x,t,alph,del)
  t1 = min(t)/alph : del/alph : max(t) / alph;
  x1 = x;
end
