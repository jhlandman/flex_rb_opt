clear;
clc;
format long;

% loading in the required data
load 'backtest_100_dat.mat'

% quantile regression inputs
tau = [0.1 0.5 0.9];
basket_prob = [0.1 0.8 0.1];
n_tau = length(tau);

[n_rebals, est_window, n_stocks] = size(weekly_ret_grouped);

time_weights_100_gmv_qr = zeros(n_rebals,  n_stocks);
time_rets_100_gmv_qr = zeros(n_rebals,  n_stocks);

ret_100_gmv_qr = zeros(n_rebals, 1);
for i = 1:n_rebals
    % need to use find_market_rets
    market_rets = sum(reshape(weekly_ret_grouped(i, :, :), est_window, n_stocks).*month_weights(i, :), 2);
    ret_now = reshape(weekly_ret_grouped(i, :, :), est_window, n_stocks);
    qr_cov = create_qcov(ret_now, ...
                         market_rets, ...
                         tau, ...
                         true);
    % using boosting to blend var_covar mats
    weights_now = zeros(n_stocks, 1);
    for j = 1:n_tau
        weights_now = weights_now + basket_prob(j).*port_weights_gmv(qr_cov(:, :, j));
    end
    ret_100_gmv_qr(i) = sum(weights_now'.*month_ret(i, :));
    time_rets_100_gmv_qr(i, :) = month_ret(i, :);
    time_weights_100_gmv_qr(i, :) = weights_now;
    i
end

save('ret_100_gmv_qr.mat', 'ret_100_gmv_qr', 'time_rets_100_gmv_qr', 'time_weights_100_gmv_qr', 'tickers_grouped_100')