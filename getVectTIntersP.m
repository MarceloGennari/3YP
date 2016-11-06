function vect = getVectTIntersP(InitialPoints, Directions, parabolicTerm)
%%This functions returns a vector of value for the parameter t when the
%%incident line (defined by a matrix of initialPoints and directions of
%%vectors where each column of each of those matrix indicates the
%%specification of a line) intersects the parabola

%This constant sets the value of z for which the ray needs to be at mininum
%to be considered reflecting
Constant = -2;

for parm = 1:length(Directions(1,:));
    
    error = 1e-5;
    initial = InitialPoints(:,parm);
    direction = Directions(:,parm);
    
    %d1 = direction in x-axis, d2 = y-axis, d3 = z-axis
    d1 = direction(1,1);
    d2 = direction(2,1);
    d3 = direction(3,1);

    %Initial Points of incident rays
    x0 = initial(1,1);
    y0 = initial(2,1);
    z0 = initial(3,1);

    if z0 < -sqrt(y0/parabolicTerm)
       vect(1,parm) = NaN;
       continue
    end
    if abs(d3)<error
       d3 = 0;
       t = (parabolicTerm*z0^2 - y0)/d2;
       vect(1,parm) = t;
       continue
    end
    if d3 ~=0
        a = 1; 
        b= (2*z0/d3) - (d2/(parabolicTerm*d3^2));
        c= (z0/d3)^2 - (y0/(parabolicTerm*d3^2));

        delta = b^2-4*a*c;
        if  delta <= 0
           t = NaN;
           vect(1,parm) = t;
           continue
        end
        
        if z0 == 0
            t = (parabolicTerm*z0^2 - y0)/d2;
            vect(1,parm) = t;
            continue
        end
        
        t1 = (-b -sqrt(delta))/2*a;
        t2 = (-b +sqrt(delta))/2*a;
        
        y1 = y0 + d2*t1;
        y2 = y0 + d2*t2;
        
        z1 = z0 + d3*t1;
        z2 = z0 + d3*t2;

        if z1 < 0 && z1>Constant
            t = t1;
            vect(1,parm) = t;
            continue
        end
        
        if z2 < 0 && z2 >Constant
            t = t2;
            vect(1,parm) = t;
            continue
        end
        
        vect(1,parm) = NaN;
end
    
end