%Self-propelled particle model
function P = SPPM(p, q, N, P0, eta, L, R, T, delta)
%p, q probabilities
%N - number of individuals
%P0 - Nx3 matrix (x pos, y pos, angle)
P =  zeros(N, 3);
P = P0;
interval = [-1 1];
world = ones(L,L);

for t = 1:T
    for i = 1:N
        nb = i + round(rand*R) + 1;
        prob = rand
        %Update directional angle
        if prob < (1-q-p)
            eps = round(interval(round(rand) + 1)*rand*eta);
            P(i,3) = P(i,3) + eps;
        elseif prob < p
            x = P(nb, 1) - P(i, 1);
            y = P(nb, 2) - P(i, 2);
            h = sqrt((x^2 + y^2));
            theta = round((acos(x/h))*(180/pi));
            if theta < 0
                P(i,3) = (-1)*theta;
            else
                P(i,3) = theta;
            end
        else
            P(i,3) = P(nb,3);
        end
        
        %Update x-position
        P(i,1) = round(P(i,1) + delta*cos(P(i,3)*(pi/180)));
        %Periodic b.c.
        if P(i,1) > L
            P(i,1) = P(i,1) - L;
        elseif P(i,1) <= 0
            P(i,1) = L + P(i,1);
        end
        %Update y-position
        P(i,2) = round(P(i,2) + delta*sin(P(i,3)*(pi/180)));
        %Periodic bc
        if P(i,2) > L
            P(i,2) = P(i,1) - L;
        elseif P(i,2) <= 0
            P(i,1) = L + P(i,1);
        end
    end
    
%     for i = 1:N
%         world(P(i,1),P(i,2)) = 0;
%     end
%     
%     imagesc(world)
%     colormap gray
        
end
        
