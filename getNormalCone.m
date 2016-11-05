function n = getNormalCone(pointOfInterest, radiusChange, height)
%GETNORMALCONE Given the point in the cone (centered at 0,0,0), its radius
%change and its height, it returns a normalizedcolumn vector [x;y;z] of the
% direction of the normal 

%   Detailed explanation goes here
x = pointOfInterest(1,1);
y = pointOfInterest(2,1);

N = [-x; -y];
N = N/norm(N);
N = [N; radiusChange/height];
n = N/norm(N);

end

