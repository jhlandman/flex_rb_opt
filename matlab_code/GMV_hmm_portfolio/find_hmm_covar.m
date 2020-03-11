function [hmm_covar] = find_hmm_covar(returns_stocks_weekly, lambda, quiet_damp)

% separating regimes
index_regimes = find_regimes(returns_stocks_weekly);

sigma_q = cov(returns_stocks_weekly(~index_regimes,:));
sigma_t = cov(returns_stocks_weekly(index_regimes,:));

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

hmm_covar = sigma_q.*aversion_q.*prob_q + ...
                                     sigma_t.*aversion_t.*prob_t;
end

