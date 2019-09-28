function [ArmToPlay]= UCBV_RecommendArm(Success, Success2, NbrPlayArm, t)
    if( t <=0)
        error('Invalid Time step. t<=0')
    end
    m =  Success./NbrPlayArm;
    V = Success2./NbrPlayArm - m.^2;
    ucb = m + sqrt(2*log(t).*V./NbrPlayArm) + 3*log(t)./NbrPlayArm;
    ArmToPlay = PickingMaxIndexArm(ucb);
end