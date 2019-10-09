function [ArmToPlay]= UCBTuned_RecommendArm(Success, Success2, NbrPlayArm, t)
    if( t <=0)
        error('Invalid Time step. t<=0')
    end
    m =  Success./NbrPlayArm;
    V = Success2./NbrPlayArm - m.^2 + sqrt(2*log(t)./NbrPlayArm);
    ucb = m + sqrt(log(t)./NbrPlayArm.*V);
    ArmToPlay = PickingMaxIndexArm(ucb);
end