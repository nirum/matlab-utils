% evaluate Gaussian basis
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

function Phi = evalGaussianBasis(x, centers, sigmasq)

    % store output
    Phi = zeros(length(centers),length(x));

    % build bases
    for j = 1:length(centers)
        Phi(j,:) = exp(-(x-centers(j)).^2/sigmasq);
    end
