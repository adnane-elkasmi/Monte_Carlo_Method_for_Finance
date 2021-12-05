Simulation_Actif()

function[] = Simulation_Actif()
    T = 0.5;
    N = 1000;
    delta_t = T/N;
    sigma(1) = 0.5;
    r(1) = 0.3;
    S(1) = 10;
    Nmc = 1000;
    t = (1:N)*delta_t;
    for n = 1:Nmc
        for i = 1:N - 1
            sigma(i + 1) = sigma(1) * delta_t*(i + 1) / T;
            r(i + 1) = (r(1) * (delta_t * (i + 1)) ^ 2)/(T ^ 2);
            S(i+1) = S(i) * (1 + r(i) * delta_t + sigma(i) * sqrt(delta_t) * randn);
        end
        hold on;
        plot(t,S);
        xlabel 't_n'
        ylabel 'Actif'
       title 'Simulation de l actif'
    end
end
