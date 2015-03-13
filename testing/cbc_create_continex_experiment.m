function data = cbc_create_continex_experiment(rtc, varargin)

% Parse the input
p = inputParser();
p.KeepUnmatched = true;
p.addRequired('parameter', @ischar);
p.parse(varargin{:});

% Create the container for the experiment
data = cbc_create_experiment(rtc, p.Unmatched);
data.cont_par = p.Results.parameter;

end
