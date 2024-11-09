function [score_KL, score_JS] = KL_JS_div(vec1, vec2) 
% Compute Kullback-Leibler Divergence
score_KL1 = sum(sum(vec1.* log(eps + vec1./(vec2+eps))));
score_KL2 = sum(sum(vec2.* log(eps + vec2./(vec1+eps))));
score_KL = (score_KL1+score_KL2)./2;
% Compute Jensen-Shannon Divergence
score_JS = (sum(sum(vec1.* log(eps + vec1./((vec1+vec2)./2+eps))))+sum(sum(vec2.* log(eps + vec2./((vec1+vec2)./2+eps)))))./2;
if vec1==vec2
    score_KL=0;
    score_JS=0;
end