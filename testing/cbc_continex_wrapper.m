function [data, y] = cbc_continex_wrapper(data, x, p)

% Set the control target and the desired parameter value
data.rtc.par.x_target_coeffs(data.fourier.idx_fund) = x;
if iscellstr(data.cont_par)
    data.rtc.set_par(data.cont_par, num2cell(p));
else
    data.rtc.par.(data.cont_par) = p;
end

% Do a fixed-point (picard) iteration to eliminate the higher modes
cbc_picard_iteration_x(data);

% Get the steady-state value
y = x(:) - data.rtc.par.x_coeffs_ave(data.fourier.idx_fund)';

end
