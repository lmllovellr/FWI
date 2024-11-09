function [HKS] = HKS(A)
%% A hierarchical approach for influential node ranking in complex social networks
N = size(A,2);
AA = A;
Deg = sum(A,2);
B = zeros(N,1);

b = 1;
shell = 1;
Remove = [];

while true
    Deg = sum(A,1);
    flag = 0;
    for i = 1:N
        if ismember(i,Remove)==0
            if Deg(i)<=shell
                B(i) = b;
                flag = 1;
            end
        end
    end
    
    if flag==1
        for i = 1:N
            if ismember(i,Remove)==0               
                if  B(i) == b
                    Remove(end+1) = i;
                    A(i,:) = 0;
                end
            end
        end
        b = b+1;   
    else
        shell = shell + 1;
    end
    
    if length(Remove)==N
        break
    end
end

Allnode = Remove;

F = zeros(N,1);
f = max(B);

for i = 1:N
    Ni = find(AA(i,:)==1);
    
    if B(i)>=max(B(Ni))
        F(i) = B(i);
    else
        F(i) = 0;
    end
end

while true

    for i =1:N
        
        f = max(F(Allnode));
       if ismember(i,Allnode)==1               
            if  F(i) == f
                Ni = find(AA(i,:)==1);
                
                for j = 1:length(Ni)
                    if ismember(Ni(j),Allnode)==1
                        if F(i)-1>F(Ni(j))
                            F(Ni(j)) = F(i)-1;
                        end
                    end
                end
            Allnode = setdiff(Allnode,i);
            end
       end

    end
    
    if length(Allnode)==0
        break
    end
end

Deg = sum(AA,2);
DBF = Deg.*((B+F));

DBF = repmat(DBF',N,1);

HKS = sum(DBF.*AA,2);

end

