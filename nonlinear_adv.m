function [f] = nonlinear_adv(n,r1,rn,s1)
format long;
n_2 = n/2.0;
b = zeros(4,1);
x = zeros(4,1);
%f = zeros(n,1);
%lc = ra*(rn-r1);
% outer slope
sn = (rn-r1)/n_2;

% setup RHS
b(1)=r1; % inner radius
b(2)=(rn+r1)/2.0 - (sn/2.0); %outer radius
b(3)=s1; %inner slope
b(4)=sn; %outer slope

%set up the matrix
a=zeros(4,4);
a(1,1)=1.0;
a(1,2)=1.0;
a(1,3)=1.0;
a(1,4)=1.0;

a(2,1)=1.0;
a(2,2)=1.0*n_2;
a(2,3)=1.0*(n_2^3);
a(2,4)=1.0*(n_2^5);

a(3,1)=0.0;
a(3,2)=1.0;
a(3,3)=1.0*3;
a(3,4)=1.0*5;

a(4,1)=0.0;
a(4,2)=1.0;
a(4,3)=3.0*(n_2^2);
a(4,4)=5.0*(n_2^4);

x = inv(a)*b;

for i=1:n_2
   f(i)=x(1)+x(2)*i+x(3)*(i^3)+x(4)*(i^5); 
end
    i=n_2+1;
    f(i) = f(i-1)+sn;
    k=0;
    for i=n_2+2:(2*n_2)
        if k <= n_2
            f(i) = f(i-1)+f(n_2-k)-f(n_2-k-1);
        end
        k=k+1;
    end
end
