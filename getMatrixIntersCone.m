function [ FinalValueT ] = getMatrixIntersCone( InitialPoints, Directions, radius, radiusChange, height )
%GETMATRIXINTERSCONE Summary of this function goes here
%   Detailed explanation goes here

for n = 1:length(InitialPoints(1,:))
   FinalValueT(n) = getIntersCone(InitialPoints(:,n),Directions(:,n),radius,radiusChange,height); 
end

end

