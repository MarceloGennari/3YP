function [ ReflectedDir ] = getReflDirectionsCone( InitialPoints,Directions,radius, radiusChange, height )
%GETREFLDIRECTIONSCONE Summary of this function goes here
%   Detailed explanation goes here
FinalValuesT = getMatrixIntersCone(InitialPoints,Directions,radius,radiusChange,height);
PointsOfInterest = getPointsIntersCone(InitialPoints,Directions,FinalValuesT);

for n = 1:length(InitialPoints(1,:))
    normal = getNormalCone(PointsOfInterest(:,n),radiusChange,height);
    ReflectedDir(:,n) = getReflectedDirection(Directions(:,n),normal);
end

end

