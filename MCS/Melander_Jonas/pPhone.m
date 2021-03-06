% MoCS project 1.1
% Jonas Melander

function   X = pPhone(N, X_0, T, p)

    % X - number of students with iphone.
    % Y - number of students with other phone brand.
    % N - number of students.
    % pX - probability of student owning an iphone.
    % pY = 1-p - probability of student owning a phone with another brand.
    pX = p;
    
    pY = 1 - pX;
    X = zeros(T,1);
    X(1) = round(X_0 * N);
    if ( (X(1) - X_0*N) ~= 0)
    
        X(1) = X(1) + 1;
        
    end
    
    
    Y = N - X;
    
    for t = 1:T-1
        
        X(t+1) = X(t);
        
         if (rand < X(t)/N);  
            X(t+1) = X(t+1) - 1;
         end
         if rand < pX
             X(t+1) = X(t+1) + 1;
         end
         
         Y(t+1) = N - X(t+1);
          
    end
        
    
    
    
%     {
%         
%         X(i) = X(i-1) -pX*X(i-1) + pX * Y(i-1) - pY * X(i-1) * Y(i-1)^2 ...
%         pY * Y(i-1) * X(i-1)^2;
%         Y(i) = N - X(i);
%     }
%     
    
end