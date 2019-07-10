function [ExpectedMeans, ExpectedVariances, NbrPlayArm, gainUCBV, ArmsPlayed]= UCBV_ReceiveReward(ExpectedMeans, ExpectedVariances, NbrPlayArm, reward, ArmChosen, gainUCBV, ArmsPlayed)
    if(length(ExpectedMeans)< ArmChosen)
        error('Undefined arm');
    end
     if( reward <0 + reward > 1)
        error('reward must be between 0 and 1')
     end
    gainUCBV = [gainUCBV reward]; % Gain Updated
    ExpectedVariances(ArmChosen) = ExpectedVariances(ArmChosen) + ExpectedMeans(ArmChosen)^2;
    ExpectedVariances(ArmChosen) = (ExpectedVariances(ArmChosen)*NbrPlayArm(ArmChosen) + reward.^2)./(NbrPlayArm(ArmChosen)+1);
    ExpectedMeans(ArmChosen) = (ExpectedMeans(ArmChosen)*NbrPlayArm(ArmChosen) + reward)./(NbrPlayArm(ArmChosen)+1);
    ExpectedVariances(ArmChosen) = ExpectedVariances(ArmChosen) -  ExpectedMeans(ArmChosen).^2;
    NbrPlayArm(ArmChosen) = NbrPlayArm(ArmChosen) + 1;
    ArmsPlayed = [ArmsPlayed ArmChosen];
end