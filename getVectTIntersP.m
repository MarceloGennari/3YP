function vect = getVectTIntersP(InitialPoints, Directions, parabolicTerm)
%%This functions returns a vector of value for the parameter t when the
%%incident line (defined by a matrix of initialPoints and directions of
%%vectors where each column of each of those matrix indicates the
%%specification of a line) intersects the parabola


for parm = 1:length(Directions(1,:));
    error = 1e-5;
    initial = InitialPoints(:,parm);
    direction = Directions(:,parm);
    if abs(direction(3,1))<error
       direction(3,1) = 0; 
    end
    if direction(3,1) ~=0
        a = 1; 
        b= (2*initial(3,1)/(direction(3,1)) - (direction(2,1)/(parabolicTerm*direction(3,1)^2)));
        c= (initial(3,1)/direction(3,1))^2 - (initial(2,1)/(parabolicTerm*(direction(3,1)^2)));

        delta = b^2-4*a*c;
        if  delta <= 0
           t = NaN;
           vect(1,parm) = t;
           continue
        end
        t1 = (-b -sqrt(delta))/2*a;
        t2 = (-b +sqrt(delta))/2*a;

        if t1>t2
            t = t1;
        else
            t = t2;
        end
    elseif direction(3,1) == 0
        t = (parabolicTerm*initial(3,1)^2 - initial(2,1))/direction(2,1);
    end
    vect(1,parm) = t;
end
    
end