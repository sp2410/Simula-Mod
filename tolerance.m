%% Monte Carlo Simulation for: Element Location Errors and Monopulse Accuracy

function [variance,Maximum,Average,e,eb]= tolerance(f,Kr,Km,Theta,N,l)
%Given f value in question is 0.45
%Kr is the number of runs
%Km is the number of monte caro runs
%Theta is the contact angle
%N is the number of elements
% s is the broadside sum
% l is manufacturing tolerance factor
% example: tolerance(0.45,10000,10,90,10,0,0)
%t=0;
l=0.001*l;
for k = 1:1:Km
t=0;
for E = 0.001:0.001:l
t = t + 1;
Eps(1,t) = E;
for r = 1:1:Kr
for n = 1:1:N
e(1,n) = exp((2*pi*j)*((n-1)*(f)+ (randn*E)*cos(Theta) + (randn*E)*sin(Theta))); %Baseband return
eb(1,n) = exp((2*pi*j)*(n-1)*(f)); % Baseline
end
for s = 1:1:N
c(1,s) = e(1,s)'*eb(1,s); % Conjugation
end
v = sum(c(:,1)); % Broadside Sum
phase = atan(imag(v)/real(v));
FAE = abs(((-phase)/(pi*(N-1)*(f)))); % Fine_Angle_Estimate
Degree = acosd(FAE);
Error(1,r) = 90-Degree; % Error matrix for 90 degrees angle
end
variance(1,t) = var(Error); % Variance
Maximum(1,t) = max(Error); % Maximum Error
Average(1,t) = mean(Error); % Average Error
az(1,t)=1;
end
end
%plot(variance)
%hold on
plot(Maximum,'b')
hold on
plot(az,'r')
grid on
%title('Intersection')
xlabel('x')
ylabel('y')
end
