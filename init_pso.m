function [particle,fitness,velocity,pbest,pbestx] = init_pso(np,nd,Range,qs)
    xrange = Range(2) - Range(1);
    particle = zeros(2*np,nd); %new pso
    fitness = zeros(2*np,1);   %new pso
   %  particle = zeros(np,nd);
    % fitness = zeros(np,1);
    
    velocity = zeros(np,nd);
    pbest = zeros(np,1);
    pbestx = zeros(np,nd);
    rand('state',qs);
    for i = 1 : np    
        for j = 1 : nd
            particle(i,j) = rand * xrange + Range(1);
            particle(i+np,j) = range(2) + range(1) - particle(i,j);  %new pso
            
            
            velocity(i,j) = 0.0;
            %pbest

        end
        temp = particle(i,:);
        tempn = particle(i+np,:);    %new pso    
        %-------Ackley Function---------
%         fitness(i,1) = evaluate(temp,np,nd);
%         fitness(i+np,1) = evaluate(tempn,np,nd); %new pso 
        %--------DeJong1 Function--------
%          fitness(i,1) = evaluate1(temp,np,nd);
%          fitness(i+np,1) = evaluate1(tempn,np,nd); %new pso
        %---------Rosenbrook Function--------
         fitness(i,1) = evaluate2(temp,np,nd);
         fitness(i+np,1) = evaluate2(tempn,np,nd); %new pso
        %----------Shubert Function------------
        %fitness(i,1) = evaluate3(temp,np,nd);
        %fitness(i+np,1) = evaluate3(tempn,np,nd); %new pso 
        %------------Easom Function--------
        %fitness(i,1) = evaluate4(temp,np,nd);
        %fitness(i+np,1) = evaluate4(tempn,np,nd); %new pso
        %------------Griewank Function---------------
         %fitness(i,1) = evaluate5(temp,np,nd);
         %fitness(i+np,1) = evaluate5(tempn,np,nd); %new pso
        %------------Rastrigin Function-------------------
         %fitness(i,1) = evaluate6(temp,np,nd);
         %fitness(i+np,1) = evaluate6(tempn,np,nd); %new pso
        %------------Schwefel Function------------------
         %fitness(i,1) = evaluate7(temp,np,nd);
         %fitness(i+np,1) = evaluate7(tempn,np,nd); %new pso
        %-----------Michalewicz Function--------
         %fitness(i,1) = evaluate8(temp,np,nd);
         %fitness(i+np,1) = evaluate8(tempn,np,nd); %new pso
         %-----------Rotated hyper ellipsoid function--------
        %fitness(i,1) = evaluate9(temp,np,nd);
        %fitness(i+np,1) = evaluate9(temp,np,nd); %new pso
        %-----------Dixon and Price function Function--------
        %fitness(i,1) = evaluate10(temp,np,nd);
        %fitness(i+np,1) = evaluate10(temp,np,nd); %new pso
        %-----------Levy Function--------
%         fitness(i,1) = evaluate11(temp,np,nd);
%         fitness(i+np,1) = evaluate11(temp,np,nd); %new pso
        %-----------Perm Function--------
        %fitness(i,1) = evaluate12(temp,np,nd);
        %fitness(i+np,1) = evaluate12(temp,np,nd); %new pso
        %-----------Powell Function--------
        %fitness(i,1) = evaluate13(temp,np,nd);
        %fitness(i+np,1) = evaluate13(temp,np,nd); %new pso
        %-----------Trid Function--------
        %fitness(i,1) = evaluate14(temp,np,nd);
        %fitness(i+np,1) = evaluate14(temp,np,nd); %new pso
    end
end

