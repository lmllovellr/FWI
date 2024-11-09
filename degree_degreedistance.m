function [D,deg]=degree_degreedistance(A)
N=max(size(A));
D=zeros(N);
B=graph(A);
deg=degree(B);
for i=1:N
    for j=1:N
        if deg(i)==0||deg(j)==0
            D(i,j)=0;
        else
            D(i,j) =max (deg(i),deg(j)) /min (deg(i),deg(j));
        end
    end
end