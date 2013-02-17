%% function h = ebplot(x, y, e, figidx)
%  Plots power spectrum (PS) of signal, fits line to PS on loglog plot
%  usage: x is the input signal, fmax is the maximum frequency to use [0 fmax], fs is the sampling frequency
%  returns: slope and intercept of linear fit (slope is the exponent of the power fit)
%  author: Niru Maheswaranathan (nirum@stanford.edu)

function hE = ebplot(x, y, e, figidx, colors)

    if nargin < 4
        figidx = gcf;
    end

    if nargin < 5
        colors = [1.0 1.0 1.0; ...
                  0.3 0.5 1.0; ...
                  0.8 0.8 0.8];
    end

    barsize = 0.01;
    hE = errorbar(x, y, e, 'Color', colors(2,:));
    set(hE, ...
        'LineWidth'       , 1           , ...
        'Marker'          , 'o'         , ...
        'MarkerSize'      , 6           , ...
        'MarkerEdgeColor' , colors(1,:)  , ...
        'MarkerFaceColor' , colors(2,:) );
    hE_c = get(hE, 'Children');
    errorbarXData = get(hE_c(2), 'XData');
    errorbarXData(4:9:end) = ...
    errorbarXData(1:9:end) - barsize;
    errorbarXData(7:9:end) = ....
    errorbarXData(1:9:end) - barsize;
    errorbarXData(5:9:end) = ...
    errorbarXData(1:9:end) + barsize;
    errorbarXData(8:9:end) = ...
    errorbarXData(1:9:end) + barsize;
    set(hE_c(2), 'XData', errorbarXData, 'Color', colors(2,:));

    hTitle  = title ('Title');
    hXLabel = xlabel('x');
    hYLabel = ylabel('y');

    set(gca,'TickDir','out','Box','off');
    axis([x(1)-1 x(end)+1 min(y-1.1*e) max(y+1.1*e)]);

    set( gca                       , ...
        'FontName'   , 'Helvetica' );
    set([hTitle, hXLabel, hYLabel], ...
        'FontName'   , 'AvantGarde');
    set([hXLabel, hYLabel]  , ...
        'FontSize'   , 14          );
    set( hTitle                    , ...
        'FontSize'   , 18          , ...
        'FontWeight' , 'bold'      );

    set(gca, ...
    'Box'         , 'off'     , ...
    'TickDir'     , 'out'     , ...
    'TickLength'  , [.02 .02] , ...
    'XMinorTick'  , 'on'      , ...
    'YMinorTick'  , 'on'      , ...
    'YGrid'       , 'on'      , ...
    'XGrid'       , 'on'      , ...
    'XColor'      , colors(3,:), ...
    'YColor'      , colors(3,:), ...
    'LineWidth'   , 1         );
