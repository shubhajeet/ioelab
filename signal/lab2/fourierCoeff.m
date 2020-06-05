function [c k] = fourierCoeff(x,t,T, N)
  k = -N:N;
  c = zeros(size(k));
  for i = 1:length(k);
    c(i) =  sum(x.*exp(j*k(i)*2*pi/T.*t))./T;
  endfor
end