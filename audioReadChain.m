function [Audios, Ts] = audioReadChain(filenames,audioSize,sampleRange)
    %Funcion to read an array of audio files.
    counter = 1;
    len = length(filenames);
    Audios = zeros(len,audioSize);
    Ts = zeros(1,len);
    if nargin < 3
        for filename = filenames
            [Audios(counter,:),Ts(counter)] = audioread(filename);
            counter = counter + 1;
        end
    else
        for filename = filenames
            [Audios(counter),Ts(counter)] = audioread(filename,sampleRange);
            counter = counter + 1;
        end
    end
end