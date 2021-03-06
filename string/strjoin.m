function str = strjoin(strCell, join)
    % str = strjoin(strCell, join)
    % creates a string by concatenating the elements of strCell, separated by the string
    % in join (default = ', ')
    %
    % e.g. strCell = {'a','b'}, join = ', ' [ default ] --> str = 'a, b'

    if nargin < 2
        join = ', ';
    end

    if isempty(strCell)
        str = '';
    else
        if isnumeric(strCell) || islogical(strCell)
            % convert numeric vectors to strings
            strCell = arrayfun(@num2str, strCell, 'UniformOutput', false);
        end

        str = cellfun(@(str) [str join], strCell, ...
            'UniformOutput', false);
        str = [str{:}]; 
        str = str(1:end-length(join));
    end
end