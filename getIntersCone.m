function t = getIntersCone( InitialPoint, Direction,radius, radiusChange, height)
%GETINTERSCONE Given a cone defined by the radius, the radiusChange and
%the height and a line defined byt the InitialPoint and Direction, this
%function returns a value for t where the line will intersect the cone.
%The cone needs to be centered at 0,0,0; Also the z value needs to be
%bigger than 0 and the y value is also bigger than zero. x varies from -r
%to r, where r is the radius

d1 = Direction(1,1);
d2 = Direction(2,1);
d3 = Direction(3,1);

s = radiusChange / height;

x0 = InitialPoint(1,1);
y0 = InitialPoint(2,1);
z0 = InitialPoint(3,1);

r0 = radius;

a = d1^2 + d2^2 - s^2*d3^2;
b = 2*y0*d2 - 2*s*r0*d3 - 2*s^2*z0*d3 + 2*x0*d1;
c = y0^2+x0^2-s^2*z0^2 - 2*r0*s*z0-r0^2;

delta = b^2 - 4*a*c;

% This means that there is no intersection
if delta < 0
   t = 0; 
    return
end

% Here we can get the values for real t
t1 = (-b + sqrt(delta))/(2*a);
t2 = (-b - sqrt(delta))/(2*a);

% Here we are checking whether y at that t will be positive or negative. If
% it is negative, then the corresponding t value is not the solution, since
% we got the value in which it crosses the other side of the cone

y1 = y0 + d2*t1;
y2 = y0 + d2*t2;

if y1 > 0
   t = t1;
   return
end

if y2 > 0
    t = t2;
    return
end


t = 0;



end

