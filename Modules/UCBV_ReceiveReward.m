function [Success, Success2, NbrPlayArm, gainUCBV, ArmsPlayed]= UCBV_ReceiveReward(Success, Success2, NbrPlayArm, reward, ArmChosen, gainUCBV, ArmsPlayed)
    if(length(Success)< ArmChosen)
        error('Undefined arm');
    end
     if( reward <0 + reward > 1)
        error('reward must be between 0 and 1')
     end
    gainUCBV = [gainUCBV reward]; % Gain Updated
    Success2(ArmChosen) = Success2(ArmChosen) + reward.^2;
    Success(ArmChosen) = Success(ArmChosen) + reward;
    NbrPlayArm(ArmChosen) = NbrPlayArm(ArmChosen) + 1;
    ArmsPlayed = [ArmsPlayed ArmChosen];
end