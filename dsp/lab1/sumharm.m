#!/bin/octave
function y = sumharm(t,w,n)
  no = 1:n;
  fn =sin(no'*w.*t)
  y = sum(fn,1);
end

