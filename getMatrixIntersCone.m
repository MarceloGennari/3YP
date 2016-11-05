function [ FinalValueT ] = getMatrixIntersCone( InitialPoints, Directions, radius, radiusChange, height )
%GETMATRIXINTERSCONE This function gets a matrix of InitialPoints,
%Directions and the specification of the cone (radius, radiusChange and
%height) and returns a vector of the values of t for which the ray will intersect the
%cone.

for n = 1:length(InitialPoints(1,:))
   FinalValueT(n) = getIntersCone(InitialPoints(:,n),Directions(:,n),radius,radiusChange,height); 
end

end

