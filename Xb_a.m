function xyb = Xb_a(s,x1,x2,y1,y2)

x = (x1).*(1-s)+(-x1).*s;
y = y1;

xyb = [x;y ] ;
