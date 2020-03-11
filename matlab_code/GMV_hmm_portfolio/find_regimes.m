function [index_regimes] = find_regimes(returns_stocks_weekly)
%find_regimes Cleans and separates the JSE returns
%
% INPUT returns_stocks_weekly: weekly retuns in a n_time x n_stocks double
%
% OUTPUT index_regimes: the turbulent and quiet regime indexed as 1 and 0
%
% REMARKS assumes a 2-state HMM with $s \in \{Quiet, Turbulent \}$
%
% created by: Jayson Landman
% DATE: 23-Oct-2019
%
y = mahal(returns_stocks_weekly, returns_stocks_weekly);
[~,mu,~,~,smoothed] = fit_hmm(y);
prob_cut_off = 0.7; % consistent with Kroeker
if mu(1) > mu(2)
    index_regimes = smoothed(:,1) > prob_cut_off;
else
    index_regimes = smoothed(:,2) > prob_cut_off;
end
end

