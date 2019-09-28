function [ArmToPlay]= UCB1_RecommendArm(ExpectedMeans, NbrPlayArm, t)
    if(length(ExpectedMeans) ~= length(NbrPlayArm))
        error('Vecteur moyennes estim�es et vecteur nombre de fois doivent avoir la m�me taille');
    end
    if( t <=0)
        error('Time step invalide. t<=0')
    end
    ucb = ExpectedMeans + sqrt(2*log(t)./NbrPlayArm);
    ArmToPlay = PickingMaxIndexArm(ucb);
end