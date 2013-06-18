% Gaussian PDF (unnormalized)
% Niru Maheswaranathan
% Sun Jun  9 02:47:18 2013

function p = gauss(x,mu,sigmasq)
    p = exp(-(x-mu).^2/(2*sigmasq));
end
