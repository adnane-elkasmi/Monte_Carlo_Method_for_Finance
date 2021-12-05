k=100; n=300; Nmc=2000; sigma=0.3;
martingale(Nmc,n,k,sigma)

function martingale(Nmc,n,k,sigma)
C=ones(1,n+1);
W=zeros(1,n+1);
somme=0;
delta_t=1/n;
t=(0:n)*delta_t;
figure;
for i=1:k-1
W(i+1)=W(i)+sqrt(delta_t)*randn(1,1);
C(i+1)=exp((sigma*W(i+1))-(sigma^2*t(i+1))/2);
end
for j=1:Nmc
for i=k:n
W(i+1)=W(i)+sqrt(delta_t)*randn(1,1);
C(i+1)=exp((sigma*W(i+1))-(sigma^2*t(i+1))/2);
end
somme=somme+C(n+1);
hold on;
plot(C,'LineWidth',2);
xlabel('t_n');
ylabel('Processus C_n');
title('Simulation Monte Carlo de C_n=exp((sigma*W_n)-(sigma^2*t_n)/2)');
end
disp(C(k))  
disp(somme/Nmc);
end

