% Adhoc Phone Network Simulation for a network as: A calling network as a
% forest called adhoc network used in the case of an emergency, for a school 
%suppose the principal calls K people with the message. They then call another 
%K people each, and so forth.
%Tofind: The probability that everybody get the message within the time
%length


function [probabilty,peoplereached,repe]= adhoccall(Call_Time,Total_People,People_to_Call,Time_Length,mc,M)
%Input::
% mc is the MonteCarlo Runs
% Call_Time = The time it takes to make one phone call and pass along the message and related tree instructions
% Total_People = The total number of people in the district who must be reached
% People_to_Call = The number of random people you should call if you receive the message from somebody else
% Time_Length = The total length of time the tree is allowed to propagate
probabilty=zeros([1,M]);
peoplereached=zeros([1,M]);
repe=zeros([mc,M]);
s=(1:M);
for q=1:M
count=0;
for w=1:mc
y=0;
i=2;
A=zeros([1,People_to_Call+1]);
flaga=zeros([1,Total_People]);
A(i-1)=0;
repeat=0;
while(y<=Time_Length)
permu=randperm(Total_People);
k=permu(1:1);
A(i)=k;
if(eq(k,A(i-1)))
break;
end
flaga(k)=1;
B=permu(2:People_to_Call+1);
for x=1:People_to_Call
if(flaga(B(x))~=0)
flaga(B(x))=1;
repeat=repeat+1;
else
flaga(B(x))=1;
end
end
y=y+(People_to_Call)*(Call_Time);
i=i+1;
end