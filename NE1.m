function linked = NE1(N, ld)
linked = zeros(1,N);
for i = 1:N
    for j = (i+1):N
        if rand < ld
           linked(i) = linked(i) + 1;
        end
    end
end