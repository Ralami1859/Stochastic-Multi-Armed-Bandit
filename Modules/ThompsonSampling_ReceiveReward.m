function [alphas, betas, gainThompsonSampling, ArmsPlayed]= ThompsonSampling_ReceiveReward(alphas, betas, reward, ArmChosen, gainThompsonSampling, ArmsPlayed)
    if( (reward <0) + (reward > 1) ~= 0)
        error('reward must be between 0 and 1')
    end
    gainThompsonSampling = [gainThompsonSampling reward];
    ArmsPlayed = [ArmsPlayed ArmChosen];
    if((reward == 0) + (reward == 1) == 0)
        reward = rand() < reward; % for non Bernoulli Distribution
    end
    alphas(ArmChosen) = alphas(ArmChosen) + (reward == 1);
    betas(ArmChosen) = betas(ArmChosen) + (reward == 0);
end