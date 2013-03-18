function [hPts hLine] = errorline(x,y,e)
% like errorbar, except plots vertical lines that look nice

    marker = '.';
    lineWidth = 2;
    color = 'k';
    axh = [];

    x = col(x);
    y = col(y);
    e = col(e);

    if isempty(axh)
        axh = gca;
    end

    hPts = plot(x,y, marker, 'Parent', axh, 'Color', color, ...
        'MarkerFaceColor', color, 'MarkerEdgeColor', color);

    origHold = ishold(axh);
    hold(axh, 'on');

    hLine = plot([x'; x'], [y'-e'; y'+e'], 'Parent', axh, ...
        'Color', color, 'LineWidth', lineWidth);

    if ~origHold
        hold(axh, 'off');
    end
end
