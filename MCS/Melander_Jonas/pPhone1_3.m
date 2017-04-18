% MoCS project 1.3
% Jonas Melander

function    X = pPhone1_3(N, X_0, T, p, q)

% X - number of students with iphone.
% N - number of students.
% pX - probability of student owning an iphone.
pX = p;
X = zeros(T,1);
X(1) = round(X_0 * N);

for t = 1:T-1
    if (rand * N  < X(t))
        if (rand < q)
            if (rand < pX)
                X(t+1) = X(t);
            else
                X(t+1) = X(t) - 1;
            end
        else
            X(t+1) = X(t) - (rand < (N - X(t))/N) * (rand < (N - X(t))/N);
        end
    else 
        if (rand < q)
            if (rand < pX)
                X(t+1) = X(t) + 1;
            else
                X(t+1) = X(t);
            end
        else
            X(t+1) = X(t) + (rand < X(t)/N) * (rand <  X(t)/N);
        end
    end
end
end