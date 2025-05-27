function xyr = Xr_c(s,x1,x2,y1,y2)
x = x2 ; %(x1).*(1-s)+(-x1).*s;
y = (y1).*(1-s)+(y2).*s;

  
  xyr = [x ; y] ;



