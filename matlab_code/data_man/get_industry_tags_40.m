clear;
clc;
format long;

%% reading in from excel

load 'backtest_40_dat.mat'
industry_class = readtable('data_emlyn_sheet.xlsx', 'sheet', 4);

industry_ticks = string(industry_class.Ticker);
industry_tag = string(industry_class.Industry);

[n_rebals, n_stocks] = size(tickers_grouped_40);

ind_alloc_40 = strings(n_rebals, n_stocks);
for row = 1:n_rebals
   for col = 1:n_stocks
       tick_now = tickers_grouped_40(row, col);
       ind_now = industry_tag(industry_ticks == tick_now);
       if isempty(ind_now)
        row
       else
        ind_alloc_40(row, col) = ind_now;
       end
   end
end

save('indus_40.mat', 'ind_alloc_40')
