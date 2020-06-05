#!/bin/octave
function y = exponential(t,C,a)
  y = C .* exp(t.* a);
end
