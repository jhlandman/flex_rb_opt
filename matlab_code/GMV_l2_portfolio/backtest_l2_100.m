clear;
clc;
format long;
rng(982) % for cross validation allocation

load 'backtest_100_dat.mat'
load 'rho_hat_100.mat'

%  descent constants
n_iter = 40;
n_groups = 3;

[n_rebals, est_window, n_stocks] = size(weekly_ret_grouped);

time_weights_100_gmv_l2 = zeros(n_rebals,  n_stocks);
time_rets_100_gmv_l2 = zeros(n_rebals,  n_stocks);

ret_100_gmv_l2 = zeros(n_rebals, 1);
lambda_opt_vec = zeros(n_rebals, 1);

for i = 1:n_rebals
    returns_now = reshape(weekly_ret_grouped(i, :, :), est_window, n_stocks);
    lambda_hat_opt = k_folds_cross_l2(returns_now, rho_hat_100(i), n_iter,  n_groups);
    weights_now = port_weights_kinn_l2(returns_now, lambda_hat_opt, rho_hat_100(i));
    ret_100_gmv_l2(i) = sum(weights_now'.*month_ret(i, :));
    time_weights_100_gmv_l2(i, :) = weights_now;
    time_rets_100_gmv_l2(i, :) = month_ret(i, :);
    i
    lambda_opt_vec(i) = lambda_hat_opt;
end

save('ret_100_gmv_l2.mat', 'ret_100_gmv_l2', 'time_weights_100_gmv_l2', 'time_rets_100_gmv_l2', 'tickers_grouped_100')
save('lambda_vec_100.mat', 'lambda_opt_vec')