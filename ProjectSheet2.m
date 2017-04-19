%Main scripts project sheet 2
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