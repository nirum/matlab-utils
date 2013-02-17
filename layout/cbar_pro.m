% This function erases the original colorbar labeling and replaces it with an
% cell array. This allows one to use the LaTeX interpreter for colobar labels.
%
% DBE 03/01/04

function cbar_pro(yt_label)

if nargin==0 % DEMO
  figure; sphere; colorbar;
  yt_label={'dan','i_S','a\circ','\infty','\heartsuit'};
end

h=gcf;
%c=get(h,'children'); % Find all children
cb=findobj(h,'Tag','Colorbar'); % Find the colorbar children

for k = 1:length(cb)
    set(h,'CurrentAxes',cb(k)); % Set the current axis
    set(cb(k),'YTickLabel',[]); % Eliminate the original lettering
    xlim=get(cb(k),'XLim'); % Get the x-axis limits
    ylim=get(cb(k),'YLim'); % Get the y-axis limits
    yt_pos=linspace(ylim(1),ylim(2),(size(yt_label,2))); % Determine the text spacing...
    t = zeros(size(yt_label,2));
    for k=1:size(yt_label,2)
        t(k)=text(xlim(2)+1,yt_pos(k),yt_label{k});
        set(t(k),'FontSize',24);
    end
end
