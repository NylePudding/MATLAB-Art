function f = bilinear_interpolation (x,xmin,xmax,ymin,ymax,F)

f = (1 /((xmax - xmin)*(ymax - ymin)) ) * [xmax - x(1),x(1) - xmin]* ...
    [F(1) F(4); F(2) F(3)] * [ymax - x(2); x(2) - ymin];







