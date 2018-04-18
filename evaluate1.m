function [value]=evaluate1(xn,np,nd)
value = 0;
    for j =1:nd
        value = value + xn(1,j) * xn(1,j);
    end
end
