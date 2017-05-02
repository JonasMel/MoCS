%Main scripts project sheet 2

%%
%1.1 Undirected social network
close all, clear
N = 5000;
ld = 0.0016;

linked = NE1(N, ld);
avg = mean(linked);

hist(linked, 100)

%%
%1.2 Undirected social network, infection
close all, clear
N = 5000;
ld = 0.0016;
p = 0.01;
T = 1000;
r = 0.03; 

I = NE2(p, r, T, N, ld);

plot(1:T, I)

%%
%1.3 Undirected social network, different p
close all, clear
N = 5000;
ld = 0.0016;
T = 1000;
r = 0.03;
t = 1:T;
p = 0.001:0.001:0.01;

I = zeros(10, T);

for i = 1:10
    I(i,:) = NE2(p(i), r, T, N, ld);
end

plot(t, I(1,:), t, I(2,:), t, I(3,:), t, I(4,:), t, I(5,:), t, I(6,:), ...
    t, I(7,:), t, I(8,:), t, I(9,:), t, I(10,:))
    

%%
%2.1 SPP model
close all, clear
p = 0.3;
q = 0.3;
N = 50;
eta = 0.1;
L = 20;
R = 2;
delta = 0.5; 
T = 100;

P0 = zeros(N,3);
for i = 1:N;
    P0(i,1) = round(rand*L) + 1;
    P0(i,2) = round(rand*L) + 1;
    P0(i,3) = round(rand*360);
end

P = SPPM(p,q,N,P0,eta,L,R,T,delta);