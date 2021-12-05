u=1.1;
d=0.9;
S0=10;
N=20;

ArbreBinomialActif(N,S0,u,d);

function [arbre_binomial_actif] = ArbreBinomialActif(N,S0,u,d)
for n=1:N+1
    for i=1:n
        S(n,i)=S0*(u^(i-1))*(d^(n+1-i));
    end
end
plot(S,'*')
xlabel 't_n'
ylabel 'S_n'
title 'Simulation de Arbre Binomial pour Actif'
end




        
        