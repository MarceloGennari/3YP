function plottingMatrixLines(InitialPoints, Directions, FinalValuesT, color )
%PLOTTINGMATRIXLINES This function plots the matrix of rays defined by the
%Initial POints, the Directions and the distance T that it should be
%plotted. If the value of T is not a number, then it doesn't plot it, since
%it has been "deleted"

counter = 1;
for n = 1:length(FinalValuesT(1,:))
   if isnan(FinalValuesT(n))
       continue
   end
   
   Plotting_Lines(InitialPoints(:,counter),Directions(:,counter),FinalValuesT(n),color);
   hold on
    counter = counter +1;
end
end

