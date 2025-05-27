clear all;
clc;
close all; 
maxit=100000;
Ermax=10^-8;


%% BLOCK 4 BEGINS %%
nxA = 144;


%% NEED THIS SECTION HERE, BUT WILL BE OVERWRITE LATER ON


%% Block 4 ( Contains all curvatures of cob, thus has to split into diff
%% Sections to design a grid. The reason behind this division lies in 
%% generating the outet boundary was difficult 
%% First bottom arc section - A (Very begining of cob)

nxA = 144;
nyA = 35;

x1 = -12.9/220;
x2 = -15.23/220;
y1 = 73.91/220;
y2 = 81.9/220;

z1_b5 =  x1;
z2_b5 = -x1;
Z5 = nonlinear_adv(nxA,z1_b5,z2_b5,0.000105);
xi = (Z5 - z1_b5)./(z2_b5 - z1_b5);

%%BOTTOM SECTION HAS SPACING "0.001069436007462"
%eta = linspace(0.,1.,nyA);
r = nonlinear(nyA,y1,y2,(0.0010169436007462),0.001069436007462*1.2);
eta = (r - y1)./(y2-y1);
[XT12,YT12] = TFI_new(xi,eta,nxA,nyA,1,x1,x2,y1,y2);

XA = zeros(nxA,nyA-1);
 YA = zeros(nxA,nyA-1);
  for j = 1:nyA-1
      for i = 1:nxA
          XA(i,j) = XT12(i,j);
          YA(i,j) = YT12(i,j);
      end
  end
  
delyA = YA(1,nyA-1)-YA(1,nyA-2);
delyAi = YA(1,2)-YA(1,1);
  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Block4 bottom region required straight mesh lines for halo exchange with block 2  
%% Thus section should matches with second section in Block 4
    
nxAA = nxA;
nyAA = 36;

r1 = 52.0/220.0;
r2 = 70.1/220.0;
dr = r2-r1;

ZN = XT12(1,1);
z1_b5 =   ZN;
z2_b5 =  -ZN;
Z5 = XT12(:,1);
xi = (Z5 - z1_b5)./(z2_b5 - z1_b5);
 
x1 = XT12(1,1); 
x2 = -XT12(1,1);
y1 = 70.1/220;
y2 = YT12(1,1);
wall_sp = 0.0001;
%R = nonlinear(nyAA,y1,y2,0.000095,delyAi*1.2);
R = nonlinear(nyAA,y1,y2,wall_sp,wall_sp*10.0);
eta = (R - y1)./(y2-y1);

[XTAA,YTAA] = TFI_new(xi,eta,nxAA,nyAA,5,x1,x2,y1,y2);

Xw = zeros(nxAA,nyAA-2);
Yw = zeros(nxAA,nyAA-2);

  for j = 1:nyAA-2
      for i = 1:nxAA
          Xw(i,j) = XTAA(i,j+1);
          Yw(i,j) = YTAA(i,j+1);
      end
  end
  
YB1 = Yw(72,2)-Yw(72,1);
YBL = Yw(72,nyAA-2)-Yw(72,nyAA-3);



%% Block 4 ( Contains all curvatures of cob, thus has to split into diff
%% Sections to design a grid. The reason behind this division lies in 
%% generating the outet boundary was difficult 
%% First bottom arc section - A (Very begining of cob)

nxA = 144;
nyA = 35;

x1 = -12.9/220;
x2 = -15.23/220;
y1 = 73.91/220;
y2 = 81.9/220;

z1_b5 =  x1;
z2_b5 = -x1;
Z5 = nonlinear_adv(nxA,z1_b5,z2_b5,0.000105);
xi = (Z5 - z1_b5)./(z2_b5 - z1_b5);

%%BOTTOM SECTION HAS SPACING "0.001069436007462"
%eta = linspace(0.,1.,nyA);
%r = nonlinear(nyA,y1,y2,(0.0010169436007462),0.001069436007462*1.2);
r = nonlinear(nyA,y1,y2,YBL*0.98,YBL*1.35);
eta = (r - y1)./(y2-y1);
[XT12,YT12] = TFI_new(xi,eta,nxA,nyA,1,x1,x2,y1,y2);

XA = zeros(nxA,nyA-1);
 YA = zeros(nxA,nyA-1);
  for j = 1:nyA-1
      for i = 1:nxA
          XA(i,j) = XT12(i,j);
          YA(i,j) = YT12(i,j);
      end
  end
  
%delyA = YA(1,nyA-1)-YA(1,nyA-2)
delyAi = YA(72,2)-YA(72,1);
delyA = YA(72,nyA-1)-YA(72,nyA-2);
  
%  test=72; 
% for j=1:nyA-2
%     YDIFF_curve1(j)=YA(test,j+1)-YA(test,j);
%     R_curve1(j) = YA(72,j);
% end
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %% Straight bottom section - AA ( I don't know why this section is here
% %% may be just to get the value of grid size at first and last point
% %% Just make sure everything matches with section below the cob section
% 
%   nxAA = nxA;
%   nyAA = 36;
%  
%   ZN = XT12(1,1);
%   z1_b5 =   ZN;
%   z2_b5 =  -ZN;
%   Z5 = XT12(:,1);
%   xi = (Z5 - z1_b5)./(z2_b5 - z1_b5);
%   x1 = XT12(1,1); 
%   x2 = -XT12(1,1);
%   y1 = 70.1/220;
%   y2 = YT12(1,1);
%   
%   %r = nonlinear(nyAA,y1,y2,0.000099,delyAi*1.2);
%   %r = nonlinear(nyAA,y1,y2,0.0001,delyAi*1.4);
%   r = nonlinear(nyAA,y1,y2,0.0001,delyAi*1.);
%   eta = (r - y1)./(y2-y1);
%   
%   [XTAA,YTAA] = TFI_new(xi,eta,nxAA,nyAA,5,x1,x2,y1,y2);
%   
%   Xw = zeros(nxAA,nyAA-2);
%   Yw = zeros(nxAA,nyAA-2);
%   for j = 1:nyAA-2
%       for i = 1:nxAA
%           Xw(i,j) = XTAA(i,j+1);
%           Yw(i,j) = YTAA(i,j+1);
%       end
%   end
% 
% delyAAi = Yw(1,nyAA-2)-Yw(nxA,nyAA-3);
% delyAA = Yw(1,2)-Yw(nxA,1);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%% Second bottom arc section - B
 
 
nxB = nxA;
nyB = 35;%20;
 
ZN = XT12(1,nyA);
z1_b5 =   ZN;
z2_b5 =  -ZN;
Z5 = XT12(:,nyA);
xi = (Z5 - z1_b5)./(z2_b5 - z1_b5);

x1 = XT12(1,nyA); 
x2 = -20.21/220;
y1 = YT12(1,nyA);
  
y2 = 91.91/220;
%r = linspace(y1,y2,nyB);
r = nonlinear(nyB,y1,y2,delyA*1.1,delyA*1.3);
eta = (r - y1)./(y2-y1);

[XT1,YT1] = TFI_new(xi,eta,nxB,nyB,2,x1,x2,y1,y2);
 
 XB = zeros(nxB,nyB-1);
 YB = zeros(nxB,nyB-1);
  for j = 1:nyB-1
      for i = 1:nxB
          XB(i,j) = XT1(i,j);
          YB(i,j) = YT1(i,j);
      end
  end
  
  
%delyB =  YT1(1,nyB)-YT1(1,nyB-1)
delyB1 =  YT1(1,2)-YT1(1,1);
delyB =  YT1(1,nyB-1)-YT1(1,nyB-2);

 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
%% Third bottom arc section - C


nxC = nxA;
nyC = 20;%25;

ZN = XT1(1,nyB);
z1_b5 =   ZN;
z2_b5 =  -ZN;
Z5 = XT1(:,nyB);
xi = (Z5 - z1_b5)./(z2_b5 - z1_b5);
%eta = linspace(0.,1.,nyC);
x1 = XT1(1,nyB); 
x2 = -21.45/220;
y1 = YT1(1,nyB);
y2 = 99.91/220;
r = nonlinear(nyC,y1,y2,delyB*1.05,delyB*1.5);
eta = (r - y1)./(y2-y1);
%eta = linspace(0.,1.,nyC);
[XT2,YT2] = TFI_new(xi,eta,nxC,nyC,3,x1,x2,y1,y2);
 
XC = zeros(nxC,nyC-1);
YC = zeros(nxC,nyC-1);
  for j = 1:nyC-1
      for i = 1:nxC
          XC(i,j) = XT2(i,j);
          YC(i,j) = YT2(i,j);
      end
  end
  
  

DELY1 = YC(1,2)-YC(1,1);
DELY = YC(1,nyC-1)-YC(1,nyC-2);
 test=72; 
for j=1:nyC-2 
    YDIFF_B(j)=YC(test,j+1)-YC(test,j);
    R_B(j) = YC(72,j);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Straight section top of C - CC


nxCC = nxA;
nyCC = 114+24+5;
hey2=0.001940610131214;
ZN = XT2(1,nyC);
z1_b5 =   ZN;
z2_b5 =  -ZN;
Z5 = XT2(:,nyC);
xi = (Z5 - z1_b5)./(z2_b5 - z1_b5);
x1 = XT2(1,nyC); 
x2 = -XT2(1,nyC);
y1 = YT2(1,nyC);
y2 =  0.898142198587162; %170./220.;
%r = nonlinear(nyCC,y1,y2,DELY,DELY*2.5);
r = nonlinear(nyCC,y1,y2,DELY*1.099,hey2);
eta = (r - y1)./(y2-y1);

[XT,YT] = TFI_new(xi,eta,nxCC,nyCC,4,x1,x2,y1,y2);

eps = (y2-y1)/nyCC; 
   

DY1 = YT(1,2)-YT(1,1);
DY = YT(1,nyCC-1)-YT(1,nyCC-2);

test=72; 
for j=1:nyCC-1
    YDIFF_curve1(j)=YT(test,j+1)-YT(test,j);
    R_curve1(j) = YT(72,j);
end
  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Concatenating the Arrays for top blocks for orthogonality improvement

nx = nxA;

%ny = (nyAA-2)+(nyA-1) + (nyB-1) + (nyC-1)+ nyCC;
ny = (nyA-1) + (nyB-1) + (nyC-1)+ nyCC;

X = zeros(nx,ny);
Y = zeros(nx,ny);
  
for j= 1:(nyA-1)
    for i = 1:nxAA
       X(i,j) = XA(i,j);
       Y(i,j) = YA(i,j);
    end
end

for j= ((nyA-1))+1:((nyA-1))+nyB-1
    for i = 1:nxAA
        X(i,j) = XB(i,j-((nyA-1)));
        Y(i,j) = YB(i,j-((nyA-1)));
    end
end

for j= (((nyA-1))+nyB-1)+1:(((nyA-1))+nyB-1)+nyC-1
    for i = 1:nxAA
        X(i,j) = XC(i,j-(((nyA-1))+nyB-1));
        Y(i,j) = YC(i,j-(((nyA-1))+nyB-1));
    end
end

for j= ((((nyA-1))+nyB-1)+nyC-1)+1:((((nyA-1))+nyB-1)+nyC-1)+nyCC
    for i = 1:nxAA
        X(i,j) = XT(i,j-((((nyA-1))+nyB-1)+nyC-1));
        Y(i,j) = YT(i,j-((((nyA-1))+nyB-1)+nyC-1));
    end
end


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %% Block4 botton region required straingh mesh lines for halo exchange with block 2  
% %% Thus section should matches with second section in Block 4
%     
% nxAA = nxA;
% nyAA = 36;
% 
% r1 = 52.0/220.0;
% r2 = 70.1/220.0;
% dr = r2-r1;
% 
% ZN = XT12(1,1);
% z1_b5 =   ZN;
% z2_b5 =  -ZN;
% Z5 = XT12(:,1);
% xi = (Z5 - z1_b5)./(z2_b5 - z1_b5);
%  
% x1 = XT12(1,1); 
% x2 = -XT12(1,1);
% y1 = 70.1/220;
% y2 = YT12(1,1);
% 
% %R = nonlinear(nyAA,y1,y2,0.000095,delyAi*1.2);
% R = nonlinear(nyAA,y1,y2,0.0001,delyAi*1.);
% eta = (R - y1)./(y2-y1);
% 
% [XTAA,YTAA] = TFI_new(xi,eta,nxAA,nyAA,5,x1,x2,y1,y2);
% 
% Xw = zeros(nxAA,nyAA-2);
% Yw = zeros(nxAA,nyAA-2);
% 
%   for j = 1:nyAA-2
%       for i = 1:nxAA
%           Xw(i,j) = XTAA(i,j+1);
%           Yw(i,j) = YTAA(i,j+1);
%       end
%   end
%   %Yw(1,28)-Yw(1,27)
% YBbs = Yw(1,2)-Yw(1,1);
% YBTs = Yw(1,nyAA-2)-Yw(1,nyAA-3);
% Ybs1 = YTAA(1,nyAA-2)-YTAA(1,nyAA-3);
% Ybs2 = YTAA(1,2)-YTAA(1,1);
% Xbs1 = XTAA(2,1)-XTAA(1,1);
% Xbs2 = XTAA(3,1)-XTAA(2,1);


%% Write grid for 4
% Concatenation of orthogonal grid of top region with bottom straing grid
% lines


NX_4 = nxA;
NY_4 = (nyAA-2) + ny;

X_4 = zeros(NX_4,NY_4);
Y_4 = zeros(NX_4,NY_4);
    

for j= 1:nyAA-2
    for i = 1:NX_4
        X_4(i,j) = Xw(i,j);
        Y_4(i,j) = Yw(i,j);
    end
end

for j= (nyAA-2)+1:(nyAA-2)+ny
    for i = 1:NX_4
        X_4(i,j) = X(i,j-(nyAA-2));
        Y_4(i,j) = Y(i,j-(nyAA-2));
    end
end

for i=1:NX_4
     Y_4(i,1) = 0.318740510937942 ;
   
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
 [X_4,Y_4] = orthogonal_ECA_S(X_4,Y_4,NX_4,NY_4,maxit,Ermax); 
 [X_4,Y_4] = orthogonal_ECA_S(X_4,Y_4,NX_4,NY_4,maxit,Ermax); 
 [X_4,Y_4] = orthogonal_ECA_S(X_4,Y_4,NX_4,NY_4,maxit,Ermax); 
 [X_4,Y_4] = orthogonal_ECA_S(X_4,Y_4,NX_4,NY_4,maxit,Ermax); 
 [X_4,Y_4] = orthogonal_ECA_S(X_4,Y_4,NX_4,NY_4,maxit,Ermax); 
 [X_4,Y_4] = orthogonal_ECA_S(X_4,Y_4,NX_4,NY_4,maxit,Ermax); 
 [X_4,Y_4] = orthogonal_ECA_S(X_4,Y_4,NX_4,NY_4,maxit,Ermax); 
 [X_4,Y_4] = orthogonal_ECA_S(X_4,Y_4,NX_4,NY_4,maxit,Ermax); 
 [X_4,Y_4] = orthogonal_ECA_S(X_4,Y_4,NX_4,NY_4,maxit,Ermax); 
 [X_4,Y_4] = orthogonal_ECA_S(X_4,Y_4,NX_4,NY_4,maxit,Ermax); 
 [X_4,Y_4] = orthogonal_ECA_S(X_4,Y_4,NX_4,NY_4,maxit,Ermax); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 


 
 fid=fopen('z_r_grid_4.dat','w');
    fprintf(fid, '%d , %d \n',NX_4,NY_4);
    for j= 1:NY_4
      for i = 1:NX_4
          fprintf(fid, '%20.15f , %20.15f \n', [(X_4(i,j)) (Y_4(i,j))]);
      end
    end
    fclose(fid);
    
 hey = Y_4(1,NY_4)-Y_4(1,NY_4-1) ;
  test=72; 
for j=1:NY_4-1 
    Y_diff(j)=Y_4(test,j+1)-Y_4(test,j);
    R(j) = Y_4(72,j);
end
 fid=fopen('resolution_block4.dat','w');
    fprintf(fid, '%d \n',NY_4-1);
    for j= 1:NY_4-1
    %  for i = 1:NX_4
          fprintf(fid, '%20.15f , %20.15f \n', [(R(j)) (Y_diff(j))]);
     % end
    end
    fclose(fid);
X_DIFF = X_4(2,1)-X_4(1,1);
Y_DIFF = Y_4(1,2)-Y_4(1,1);
%% BLOCK 4 ENDS HERE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% BLOCK 1 BEGINS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
%% Block 1

nxbl = 43;
nxbl2 = 121; % for extended bore flow

nybl = 100;
gr= 1.048571144491306e-04*0.85; %6.141772738770118e-04;
r1 = 52.0/220.0;
r2 = 70.1/220.0;
r_1 = nonlinear_adv(nybl,r1,r2,0.0001);
z1_b1 = -30./220; 
z2_b1 = XT12(1,1) ;
z_b1 = -flip(nonlinear(nxbl,-z2_b1,-z1_b1,gr,0.005)); 

for i = 1:nxbl-1
Z_B1(i) = z_b1(i);
end

% Block 1 second half of uniform mesh

 z3_b1 = -0.881509354000000; %-253.0/220;
 z2_bL = linspace(z3_b1,z_b1(1),nxbl2);
 for i = 1:nxbl2-1
Z_B2(i) = z2_bL(i);
 end
 
% Concatenate two z grid points

Z_B = [Z_B2 Z_B1];
%Z_B = [Z_B1];


%NX1 = (nxbl-1);%+(nxbl2-1);
NX1 = (nxbl-1)+(nxbl2-1);
XTBLK_1 = zeros(NX1,nybl);
YTBLK_1 = zeros(NX1,nybl);
  

for i= 1:NX1
    for j=1:nybl
        XTBLK_1(i,j) = Z_B(i);
    end
end

for i= 1:NX1
    for j=1:nybl
        YTBLK_1(i,j) = r_1(j);
    end
end

yum = XTBLK_1(NX1,nybl)-XTBLK_1(NX1-1,nybl);
y = XTBLK_1(2,1)-XTBLK_1(1,1);
yL = (XTBLK_1(2,1)-z3_b1)/y;%-XTBLK_1(1,1) 

fid=fopen('z_r_grid_1.dat','w');
    fprintf(fid, '%d , %d \n',NX1,nybl);
    for j= 1:nybl
      for i = 1:NX1
          fprintf(fid, '%20.15f , %20.15f \n', [(XTBLK_1(i,j)) (YTBLK_1(i,j))]);
      end
    end
    fclose(fid);
    
X_DIFF_B1= XTBLK_1(NX1,1)-XTBLK_1(NX1-1,1)    
    
%% BLOCK 1 ENDS HERE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% BLOCK 2 BEGINS HERE%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Block 2

nyb= 100; 
nxb= nxA;
 
r1 = 52.0/220.0;
r2 = 70.1/220.0;
r_2 = nonlinear_adv(nyb,r1,r2,0.0001);

%z_b2 = nonlinear_adv(nxb,z1_b2,z2_b2,0.00009);
z_b2 = XT12(:,1);

XTb = zeros(nxb,nyb);
YTb = zeros(nxb,nyb);


for i= 1:nxb
    for j=1:nyb
        XTb(i,j) = z_b2(i);
    end
end

for i= 1:nxb
    for j=1:nyb
        YTb(i,j) = r_2(j);
    end
end


 fid=fopen('z_r_grid_2.dat','w');
    fprintf(fid, '%d , %d \n',nxb,nyb);
    for j= 1:nyb
      for i = 1:nxb
          fprintf(fid, '%20.15f , %20.15f \n', [(XTb(i,j)) (YTb(i,j))]);
      end
    end
    fclose(fid);
    
 DELY = YTb(1,nyb)-YTb(1,nyb-1);
 DELY1 = YTb(1,2)-YTb(1,1)  ;
 DELX = XTb(2,1)-XTb(1,1);
 DELX1 = XTb(nxb,1)-XTb(nxb-1,1)  ;


%% BLOCK 2 ENDS HERE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 



%% BLOCK 3 BEGINS HERE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Block 3

nxbr = 43;
nybr = 100;
nxbr2 = 25; % for extended bore flow region

r1 = 52.0/220.0;
r2 = 70.1/220.0;
r_3 = nonlinear_adv(nybr,r1,r2,0.0001);
%r_3 = linspace(r1,r2,nybr);


z1_b3 = -XT12(1,1);
z2_b3 = 30.0/220.0;
z_b3 = nonlinear(nxbr,z1_b3,z2_b3,DELX1,0.005); 

for i = 1:nxbr-1
Z_B3(i) = z_b3(i+1);
end
g = Z_B3(nxbr-1)-Z_B3(nxbr-2);

% Block 3 second part
z3_b3 =0.363636363636364;% 65.0/220;
z3_bL = nonlinear(nxbr2,z2_b3,z3_b3,g,0.02); %linspace(z2_b3,z3_b3,nxbr2);
 
 for i = 1:nxbr2-1
Z_B32(i) = z3_bL(i+1);
 end
 
 
 % Concatenate two z grid points

Z_BL3 = [Z_B3 Z_B32];
%Z_BL3 = [Z_B3];

NX3 = (nxbr-1)+(nxbr2-1);
%NX3 = (nxbr-1);

XTBLK_3 = zeros(NX3,nybr);
YTBLK_3 = zeros(NX3,nybr);


for i= 1:NX3
    for j=1:nybr
        XTBLK_3(i,j) = Z_BL3(i);
    end
end

for i= 1:NX3
    for j=1:nybr
        YTBLK_3(i,j) = r_3(j);
    end
end


 fid=fopen('z_r_grid_3.dat','w');
    fprintf(fid, '%d , %d \n',NX3,nybr);
    for j= 1:nybr
      for i = 1:NX3
          fprintf(fid, '%20.15f , %20.15f \n', [(XTBLK_3(i,j)) (YTBLK_3(i,j))]);
      end
    end
    fclose(fid);

   
d3 = XTBLK_3(2,1)-XTBLK_3(1,1);
d32 = XTBLK_3(NX3,1)-XTBLK_3(NX3-1,1);

%% BLOCK 3 ENDS HERE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% BLOCK 5 BEGINS HERE

%% Block top of cavity

Nx_T = 144;
Ny_T = 72;

rT_1 = 0.9;
rT_2 = 1.0;
%Z5 = XT2(:,nyC);
Z_T = XT(:,nyCC);%X5(:,1);
hey2=0.001940610131214;
R_T = nonlinear(Ny_T,rT_1,rT_2,hey2,0.00009);
 
X_T = zeros(Nx_T,Ny_T);
Y_T = zeros(Nx_T,Ny_T);

for i= 1:Nx_T
    for j=1:Ny_T
        X_T(i,j) = Z_T(i);
    end
end

for i= 1:Nx_T
    for j=1:Ny_T
        Y_T(i,j) = R_T(j);
    end
end

fid=fopen('z_r_grid_6_hey.dat','w');
    fprintf(fid, '%d , %d \n',Nx_T,Ny_T);
    for j= 1:Ny_T
      for i = 1:Nx_T
          fprintf(fid, '%20.15f , %20.15f \n', [(X_T(i,j)) (Y_T(i,j))]);
      end
    end
    fclose(fid);

%% BLOCK 5 ENDS HERE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%% Plot the Solution
figure(1)    
clf
hold on
axis equal

  
%% Block 4

 for m=1:NX_4
 plot(X_4(m,:),Y_4(m,:),'b')
 end
 for m=1:NY_4
 plot(X_4(:,m),Y_4(:,m),'Color',[0 0 0]);
 end 
 
%% Block 1

for m = 1:NX1
 plot(XTBLK_1(m,:),YTBLK_1(m,:),'b')
 end
 for m = 1:nybl
 plot(XTBLK_1(:,m),YTBLK_1(:,m),'Color',[0 0 0]);
 end
 

%% Block 2


 for m = 1:nxb
 plot(XTb(m,:),YTb(m,:),'b')
 end
 for m = 1:nyb
 plot(XTb(:,m),YTb(:,m),'Color',[0 0 0]);
 end
 
%% Block 3


  for m=1:NX3
 plot(XTBLK_3(m,:),YTBLK_3(m,:),'b')
 end
 for m=1:nybr
 plot(XTBLK_3(:,m),YTBLK_3(:,m),'Color',[0 0 0]);
 end

%% Block 5
 for m = 1:Nx_T
  plot(X_T(m,:),Y_T(m,:),'b')
  end
  for m = 1:Ny_T
  plot(X_T(:,m),Y_T(:,m),'Color',[0 0 0]);
  end

  
figure(2)
%clf
%hold on
%axis equal

plot(Y_diff,R)
%axis([0 0.01 0.31 0.9])

  
figure(3)
%clf
%hold on
%axis equal

plot(YDIFF_B,R_B)
figure(4)
%clf
%hold on
%axis equal

plot(YDIFF_curve1,R_curve1)
