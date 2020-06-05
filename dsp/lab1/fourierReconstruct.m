#!/bin/octave
function y = fourierReconstruct(t,C)
  l = length(C);
  w = -floor(l/2):floor(l/2);
  y = sum(C' .* exp(i.* w' .* t));
end
