function [values] = pso_run()
    %nd = [2 3 4 5 10 20 30 50 60];
    %nd = [5 10 20 30 60];
    %seedvalues = [0 1 2 3 4 5 9 13 17 19 23 29 31 37 43 133 269 303 343 501];
    seedvalues = [0]; %forgraph
    nd = [30]; %forgraph
    np = [20 30 40 50 60 70 80]; %forgraph
    gen = [50 100 150 200 250 300 350]; %forgraph
    %values = zeros(1,9);
    % for i = 1 : size(nd,2)
    %     [gbest,gbestx] = Particleswaopt([-500 500],50,nd(1,i),500,1.2,2.05,2.05);
    %     values(1,i) = gbest;
    %     %gbestx
    % end
    values = zeros(1,7); %forgraph
    for i = 1 : size(gen,2)
        [gbest,gbestx] = Particleswaopt([-2.048 2.048],50,60,gen(1,i),1.2,2.05,2.05,seedvalues(1,1));
        values(1,i) = log10(gbest);
        %gbestx
   end
%     values = zeros(20,9);
%     for i = 1 : size(seedvalues,2)
%         for j = 1 : size(nd,2)
%             z = nd(1,j)*nd(1,j);
%             [gbest,gbestx] = Particleswaopt([-10 10],50,nd(1,j),200,1.2,2.05,2.05,seedvalues(1,i));
%             values(i,j) = gbest;
%         end
%         display(i);
%     end
%     minC = min(values);
%     maxC = max(values);
%     medianC = median(values);
%     meanC = mean(values);
%     for i = 1 : size(nd,2)
%        [gbest,gbestx] = Particleswaopt([-32.768 32.768],50,60,gen(1,i),1.2,2.05,2.05,seedvalues(1,1));
%        values(1,i) = gbest;
%         gbestx
%     end
%     plot(np,values,'LineWidth',2,'MarkerSize',3,'color','b'); hold on;
%     xlabel('Population size')
%     ylabel('Fitness Value')
    % for i=1:7
    % text(gen(i),values(i),num2str(values(i)),'HorizontalAlignment','right')
    % end
end