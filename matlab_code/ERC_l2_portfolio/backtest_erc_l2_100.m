clear;
clc;
format long;
rng(8943908)

% loading in the required data
load 'backtest_100_dat.mat'
load 'rho_hat_100.mat'
load 'lambda_vec_100.mat'

% constants
[n_rebals, est_window, n_stocks] = size(weekly_ret_grouped);

% initialising multiplier grid
n_iter = 40;
k_folds = 3;

% allocating memory
ret_100_erc_l2 = zeros(n_rebals, 1);
time_weights_100_erc_l2 = zeros(n_rebals, n_stocks);
time_rets_100_erc_l2 = zeros(n_rebals, n_stocks);
tau_opt_vec = zeros(n_rebals, 1);
for i = 1:n_rebals
    ret_now = reshape(weekly_ret_grouped(i, :, :), est_window, n_stocks);
    % finding the log penalty multiplier
    tau_opt = k_folds_cross_erc(ret_now, lambda_opt_vec(i), n_iter, k_folds, rho_hat_100(i));
    % need to perform same optimization on grid for taus
    weights_now = port_weights_erc_l2(ret_now, lambda_opt_vec(i), tau_opt, rho_hat_100(i));
    ret_100_erc_l2(i) = sum(weights_now'.*month_ret(i, :));
    time_weights_100_erc_l2(i, :) = weights_now;
    time_rets_100_erc_l2(i, :) = month_ret(i, :);
    i
    tau_opt_vec(i) = tau_opt;
end


save('ret_100_erc_l2.mat', 'ret_100_erc_l2', 'time_weights_100_erc_l2', 'time_rets_100_erc_l2', 'tickers_grouped_100')
