% 2nd derivative of sigmoid function
% Niru Maheswaranathan
% Sun Mar 10 16:02:56 2013
% f = d2logistic(x, {'gain', 1, 'threshold', 0, 'maximum', 1})

function f = d2logistic(x, varargin)

s = logistic(x, varargin{:});
f = s.*(1-s).*(1-2*s);
