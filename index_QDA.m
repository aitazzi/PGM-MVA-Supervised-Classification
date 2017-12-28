function [ k ] = index_QDA(x,Sigma1,Sigma2,Mu1,Mu2,Pi1,Pi2)
% This function returns the classes predicted by QDA
N_x = length(x);
Z = zeros(N_x,2);
 for i = 1:N_x 
     y = x(i,:);
     Z(i,1) =  QDA(transpose(y),Sigma1,transpose(Mu1),Pi1);
     Z(i,2) = QDA(transpose(y),Sigma2,transpose(Mu2),Pi2);
 end
[~,k] = max(Z,[],2);
k=k-1;
end

