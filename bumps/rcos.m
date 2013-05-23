% Raised cosine function
% Niru Maheswaranathan
% Wed May 22 13:29:15 2013
% f = rcos(x, c, dc)

function f = rcos(x, c, dc)

    f = 0.5*(cos(max(-pi,min(pi,0.5*(x-c)*pi/dc)))+1);
