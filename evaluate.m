function [value]=evaluate(xn,np,nd)
    a = 20; b = 0.2; n = 2*pi;
    s1 = 0; s2 = 0; 
    for j=1:nd
        s1 = s1 + xn(1,j)^2;
        s2 = s2 + cos(n*xn(1,j));
    end
    value = -a*exp(-b*sqrt(1/nd*s1))-exp(1/nd*s2)+a+exp(1);
end
