clear;
clc;
format long;

% loading in the required data
load 'backtest_40_dat.mat'

[n_rebals, est_window, n_stocks] = size(weekly_ret_grouped);

time_weights_40_gmv_sample = zeros(n_rebals,  n_stocks);
time_rets_40_gmv_sample = zeros(n_rebals,  n_stocks);

ret_40_gmv_sample = zeros(n_rebals, 1);
for i = 1:n_rebals
    cov_mat_now = cov(reshape(weekly_ret_grouped(i, :, :), est_window, n_stocks));
    weights_now = port_weights_gmv(cov_mat_now);
    ret_40_gmv_sample(i) = sum(weights_now'.*month_ret(i, :));
    time_weights_40_gmv_sample(i,  :) = weights_now;
    time_rets_40_gmv_sample(i, :) = month_ret(i, :);
    i
end

save('ret_40_gmv_sample.mat', 'ret_40_gmv_sample', 'time_rets_40_gmv_sample', 'time_weights_40_gmv_sample', 'tickers_grouped_40');
