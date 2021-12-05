N=100; T=1;

variation_quadratique_Ito(N,T)

function [] = variation_quadratique_Ito(N,T)
 W(1)=0; variation_W(1)=0; delta_t=T/N;
t=(0:N)*delta_t;
for i=1:N
W_dt(i)=sqrt(delta_t)*randn;
W(i+1)=W(i)+ W_dt(i);
variation_W(i+1)=variation_W(i)+(W(i+1)-W(i))^2;
end
plot(t,variation_W,'LineWidth',2);
hold on;
plot(t,t,'yellow','LineWidth',2);
xlabel 't_n'
ylabel 'Variation Quadratique W_n'
title 'Simulation de la Variation Quadratique du Mouvement Brownien'
end
