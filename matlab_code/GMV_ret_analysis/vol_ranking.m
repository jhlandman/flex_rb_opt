clear;
clc;
format long;

%% load data

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

load 'ret_40_ew_norm'
load 'ret_100_ew_norm'

load 'ret_40_cw_norm'
load 'ret_100_cw_norm'

load 'ret_dates'

%% getting rolling information

n_months = 36;
ind = 1:(length(ret_100_gmv_sample) - n_months);

% sample
roll_40_gmv_sample = zeros(length(ind), 1);
for i = ind
    sigma_now = std(ret_40_gmv_sample(i:(i + n_months - 1)));
    roll_40_gmv_sample(i) = sigma_now*sqrt(12);
end
roll_100_gmv_sample = zeros(length(ind), 1);
for i = ind
    sigma_now = std(ret_100_gmv_sample(i:(i + n_months - 1)));
    roll_100_gmv_sample(i) = sigma_now*sqrt(12);
end

% qr
roll_40_gmv_qr = zeros(length(ind), 1);
for i = ind
    sigma_now = std(ret_40_gmv_qr(i:(i + n_months - 1)));
    roll_40_gmv_qr(i) = sigma_now*sqrt(12);
end
roll_100_gmv_qr = zeros(length(ind), 1);
for i = ind
    sigma_now = std(ret_100_gmv_qr(i:(i + n_months - 1)));
    roll_100_gmv_qr(i) = sigma_now*sqrt(12);
end

% hmm
roll_40_gmv_hmm = zeros(length(ind), 1);
for i = ind
    sigma_now = std(ret_40_gmv_hmm(i:(i + n_months - 1)));
    roll_40_gmv_hmm(i) = sigma_now*sqrt(12);
end
roll_100_gmv_hmm = zeros(length(ind), 1);
for i = ind
    sigma_now = std(ret_100_gmv_hmm(i:(i + n_months - 1)));
    roll_100_gmv_hmm(i) = sigma_now*sqrt(12);
end

% be
roll_40_gmv_be = zeros(length(ind), 1);
for i = ind
    sigma_now = std(ret_40_gmv_be(i:(i + n_months - 1)));
    roll_40_gmv_be(i) = sigma_now*sqrt(12);
end
roll_100_gmv_be = zeros(length(ind), 1);
for i = ind
    sigma_now = std(ret_100_gmv_be(i:(i + n_months - 1)));
    roll_100_gmv_be(i) = sigma_now*sqrt(12);
end

% l2
roll_40_gmv_l2 = zeros(length(ind), 1);
for i = ind
    sigma_now = std(ret_40_gmv_l2(i:(i + n_months - 1)));
    roll_40_gmv_l2(i) = sigma_now*sqrt(12);
end
roll_100_gmv_l2 = zeros(length(ind), 1);
for i = ind
    sigma_now = std(ret_100_gmv_l2(i:(i + n_months - 1)));
    roll_100_gmv_l2(i) = sigma_now*sqrt(12);
end

% sw
roll_40_gmv_sw = zeros(length(ind), 1);
for i = ind
    sigma_now = std(ret_40_gmv_sw(i:(i + n_months - 1)));
    roll_40_gmv_sw(i) = sigma_now*sqrt(12);
end
roll_100_gmv_sw = zeros(length(ind), 1);
for i = ind
    sigma_now = std(ret_100_gmv_sw(i:(i + n_months - 1)));
    roll_100_gmv_sw(i) = sigma_now*sqrt(12);
end

% ew
roll_40_ew_norm = zeros(length(ind), 1);
for i = ind
    sigma_now = std(ret_40_ew_norm(i:(i + n_months - 1)));
    roll_40_ew_norm(i) = sigma_now*sqrt(12);
end
roll_100_ew_norm = zeros(length(ind), 1);
for i = ind
    sigma_now = std(ret_100_ew_norm(i:(i + n_months - 1)));
    roll_100_ew_norm(i) = sigma_now*sqrt(12);
end

% cw
roll_40_cw_norm = zeros(length(ind), 1);
for i = ind
    sigma_now = std(ret_40_cw_norm(i:(i + n_months - 1)));
    roll_40_cw_norm(i) = sigma_now*sqrt(12);
end
roll_100_cw_norm = zeros(length(ind), 1);
for i = ind
    sigma_now = std(ret_100_cw_norm(i:(i + n_months - 1)));
    roll_100_cw_norm(i) = sigma_now*sqrt(12);
end

%% ranking the results

% 40 ranks
roll_mat = horzcat(roll_40_gmv_sample, roll_40_gmv_qr, roll_40_gmv_hmm, ...
           roll_40_gmv_be, roll_40_gmv_l2, roll_40_gmv_sw, ...
           roll_40_cw_norm, roll_40_ew_norm);
[~, ranks_40] = sort(roll_mat', 'desc');
ranks_40 = ranks_40';

% 100 ranks
roll_mat = horzcat(roll_100_gmv_sample, roll_100_gmv_qr, roll_100_gmv_hmm, ...
           roll_100_gmv_be, roll_100_gmv_l2, roll_100_gmv_sw, ...
           roll_100_cw_norm, roll_100_ew_norm);
[~, ranks_100] = sort(roll_mat', 'desc');
ranks_100 = ranks_100';