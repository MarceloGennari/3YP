function M = getMatrixIntersP(InitialPoints, Directions, parabolicTerm)
%%This functions returns a matrix of points, where each column is
%%represents the x,y,z points where the line defined by InitialPoints and
%%Directions intersects the parabolic mirror

for parm = 1:length(Directions(1,:));
    
    initial = InitialPoints(:,parm);
    direction = Directions(:,parm);
    
    error = 1e-5;
     if abs(direction(3,1))<error
       direction(3,1) = 0; 
     end
    
    if direction(3,1)~=0
        a = 1; 
        b= (2*initial(3,1)/(direction(3,1)) - (direction(2,1)/(parabolicTerm*direction(3,1)^2)));
        c= (initial(3,1)/direction(3,1))^2 - (initial(2,1)/(parabolicTerm*(direction(3,1)^2)));

        delta = b^2-4*a*c;
        if  delta <= 0
           intersection = NaN;
           M(:,parm) = intersection; 
           continue
        end
        t1 = (-b -sqrt(delta))/2*a;
        t2 = (-b +sqrt(delta))/2*a;

        intersectionmid = [initial(1,1) + direction(1,1)*t1, initial(1,1) + direction(1,1)*t2
                            initial(2,1) + direction(2,1)*t1, initial(2,1) + direction(2,1)*t2
                            initial(3,1) + direction(3,1)*t1, initial(3,1) + direction(3,1)*t2];

        if intersectionmid(3,1) < 0
            intersection = intersectionmid(:,1);
            M(:,parm) = intersection; 
            continue
        else
            intersection = intersectionmid(:,2);
            M(:,parm) = intersection; 
            continue
        end

    elseif direction(3,1) == 0
        t = (parabolicTerm*initial(3,1)^2 - initial(2,1))/direction(2,1);
        intersection = [initial(1,1) + direction(1,1)*t
                            initial(2,1) + direction(2,1)*t
                            initial(3,1) + direction(3,1)*t];
    end    
   M(:,parm) = intersection; 
end
end