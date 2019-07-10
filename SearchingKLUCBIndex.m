function res = SearchingKLUCBIndex(ExpectedMeans, NbrPlayArms, t, Horizon, variant)
    p = ExpectedMeans;
    d = (log(t) + log(log(Horizon)))./NbrPlayArms;
    if (variant)
        d = (log(t./NbrPlayArms) + log(log(Horizon)))./NbrPlayArms;
    end
    res = klIC(p, d);
end