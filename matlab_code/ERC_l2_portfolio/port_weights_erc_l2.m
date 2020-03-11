function wMinVar = port_weights_erc_l2(returns_stocks_weekly, lambda, tau, mean_ret)
%PORTRISKWEIGHTS Estimate weights in a risk based portfolio construction.
%
% Formulas based on the paper by Richard and Roncalli (2015)

%Useful constants
[~,nAssets] = size(returns_stocks_weekly);

%Optimization Options
w0 = ones(nAssets,1)./nAssets; %Starting point
Aeq = ones(1,nAssets); beq = 1; %For linear equality, port sum to one
lb = zeros(1,nAssets); %Long only constraint
ub = 0.1.*ones(1,nAssets);

% optimization
funMinVar = @(w) (sum(...
          (mean_ret - returns_stocks_weekly*w).^2)) - tau.*sum(log(w))  + lambda.*sum(w.^2);

opts = optimoptions('fmincon','Algorithm','sqp','MaxFunctionEvaluations', 50000, 'Display', 'off');

wMinVar = fmincon(funMinVar, w0, [], [], Aeq, beq, lb, ub, [],opts);
end
