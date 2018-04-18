function [A] = research()
    clc;
    tic;
    %% Initialize variables %%
    c = 0;
    a = 20; 
    b = 0.2;
    %this array stores number of particles, max number of generations, and number of dimaensions %
    instr=[50,200,60]; 
    np = instr(1);
    maxgen=instr(2);
    nd = instr(3);
    seedvalues = [0 1 2 3 4 5 9 13 17 19 23 29 31 37 43 133 269 303 343 501];
    for zi=1:20
    rand('state',seedvalues(zi));

    alpha = 0.2;
    gamma = 0.001;
    range = [-2.048 2.048];
    
    [xn,value] = init_ffa(np,nd,range);
    zn = range(2)+range(1)-xn;
    
    for i = 1 : np
        fn(i,:) = xn(i,:);
    end
    for i = 1 : np
        fn(np+i,:) = zn(i,:);
    end
    nt = 2*np;    
    %%initialise fireflies%%
    [value,c] = evaluateR(fn,nt,nd,c);
    [value,index] = sort(value);
    fn = fn(index,:);
    for i = 1 : np
        xn(i,:) = fn(i,:);
    end
    gbest = value(1);
    gbestx = xn(1,:);
    for b = 2 : maxgen
        b
        [value,c] = evaluateR(xn,np,nd,c);
  
        % dx=(range(2)-range(1))/100;
        % dy=(range(2)-range(1))/100;
        % x=range(1):dx:range(2);
        % y=range(1):dy:range(2);
        % 
        % [X,Y]=meshgrid(x,y);
        % 
        % z=-a*exp(-b*sqrt(1/nd*(X.^2+Y.^2)))-exp(1/nd*(cos(2*pi*X)+cos(2*pi*Y)))+a+exp(1);
        % figure(1);
        % set(gcf,'color','w');
        % axis([-40 40 -40 40 0 500]);
        % view(-15,80);
        % 
        % surfc(x,y,z);
        % hold on;
        for i=1:np
            if value(i)<gbest
                gbest=value(i);
                gbestx=xn(i,:);
            end
        end

        % plot3(xn(:,1),xn(:,2),value,'r.');
        % drawnow;
        % pause(1);



        %title('Find the global minimum of ackley function using modified firefly');
        %     
        for j=1:nd
            for i=1:np
                yn = gbestx;
                yn(j) = xn(i,j);
                [value1,c] = evaluateR1(yn,nd,c);
                if value1 < gbest
                    gbest = value1;
                    gbestx = yn;
                end
            end
        end
        [xn] = ffa_move(xn,gbestx,alpha,gamma,range,np,nd);
        gbest;
        gbestx;
        % hold off; 
    end
    % dx=(range(2)-range(1))/100;
    % dy=(range(2)-range(1))/100;
    % x=range(1):dx:range(2);
    % y=range(1):dy:range(2);
    % 
    % [X,Y]=meshgrid(x,y);
    % 
    % z=-a*exp(-b*sqrt(1/nd*(X.^2+Y.^2)))-exp(1/nd*(cos(2*pi*X)+cos(2*pi*Y)))+a+exp(1);
    % figure(1);
    % axis([-3 3 -3 3 0 500]);
    % view(-15,80);
    % 
    % surf(X,Y,z);
    % hold on;
    % h = plot3(gbestx(1),gbestx(2),gbest,'b.','MarkerSize',20);
    % legend(h,'Global Minimum');
    % drawnow;
    % hold off;


    %light0


    gbestx
    gbest
    A(zi) = gbest;


    c
    toc;
    end
    A
end
%--functions---


function [xn,value]=init_ffa(np,nd,range)
    xrange=range(2)-range(1);
    %yrange=range(4)-range(3);
    for i = 1 : np
        for j = 1 : nd
        
        xn(i,j) = rand * xrange + range(1);

        end
    end
    value=zeros(1,np);
end


function [xn] = ffa_move(xn,gbestx,alpha,gamma,range,np,nd)
    for i = 1 : np
        sum = 0;
        for j = 1 : nd
            sum = sum + (xn(i,j) - gbestx(j))^2;
        end
        r=sqrt(sum);
        % Brighter and more attractive
    
        beta0 = 1;     
        beta = (beta0 * exp(-gamma*r^2));
        for j = 1 : nd
            xn(i,j) = xn(i,j).*(1-beta) + gbestx(j).*beta + alpha.*(rand-0.5);
        end
    end
    %yn(i)=yn(i).*(1-beta)+y0.*beta+alpha.*(rand-0.5);

  
    % end for i
    [xn] = findrange(xn,range,np,nd);
end


function [xn] = findrange(xn,range,np,nd)
    for i=1:np
        for j=1:nd
            if xn(i,j) <= range(1), xn(i,j) = range(1); 
            end
            if xn(i,j) >= range(2), xn(i,j)=range(2); 
            end
        end
    end
end

function [value,c] = evaluate1(xn,nd,c)
 
    a = 20; b = 0.2; n = 2*pi;
    s1 = 0; s2 = 0;

    for j=1:nd
        s1 = s1+xn(j)^2;
        s2 = s2+cos(n*xn(j));
    end

    c = c+1;
    value = -a*exp(-b*sqrt(1/nd*s1))-exp(1/nd*s2)+a+exp(1);
end

function [value,c]=evaluate(xn,np,nd,c)
    i=1; 
    while i<=np
        a = 20; b = 0.2; n = 2*pi;
        s1 = 0; s2 = 0; 
        for j=1:nd
            s1 = s1 + xn(i,j)^2;
            s2 = s2 + cos(n*xn(i,j));
        end
        value(i) = -a*exp(-b*sqrt(1/nd*s1))-exp(1/nd*s2)+a+exp(1);
        c = c+1;
        i = i+1;

    end
end
function [value,c]=evaluateD1(xn,nd,c)
value = 0;
    for j =1:nd
        value = value + xn(j) * xn(j);
    end
    c=c+1;
end

function [value,c]=evaluateD(xn,np,nd,c)
i=1;
while i<=np
    temp=0;
    for j =1:nd
        temp = temp + xn(i,j) * xn(i,j);
    end
    value(i) = temp;
    i=i+1;
    c=c+1;
end
end

function [value,c]=evaluateR1(xn,nd,c)
value = 0;
    for j =1:nd-1
       value = value + 100 * (xn(j+1) - xn(j) * xn(j)) * (xn(j+1) - xn(j) * xn(j)) + (xn(j) - 1) * (xn(j) - 1);
    end
    c=c+1;
end

function [value,c]=evaluateR(xn,np,nd,c)
i=1;
while i<=np
    temp=0;
    for j =1:nd-1
        temp = temp + 100 * (xn(i,j+1) - xn(i,j) * xn(i,j)) * (xn(i,j+1) - xn(i,j) * xn(i,j)) + (xn(i,j) - 1) * (xn(i,j) - 1);
    end
    value(i) = temp;
    i=i+1;
    c=c+1;
end
end

function [value,c]=evaluateM1(xn,nd,c)
value = 0;
    for j =1:nd
        value = value + (sin(xn(j)) * (sin((j * (xn(j) ^ 2))/pi) ^ 20));
    end
    value = -1 * value;
    c=c+1;
end

function [value,c]=evaluateM(xn,np,nd,c)
i=1;
while i<=np
    temp=0;
    for j =1:nd
        temp = temp + (sin(xn(i,j)) * (sin((j * (xn(i,j) ^ 2))/pi) ^ 20));
    end
    value(i) = -1 * temp;
    i=i+1;
    c=c+1;
end
end


function [value,c]=evaluatera1(xn,nd,c)
value = 10 * nd;
    for j =1:nd
        value = value + (xn(j) ^ 2) - 10 * cos(2 * pi * xn(j)); 
    end
   
    c=c+1;
end

function [value,c]=evaluatera(xn,np,nd,c)
i=1;
while i<=np
    temp= 10 * nd;
    for j =1:nd
        temp = temp + (xn(i,j) ^ 2) - 10 * cos(2 * pi * xn(i,j)); 
    end
    value(i) = temp;
    i=i+1;
    c=c+1;
end
end

