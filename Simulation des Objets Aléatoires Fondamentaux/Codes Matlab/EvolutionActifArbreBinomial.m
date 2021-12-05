p=0.4;
u=1.1;
d=0.9;
S0=10;
N=20;

EvolutionActifArbre(N,S0,u,d,p);

function [evolution_actif_arbre] = EvolutionActifArbre(N,S0,u,d,p)
actif(1)=S0;
for n=1:N+1
    if rand<p
        actif(n+1)=u*actif(n);
    else
        actif(n+1)=d*actif(n);
    end
    for i=1:n
        S(n,i)=S0*(u^(i-1))*(d^(n+1-i));
    end
end
hold on;
plot(S,'*');
plot(actif)
xlabel 'Temps discret'
ylabel 'Valeurs de actif S'
title 'Simulation Evolution Actif dans Arbre Binomial'
end




        
        