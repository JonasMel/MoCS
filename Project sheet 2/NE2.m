function I = NE2(p, r, T, N, ld)
L = zeros(2,N);
links = zeros(N,N);
I = zeros(1,T);

%Setting up linked network
for i = 1:N
    for j = i:N
        if  i ~= j && links(i , j) == 0
            
            if rand < ld
                links(i,j) = 1;
                links(j,i) = 1;
                L(1,i) = L(1,i) + 1;
                L(1,j) = L(1,j) + 1;
            end
        end
    end
end
%Random infected individuals
for k = 1:100
    L(2, (round(rand*N)+1)) = 1;
end


for t = 1:T
    
    %Infection process
    for i = 1:N
        n = 0;
        for j = 1:N
            if links(i,j) == 1 && L(2,j) == 1
                n = n+1;
            end
        end
        prob = 1 - exp((-1)*p*n);
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