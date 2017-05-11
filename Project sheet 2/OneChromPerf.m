function [perf,room] = OneChromPerf(room, C)
%Function that computes the performance of the input chromosome. 
room_size = size(room);
total_grid = room_size(1)*room_size(2)-2*room_size(1)-2*room_size(2);
place = zeros(1,2);

%Initial placement
place = [floor(rand*room_size(1))+1, floor(rand*room_size(2))+1];
%disp(room(place(1), place(2)))

while room(place(1), place(2)) == 2
    place = [floor(rand*room_size(1))+1, floor(rand*room_size(2))+1];
end
prev_place = place;

%Random initial direction
dir = floor(rand*4)+1;      %1 = pos x, 2 = neg y, 3 = neg x, 4 = pos y
state_dec = 0;

for i = 1:total_grid-1
    
    %Making sure the painter is within the walls
%     if place(2) < 2
%         place(2) = 2;
%     elseif place(2) > 39
%         place(2) = 39;
%     end
%     
%     if place(1) < 2
%         place(1) = 2;
%     elseif place(1) > 19
%         place(1) = 19;
%     end
%     
    %If straight forward is positive x-direction
    if dir == 1
        %disp('in dir 1')
        m = num2str(room(place(1), place(2)));
        f = num2str(room(place(1), place(2)+1)); %Straight forward
        l = num2str(room(place(1)-1, place(2))); %left
        r = num2str(room(place(1)+1, place(2))); %right
        
        tmp = [m f l r];
        
        state_dec = base2dec(tmp, 3);
        
        response = C(state_dec+1);
        
        if response == 1
            dir = dir;
            place(1) = place(1);
            place(2) = place(2) + 1;            
        elseif response == 2
            dir = 4;
            place(1) = place(1)-1;
            place(2) = place(2);            
        elseif response == 3
            dir = 2;
            place(1) = place(1) + 1;
            place(2) = place(2);            
        elseif response == 4
            if rand < 0.5
                dir = 4;
                place(1) = place(1)-1;
                place(2) = place(2); 
            else
                dir = 2;
                place(1) = place(1) + 1;
                place(2) = place(2);
            end
        end
    %If straight forward is negative y-direction    
    elseif dir == 2
        %disp('in dir 2')
        m = num2str(room(place(1), place(2)));
        f = num2str(room(place(1)-1, place(2))); %straight forward
        l = num2str(room(place(1), place(2)-1)); %left
        r = num2str(room(place(1), place(2)+1)); %right
        
        tmp = [m f l r];
        state_dec = base2dec(tmp, 3);
        
        response = C(state_dec+1);
        
        if response == 1
            dir = dir;
            place(1) = place(1) + 1;
            place(2) = place(2);
        elseif response == 2
            dir = 1;
            place(1) = place(1);
            place(2) = place(2) + 1;
        elseif response == 3
            dir = 3;
            place(1) = place(1);
            place(2) = place(2) - 1;
        elseif response == 4
            if rand < 0.5
                dir = 1;
                place(1) = place(1);
                place(2) = place(2) + 1;
            else
                dir = 3;
                place(1) = place(1);
                place(2) = place(2) - 1;
            end
        end
        
        %If straight forward is negative x-direction
    elseif dir == 3
        %disp('in dir 3')
        m = num2str(room(place(1), place(2)));
        f = num2str(room(place(1), place(2)-1)); %straight forward
        l = num2str(room(place(1)+1, place(2))); %left
        r = num2str(room(place(1)-1, place(2))); %right
        
        tmp = [m f l r];
        state_dec = base2dec(tmp, 3);
        
        response = C(state_dec+1);
        
        if response == 1
            dir = dir;
            place(1) = place(1);
            place(2) = place(2) + 1;
        elseif response == 2
            dir = 2;
            place(1) = place(1) + 1;
            place(2) = place(2);
        elseif response == 3
            dir = 4;
            place(1) = place(1) - 1;
            place(2) = place(2);
        elseif response == 4
            if rand < 0.5
                dir = 2;
                place(1) = place(1) + 1;
                place(2) = place(2);
            else
                dir = 4;
                place(1) = place(1) - 1;
                place(2) = place(2);
            end
        end
        
        %If straight forward is positive y-direction
    elseif dir == 4
        %disp('in dir 4')
        m = num2str(room(place(1), place(2)));
        f = num2str(room(place(1)+1, place(2))); %straight forward
        l = num2str(room(place(1), place(2)-1)); %left
        r = num2str(room(place(1), place(2)+1)); %right
        
        tmp = [m f l r];
        state_dec = base2dec(tmp, 3);
        
        response = C(state_dec+1);
        
        if response == 1
            dir = dir;
            place(1) = place(1) + 1;
            place(2) = place(2);
        elseif response == 2
            dir = 3;
            place(1) = place(1);
            place(2) = place(2) - 1;
        elseif response == 3
            dir = 1;
            place(1) = place(1);
            place(2) = place(2) + 1;
        elseif response == 4
            if rand < 0.5
                dir = 3;
                place(1) = place(1);
                place(2) = place(2) - 1;
            else
                dir = 1;
                place(1) = place(1);
                place(2) = place(2) + 1;
            end
        end
    end
    
    %If it's new position is inacccessible - don't move. 
    if room(place(1),place(2)) == 2
        place = prev_place;
    end
    
    %Paint the grid the painter has been standing on
    room(prev_place(1), prev_place(2)) = 1;
    %Move the painter to it's new position
    prev_place = place;
end


perf = sum(sum(room(2:19, 2:39)))/total_grid;

imagesc(room)
        
    
