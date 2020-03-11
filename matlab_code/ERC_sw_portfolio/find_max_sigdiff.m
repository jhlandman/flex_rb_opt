function [obj_func] = find_max_sigdiff(lambda, returns_split)
% finding constants
[n_obs_split, n_assets, n_groups] = size(returns_split);
% creating a vector of MSE's
risk_weight_dist = zeros(n_groups, 1);
% For each unique group:
for j = 1:n_groups
    % Take the group as a hold out or test data set
    hold_out = returns_split(:, :, j);
    % Take the remaining groups as a training data set
    idx_train = 1:n_groups;
    idx_train(j) = 0;
    training_set = zeros(n_obs_split*(n_groups - 1), n_assets);
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
    % find the weights from the training set
    weights_now = port_weights_erc(cov(training_set), lambda);
    
    % find the risk weights 
    cov_now = cov(hold_out);
    port_var = weights_now'*cov_now*weights_now;
    risk_weights = (weights_now.*(cov_now*weights_now))./port_var;
    % find the distance of the risk weights
    for y = 1:n_assets
       for z = 1:n_assets
           risk_weight_dist(j) = risk_weight_dist(j) + (risk_weights(y) - risk_weights(z))^2;
       end
    end
end
obj_func = mean(risk_weight_dist);
end

