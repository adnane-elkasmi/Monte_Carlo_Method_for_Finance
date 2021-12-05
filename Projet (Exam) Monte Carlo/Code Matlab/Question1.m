

fprintf("E[WT^4]=%f \n",Esperance_WT_4())
fprintf("V[WT]=%f \n",Variance_WT())

function[esperance] = Esperance_WT_4()
    T = 3;
    N = 100;
    delta_t = T/N;
    Nmc = 10000;
    W(1) = 0;
    for n = 1:Nmc
        for i = 1:N - 1
            W(i+1) = W(i) + sqrt(delta_t) * randn;
        end
        last_value(n) = W(N) ^ 4;
    end
    esperance = mean(last_value);
end

function[variance] = Variance_WT()
    T = 3;
    N = 100;
    delta_t = T/N;
    Nmc = 10000;
    W(1) = 0;
    for n = 1:Nmc
        for i = 1:N - 1
            W(i+1) = W(i) + sqrt(delta_t) * randn;
        end
        last_value(n) = W(N);
    end
    esperance = mean(last_value);
    variance = mean((last_value -  esperance).^2);
end