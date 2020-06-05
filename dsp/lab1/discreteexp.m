#!/bin/octave
function y = discreteexp(n,a,ang)
  y = (a.*exp(i.*ang)).^n;
end
