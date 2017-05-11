function [ degree, avg_deg ] = NE4( m, T)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
links = zeros(T,T);
links(2,1) = 1;
links(4,3) = 1;
links(1,2) = 1;
links(3,4) = 1;

degree = zeros(1,T);
degree(1:4) = 1;
cntr = 1
prob = zeros(T,1);
id = zeros(1,m);

for t = 5:T
    sumdeg = sum(degree);
    prob(1:t-1) = degree(1:t-1)/sumdeg;
    id = randsample(1:t-1, m, 1, prob(1:t-1));
    links(t,id) = 1;
    links(id,t) = 1;
    degree(id) = degree(id) +1;
    degree(t) = 4;
    
end
avg_deg = mean(degree);
