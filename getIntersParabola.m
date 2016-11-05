function t = getIntersParabola(InitialPoint, Direction, parabolicTerm )
%GETINTERSPARABOLA Summary of this function goes here
%   Detailed explanation goes here

d1 = Direction(1,1);
d2 = Direction(2,1);
d3 = Direction(3,1);

x0 = InitialPoint(1,1);
y0 = InitialPoint(2,1);
z0 = InitialPoint(3,1);

a = parabolicTerm*d3^2;
b = 2*a*z0/d3 - d2;
c = a*(z0/d3)^2 - y0;

delta = b^2 - 4*a*c;

% This means that there is no intersection
if delta < 0
   t = NaN; 
    return
end

% Here we can get the values for real t
t1 = (-b + sqrt(delta))/(2*a);
t2 = (-b - sqrt(delta))/(2*a);

if t1>t2
   t = t1;
   return
end

if t2>t1
    t = t2;
    return
end
end

