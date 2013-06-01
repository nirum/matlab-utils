% Make difference matrix
% Niru Maheswaranathan
% Sat Jun  1 15:36:14 2013

function D = makeDiff(dim)

    D = diag(ones(dim,1)) - diag(ones(dim-1,1),1);
    D(end,1) = -1;
