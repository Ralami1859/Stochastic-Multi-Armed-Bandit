function res = SearchingKLUCBIndex(ExpectedMeans, NbrPlayArms, t, Horizon, HF, c)
    % HF: Horizon free
    p = ExpectedMeans;
    if HF;
        d = (log(t) + c*log(log(t+1)))./NbrPlayArms;
    else
        d = (log(t) + c*log(log(Horizon)))./NbrPlayArms;
    end
    res = klIC(p, d);
end