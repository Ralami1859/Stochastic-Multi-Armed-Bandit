function [ArmToPlay]= UCBV_RecommendArm(ExpectedMeans, ExpectedVariances, NbrPlayArm, t)
    if( t <=0)
        error('Time step invalid. t<=0')
    end
    ucb = ExpectedMeans + sqrt(2*log(t).*ExpectedVariances./NbrPlayArm) + 3*log(t)./NbrPlayArm;
    m = max(ucb);
    I = find(ucb == m);
    ArmToPlay = I(1+floor(length(I)*rand)); % Breaking randomly the tie
end