%% imagesc + axis image + colorbar
function h = imgsc(img, scale)

    if nargin < 2
        h = imagesc(img);
    else
        h = imagesc(img, scale);
    end

    axis image;
    colorbar;
    set(gca,'XTick',[],'YTick',[]);
    cmap = cbrewer('div', 'RdBu', 255);
    colormap(cmap);
