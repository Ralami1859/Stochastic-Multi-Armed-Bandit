function [gainUCBV, ArmsPlayed] = UCBV(environment, Horizon)

K = length(environment);
%-------------------------------------------------------------------------------------------------------------
%%                                                INITIALIZATION
%-------------------------------------------------------------------------------------------------------------

[ExpectedMeans, ExpectedVariances, NbrPlayArm, gainUCBV, ArmsPlayed]= UCBV_Initialize(K);

%---------------------------------------------------------------------------------------------------
%%                                            INTERACTION
%--------------------------------------------------------------------------------------------------

for t = 1:Horizon;
    ArmToPlay = UCBV_RecommendArm(ExpectedMeans, ExpectedVariances, NbrPlayArm, t); % Arm recommended by UCBV
    reward = rand() < environment(ArmToPlay); % Reward received by playing the chosen arm
    [ExpectedMeans,ExpectedVariances, NbrPlayArm, gainUCBV, ArmsPlayed]= UCBV_ReceiveReward(ExpectedMeans, ExpectedVariances, NbrPlayArm, reward, ArmToPlay, gainUCBV, ArmsPlayed); % Update UCB parameters using the reward received at time t.
end