function [ k ] = index_LDA(x,Sigma,Mu1,Mu2,Pi1,Pi2)
% This function returns the classes predicted by LDA
N_x = length(x);
Z = zeros(N_x,2);
 for i = 1:N_x
     y = x(i,:);
     Z(i,1) =  LDA(transpose(y),Sigma,transpose(Mu1),Pi1);
     Z(i,2) = LDA(transpose(y),Sigma,transpose(Mu2),Pi2);
 end
[~,k] = max(Z,[],2);
k=k-1;
end

