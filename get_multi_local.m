function [ RESULT,GML ] = get_multi_local( dis,num_node,q )
%GET_MULTI_LOCAL ���ÿ����Ķ��ؾֲ�ά�� 
%   Result ���
%   dis ��̾������num_node �ڵ���Ŀ��q ����ά��qֵ
RESULT = zeros(2,num_node);                          % �������
max_dis = max(dis);                              % ÿ�����������
% ��ѭ��
for select_node = 1:num_node                     % �������е�
    
    % ÿ�����ڲ��ĳ�ʼ��---> �����롢���е㼯�ϡ����뼯��
    R_max = max_dis(select_node);
    num_node_in_box = zeros(1,R_max);
    R_set = zeros(1,R_max);
    
    % �뾶�������õ������е���Ŀ --> P
    for r = 1:R_max                              % �����1��������
        R_set(r) = log2(r);  % ���뼯��
        for other_node = 1:num_node
            if dis(select_node,other_node) <= r
               num_node_in_box(r) =  num_node_in_box(r) + 1;
            end
        end
    end
    
    num_node_in_box = num_node_in_box / num_node;
      
    % �õ�����
    if q == 1
        I = num_node_in_box.*log2(num_node_in_box);
    else if q == 0
            num_node_in_box = 1 ./ num_node_in_box;
            I = log2(num_node_in_box);
        else
            num_node_in_box = power( (num_node_in_box),q );
            I = log2(num_node_in_box);
        end
    end
    
    % �õ�б�ʣ������ؾֲ�ά��
    y = I';
    n = length(y);
    x = R_set';
    a = [ones(n,1),x];
    cs = a\y;
    if q == 1
        RESULT(1,select_node) = cs(2);
    else
        RESULT(1,select_node) = cs(2)/(q-1);
    end
    RESULT(2,select_node) = select_node;
end
GML=RESULT(1,:)';
end



