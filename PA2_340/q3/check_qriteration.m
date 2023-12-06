% Define your example matrix A
A = [-1,3,-1;3,5,1;-1,-1,2];

% Set the maximum number of iterations
maxIterations = 100;

% Use the QR iteration method to find eigenvalues and eigenvectors
[eigenvaluesQR, eigenvectorsQR] = qrIteration(A, maxIterations);

% Use MATLAB's eig function to find eigenvalues and eigenvectors
[V, D] = eig(A);

% Display results
fprintf('QR Iteration Results:\n');
fprintf('Eigenvalues from QR Iteration: \n');
disp(eigenvaluesQR);
fprintf('Eigenvectors from QR Iteration: \n');
disp(eigenvectorsQR);

fprintf('Matlab eig Function Results:\n');
fprintf('Eigenvalues from eig Function: \n');
disp(diag(D));
fprintf('Eigenvectors from eig Function: \n');
disp(V);
