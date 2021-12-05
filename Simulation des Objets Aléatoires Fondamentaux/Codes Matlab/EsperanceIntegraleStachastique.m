% teta_t=W_t

N=100; Nmc=1000000; T=1;

Esperance_Integrale_Stochastique(N,Nmc,T)

function [esperance_Integrale] = Esperance_Integrale_Stochastique(N,Nmc,T)
W(1)=0;
delta_t=T/N;
t=(0:N)*delta_t;
for k=1:Nmc
I=0;
for i=1:N
W(i+1)=W(i)+sqrt(delta_t)*randn;
I=I+W(i)*(W(i+1)-W(i));
end
Integrale(k)=I;
end
esperance_Integrale=mean(Integrale);
end