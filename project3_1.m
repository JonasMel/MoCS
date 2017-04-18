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
