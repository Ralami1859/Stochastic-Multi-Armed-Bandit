function [ExpectedMeans, NbrPlayArm, gainUCB, ArmsPlayed]= UCB1_ReceiveReward(ExpectedMeans, NbrPlayArm, reward, ArmChosen, gainUCB, ArmsPlayed)
    if(length(ExpectedMeans)< ArmChosen)
        error('Undefined arm');
    end
     if( reward <0 + reward > 1)
        error('reward must be between 0 and 1')
     end
    gainUCB = [gainUCB reward]; % Gain Updated
    ExpectedMeans(ArmChosen) = (ExpectedMeans(ArmChosen)*NbrPlayArm(ArmChosen) + reward)./(NbrPlayArm(ArmChosen)+1);
    NbrPlayArm(ArmChosen) = NbrPlayArm(ArmChosen) + 1;
    ArmsPlayed = [ArmsPlayed ArmChosen];
end