function [X,Y]= TFI(xi,eta,nx,ny,sec,x1,x2,y1,y2)
% number of discretizations along xi and eta axis

m = nx ;
n = ny ;

% discretize along xi and eta axis
%xi = nonlinear_adv(m,0,1,0.001);
%xi = linspace(0.,1,m) ;
%eta = linspace(0.,1.,n) ;

% Initialize matrices in x and y axis
X = zeros(m,n) ;
Y = zeros(m,n) ;
%Xb(xi)


for i = 1:m
    Xi = xi(i) ;
    for j = 1:n
        Eta = eta(j) ;
        if sec==1
        % Transfinite Interpolation
        XY = (1-Eta)*Xb(Xi,x1,x2,y1,y2)+Eta*Xt(Xi,x1,x2,y1,y2) ...
            +(1-Xi)*Xl(Eta,x1,x2,y1,y2)+Xi*Xr(Eta,x1,x2,y1,y2) ...
            -(Xi*Eta*Xt(1,x1,x2,y1,y2)+Xi*(1-Eta)*Xb(1,x1,x2,y1,y2) ...
            + Eta*(1-Xi)*Xt(0,x1,x2,y1,y2)+(1-Xi)*(1-Eta)*Xb(0,x1,x2,y1,y2)) ;
        
       elseif sec==2
          XY = (1-Eta)*Xb_a(Xi,x1,x2,y1,y2)+Eta*Xt_a(Xi,x1,x2,y1,y2) ...
              +(1-Xi)*Xl_a(Eta,x1,x2,y1,y2)+Xi*Xr_a(Eta,x1,x2,y1,y2)...
             -(Xi*Eta*Xt_a(1,x1,x2,y1,y2)+Xi*(1-Eta)*Xb_a(1,x1,x2,y1,y2) ...
             + Eta*(1-Xi)*Xt_a(0,x1,x2,y1,y2)+(1-Xi)*(1-Eta)*Xb_a(0,x1,x2,y1,y2));  
         
         elseif sec==3
          XY = (1-Eta)*Xb_b(Xi,x1,x2,y1,y2)+Eta*Xt_b(Xi,x1,x2,y1,y2) ...
              +(1-Xi)*Xl_b(Eta,x1,x2,y1,y2)+Xi*Xr_b(Eta,x1,x2,y1,y2)...
             -(Xi*Eta*Xt_b(1,x1,x2,y1,y2)+Xi*(1-Eta)*Xb_b(1,x1,x2,y1,y2) ...
             + Eta*(1-Xi)*Xt_b(0,x1,x2,y1,y2)+(1-Xi)*(1-Eta)*Xb_b(0,x1,x2,y1,y2));  
         
           elseif sec==4
          XY = (1-Eta)*Xb_c(Xi,x1,x2,y1,y2)+Eta*Xt_c(Xi,x1,x2,y1,y2) ...
              +(1-Xi)*Xl_c(Eta,x1,x2,y1,y2)+Xi*Xr_c(Eta,x1,x2,y1,y2)...
             -(Xi*Eta*Xt_c(1,x1,x2,y1,y2)+Xi*(1-Eta)*Xb_c(1,x1,x2,y1,y2) ...
             + Eta*(1-Xi)*Xt_c(0,x1,x2,y1,y2)+(1-Xi)*(1-Eta)*Xb_c(0,x1,x2,y1,y2));  
           
           elseif sec==5
          XY = (1-Eta)*Xb_c(Xi,x1,x2,y1,y2)+Eta*Xt_c(Xi,x1,x2,y1,y2) ...
              +(1-Xi)*Xl_c(Eta,x1,x2,y1,y2)+Xi*Xr_c(Eta,x1,x2,y1,y2)...
             -(Xi*Eta*Xt_c(1,x1,x2,y1,y2)+Xi*(1-Eta)*Xb_c(1,x1,x2,y1,y2) ...
             + Eta*(1-Xi)*Xt_c(0,x1,x2,y1,y2)+(1-Xi)*(1-Eta)*Xb_c(0,x1,x2,y1,y2));  
        end
        
        X(i,j) = XY(1) ;
        Y(i,j) = XY(2) ;
        
    end
end



%plotgrid(X,Y) ;
end
