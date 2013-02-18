% plot multiple trajectories in phase space
% Niru Maheswaranathan
% Tue Jul  3 11:10:15 2012
% h = plotMultiPhaseSpace(dim, offset, varargin)

function h = plotMultiPhaseSpace(dim, offset, varargin)

    if isempty(offset)
        offset = 0;
    end

    if isempty(dim)
        dim = 3;
    end

    N  = length(varargin);
    colors = [224 104 104; 89 174 225; 114 212 146]/225;

    fig; hold on;
    for j = 1:N
        x = varargin{j};
        if dim == 2
            plot(x(:,offset+1),x(:,offset+2),'--', x(1,offset+1), x(1,offset+2), '.', 'MarkerSize', 20, 'Color', colors(j,:));
        else
            plot3(x(:,offset+1),x(:,offset+2),x(:,offset+3),'--', x(1,offset+1), x(1,offset+2), x(1,offset+3), '.', 'MarkerSize', 20, 'Color', colors(j,:));
        end
    end
    xlabel(['Component #' num2str(offset+1)]);
    ylabel(['Component #' num2str(offset+2)]);
    zlabel(['Component #' num2str(offset+3)]);
    hold off; makepretty; grid on;
