function [gbest,gbestx] = calcgbest(particle,np,nd,fitness,gbest,gbestx)
for i = 1 : nd
    for j = 1 : np
        temp = gbestx;
        temp(1,i) = particle(j,i);
        %-------Ackley Function--------
        %val = evaluate(temp,np,nd);
        %--------DeJong1Function------------
        %val = evaluate1(temp,np,nd);
        %----------Rosenbrook Function--------
        val = evaluate2(temp,np,nd);
        %----------Shubert Function---------
        %val = evaluate3(temp,np,nd);
        %----------Easom Function-------
        %val = evaluate4(temp,np,nd);
        %-----------Griewank Function----------
        %val = evaluate5(temp,np,nd);
        %------------Rastrigin Function---------
        %val = evaluate6(temp,np,nd);
        %------------Schwefel Function--------
        %val = evaluate7(temp,np,nd);
        %-----------Michalewicz Function--------
        %val = evaluate8(temp,np,nd);
        %-----------Rotated hyper ellipsoid function--------
        %val = evaluate9(temp,np,nd);
        %-----------Dixon and Price function Function--------
        %val = evaluate10(temp,np,nd);
        %-----------Levy Function--------
        %val = evaluate11(temp,np,nd);
        %-----------Perm Function--------
        %val = evaluate12(temp,np,nd);
        %-----------Powell Function--------
        %val = evaluate13(temp,np,nd);
        %-----------Trid Function--------
        %val = evaluate14(temp,np,nd);
        if(val < gbest)
            gbest = val;
            gbestx = temp;
        end
    end
end
end