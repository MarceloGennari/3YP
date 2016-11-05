function plottingMatrixLines(InitialPoints, Directions, FinalValuesT, color )
%PLOTTINGMATRIXLINES Summary of this function goes here
%   Detailed explanation goes here
for n = 1:length(InitialPoints(1,:))
   
   Plotting_Lines(InitialPoints(:,n),Directions(:,n),FinalValuesT(n),color);
   hold on
end
end

