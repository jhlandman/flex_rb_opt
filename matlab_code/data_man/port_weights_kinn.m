function wMinVar = port_weights_kinn(returns_stocks_weekly, rho)

%Useful constants
[~, n_assets] = size(returns_stocks_weekly);

%Optimization Options
w0 = ones(n_assets,1)./n_assets; %Starting point
A = ones(1,n_assets); b = 1; %For linear equality, port sum to one
lb = zeros(1,n_assets); %Long only constraint\
ub = 0.1.*ones(1,n_assets);

fun_min_var = @(w) sum((rho - returns_stocks_weekly*w).^2);


opts = optimoptions('fmincon','Algorithm','sqp','MaxFunctionEvaluations', 50000, 'Display', 'off');

wMinVar = fmincon(fun_min_var, w0, [], [], A, b, lb, ub, [],opts);

end

