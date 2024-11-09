function [MixDD] = MixDegree(A)

A = full(A);
N = size(A,2);

Deg = sum(A,2);
MixDeg = Deg;


RemoveNode = [];
while true
     
    minDeg = N;
    for i = 1:N
        if  ismember(i,RemoveNode)==0
            if minDeg>=MixDeg(i)
                minDeg = MixDeg(i);
            end
        end
    end    
    
    renew = [];
    for i = 1:N
        if  ismember(i,RemoveNode)==0
            if MixDeg(i) == minDeg
                RemoveNode(end+1) = i;
                renew = [renew,find(A(i,:)~=0)];
                A(i,:) = 0;
            end
        end
    end
    
    TemDeg = sum(A,1)';
    renew = unique(renew);
    renew = setdiff(renew,RemoveNode);
    
    for i = 1:length(renew)
        MixDeg(renew(i)) = TemDeg(renew(i)) + 0.7 * (Deg(renew(i)) - TemDeg(renew(i)));
    end
    
    if length(RemoveNode)==N
        break;
    end
end

MixDD = MixDeg;

end

