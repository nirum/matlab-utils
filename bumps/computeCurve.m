% compute nonlinearity output from coefficients and basis vectors
% Niru Maheswaranathan
% Wed May 22 13:07:57 2013
% [x y] = computeCurve(xk, yk, sigma, limits, numpts)

function r = computeCurve(u, x, f, Phi)

    r = zeros(size(u));

    % nonlinearity
    n = f'*Phi;
    dx = mean(diff(x));

    for j = 1:length(r)
        progressbar(j,length(r));
        stopIdx = find(u(j) < x, 1);
        if isempty(stopIdx)
            stopIdx = length(x);
        end

        if (stopIdx > 1)
            startIdx = stopIdx - 1;
        else
            startIdx = stopIdx;
        end;

        r(j) = (u(j)-x(startIdx))*(n(stopIdx)-n(startIdx))/dx + n(startIdx);
    end
