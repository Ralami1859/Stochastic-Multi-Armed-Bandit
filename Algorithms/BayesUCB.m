function [gainBayesUCB, ArmsPlayed] = BayesUCB(environment, Horizon, alpha0, beta0,HF, c)
%addpath('../Modules/');   
% HF: Horizon Free
%---------------------------------------------------------------------------------------------------
%%                                            INITIALIZATION
%--------------------------------------------------------------------------------------------------
K = length(environment); % Nbr Arms

[alphas, betas, gainBayesUCB, ArmsPlayed]= ThompsonSampling_Initialize(K, alpha0, beta0);

%---------------------------------------------------------------------------------------------------
%%                                            INTERACTION
%--------------------------------------------------------------------------------------------------
for t = 1:Horizon;
    ArmToPlay = BayesUCB_RecommendArm(alphas, betas, t, Horizon, HF, c); % Arm recommended by Bayes UCB
    reward = rand() < environment(ArmToPlay); % Reward received by playing the chosen arm
    [alphas, betas, gainBayesUCB, ArmsPlayed]= ThompsonSampling_ReceiveReward(alphas, betas, reward, ArmToPlay, gainBayesUCB, ArmsPlayed); % Update Bayes UCB parameters using the reward received at time t.
end
