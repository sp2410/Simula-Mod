%%Study to Model Rayleigh data and see if the histogram from its data passes the
%%CS-GOFT test.

kr = 10
k= 9;
% N1 = 50
% N2 = varies
beta = 2 ;
alpha = 0.25; % (lambda = 4)
% lambda_hat = (4*avg^2)/pi
% alpha_hat = 1/lambda_hat
probability=zeros(1,kr);
for s=1:Kr
X=1000;
a=zeros(1,X);
sample=zeros(1,1000);
for i=1:X
a(i)= (((-1/alpha)*log(1-rand())).^(1/beta));
end
avg=mean(a);
lambda_hat=(4*avg.^2)/(pi);
alpha_hat=1/(lambda_hat);
for j=1:1000
sample(j)=(((-lambda_hat)*log(1-rand())).^(1/beta));
end
for wq=1:km
count=0;
[N,edges] = hist(a,(k+1));
%L=zeros(1,(k+1));
L=N/X;
%L=E/0.1;
%E=L/(N/k+1);
[N1,edges1] = hist(sample,(k+1));
r=zeros(1,(k+1));
L1=N1/1000;
%r=0;
%for i=1:MC
for y=1:(k+1)
r(wq)=r(wq)+(((N1(y)-(1000*(L(y))))*(N1(y)-(1000*(L(y)))))/(1000*(L(y))));
end
end
for d=1:(wq)
if(r(d)<16.92)
count= count+1;
end
end
probability(s)=count/km;
%
% x=9.5;
% plot(L,'--g');
% hold on;
% plot(L1,':r');
% xlabel('Blocks of division'); % x-axis label
% ylabel('Probability') % y-axis label
% legend('Actual','Normalized');
% hold off;
end