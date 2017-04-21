function [x,y] = sppm(p, q, N, P0, eta, L, R, T, d)

interv = [-1 1];

x = zeros(T,N);
y = zeros(T,N);
theta = zeros(T,N);
x(1,:) = P0(1,:);
y(1,:) = P0(2,:);
theta(1,:) = P0(3,:);
for t = 1:T-1
    eps = interv(round(rand)+1)*rand*eta/2;
    for i = 1:N
        prob = rand;
        cntr = 0;
        if prob < p + q
            
            for j = 1:N
                x_d = x(t,i) - x(t,j);
                y_d = y(t,i) - y(t,j);
                diff = sqrt((x_d)^2 + (y_d)^2);
                if  diff < R && diff ~= 0
                    cntr = cntr +1;
                    p_id(cntr) = j;
                    
                end
            end
            tmp = p_id(round(rand*(cntr-1))+1);
            if  prob < p
                theta(t+1, i) =  atan2((y(t,i) - y(t,tmp)), ...
                    x(t,i) - x(t,tmp)) + eps;
            else
                theta(t+1,i) = theta(t,tmp) + eps;
            end
        else
            theta(t+1,i) = theta(t,i) + eps;
        end
        
        x(t+1,i) = x(t,i) + d*cos(theta(t+1,i));
        y(t+1,i) = y(t,i) + d*sin(theta(t+1,i));
        
        if x(t+1,i) > L
            x(t+1,i) = x(t+1,i)-L;
        elseif x(t+1,i) < 0
            x(t+1,i) =  L - abs(x(t+1,i)-x(t,i));
        end
        if y(t+1,i) > L
            y(t+1,i) = y(t+1,i)-L;
        elseif y(t+1,i) < 0
            y(t+1,i) =  L - abs(y(t+1,i)-y(t,i));
        end
    end
end



end