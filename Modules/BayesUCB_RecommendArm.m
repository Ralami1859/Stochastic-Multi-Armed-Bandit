function [ArmToPlay]= BayesUCB_RecommendArm(alphas, betas, t, Horizon, HF, c)
    if HF;
        d = 1./(t.*log(t+1).^c);
    else
        d = 1./(t.*log(Horizon).^c);
    end
    q = betainv(1 - d, alphas, betas); %Bayes UCB index
    [~, ArmToPlay] = max(q);
end