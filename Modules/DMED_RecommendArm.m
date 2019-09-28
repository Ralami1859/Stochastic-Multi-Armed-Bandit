function [ArmToPlay, L]= DMED_RecommendArm(ExpectedMeans, NbrPlayArm, t, L, genuine)
    %genuine = true;  % Variant: with this set to false, use a less aggressive list
                         % pruning criterion corresponding to the the version called
                         % DMED in [Garivier & Cappé, COLT 2011]; the default is the
                         % original proposal of [Honda & Takemura, COLT 2010] (called
                         % DMED+ in [Garivier & Cappé, COLT 2011])

    if(~isempty(L))
        ArmToPlay = L(1);
        L = L(2:end);
    else
        [~,c] = max(ExpectedMeans); % Current best empirical mean
        if (genuine)
            L = find(NbrPlayArm.*DivKL(ExpectedMeans, ExpectedMeans(c)) < ...
              log(t./NbrPlayArm));
        else
            L = find(NbrPlayArm.*DivKL(ExpectedMeans, ExpectedMeans(c)) < ...
              log(t));
        end
        ArmToPlay = L(1);
        L = L(2:end);
    end
end