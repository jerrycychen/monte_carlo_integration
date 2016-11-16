% Assignment: MACM 316 Computing Assignment 7
% Title: Gambling your way to high dimensions: Monte Carlo integration
% Author: Jerry Chen
% File name: ca07.m

% (i) A set of N equally-spaced points
N=128;
d=2;
mode=0;
% X=GeneratePoints(N,d,mode)
% X=[1,2,3]'
% F=zeros(1,N);
sum1=0;
sum2=0;
actualVal=(pi^(d/2))/gamma(d/2+1);
absError=zeros(1,N); 
% coeff=(2^d)/N;
m=1:N;

for n=1:N
    F=zeros(1,n);
    X=GeneratePoints(n,d,mode);
    for i=1:n
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

%{
% the approximation of the area of a circle
x1=X(1,:);
x2=X(2,:);
centre=[0 0];
radii=1;

figure(1)
plot(x1,x2,'*')
axis([-1 1 -1 1])
title('Equally-spaced points','fontsize',12)
xlabel('x1','fontsize',10)
ylabel('x2','fontsize',10)
viscircles(centre,radii,'Color','r');
grid on
%}

% plot the error versus N in a loglog scale
figure(2)
loglog(m,absError)
title('Equally-spaced points','fontsize',12)
xlabel('log_{10}N','fontsize',10)
ylabel('log_{10}Error','fontsize',10)
grid on

%{
% (ii) A set of N points chosen randomly from (-1,1)^d
N = 10;
d = 2;
mode = 0;
X = GeneratePoints(N,d,mode)

axis([-1 1 -1 1])
title('Equally-spaced points','fontsize',12)
xlabel('log_{10}X1','fontsize',10)
ylabel('log_{10}X2','fontsize',10)
grid on
%}



