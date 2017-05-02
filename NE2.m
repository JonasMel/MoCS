function I = NE2(p, r, T, N, ld)
L = zeros(2,N);
I = zeros(1,T);

%Setting up linked network
for i = 1:N
    for j = (i+1):N
        if rand < ld
            L(1,i) = L(1,i) + 1;
        end
    end
end

%Random infected individuals
for k = 1:100
    L(2, round(rand*N)) = 1;     
end


for t = 1:T
    
    %Infection process
    for i = 1:N
        prob = 1 - exp((-1)*p*L(1,i));
        if rand < prob
            L(2,i) = 1;
        end
    end
    
    %Recovery
    for i = 1:N
        if L(2,i) == 1
            if rand < r
                L(2,i) = 0;
            end
        end
    end
    
    I(t) = sum(L(2,:));

end