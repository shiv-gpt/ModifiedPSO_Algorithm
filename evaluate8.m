function [value] = evaluate8(xn,np,nd)
value = 0;
for j = 1 : nd
    value = value + (sin(xn(1,j)) * (sin((j * (xn(1,j) ^ 2))/pi) ^ 20));
end
value = -1 * value;
end