function [links, L, avg_deg] = NE1(N, ld)
links = zeros(N,N);
L = zeros(1,N)
for i = 1:N
    for j = (i+1):N
        if rand < ld
                links(i,j) = 1;
                links(j,i) = 1;
                L(1,i) = L(1,i) + 1;
                L(1,j) = L(1,j) + 1;                
        end
    end
end
avg_deg = mean(L);
end