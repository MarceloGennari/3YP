function reflectedDirection = getReflectedDirection( incidentDirection, normalDirection )
%GETREFLECTEDDIRECTION Given the incident ray direction and the normal at
%the point of reflection, this function returns the reflected direction of
%the wave


%%   To do that we just use the formula  r = d - 2*(dot(d,N)*N), given that N and d are vectors

    reflectedDirection = incidentDirection - 2*(dot(incidentDirection,normalDirection)*normalDirection);
    
    %Here we are just normalizing it so that it is a unit vector
    reflectedDirection = reflectedDirection / norm(reflectedDirection);

end

