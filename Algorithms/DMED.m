function [gainDMED, ArmsPlayed] = DMED(environment, Horizon, genuine)
%addpath('../Modules/');   
K = length(environment);
%-------------------------------------------------------------------------------------------------------------
%%                                                INITIALIZATION
%-------------------------------------------------------------------------------------------------------------

[ExpectedMeans, NbrPlayArm, gainDMED, ArmsPlayed, L]= DMED_Initialize(K);

%---------------------------------------------------------------------------------------------------
%%                                            INTERACTION
%--------------------------------------------------------------------------------------------------

for t = 1:Horizon;
    [ArmToPlay, L] = DMED_RecommendArm(ExpectedMeans, NbrPlayArm, t, L, genuine); % Arm recommended by UCB1
    reward = rand() < environment(ArmToPlay); % Reward received by playing the chosen arm
    [ExpectedMeans, NbrPlayArm, gainDMED, ArmsPlayed]= UCB1_ReceiveReward(ExpectedMeans, NbrPlayArm, reward, ArmToPlay, gainDMED, ArmsPlayed); % Update UCB parameters using the reward received at time t.
end