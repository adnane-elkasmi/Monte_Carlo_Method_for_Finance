T=1; N=100;

Brownien_Motion(T,N)

function[]=Brownien_Motion(T,N)
t=zeros(1,N+1); 
W=zeros(1,N+1);
delta_t=T/N;
t(1)=0; 
W(1)=0; 
for n=1:N
t(n+1)=t(n)+delta_t;
W(n+1)=W(n)+sqrt(delta_t)*randn;
end
plot(t,W);
xlabel 't_n'
ylabel 'Processus W_n'
title("Trajectoire Mouvement Brownien")
end

