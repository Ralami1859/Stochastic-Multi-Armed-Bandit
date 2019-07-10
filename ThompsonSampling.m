function [gainThompsonSampling, ArmsPlayed] = ThompsonSampling(environment, Horizon, alpha0, beta0)

%---------------------------------------------------------------------------------------------------
%%                                            INITIALIZATION
%--------------------------------------------------------------------------------------------------
K = length(environment); % Nbr Arms

[alphas, betas, gainThompsonSampling, ArmsPlayed]= ThompsonSampling_Initialize(K, alpha0, beta0);

%---------------------------------------------------------------------------------------------------
%%                                            INTERACTION
%--------------------------------------------------------------------------------------------------
for t = 1:Horizon;
    ArmToPlay = ThompsonSampling_RecommendArm(alphas, betas); % Arm recommended by ThompsonSampling
    reward = rand() < environment(ArmToPlay); % Reward received by playing the chosen arm
    [alphas, betas, gainThompsonSampling, ArmsPlayed]= ThompsonSampling_ReceiveReward(alphas, betas, reward, ArmToPlay, gainThompsonSampling, ArmsPlayed); % Update Thompson Sampling parameters using the reward received at time t.
end
