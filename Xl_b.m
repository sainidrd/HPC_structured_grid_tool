function xyl = Xl_b(s,x1,x2,y1,y2)

  a3 = 2.83/220;
  b3 = 99.58/220;
  r3 = ((x1-a3)^2 + (y1-b3)^2)^0.5;
  x13 = x1;
  x23 = x2;
  y13 = y1;
  y23 = y2;

  theta13 = (atand((y13-b3)/(x13-a3))+180)/360;
  theta23 = (atand((y23-b3)/(x23-a3))+180)/360;
  A3 = theta13.*(1-s) + theta23 .*s;
  x3 = ((r3*cos(A3*2*pi))+a3);
  y3 = ((r3*sin(A3*2*pi))+b3);


  
  xyl = [x3 ; y3] ;



