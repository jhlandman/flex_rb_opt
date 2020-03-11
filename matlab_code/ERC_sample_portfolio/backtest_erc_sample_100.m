clear;
clc;
format long;
rng(120); % for cross validation technique

% loading in the required data
load 'backtest_100_dat.mat'

% constants
n_iter = 40;
k_folds = 3;
[n_rebals, est_window, n_stocks] = size(weekly_ret_grouped);

% declaring matrices
ret_100_erc_sample = zeros(n_rebals, 1);
time_weights_100_erc = zeros(n_rebals, n_stocks);
time_rets_100_erc = zeros(n_rebals, n_stocks);
for i = 1:n_rebals
    % getting weekly returns
    ret_now = reshape(weekly_ret_grouped(i, :, :), est_window, n_stocks);
    % finding lambda_opt
    lambda_opt = k_folds_cross_erc(ret_now, k_folds, n_iter);
    % using lambda_opt to find the erc
    weights_now = port_weights_erc(cov(ret_now), lambda_opt);
    % recording returns and weights
    ret_100_erc_sample(i) = sum(weights_now'.*month_ret(i, :));
    time_weights_100_erc(i, :) = weights_now;
    time_rets_100_erc(i, :) = month_ret(i, :);
    % print interation
    i
    lambda_opt
end

save('ret_100_erc_sample.mat', 'ret_100_erc_sample', 'time_weights_100_erc', 'time_rets_100_erc', 'tickers_grouped_100')

