function [tau_star] = k_folds_cross_l2(returns_stocks_weekly, rho_hat, n_iter, n_groups)
% constants
mean_ret = rho_hat;
% Shuffle the dataset randomly
[n_obs, n_assets] = size(returns_stocks_weekly);
returns_stocks_weekly = returns_stocks_weekly(randperm(n_obs), :);

% Split the dataset into k groups
n_obs_split = floor(n_obs/n_groups);
returns_split = zeros(n_obs_split, n_assets, n_groups);
for i = 1:n_groups
    lower_b = (i-1)*n_obs_split + 1;
    upper_b = lower_b + n_obs_split - 1;
    returns_split(:, :, i) = returns_stocks_weekly(lower_b:upper_b, :);
end

% objective function to minimize
find_obj_func = @(tau) find_mean_mse_now(tau, returns_split, mean_ret);

% algo to descend to the local minimum
x_now = 0;
step_size = 100;
for i = 1:n_iter
   f_x = find_obj_func(x_now);
   f_xp1 = find_obj_func(x_now + step_size);
   f_xp2 = find_obj_func(x_now + step_size*2);
   if (f_xp2 < f_xp1) && (f_xp1 < f_x)
       x_now = x_now + step_size*0.25;
   else
       step_size = step_size*0.5;
   end
   %plot([x_now (x_now + step_size) (x_now + step_size*2)], [f_x f_xp1 f_xp2])
end

tau_star = x_now;

% x_ran_plot = 0:((x_now + 0.01)/40):(x_now + 0.01);
% y_plot = zeros(length(x_ran_plot), 1);
% for j = 1:length(x_ran_plot)
%     y_plot(j) = find_obj_func(x_ran_plot(j));
% end
% figure(1)
% plot(x_ran_plot, y_plot)

end


