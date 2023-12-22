function bool = isVoiced(Cx)
    %find the max and min peak and have the mediu value
    peaks = findpeaks(Cx,"sortStr","ascend");
    medium_value = abs(peaks(1)-peaks(end));
    
    %craete a threshold that uses standart deviation to look how many
    %standard deviations is the value and we put a constant to control
    %the threshold to our aplication
    %[This is maybe overcomplicating, but works]
    tsh = 0.012.*(medium_value ./ std(Cx));
    bool = (sum(Cx > tsh) > 2);
%%  in case we need to plot, uncomment the section
%     figure()
%     plot(Cx)
%     hold on
%     plot(tsh*ones(1,length(Cx)))
end