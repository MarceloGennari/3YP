function [ ReflectedDir ] = getReflDirectionsCone( InitialPoints,Directions,radius, radiusChange, height )
%GETREFLDIRECTIONSCONE This function returns the values of the directions
%of the ray of light. If the ray has t = NaN, then it "deletes" that ray.

FinalValuesT = getMatrixIntersCone(InitialPoints,Directions,radius,radiusChange,height);
PointsOfInterest = getPointsIntersCone(InitialPoints,Directions,FinalValuesT);

counter = 1;
for n = 1:length(InitialPoints(1,:))
    if isnan(FinalValuesT(n));
       continue 
    end
    
    normal = getNormalCone(PointsOfInterest(:,counter),radiusChange,height);
    ReflectedDir(:,counter) = getReflectedDirection(Directions(:,counter),normal);
    
    counter = counter+1;
end

end

