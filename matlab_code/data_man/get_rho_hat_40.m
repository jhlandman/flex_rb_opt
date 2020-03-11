format long;
clear;
clc;

load 'backtest_40_dat.mat'

% constants
[n_rebals, est_window, n_stocks] = size(weekly_ret_grouped);
rho_hat_40 = zeros(n_rebals, 1);
max_diffs = zeros(n_rebals, 1);
n_iter_down = 50;

for i = 1:n_rebals
    returns_now = reshape(weekly_ret_grouped(i, :, :), est_window, n_stocks);
    w_gmv_sample = port_weights_gmv(cov(returns_now));
    rho_hat_40(i) = find_rho_hat(returns_now, w_gmv_sample, n_iter_down);
    w_kinn_now = port_weights_kinn(returns_now, rho_hat_40(i));
    max_diffs(i) = max(abs(w_gmv_sample - w_kinn_now));
    i
    if max_diffs(i) > 0.03
       i 
    end
end


save('rho_hat_40.mat', 'rho_hat_40')
