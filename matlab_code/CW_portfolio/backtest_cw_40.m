clear;
clc;
format long;

% loading in the required data
load 'backtest_40_dat.mat'

[n_rebals, est_window, n_stocks] = size(weekly_ret_grouped);

time_weights_40_cw_norm = zeros(n_rebals,  n_stocks);
time_rets_40_cw_norm = zeros(n_rebals,  n_stocks);

ret_40_cw_norm = zeros(n_rebals, 1);
for i = 1:n_rebals
    weights_now = month_weights(i, :);
    ret_40_cw_norm(i) = sum(weights_now.*month_ret(i, :));
    time_weights_40_cw_norm(i,  :) = weights_now;
    time_rets_40_cw_norm(i, :) = month_ret(i, :);
    i
end

save('ret_40_cw_norm.mat', 'ret_40_cw_norm', 'time_rets_40_cw_norm', 'time_weights_40_cw_norm', 'tickers_grouped_40')
