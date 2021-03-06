function [ A ] = pop_dyn4( n, b, d )
%Population dynamics, project 3.1
T = 15;
A = zeros(T,n);
a_old = n;
tmp = [-1 1];
for t = 1:T
    if t == 1
        for s = 1:a_old
            r = round(rand*(n-1))+1;
            A(t,r) = A(t,r) + 1;
        end
    end
    if t > 1
        for i = 1:n
          if A(t-1,i) == b
             for j = 1:b
                r = round(tmp(round(rand) +1)*rand)*d +i;
                if r > n
                    r = r - n;
                elseif r < 1
                    r = n + r;
                end
                A(t, r) =  A(t, r) + 1;
             end
          end
        end
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


