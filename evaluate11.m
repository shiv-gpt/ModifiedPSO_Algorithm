%--------------------Levy Function--------------------------
%-----------http://www.sfu.ca/~ssurjano/levy.html---------
function [value]=evaluate11(xn,np,nd)
w1 = 1 + (xn(1,1) - 1)/4;
value = (sin(pi * w1))^2;
wd = 1 + (xn(1,nd) - 1)/4;
for j = 1:nd-1
    wj = 1 + (xn(1,j) - 1)/4;
    value = value + ((wj - 1)^2) * (1 + 10 * (sin(pi * wj + 1)^2)) + ((wd -1)^2) * (1 + (sin(2 * pi * wd)^2));
end
end