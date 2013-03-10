% 1st derivative of sigmoid function
% Niru Maheswaranathan
% Sun Mar 10 16:01:38 2013
% f = dlogistic(x, {'gain', 1, 'threshold', 0, 'maximum', 1})

function f = dlogistic(x, varargin)

s = logistic(x, varargin);
f = s.*(1-s);
