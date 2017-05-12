%Main scripts project sheet 2
%%
%2.1 SPP model
%close all, clear all
p = 0.6;
q = 0.0;
N = 100;
eta = 0.1;
L = 20;
R = 2;
delta = 0.5;
T = 1000;

P0 = zeros(3,N);
for i = 1:N
    P0(1,i) = round(rand*L) + 1;
    P0(2,i) = round(rand*L) + 1;
    P0(3,i) = round(rand*2*pi);
end

[x,y,~,~] = sppm(p,q,N,P0,eta,L,R,T,delta);

figure(1)
for i = 1:T
    plot(x(i,:), y(i,:), '*r')
    xlim([0 20]);
    ylim([0 20]);
    pause(0.025)
end

%%
%2.2 SPP model
close all, clear all
p = 0.1;
q = 0.6;
N = 50;
eta = 0.1;
L = 20;
R = 2;
delta = 0.5;
T = 100;
ntimes = 100;
P0 = zeros(3,N);
for i = 1:N
    P0(1,i) = round(rand*L) + 1;
    P0(2,i) = round(rand*L) + 1;
    P0(3,i) = round(rand*2*pi);
end
qq = (0:0.001:0.9);
psi_t = zeros(T,1);
avg_psi = zeros(1,length(qq));
% for j = 1:length(qq)
%     [~,~,theta, ~] = sppm(p,qq(j),N,P0,eta,L,R,T,delta);
%     for tt = 1:T
%         psi(tt) = (1/N)*((sum(cos(theta(tt,:))))^2 + (sum(sin(theta(tt,:))))^2);
%     end
%     avg_psi(j) = mean(psi);
% end
psi = zeros(ntimes,N);
theta_avg = zeros(1,length(qq));
for j = 1:length(qq)
    for k = 1:ntimes
        [~,~,theta, ~] = sppm(p,qq(j),N,P0,eta,L,R,T,delta);
        psi(j,k) = (1/N)*sqrt(((sum(cos(theta(end,:))))^2 + (sum(sin(theta(end,:))))^2));
    end
    theta_avg(j) = sum(psi(j,:))/ntimes;
end
figure(2)
% image(psi);
% colormap hot; colorbar;
plot(qq, theta_avg, '.')

%%
%2.3 SPP model
close all, clear all
p = 0.01:0.01:0.99;
q = 0.01:0.01:0.99;
N = 100;
eta = 0.1;
L = 20;
R = 2;
delta = 0.5;
T = 1000;
t = 1:length(p);
P0 = zeros(3,N);
aggro = zeros(100,1);
avg_aggro = zeros(length(p),length(q));
for i = 1:N
    P0(1,i) = round(rand*L) + 1;
    P0(2,i) = round(rand*L) + 1;
    P0(3,i) = round(rand*2*pi);
end
 h = waitbar(0/length(p), 'Progress');
for i = 1:length(p)
   waitbar(i/length(p), h, ['Progress: ' num2str((i/length(p))*100) '%']);
    for k = 1:length(q)
        %for j = 1:1
            [~,~, ~, a ] = sppm(p(i),q(k),N,P0,eta,L,R,T,delta);
            
        %end
        avg_aggro(i,k) = mean(a);
        % disp((i+k)/(length(p)*length(q)));
    end
   
end


figure;
plot(avg_aggro,'.r');

