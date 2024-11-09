function [R,LPI]=Pseudo_inverse_matrix2(N,adj)
%%输入为邻接矩阵adj和节点数目N；
%%输出为节点之间的电阻R，拉普拉斯矩阵L和拉普拉斯矩阵的伪逆矩阵LPI；
A=adj;
G=graph(A);
 L=diag(sum(A))-A;
%  L = laplacian(G);%%%%拉普拉斯矩阵
n=N;R=zeros(n,n);
e=ones(n,1);
LPI=pinv(L-((e*e')./n),1.8829*e-013)+((e*e')./n);%%%%拉普拉斯矩阵（拉普拉斯矩阵的第 i 行其实是第 i 个节点在产生扰动时对其他节点产生的收益累积）的伪逆矩阵(满足几何约束条件下的最优解，)
%%%计算节点之间的电阻
for i=1:n
    for j=i:n
%         if A(i,j)==1 
            R(i,j)=abs(LPI(i,i)+LPI(j,j)-2*LPI(i,j));
%             R(j,i)=abs((1-R(i,j))/(n-1));
%  R(j,i)=1-R(i,j);
%         end
    end
end
 
    
R=R+R';