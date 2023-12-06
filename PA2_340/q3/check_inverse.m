% Define your example matrix A
A = [-1,3,-1;3,5,-1;-1,-1,2]; % Replace this with your actual matrix

% Parameters
maxIterations = 1000;  % Maximum number of iterations
tolerance = 1e-6;     % Tolerance for convergence

% Implement the inverse iteration algorithm
[smallestEigenvalue, smallestEigenvector] = inverseIteration(A, maxIterations, tolerance);

% Use MATLAB's eig function to get eigenvalues and eigenvectors
[V, D] = eig(A);

% Display results
fprintf('Inverse Iteration Results:\n');
fprintf('Smallest Eigenvalue: %f\n', smallestEigenvalue);
fprintf('Smallest Eigenvector: \n');
disp(smallestEigenvector);

fprintf('Matlab eig Function Results:\n');
eigenvaluesMatlab = diag(D);
fprintf('Eigenvalues from eig Function: \n');
disp(eigenvaluesMatlab);
fprintf('Eigenvectors from eig Function: \n');
disp(V);

% Check the smallest eigenvalue from inverse iteration against eig results
smallestEigenvalueDifference = min(abs(smallestEigenvalue - eigenvaluesMatlab));
fprintf('Difference in Smallest Eigenvalue: %f\n', smallestEigenvalueDifference);
