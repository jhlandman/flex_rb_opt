clear;
clc;
format long;

%% load data

% erc
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

% gmv

load 'ret_100_gmv_sample'
load 'ret_40_gmv_sample'

load 'ret_100_gmv_qr'
load 'ret_40_gmv_qr'

load 'ret_100_gmv_hmm'
load 'ret_40_gmv_hmm'

load 'ret_100_gmv_be'
load 'ret_40_gmv_be'

load 'ret_40_gmv_l2'
load 'ret_100_gmv_l2'

load 'ret_40_gmv_sw'
load 'ret_100_gmv_sw'

% benchmark

load 'ret_40_ew_norm'
load 'ret_100_ew_norm'

load 'ret_40_cw_norm'
load 'ret_100_cw_norm'

load 'ret_dates'

%% getting rolling information

n_months = 12;
ind = 1:(length(ret_100_erc_sample) - n_months);

%% sample - gmv
roll_40_gmv_sample = zeros(length(ind), 1);
for i = ind
    sharpe_rat_now = std(ret_40_gmv_sample(i:(i + n_months - 1)));
    ret_ann = prod((1 + ret_40_gmv_sample(i:(i + n_months - 1))).^(12/length(ret_40_gmv_sample(i:(i + n_months - 1))))) - 1;
    roll_40_gmv_sample(i) = (ret_ann - 0.06)/(sharpe_rat_now*sqrt(12));
end
sharpe_rat_40_gmv_sample = ((prod((1 + ret_40_gmv_sample).^(12/length(ret_40_gmv_sample))) - 1) - 0.06)/(std(ret_40_gmv_sample)*sqrt(12));

roll_100_gmv_sample = zeros(length(ind), 1);
for i = ind
    sharpe_rat_now = std(ret_100_gmv_sample(i:(i + n_months - 1)));
    ret_ann = prod((1 + ret_100_gmv_sample(i:(i + n_months - 1))).^(12/length(ret_100_gmv_sample(i:(i + n_months - 1))))) - 1;
    roll_100_gmv_sample(i) = (ret_ann - 0.06)/(sharpe_rat_now*sqrt(12));
end
sharpe_rat_100_gmv_sample = ((prod((1 + ret_100_gmv_sample).^(12/length(ret_100_gmv_sample))) - 1) - 0.06)/(std(ret_100_gmv_sample)*sqrt(12));

%% qr -gmv
roll_40_gmv_qr = zeros(length(ind), 1);
for i = ind
    sharpe_rat_now = std(ret_40_gmv_qr(i:(i + n_months - 1)));
    ret_ann = prod((1 + ret_40_gmv_qr(i:(i + n_months - 1))).^(12/length(ret_40_gmv_qr(i:(i + n_months - 1))))) - 1;
    roll_40_gmv_qr(i) = (ret_ann - 0.06)/(sharpe_rat_now*sqrt(12));
end
sharpe_rat_40_gmv_qr = ((prod((1 + ret_40_gmv_qr).^(12/length(ret_40_gmv_qr))) - 1) - 0.06)/(std(ret_40_gmv_qr)*sqrt(12));

roll_100_gmv_qr = zeros(length(ind), 1);
for i = ind
    sharpe_rat_now = std(ret_100_gmv_qr(i:(i + n_months - 1)));
    ret_ann = prod((1 + ret_100_gmv_qr(i:(i + n_months - 1))).^(12/length(ret_100_gmv_qr(i:(i + n_months - 1))))) - 1;
    roll_100_gmv_qr(i) = (ret_ann - 0.06)/(sharpe_rat_now*sqrt(12));
end
sharpe_rat_100_gmv_qr = ((prod((1 + ret_100_gmv_qr).^(12/length(ret_100_gmv_qr))) - 1) - 0.06)/(std(ret_100_gmv_qr)*sqrt(12));

%% hmm - gmv
roll_40_gmv_hmm = zeros(length(ind), 1);
for i = ind
    sharpe_rat_now = std(ret_40_gmv_hmm(i:(i + n_months - 1)));
    ret_ann = prod((1 + ret_40_gmv_hmm(i:(i + n_months - 1))).^(12/length(ret_40_gmv_hmm(i:(i + n_months - 1))))) - 1;
    roll_40_gmv_hmm(i) = (ret_ann - 0.06)/(sharpe_rat_now*sqrt(12));
end
sharpe_rat_40_gmv_hmm = ((prod((1 + ret_40_gmv_hmm).^(12/length(ret_40_gmv_hmm))) - 1) - 0.06)/(std(ret_40_gmv_hmm)*sqrt(12));

roll_100_gmv_hmm = zeros(length(ind), 1);
for i = ind
    sharpe_rat_now = std(ret_100_gmv_hmm(i:(i + n_months - 1)));
    ret_ann = prod((1 + ret_100_gmv_hmm(i:(i + n_months - 1))).^(12/length(ret_100_gmv_hmm(i:(i + n_months - 1))))) - 1;
    roll_100_gmv_hmm(i) = (ret_ann - 0.06)/(sharpe_rat_now*sqrt(12));
end
sharpe_rat_100_gmv_hmm = ((prod((1 + ret_100_gmv_hmm).^(12/length(ret_100_gmv_hmm))) - 1) - 0.06)/(std(ret_100_gmv_hmm)*sqrt(12));

%% be - gmv
roll_40_gmv_be = zeros(length(ind), 1);
for i = ind
    sharpe_rat_now = std(ret_40_gmv_be(i:(i + n_months - 1)));
    ret_ann = prod((1 + ret_40_gmv_be(i:(i + n_months - 1))).^(12/length(ret_40_gmv_be(i:(i + n_months - 1))))) - 1;
    roll_40_gmv_be(i) = (ret_ann - 0.06)/(sharpe_rat_now*sqrt(12));
end
sharpe_rat_40_gmv_be = ((prod((1 + ret_40_gmv_be).^(12/length(ret_40_gmv_be))) - 1) - 0.06)/(std(ret_40_gmv_be)*sqrt(12));

roll_100_gmv_be = zeros(length(ind), 1);
for i = ind
    sharpe_rat_now = std(ret_100_gmv_be(i:(i + n_months - 1)));
    ret_ann = prod((1 + ret_100_gmv_be(i:(i + n_months - 1))).^(12/length(ret_100_gmv_be(i:(i + n_months - 1))))) - 1;
    roll_100_gmv_be(i) = (ret_ann - 0.06)/(sharpe_rat_now*sqrt(12));
end
sharpe_rat_100_gmv_be = ((prod((1 + ret_100_gmv_be).^(12/length(ret_100_gmv_be))) - 1) - 0.06)/(std(ret_100_gmv_be)*sqrt(12));

%% l2 - gmv
roll_40_gmv_l2 = zeros(length(ind), 1);
for i = ind
    sharpe_rat_now = std(ret_40_gmv_l2(i:(i + n_months - 1)));
    ret_ann = prod((1 + ret_40_gmv_l2(i:(i + n_months - 1))).^(12/length(ret_40_gmv_l2(i:(i + n_months - 1))))) - 1;
    roll_40_gmv_l2(i) = (ret_ann - 0.06)/(sharpe_rat_now*sqrt(12));
end
sharpe_rat_40_gmv_l2 = ((prod((1 + ret_40_gmv_l2).^(12/length(ret_40_gmv_l2))) - 1) - 0.06)/(std(ret_40_gmv_l2)*sqrt(12));

roll_100_gmv_l2 = zeros(length(ind), 1);
for i = ind
    sharpe_rat_now = std(ret_100_gmv_l2(i:(i + n_months - 1)));
    ret_ann = prod((1 + ret_100_gmv_l2(i:(i + n_months - 1))).^(12/length(ret_100_gmv_l2(i:(i + n_months - 1))))) - 1;
    roll_100_gmv_l2(i) = (ret_ann - 0.06)/(sharpe_rat_now*sqrt(12));
end
sharpe_rat_100_gmv_l2 = ((prod((1 + ret_100_gmv_l2).^(12/length(ret_100_gmv_l2))) - 1) - 0.06)/(std(ret_100_gmv_l2)*sqrt(12));

%% sw - gmv
roll_40_gmv_sw = zeros(length(ind), 1);
for i = ind
    sharpe_rat_now = std(ret_40_gmv_sw(i:(i + n_months - 1)));
    ret_ann = prod((1 + ret_40_gmv_sw(i:(i + n_months - 1))).^(12/length(ret_40_gmv_sw(i:(i + n_months - 1))))) - 1;
    roll_40_gmv_sw(i) = (ret_ann - 0.06)/(sharpe_rat_now*sqrt(12));
end
sharpe_rat_40_gmv_sw = ((prod((1 + ret_40_gmv_sw).^(12/length(ret_40_gmv_sw))) - 1) - 0.06)/(std(ret_40_gmv_sw)*sqrt(12));

roll_100_gmv_sw = zeros(length(ind), 1);
for i = ind
    sharpe_rat_now = std(ret_100_gmv_sw(i:(i + n_months - 1)));
    ret_ann = prod((1 + ret_100_gmv_sw(i:(i + n_months - 1))).^(12/length(ret_100_gmv_sw(i:(i + n_months - 1))))) - 1;
    roll_100_gmv_sw(i) = (ret_ann - 0.06)/(sharpe_rat_now*sqrt(12));
end
sharpe_rat_100_gmv_sw = ((prod((1 + ret_100_gmv_sw).^(12/length(ret_100_gmv_sw))) - 1) - 0.06)/(std(ret_100_gmv_sw)*sqrt(12));


%% sample - erc
roll_40_erc_sample = zeros(length(ind), 1);
for i = ind
    sharpe_rat_now = std(ret_40_erc_sample(i:(i + n_months - 1)));
    ret_ann = prod((1 + ret_40_erc_sample(i:(i + n_months - 1))).^(12/length(ret_40_erc_sample(i:(i + n_months - 1))))) - 1;
    roll_40_erc_sample(i) = (ret_ann - 0.06)/(sharpe_rat_now*sqrt(12));
end
sharpe_rat_40_erc_sample = ((prod((1 + ret_40_erc_sample).^(12/length(ret_40_erc_sample))) - 1) - 0.06)/(std(ret_40_erc_sample)*sqrt(12));

roll_100_erc_sample = zeros(length(ind), 1);
for i = ind
    sharpe_rat_now = std(ret_100_erc_sample(i:(i + n_months - 1)));
    ret_ann = prod((1 + ret_100_erc_sample(i:(i + n_months - 1))).^(12/length(ret_100_erc_sample(i:(i + n_months - 1))))) - 1;
    roll_100_erc_sample(i) = (ret_ann - 0.06)/(sharpe_rat_now*sqrt(12));
end
sharpe_rat_100_erc_sample = ((prod((1 + ret_100_erc_sample).^(12/length(ret_100_erc_sample))) - 1) - 0.06)/(std(ret_100_erc_sample)*sqrt(12));

%% qr -erc
roll_40_erc_qr = zeros(length(ind), 1);
for i = ind
    sharpe_rat_now = std(ret_40_erc_qr(i:(i + n_months - 1)));
    ret_ann = prod((1 + ret_40_erc_qr(i:(i + n_months - 1))).^(12/length(ret_40_erc_qr(i:(i + n_months - 1))))) - 1;
    roll_40_erc_qr(i) = (ret_ann - 0.06)/(sharpe_rat_now*sqrt(12));
end
sharpe_rat_40_erc_qr = ((prod((1 + ret_40_erc_qr).^(12/length(ret_40_erc_qr))) - 1) - 0.06)/(std(ret_40_erc_qr)*sqrt(12));

roll_100_erc_qr = zeros(length(ind), 1);
for i = ind
    sharpe_rat_now = std(ret_100_erc_qr(i:(i + n_months - 1)));
    ret_ann = prod((1 + ret_100_erc_qr(i:(i + n_months - 1))).^(12/length(ret_100_erc_qr(i:(i + n_months - 1))))) - 1;
    roll_100_erc_qr(i) = (ret_ann - 0.06)/(sharpe_rat_now*sqrt(12));
end
sharpe_rat_100_erc_qr = ((prod((1 + ret_100_erc_qr).^(12/length(ret_100_erc_qr))) - 1) - 0.06)/(std(ret_100_erc_qr)*sqrt(12));

%% hmm - erc
roll_40_erc_hmm = zeros(length(ind), 1);
for i = ind
    sharpe_rat_now = std(ret_40_erc_hmm(i:(i + n_months - 1)));
    ret_ann = prod((1 + ret_40_erc_hmm(i:(i + n_months - 1))).^(12/length(ret_40_erc_hmm(i:(i + n_months - 1))))) - 1;
    roll_40_erc_hmm(i) = (ret_ann - 0.06)/(sharpe_rat_now*sqrt(12));
end
sharpe_rat_40_erc_hmm = ((prod((1 + ret_40_erc_hmm).^(12/length(ret_40_erc_hmm))) - 1) - 0.06)/(std(ret_40_erc_hmm)*sqrt(12));

roll_100_erc_hmm = zeros(length(ind), 1);
for i = ind
    sharpe_rat_now = std(ret_100_erc_hmm(i:(i + n_months - 1)));
    ret_ann = prod((1 + ret_100_erc_hmm(i:(i + n_months - 1))).^(12/length(ret_100_erc_hmm(i:(i + n_months - 1))))) - 1;
    roll_100_erc_hmm(i) = (ret_ann - 0.06)/(sharpe_rat_now*sqrt(12));
end
sharpe_rat_100_erc_hmm = ((prod((1 + ret_100_erc_hmm).^(12/length(ret_100_erc_hmm))) - 1) - 0.06)/(std(ret_100_erc_hmm)*sqrt(12));

%% be - erc
roll_40_erc_be = zeros(length(ind), 1);
for i = ind
    sharpe_rat_now = std(ret_40_erc_be(i:(i + n_months - 1)));
    ret_ann = prod((1 + ret_40_erc_be(i:(i + n_months - 1))).^(12/length(ret_40_erc_be(i:(i + n_months - 1))))) - 1;
    roll_40_erc_be(i) = (ret_ann - 0.06)/(sharpe_rat_now*sqrt(12));
end
sharpe_rat_40_erc_be = ((prod((1 + ret_40_erc_be).^(12/length(ret_40_erc_be))) - 1) - 0.06)/(std(ret_40_erc_be)*sqrt(12));

roll_100_erc_be = zeros(length(ind), 1);
for i = ind
    sharpe_rat_now = std(ret_100_erc_be(i:(i + n_months - 1)));
    ret_ann = prod((1 + ret_100_erc_be(i:(i + n_months - 1))).^(12/length(ret_100_erc_be(i:(i + n_months - 1))))) - 1;
    roll_100_erc_be(i) = (ret_ann - 0.06)/(sharpe_rat_now*sqrt(12));
end
sharpe_rat_100_erc_be = ((prod((1 + ret_100_erc_be).^(12/length(ret_100_erc_be))) - 1) - 0.06)/(std(ret_100_erc_be)*sqrt(12));

%% l2 - erc
roll_40_erc_l2 = zeros(length(ind), 1);
for i = ind
    sharpe_rat_now = std(ret_40_erc_l2(i:(i + n_months - 1)));
    ret_ann = prod((1 + ret_40_erc_l2(i:(i + n_months - 1))).^(12/length(ret_40_erc_l2(i:(i + n_months - 1))))) - 1;
    roll_40_erc_l2(i) = (ret_ann - 0.06)/(sharpe_rat_now*sqrt(12));
end
sharpe_rat_40_erc_l2 = ((prod((1 + ret_40_erc_l2).^(12/length(ret_40_erc_l2))) - 1) - 0.06)/(std(ret_40_erc_l2)*sqrt(12));

roll_100_erc_l2 = zeros(length(ind), 1);
for i = ind
    sharpe_rat_now = std(ret_100_erc_l2(i:(i + n_months - 1)));
    ret_ann = prod((1 + ret_100_erc_l2(i:(i + n_months - 1))).^(12/length(ret_100_erc_l2(i:(i + n_months - 1))))) - 1;
    roll_100_erc_l2(i) = (ret_ann - 0.06)/(sharpe_rat_now*sqrt(12));
end
sharpe_rat_100_erc_l2 = ((prod((1 + ret_100_erc_l2).^(12/length(ret_100_erc_l2))) - 1) - 0.06)/(std(ret_100_erc_l2)*sqrt(12));

%% sw - erc
roll_40_erc_sw = zeros(length(ind), 1);
for i = ind
    sharpe_rat_now = std(ret_40_erc_sw(i:(i + n_months - 1)));
    ret_ann = prod((1 + ret_40_erc_sw(i:(i + n_months - 1))).^(12/length(ret_40_erc_sw(i:(i + n_months - 1))))) - 1;
    roll_40_erc_sw(i) = (ret_ann - 0.06)/(sharpe_rat_now*sqrt(12));
end
sharpe_rat_40_erc_sw = ((prod((1 + ret_40_erc_sw).^(12/length(ret_40_erc_sw))) - 1) - 0.06)/(std(ret_40_erc_sw)*sqrt(12));

roll_100_erc_sw = zeros(length(ind), 1);
for i = ind
    sharpe_rat_now = std(ret_100_erc_sw(i:(i + n_months - 1)));
    ret_ann = prod((1 + ret_100_erc_sw(i:(i + n_months - 1))).^(12/length(ret_100_erc_sw(i:(i + n_months - 1))))) - 1;
    roll_100_erc_sw(i) = (ret_ann - 0.06)/(sharpe_rat_now*sqrt(12));
end
sharpe_rat_100_erc_sw = ((prod((1 + ret_100_erc_sw).^(12/length(ret_100_erc_sw))) - 1) - 0.06)/(std(ret_100_erc_sw)*sqrt(12));

%% ew norm
roll_40_ew_norm = zeros(length(ind), 1);
for i = ind
    sharpe_rat_now = std(ret_40_ew_norm(i:(i + n_months - 1)));
    ret_ann = prod((1 + ret_40_ew_norm(i:(i + n_months - 1))).^(12/length(ret_40_ew_norm(i:(i + n_months - 1))))) - 1;
    roll_40_ew_norm(i) = (ret_ann - 0.06)/(sharpe_rat_now*sqrt(12));
end
sharpe_rat_40_ew_norm = ((prod((1 + ret_40_ew_norm).^(12/length(ret_40_ew_norm))) - 1) - 0.06)/(std(ret_40_ew_norm)*sqrt(12));

roll_100_ew_norm = zeros(length(ind), 1);
for i = ind
    sharpe_rat_now = std(ret_100_ew_norm(i:(i + n_months - 1)));
    ret_ann = prod((1 + ret_100_ew_norm(i:(i + n_months - 1))).^(12/length(ret_100_ew_norm(i:(i + n_months - 1))))) - 1;
    roll_100_ew_norm(i) = (ret_ann - 0.06)/(sharpe_rat_now*sqrt(12));
end
sharpe_rat_100_ew_norm = ((prod((1 + ret_100_ew_norm).^(12/length(ret_100_ew_norm))) - 1) - 0.06)/(std(ret_100_ew_norm)*sqrt(12));

%% cw norm

roll_40_cw_norm = zeros(length(ind), 1);
for i = ind
    sharpe_rat_now = std(ret_40_cw_norm(i:(i + n_months - 1)));
    ret_ann = prod((1 + ret_40_cw_norm(i:(i + n_months - 1))).^(12/length(ret_40_cw_norm(i:(i + n_months - 1))))) - 1;
    roll_40_cw_norm(i) = (ret_ann - 0.06)/(sharpe_rat_now*sqrt(12));
end
roll_100_cw_norm = zeros(length(ind), 1);
sharpe_rat_40_cw_norm = ((prod((1 + ret_40_cw_norm).^(12/length(ret_40_cw_norm))) - 1) - 0.06)/(std(ret_40_cw_norm)*sqrt(12));

for i = ind
    sharpe_rat_now = std(ret_100_cw_norm(i:(i + n_months - 1)));
    ret_ann = prod((1 + ret_100_cw_norm(i:(i + n_months - 1))).^(12/length(ret_100_cw_norm(i:(i + n_months - 1))))) - 1;
    roll_100_cw_norm(i) = (ret_ann - 0.06)/(sharpe_rat_now*sqrt(12));
end
sharpe_rat_100_cw_norm = ((prod((1 + ret_100_cw_norm).^(12/length(ret_100_cw_norm))) - 1) - 0.06)/(std(ret_100_cw_norm)*sqrt(12));

%% getting non overlapping 1yr ranks

% 40 ranks
roll_mat_40 = horzcat(roll_40_erc_sample, roll_40_erc_qr, roll_40_erc_hmm, ...
           roll_40_erc_be, roll_40_erc_l2, roll_40_erc_sw, ...
           roll_40_gmv_sample, roll_40_gmv_qr, roll_40_gmv_hmm, ...
           roll_40_gmv_be, roll_40_gmv_l2, roll_40_gmv_sw, ...
           roll_40_cw_norm, roll_40_ew_norm);

rank_mat_40 = zeros(length(ind), 14);
for  i  = ind
[~,ind_sort_40] = sort(roll_mat_40(i, :),'descend');
row_rank = 1:14;
row_rank(ind_sort_40) = row_rank;
rank_mat_40(i, :) = row_rank;
end



% 100 ranks
roll_mat_100 = horzcat(roll_100_erc_sample, roll_100_erc_qr, roll_100_erc_hmm, ...
           roll_100_erc_be, roll_100_erc_l2, roll_100_erc_sw, ...
           roll_100_gmv_sample, roll_100_gmv_qr, roll_100_gmv_hmm, ...
           roll_100_gmv_be, roll_100_gmv_l2, roll_100_gmv_sw, ...
           roll_100_cw_norm, roll_100_ew_norm);

rank_mat_100 = zeros(length(ind), 14);
for  i  = ind
[~,ind_sort_100] = sort(roll_mat_100(i, :),'descend');
row_rank = 1:14;
row_rank(ind_sort_100) = row_rank;
rank_mat_100(i, :) = row_rank;
end

% adjusting the rolling window into an annual cross section

% N = 40
n_cross = floor(length(ind)/12);
rank_mat_40_cross = zeros(n_cross, 14);
dates_cross = month_dates(1:n_cross);
for j = 1:n_cross
    dates_cross(j) = month_dates(end - (n_cross-j)*n_months);
    rank_mat_40_cross(j, :) = rank_mat_40(end - (n_cross-j)*n_months, :);
end
rank_mat_40_cross = mean(rank_mat_40_cross);
% N = 100
n_cross = floor(length(ind)/12);
rank_mat_100_cross = zeros(n_cross, 14);
dates_cross = month_dates(1:n_cross);
for j = 1:n_cross
    dates_cross(j) = month_dates(end - (n_cross-j)*n_months);
    rank_mat_100_cross(j, :) = rank_mat_100(end - (n_cross-j)*n_months, :);
end
rank_mat_100_cross = mean(rank_mat_100_cross);

%% getting the final ranks

% N = 40
sharpe_rats_40_final = horzcat(sharpe_rat_40_erc_sample, sharpe_rat_40_erc_qr, sharpe_rat_40_erc_hmm, ...
           sharpe_rat_40_erc_be, sharpe_rat_40_erc_l2, sharpe_rat_40_erc_sw, ...
           sharpe_rat_40_gmv_sample, sharpe_rat_40_gmv_qr, sharpe_rat_40_gmv_hmm, ...
           sharpe_rat_40_gmv_be, sharpe_rat_40_gmv_l2, sharpe_rat_40_gmv_sw, ...
           sharpe_rat_40_cw_norm, sharpe_rat_40_ew_norm);

% N = 100
sharpe_rats_100_final = horzcat(sharpe_rat_100_erc_sample, sharpe_rat_100_erc_qr, sharpe_rat_100_erc_hmm, ...
           sharpe_rat_100_erc_be, sharpe_rat_100_erc_l2, sharpe_rat_100_erc_sw, ...
           sharpe_rat_100_gmv_sample, sharpe_rat_100_gmv_qr, sharpe_rat_100_gmv_hmm, ...
           sharpe_rat_100_gmv_be, sharpe_rat_100_gmv_l2, sharpe_rat_100_gmv_sw, ...
           sharpe_rat_100_cw_norm, sharpe_rat_100_ew_norm);

       
% N = 40
[~, ind_sort_40] = sort(sharpe_rats_40_final, 'descend');
row_rank = 1:14;
row_rank(ind_sort_40) = row_rank;
rank_mat_40_final = row_rank;
% N = 100
[~, ind_sort_100] = sort(sharpe_rats_100_final, 'descend');
row_rank = 1:14;
row_rank(ind_sort_100) = row_rank;
rank_mat_100_final = row_rank;

%% plotting the result

dx = 0.1;
dy = 0.1;
figure(1)
scatter(rank_mat_40_cross, rank_mat_40_final)
hold on
    text(rank_mat_40_cross + dx*3, rank_mat_40_final + dy, ...
                            {'ERC-SCM', 'ERC-QFM', 'ERC-RS', 'ERC-QRS', 'ERC-RR', 'ERC-SRS', ...
                            'GMV-SCM', 'GMV-QFM', 'GMV-RS', 'GMV-QRS', 'GMV-RR', 'GMV-SRS', ...
                            'MW', 'EW'})
    ylabel('Total cumulative rank')
    xlabel('Mean 1-year non-overlapping rank')
hold off
figure(2)
scatter(rank_mat_100_cross, rank_mat_100_final)
hold on
    text(rank_mat_100_cross + dx, rank_mat_100_final + dy, ...
                            {'ERC-SCM', 'ERC-QFM', 'ERC-RS', 'ERC-QRS', 'ERC-RR', 'ERC-SRS', ...
                            'GMV-SCM', 'GMV-QFM', 'GMV-RS', 'GMV-QRS', 'GMV-RR', 'GMV-SRS', ...
                            'MW', 'EW'})
    ylabel('Total cumulative rank')
    xlabel('Mean 1-year non-overlapping rank')
hold off


