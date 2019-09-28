function [ArmToPlay]= MOSS_RecommendArm(ExpectedMeans, NbrPlayArm, Horizon)
    ucb =  ExpectedMeans + sqrt(max(log(Horizon./(length(NbrPlayArm).*NbrPlayArm)),0)./NbrPlayArm);
    ArmToPlay = PickingMaxIndexArm(ucb);
end