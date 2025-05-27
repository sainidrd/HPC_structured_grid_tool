function [x,y]=orthogonal_ECA_S(x,y,nx,ny,maxit,Ermax)


F1=zeros(nx,ny);
F2=zeros(nx,ny);
F3=zeros(nx,ny);
F4= zeros(nx,ny);
xold = ones(nx,ny);
yold = ones(nx,ny);
Er1=zeros(1,maxit);
Er2=zeros(1,maxit);
Er3=zeros(1,maxit);
Er4=zeros(1,maxit);
Er5=zeros(1,maxit);
Er6=zeros(1,maxit);

i=2:nx-1;
 j=2:ny-1;
 
 
       F1(i,j) = (0.5)*((((x(i+1,j+1)+x(i,j+1)-x(i+1,j-1)-x(i,j-1)).^2 + (y(i+1,j+1)+y(i,j+1)-y(i+1,j-1)-y(i,j-1)).^2)./ ... 
                     ((x(i+1,j)-x(i,j)).^2  + (y(i+1,j)-y(i,j)).^2)).^(0.5));
                
       F2(i,j) = (0.5)*((((x(i-1,j+1)+x(i,j+1)-x(i-1,j-1)-x(i,j-1)).^2 + (y(i-1,j+1)+y(i,j+1)-y(i-1,j-1)-y(i,j-1)).^2)./ ... %some prob
                     ((x(i,j)-x(i-1,j)).^2  + (y(i,j)-y(i-1,j)).^2)).^(0.5));
                 
       F3(i,j) = ((2.0)*(((x(i,j+1)-x(i,j)).^2 + (y(i,j+1)-y(i,j)).^2 ./ ...
                         (x(i+1,j)+x(i+1,j+1)-x(i-1,j)-x(i-1,j+1)).^2 + (y(i+1,j)+y(i+1,j+1)-y(i-1,j)-y(i-1,j+1)).^2).^(0.5)));
                     
       F4(i,j) = ((2.0)*(((x(i,j)-x(i,j-1)).^2 + (y(i,j)-y(i,j-1)).^2 ./ ...
                         (x(i+1,j)+x(i+1,j-1)-x(i-1,j)-x(i-1,j-1)).^2 + (y(i+1,j)+y(i+1,j-1)-y(i-1,j)-y(i-1,j-1)).^2).^(0.5))) ; %some prob

% F1old = F1;
% F2old = F2;
% F3old = F3;
% F4old = F4;

%for t=1:maxit
    
for tin=1:maxit
 i=2:nx-1;
 j=2:ny-1;
   
  x(i,j) = (F1(i,j).*x(i+1,j) + F2(i,j).*x(i-1,j) + ( 1.0 ./F3(i,j)).*x(i,j+1) + (1.0 ./ F4(i,j)).*x(i,j-1)) ... 
                ./(F1(i,j) + F2(i,j) + (1.0 ./ F3(i,j))  + (1.0 ./ F4(i,j)));
  y(i,j) = (F1(i,j).*y(i+1,j) + F2(i,j).*y(i-1,j) + (1.0 ./ F3(i,j)).*y(i,j+1) + (1.0 ./ F4(i,j)).*y(i,j-1)) ...
                ./(F1(i,j) + F2(i,j) + (1.0 ./ F3(i,j))  + (1.0 ./ F4(i,j)));
     
Er1(1,tin)=max(max(abs(xold-x)));
Er2(1,tin)=max(max(abs(yold-y)));
xold = x;
yold = y; 
if Er1(tin)<Ermax &&Er2(tin)<Ermax
    break
end

end
%  i=2:nx-1;
%  j=2:ny-1;
%  
%  
%        F1(i,j) = (0.5)*((((x(i+1,j+1)+x(i,j+1)-x(i+1,j-1)-x(i,j-1)).^2 + (y(i+1,j+1)+y(i,j+1)-y(i+1,j-1)-y(i,j-1)).^2)./ ... 
%                      ((x(i+1,j)-x(i,j)).^2  + (y(i+1,j)-y(i,j)).^2)).^(0.5));
%                 
%        F2(i,j) = (0.5)*((((x(i-1,j+1)+x(i,j+1)-x(i-1,j-1)-x(i,j-1)).^2 + (y(i-1,j+1)+y(i,j+1)-y(i-1,j-1)-y(i,j-1)).^2)./ ... 
%                      ((x(i,j)-x(i-1,j)).^2  + (y(i,j)-y(i-1,j)).^2)).^(0.5));
%                  
%        F3(i,j) = ((2.0)*(((x(i,j+1)-x(i,j)).^2 + (y(i,j+1)-y(i,j)).^2 ./ ...
%                          (x(i+1,j)+x(i+1,j+1)-x(i-1,j)-x(i-1,j+1)).^2 + (y(i+1,j)+y(i+1,j+1)-y(i-1,j)-y(i-1,j+1)).^2).^(0.5)));
%                      
%        F4(i,j) = ((2.0)*(((x(i,j)-x(i,j-1)).^2 + (y(i,j)-y(i,j-1)).^2 ./ ...
%                          (x(i+1,j)+x(i+1,j-1)-x(i-1,j)-x(i-1,j-1)).^2 + (y(i+1,j)+y(i+1,j-1)-y(i-1,j)-y(i-1,j-1)).^2).^(0.5))) ;

% Er3(1,t)=max(max(abs(F1old-F1)));
% Er4(1,t)=max(max(abs(F2old-F2)));
% Er5(1,t)=max(max(abs(F3old-F3)));
% Er6(1,t)=max(max(abs(F4old-F4)));
% 
% F1old = F1;
% F2old = F2;
% F3old = F3;
% F4old = F4;
% 
% 
% if Er3(t)<Ermax && Er4(t)<Ermax && Er5(t)<Ermax &&Er6(t)<Ermax
%   break
% end

%end

if tin==maxit
warning('convergence not reached')
end

end