function [gainKLUCB, ArmsPlayed] = KLUCB(environment, Horizon, variant)

K = length(environment);
%-------------------------------------------------------------------------------------------------------------
%%                                                INITIALIZATION
%-------------------------------------------------------------------------------------------------------------

[ExpectedMeans, NbrPlayArm, gainKLUCB, ArmsPlayed]= KLUCB_Initialize(K);

%---------------------------------------------------------------------------------------------------
%%                                            INTERACTION
%--------------------------------------------------------------------------------------------------

for t = 1:Horizon;
    ArmToPlay = KLUCB_RecommendArm(ExpectedMeans, NbrPlayArm, t, Horizon, variant); % Arm recommended by KLUCB
    reward = rand() < environment(ArmToPlay); % Reward received by playing the chosen arm
    [ExpectedMeans, NbrPlayArm, gainKLUCB, ArmsPlayed]= KLUCB_ReceiveReward(ExpectedMeans, NbrPlayArm, reward, ArmToPlay, gainKLUCB, ArmsPlayed); % Update UCB parameters using the reward received at time t.
end