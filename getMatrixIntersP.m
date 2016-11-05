function M = getMatrixIntersP(InitialPoints, Directions, VectIntersP)
%%This functions returns a matrix of points, where each column is
%%represents the x,y,z points where the line defined by InitialPoints and
%%Directions intersects the parabolic mirror
counter = 1;
for parm = 1:length(Directions(1,:));
    
    t = VectIntersP(parm);
    
    if isnan(t)
        continue
    end
    

    %d1 = direction in x-axis, d2 = y-axis, d3 = z-axis
    d1 = Directions(1,parm);
    d2 = Directions(2,parm);
    d3 = Directions(3,parm);

    %Initial Points of incident rays
    x0 = InitialPoints(1,parm);
    y0 = InitialPoints(2,parm);
    z0 = InitialPoints(3,parm);
    
    intersection = [x0 + d1*t
                    y0 + d2*t
                    z0 + d3*t];
                
   M(:,counter) = intersection;
   counter = 1 + counter;
end
end