% Assignment: MACM 316 Computing Assignment 7
% Title: Gambling your way to high dimensions: Monte Carlo integration
% Author: Jerry Chen
% File name: ca07_1.m

% (i) A set of N equally-spaced points
N=128;
d=2;
mode=0;
X=GeneratePoints(N,d,mode);
% X=[1,2,3]'
F=zeros(1,N);
actualVal=(pi^(d/2))/gamma(d/2+1);
absError=zeros(1,N); 
coeff=(2^d)/N;
m=1:N;
sum1=0;
sum2=0;

for i=1:N
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

for k=1:N
    sum2=F(k)+sum2;
end

approxVal=coeff*sum2;
absError(n)=abs(actualVal-approxVal);

% the approximation of the area of a circle
x1=X(1,:);
x2=X(2,:);
centre=[0 0];
radii=1;

figure
plot(x1,x2,'*')
axis([-1 1 -1 1])
title('Equally-spaced points','fontsize',12)
xlabel('x1','fontsize',10)
ylabel('x2','fontsize',10)
viscircles(centre,radii,'Color','r');
grid on
