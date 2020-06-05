                                % time shift x(t) -> x(t-to)
function [x1,t1] = tshift (x,t,to,del)
  if to > 0 % time delayed
    t1 = min(t) : del : max(t) + to;
    x1 = [zeros(1,length(t1)-length(t)) x];
  else
    t1 = min(t)+to : del : max(t);
    x1 = [x zeros(1,length(t1)-length(t))];
  end
end
