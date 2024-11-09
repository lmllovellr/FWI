function [KS_IF] = KS_IF(A)
%KS_IF 此处显示有关此函数的摘要
%   Fast ranking influential nodes in complex networks using a k-shell iteration factor

AA = A;
N = size(A,2);
Deg = sum(A,2);

level = 1;

Ks = zeros(N,1);
M = zeros(N,1);
NN = zeros(N,1);

RemoveNode = [];
Tem = [];

n_iteration = 1;

while true
    TemDeg = sum(A,1);
    
    flag = 0;
    for i = 1:N
        if  ismember(i,RemoveNode)==0
            if TemDeg(i)<=level
                Ks(i) = level;
                NN(i) = n_iteration;
                RemoveNode(end+1) = i;
                Tem(end+1) = i;
                A(i,:) = 0;
                flag = 1;
            end
        end
    end
    
if flag == 0
    level = level +1;
    M(Tem) = n_iteration - 1;
    n_iteration = 1;
    Tem = [];
else
    n_iteration = n_iteration + 1;
end
        
if length(RemoveNode)==N
    M(Tem) = n_iteration - 1;
    break;
end

end

u = Ks.*(1+NN./M);

KS_IF = Deg.*Ks + sum(repmat(u',N,1).*AA,2);


end

