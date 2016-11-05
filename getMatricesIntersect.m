function MatrixRefl = getMatricesIntersect( MatrixIncident, FinalValuesT )
%GETMATRICESINTERSECT In order to plot lines, we need to get the matrix of
%the incident ray that will intersect the cone. 

counter = 1;
for n = 1:length(FinalValuesT)
    if isnan(FinalValuesT(n))
       continue 
    end
    
    MatrixRefl(:,counter) = MatrixIncident(:,n);
   counter = counter+1;
end


end

