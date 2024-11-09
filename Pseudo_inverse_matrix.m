function [R,L,LPI]=Pseudo_inverse_matrix(N,adj)
%%输入为邻接矩阵adj和节点数目N；
%%输出为节点之间的电阻R，拉普拉斯矩阵L和拉普拉斯矩阵的伪逆矩阵LPI；
A=adj;
G=graph(A);
L = laplacian(G);%%%%拉普拉斯矩阵
n=N;R=zeros(n,n);
e=ones(n,1);
LPI=inv(L-((e*e')./n))+((e*e')./n);%%%%拉普拉斯矩阵的伪逆矩阵
%%%计算节点之间的电阻
for i=1:n
    for j=i:n
        %         if A(i,j)==1
        R(i,j)=LPI(i,i)+LPI(j,j)-2*LPI(i,j);
%         R(j,i)=abs((1-R(i,j))/(n-1));
        % %  R(j,i)=1-R(i,j);
        %         end
    end
end


R=R+R';