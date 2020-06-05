function v = signal(t)
  v = zeros(size(t));
  for i = 1:length(t)
    if (t(i) >= 0 && t(i) <= 2)
      v(i) = t(i);
    elseif (t(i) > 2 && t(i) <= 3)
      v(i) = 1;
    else
      v(i) = 0;
    end      
  end
end




