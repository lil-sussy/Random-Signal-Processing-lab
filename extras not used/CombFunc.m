function [array] = CombFunc(N, Ts)
    array = zeros(1,N);
    fragment = zeros(1,Ts);
    fragment(1) = 1;
    for i = 1:((N/Ts) + (mod(N,Ts)))
        if (Ts*i > N)
            array(1+Ts*(i-1):N) = fragment(1:N-Ts*(i-1));
        else
            array(1+Ts*(i-1):Ts*i) = fragment;
        end
    end
end