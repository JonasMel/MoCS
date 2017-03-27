% MoCS Project 1.3
% Jonas Melander
N = 1000;
p = 0.5;
X_0 = rand;
T = 1000;
A = 2000;
M = zeros(A,T);
q = [0:0.01:1];
y = [0:100];
dist = zeros(N+1,length(q));
for j = 1 : length(q)
    for i = 1 : A
        M(i,:) = pPhone1_3(N, rand, T, p, q(j));
        dist(M(i,end)+1, j) = dist(M(i,end)+1, j) + 1;
    end
    
end
eq_distr = zeros(A,T);
eq_distr =(M(:, :)./N)*100;
t = [1:T];
figure
plot(t, eq_distr(end, :));
figure
hist(dist, 100);
figure
clims = [min(min(dist)) max(max(dist))];
imagesc( dist, clims);
colorbar;
colormap hot;