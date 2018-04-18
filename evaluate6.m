function [value] = evaluate6(xn,np,nd)
value = 10 * nd;
for j = 1 : nd
    value = value + (xn(1,j) ^ 2) - 10 * cos(2 * pi * xn(1,j));    
end
end