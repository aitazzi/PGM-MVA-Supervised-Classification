function [ val ] = QDA( x,Sigmak,Muk,Pik )
% This is the decision function of QDA and that we shoud maximize to
% conclude the classes
val = -1/2*log2(det(Sigmak))-1/2.*transpose(x-Muk)/Sigmak*(x-Muk)+log2(Pik);

end

