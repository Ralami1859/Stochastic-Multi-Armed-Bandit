function [ArmToPlay]= MOSS_RecommendArm(ExpectedMeans, NbrPlayArm, Horizon)
    ucb =  ExpectedMeans + sqrt(log(max(Horizon./(length(NbrPlayArm).*NbrPlayArm)))./NbrPlayArm);
    m = max(ucb); 
    I = find(ucb == m);
    ArmToPlay = I(1+floor(length(I)*rand));
end