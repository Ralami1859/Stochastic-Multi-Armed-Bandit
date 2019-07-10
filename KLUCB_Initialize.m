function [ExpectedMeans, NbrPlayArm, gainKLUCB, ArmsPlayed]= KLUCB_Initialize(K)
    gainKLUCB = [];
    ExpectedMeans = zeros(1,K);
    NbrPlayArm = ones(1,K);
    ArmsPlayed = [];
end