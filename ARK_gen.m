function [signal, a, autocorr, p] = ARK_gen(N,K,variance)
    a = randn(1,K);
    a = a ./ max(abs(roots([1 -a])));
    
    signal = filter(1, [1 -a], sqrt(variance).*randn(N));
    
    autocorr = zeros(1,N);
    p = 0:N-1;
    for i = p
       autocorr(i+1) = a(1:K-i) * a(i+1:K)';
    end
    autocorr = autocorr ./ 1 + sum(a.^2);
    
end