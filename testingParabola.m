clear
close all

%% DEFINING THE BEAM OF LIGHT

xBeamCentre = 0;
yBeamCentre = 5;
zPlaneBeam = 1.5;
Direction = [0;-3.2;-1];
Direction = Direction/norm(Direction);
    
    %% GETTING RESULTS AS IF CONE WAS IN THE CENTRE 0;0;0
[InitialPoints Directions] = generateBeamLight(zPlaneBeam,xBeamCentre,yBeamCentre,Direction,1,1,25);

%Plotting parabolic mirror
    a = 0.5;
    t = linspace(-2,0,100);
    t2 = linspace(-3,3);
    Z = t;
    X = t2;
    [XX ZZ] = meshgrid(X,Z);
    YY = a*ZZ.^2;

    surf(XX,YY,ZZ);
    hold on
    
%% GETTING INTERSECTIONS
    
VectorTIncidentParabolic = getVectTIntersP(InitialPoints,Directions,a);
IntersPointsParabolic = getMatrixIntersP(InitialPoints, Directions, VectorTIncidentParabolic);
DirAftIntPMirr = getMatrixDirAftPMirr(IntersPointsParabolic, Directions, a);

InitialPointsToBePlotted = getMatricesIntersect(InitialPoints,VectorTIncidentParabolic);
DirectionsToBePlotted = getMatricesIntersect(Directions,VectorTIncidentParabolic);

%%PLOTTING INCIDENT RAYS
plottingMatrixLines(InitialPointsToBePlotted,DirectionsToBePlotted,VectorTIncidentParabolic,'g');

%%PLOTTING REFLECTED RAYS
plottingMatrixLines(IntersPointsParabolic,DirAftIntPMirr,ones(1,length(IntersPointsParabolic))*4,'r');
xlabel('x');
ylabel('y');
zlabel('z');