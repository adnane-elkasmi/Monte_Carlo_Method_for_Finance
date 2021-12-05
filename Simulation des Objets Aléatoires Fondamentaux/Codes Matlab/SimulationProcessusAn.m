k=100;n=300;Nmc=2000;
martingale(Nmc,n,k)

function martingale(Nmc,n,k)
A=zeros(1,n+1);
M=zeros(1,n+1);
somme=0;
figure;
for i=1:k-1
M(i+1)=M(i)+pas();
A(i+1)=M(i+1)^2-(i+1);
end
for j=1:Nmc
for i=k:n
M(i+1)=M(i)+pas();
A(i+1)=M(i+1)^2-(i+1);
end
somme=somme+A(n+1);
hold on;
plot(A,'LineWidth',2)
xlabel 't_n'
ylabel 'Processus A_n'
title 'Simulation Monte Carlo de A_n=(M_n^2-n)'
end
end

function [step] = pas()
if rand < 1/2
        step=1;
    else
        step=-1;
end
end