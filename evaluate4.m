function [value] = evaluate4(xn,np,nd)
value = -1 * cos(xn(1,1)) * cos(xn(1,2)) * exp(-((xn(1,1) - pi) ^ 2) - ((xn(1,2) - pi) ^ 2));
end