function [C_Kshi] = Kshi(A,D,Ks)
%%Influential spreaders identification in complex networks with improved k-shell hybrid method
%A为邻接矩阵，D为节点距离
N = size(A,2);
% Ks = K_Shell(A);
C1 = repmat(Ks,1,N);
C2 = repmat(Ks',N,1);
a1 = (C1.*C2).^(0.5);
clear C1 C2;

r = 3;
u = D;
u = (2*(r-u+1))/(r*(r+1));

Deg = sum(A,1);
RepDeg = repmat(Deg,N,1);

DD = D;
DD(DD>3) = 0;
DD = DD.*DD;
DD = 1./DD;
DD(DD==inf) = 0;

K = (a1 + u.*RepDeg).*DD;
C_Kshi = sum(DD,2);
end

