clear;
clc;
format long;

% loading in the required data
load 'backtest_100_dat.mat'

[n_rebals, est_window, n_stocks] = size(weekly_ret_grouped);

time_weights_100_ew_norm = zeros(n_rebals,  n_stocks);
time_rets_100_ew_norm = zeros(n_rebals,  n_stocks);

ret_100_ew_norm = zeros(n_rebals, 1);
for i = 1:n_rebals
    weights_now = ones(n_stocks, 1).*(1/n_stocks);
    ret_100_ew_norm(i) = sum(weights_now'.*month_ret(i, :));
    time_weights_100_ew_norm(i,  :) = weights_now;
    time_rets_100_ew_norm(i, :) = month_ret(i, :);
    i
end

save('ret_100_ew_norm.mat', 'ret_100_ew_norm', 'time_rets_100_ew_norm', 'time_weights_100_ew_norm', 'tickers_grouped_100')
