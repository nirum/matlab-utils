% center the columns (or rows) of a matrix
% Niru Maheswaranathan
% Wed 24 Apr 2013 04:57:20 PM PDT

function xc = center(x, dim)

    if nargin < 2
        dim = 1;        % center columns by default
    end

    if dim == 1
        xc = x - ones(size(x,1),1)*mean(x,1);
    else
        xc = x - mean(x,2)*ones(1,size(x,2));
    end
