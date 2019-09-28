function [ArmToPlay]= KLUCB_RecommendArm(ExpectedMeans, NbrPlayArm, t, Horizon, HF, c)
    % HF: Horizon free
    if(length(ExpectedMeans) ~= length(NbrPlayArm))
        error('Vecteur moyennes estimées et vecteur nombre de fois doivent avoir la même taille');
    end
    if( t <=0)
        error('Time step invalide. t<=0')
    end
    ucb = SearchingKLUCBIndex(ExpectedMeans, NbrPlayArm, t, Horizon, HF,c);
    ArmToPlay = PickingMaxIndexArm(ucb);
end