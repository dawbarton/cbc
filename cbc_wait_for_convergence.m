function success = cbc_wait_for_convergence(exp)
% CBC_WAIT_FOR_CONVERGENCE  Wait for the (normalise) variance of the
%   Fourier coefficients to settle to the desired level.
%
%   success = CBC_WAIT_FOR_CONVERGENCE(EXP) returns true if the Fourier
%   coefficients settled in the time allowed. 
%
%   See also CBC_CREATE_EXPERIMENT.

% Written by David A.W. Barton (david.barton@bristol.ac.uk) 2015

% Always wait to allow changes to propogate through the system and effect
% the variance calculations
pause(exp.opt.wait_time);

% Get the handle to the RTC
rtc = exp.rtc;

% Wait until the normalised variance is sufficiently small
iter = 1;
while (iter < exp.opt.max_waits) && any(rtc.par.x_coeffs_var/norm(rtc.par.x_coeffs_ave) > exp.opt.x_coeffs_var_tol)
    pause(exp.opt.wait_time);
    iter = iter + 1;
end

if any(rtc.par.x_coeffs_var/norm(rtc.par.x_coeffs_ave) > exp.opt.x_coeffs_var_tol)
    success = false;
else
    success = true;
end

end
