function xyl = Xl(s,x1,x2,y1,y2)


  r1 = 13.32/220; % just to fix bottom valur at 12.90000000 and get top value -21.452155095120766
  a1 = -26.22/220;
  b1 = 74.36/220 ;

  x11 = x1;
  x21 = x2;
  y11 = y1;
  y21 = y2;

  theta11 = (atand((y11-b1)/(x11-a1)))/360;
  theta21 = (atand((y21-b1)/(x21-a1)))/360;
  A1 = theta11.*(1-s) + theta21 .*s;
  x1 = ((r1*cos(A1*2.0*pi))+a1);
  y1 = ((r1*sin(A1*2.0*pi))+b1);


  
  xyl = [x1 ; y1] ;



