function [ val ] = LDA( x,Sigma,Muk,Pik )
% This is the decision function of LDA and that we shoud maximize to
% conclude the classes
val = log2(Pik)+transpose(x)*inv(Sigma)*Muk-1/2.*transpose(Muk)/Sigma*Muk;
end

