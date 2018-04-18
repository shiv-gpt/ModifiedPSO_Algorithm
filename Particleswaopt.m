function [gbest,gbestx] = Particleswaopt(Range,np,nd,maxgen,w,c1,c2,qs)
tic;
[particle,fitness,velocity,pbest,pbestx] = init_pso(np,nd,Range,qs);
[fitness,index] = sort(fitness);
particle = particle(index,:);
fitness = fitness(1:np,:); %new pso
particle = particle(1:np,:); %new pso
gbest = fitness(1);
gbestx = particle(1 , :);
[gbest,gbestx] = calcgbest(particle,np,nd,fitness,gbest,gbestx); %new pso
phi= c1 + c2;
C = 2/abs(2-phi-(phi^2-4*phi)^0.5);
xrange = Range(2) - Range(1);
for m = 1 : np
    pbest(m,1) = fitness(m,1);
    pbestx(m,:) = particle(m,:);
end 
for i = 2 : maxgen
    for m = 1 : np                  
        temp = particle(m,:);
        %--------Ackley Function--------
        %fitness(m,1) = evaluate(temp,np,nd); 
        %---------DeJong1 Function-------------
        %fitness(m,1) = evaluate1(temp,np,nd);
        %--------Rosenbrook Function----------
        fitness(m,1) = evaluate2(temp,np,nd);
        %-------Shubert Function----------
        %fitness(m,1) = evaluate3(temp,np,nd);
        %----------Easom Function-----------
        %fitness(m,1) = evaluate4(temp,np,nd);
        %----------Griewank Function----------
        %fitness(m,1) = evaluate5(temp,np,nd);
        %-----------Rastrigin Function----------
        %fitness(m,1) = evaluate6(temp,np,nd);
        %-----------Schwefel Function-----------
        %fitness(m,1) = evaluate7(temp,np,nd);
        %-----------Michalewicz Function--------
        %fitness(m,1) = evaluate8(temp,np,nd);
        %-----------Rotated hyper ellipsoid function--------
        %fitness(m,1) = evaluate9(temp,np,nd);
        %-----------Dixon and Price function Function--------
        %fitness(m,1) = evaluate10(temp,np,nd);
        %-----------Levy Function--------
        %fitness(m,1) = evaluate11(temp,np,nd);
        %-----------Perm Function--------
        %fitness(m,1) = evaluate12(temp,np,nd);
        %-----------Powell Function--------
        %fitness(m,1) = evaluate13(temp,np,nd);
        %-----------Trid Function--------
        %fitness(m,1) = evaluate14(temp,np,nd);
        %----------Update Pbest-----------------
        if( pbest(m,1) > fitness(m,1) )
            pbest(m,1) = fitness(m,1);
            pbestx(m,:) = particle(m,:);
        end
        %original pso-----Update Gbest----------------
%          if( gbest > fitness(m,1))
%            gbest = fitness(m,1);
%            %gbestx(1,:) = particle(m,:);
%            gbestx = particle(m,:);
%          end
    end
    %------------Update Gbest---------------------------
    [gbest,gbestx] = calcgbest(particle,np,nd,fitness,gbest,gbestx);  %new pso
     
    for m = 1 : np
        for j = 1 : nd            
            %velocity(m,j) = velocity(m,j) + c1 * rand * (pbestx(m,j) - particle(m,j)) + c2 * rand * (gbestx(1,j) - particle(m,j));
            velocity(m,j) = C * (velocity(m,j) + c1 * rand * (pbestx(m,j) - particle(m,j)) + c2 * rand * (gbestx(1,j) - particle(m,j)));
            particle(m,j) = particle(m,j) + velocity(m,j);
            if(particle(m,j) <= Range(1))
                particle(m,j) = Range(1);
            end
            if(particle(m,j) >= Range(2))
                particle(m,j) = Range(2);
            end            
        end
    end
    %gbest
end
toc;
end
