clear

Direction = [-0.5;-0.2;-1];
Direction = Direction/norm(Direction);
[InitialPoints Directions] = generateBeamLight(6,0,3,Direction,5,5,25);


height = 4;
radius=1;
radiusChange = 4;

centreVector = [0;0;0];

plottingCone(radius,radiusChange,height,centreVector);
hold on;
xlabel('x');
ylabel('y');
zlabel('z');

%% TESTING SCRIPT
FinalValuesT = getMatrixIntersCone(InitialPoints,Directions,radius,radiusChange,height);
Intersections = getPointsIntersCone(InitialPoints,Directions,FinalValuesT);
Reflected = getReflDirectionsCone(InitialPoints,Directions,radius,radiusChange,height);



plottingMatrixLines(InitialPoints,Directions,FinalValuesT,'g');
plottingMatrixLines(Intersections,Reflected,FinalValuesT,'r');