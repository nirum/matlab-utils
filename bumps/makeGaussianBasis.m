% generate Gaussian basis
% Niru Maheswaranathan
% Wed May 29 18:15:20 2013

function Phi = makeGaussianBasis(m, sigma, x, limits)

    % make empty matrix
    n   = length(x);
    Phi = zeros(m,n);

    % space out centers
    if (nargin < 4) limits = [x(1) x(end)]; end
    xk = linspace(limits(1), limits(2), m);
    dx = mean(diff(xk));

    % build bases
    for j = 1:m
        pdf = normpdf(x, xk(j), sigma);      % gaussian PDF
        pdf = pdf./(sum(pdf)*mean(diff(x))); % normalize
        Phi(j,:) = dx*pdf;
    end
