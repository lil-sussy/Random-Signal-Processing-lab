function [a,v,coeff] = YuleWalkerSolver(Cx,K)
    if nargin < 2
        K = length(Cx)-1;
    end
    %Fist we need to create the variables
    %here is created vk
    Vk = Cx(2:K+1)';

    %here is created the matrix
    Tx = toeplitz(Cx(1,1:K));

    %aplying formulas
    a = Tx\Vk;
    v = Cx(1) - ctranspose(Vk)*a;
    coeff = v./Cx(1);

end
