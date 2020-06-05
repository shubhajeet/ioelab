function [y,t] = convolve (x1,t1,x2,t2,del)
  %x1 and x2 are the signals to be convolved with time ranges t1
  %and t2 respectively.
  %del is the step size; del = 1 for DT signals
  %y is the resulting signal with time range t
  y = conv(double(x1),double(x2)).*del;
  t = min(t1)+min(t2):del:max(t1)+max(t2);
end
