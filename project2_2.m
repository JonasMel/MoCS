%Project 2.2
% Jonas Melander
close all
size = 10;
ps = 0;
xPos = round(size/2);%round(rand*size-1)+1;
yPos = round(size/2);%round(rand*size-1)+1;
steps = 1100;
output = CA_2D_ELE_OLD(xPos, yPos, size, ps, steps);