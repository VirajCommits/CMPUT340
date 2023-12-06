function [smallestEigenvalue, smallestEigenvector] = inverseIteration(A, maxIterations, tolerance)
    % Check if number of input arguments is less than 3
    if nargin < 3
        tolerance = 1e-6;
    end

    % Define the size of the matrix
    [n, ~] = size(A);

    % Initialize a random initial eigenvector
    v = rand(n, 1);
    disp("Value of v: ")
    disp(v)

    % Initialize eigenvalue estimate
    eigenvalueEstimate = 0;

    % Perform inverse power iteration
    for iter = 1:maxIterations
        % Solve the linear system (A - sigma*I)x = v for x
        % Use backslash operator to efficiently solve the system
        x = (A - eigenvalueEstimate * eye(n)) \ v;

        % Normalize the vector
        x = x / norm(x);

        % Estimate the eigenvalue using Rayleigh quotient
        eigenvalueEstimate = x' * A * x / (x' * x);

        % Check for convergence
        if norm(A * x - eigenvalueEstimate * x) < tolerance
            break;
        end

        % Update the eigenvector
        v = x;
    end

    % Return the smallest eigenvalue and its corresponding eigenvector
    smallestEigenvalue = eigenvalueEstimate;
    smallestEigenvector = x;
end
