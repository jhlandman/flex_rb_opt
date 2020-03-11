clear;
clc;
format long;

% loading in the required data
load 'backtest_100_dat.mat'

% quantile regression inputs
tau = [0.1 0.5 0.9];
basket_prob = [0.1 0.8 0.1];
basket_prob_cross = basket_prob'*basket_prob;
n_tau = length(tau);

% hmm inputs
eta = [1 1];
quiet_damp_if_turb = 0.2;

% other constants
[n_rebals, est_window, n_stocks] = size(weekly_ret_grouped);

time_weights_100_gmv_be = zeros(n_rebals,  n_stocks);
time_rets_100_gmv_be = zeros(n_rebals,  n_stocks);

ret_100_gmv_be = zeros(n_rebals, 1);
for i = 1:n_rebals
    % get current returns and market returns
    returns_now = reshape(weekly_ret_grouped(i, :, :), est_window, n_stocks);
    market_rets = sum(reshape(weekly_ret_grouped(i, :, :), est_window, n_stocks).*month_weights(i, :), 2);
    % applying the hmm
    [index_regimes, aversion_q, prob_q, aversion_t, prob_t] = ...
       find_hmm_covar(returns_now,...
                      eta, ...
                      quiet_damp_if_turb);
    % quantile regressed and separated matrices
    qr_cov_quiet = create_qcov(returns_now(~index_regimes, :), ...
                               market_rets(~index_regimes), ...
                               tau, ...
                               true);
    qr_cov_turb = create_qcov(returns_now(index_regimes, :), ...
                              market_rets(index_regimes), ...
                              tau, ...
                              true);
    % using boosting to blend var_covar mats
    weights_now = zeros(n_stocks, 1);
    for j = 1:length(basket_prob)
        for k = 1:length(basket_prob)
            cov_now = qr_cov_quiet(:, :, j).*aversion_q.*prob_q + ...
                      qr_cov_turb(:, :, k).*aversion_t.*prob_t;
            weights_now = weights_now + ...
                          basket_prob_cross(j, k).* ...
                          port_weights_gmv(cov_now);
        end
    end
    ret_100_gmv_be(i) = sum(weights_now'.*month_ret(i, :));
    time_weights_100_gmv_be(i, :) = weights_now;
    time_rets_100_gmv_be(i, :) = month_ret(i, :);
    i
end

save('ret_100_gmv_be.mat', 'ret_100_gmv_be', 'time_weights_100_gmv_be', 'time_rets_100_gmv_be', 'tickers_grouped_100')

std(ret_100_gmv_be).*sqrt(12)