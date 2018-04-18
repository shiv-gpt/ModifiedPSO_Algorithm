%------------------Perm Function---------
%----------http://www.sfu.ca/~ssurjano/permdb.html
function [value]=evaluate12(xn,np,nd)
b = 0.5; %beta
value = 0;
for j=1:nd
    inner = 0;
    for i =1:nd
        inner = inner + ((i^j + b) * ((xn(1,i)/i)^j - 1));
    end
    value = value + inner^2;
end