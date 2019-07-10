function [ArmToPlay]= BayesUCB_RecommendArm(alphas, betas, t, Horizon)
    K = length(alphas); % Nbr Arm
    q = [];
    q = betainv(1 - 1./(t.*log(Horizon)),alphas, betas); %Bayes UCB index
    [~, ArmToPlay] = max(q);
end