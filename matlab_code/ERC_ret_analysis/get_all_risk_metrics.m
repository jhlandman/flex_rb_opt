function [sigma, n_eff, rw_ind, to_out, sr_out, mdd_out] = get_all_risk_metrics(ret_series, weight_mat, ret_mat, tickers)

% annualising std dev of returns
sigma = std(ret_series).*sqrt(12);

% taking the average of the herfidahl index
n_eff = mean(sum(weight_mat.^2, 2).^-1);

% finding the out of sample component risks - no avg
w_now = mean(weight_mat)';
cov_now = cov(ret_mat);
risk_weights = (w_now.*(cov_now*w_now))./(w_now'*cov_now*w_now);

% putting the risk weights into a herfindahl index
rw_ind = sum(risk_weights.^2).^-1;

% looping through the turnovers
n_to = length(ret_series) - 1;
turn_over = zeros(n_to, 1);
for i = 1:n_to
    old_ticks = tickers(i, :);
    new_ticks = tickers(i + 1, :);
    % using returns to calculate old weights
    old_weights = (weight_mat(i, :).*(1 + ret_mat(i, :)))./sum(weight_mat(i, :).*(1 + ret_mat(i, :)));
    new_weights = weight_mat(i + 1, :);
    for j = 1:length(old_weights)
        if ismember(new_ticks(j), old_ticks)
            turn_over(i) = turn_over(i) + abs(old_weights(old_ticks == new_ticks(j)) - new_weights(j));
        else
            turn_over(i) = turn_over(i) + new_weights(j);
        end
    end
end
to_out = mean(turn_over).*6;

% sharpe
ret_ann = prod((1 + ret_series).^(12/length(ret_series))) - 1;
sr_out = (ret_ann - 0.06)/sigma;

wealth_from_1 = cumprod(1 + ret_series);
m_k = zeros(length(wealth_from_1), 1);
for i = 1:length(wealth_from_1)
    m_k(i) = max(wealth_from_1(1:i));
end
mdd_out = max((m_k - wealth_from_1)./m_k);
end
