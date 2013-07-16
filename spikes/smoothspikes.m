% Smooth a spike train with a Gaussian kernel
% Niru Maheswaranathan
% 11:10 PM Jul 15, 2013

function sm = smoothspikes(t, s, sigma)

    % time step
    dt = mean(diff(t));

    % make the gaussian kernel
    tau = (-5*sigma):dt:(5*sigma);
    kernel = dt*normpdf(tau, 0, sigma);

    % convolve
    sm = conv(s, kernel, 'same');
