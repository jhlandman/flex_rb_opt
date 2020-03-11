function wMinVar = port_weights_kinn_l2(returns_stocks_weekly, mean_ret, tau_hat)

%Useful constants
[n_obs, n_assets] = size(returns_stocks_weekly);

%Optimization Options
w0 = ones(n_assets,1)./n_assets; %Starting point
A = ones(1,n_assets); b = 1; %For linear equality, port sum to one
lb = zeros(1,n_assets); %Long only constraint\
ub = 0.1.*ones(1,n_assets);

fun_min_var = @(w) sum((mean_ret - returns_stocks_weekly*w).^2)/n_obs + tau_hat.*sum(w.^2);

opts = optimoptions('fmincon','Algorithm','sqp','MaxFunctionEvaluations', 50000, 'Display', 'off');

wMinVar = fmincon(fun_min_var, w0, [], [], A, b, lb, ub, [],opts);
end

