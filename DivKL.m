function y = DivKL(p,q)
    p = max(p, eps); p = min(p, 1-eps);  
  q = max(q, eps); q = min(q, 1-eps);
  y = p.*log(p./q) + (1-p).*log((1-p)./(1-q));
end
