function [ I, degree ] = NE6(p ,m, T, N)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
links = zeros(N,N);
links(2,1) = 1;
links(4,3) = 1;
links(1,2) = 1;
links(3,4) = 1;
degree = zeros(2, N);
degree(1, 1:4) = 1;
cntr = 4;
prob = zeros(N,1);
r = 0.03;

for t = 2:N-3
    sumdeg = sum(degree(1, 1:end));
    
    for i = 1: cntr
        prob(i) =  degree(1, i)/sumdeg;
    end
    
    cntr2 = 1;
    while degree(1, cntr+1) < m
        if cntr2 > cntr
            cntr2 = 1;
        end
        if links(cntr2, cntr + 1) == 0
            if rand < prob(cntr2)
                links(cntr2, cntr+1) = 1;
                links(cntr+1, cntr2) = 1;
                degree(1, cntr+1) = degree(1, cntr+1) + 1;
                degree(1, cntr2) = degree(1, cntr2) + 1;
            end
        end
        cntr2 = cntr2 +1;
    end
    
    
    
    cntr = cntr +1;
end
%Random infected individuals
for k = 1:100
    degree(2, (round(rand*N)+1)) = 1;
end


for t = 1:T
    
    %Infection process
    for i = 1:N
        n = 0;
        for j = 1:N
            if links(i,j) == 1 && degree(2,j) == 1
                n = n+1;
            end
        end
        prob = 1 - exp((-1)*p*n);
        if rand < prob
            degree(2,i) = 1;
        end
    end
    
    %Recovery
    for i = 1:N
        if degree(2,i) == 1
            if rand < r
                degree(2,i) = 0;
            end
        end
    end
    
    I(t) = sum(degree(2,:));
    
end
end

