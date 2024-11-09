function dij=graShortdistance(adj,N)
dij=[];
for i=1:N 
    dij=[dij; simple_dijkstra(adj,i) ];
    dij(i,i)=0;
end
dij(dij==inf)=0;
% [x y]=find(dij==inf);
% dij(x,y)=0;  
% dij(y,x)=0;