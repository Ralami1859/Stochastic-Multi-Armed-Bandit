function [ArmToPlay]= CPUCB_RecommendArm(ExpectedMeans, NbrPlayArm, t, c)
    if( t <=0)
        error('Time step invalide. t<=0')
    end
    [~, ic] = binofit(floor(ExpectedMeans.*NbrPlayArm), NbrPlayArm, 1/(t.^c));
    ucb = ic(:,2);
    m = max(ucb); 
    I = find(ucb == m);
    ArmToPlay = I(1+floor(length(I)*rand));
end