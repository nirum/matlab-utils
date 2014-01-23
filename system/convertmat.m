% Convert .mat file to v7.2
% Niru Maheswaranathan
% 01:00 PM Nov 29, 2013
% convertmat(filename)

function convertmat(filename)

    if ~isempty(strfind(filename, '.mat'))
        fname = filename(1:end-4);
    else
        fname = filename;
    end
    filename = [fname '.mat'];

    % load data
    clearvars -except filename fname;
    load(filename);
    clear filename

    % save using previous format
    save([fname '-v7.mat'], '-v7');
