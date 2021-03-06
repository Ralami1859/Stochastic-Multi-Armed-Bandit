function [gainUCBV, ArmsPlayed] = UCBV(environment, Horizon)
%addpath('../Modules/');   
K = length(environment);
%-------------------------------------------------------------------------------------------------------------
%%                                                INITIALIZATION
%-------------------------------------------------------------------------------------------------------------

[Successes, Successes2, NbrPlayArm, gainUCBV, ArmsPlayed]= UCBV_Initialize(K);

%---------------------------------------------------------------------------------------------------
%%                                            INTERACTION
%--------------------------------------------------------------------------------------------------

for t = 1:Horizon;
    ArmToPlay = UCBV_RecommendArm(Successes, Successes2, NbrPlayArm, t); % Arm recommended by UCBV
    reward = rand() < environment(ArmToPlay); % Reward received by playing the chosen arm
    [Successes,Successes2, NbrPlayArm, gainUCBV, ArmsPlayed]= UCBV_ReceiveReward(Successes, Successes2, NbrPlayArm, reward, ArmToPlay, gainUCBV, ArmsPlayed); % Update UCB parameters using the reward received at time t.
end