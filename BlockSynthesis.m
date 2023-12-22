function Y = BlockSynthesis(pitch,sigma2,Aopt,N)
    if pitch < 0
       e = sqrt(sigma2) .* randn(1,N);
    else
       e = sigma2 .* CombFunc(N, 1./pitch);
    end
    
    Y = filter(1, [1, Aopt'], e);
end
