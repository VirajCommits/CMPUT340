% % % % % % % % % % % % % % % % % % 
% Reference : rakshit2
% % % % % % % % % % % % % % % % % % 

function [eigenvalues, eigenvectors] = qrIteration(A, maxIterations)
    n = size(A, 1);
    I = eye(n);
    
    eigenvalues = zeros(n, 1);
    eigenvectors = I;
    
    for k = 1:maxIterations
        [Q, R] = qr(A);
        A = R * Q;
        
        % Store the eigenvectors
        eigenvectors = eigenvectors * Q;
    end
    
    eigenvalues = diag(A);
end
