function [Successes, Successes2, NbrPlayArm, gainUCBV, ArmsPlayed]= UCBV_Initialize(K)
    gainUCBV   = [];
    Successes  = zeros(1,K);
    Successes2 = zeros(1,K);
    NbrPlayArm = ones(1,K);
    ArmsPlayed = [];
end