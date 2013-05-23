% Raised cosine function
% Niru Maheswaranathan
% Wed May 22 13:29:15 2013
%
% Make nonlinearly stretched basis consisting of raised cosines
% Inputs:  numBases = # of basis vectors
%          dt = time bin separation for representing basis
%          endpoints = 2-vector containg [1st_peak  last_peak], the peak
%                  (i.e. center) of the last raised cosine basis vectors
%          b = offset for nonlinear stretching of x axis:  y = log(x+b)
%              (larger b -> more nearly linear stretching)
%          zflag = flag for making (if = 1) finest-timescale basis
%                  vector constant below its peak (?)
%
% Outputs: t = time lattice on which basis is defined
%          x = basis itself
%          xorth = orthogonalized basis
%
%  Example call
%  [t, x, xorth] = makeRaisedCosBasis(10, .01, [0 10], .1);

function [t, x, xorth] = makeRaisedCosBasis(numBases, dt, endpoints, b, zflag)

    %% Check inputs
    if nargin == 4
        zflag = 0;
    end
    if b <= 0
        error('b must be greater than 0');
    end

    % nonlinearity for stretching x axis (and its inverse)
    logScale    = @(x) log(x + 1e-20);
    invLogScale = @(x) exp(x) - 1e-20;

    %% Build time vector
    range   = logScale(endpoints+b);  % range of values
    db      = diff(range)/(numBases-1);     % spacing between raised cosine peaks
    ctrs    = range(1):db:range(2);   % centers for basis vectors
    maxTime = invLogScale(range(2)+2*db)-b; % maximum time bin
    t       = col(0:dt:maxTime);    % time vector
    numPts  = length(t);        % number of points in iht

    x = rcos(repmat(logScale(t+b), 1, numBases), repmat(ctrs, numPts, 1), db);

    if zflag  % set first basis vector bins (before 1st peak) to 1
        x(t <= endpoints(1), 1) = 1;
    end

    xorth = orth(x);  % use orthogonalized basis
