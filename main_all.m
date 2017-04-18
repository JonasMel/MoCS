%%
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
%%

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

%%

% Project 2.1
% Author Jonas Melander
close all
size = 500;
M = zeros(size,size);
%n - integer between 0 and 255
n = 110;
M(1,round(size/2)) = 1;
for i = 1:size-1
M(i+1,:) = CA_1D_ELE(M(i,:), n);
end
imagesc(~M);
colormap gray

%%

%Project 2.2
% Jonas Melander
close all
size = 300;
ps = 0;
xPos = round(rand*(size-1))+1;
yPos = round(rand*(size-1))+1;
steps = 11000;
output = CA_2D_ELE_OLD(xPos, yPos, size, ps, steps);

%%

%MCS project 3.1
% Jonas Melander
close all
n = 1000;
b = [5, 10, 20, 30, 40];

A_5 = pop_dyn1(n,b(1));
A_10 = pop_dyn1(n,b(2));
A_20 = pop_dyn1(n,b(3));
A_30 = pop_dyn1(n,b(4));
A_40 = pop_dyn1(n,b(5));

t = linspace(1,20,20);
    As_5 = zeros(1,t(end));
    As_10 = zeros(1,t(end));
    As_20 = zeros(1,t(end));
    As_30 = zeros(1,t(end));
    As_40 = zeros(1,t(end));
for i = 1:t(end)
    As_5(i) = sum(A_5(i, :));
    As_10(i) = sum(A_10(i, :));
    As_20(i) = sum(A_20(i, :));
    As_30(i) = sum(A_30(i, :));
    As_40(i) = sum(A_40(i, :));
end
figure(1)
plot(t, As_5, t, As_10, t, As_20, t, As_30, t, As_40);
% B = linspace(1,50,100000);
% A = zeros(100000, 1);
% A_init = zeros(200,n);
% for j = 1:length(B)
% 
% A_init =  pop_dyn1(n, B(j));
% A(j) = sum(A_init(end,:));
% 
% end
% figure(2)
% plot(B, A, '.');


%%

%MCS project 3.1
% Jonas Melander
close all
n = 500;
b = [5, 10, 20, 30, 40];

A_5 = pop_dyn1(n,b(1));
A_10 = pop_dyn1(n,b(2));
A_20 = pop_dyn1(n,b(3));
A_30 = pop_dyn1(n,b(4));
A_40 = pop_dyn1(n,b(5));

t = linspace(1,10,10);
As_5 = zeros(1,t(end));
As_10 = zeros(1,t(end));
As_20 = zeros(1,t(end));
As_30 = zeros(1,t(end));
As_40 = zeros(1,t(end));
for i = 1:t(end)
    As_5(i) = sum(A_5(i, :));
    As_10(i) = sum(A_10(i, :));
    As_20(i) = sum(A_20(i, :));
    As_30(i) = sum(A_30(i, :));
    As_40(i) = sum(A_40(i, :));
end
figure(1)
plot(t, As_5, t, As_10, t, As_20); %, t, As_30, t, As_40);
B = linspace(1,25,25);
A = zeros(length(B), 1);
A_init = zeros(200,n);
d = linspace(1,n,n);
Avg_A = zeros(length(b),length(d));
for j = 1:length(B)
    for i = 1 : length(d)
        for s = 1: 10
            A_init =  pop_dyn4(n, B(j), d(i));
            A(s) = sum(A_init(end,:));
            %         imagesc(A_init);
            %         str = ['b = ',  num2str(B(j)), ' d = ', num2str(d(i))];
            %         title(str)
            %         colormap hot
            %
            %         pause(0.002)
        end
        Avg_A(j,i) = median(A(:));
    end
end
figure(2)
imagesc(Avg_A);
colormap hot; colorbar

% figure(3)
% plot(B, A, '.');