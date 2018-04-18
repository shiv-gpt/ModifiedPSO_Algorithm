%-----------------Dixon and Price Function---------------------
%-------http://www.sfu.ca/~ssurjano/dixonpr.html----------
function [value]=evaluate10(xn,np,nd)
value = (xn(1,1) - 1)^2;
for j = 2:nd
    value = value + j * (((2 * (xn(1,j)^2)) - xn(1,j-1))^2);
end
end