function [R,LPI]=Pseudo_inverse_matrix2(N,adj)
%%����Ϊ�ڽӾ���adj�ͽڵ���ĿN��
%%���Ϊ�ڵ�֮��ĵ���R��������˹����L��������˹�����α�����LPI��
A=adj;
G=graph(A);
 L=diag(sum(A))-A;
%  L = laplacian(G);%%%%������˹����
n=N;R=zeros(n,n);
e=ones(n,1);
LPI=pinv(L-((e*e')./n),1.8829*e-013)+((e*e')./n);%%%%������˹����������˹����ĵ� i ����ʵ�ǵ� i ���ڵ��ڲ����Ŷ�ʱ�������ڵ�����������ۻ�����α�����(���㼸��Լ�������µ����Ž⣬)
%%%����ڵ�֮��ĵ���
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