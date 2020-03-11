clear;
clc;
format long;

% loading in the required data
load 'backtest_100_dat.mat'

% hmm inputs
eta = [1 1];
quiet_damp_if_turb = 0.2;

[n_rebals, est_window, n_stocks] = size(weekly_ret_grouped);

time_weights_100_gmv_hmm = zeros(n_rebals,  n_stocks);
time_rets_100_gmv_hmm = zeros(n_rebals,  n_stocks);

ret_100_gmv_hmm = zeros(n_rebals, 1);
for i = 1:n_rebals
   ret_now = reshape(weekly_ret_grouped(i, :, :), est_window, n_stocks);
   cov_mat_now = find_hmm_covar(ret_now, eta, quiet_damp_if_turb);
   weights_now = port_weights_gmv(cov_mat_now);
   ret_100_gmv_hmm(i) = sum(weights_now'.*month_ret(i, :));
   time_weights_100_gmv_hmm(i, :) = weights_now;
   time_rets_100_gmv_hmm(i, :) = month_ret(i, :);
   i
end

save('ret_100_gmv_hmm.mat', 'ret_100_gmv_hmm', 'time_weights_100_gmv_hmm', 'time_rets_100_gmv_hmm', 'tickers_grouped_100')

std(ret_100_gmv_hmm).*sqrt(12)