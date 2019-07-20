function [gainUCB, ArmsPlayed] = UCB1(environment, Horizon)
%addpath('../Modules/');   
K = length(environment);
%-------------------------------------------------------------------------------------------------------------
%%                                                INITIALIZATION
%-------------------------------------------------------------------------------------------------------------

[ExpectedMeans, NbrPlayArm, gainUCB, ArmsPlayed]= UCB1_Initialize(K);

%---------------------------------------------------------------------------------------------------
%%                                            INTERACTION
%--------------------------------------------------------------------------------------------------

for t = 1:Horizon;
    ArmToPlay = UCB1_RecommendArm(ExpectedMeans, NbrPlayArm, t); % Arm recommended by UCB1
    reward = rand() < environment(ArmToPlay); % Reward received by playing the chosen arm
    [ExpectedMeans, NbrPlayArm, gainUCB, ArmsPlayed]= UCB1_ReceiveReward(ExpectedMeans, NbrPlayArm, reward, ArmToPlay, gainUCB, ArmsPlayed); % Update UCB parameters using the reward received at time t.
end

