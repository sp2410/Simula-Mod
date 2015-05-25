% Disk Reader: we are part of the team responsible for designing the disk
% head controller software at a company that makes hard drives. We want to 
%know which IO scheduling/disk read algorithms maximize certain measures of 
%effectiveness related to read performance of our disk drive: Simplified
%Queue Model,Random Scheduling ,SSFT Scheduling ,Scan
%Scheduling , C-Scan Scheduling


%The universe
N=8; %No of tracks 1,95,218,353,726,735,855,910,1020,1200
k=100; %universe scaling
memoryspace=6; %queue length
velocity=10;
universe=zeros(1,(k*N));
Tread=4;
T1=100;
M=1;%Runs
Mc=1;%Montecarlo trials
% for q=1:M
Fair=zeros(1,M);
Through=zeros(1,M);
armmean=zeros(1,M);
for zz=1:M
Throughput=zeros(1,Mc);
Fstdmean=zeros(1,Mc);
std=zeros(1,N);
latencymean=zeros(1,(k*N-(memoryspace+1)));
timev=0;
T=0;
arm=0;
machinearray=zeros(1,memoryspace);
countz=zeros(1,N);
arms=zeros(1,Mc);
for r=1:1:(k*N)
a=randperm(N);
universe(r) = a(1) ;
end
for sz=1:Mc
a=randperm(N);
vhead=1;
% for s=1:memoryspace
% machinearray(s)=universe(s);
%
% end
npro=0;
%Random scheduling----------------
% Add to comment below to run for others
if(timev<T1)
for r=(memoryspace+1):1:(k*N)
for s=1:memoryspace
machinearray(s)=universe(s);
end
%
% T=(((sqrt((vhead-machinearray(1))*(vhead-machinearray(1))))/velocity)+Tread);
% npro=npro+1;
% timev=timev+T;
% arm= (T-Tread)*velocity+arm;
% countz(1:memoryspace)=(0:(memoryspace-1));
%
%
%
% for h=2:(memoryspace-1)
% machinearray(h)=machinearray(h+1);
% end
% machinearray(h+1)=universe(r);
%
% vhead=machinearray(1);
%
%
%
% end
% latencymean=mean(countz);
% end
%Shortest Service Time First (SSTF)--------------------------
% if(timev<T1)
% for r=(memoryspace+1):1:(k*N)
%
% [idx idy]=min(abs(memoryspace(:)-vhead));
% b=idy;
% T=(((sqrt((vhead-machinearray(b))*(vhead-machinearray(b))))/velocity)+Tread);
% npro=npro+1;
% timev=timev+T;
% arm= (T-Tread)*velocity+arm;
%For latency
% countz=zeros(1,N);
% for aa=1:N
% if(b~=(max(memoryspace)-aa+1))
% countz(aa)=countz(aa)+1;
% end
% end
%
%
%
% vhead=machinearray(b);
% %flag(universe(b))=1;
% machinearray(b)=universe(r);
%
%
%
% end
% latencymean=mean(countz);
% end
% %-------------------------------
%Scan Scheduling
% if(timev<T1)
% if(r<(k*N-(memoryspace+1)))
% countz=zeros(1,N);
% for r=(memoryspace+1):(memoryspace+1):(k*N)
% nocount=zeros(1,N);
%
% %Counting the number of instances
% for kk=1:memoryspace
% for aa=1:N
% if(machinearray(kk)==(max(machinearray)-aa+1))
% nocount(aa)=nocount(aa)+1;
% end
% end
% end
%
% %Now the algo
%
% for d=1:N
% T=(((sqrt((vhead-(N-d+1))*(vhead-(N-d+1))))/velocity)+Tread);
% %npro=npro+1;
% arm= (T-Tread)*velocity+arm;
% timev=timev+T+((nocount(d)-1)*T);
% npro=npro+(nocount(d)-1);
% b=N-d+1;%
%
% if(b~=(N-d+1))
% countz(N-d+1)=countz(N-d+1);
% end
%
% end
%
%
% machinearray(1:memoryspace)=universe(r:(r+memoryspace));
% %
% latencymean=mean(countz);
% for e=1:N
% std(e)=abs(countz(e)-(latencymean));
% end
% end
% end
% end