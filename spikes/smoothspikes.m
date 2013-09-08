% Smooth a spike train with a Gaussian kernel
% Niru Maheswaranathan
% 11:10 PM Jul 15, 2013
% [sm, kernel, tau] = smoothspikes(t, s, sigma)
%
% Input:
%   t is the original time vector
%   s is vector (same length as t) of zeros/ones indicating the presence of spikes
%   sigma is the width of the Gaussian kernel to use (units?)
%
% Returns:
%   sm is the smoothed spike train
%   kernel is the gaussian kernel used
%   tau is a time vector associated with the kernel

function [sm, kernel, tau] = smoothspikes(t, s, sigma)

    % time step
    dt = mean(diff(t));

    % make the gaussian kernel
    tau = (-5*sigma):dt:(5*sigma);
    kernel = dt*normpdf(tau, 0, sigma);

    % convolve
    sm = conv(s, kernel, 'same');
