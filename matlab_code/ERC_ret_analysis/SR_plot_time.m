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

%% plotting the result

figure(1)
plot(month_dates(ind + n_months), roll_40_erc_sample - roll_40_erc_sample)
hold on
    plot(month_dates(ind + n_months), roll_40_erc_qr- roll_40_erc_sample)
    plot(month_dates(ind + n_months), roll_40_erc_hmm- roll_40_erc_sample)
    plot(month_dates(ind + n_months), roll_40_erc_be- roll_40_erc_sample)
    plot(month_dates(ind + n_months), roll_40_erc_l2- roll_40_erc_sample)
    plot(month_dates(ind + n_months), roll_40_erc_sw- roll_40_erc_sample)
    %plot(month_dates(ind + n_months), roll_40_cw_norm)
    %plot(month_dates(ind + n_months), roll_40_ew_norm)
    legend('SCM', 'QFM', 'RS', 'QRS', 'RR', 'SRS', 'Location', 'northeast', 'Orientation', 'vertical', 'numcolumns', 3)
    xlabel('Time')
    ylabel('3yr rolling SR diff')
hold off
figure(2)
plot(month_dates(ind + n_months), roll_100_erc_sample- roll_100_erc_sample)
hold on
    plot(month_dates(ind + n_months), roll_100_erc_qr- roll_100_erc_sample)
    plot(month_dates(ind + n_months), roll_100_erc_hmm- roll_100_erc_sample)
    plot(month_dates(ind + n_months), roll_100_erc_be- roll_100_erc_sample)
    plot(month_dates(ind + n_months), roll_100_erc_l2- roll_100_erc_sample)
    plot(month_dates(ind + n_months), roll_100_erc_sw- roll_100_erc_sample)
    %plot(month_dates(ind + n_months), roll_100_cw_norm)
    %plot(month_dates(ind + n_months), roll_100_ew_norm)
    legend('SCM', 'QFM', 'RS', 'QRS', 'RR', 'SRS', 'Location', 'northeast', 'Orientation', 'vertical', 'numcolumns', 3)
    xlabel('Time')
    ylabel('3yr rolling SR diff')
hold off








