function [obj_func] = find_mean_mse_now(tau, returns_split, mean_ret)
% finding constants
[n_obs_split, n_assets, n_groups] = size(returns_split);
% creating a vector of MSE's
mse_vec = zeros(n_groups, 1);
% For each unique group:
for j = 1:n_groups
    % Take the group as a hold out or test data set
    hold_out = returns_split(:, :, j);
    % Take the remaining groups as a training data set
    idx_train = 1:n_groups;
    idx_train(j) = 0;
    training_set = zeros(n_obs_split*(n_groups - 1), n_assets);
    % build the training set
    for k = idx_train
        if ~(k==0)
            if k < j
                lower_b = (k-1)*n_obs_split + 1;
                upper_b = lower_b + n_obs_split - 1;
                training_set(lower_b:upper_b, :) = returns_split(:, :, k);
            elseif k > j 
                lower_b = (k-2)*n_obs_split + 1;
                upper_b = lower_b + n_obs_split - 1;
                training_set(lower_b:upper_b, :) = returns_split(:, :, k-1);
            end
        end
    end
    
    % find the gmv given the tau l2 constraint for the training data
    weights_now = port_weights_kinn_l2(training_set, mean_ret, tau);
    % keep the score on the hold out portfolio
    mse_vec(j) = sum((mean_ret - hold_out*weights_now).^2)/n_obs_split;
    
end

% return the mean score accross folds
obj_func = mean(mse_vec);

end

