function [weights_scaled] = port_weights_sw(returns_now, b,  s, lambda)

[~,  n_stocks] = size(returns_now);

% sampling b stocks s times
weights_out = zeros(n_stocks, 1);
for i = 1:s
    rand_ind = (randperm(n_stocks) <= b);
    temp_cov = cov(returns_now(:, rand_ind));
    weights_now = port_weights_erc(temp_cov, lambda);
    weights_out(rand_ind) = weights_out(rand_ind) + weights_now;
end

weights_scaled = weights_out./s;

end

