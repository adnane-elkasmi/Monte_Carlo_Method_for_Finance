k=10; n=30; Nmc=2000; 
martingale(k,n,Nmc);


function [esperance_Bn,B_Fk] = martingale(k,n,Nmc)
T=2;
delta_t=T/(n+k);
[W_Fk,W] = processus_W(k,delta_t);
[B_Fk,B] = processus_B(k,delta_t);
figure
for j=1:Nmc
for i=k:(n-1)
W(i+1)=W(i)+sqrt(delta_t)*randn;
end
for r=k:(n-1)  
B(r+1)=B(r)+((W(2))^2)+2*W(2)*W(r)-1;
end
last_value(j)=B(n); 
hold on;
plot(B,'LineWidth',2)
xlabel 't_n'
ylabel 'Processus B_n'
title 'Simulation Monte Carlo de B_n=(W_n^2-n)'
end  
esperance_Bn=sum(last_value)/Nmc;
end

function [W_Fk,W] = processus_W(k,delta_t)
W(1)=0;
for i=1:k-1
W(i+1)=W(i)+sqrt(delta_t)*randn;
end
W_Fk=W(k);
end

function [B_Fk,B] = processus_B(k,delta_t)
B(1)=0;
[W_Fk,W] = processus_W(k,delta_t);
for i=1:k-1
W(i+1)=W(i)+sqrt(delta_t)*randn;
end
for r=1:k-1
B(r+1)=B(r)+((W(2))^2)+2*W(2)*W(r)-1;
end
hold on
plot(B,'yellow','LineWidth',2);
plot(W,'black','LineWidth',2);
xlabel 't_n'
ylabel 'Processus B_n et W_n'
title 'La Martingale B_n=(W_n^2-n) (Jaune) et W_n (Noir)'
B_Fk=B(k);
end




