function [ InitialPoints Directions ] = generateBeamLight(zPlane, xCentre,yCentre,Direction, width, length, numberOfBeams)
%GENERATEBEAMLIGHT Generates n Beams Of Light that leaves at z = zPlane and is
%in the direction given and centered in xCentre and yCentre

%   Detailed explanation goes here
a = numberOfBeams;
d1 = Direction(1,1);
d2 = Direction(2,1);
d3 = Direction(3,1);

Directions = [ones(1,a)*d1
              ones(1,a)*d2
              ones(1,a)*d3];
          
    ind = 1;
    
for n = linspace(-width/2,width/2,sqrt(a));
    for k = linspace(-length/2,+length/2,sqrt(a));
    
   InitialPoints(:,ind) = [n+xCentre
                            k+yCentre
                            zPlane];
    ind= ind+1;
    end
end

end

