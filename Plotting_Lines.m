function Plotting_Lines(InitialPoint, direction, finalValueT, color)


t = linspace(0,finalValueT);

directionUnitary = direction/norm(direction);

M = directionUnitary*t + InitialPoint*ones(1,100);
x = M(1,:);
y = M(2,:);
z = M(3,:);

plot3(x,y,z,color);

end