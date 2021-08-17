N=2; % no. of rows needed
M=rand(5)  % generate a 5x5 matrix random
c=randperm(length(M),N)  
M
B=M(c,:)  % output matrix