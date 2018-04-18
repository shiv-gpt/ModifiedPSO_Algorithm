%-----------------Powell Function--------
%---------sfu.ca/~ssurjano/powell.html----------
function [value] = evaluate13(xn,np,nd)
value = 0;
for j = 1:nd/4
    value = value + (xn(1,4*j - 3) + 10 * xn(1,4*j -2))^2 + 5 * ((xn(1,4*j - 1) - xn(1,4*j))^2) + (xn(1,4*j - 2) - 2 * xn(1,4*j - 1))^4 + 10 * ((xn(1,4*j - 3) - xn(1,4*j))^4);
end
end 
 