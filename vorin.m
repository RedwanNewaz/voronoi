%% Voronoi Diagram with Color
% This code uses |voronoin| and |patch| to
% fill the bounded cells of the same Voronoi diagram with color.

% Copyright 2015 The MathWorks, Inc.
clc;clear all;clf;
x = gallery('uniformdata',[10 2],4);
[v,c] = voronoin(x); 
count=1;
for i = 1:length(c) 
if all(c{i}~=1)   % If at least one of the indices is 1, 
                  % then it is an open region and we can't 
                  % patch that.
patch(v(c{i},1),v(c{i},2),i); % use color i.
bounded(count).edge=[v(c{i},1),v(c{i},2)];
count=count+1;
end
end
%% find unbound region
hold on
[vx,vy] = voronoi(x(:,1),x(:,2));
plot(vx,vy,'-r')
count=1;
for ii = 1:length(c) 
if any(c{ii}==1) 
    unbounded(count).edge=[v(c{ii},1),v(c{ii},2)];
    count=count+1;
end
end
%% draw bounded box 
bound=[-1,-1,3,3];
drawRect(bound)

%% 
for aa=1:length(unbounded)
aaEdge=unbounded(aa).edge;
ind=find(aaEdge==inf,1);
if(ind<size(aaEdge,1))
   FstPoint=aaEdge(ind-1,:);
   SndPoint=aaEdge(ind+1,:);
else
   FstPoint=aaEdge(ind-1,:);
   SndPoint=aaEdge(1,:);
end
   drawPoint(FstPoint)
%    find nearest intersect point
   drawPoint(SndPoint)
%    find nearest intersect point

% find nearest box corner p w.r.t min(dist(first,p)+dist(second,p))

% create matrix
% sect=[fistIntesect;corner;secIntersect];
end
