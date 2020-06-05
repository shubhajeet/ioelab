function [x t] = fSignal(c,k,T,N,del)
t = -N:del:N;
x = zeros(size(t));
  for i = 1:length(t)
    x(i) = sum(c.*exp(j.*k.*2*pi/T*t(i)));
  end 
end