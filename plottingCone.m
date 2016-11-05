function plottingCone( radius , radiusChange, height, CentreVector)
%PLOTTINGCONE This equation simply plots a half cone centered at the
%CentreVector, with initial radius = radius and final radius = radius +
%radiusChange and with height = height

%Plotting surface
    % Defining values for Z and X. X depends on the radius at a certain
    % height
    
    xCentre = CentreVector(1,1);
    yCentre = CentreVector(2,1);
    zCentre = CentreVector(3,1);
    
    t = linspace(0, 1*height);
    t2 = linspace(-1,1);
    Z = t;
    X = t2;
    
    [XX ZZ] = meshgrid(X,Z);
    
    
    radiusZ = linspace(radius, radius+radiusChange);
    radiusZ = meshgrid(radiusZ);
    radiusZ = radiusZ';
    
    XX = XX.*radiusZ;
    YY = sqrt(radiusZ.^2-(XX).^2);

    dimension = length(XX(:,1));
    
    XX = XX + ones(dimension,dimension)*xCentre;
    YY = YY + ones(dimension,dimension)*yCentre;
    ZZ = ZZ + ones(dimension,dimension)*zCentre;
    
    surf(XX,YY,ZZ);
    axis equal
end

