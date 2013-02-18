% Plots trajectories in a phase plane
% Niru Maheswaranathan
% Thu Jun 28 20:42:38 2012
% function h = plotPhaseSpace(x, dim, offset)

function h = plotPhaseSpace(x, dim, offset)

    if nargin < 3
        offset = 0;
    end

    if nargin < 2
        dim = 3;
    end

    fig;
    if dim == 2
        plot(x(:,offset+1),x(:,offset+2),'-', x(1,offset+1), x(1,offset+2), 'k.', 'MarkerSize', 20);
        xlabel(['Component #' num2str(offset+1)]);
        ylabel(['Component #' num2str(offset+2)]);
    else
        plot3(x(:,offset+1),x(:,offset+2),x(:,offset+3),'-', x(1,offset+1), x(1,offset+2), x(1,offset+3), 'k.', 'MarkerSize', 20);
        xlabel(['Component #' num2str(offset+1)]);
        ylabel(['Component #' num2str(offset+2)]);
        zlabel(['Component #' num2str(offset+3)]);
    end
    makepretty; grid on;
