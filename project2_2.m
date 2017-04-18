%Project 2.2
% Jonas Melander
close all
size = 300;
ps = 0;
xPos = round(rand*(size-1))+1;
yPos = round(rand*(size-1))+1;
steps = 11000;
output = CA_2D_ELE_OLD(xPos, yPos, size, ps, steps);