clc;
clear;
format long;

load 'ret_100_gmv_sw'
load 'ret_40_gmv_sw'

ret_100_erc_sw = ret_100_gmv_sw;
time_rets_100_erc_sw = time_rets_100_gmv_sw;
time_weights_100_erc_sw = time_weights_100_gmv_sw;

ret_40_erc_sw = ret_40_gmv_sw;
time_rets_40_erc_sw = time_rets_40_gmv_sw;
time_weights_40_erc_sw = time_weights_40_gmv_sw;

save('ret_40_erc_sw.mat', 'ret_40_erc_sw', 'time_rets_40_erc_sw', 'time_weights_40_erc_sw', 'tickers_grouped_40');
save('ret_100_erc_sw.mat', 'ret_100_erc_sw', 'time_rets_100_erc_sw', 'time_weights_100_erc_sw', 'tickers_grouped_100');