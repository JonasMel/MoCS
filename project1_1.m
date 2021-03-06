% MoCS Project 1.1
% Jonas Melander
clear all, close all;
N = 15;
p = 0.5 ;
X_0 = rand;
T = 1000;
A = 1000;
M = zeros(A,T);
eq_dist = zeros(N,1);
for i = 1 : A
    M(i,:) = pPhone(N, rand, T, p);
    eq_dist(M(i,end)) = eq_dist(M(i,end)) + 1;
end
n = linspace(0,N,N);
histo =(M(:, :)./N)*100;
figure(1)
plot(n, eq_dist./A)

figure(2)
hist(histo(:, end), 100);