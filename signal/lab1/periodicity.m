function periodicity()
    function y = x1( n)
     y = 5 .* cos(0.5.*n+pi/6);
    end
    function y = x2( n)
        y = 5 .* cos(3*pi.*n/20+pi/3);
    end

    n = -5:1:5;
    y1 = x1(n);
    y2 = x2(n);
    
    h = stem(n,y1);
    figure(1);
    title('curve y=5*cos(0.5n+pi/6)');
    xlabel('sample n');
    ylabel('y[n]');
    
    figure(2);
    h= stem(n,y2);
    title('curve y=5*cos(3*pi*n+pi/3)');
    xlabel('sample n');
    ylabel('y[n]');
    
   
end