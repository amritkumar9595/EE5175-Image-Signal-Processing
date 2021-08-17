function [Vs,Ds]= eigensorted(A)

[V,D] = eig(A);

[d,ind] = sort(diag(D),'descend');
d
ind
Ds = D(ind,ind);
Vs = V(:,ind);

end