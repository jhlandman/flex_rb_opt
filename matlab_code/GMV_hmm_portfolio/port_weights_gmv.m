function wMinVar = port_weights_gmv(sigmaAssets)
%PORTRISKWEIGHTS Estimate weights in a risk based portfolio construction.
%
% Formulas based on the paper by Richard and Roncalli (2015)

%Useful constants
nAssets = length(sigmaAssets);

%Optimization Options
w0 = ones(nAssets,1)./nAssets; %Starting point
Aeq = ones(1,nAssets); beq = 1; %For linear equality, port sum to one
lb = zeros(1,nAssets); %Long only constraint
ub = 0.1.*ones(1,nAssets);

% optimization
funMinVar = @(w) (1/2 * w' * sigmaAssets * w);
opts = optimoptions('fmincon','Algorithm','sqp','MaxFunctionEvaluations', 50000, 'Display', 'off');

wMinVar = fmincon(funMinVar, w0, [], [], Aeq, beq, lb, ub, [],opts);

end