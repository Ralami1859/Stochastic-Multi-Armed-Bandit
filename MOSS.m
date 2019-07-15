function [gainMOSS, ArmsPlayed] = MOSS(environment, Horizon)

K = length(environment);
%-------------------------------------------------------------------------------------------------------------
%%                                                INITIALIZATION
%-------------------------------------------------------------------------------------------------------------

[ExpectedMeans, NbrPlayArm, gainMOSS, ArmsPlayed]= UCB1_Initialize(K);

%---------------------------------------------------------------------------------------------------
%%                                            INTERACTION
%--------------------------------------------------------------------------------------------------

for t = 1:Horizon;
    ArmToPlay = MOSS_RecommendArm(ExpectedMeans, NbrPlayArm, Horizon); % Arm recommended by KLUCB
    reward = rand() < environment(ArmToPlay); % Reward received by playing the chosen arm
    [ExpectedMeans, NbrPlayArm, gainMOSS, ArmsPlayed]= UCB1_ReceiveReward(ExpectedMeans, NbrPlayArm, reward, ArmToPlay, gainMOSS, ArmsPlayed); % Update UCB parameters using the reward received at time t.
end