function [ A ] = pop_dyn1( n, b )
%Population dynamics, project 3.1
T = 20;
A = zeros(T,n);
a_old = n;
for t = 1:T
    for s = 1:a_old
        r = round(rand*(n-1))+1;
        A(t,r) = A(t,r) + 1;
    end
    for i = 1:n
        if A(t,i) == 2
            A(t,i) = b;
        else
            A(t,i) = 0;
        end
    end
    a_old = sum(A(t, :));
end
end

