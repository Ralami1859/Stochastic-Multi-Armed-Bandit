function [gainUCBTuned, ArmsPlayed] = UCBTuned(environment, Horizon)
%addpath('../Modules/');   
K = length(environment);
%-------------------------------------------------------------------------------------------------------------
%%                                                INITIALIZATION
%-------------------------------------------------------------------------------------------------------------

[Successes, Successes2, NbrPlayArm, gainUCBTuned, ArmsPlayed]= UCBV_Initialize(K);

%---------------------------------------------------------------------------------------------------
%%                                            INTERACTION
%--------------------------------------------------------------------------------------------------

for t = 1:Horizon;
    ArmToPlay = UCBTuned_RecommendArm(Successes, Successes2, NbrPlayArm, t); % Arm recommended by UCBV
    reward = rand() < environment(ArmToPlay); % Reward received by playing the chosen arm
    [Successes,Successes2, NbrPlayArm, gainUCBTuned, ArmsPlayed]= UCBV_ReceiveReward(Successes, Successes2, NbrPlayArm, reward, ArmToPlay, gainUCBTuned, ArmsPlayed); % Update UCB parameters using the reward received at time t.
end