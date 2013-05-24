% converts matrix of spiking data to firings column format
% Niru Maheswaranathan
% Fri May 24 14:57:43 2013

function firings = spikes2firings(spikes, time)

    firings = [];
    for j = 1:size(spikes,1)
        if nargin == 2
            firings = [firings; col(time(spikes(j,:) > 0)) j*ones(sum(spikes(j,:)>0),1)];
        else
            firings = [firings; col(find(spikes(j,:) > 0)) j*ones(sum(spikes(j,:)>0),1)];
        end
    end
