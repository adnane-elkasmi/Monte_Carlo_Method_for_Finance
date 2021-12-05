ResolutionMC()

function ResolutionMC()
    
   
    T=15;
    n=100;
    M(1)=10;
    P(1)=10;
    sigma=1.5;
    a=0.3;
    b=0.5;
    delta_t=T/n;
    t=(0:n)*delta_t;
    figure;
    
    variation_M(1)=0;
    variation_P(1)=0;
    
   	for i=1:n
        M(i+1)=M(i)+P(i)*delta_t;
        P(i+1)=P(i)-a*P(i)*delta_t-b*M(i)*delta_t+sigma*sqrt(delta_t)*randn;
        variation_M(i+1)=variation_M(i)+(M(i+1)-M(i))^2;
        variation_P(i+1)=variation_P(i)+(P(i+1)-P(i))^2;
    end
    plot(t,variation_M);
    xlabel('t');
    ylabel('Variation quadratique de M');
    title('Variation quadratique de M ');
    
    
end