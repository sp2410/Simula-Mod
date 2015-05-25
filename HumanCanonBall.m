%Simulation and Modelling study for Probability of successfully flying
%through the BURNING RING OF FIRE as a function of the diameter D, and 
%the manufacturing tolerances sigmav and sigmaq with varying Mean exit
%velocity, standard deviation for theta, standard deviation for v, Diameter,
%Height of ring from ground

function [phit,pmiss,pthrough]=testhumancanonball2(sigmatheta,sigmav,D,H,M,MC)
%sigmatheta;
%sigmav;
%D=diameter
%Gaussian
%H=3;
g=9.8;
meanv=16;
meantheta=40;
probab=zeros(1,MC);
probab1=zeros(1,MC);
probab2=zeros(1,MC);
%---------------------------------------
for j=1:MC
count=0;
counta=0;
countc=0;
for i=1:M
r=rand();
p=rand();
if(r<0.5)
r1=log(r)/sqrt(2);
end
if(r>=0.5)
r1=(-log(2-2*r))/sqrt(2);
end
if(p<0.5)
p1=log(p)/sqrt(2);
end
if(p>=0.5)
p1=(-log(2-2*p))/sqrt(2);
end
v1=(r1*sigmav)+meanv;
theta=((p1*sigmatheta)+meantheta)*(pi/180);
x=20;
y=(x*tan(theta))-((g*x*x)/(2*v1*v1*cos(theta)*cos(theta)));
if((H<y)&&(y<(H+D)))
count=count+1;
end
if(y==H)||(y==(H+D))
counta=counta+1;
end
% for j=1:MC
% count=0;
% counta=0;
% countc=0;
%
% for i=1:M
%
% r=rand();
% p=rand();
%
% v1=(r*sigmav)+meanv;
% theta=((p*sigmatheta)+meantheta)*(pi/180);
% x=20;
%
% y=(x*tan(theta))-((g*x*x)/(2*v1*v1*cos(theta)*cos(theta)));
%
% if((H<y)&&(y<(H+D)))
% count=count+1;
% end
%
% if(y==H)||(y==(H+D))
% counta=counta+1;
% end
%
% if(H>y)||(y>(H+D))
% countc=countc+1;
% end
%
% end
%
% probab(j)=count/M;
% probab1(j)=counta/M;
% probab2(j)=countc/M;
% end
%
%
% pthrough=mean(probab);
% phit=mean(probab1);
% pmiss=mean(probab2);
%
%
%
% end
