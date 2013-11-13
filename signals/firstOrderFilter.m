% first order filtering
% Niru Maheswaranathan
% 2:55 AM Oct 23, 2013
% y = firstOrderFilter(t, x, lowc, highc)

function y = firstOrderFilter(t, x, lowc, highc)

    % sampling rate
    Fs = 1/mean(diff(t));

    % build the filter
    [b, a] = butter(1, [lowc/(Fs/2), highc/(Fs/2)]);

    % filter the signal
    y = filtfilt(b, a, x);
