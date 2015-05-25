% Monte Carlo study for determining System-level probability of detection as a function of the number of
%sensors in a sensor network.


function [a,Z]= distributedsensor(pfa,pdx,KR,KM,K)
% Probability of false alarm = pfa = 0.001
% Probability of detection = pdx
% Number of runs = KR = 100
% Number of Monte Carlo Trials per run = KM
% K = number of detectors
z=zeros(KR,K,KM);
a=zeros(KR,K);
for i=1:KR
w=zeros(1,KR);
for j=1:K
pdo=zeros(1,K);
for l=1:KM
x=zeros(1,K);
R=zeros(1,K);
for f=1:K
x(f)=rand(1,1);
%x(f)=1;
R(f)=1-(exp(log(pfa)/(1+((log(pfa)/log(pdx))-1)*(x(f))*(x(f)))));
end
pdo(l)=1-prod(R);
end
w(j)=sum(pdo)/KM;
for s=1:KM
z(i,j,s)= sqrt((w(j)-pdo(s))*(w(j)-pdo(s)));
end
a(i,j)=w(j);
end
end
Z=min(min(min(z)));
end
