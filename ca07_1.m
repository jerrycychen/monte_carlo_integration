% Assignment: MACM 316 Computing Assignment 7
% Title: Gambling your way to high dimensions: Monte Carlo integration
% Author: Jerry Chen
% File name: ca07_1.m

% (i) A set of N equally-spaced points
N=10000;
d=15;
mode=0;
actualVal=(pi^(d/2))/gamma(d/2+1);
absError=zeros(1,N); 
m=1:N;

for n=1:N
    F=zeros(1,n);
    X=GeneratePoints(n,d,mode);
    sum2=0;

    for i=1:n
        sum1=0;
        for j=1:d
            temp=(X(j,i))^2;
            sum1=temp+sum1;
        end
        if(sum1<=1)
            F(i)=1;
        elseif(sum1>1)
            F(i)=0;
        end
    end

    for k=1:n
        sum2=F(k)+sum2;
    end
   
    approxVal=((2^d)/n)*sum2;
    absError(n)=abs(actualVal-approxVal);
end

figure
plot(log(m),log(absError),'.')
title('Equally-spaced points N=10000 & d=15','fontsize',12)
xlabel('log_{e}N','fontsize',10)
ylabel('log_{e}Error','fontsize',10)
grid on

