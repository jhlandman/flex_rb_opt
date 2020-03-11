function rho_close = find_rho_hat(returns_stocks_weekly, w_gmv, n_iter)

find_w_kinn = @(rho) port_weights_kinn(returns_stocks_weekly, rho);
f_min_x = @(rho) max(abs(find_w_kinn(rho) -  w_gmv));

x_now = 0;
step_size = 0.01;
for i = 1:n_iter
   f_x = f_min_x(x_now);
   f_xp1 = f_min_x(x_now + step_size);
   f_xp2 = f_min_x(x_now + step_size*2);
   if (f_xp2 < f_xp1) & (f_xp1 < f_x)
       x_now = x_now + step_size*0.25;
   else
       step_size = step_size*0.5;
   end
   % plot([x_now (x_now + step_size) (x_now + step_size*2)], [f_x f_xp1 f_xp2])
end



rho_close = x_now;


end

