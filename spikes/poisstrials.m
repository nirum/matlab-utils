% Generate poisson spiking across many trials
% Niru Maheswaranathan
% Fri May 24 14:55:53 2013
% spikes = poisstrials(rate, numTrials)

function spikes = poisstrials(rate, numTrials)

    spikes = zeros(numTrials, length(rate));
    for j = 1:numTrials
        spikes(j,:) = row(poissrnd(rate));
    end
