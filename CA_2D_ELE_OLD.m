function M = CA_2D_ELE_OLD(xPos, yPos, size, ps, steps)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
direction = round(3*rand) +1;
%fprintf('Direction = %d\n', direction);
M = ones(size, size);
for t = 0:1:steps
    
    % fprintf('Direction = %d\n', direction);
    M_old = M(yPos, xPos);
    M(yPos, xPos) = ~(M(yPos, xPos) && 1);
    if M_old == 0
        direction = direction + 1;
        if direction > 4
            direction = 1;
        end
    elseif M_old == 1
        direction = direction - 1;
        if direction < 1
            direction = 4;
        end
    end
    
    
    %   fprintf('direction 2, yPos = %d\n', yPos);
    if direction == 1
        if xPos >= size
            xPos = 1;
        else
            xPos = xPos + 1;
        end
    elseif direction == 2
        if yPos >= size
            yPos = 1;
        else
            yPos = yPos + 1;
        end
    elseif direction == 3
        if xPos <= 1
            xPos = size - 1;
        else
            xPos = xPos - 1;
        end
    elseif direction == 4
        if yPos <= 1
            yPos = size - 1;
        else
            yPos = yPos - 1;
        end
    end
    
%         figure(1)
%         imagesc(M);
%         colormap gray
%         hold on
%         pause(0.001)
    
end
figure(1)
imagesc(M);
colormap gray
end

