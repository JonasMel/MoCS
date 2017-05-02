function [ degree ] = NE4( m, T)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
links = zeros(T,T);
links(2,1) = 1;
links(4,3) = 1;

degree = zeros(1,T);
degree(1:4) = 1;
cntr = 4;
prob = zeros(T,1);
for t = 1:T-4
    sumdeg = sum(degree);

        for i = 1: cntr
            prob(i) =  degree(i)/sumdeg;
        end
        %Prob = sort(prob, 'descend');
        cntr2 = 1;
        while degree(cntr+1) < m
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
end

