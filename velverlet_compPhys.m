% function [coord,v,a,f,pe,ke]= velverlet(coord,v,a,f,pe,ke);

function [coord,vel,accelrnNEW,PE,KE]= velverlet_compPhys(count,inputVectorType,coord,vel,accelrn,total,numMov,movAtom,mass);

% global boxSize;
global delT countTotal;
% if(count <= 250) 
% 	delT = 0.1;
% else
% 	delT = -0.05;
% end

delT = 0.001;

KE = 0;
% accelrn = zeros(total,3);%????????????????????????

coord= coord + vel.*delT + 1/2.*accelrn.*delT^2;

% for i=1:total
%    if(coord(i,1) > boxSize/2)
%       coord(i,1) = coord(i,1) - boxSize;
%    end
%    if(coord(i,1) < -boxSize/2)
%       coord(i,1) = coord(i,1) + boxSize;
%    end
% 
%    if(coord(i,2) > boxSize/2)
%       coord(i,2) = coord(i,2) - boxSize;
%    end
%    if(coord(i,2) < -boxSize/2)
%       coord(i,2) = coord(i,2) + boxSize;
%    end
% 
%    if(coord(i,3) > boxSize/2)
%       coord(i,3) = coord(i,3) - boxSize;
%    end
%    if(coord(i,3) < -boxSize/2)
%       coord(i,3) = coord(i,3) + boxSize;
%    end
% 
% end


% vel= vel + 1./2. *accelrn.*(delT);

% [coord,a,f,pe] = forceLJ(coord,a,f,pe);


% [tersoff_PE2,force1] = NNG98_2_coordStore_PBC_4ForceComponentOnALLatomsInList(coord,total,numMov,numPeriph,numBound,numSurface,movAtom1,periphAtom,boundAtom,surfaceAtom);
% [tersoff_PE1,force2] = NNG98_2_coordStore_PBC_4ForceComponentOnALLatomsInList(coord,total,numMov,numPeriph,numBound,numSurface,movAtom2,periphAtom,boundAtom,surfaceAtom);
% [tersoff_PE,force] = tersoffSi3_PeriodicBoundaryCond(coord,total,numMov,numPeriph,numBound,numSurface,movAtom,periphAtom,boundAtom,surfaceAtom);
% [tersoff_PE,force] = NNG98_2_coordStore(coord,total,numMov,numPeriph,numBound,movAtom,periphAtom,boundAtom);

% tersoff_PE = (tersoff_PE1 + tersoff_PE2)/2;
% force = (force1 + force2)/2;


[PE,force] = NNG98_2_coordStore_PBC_NEW_Iter01(count,inputVectorType,coord,total,1,1);

for i = 1:3
    accelrnNEW(:,i) = force(:,i)./mass;
end

vel= vel + 1./2. *(accelrn + accelrnNEW).*(delT);

velTot = sqrt(sum(vel.^2,2));

KE = sum(1/2*mass.*velTot.^2);


% accelrnNEW = force./mass;

% for i=1:total
% 	velTot(i)= sqrt(sum(vel(i,:).^2));
% end
% 
% for i=1:total
% 	KE= KE + 1/2*mass.*(velTot(i).^2);
% end

% KE= 1./2.* mass.* sum(vel.^2);
KE;




