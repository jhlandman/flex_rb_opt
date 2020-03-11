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

%% plotting the result

figure(1)
plot(month_dates(ind + n_months), -roll_40_gmv_sample*100./roll_40_gmv_sample + 100)
hold on
    plot(month_dates(ind + n_months), -roll_40_gmv_qr*100./roll_40_gmv_sample +100)
    plot(month_dates(ind + n_months), -roll_40_gmv_hmm*100./roll_40_gmv_sample + 100)
    plot(month_dates(ind + n_months), -roll_40_gmv_be*100./roll_40_gmv_sample +100)
    plot(month_dates(ind + n_months), -roll_40_gmv_l2*100./roll_40_gmv_sample +100)
    plot(month_dates(ind + n_months), -roll_40_gmv_sw*100./roll_40_gmv_sample + 100)
    %plot(month_dates(ind + n_months), roll_40_cw_norm*100./roll_40_gmv_sample)
    %plot(month_dates(ind + n_months), roll_40_ew_norm*100./roll_40_gmv_sample)
    legend('SCM', 'QFM', 'RS', 'QRS', 'RR', 'SRS', 'Location', 'northeast', 'Orientation', 'vertical', 'numcolumns', 3)
    xlabel('Time')
    ylabel('volatility reduction [%]')
hold off
figure(2)
plot(month_dates(ind + n_months), -roll_100_gmv_sample*100./roll_100_gmv_sample + 100)
hold on
    plot(month_dates(ind + n_months), -roll_100_gmv_qr*100./roll_100_gmv_sample+ 100)
    plot(month_dates(ind + n_months), -roll_100_gmv_hmm*100./roll_100_gmv_sample+ 100)
    plot(month_dates(ind + n_months), -roll_100_gmv_be*100./roll_100_gmv_sample + 100)
    plot(month_dates(ind + n_months), -roll_100_gmv_l2*100./roll_100_gmv_sample + 100)
    plot(month_dates(ind + n_months), -roll_100_gmv_sw*100./roll_100_gmv_sample+ 100)
    %plot(month_dates(ind + n_months), roll_100_cw_norm*100./roll_100_gmv_sample)
    %plot(month_dates(ind + n_months), roll_100_ew_norm*100./roll_100_gmv_sample)
    legend('SCM', 'QFM', 'RS', 'QRS', 'RR', 'SRS', 'Location', 'northeast', 'Orientation', 'vertical', 'numcolumns', 3)
    xlabel('Time')
    ylabel('volatility reduction [%]')
hold off








