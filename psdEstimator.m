function [PSD,nu] = psdEstimator(X,Nfft,varargin)
    %Using pediodograms
    if nargin < 2
       Nfft = 2.*length(X); 
    end
    if ~isempty(varargin)
        K = cell2mat(varargin(1));
        N = length(X);

        if mod(N,K) == 0
           sizes = (N/K) .* ones(1,K);
        else
           sizes = floor(N/K) .* ones(1,K);
           for i=1:mod(N,K)
              sizes(i) = sizes(i) + 1; 
           end
        end
        
        %then do the estimation
        PSD = zeros(K, sizes(2) + 1);
        positions = cumsum([0 sizes]);
        for i = 1:K
            imin = positions(i) + 1;
            imax = positions(i+1);
            
            
            segment = X(imin:imax);
            trans = abs(fft(segment,ceil(Nfft./K)));
            trans = trans( ( (0:length(trans) - 1) ./ length(trans) ) <= 0.5 );
            
            
            for j = 1:length(trans)
                PSD(i,j) = (1./length(segment)) .* trans(j).^2;
            end
            
            
        end

        %and then we do the mean and we put the nu values
        nu = linspace(0,0.5,length(PSD(1,:)));
        
        PSD = sum(PSD)./K;
    else
        trans = abs(fft(X,Nfft));
        trans = trans(((0:length(trans)-1)/length(trans)) <= 0.5);
        nu = linspace(0,0.5,length(trans));
        PSD = (1/length(nu)) .* trans.^2;
    end
end