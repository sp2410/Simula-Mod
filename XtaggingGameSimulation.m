% We have to develop electronic device model for X-Tag. Find length of time
% of game and of any player for which he stays in game

N=10;
mc=100;
T=100;
M=100;
% N: number of players: 100
% S: score of each player
% P: check to see if player is still in game or not
% Tn: time to tag a person
% T: time a player is in game for
% Ttotal: total time of game
averagenumbertag=zeros(1,M);
e=zeros(1,M);
gametime=zeros(1,M);
for m=1:M
a=zeros(1,mc);
D=zeros(1,mc);
a=zeros(1,mc);
for k=1:mc
s=zeros(1,N);
flaga=zeros(1,N);
s=zeros(1,N);
TagT=round(19.*rand(1,N)+1);%ones(1,N);
ToTag=randperm(N);%%[2,3,4,5,6,7,8,9,10,1]
timeingame=zeros(1,N);
tau=0;
%starting from 1st second
for t=1:T
tau=t-tau;
for n=1:N
if((t==(TagT(n))||tau==(TagT(n)))&&(flaga(n)~=1))&&(ToTag(n)~=ToTag(ToTag(n)))
flaga(ToTag(n))=1;
timeingame(ToTag(n))=t;
ToTag(n)=ToTag(ToTag(n));
s(n)=s(n)+1;
end
end
end
a(k)=mean(s);
b(k)=max(s);
e(k)=mean(timeingame);
end
gametime(m)=mean(e);
averagenumbertag(m)=mean(a);
averagenumberwinnertag(m)=mean(b);
end
