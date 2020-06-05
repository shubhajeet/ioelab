function [v]=rect(t)
  v = zeros(size(t));
  for i = 1:length(t)
    if abs(t(i)) <= 1
      v(i) = 1;
    else
      v(i) = 0;
    end
  end
end
