function xyl = Xl_a(s,x1,x2,y1,y2)

  a2 = 17.74/220;
  b2 = 104.54/220 ;
  r2 = ((x1-a2)^2 + (y1-b2)^2)^0.5;
  x12 = x1; %-15.23/220;
  x22 = x2;
  y12 = y1; %81.9/220;
  y22 = y2;

  theta12 = (atand((x12-a2)/(y12-b2))+180)/360;
  theta22 = (atand((x22-a2)/(y22-b2))+180)/360;
  A2 = theta12.*(1-s) + theta22 .*s;
  x2 = ((r2*sin(A2*2*pi))+a2);
  y2 = ((r2*cos(A2*2*pi))+b2);


  
  xyl = [x2 ; y2] ;




