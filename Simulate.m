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
    
    %Defining parabolic mirror
    t = linspace(-2,0,100);
    t2 = linspace(-3,3);
    Z = t;
    X = t2;
    [XX ZZ] = meshgrid(X,Z);
    YY = a*ZZ.^2;
    
%Defining the cone:
    centreVector = [0;-0.5;-3];
    height = 3;
    radius=1;
    radiusChange = 3;
    
%%Plotting Cone
   plottingCone(radius, radiusChange, height, centreVector);

%% GETTING RESULTS AS IF CONE WAS IN THE CENTRE 0;0;0
[InitialPoints, Directions] = generateBeamLight(zPlaneBeam,xBeamCentre,yBeamCentre,Direction,10,5,900);

FinalValuesTCone = getMatrixIntersCone(InitialPoints,Directions,radius,radiusChange,height);
IntersectionsWithCone = getPointsIntersCone(InitialPoints,Directions,FinalValuesTCone);
ReflectedWithCone = getReflDirectionsCone(InitialPoints,Directions,radius,radiusChange,height);

InitialPointsThatWereReflected = getMatricesIntersect(InitialPoints,FinalValuesTCone);
DirectionsInitialPointsThatWereReflected = getMatricesIntersect(Directions,FinalValuesTCone);
TInitialPoints = getMatricesIntersect(FinalValuesTCone,FinalValuesTCone);

%% TRANSLATING EVERYTHING TO WHERE POSITION IS ACTUALLY

IntersectionsWithCone(1,:) = IntersectionsWithCone(1,:) + ones(1,length(IntersectionsWithCone(1,:))).*centreVector(1,1);
IntersectionsWithCone(2,:) = IntersectionsWithCone(2,:) + ones(1,length(IntersectionsWithCone(2,:))).*centreVector(2,1);
IntersectionsWithCone(3,:) = IntersectionsWithCone(3,:) + ones(1,length(IntersectionsWithCone(3,:))).*centreVector(3,1);

InitialPointsThatWereReflected(1,:) = InitialPointsThatWereReflected(1,:) + ones(1,length(InitialPointsThatWereReflected(1,:))).*centreVector(1,1);
InitialPointsThatWereReflected(2,:) = InitialPointsThatWereReflected(2,:) + ones(1,length(InitialPointsThatWereReflected(2,:))).*centreVector(2,1);
InitialPointsThatWereReflected(3,:) = InitialPointsThatWereReflected(3,:) + ones(1,length(InitialPointsThatWereReflected(3,:))).*centreVector(3,1);

%% Reflecting into the Parabola

VectorTIncidentParabolic = getVectTIntersP(IntersectionsWithCone,ReflectedWithCone,a);
IntersPointsParabolic = getMatrixIntersP(IntersectionsWithCone,ReflectedWithCone,VectorTIncidentParabolic);
DirAftIntPMirr = getMatrixDirAftPMirr(IntersPointsParabolic,getMatricesIntersect(ReflectedWithCone,VectorTIncidentParabolic), a);

InitialPointsThatWereReflectedTwice = getMatricesIntersect(InitialPointsThatWereReflected,VectorTIncidentParabolic);
DirectionsInitialPointsThatWereReflectedTwice = getMatricesIntersect(DirectionsInitialPointsThatWereReflected,VectorTIncidentParabolic);
TInitialPointsTwice = getMatricesIntersect(TInitialPoints,VectorTIncidentParabolic);
IntersectionsWithCone = getMatricesIntersect(IntersectionsWithCone,VectorTIncidentParabolic);
ReflectedWithCone = getMatricesIntersect(ReflectedWithCone,VectorTIncidentParabolic);

%% PLOTTING INCIDENT INITIAL RAYS
plottingMatrixLines(InitialPointsThatWereReflectedTwice,DirectionsInitialPointsThatWereReflectedTwice,TInitialPointsTwice,'b');

%% PLOTTING REFLECTED RAYS
plottingMatrixLines(IntersectionsWithCone,ReflectedWithCone,VectorTIncidentParabolic,'g');

%% PLOTTING REFLECTED RAYS
plottingMatrixLines(IntersPointsParabolic,DirAftIntPMirr,ones(1,length(IntersPointsParabolic))*3,'r');
xlabel('x');
ylabel('y');
zlabel('z');

%% PLOTTING PARABOLA
    surf(XX,YY,ZZ);
    
%% PLOTTING POINTS OF INTERSECTION OF LINES AND PLANE Z=K;
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