format long;
clear;
clc;

load 'backtest_100_dat.mat'

% constants
[n_rebals, est_window, n_stocks] = size(weekly_ret_grouped);
rho_hat_100 = zeros(n_rebals, 1);
max_diffs = zeros(n_rebals, 1);

for i = 1:n_rebals
    returns_now = reshape(weekly_ret_grouped(i, :, :), est_window, n_stocks);
    w_gmv_sample = port_weights_gmv(cov(returns_now));
    rho_hat_100(i) = find_rho_hat(returns_now, w_gmv_sample);
    w_kinn_now = port_weights_kinn(returns_now, rho_hat_100(i));
    max_diffs(i) = max(abs(w_gmv_sample - w_kinn_now));
    i
end

save('rho_hat_100.mat', 'rho_hat_100')

% save('/Users/jaysonlandman/Desktop/research for masters/code/GMV_l2_portfolio/rho_hat_100.mat', 'rho_hat_100')
% save('/Users/jaysonlandman/Desktop/research for masters/code/ERC_l2_portfolio/rho_hat_100.mat', 'rho_hat_100')