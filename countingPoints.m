function [ numberPoints ] = countingPoints( xVector, yVector, xBottom, xTop, yBottom, yTop )
%COUNTINGPOINTS This function counts the number of points that satisfy
%xBottom<xVector(n)<xTop AND yBottom<yVector(n)<yTop

counter = 0;
for i = 1:length(xVector)
   if xBottom < xVector(i) && xVector(i) < xTop && yBottom < yVector(i) && yVector(i) < yTop
       counter = counter + 1;
   end

    
end

numberPoints = counter;

end

