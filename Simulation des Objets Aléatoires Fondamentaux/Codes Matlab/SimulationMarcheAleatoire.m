k=100;
n=300;
Nmc=1000;

[esperance_Mn,M_Fk] = martingale(k,n,Nmc);

disp(esperance_Mn); 
disp(M_Fk);

function [esperance_Mn,M_Fk] = martingale(k,n,Nmc)
[M_Fk,M] = processus_M(k);
figure
for j=1:Nmc
for i=k:(n-1)   
M(i+1)=M(i)+pas();
end
last_value(j)=M(n); 
hold on;
plot(M,'LineWidth',2)
xlabel 't_n'
ylabel 'Processus M_n'
title 'Simulation Monte Carlo de la Marche Aléatoire)'
end  
esperance_Mn=sum(last_value)/Nmc;
end

function [M_Fk,M] = processus_M(k)
M(1)=0;
for i=1:k-1
M(i+1)=M(i)+pas();
end
hold on
plot(M,'black','LineWidth',2);
xlabel 't_n'
ylabel 'Processus M_n'
title 'La Marche Aléatoire sur Z'
M_Fk=M(k);
end

function [step] = pas()
if rand < 1/2
        step=1;
    else
        step=-1;
end
end
