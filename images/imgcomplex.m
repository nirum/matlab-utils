% Image a complex matrix
% Niru Maheswaranathan
% Tue Dec 11 15:10:34 2012

function covRGBscaled = imgcomplex(C,cbar_on,numColors)

    % make colormap
    if nargin < 3
        numColors = 1024;
    end

    if nargin < 2
        cbar_on = 1;
    end

    %colors = flipud([255 255 217; 237 248 217; 199 233 180; 127 205 187; 65 172 196; 29 145 192; 34 94 168; 37 52 148; 8 29 88]/255);
    colors = flipud([103 0 31; 178 24 43; 214 96 77; 244 165 130; 253 219 199; 209 229 240; 146 197 222; 67 147 195; 33 102 172; 5 48 97]/255);
    colorscale = zeros(numColors, 3);
    for channel = 1:3
        colorscale(:,channel) = interp1(linspace(0,1,size(colors,1)),colors(:,channel),linspace(0,1,numColors),'cubic');
    end
    cmap = colormaps(colorscale);

    stepSize = (max(angle(C(:))) - min(angle(C(:))))/numColors;

    covRGB = ind2rgb(round((angle(C) - min(angle(C(:))))/stepSize),cmap);
    covRGBscaled = zeros(size(covRGB));
    for j = 1:3
        %covRGBscaled(:,:,j) = covRGB(:,:,j).*(1+log10(abs(C))/3);
        covRGBscaled(:,:,j) = covRGB(:,:,j).*abs(C);
        %covRGBscaled(:,:,j) = covRGB(:,:,j).*sqrt(abs(C));
    end
    covRGBscaled(covRGBscaled < 0) = 0;
    covRGBscaled = covRGBscaled./max(covRGBscaled(:));

    if cbar_on
        imgsc(covRGBscaled); colormap(cmap);
        cbar_pro({'-\pi','0','\pi'});
    else
        imagesc(covRGBscaled); axis image; colormap(cmap);
    end
