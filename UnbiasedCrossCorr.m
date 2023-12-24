function [Cx, p] = UnbiasedCrossCorr(X, pmax)
    len = length(X);
    if nargin < 2
        pmax = len - 1;
    end

    Cx = zeros(1, pmax + 1);
    p = 0:pmax;

    for pvar = p
        var1 = X(pvar + 1: len);
        var2 = conj(X(1:len-pvar));
        Cx(pvar + 1) = (1/(len-pvar)) .* sum(var1 .* var2);
    end
end