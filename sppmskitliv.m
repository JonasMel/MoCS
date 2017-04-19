function [X, Y] = sppmskitliv(p, q, N, P_t, P, eta, L, R, T, d)

interv = [-1 1];
theta = P_t;
w = P;
for t = 1:T
    
    for i = 1:L
        for j = 1:L
            if w(i,j) ~= 0
                prob = rand;
                
                if prob < p + q
                    
                    for ii = 1:5
                        if ii < 3
                            k = i - ii;
                            if k < 1
                                k = L - abs(k);
                            end
                        elseif ii > 3
                            k = i + ii;
                            if k > L
                                k = k - L;
                            end
                        else
                            k = i;
                        end
                        for jj = 1:5
                            if jj < 3
                                m = j - jj;
                                if m < 1
                                    m = L - abs(m);
                                end
                            elseif jj > 3
                                m = j + jj;
                                if m > L
                                    m = m - L;
                                end
                            else
                                m = j;
                            end
                            if w(k,m) == 1
                                x(jj) = m;
                                y(ii) = k;
                            end
                            
                        end
                    end
                    index = round(rand*length(x))+1;
                    if prob < p
                        
                        if i-m < 0
                            if j - k < 0
                                theta(i,j) = 8;
                            elseif j - k > 0
                                theta(i,j) = 6;
                            else
                                theta(i,j) = 7;
                            end
                        elseif i - m > 0
                            if j - k < 0
                                theta(i,j) = 2;
                            elseif j - k > 0
                                theta(i,j) = 4;
                            else
                                theta(i,j) = 3;
                            end
                        else
                            if j - k < 0
                                theta(i,j) = 1;
                            elseif j - k > 0
                                theta(i,j) = 5;
                            end
                        end
                    else
                    end
                end
            end
        end
        
    end
    
end