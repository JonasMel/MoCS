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

figure    
plot(r./p, I(:, T))

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

%%
% 3.1 Painter performance
close all, clear
%Setting up room, with walls. 2 - inaccessible, 0 - empty, paintable
room = zeros(20, 40);
room(1,:) = 2;
room(end,:) = 2;
room(:,1) = 2;
room(:,end) = 2;

%Chromosome
C = zeros(1,54);
C(1,:) = 4;

perf = OneChromPerf(room, C)

%%
%3.2 Mutation
close all, clear
%Setting up room, with walls. 2 - inaccessible, 0 - empty, paintable
room = zeros(20, 40);
room(1,:) = 2;
room(end,:) = 2;
room(:,1) = 2;
room(:,end) = 2;

N = 50;
L = 54;
chroms = zeros(N,L);
avg_perf = zeros(1, N);
tmp = 0;
pm = 0.05;

T = 200;

%Create initial chromosomes
for i = 1:N
    for j = 1:54
        chroms(i,j) = floor(rand*4) + 1;
    end
end

%Evolve
for t = 1:200
    disp(t)
    %Generate average fitness
    for i = 1:N
        for j = 1:5
            tmp = tmp + OneChromPerf(room, chroms(i,:));
        end
        avg_perf(i) = tmp/5;
        tmp = 0;
    end
    
    %Mutation    
    new_chroms = mutation(chroms, avg_perf, room, pm, L);
    chroms = new_chroms;
end

[best_perf, index] = max(avg_perf);
[perf, final_room] = OneChromPerf(room, chroms(index, :));



    










