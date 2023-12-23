function [Transform, frequencies] = fft_oneside(signal,Fs,n)
    if nargin < 2
       Fs = 1; 
    end
    if nargin < 3
       n = []; 
    end
    L=min(length(signal),2.*n - 2);
    frequencies= Fs*(0:(L/2))/L;
    P2 = abs(fft(signal,n)/L);
    Transform = P2(1:L/2+1);
    Transform(2:end-1) = 2*Transform(2:end-1);
end