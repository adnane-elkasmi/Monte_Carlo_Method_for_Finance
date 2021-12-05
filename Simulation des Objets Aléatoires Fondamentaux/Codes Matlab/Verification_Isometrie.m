function [esperance_Integrale_stoch_carre,esperance_Integrale_Teta] = Verification_Isometrie()
function[f]=Teta(t,w)
    f=t^2*w^2+sin(w)+t;
end
W(1)=0;N=100; Nmc=100000; T=2; delta_t=T/N;
t=(0:N)*delta_t;
for k=1:Nmc
I_stoch=0;
I_Teta=0;
for i=1:N
W(i+1)=W(i)+sqrt(delta_t)*randn;
I_stoch=I_stoch+Teta(t(i),W(i))*(W(i+1)-W(i));
I_Teta=I_Teta+(Teta(t(i),W(i)))^2*delta_t;
end
Integrale_stoch_carre(k)=I_stoch^2;
Integrale_Teta(k)=I_Teta;
end
esperance_Integrale_stoch_carre=mean(Integrale_stoch_carre);
esperance_Integrale_Teta=mean(Integrale_Teta);
end