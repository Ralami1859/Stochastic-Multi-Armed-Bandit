function [ArmToPlay]= ThompsonSampling_RecommendArm(alphas, betas)
    K = length(alphas); % Nbr Arm
    Theta = [];
    for i = 1:K;
        Theta = [Theta betarnd(alphas(i),betas(i))]; % Sampling from Beta distribution
    end
    [~, ArmToPlay] = max(Theta);
end