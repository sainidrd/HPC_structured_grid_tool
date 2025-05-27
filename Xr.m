function xyr = Xr(s,x1,x2,y1,y2)


    r4 = 13.32/220; % just to fix bottom valur at 12.90000000 and get top value -21.452155095120766
    a4 = 26.22/220;
    b4 = 74.36/220 ;


  x14 = -x1;
  x24 = -x2;
  y14 = y1;
  y24 = y2;

  theta14 = (atand((y14-b4)/(x14-a4))+180)/360;
  theta24 = (atand((y24-b4)/(x24-a4))+180)/360;
  A4 = theta14.*(1-s) + theta24 .*s;
  x4 = ((r4*cos(A4*2*pi))+a4);
  y4 = ((r4*sin(A4*2*pi))+b4);


xyr = [x4;y4 ] ;
