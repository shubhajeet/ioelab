function  [x,t] = frep(N)
  k = -N:N;
  a = zeros(size(k));
  for i = 1:length(k)
    if k(i) == 0
      a(i) = 0;
    else
      a(i) = -4j * exp(j*k(i)*pi/2)*sin(k(i)*pi/2)/(k(i)*pi)^2;
    end
  end
  subplot(2,1,1);
  stem(k,a);

  %for time domain signal x(t) using F.S. coefficients
  t = -10:0.01:10;
  x = zeros(size(t));
  for i = 1:length(t)
    x(i) = sum(a.*exp(j*k*2*pi/4*t(i)));
  end
  subplot(2,1,2);
  plot(t,x);
end
