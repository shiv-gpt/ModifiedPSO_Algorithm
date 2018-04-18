function [value] = evaluate7(xn,np,nd)
value = 418.9829 * nd;
for j = 1 : nd
    value = value - (xn(1,j) * sin(abs(xn(1,j)) ^ 0.5));    
end 
end