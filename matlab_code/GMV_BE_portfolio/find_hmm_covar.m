function [index_regimes, aversion_q, prob_q, aversion_t, prob_t] = find_hmm_covar(returns_stocks_weekly, lambda, quiet_damp)

% separating regimes
index_regimes = find_regimes(returns_stocks_weekly);

% blending the out of sample var-covar matrix

% blend = [ quiet * aversion_q * prob ] + [ turb * aversion_t * (1-prob) ]
aversion_q = 2*lambda(1) / sum(lambda);
aversion_t = 2*lambda(2) / sum(lambda);

final_regime = index_regimes(end);

if (final_regime == 1)
    prob_q = 1-(sum(index_regimes)./length(index_regimes)) - quiet_damp;
else
    prob_q = 1-(sum(index_regimes)./length(index_regimes));
end
prob_t = 1 - prob_q;

end

