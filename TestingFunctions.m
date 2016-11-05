Direction = [0;0;-1];
Direction = Direction/norm(Direction);

[InitialPoints Directions] = generateBeamLight(1,2,1,Direction,2,2,100);
FinalValuesT = ones(1,length(InitialPoints(1,:)))*3;
plottingMatrixLines(InitialPoints,Directions,FinalValuesT, 'g');