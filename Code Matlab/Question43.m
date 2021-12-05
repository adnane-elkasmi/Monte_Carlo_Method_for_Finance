Simulation_modele()

function[] = Simulation_modele()
    T = 0.5;
    N = 100;
    delta_t = T/N;
    r(1) = 0.1;
    alpha = 0.2;
    beta = 0.1;
    w = 0.3;
    sigma = 0.5;
    Nmc = 1000;
    S(1) = 10;
    t = (1:N) * delta_t;
    counter = 0;
    for n = 1:Nmc
        for i = 1:N-1
            r(i+1) = r(i) + (alpha - beta*r(i)) * delta_t + w * sqrt(abs(r(i))) * sqrt(delta_t) * randn;
            S(i+1) = S(i) * (1 + r(i) * delta_t + sigma * sqrt(delta_t) * randn);
        end
        if S(N) < S(1)
            counter = counter + 1;
        end
        hold on;
        plot(t,S);
        xlabel 't_n'
        ylabel 'S'
       title 'Simulation de S'
    end
    proba = counter/Nmc;
    fprintf("P[St<S0]=%f \n",proba)
end