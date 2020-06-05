#!/bin/octave
#returns unit response of the input
function y = rect(x)
  y = (x>=-1/2) & (x<=1/2);
end

