%--------------------Rotated hyper-ellipsoid function-----------
function [value] = evaluate9(xn,np,nd)
value = 0;
    for j =1:nd
        for i = 1:j 
        value = value + xn(1,i) * xn(1,i);
        end
    end
end