% Define your example matrix A
A = [-1,3,-1;3,5,-1;-1,-1,2]; % Replace this with your actual matrix

% Parameters
maxIterations = 100000;  % Maximum number of iterations
tolerance = 1e-6;     % Tolerance for convergence

% Implement the normalized power iteration algorithm
[dominantEigenvalue, dominantEigenvector] = normalizedPowerIteration(A, maxIterations, tolerance);

% Use MATLAB's eig function to get eigenvalues and eigenvectors
[V, D] = eig(A);

% Calculate the Rayleigh quotient for the dominant eigenvector
rayleighQuotient = (dominantEigenvector' * A * dominantEigenvector) / (dominantEigenvector' * dominantEigenvector);

% Display results
fprintf('Normalized Power Iteration Results:\n');
fprintf('Estimated Dominant Eigenvalue: %f\n', dominantEigenvalue);
fprintf('Estimated Dominant Eigenvector: \n');
disp(dominantEigenvector);
fprintf('Rayleigh Quotient: %f\n', rayleighQuotient);

fprintf('Matlab eig Function Results:\n');
eigenvaluesMatlab = diag(D);
fprintf('Eigenvalues from eig Function: \n');
disp(eigenvaluesMatlab);
fprintf('Eigenvectors from eig Function: \n');
disp(V);

% Compare the dominant eigenvalue with the Rayleigh quotient
eigenvalueDifference = abs(dominantEigenvalue - rayleighQuotient);
fprintf('Difference in Dominant Eigenvalue: %f\n', eigenvalueDifference);
