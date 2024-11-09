function [ RESULT,GML ] = get_multi_local( dis,num_node,q )
%GET_MULTI_LOCAL 求解每个点的多重局部维数 
%   Result 结果
%   dis 最短距离矩阵；num_node 节点数目；q 多重维数q值
RESULT = zeros(2,num_node);                          % 结果集合
max_dis = max(dis);                              % 每个点的最大距离
% 点循环
for select_node = 1:num_node                     % 遍历所有点
    
    % 每个点内部的初始化---> 最大距离、盒中点集合、距离集合
    R_max = max_dis(select_node);
    num_node_in_box = zeros(1,R_max);
    R_set = zeros(1,R_max);
    
    % 半径增长，得到盒子中点数目 --> P
    for r = 1:R_max                              % 距离从1到最大距离
        R_set(r) = log2(r);  % 距离集合
        for other_node = 1:num_node
            if dis(select_node,other_node) <= r
               num_node_in_box(r) =  num_node_in_box(r) + 1;
            end
        end
    end
    
    num_node_in_box = num_node_in_box / num_node;
      
    % 得到分子
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
    
    % 得到斜率，即多重局部维数
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



