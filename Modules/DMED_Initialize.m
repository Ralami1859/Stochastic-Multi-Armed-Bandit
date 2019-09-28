function [ExpectedMeans, NbrPlayArm, gainDMED, ArmsPlayed, L]= DMED_Initialize(K)
    gainDMED   = [];
    ExpectedMeans  = zeros(1,K);
    NbrPlayArm = ones(1,K);
    ArmsPlayed = [];
    L = (1:K);
end