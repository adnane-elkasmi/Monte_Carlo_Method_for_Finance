k=100; n=300; Nmc=2000; 
martingale(k,n,Nmc);

function [esperance_Wn,W_Fk] = martingale(k,n,Nmc)
T=2;
delta_t=T/(n+k);
[W_Fk,W] = processus_W(k,delta_t);
[B_Fk,B] = processus_B(k);
figure
for j=1:Nmc
for i=k:(n-1)
W(i+1)=W(i)+sqrt(delta_t)*randn;
end
for r=k:(n-1)  
B(r+1)=B(r)+W(2)^2+2*W(2)*W(r)-1;
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




