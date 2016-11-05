function M = getMatrixDirAftPaMirr(IntersectionMatrix, DirectionsMatrix, parabolicTerm)
%%This functions returns a matrix of directions after the incident lines
%%defined by the IntersectionsMatrix and the DirectionsMatrix is reflected
%%in the parabolic mirror


for parm = 1:length(IntersectionMatrix(1,:))
    Intersection = IntersectionMatrix(:,parm);
    z = Intersection(3,1);
    
    a = parabolicTerm;

    N = [0; 1/sqrt(1+4*a*a*z*z);  -2*a*z/sqrt(1+4*a*a*z*z)];
        %Plotting_Lines(Intersection,N,1,'g')

    d = DirectionsMatrix(:,parm);

    r = getReflectedDirection(d,N);
    
    M(:,parm) = r;
    
end
end