function M = CA_2D_ELE(xPos, yPos, size, ps, steps)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
direction = 0;
fprintf('Direction = %d\n', direction);
M = ones(size, size);
for t = 0:1:steps
    
    fprintf('Direction = %d\n', direction);
    M((yPos - round(ps/2)):(yPos + round(ps/2)), ...
        (xPos - round(ps/2)):(xPos + round(ps/2))) = ...
        ~(round( mean( mean( M((yPos - round(ps/2)):(yPos + round(ps/2)), ...
        (xPos - round(ps/2)):(xPos + round(ps/2))) ) ) ) & 1);
    if M(xPos, yPos) == 0
        direction = direction + 1;
        if direction > 4
            direction = 1;
        end
    else
        direction = direction - 1;
        if direction < 1
            direction = 4;
        end
    end
    
    if direction == 2
        if yPos + round(ps/2) >= size - 1
            if ps == 0
                yPos = 1;
            else
                yPos = round(ps/2);
            end
        else
            if ps == 0
                yPos = yPos + 1;
            else
                yPos = yPos + round(ps/2);
            end
        end
        fprintf('direction 2, yPos = %d\n', yPos);
    elseif direction == 1
        if xPos + round(ps/2) >= size -1
            if ps == 0
                xPos = 1;
            else
                xPos = round(ps/2);
            end
        else
            if ps == 0
                xPos = xPos + 1;
            else
                xPos = xPos + round(ps/2);
            end
        end
    elseif direction == 4
        if yPos - round(ps/2) < 1
            if ps == 0
                yPos = size - 1;
            else
                yPos = size - round(ps/2);
            end
        else
            if ps == 0
                yPos = yPos - 1;
            else
                yPos = yPos - round(ps/2);
            end
        end
    elseif direction == 3
        if xPos - round(ps/2) < 1
            if ps == 0
                xPos = size - 1;
            else
                xPos = size - round(ps/2);
            end
        else
            if ps == 0
                xPos = xPos - 1;
            else
                xPos = xPos - round(ps/2);
            end
        end
    end
    figure(1)
    imagesc(M);
    colormap gray
    hold on
    pause(0.1)
    
end
end

