% MoCS Project 1.3, 1.4
% Jonas Melander
N = 1000;
p = 0.5;
X_0 = rand;
T = 1000;
A = 10000;
M = zeros(A,T);
q = [0:0.01:1];
y = [0:100];
dist = zeros(N+1,length(q));
for j = 1 : length(q)
    for i = 1 : A
        
        M(i,:) = pPhone1_3(N, rand, T, p, q(j));
        dist(M(i,end)+1, j) = dist(M(i,end)+1, j) + 1;
       %  q_dep(j) = q_dep(j) + sum(abs(M(i,:) - M(1,:)));
    end
   
end
eq_distr = zeros(A,T);
eq_distr =(M(:, :)./N)*100;
t = [1:T];
% figure
% plot(t, eq_distr(end, :));
% figure
% histogram(M(end, :));%hist(dist(end, end), 100);
figure
clims = [min(min(dist)) max(max(dist))];
imagesc( dist, clims);
colorbar;
colormap hot;
% 
% figure
% plot(q, q_dep./A)