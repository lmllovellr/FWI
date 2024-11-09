function [List] = graph2adjlist(A)

N = size(A,2);
List = cell(N,1);
for i = 1:N
    List{i} = find(A(i,:)==1);
end


