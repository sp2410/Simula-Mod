%Modelling and Simulation study for finding the best price and place, as a hot
%dog vendor, to occupy in a stadium that will result in the highest total
%profit
%The system and operating environment changing as Deterministic
%Model,Random Model,Human Behavior all divided in Linear Model, Linear
%Model, Non-Linear Model



if strcmp(FT,'med')
Cfix=500;
mu=sqrt((1-(Ppd/10)))*300;
%sigma=25;
k = normrnd(mu,sigma);
if k <=100
Cpd=1.5;
end
if k>100
Cpd=1;
end
end
if strcmp(FT,'high')
Cfix=750;
mu=sqrt((1-(Ppd/10)))*400;
%sigma=25;
k = normrnd(mu,sigma);
if k <=100
Cpd=1.5;
end
if k>100
Cpd=1;
end
end
P(e)=(Ppd-(Cpd))*k-Cfix;
end
P=mean(P);
%plot(P);
end
if strcmp(FT,'med')
Cfix=500;
k=(1-(Ppd/10))*300;
if k <=100
Cpd=1.5;
end
if k>100
Cpd=1;
end
end
if strcmp(FT,'high')
Cfix=750;
k=(1-(Ppd/10))*400;
if k <=100
Cpd=1.5;
end
if k>100
Cpd=1;
end
end
P(e)=(Ppd-(Cpd))*k-Cfix;
end
P=mean(P);
end