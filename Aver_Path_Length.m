function [D,aver_D]=Aver_Path_Length(A)
%�������ڵ�ľ��뼰ƽ������
%D-------------�������
%aver_D--------ƽ������
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
    disp('��ͼ������ͨͼ');
end
end
