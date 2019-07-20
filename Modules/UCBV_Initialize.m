function [ExpectedMeans, ExpectedVariances, NbrPlayArm, gainUCBV, ArmsPlayed]= UCBV_Initialize(K)
    gainUCBV = [];
    ExpectedMeans = zeros(1,K);
    ExpectedVariances = zeros(1,K);
    NbrPlayArm = ones(1,K);
    ArmsPlayed = [];
end