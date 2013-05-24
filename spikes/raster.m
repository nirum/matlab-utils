% Plot spike raster
% Niru Maheswaranathan
% Fri May 24 15:00:36 2013

function h = raster(firings)

    h = plot(firings(:,1),firings(:,2),'k.');
    xlabel('Time (s)'); ylabel('Trial');
