% MoCS Project 1.1
% Jonas Melander
N = 50;
p = 0.7;
X_0 = rand;
T = 1000;
A = 1000;
M = zeros(A,T);
for i = 1 : A
    M(i,:) = pPhone(N, rand, T, p);
end
eq_distr = zeros(A,T);
eq_distr =(M(:, :)./N)*100;
hist(eq_distr(:, end), 100);