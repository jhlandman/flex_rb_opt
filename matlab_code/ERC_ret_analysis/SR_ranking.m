clear;
clc;
format long;

%% load data

load 'ret_100_erc_sample'
load 'ret_40_erc_sample'

load 'ret_100_erc_qr'
load 'ret_40_erc_qr'

load 'ret_100_erc_hmm'
load 'ret_40_erc_hmm'

load 'ret_100_erc_be'
load 'ret_40_erc_be'

load 'ret_40_erc_l2'
load 'ret_100_erc_l2'

load 'ret_40_erc_sw'
load 'ret_100_erc_sw'

load 'ret_40_ew_norm'
load 'ret_100_ew_norm'

load 'ret_40_cw_norm'
load 'ret_100_cw_norm'

load 'ret_dates'

%% getting rolling information

n_months = 36;
ind = 1:(length(ret_100_erc_sample) - n_months);

% sample
roll_40_erc_sample = zeros(length(ind), 1);
for i = ind
    sharpe_rat_now = std(ret_40_erc_sample(i:(i + n_months - 1)));
    ret_ann = prod((1 + ret_40_erc_sample(i:(i + n_months - 1))).^(12/length(ret_40_erc_sample(i:(i + n_months - 1))))) - 1;
    roll_40_erc_sample(i) = (ret_ann - 0.06)/(sharpe_rat_now*sqrt(12));
end
roll_100_erc_sample = zeros(length(ind), 1);
for i = ind
    sharpe_rat_now = std(ret_100_erc_sample(i:(i + n_months - 1)));
    ret_ann = prod((1 + ret_100_erc_sample(i:(i + n_months - 1))).^(12/length(ret_100_erc_sample(i:(i + n_months - 1))))) - 1;
    roll_100_erc_sample(i) = (ret_ann - 0.06)/(sharpe_rat_now*sqrt(12));
end

% qr
roll_40_erc_qr = zeros(length(ind), 1);
for i = ind
    sharpe_rat_now = std(ret_40_erc_qr(i:(i + n_months - 1)));
    ret_ann = prod((1 + ret_40_erc_qr(i:(i + n_months - 1))).^(12/length(ret_40_erc_qr(i:(i + n_months - 1))))) - 1;
    roll_40_erc_qr(i) = (ret_ann - 0.06)/(sharpe_rat_now*sqrt(12));
end
roll_100_erc_qr = zeros(length(ind), 1);
for i = ind
    sharpe_rat_now = std(ret_100_erc_qr(i:(i + n_months - 1)));
    ret_ann = prod((1 + ret_100_erc_qr(i:(i + n_months - 1))).^(12/length(ret_100_erc_qr(i:(i + n_months - 1))))) - 1;
    roll_100_erc_qr(i) = (ret_ann - 0.06)/(sharpe_rat_now*sqrt(12));
end

% hmm
roll_40_erc_hmm = zeros(length(ind), 1);
for i = ind
    sharpe_rat_now = std(ret_40_erc_hmm(i:(i + n_months - 1)));
    ret_ann = prod((1 + ret_40_erc_hmm(i:(i + n_months - 1))).^(12/length(ret_40_erc_hmm(i:(i + n_months - 1))))) - 1;
    roll_40_erc_hmm(i) = (ret_ann - 0.06)/(sharpe_rat_now*sqrt(12));
end
roll_100_erc_hmm = zeros(length(ind), 1);
for i = ind
    sharpe_rat_now = std(ret_100_erc_hmm(i:(i + n_months - 1)));
    ret_ann = prod((1 + ret_100_erc_hmm(i:(i + n_months - 1))).^(12/length(ret_100_erc_hmm(i:(i + n_months - 1))))) - 1;
    roll_100_erc_hmm(i) = (ret_ann - 0.06)/(sharpe_rat_now*sqrt(12));
end

% be
roll_40_erc_be = zeros(length(ind), 1);
for i = ind
    sharpe_rat_now = std(ret_40_erc_be(i:(i + n_months - 1)));
    ret_ann = prod((1 + ret_40_erc_be(i:(i + n_months - 1))).^(12/length(ret_40_erc_be(i:(i + n_months - 1))))) - 1;
    roll_40_erc_be(i) = (ret_ann - 0.06)/(sharpe_rat_now*sqrt(12));
end
roll_100_erc_be = zeros(length(ind), 1);
for i = ind
    sharpe_rat_now = std(ret_100_erc_be(i:(i + n_months - 1)));
    ret_ann = prod((1 + ret_100_erc_be(i:(i + n_months - 1))).^(12/length(ret_100_erc_be(i:(i + n_months - 1))))) - 1;
    roll_100_erc_be(i) = (ret_ann - 0.06)/(sharpe_rat_now*sqrt(12));
end

% l2
roll_40_erc_l2 = zeros(length(ind), 1);
for i = ind
    sharpe_rat_now = std(ret_40_erc_l2(i:(i + n_months - 1)));
    ret_ann = prod((1 + ret_40_erc_l2(i:(i + n_months - 1))).^(12/length(ret_40_erc_l2(i:(i + n_months - 1))))) - 1;
    roll_40_erc_l2(i) = (ret_ann - 0.06)/(sharpe_rat_now*sqrt(12));
end
roll_100_erc_l2 = zeros(length(ind), 1);
for i = ind
    sharpe_rat_now = std(ret_100_erc_l2(i:(i + n_months - 1)));
    ret_ann = prod((1 + ret_100_erc_l2(i:(i + n_months - 1))).^(12/length(ret_100_erc_l2(i:(i + n_months - 1))))) - 1;
    roll_100_erc_l2(i) = (ret_ann - 0.06)/(sharpe_rat_now*sqrt(12));
end

% sw
roll_40_erc_sw = zeros(length(ind), 1);
for i = ind
    sharpe_rat_now = std(ret_40_erc_sw(i:(i + n_months - 1)));
    ret_ann = prod((1 + ret_40_erc_sw(i:(i + n_months - 1))).^(12/length(ret_40_erc_sw(i:(i + n_months - 1))))) - 1;
    roll_40_erc_sw(i) = (ret_ann - 0.06)/(sharpe_rat_now*sqrt(12));
end
roll_100_erc_sw = zeros(length(ind), 1);
for i = ind
    sharpe_rat_now = std(ret_100_erc_sw(i:(i + n_months - 1)));
    ret_ann = prod((1 + ret_100_erc_sw(i:(i + n_months - 1))).^(12/length(ret_100_erc_sw(i:(i + n_months - 1))))) - 1;
    roll_100_erc_sw(i) = (ret_ann - 0.06)/(sharpe_rat_now*sqrt(12));
end

% norm
roll_40_ew_norm = zeros(length(ind), 1);
for i = ind
    sharpe_rat_now = std(ret_40_ew_norm(i:(i + n_months - 1)));
    ret_ann = prod((1 + ret_40_ew_norm(i:(i + n_months - 1))).^(12/length(ret_40_ew_norm(i:(i + n_months - 1))))) - 1;
    roll_40_ew_norm(i) = (ret_ann - 0.06)/(sharpe_rat_now*sqrt(12));
end
roll_100_ew_norm = zeros(length(ind), 1);
for i = ind
    sharpe_rat_now = std(ret_100_ew_norm(i:(i + n_months - 1)));
    ret_ann = prod((1 + ret_100_ew_norm(i:(i + n_months - 1))).^(12/length(ret_100_ew_norm(i:(i + n_months - 1))))) - 1;
    roll_100_ew_norm(i) = (ret_ann - 0.06)/(sharpe_rat_now*sqrt(12));
end

% norm
roll_40_cw_norm = zeros(length(ind), 1);
for i = ind
    sharpe_rat_now = std(ret_40_cw_norm(i:(i + n_months - 1)));
    ret_ann = prod((1 + ret_40_cw_norm(i:(i + n_months - 1))).^(12/length(ret_40_cw_norm(i:(i + n_months - 1))))) - 1;
    roll_40_cw_norm(i) = (ret_ann - 0.06)/(sharpe_rat_now*sqrt(12));
end
roll_100_cw_norm = zeros(length(ind), 1);
for i = ind
    sharpe_rat_now = std(ret_100_cw_norm(i:(i + n_months - 1)));
    ret_ann = prod((1 + ret_100_cw_norm(i:(i + n_months - 1))).^(12/length(ret_100_cw_norm(i:(i + n_months - 1))))) - 1;
    roll_100_cw_norm(i) = (ret_ann - 0.06)/(sharpe_rat_now*sqrt(12));
end

%% ranking the results

% 40 ranks
roll_mat = horzcat(roll_40_erc_sample, roll_40_erc_qr, roll_40_erc_hmm, ...
           roll_40_erc_be, roll_40_erc_l2, roll_40_erc_sw, ...
           roll_40_cw_norm, roll_40_ew_norm);
[~, ranks_40] = sort(roll_mat', 'asc');
ranks_40 = ranks_40';

% 100 ranks
roll_mat = horzcat(roll_100_erc_sample, roll_100_erc_qr, roll_100_erc_hmm, ...
           roll_100_erc_be, roll_100_erc_l2, roll_100_erc_sw, ...
           roll_100_cw_norm, roll_100_ew_norm);
[~, ranks_100] = sort(roll_mat', 'asc');
ranks_100 = ranks_100';

figure(1)
subplot(2, 1, 1)
plot(month_dates(ind + n_months), ranks_40(:, 1))
hold on
    plot(month_dates(ind + n_months), ranks_40(:, 2))
    plot(month_dates(ind + n_months), ranks_40(:, 3))
    plot(month_dates(ind + n_months), ranks_40(:, 4))
    plot(month_dates(ind + n_months), ranks_40(:, 5))
    plot(month_dates(ind + n_months), ranks_40(:, 6))
    plot(month_dates(ind + n_months), ranks_40(:, 7))
    plot(month_dates(ind + n_months), ranks_40(:, 8))
    legend('SCM', 'QFM', 'RS', 'QFMRS', 'RR', 'SRS', 'CW', 'EW', 'Location', 'northeast', 'Orientation', 'vertical', 'numcolumns', 3)
    xlabel('Time')
    ylabel('3yr rolling SR rank')
    title('(N = 40)')
    ylim([0 9])
hold off
subplot(2, 1, 2)
plot(month_dates(ind + n_months), ranks_100(:, 1))
hold on
    plot(month_dates(ind + n_months), ranks_100(:, 2))
    plot(month_dates(ind + n_months), ranks_100(:, 3))
    plot(month_dates(ind + n_months), ranks_100(:, 4))
    plot(month_dates(ind + n_months), ranks_100(:, 5))
    plot(month_dates(ind + n_months), ranks_100(:, 6))
    plot(month_dates(ind + n_months), ranks_100(:, 7))
    plot(month_dates(ind + n_months), ranks_100(:, 8))
    xlabel('Time')
    ylabel('3yr rolling SR rank')
    title('(N = 100)')
    ylim([0 9])
hold off






