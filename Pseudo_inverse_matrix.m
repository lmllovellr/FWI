function [R,L,LPI]=Pseudo_inverse_matrix(N,adj)
%%����Ϊ�ڽӾ���adj�ͽڵ���ĿN��
%%���Ϊ�ڵ�֮��ĵ���R��������˹����L��������˹�����α�����LPI��
A=adj;
G=graph(A);
L = laplacian(G);%%%%������˹����
n=N;R=zeros(n,n);
e=ones(n,1);
LPI=inv(L-((e*e')./n))+((e*e')./n);%%%%������˹�����α�����
%%%����ڵ�֮��ĵ���
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