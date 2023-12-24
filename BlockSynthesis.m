function Y = BlockSynthesis(pitch,sigma2,Aopt,N)
    %Generate the exitation signal
    if pitch == -1
        e = sqrt(sigma2) .* randn(1,N);
    else
        %arbitrary amplitude, for the signal to be seen in a better way
        e = sin(2.*pi.*pitch.* (1:N) + sqrt(sigma2).* 2.*pi .* rand(1,N));
    end
    
    %Filter the exitation
    Y = filter([1 -Aopt'],1,e);
end