clear;
clc;
format long;
rng(280)

% loading in the required data
load 'backtest_40_dat.mat'

% constants
n_iter = 40;
k_folds = 5;
[n_rebals, est_window, n_stocks] = size(weekly_ret_grouped);

% quantile regression inputs
tau = [0.1 0.5 0.9];
basket_prob = [0.1 0.8 0.1];
n_tau = length(tau);

ret_40_erc_qr = zeros(n_rebals, 1);
time_weights_40_erc_qr = zeros(n_rebals, n_stocks);
time_rets_40_erc_qr = zeros(n_rebals, n_stocks);
for i = 1:n_rebals
    ret_now = reshape(weekly_ret_grouped(i, :, :), est_window, n_stocks);
    lambda_opt = k_folds_cross_erc(ret_now, k_folds, n_iter);
    % need to create different quantile covars
    % regress with market returns
    market_rets = sum(reshape(weekly_ret_grouped(i, :, :), est_window, n_stocks).*month_weights(i, :), 2);
    qr_cov = create_qcov(ret_now, ...
                         market_rets, ...
                         tau, ...
                         true);
    % using boosting to blend var_covar mats
    weights_now = zeros(n_stocks, 1);
    for j = 1:n_tau
        weights_now = weights_now + basket_prob(j).*port_weights_erc(qr_cov(:, :, j), lambda_opt);
    end
    ret_40_erc_qr(i) = sum(weights_now'.*month_ret(i, :));
    
    time_weights_40_erc_qr(i, :) = weights_now;
    time_rets_40_erc_qr(i, :) = month_ret(i, :);
    i
end

save('ret_40_erc_qr.mat', 'ret_40_erc_qr', 'time_weights_40_erc_qr', 'time_rets_40_erc_qr', 'tickers_grouped_40')

