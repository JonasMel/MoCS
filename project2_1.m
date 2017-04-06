% Project 2.1
% Author Jonas Melander
close all
size = 500;
M = zeros(size,size);
%n - integer between 0 and 255
n = 30;
M(1,round(size/2)) = 1;
for i = 1:size-1
M(i+1,:) = CA_1D_ELE(M(i,:), n);
end
imagesc(~M);
colormap gray