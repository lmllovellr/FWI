function [C] = Ls(A,Ks)
%% Ranking the spreading capability of nodes in complex networks based on link significance
N = size(A,2);
Deg = sum(A,2);  %½Úµã¶È
% Ks  = K_Shell(A);

Ls = zeros(N,N);
Union = zeros(N,N);
Intersection = zeros(N,N);

for i=1:N
    for j = i+1:N
        Ls(i,j) =1- sum(A(i,:).* A(j,:))/(Deg(i)+Deg(j)-sum(A(i,:).* A(j,:)));
    end
end

Ls = Ls +Ls';
Ls = Ls.*A;

Ksy = (Ks./Deg).*sum(Ls,2);
Ksy = repmat(Ksy',N,1);

C = sum(Ls.*Ksy,2);

end

