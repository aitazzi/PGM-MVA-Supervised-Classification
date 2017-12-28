function [ w ] = linear_regression( trainA )
N_trainA=length(trainA);
t_trainA = trainA(:,3);
X_trainA = [ones(N_trainA,1) trainA(:,1:2)];
% Estimate the regression vector |W_hat| (estimates= |X*W_hat|)
w = (X_trainA'*X_trainA)\X_trainA'*t_trainA-0.5.*[1;0;0];
end

