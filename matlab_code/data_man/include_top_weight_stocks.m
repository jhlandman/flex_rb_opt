function [ticks_incl_out, ticks_weight_out] = include_top_weight_stocks(logic_incl, weekly_ticks, weights_ticks, monthly_weights, date_today, dates_weights, n_stocks)

% working in the included ticker space
ticks_incl = weekly_ticks(logical(logic_incl));
tick_incl_weights = zeros(length(ticks_incl), 0);
% finding weights
row_idx = (dates_weights == date_today);
row_idx = row_idx(2:end);
% matching weights to available tickers
for i = 1:length(ticks_incl)
    if ismember(ticks_incl(i), weights_ticks)
        col_idx = (weights_ticks == ticks_incl(i));
        tick_incl_weights(i) = monthly_weights(row_idx, col_idx);
    else
        tick_incl_weights(i) = 0;
    end
end

% sorting based on weights
[sort_out, sort_ind] = sort(tick_incl_weights, 'descend');

% putting out the allocated stocks index vector of 0s and 1s
ticks_incl_out = zeros(length(ticks_incl), 1);
ticks_weight_out = zeros(length(ticks_incl), 1);
for i = 1:n_stocks
    ticks_incl_out(sort_ind(i)) = 1;
    ticks_weight_out(sort_ind(i)) = sort_out(i);
end

end

