clear;
clc;
format long;
rng(239847232);

% loading in the required data
load 'backtest_100_dat.mat'

% constants
n_iter = 100;
k_folds = 3;
[n_rebals, est_window, n_stocks] = size(weekly_ret_grouped);

% subset resampling information
b = floor(n_stocks^(0.85));
s = 1000;

time_weights_100_gmv_sw = zeros(n_rebals, n_stocks);
time_rets_100_gmv_sw = zeros(n_rebals, n_stocks);

ret_100_gmv_sw = zeros(n_rebals, 1);
for i = 1:n_rebals
    returns_now = reshape(weekly_ret_grouped(i, :, :), est_window, n_stocks);
    % finding lambda_opt
    lambda_opt = k_folds_cross_erc(returns_now, k_folds, n_iter);
    weights_now = port_weights_sw(returns_now, b, s, lambda_opt);
    ret_100_gmv_sw(i) = sum(weights_now'.*month_ret(i, :));
    time_weights_100_gmv_sw(i, :) = weights_now;
    time_rets_100_gmv_sw(i, :) = month_ret(i, :);
    i
end

save('ret_100_gmv_sw.mat', 'ret_100_gmv_sw', 'time_rets_100_gmv_sw', 'time_weights_100_gmv_sw', 'tickers_grouped_100');
