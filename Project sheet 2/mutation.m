function new_chroms = mutation(chroms, avg_perf, room, pm, L)
%disp('in function')
new_chroms = zeros(size(chroms));
dims = size(chroms);
N = 1:dims(1);
N2 = 1:dims(1)-1;
chrom_A = 0;
chrom_B = 0;
for i = 1:(length(N)/2)
    %disp('in loop')
    
    %Select two chromosomes at random, based on average fitness
    %Randsample, remove first, pick second. 
    %while chrom_A == chrom_B
%         chrom_A = randsample(N, 1, 1, avg_perf);
%         buf = chroms(chrom_A, :);
%         for j = chrom_A:length(avg_perf)-1
%             chroms(j,:) = chroms(j+1,:);
%         end
%         chroms(end,:) = 0;
%         
%         chrom_B = randsample(N2, 1, 1, avg_perf(1:end-1));
%         
%         for k = chrom_A:N-1
%             chroms(k+1, :) = chroms(k,:);
%         end
%         chroms(chrom_A, :) = buf;
    %end
    
    while chrom_A == chrom_B
        chrom_A = randsample(N, 1, 1, avg_perf);
        chrom_B = randsample(N, 1, 1, avg_perf);
    end
    
    %disp(chroms)
    
    %Randomly choose cross-over point
    cross_pt = floor(rand*L) + 1;
    
    new_chroms(2*i-1, 1:cross_pt) = chroms(chrom_A, 1:cross_pt);
    new_chroms(2*i-1, cross_pt+1:end) = chroms(chrom_B, cross_pt+1:end);
    new_chroms(2*i, 1:cross_pt) = chroms(chrom_B, 1:cross_pt);
    new_chroms(2*i, cross_pt+1:end) = chroms(chrom_A, cross_pt+1:end);
    
    
end

%Mutatation?
for i = 1:N
    if rand < pm
        new_chroms(i, floor(rand*L)+1) = floor(rand*4) + 1;
    end
end
   
    