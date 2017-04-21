%Main scripts project sheet 2
%%
%2.1 SPP model
close all, clear
p = 0.9;
q = 0.0;
N = 50;
eta = 0.01;
L = 20;
R = 0.5;
delta = 0.2; 
T = 1000;

P0 = zeros(3,N);
for i = 1:N;
    P0(1,i) = round(rand*L) + 1;
    P0(2,i) = round(rand*L) + 1;
    P0(3,i) = round(rand*2*pi);
end

[x,y] = sppm(p,q,N,P0,eta,L,R,T,delta);

for i = 1:T
    plot(x(i,:), y(i,:), '^')
    pause(0.025)
end