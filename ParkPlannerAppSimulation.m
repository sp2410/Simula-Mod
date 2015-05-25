%The “Park Planner” is a SW app that helps you plan out your day at an
%amusement park. The user enters a prioritized list of attractions, and the
%app returns a suggested day plan showing the best order and time to go the
%rides. The day plan can be optimized for one of several goals.All users
%enter wait-time data into the app as the day progresses. For example, 
%they log the actual entrance and exit time for each ride they go on. 
%Given enough users doing this at a given park, this can help form a 
%database the app can use to predict wait-times the next day


M=1; %Number of rides
K=1; % Number of people
%Lf scaling factor if needed.
Openhour=100; % Time of operation
std=14.*rand()+1; %random
tlag=1; % time unit
X=1:tlag:Openhour;
Y=zeros(M,((Openhour-1)/tlag)+1);
N=20*(ones(M,((Openhour-1)/tlag)+1));
for r=1:M
Y(r,:) = 1000*normpdf(X,round(Openhour*rand()),std);
end
for z=1:M
for q=1:((Openhour-1)/tlag)+1
if (Y(z,q)<=20)
Y(z,q)=20;
end
end
end
arrive=zeros(1,K);
for people=1:K
arrive(people)=round(20.*rand()+1);
end
for f=1:M
for ss=1:K
N(f,arrive(ss))=Y(f,arrive(ss));
end
% for l=1:1:(((Openhour-1)/tlag)+1)
% if((N(f,l))<20)
% N(f,l)=20;
% end
% end
end
% The model is N
%plot(N);
%hold on;
A=['g','r','b'];
for zz=1:M
plot(N(zz,:));
hold on ;
end
for qp=1:1:Openhour
    if (arrivee(ll)<=Openhour)
[choose,fla]=min(N(:,round(arrivee(ll))));
if(flag(fla)==0)
flag(fla)=1;
%count=count+1;
%time=time+choose;
arrivee(ll)=arrivee(ll)+choose;
ridecount(ll)=ridecount(ll)+1;
end
end
end
if(sum(ridecount)==(M*NextdayNumber))
countsuccess(ll)=countsuccess(ll)+1;
end
end
countsuc(bg)=mean(countsuccess);
end
%Probability of success
Prob(bh)=(sum(countsuc)/mc);
end
