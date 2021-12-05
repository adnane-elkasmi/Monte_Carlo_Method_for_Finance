Integrales_Stochastiques()

function[]= Integrales_Stochastiques()
    T = 3;
    N = 100000;
    delta_t = T/N;
    W(1) = 0;
    Integrale_gauche(1) = 0; 
    Integrale_Wt(1) = 0;
    t = (1:N) * delta_t;
    for i = 1:N - 1
        W(i + 1) = W(i) + sqrt(delta_t) * randn;
        Integrale_gauche(i+1) = Integrale_gauche(i) + (W(i) ^ 2) * sqrt(delta_t) * randn;
        Integrale_Wt(i + 1) = Integrale_Wt(i) + W(i) * delta_t;
        Integrale_droite(i + 1) = (1/3) * (W(i+1) ^ 3) - Integrale_Wt(i+1);
    end
    hold on;
    plot(t,Integrale_gauche,'g');
    plot(t,Integrale_droite,'b');
    xlabel 't_n'
    ylabel 'Integrales'
    title 'Simulation Monte Carlo Integrales'
end
