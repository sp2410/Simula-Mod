%% MonteCarlo Simulations for safe Driving Distance for Car brake model: we
%% have a sensor that notifies a driver if they get too close to the car in 
%front of them. You need to figure out a safe separation between cars that 
%thresholds whether or not the alarm goes off. Find the safe driving distance
%as a function of the average reaction time and the vehicle speed.



% v: Maximum Evaluated Car Speed (m/s)
% R: Number of Runs
% x: Maximum Evaluated Separation Distance (meters)
% u1: CoF for Car 1
% u2: CoF for Car 2
% T: Reaction Time
v=45;
D=100;
g=9.8;
R=100;
MC=1000;
y1=zeros(1,R);
y2=zeros(1,R);
y3=zeros(1,R);
y4=zeros(1,R);
y5=zeros(1,R);
x1=zeros(1,R);
x2=zeros(1,R);
T=zeros(1,R);
avgprobab=zeros(1,MC);
for e=1:MC
for d=1:100
y1(d)=(-1/20)*(log(1-(rand())));
y2(d)=(-1/20)*(log(1-(rand())));
y3(d)=(-1/20)*(log(1-(rand())));
y4(d)=(-1/20)*(log(1-(rand())));
y5(d)=(-1/20)*(log(1-(rand())));
T(d)=(y1(d)+y2(d)+y3(d)+y4(d)+y5(d));
end
for j=1:R
probab=zeros(1,20);
clash=0;
m1=0.5+(0.7-0.5).*rand();
m2=0.5+(0.7-0.5).*rand();
x1=zeros(1,20);
x2=zeros(1,20);
for t=1:100
if t< v/(m1*g)
x1(t)=v*t-0.5*(m1*g)*t*t;
end
if t> v/(m1*g)
x1(t)=(0.5*v*v)/(m1*g);
end
if T(j)<t
x2(t)=((v*t-D)-(0.5*(m1*g)*(t-T(j))*(t-T(j))));
end
if t> T(j)+v/(m2*g)
x2(t)=(v*t-D)+((0.5*v*v)/(m2*g));
end
if (x1(t)==x2(t))||(x1(t)<x2(t))
clash=clash+1;
End
end
probab(j)=clash/100;
end
avgprobab(e)=(mean(probab))*100;
End
meanprobab=mean(avgprobab);
