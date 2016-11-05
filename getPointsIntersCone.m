function [ IntersPoints ] = getPointsIntersCone( InitialPoints,Directions,FinalValueT )
%GETPOINTSINTERSCONE Summary of this function goes here
%   Detailed explanation goes here
for n = 1:length(FinalValueT)
   IntersPoints(:,n) = InitialPoints(:,n) + Directions(:,n)*FinalValueT(n);
end

end

