clear;
clc;
format long;

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

% sample portfolios
[sigma_40_erc_sample, neff_40_erc_sample, rwind_40_erc_sample, to_40_erc_sample, sr_40_erc_sample, mdd_40_erc_sample] = get_all_risk_metrics(ret_40_erc_sample, time_weights_40_erc, time_rets_40_erc, tickers_grouped_40);
[sigma_100_erc_sample, neff_100_erc_sample, rwind_100_erc_sample, to_100_erc_sample, sr_100_erc_sample, mdd_100_erc_sample] = get_all_risk_metrics(ret_100_erc_sample, time_weights_100_erc, time_rets_100_erc, tickers_grouped_100);

% qr portfolios
[sigma_40_erc_qr, neff_40_erc_qr, rwind_40_erc_qr, to_40_erc_qr, sr_40_erc_qr, mdd_40_erc_qr] = get_all_risk_metrics(ret_40_erc_qr, time_weights_40_erc_qr, time_rets_40_erc_qr, tickers_grouped_40);
[sigma_100_erc_qr, neff_100_erc_qr, rwind_100_erc_qr, to_100_erc_qr, sr_100_erc_qr, mdd_100_erc_qr] = get_all_risk_metrics(ret_100_erc_qr, time_weights_100_erc_qr, time_rets_100_erc_qr, tickers_grouped_100);

% hmm portfolios
[sigma_40_erc_hmm, neff_40_erc_hmm, rwind_40_erc_hmm, to_40_erc_hmm, sr_40_erc_hmm, mdd_40_erc_hmm] = get_all_risk_metrics(ret_40_erc_hmm, time_weights_40_erc_hmm, time_rets_40_erc_hmm, tickers_grouped_40);
[sigma_100_erc_hmm, neff_100_erc_hmm, rwind_100_erc_hmm, to_100_erc_hmm, sr_100_erc_hmm, mdd_100_erc_hmm] = get_all_risk_metrics(ret_100_erc_hmm, time_weights_100_erc_hmm, time_rets_100_erc_hmm, tickers_grouped_100);

% be portfolios
[sigma_40_erc_be, neff_40_erc_be, rwind_40_erc_be, to_40_erc_be, sr_40_erc_be, mdd_40_erc_be] = get_all_risk_metrics(ret_40_erc_be, time_weights_40_erc_be, time_rets_40_erc_be, tickers_grouped_40);
[sigma_100_erc_be, neff_100_erc_be, rwind_100_erc_be, to_100_erc_be, sr_100_erc_be, mdd_100_erc_be] = get_all_risk_metrics(ret_100_erc_be, time_weights_100_erc_be, time_rets_100_erc_be, tickers_grouped_100);

% l2 portfolios
[sigma_40_erc_l2, neff_40_erc_l2, rwind_40_erc_l2, to_40_erc_l2, sr_40_erc_l2, mdd_40_erc_l2] = get_all_risk_metrics(ret_40_erc_l2, time_weights_40_erc_l2, time_rets_40_erc_l2, tickers_grouped_40);
[sigma_100_erc_l2, neff_100_erc_l2, rwind_100_erc_l2, to_100_erc_l2, sr_100_erc_l2, mdd_100_erc_l2] = get_all_risk_metrics(ret_100_erc_l2, time_weights_100_erc_l2, time_rets_100_erc_l2, tickers_grouped_100);

% sw portfolios
[sigma_40_erc_sw, neff_40_erc_sw, rwind_40_erc_sw, to_40_erc_sw, sr_40_erc_sw, mdd_40_erc_sw] = get_all_risk_metrics(ret_40_erc_sw, time_weights_40_erc_sw, time_rets_40_erc_sw, tickers_grouped_40);
[sigma_100_erc_sw, neff_100_erc_sw, rwind_100_erc_sw, to_100_erc_sw, sr_100_erc_sw, mdd_100_erc_sw] = get_all_risk_metrics(ret_100_erc_sw, time_weights_100_erc_sw, time_rets_100_erc_sw, tickers_grouped_100);

% ew portfolios
[sigma_40_ew_norm, neff_40_ew_norm, rwind_40_ew_norm, to_40_ew_norm, sr_40_ew_norm, mdd_40_ew_norm] = get_all_risk_metrics(ret_40_ew_norm, time_weights_40_ew_norm, time_rets_40_ew_norm, tickers_grouped_40);
[sigma_100_ew_norm, neff_100_ew_norm, rwind_100_ew_norm, to_100_ew_norm, sr_100_ew_norm, mdd_100_ew_norm] = get_all_risk_metrics(ret_100_ew_norm, time_weights_100_ew_norm, time_rets_100_ew_norm, tickers_grouped_100);

% cw portfolios
[sigma_40_cw_norm, neff_40_cw_norm, rwind_40_cw_norm, to_40_cw_norm, sr_40_cw_norm, mdd_40_cw_norm] = get_all_risk_metrics(ret_40_cw_norm, time_weights_40_cw_norm, time_rets_40_cw_norm, tickers_grouped_40);
[sigma_100_cw_norm, neff_100_cw_norm, rwind_100_cw_norm, to_100_cw_norm, sr_100_cw_norm, mdd_100_cw_norm] = get_all_risk_metrics(ret_100_cw_norm, time_weights_100_cw_norm, time_rets_100_cw_norm, tickers_grouped_100);

% erc 40 matrix
A_1 = [sigma_40_erc_sample, neff_40_erc_sample, rwind_40_erc_sample, sr_40_erc_sample, to_40_erc_sample, mdd_40_erc_sample]';
A_2 = [sigma_40_erc_qr, neff_40_erc_qr, rwind_40_erc_qr, sr_40_erc_qr, to_40_erc_qr, mdd_40_erc_qr]';
A_3 = [sigma_40_erc_hmm, neff_40_erc_hmm, rwind_40_erc_hmm, sr_40_erc_hmm, to_40_erc_hmm, mdd_40_erc_hmm]';
A_4 = [sigma_40_erc_be, neff_40_erc_be, rwind_40_erc_be, sr_40_erc_be, to_40_erc_be, mdd_40_erc_be]';
A_5 = [sigma_40_erc_l2, neff_40_erc_l2, rwind_40_erc_l2, sr_40_erc_l2, to_40_erc_l2, mdd_40_erc_l2]';
A_6 = [sigma_40_erc_sw, neff_40_erc_sw, rwind_40_erc_sw, sr_40_erc_sw, to_40_erc_sw, mdd_40_erc_sw]';
A =  horzcat(A_1, A_2, A_3, A_4, A_5, A_6);
A(1, :) = A(1, :).*100;
A(5, :) = A(5, :).*100;
A(6, :) = A(6, :).*100;

latex_table = latex(sym(round(A, 2)));

% erc 100 matrix
A_1 = [sigma_100_erc_sample, neff_100_erc_sample, rwind_100_erc_sample, sr_100_erc_sample, to_100_erc_sample, mdd_100_erc_sample]';
A_2 = [sigma_100_erc_qr, neff_100_erc_qr, rwind_100_erc_qr, sr_100_erc_qr, to_100_erc_qr, mdd_100_erc_qr]';
A_3 = [sigma_100_erc_hmm, neff_100_erc_hmm, rwind_100_erc_hmm, sr_100_erc_hmm, to_100_erc_hmm, mdd_100_erc_hmm]';
A_4 = [sigma_100_erc_be, neff_100_erc_be, rwind_100_erc_be, sr_100_erc_be, to_100_erc_be, mdd_100_erc_be]';
A_5 = [sigma_100_erc_l2, neff_100_erc_l2, rwind_100_erc_l2, sr_100_erc_l2, to_100_erc_l2, mdd_100_erc_l2]';
A_6 = [sigma_100_erc_sw, neff_100_erc_sw, rwind_100_erc_sw, sr_100_erc_sw, to_100_erc_sw, mdd_100_erc_sw]';
A =  horzcat(A_1, A_2, A_3, A_4, A_5, A_6);
A(1, :) = A(1, :).*100;
A(5, :) = A(5, :).*100;
A(6, :) = A(6, :).*100;

latex_table_2 = latex(sym(round(A, 2)));

% benchmark 40 matrix

B_1 = [sigma_40_ew_norm, neff_40_ew_norm, rwind_40_ew_norm, sr_40_ew_norm, to_40_ew_norm, mdd_40_ew_norm]';
B_2 = [sigma_40_cw_norm, neff_40_cw_norm, rwind_40_cw_norm, sr_40_cw_norm, to_40_cw_norm, mdd_40_cw_norm]';
B = vertcat(B_1, B_2);
B(1, :) = B(1, :).*100;
B(5, :) = B(5, :).*100;
B(6, :) = B(6, :).*100;
B(7, :) = B(7, :).*100;
B(11, :) = B(11, :).*100;
B(12, :) = B(12, :).*100;
latex_table_3 = latex(sym(round(B, 2)));

% benchmark 100 matrix

B_1 = [sigma_100_ew_norm, neff_100_ew_norm, rwind_100_ew_norm, sr_100_ew_norm, to_100_ew_norm, mdd_100_ew_norm]';
B_2 = [sigma_100_cw_norm, neff_100_cw_norm, rwind_100_cw_norm, sr_100_cw_norm, to_100_cw_norm, mdd_100_cw_norm]';
B = vertcat(B_1, B_2);
B(1, :) = B(1, :).*100;
B(5, :) = B(5, :).*100;
B(6, :) = B(6, :).*100;
B(7, :) = B(7, :).*100;
B(11, :) = B(11, :).*100;
B(12, :) = B(12, :).*100;
latex_table_4 = latex(sym(round(B, 2)));
