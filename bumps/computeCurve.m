% Gaussian Bumps toolbox
% compute full nonlinearity from coefficients
% Niru Maheswaranathan
% Wed May 22 13:07:57 2013

function [x y] = computeCurve(xk, yk, sigma, limits, numpts)

    if nargin < 5
        numpts = 1e3;
    end
    if nargin < 4
        limits = [xk(1) xk(end)];
    end
    if nargin < 3
        sigma = 1;
    end

    x = linspace(limits(1), limits(2), numpts);
    y = zeros(size(x));
    dx = mean(diff(xk));

    for k = 1:length(xk)
        pdf = normpdf(x, xk(k), sigma); pdf = pdf./(sum(pdf)*mean(diff(x)));
        y = y + yk(k)*dx*pdf;
    end
