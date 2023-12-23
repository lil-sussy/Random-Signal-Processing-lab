function pitch = PitchDetector(Cx,Fe,Fmin,Fmax)
    if nargin < 2
        Fe = 10000;
    end
    if nargin < 3
        Fmin = 100;
    end
    if nargin < 4
        Fmax = 400;
    end
    
    if isVoiced(Cx)
        Min_prominence = (max(Cx) - min(Cx))/2;
        [~, peak_index] = findpeaks(Cx(2:end), "MinPeakProminence",Min_prominence);
        est_F = Fe ./ ((peak_index(1)));
        if (Fmin < est_F) && (est_F < Fmax)
            pitch = est_F / Fe;
        else
            pitch = -1;
        end
    else
        pitch = -1;
    end
end