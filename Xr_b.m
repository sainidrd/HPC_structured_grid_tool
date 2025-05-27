function xyr = Xr_b(s,x1,x2,y1,y2)

  a6 = -2.83/220;
  b6 = 99.58/220;
  r6 = (((-x1)-a6)^2 + (y1-b6)^2)^0.5;
  x16 = -x1;
  x26 = -x2;
  y16 = y1;
  y26 = y2;

  theta16 = (atand((y16-b6)/(x16-a6)))/360;
  theta26 = (atand((y26-b6)/(x26-a6)))/360;
  A6 = theta16.*(1-s) + theta26 .*s;
  x6 = ((r6*cos(A6*2*pi))+a6);
  y6 = ((r6*sin(A6*2*pi))+b6);


xyr = [x6;y6 ] ;
