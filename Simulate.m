close all;
clear all;
hold on;

%% DEFINING THE BEAM OF LIGHT

xBeamCentre = 0;
yBeamCentre = 3;
zPlaneBeam = 5;
Direction = [0;0;-1];
Direction = Direction/norm(Direction);


%% DEFINING EQUATION OF SURFACE
    %Surface is defined as y = a*z^2
    a = 0.5;

%Defining Centre of Square of light
    zCentre = -1;
    xCentre = 0;
    
%Plotting parabolic mirror
    t = linspace(-2,0,100);
    t2 = linspace(-3,3);
    Z = t;
    X = t2;
    [XX ZZ] = meshgrid(X,Z);
    YY = a*ZZ.^2;

    surf(XX,YY,ZZ);
    
%Defining the cone:
    centreVector = [0;-0.5;-3];
    height = 3;
    radius=1;
    radiusChange = 3;
    
%%Plotting Cone
    plottingCone(radius, radiusChange, height, centreVector);

%% GETTING RESULTS AS IF CONE WAS IN THE CENTRE 0;0;0
[InitialPoints Directions] = generateBeamLight(zPlaneBeam,xBeamCentre,yBeamCentre,Direction,1,0.5,25);

FinalValuesT = getMatrixIntersCone(InitialPoints,Directions,radius,radiusChange,height);
Intersections = getPointsIntersCone(InitialPoints,Directions,FinalValuesT);
Reflected = getReflDirectionsCone(InitialPoints,Directions,radius,radiusChange,height);

%% TRANSLATING EVERYTHING TO WHERE POSITION IS ACTUALLY

Intersections(1,:) = Intersections(1,:) + ones(1,length(Intersections(1,:))).*centreVector(1,1);
Intersections(2,:) = Intersections(2,:) + ones(1,length(Intersections(2,:))).*centreVector(2,1);
Intersections(3,:) = Intersections(3,:) + ones(1,length(Intersections(3,:))).*centreVector(3,1);

InitialPoints(1,:) = InitialPoints(1,:) + ones(1,length(InitialPoints(1,:))).*centreVector(1,1);
InitialPoints(2,:) = InitialPoints(2,:) + ones(1,length(InitialPoints(2,:))).*centreVector(2,1);
InitialPoints(3,:) = InitialPoints(3,:) + ones(1,length(InitialPoints(3,:))).*centreVector(3,1);

InitialPointsToBePlotted = getMatricesIntersect(InitialPoints,FinalValuesT);
DirectionsToBePlotted = getMatricesIntersect(Directions,FinalValuesT);

plottingMatrixLines(InitialPointsToBePlotted,DirectionsToBePlotted,FinalValuesT,'b');

%% Reflecting into the Parabola

InitialPoints = Intersections;
Directions2 = Reflected;

VectorTIncidentParabolic = getVectTIntersP(InitialPoints,Directions2,a);
IntersPointsParabolic = getMatrixIntersP(InitialPoints,Directions2,a);
DirAftIntPMirr = getMatrixDirAftPMirr(IntersPointsParabolic, Directions2, a);

%%PLOTTING INCIDENT RAYS
plottingMatrixLines(Intersections,Reflected,VectorTIncidentParabolic,'g');

%%PLOTTING REFLECTED RAYS
plottingMatrixLines(IntersPointsParabolic,DirAftIntPMirr,ones(1,length(IntersPointsParabolic))*4,'r');
xlabel('x');
ylabel('y');
zlabel('z');


%%PLOTTING POINTS OF INTERSECTION OF LINES AND PLANE Z=K;
plane = 0;
d1 = DirAftIntPMirr(1,:);
d2 = DirAftIntPMirr(2,:);
d3 = DirAftIntPMirr(3,:);

i1 = IntersPointsParabolic(1,:);
i2 = IntersPointsParabolic(2,:);
i3 = IntersPointsParabolic(3,:);

for parm = 1:length(IntersPointsParabolic(1,:))
    XZplane(parm) = i1(parm) + (d1(parm)/d3(parm))*(plane - i3(parm));
    YZplane(parm) = i2(parm) + (d2(parm)/d3(parm))*(plane - i3(parm));
end

figure;

scatter(XZplane, YZplane);
xlabel('x');
ylabel('y');
axis([-2 2 -1 1])