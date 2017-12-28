function w = logistic_regression(data,t,eps,Nmax)
% IRLS algorithm
N_train = size(data,1);
%initialisation
w = zeros(size(data,2),1);  
nu = 1/2*ones(N_train,1);
R = diag(nu.*(1-nu));
w_old=w;
Hl=data'*R*data;
grad=data'*(t-nu);
w=w_old+(Hl)\grad;
N=1;
% loop  Newton-Raphson algorithm
while  norm(w-w_old)/norm(w)>eps && N<Nmax
    nu = 1./(1+exp(-data*w));
    R = diag(nu.*(1-nu));
    w_old=w;
    Hl=data'*R*data;
    grad=data'*(t-nu);
    w=w_old+(Hl)\grad;
    N=N+1;
end
