function core=mycoreness(a)
%�������coreΪ���ڵ�ĺ������������aΪ�ڽӾ��� 
d=sum(a); %����ÿ���ڵ�Ķ�
dminmax=minmax(d); %����С�Ⱥ�����
core=dminmax(1)*ones(size(d)); %�˵ĳ�ʼֵ=��С��
td=d; %ɾ���ڵ㼰�ߺ󣬸��ڵ�ȵ�ֵ�������ǳ�ֵ
for k=dminmax(1):dminmax(2)
    while sum(td>=1 & td<=k)
        ind=find(td>=1 & td<=k); %�Ҷ�С�ڵ���k�Ľڵ�
        a(:,ind)=0; a(ind,:)=0; %ɾ����С�ڵ���k�Ľڵ��Ӧ�ı�
        td=sum(a);  %���¼�����ڵ�Ķ�
    end
    core=core+(td>0); %ɾ���ڵ㼰��Ӧ�ߺ󣬶ȷ���Ľڵ㣬������1
end
