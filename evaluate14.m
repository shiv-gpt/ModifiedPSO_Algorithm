%----------------Trid Function------------------
%---------------http://www.sfu.ca/~ssurjano/trid.html------------
function [value] = evaluate14(xn,np,nd)
t1 = 0;
t2 = 0;
for j = 1:nd
    t1 = t1 + (xn(1,j) - 1)^2;
end
for j = 2:nd
    t2 = t2 + xn(1,j) * xn(1,j-1);
end
value = t1 - t2;
end