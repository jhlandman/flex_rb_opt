clc;
clear;
format long;
rng(0);

%% reading in the data

table_rets = readtable('data_emlyn_sheet.xlsx', 'sheet', 5);
table_month = readtable('data_emlyn_sheet.xlsx', 'sheet', 3);
table_weights = readtable('data_emlyn_sheet.xlsx', 'sheet', 2);

%% changing the format & constants

% returns
weekly_rets = table2array(table_rets(:, 2:end));
monthly_rets = table2array(table_month(:, 2:end));
% weights
monthly_weights = table2array(table_weights(1:(end - 2), 3:end));
% dates
dates = table2array(table_rets(:, 1));
end_of_month = table_month.Var1;
% dates for weights are the same and are declared below
% post manipulation

% tickers
weekly_ticks = string(table_rets.Properties.VariableNames(2:end)');
monthly_ticks = string(table_month.Properties.VariableNames(2:end)');
weights_ticks = string(table_weights.Properties.VariableNames(3:end)');

% only  SDC (month) and ZCL(weights) are different 

[n_weeks, n_stocks] = size(weekly_rets);

clear table_rets table_month

%% checking for usable weeks

num_stocks_in_week = zeros(n_weeks, 1);
for i = 1:n_weeks
    num_stocks_in_week(i) = sum(~isnan(weekly_rets(i, :)));
end
% enough to use 100 and 40 every time

%% excluding the first week

weekly_rets = weekly_rets(2:end, :);
dates = dates(2:end);
n_weeks = n_weeks - 1;
num_stocks_in_week = num_stocks_in_week(2:end);

%% clearing out nans

usable_nan_ex = (~isnan(weekly_rets));

%% need to change end of month so that it reflects market day

new_end_of_month = NaT(length(end_of_month), 1);
for i = 1:length(end_of_month)
   new_end_of_month(i) = max(dates(end_of_month(i) >= dates));
end
end_of_month = new_end_of_month;
end_of_month = [end_of_month; dates(1242)];
dates_weights = end_of_month;
clear new_end_of_month

%% need to randomly sample 40 of the available stocks each month

incl_40_week = zeros(n_weeks, n_stocks);
weight_mat_40_week = zeros(n_weeks, n_stocks);

stocks_incl = 40;

% backtest universalities
est_window_week = 400;

week_rebals = n_weeks - est_window_week;
count = 1;

for i = 1:week_rebals
    % different for month because different stocks enter
    if ismember(dates(i + est_window_week), end_of_month)
        % separates out stocks that have non NaN entries
        incl_40_week(i + est_window_week, :) = logical(floor(sum(usable_nan_ex((i:i + est_window_week - 1), :))./est_window_week));
        % creating a temporary row for excluding NAs
        temp_row_idx = zeros(1, length(incl_40_week(i + est_window_week, :)));
        temp_row_weight = zeros(1, length(incl_40_week(i + est_window_week, :)));
        % allocation of 40 larget stocks and weights
        [temp_row_idx(incl_40_week(i + est_window_week, :) == 1), temp_row_weight(incl_40_week(i + est_window_week, :) == 1)] = include_top_weight_stocks(incl_40_week(i + est_window_week, :), weekly_ticks, weights_ticks, monthly_weights, dates(i + est_window_week), dates_weights, stocks_incl);
        % moving back to na included space
        incl_40_week(i + est_window_week, :) = temp_row_idx;
        weight_mat_40_week(i + est_window_week, :) = temp_row_weight;
        count = count + 1;
    % on weeks that dont fall at the end of the month do not change stocks
    else
        if count > 1
            incl_40_week(i + est_window_week, :) = incl_40_week(i + est_window_week -1, :);
            weight_mat_40_week(i + est_window_week, :) = weight_mat_40_week(i + est_window_week -1, :);
        end
    end
end

incl_40_week = logical(incl_40_week);

%% need to randomly sample 100 of the available stocks each month

incl_100_week = zeros(n_weeks, n_stocks);
weight_mat_100_week = zeros(n_weeks, n_stocks);

stocks_incl = 100;

count = 1;

for i = 1:week_rebals
    % different for month because different stocks enter
    if ismember(dates(i + est_window_week), end_of_month)
        % separates out stocks that have non NaN entries
        incl_100_week(i + est_window_week, :) = logical(floor(sum(usable_nan_ex((i:i + est_window_week - 1), :))./est_window_week));
        % creating a temporary row for excluding NAs
        temp_row_idx = zeros(1, length(incl_100_week(i + est_window_week, :)));
        temp_row_weight = zeros(1, length(incl_100_week(i + est_window_week, :)));
        % allocation of 100 larget stocks and weights
        [temp_row_idx(incl_100_week(i + est_window_week, :) == 1), temp_row_weight(incl_100_week(i + est_window_week, :) == 1)] = include_top_weight_stocks(incl_100_week(i + est_window_week, :), weekly_ticks, weights_ticks, monthly_weights, dates(i + est_window_week), dates_weights, stocks_incl);
        % moving back to na included space
        incl_100_week(i + est_window_week, :) = temp_row_idx;
        weight_mat_100_week(i + est_window_week, :) = temp_row_weight;
        count = count + 1;
    % on weeks that dont fall at the end of the month do not change stocks
    else
        if count > 1
            incl_100_week(i + est_window_week, :) = incl_100_week(i + est_window_week -1, :);
            weight_mat_100_week(i + est_window_week, :) = weight_mat_100_week(i + est_window_week -1, :);
        end
    end
end

incl_100_week = logical(incl_100_week);

%% saving down the desired data

rebal_dates = end_of_month(end_of_month > dates(est_window_week));
n_rebals = length(rebal_dates);
weekly_dates = dates;

save('backtest_ret_dat.mat', 'weekly_dates', 'est_window_week', 'incl_100_week', 'incl_40_week', 'monthly_rets', 'monthly_ticks', 'rebal_dates', 'weekly_rets', 'weekly_ticks', 'weight_mat_40_week', 'weight_mat_100_week');