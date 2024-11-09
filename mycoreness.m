function core=mycoreness(a)
%输出参数core为各节点的核数，输入参数a为邻接矩阵 
d=sum(a); %计算每个节点的度
dminmax=minmax(d); %求最小度和最大度
core=dminmax(1)*ones(size(d)); %核的初始值=最小度
td=d; %删除节点及边后，各节点度的值，这里是初值
for k=dminmax(1):dminmax(2)
    while sum(td>=1 & td<=k)
        ind=find(td>=1 & td<=k); %找度小于等于k的节点
        a(:,ind)=0; a(ind,:)=0; %删除度小于等于k的节点对应的边
        td=sum(a);  %重新计算各节点的度
    end
    core=core+(td>0); %删除节点及对应边后，度非零的节点，核数加1
end
