clear;
clc;
format long;
rng(32892);

% loading in the required data
load 'backtest_100_dat.mat'

% constants
n_iter = 40;
k_folds = 3;
[n_rebals, est_window, n_stocks] = size(weekly_ret_grouped);

% hmm inputs
eta = [1 1];
quiet_damp_if_turb = 0.2;

% allocating memory
ret_100_erc_hmm = zeros(n_rebals, 1);
time_weights_100_erc = zeros(n_rebals, n_stocks);
time_rets_100_erc = zeros(n_rebals, n_stocks);
for i = 1:n_rebals
    % finding the multiplier
    ret_now = reshape(weekly_ret_grouped(i, :, :), est_window, n_stocks);
    lambda_opt = k_folds_cross_erc(ret_now, k_folds, n_iter);
    % finding the blended covar matrix
    cov_now = find_hmm_covar(ret_now, eta, quiet_damp_if_turb);
    weights_now = port_weights_erc(cov_now, lambda_opt);
    % allocating results
    ret_100_erc_hmm(i) = sum(weights_now'.*month_ret(i, :));
    time_weights_100_erc_hmm(i, :) = weights_now;
    time_rets_100_erc_hmm(i, :) = month_ret(i, :);
    i
end

save('ret_100_erc_hmm.mat', 'ret_100_erc_hmm', 'time_weights_100_erc_hmm', 'time_rets_100_erc_hmm', 'tickers_grouped_100')

