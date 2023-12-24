function [pitch,sigma2,Aopt] = BlockAnalysis(X,M,Fe)
    if nargin < 3
       Fe = 10000; 
    end
    Fmin = 100;
    Fmax = 400;
    
    %autocorrelation estimation
    corr = BiasedCrossCorr(X-mean(X));
    
    %source modeling
    pitch = PitchDetector(corr,Fe,Fmin,Fmax);
    
    %linear prediction
    [Aopt, sigma2] = YuleWalkerSolver(corr,M);
end