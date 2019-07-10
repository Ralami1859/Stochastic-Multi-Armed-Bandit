function [gainBayesUCB, ArmsPlayed] = BayesUCB(environment, Horizon, alpha0, beta0)

%---------------------------------------------------------------------------------------------------
%%                                            INITIALIZATION
%--------------------------------------------------------------------------------------------------
K = length(environment); % Nbr Arms

[alphas, betas, gainBayesUCB, ArmsPlayed]= BayesUCB_Initialize(K, alpha0, beta0);

%---------------------------------------------------------------------------------------------------
%%                                            INTERACTION
%--------------------------------------------------------------------------------------------------
for t = 1:Horizon;
    ArmToPlay = BayesUCB_RecommendArm(alphas, betas, t, Horizon); % Arm recommended by Bayes UCB
    reward = rand() < environment(ArmToPlay); % Reward received by playing the chosen arm
    [alphas, betas, gainBayesUCB, ArmsPlayed]= BayesUCB_ReceiveReward(alphas, betas, reward, ArmToPlay, gainBayesUCB, ArmsPlayed); % Update Bayes UCB parameters using the reward received at time t.
end
