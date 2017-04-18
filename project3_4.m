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