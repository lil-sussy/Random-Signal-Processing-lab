function [PSD, nu] = psdEstimator(X, Nfft, method, varargin)
    if nargin < 2
       Nfft = 2 .* length(X); 
    end
    %Using Corellogram method
    if (nargin < 3 || method == "correlogram")
        r = BiasedCrossCorr(X);
        
        fft_r = fft(r, Nfft);
        
        PSD = fft_r(1:Nfft/2);
        
        nu = (0:Nfft/2-1) / Nfft;

        PSD = abs(PSD) / length(X);  % Normalize and take the magnitude
    else if (method == "periodogram")
        %Using pediodograms
        fft_X = fft(X, Nfft);
        
        PSD = abs(fft_X).^2 / length(X);
        
        PSD = PSD(1:Nfft/2);
        
        nu = (0:Nfft/2-1) / Nfft;
    end
end