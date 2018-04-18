function [value] = evaluate2(xn,np,nd)
value = 0;
%#print "HERE"
    for j = 1:nd-1
        value = value + 100 * (xn(1,j+1) - xn(1,j) * xn(1,j)) * (xn(1,j+1) - xn(1,j) * xn(1,j)) + (xn(1,j) - 1) * (xn(1,j) - 1);
    end
end