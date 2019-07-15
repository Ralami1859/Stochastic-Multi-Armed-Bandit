function [gainCPUCB, ArmsPlayed] = CPUCB(environment, Horizon, c)

K = length(environment);
%-------------------------------------------------------------------------------------------------------------
%%                                                INITIALIZATION
%-------------------------------------------------------------------------------------------------------------

[ExpectedMeans, NbrPlayArm, gainCPUCB, ArmsPlayed]= UCB1_Initialize(K);

%---------------------------------------------------------------------------------------------------
%%                                            INTERACTION
%--------------------------------------------------------------------------------------------------

for t = 1:Horizon;
    ArmToPlay = CPUCB_RecommendArm(ExpectedMeans, NbrPlayArm, t, c); % Arm recommended by KLUCB
    reward = rand() < environment(ArmToPlay); % Reward received by playing the chosen arm
    [ExpectedMeans, NbrPlayArm, gainCPUCB, ArmsPlayed]= UCB1_ReceiveReward(ExpectedMeans, NbrPlayArm, reward, ArmToPlay, gainCPUCB, ArmsPlayed); % Update UCB parameters using the reward received at time t.
end