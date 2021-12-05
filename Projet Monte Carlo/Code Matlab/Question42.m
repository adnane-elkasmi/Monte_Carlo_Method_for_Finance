densite_empirique_rt()

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
    end
end

function[] = densite_empirique_rt()
    X = Simulation_rt();
    Nmc = length(X);
    a = 0; %debut de l'intervalle
    b = 0.5; % fin de l'intervalle
    N = 18; %Nombre pour discretiser l'intervalle
    delta_t = (b-a)/N; %pas de la discretisation
    for i = 1:N
        x(i) = a + delta_t * (i - 1);
        counter = 0;
        for n = 1:Nmc
            if X(n) <=  x(i) + delta_t && X(n) >= x(i)
                counter = counter + 1;
            end
        end
        densite(i) = counter/(Nmc*delta_t);
    end
    plot(x,densite);
       xlabel 'x_n'
       ylabel 'fonction densite rt'
       title 'Simulation de fonction densite rt'
end