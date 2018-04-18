function [value] = evaluate3(xn,np,nd)
value=1;
for j= 1 : nd
    temp = 0;
    for i = 1 : 5
        temp = temp + i * cos((i+1) * xn(1,j) + i);
    end
    value = value * temp;
end
end