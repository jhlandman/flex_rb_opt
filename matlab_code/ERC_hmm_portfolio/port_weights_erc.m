function wMinVar = port_weights_erc(cov_mat, lambda)
%PORTRISKWEIGHTS Estimate weights in a risk based portfolio construction.
%
% Formulas based on the paper by Richard and Roncalli (2015)

%Useful constants
[~,nAssets] = size(cov_mat);

%Optimization Options
w0 = ones(nAssets,1)./nAssets; %Starting point
Aeq = ones(1,nAssets); beq = 1; %For linear equality, port sum to one
lb = zeros(1,nAssets); %Long only constraint
ub = 0.1.*ones(1,nAssets);

% optimization
funMinVar = @(w) 0.5*w'*cov_mat*w - lambda.*sum(log(w));

opts = optimoptions('fmincon','Algorithm','sqp','MaxFunctionEvaluations', 50000, 'Display', 'off');

wMinVar = fmincon(funMinVar, w0, [], [], Aeq, beq, lb, ub, [],opts);
end
