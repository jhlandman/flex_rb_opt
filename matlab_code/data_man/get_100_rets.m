clear;
clc;
format long;
rng(1203);

% loading in the required data
load 'backtest_ret_dat.mat'

n_rebals = length(rebal_dates) - 2;
stocks_incl = 100;

% return groupings
weekly_ret_grouped = zeros(n_rebals, est_window_week, stocks_incl);
rebal_dates_grouped = rebal_dates(1:(end - 2));
tickers_grouped_100 = string(NaN(n_rebals, stocks_incl));

% monthly returns for testing
month_ret = zeros(n_rebals, stocks_incl);
month_weights = zeros(n_rebals, stocks_incl);
month_dates = rebal_dates(2:(end-1));

for i = 1:n_rebals
    % finding the rebalancing date
    rebal_date_now = rebal_dates(i);
    % finding the included stocks
    begin_idx = 1:length(weekly_dates);
    begin_idx = begin_idx(weekly_dates == rebal_date_now);
    incl_stocks = incl_100_week(weekly_dates == rebal_date_now, :);
    % saving the returns from the included stocks
    weekly_ret_now = weekly_rets((begin_idx - est_window_week):(begin_idx - 1), incl_stocks);
    weekly_ret_grouped(i, :, :) = weekly_ret_now;
    % saving down their tickers
    tickers_grouped_100(i, :) = weekly_ticks(incl_stocks); 
    
    weeks_incl = logical(floor(((weekly_dates >= rebal_date_now) + (weekly_dates <  rebal_dates(i+1)))./2));
    month_ret(i, :) = prod(1 + weekly_rets(weeks_incl, incl_stocks)) - 1;
    month_weights_temp = mean(weight_mat_100_week(weeks_incl, incl_stocks));
    month_weights(i, :) = month_weights_temp./sum(month_weights_temp);
end

% adjusting NaN's to zeros
month_ret(isnan(month_ret)) = 0;

save('/Users/jaysonlandman/Desktop/research for masters/code_300_window/data_man/backtest_100_dat.mat', 'weekly_ret_grouped', 'rebal_dates_grouped', 'tickers_grouped_100', 'month_ret', 'month_dates', 'month_weights')
