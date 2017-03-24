% MoCS project 1.3
% Jonas Melander

function    X = pPhone(N, X_0, T, p, q)

% X - number of students with iphone.
% N - number of students.
% pX - probability of student owning an iphone.
pX = p;
X = zeros(T,1);
X(1) = round(X_0 * N);
%nX = zeros(T+1,1);
%     if ( (X(1) - X_0*N) ~= 0)
%         X(1) = X(1) + 1;
%     end
for t = 1:T-1
    
    if (rand*N < X(t));
        X(t+1) = X(t) - 1;
    else
        X(t+1) = X(t);
    end
    if X(t) ~= N
        if rand < q
            if rand < pX
                X(t+1) = X(t) + 1;
            end
        else
            X(t+1) = X(t+1) + ...
                ( rand < X(t+1)/N ) * ( rand < X(t+1)/N );
        end
    end
  %  nX(X+1) = nX(X+1) +1;   
end
end