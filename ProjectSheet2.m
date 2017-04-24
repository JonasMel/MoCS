%Main scripts project sheet 2
%%
%2.1 SPP model
close all, clear all
p = 0.1;
q = 0.6;
N = 50;
eta = 0.1;
L = 20;
R = 2;
delta = 0.5;
T = 1000;
theta = zeros(T,N);
P0 = zeros(3,N);
for i = 1:N;
    P0(1,i) = round(rand*L) + 1;
    P0(2,i) = round(rand*L) + 1;
    P0(3,i) = round(rand*2*pi);
end

[x,y, theta] = sppm(p,q,N,P0,eta,L,R,T,delta);

% figure(1)
% for i = 1:T
%     plot(x(i,:), y(i,:), '*r')
%     xlim([0 20]);
%     ylim([0 20]);
%     pause(0.025)
% end
qq = (0:0.001:0.9);
psi = zeros(T,length(qq));
for j = 1:length(qq)
    [~,~,theta] = sppm(p,qq(j),N,P0,eta,L,R,T,delta);
    for tt = 1:T
        psi(tt,j) = (1/N)*((sum(cos(theta(tt,:))))^2 + (sum(sin(theta(tt,:))))^2);
    end
end
figure(2)
image(psi);
colormap hot; colorbar;
