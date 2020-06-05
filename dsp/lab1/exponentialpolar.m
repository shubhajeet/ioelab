#!/bin/octave
function y = exponentialpolar(t,r,C,w,ang=0)
  y = real(C) .* exp(r .* t) .* (cos(w.*t.+ang)+i.*sin(w.*t.+ang));
end
