% Bin a set of spike times
% Niru Maheswaranathan
% 8:59 PM, Sep 7, 2013
% [t, s] = binspikes(spikes, dt, T)
%
% Input:
%   spikes is a list of spike times
%   dt is the bin width (default: 20ms)
%   T is the maximum time to go out to (default: max(spikes))
%
% Returns:
%   t is a time vector
%   s is a vector containing the number of spikes that occured in that time bin

function [t, s] = binspikes(spikes, dt, T)

    % check for arguments
    if nargin == 1
        dt = 20e-3;
    elseif nargin == 2
        T = ceil(max(spikes));
    elseif nargin == 0
        error('You need to at least give me a list of spike times.');
    end

    % generate time vector
    t = dt:dt:T;
    s = zeros(size(t));

    % loop over bins
    for j = 1:length(t)

        % count # of spikes falling within this window
        s(j) = sum(spikes > t(j)-dt & spikes <= t(j));

    end
