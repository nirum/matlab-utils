% Plots trajectories across time
% Niru Maheswaranathan
% Thu Jun 28 20:38:48 2012
% h = plotTrajectory(t, x, N, offset)

function h = plotTrajectory(t, x, N, offset)

    if nargin < 4
        offset = 0;
    end

    if nargin < 3
        N = 3;
    end

    colors = varycolor(N);
    legendstr = {};

    fig; hold on;
    for j = 1:N
        h(j) = plot(t,x(:,j+offset),'-','Color',colors(j,:));
        legendstr{j} = num2str(j+offset);
    end
    makepretty; axis tight; grid on; hold off;
    legend(legendstr,0);
