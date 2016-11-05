function [ IntersPoints ] = getPointsIntersCone( InitialPoints,Directions,FinalValueT )
%GETPOINTSINTERSCONE This function gets the Intersection Points of the rays
%of light colliding with the cone. If the value of t given is NaN (because
%it doesn't collide), then this function "deletes" that ray of light

counter = 1;
for n = 1:length(FinalValueT)
    if isnan(FinalValueT(n))
       continue 
    end
    
   IntersPoints(:,counter) = InitialPoints(:,n) + Directions(:,n)*FinalValueT(n);
   counter = counter+1;
end

end

