function xyt = Xt_c(s,x1,x2,y1,y2)

x = (x2).*(1-s)+(-x2).*s;
y = y2;

xyt = [x;y ] ;


