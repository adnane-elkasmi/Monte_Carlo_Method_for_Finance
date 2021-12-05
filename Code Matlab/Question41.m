Simulation_rt()


function[last_value] = Simulation_rt()
    T = 0.5;
    N = 100;
    delta_t = T/N;
    r(1) = 0.1;
    alpha = 0.2;
    beta = 0.1;
    w = 0.3;
    sigma = 0.5;
    Nmc = 1000;
    t = (1:N) * delta_t;
    for n = 1:Nmc
        for i = 1:N-1
            r(i+1) = r(i) + (alpha - beta*r(i)) * delta_t + w * sqrt(abs(r(i))) * sqrt(delta_t) * randn;
        end
        hold on;
        last_value(n) = r(N);
        plot(t,r);
        xlabel 't_n'
        ylabel 'taux d interet'
       title 'Simulation de taut d interet'
    end
end

