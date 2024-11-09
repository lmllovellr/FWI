function [D,aver_D]=Aver_Path_Length(A)
%求解网络节点的距离及平均距离
%D-------------距离矩阵
%aver_D--------平均距离
N=size(A,2);
D=A;
D(find(D==0))=inf;
for i=1:N
    D(i,i)=0;
end
for k=1:N
    for i=1:N
        for j=1:N
            if D(i,j)>D(i,k)+D(k,j)
                D(i,j)=D(i,k)+D(k,j);
            end
        end
    end
end
aver_D=sum(sum(D))/(N*(N-1));
if aver_D==inf
    disp('该图不是联通图');
end
end
