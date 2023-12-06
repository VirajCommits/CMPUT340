function [L, U] = myLU(A)

L = eye(size(A));
U = A;

for k = 1:size(A)-1
    [M_k, L_k] = elimMat(U,k);
    U = M_k * U;
    L = L* L_k;
end
end
function [M_k,L_k] = elimMat(A,k)

% Intialise M_k as an Identity matrix with the same size as A
M_k = eye(size(A));

% Now we can update the kth column of M_k matrix by the formula M_k[i] = A[i]/A[k] for M_k[k+1:n,k]
M_k(:,k) = [zeros(k-1,1); M_k(k,k); -A(k+1:end, k) ./ A(k,k)];

% Similarly, for L_k we just need to remove the minus(-) sign from the
% formula
L_k = eye(size(A));
L_k(:,k) = [zeros(k-1,1); M_k(k,k); A(k+1:end, k) ./ A(k,k)];

end
