function [ArmToPlay]= MOSS_RecommendArm(ExpectedMeans, NbrPlayArm, Horizon)
    ucb =  ExpectedMeans + sqrt(max(log(Horizon./(length(NbrPlayArm).*NbrPlayArm)),0)./NbrPlayArm);
    m = max(ucb); 
    I = find(ucb == m);
    ArmToPlay = I(1+floor(length(I)*rand));
end