% generate Gaussian basis
% Niru Maheswaranathan
% Wed May 29 18:15:20 2013
%
% Phi = makeGaussianBasis(m, sigma, x, limits)
%
% Input:
%   - m: number of bases
%   - sigma: width of each bump 
%   - x: input vector
%   - limits: bounds 
%
% Output:
%   - Phi: each bump is along a row of Phi

function [Phi, xk] = makeGaussianBasis(m, sigmasq, x, limits)

    % make empty matrix
    n   = length(x);
    Phi = zeros(m,n);

    % space out centers
    if (nargin < 4)
        limits = [x(1) x(end)];
    end
    xk = linspace(limits(1), limits(2), m);

    % build bases
    for j = 1:m
        Phi(j,:) = exp(-(x-xk(j)).^2/sigmasq);
    end
