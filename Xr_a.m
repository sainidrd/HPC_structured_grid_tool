function xyr = Xr_a(s,x1,x2,y1,y2)
  a5 = -17.74/220;
  b5 = 104.54/220 ;
  r5 = (((-x1)-a5)^2 + (y1-b5)^2)^0.5;
  x15 = -x1;
  x25 = -x2;
  y15 = y1;
  y25 = y2;

  theta15 = (atand((x15-a5)/(y15-b5))+180)/360;
  theta25 = (atand((x25-a5)/(y25-b5))+180)/360;
  A5 = theta15.*(1-s) + theta25 .*s;
  x5 = ((r5*sin(A5*2*pi))+a5);
  y5 = ((r5*cos(A5*2*pi))+b5);
  

xyr = [x5;y5 ] ;
