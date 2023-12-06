function [dominantEigenvalue, dominantEigenvector] = normalizedPowerIteration(A, maxIterations, tolerance)
    % Generate random initial guess for the eigenvector
    n = size(A, 1);
    v = rand(n, 1);
    disp("v before normalising: ")
    disp(v)
    v = v / norm(v);  % Normalize initial guess
    disp(norm(v))
    disp("v after normalising: ")
    disp(v)

    for iteration = 1:maxIterations
        % generate next vector
        Av = A * v;

        % normalize eigenvector
        v = Av / norm(Av);

        % find eigenvalue
        eigenvalue = v' * A * v;
        % Check for convergence
        if norm(Av - eigenvalue * v) < tolerance
            break;
        end
    end

    % Return the dominant eigenvalue and eigenvector
    dominantEigenvalue = eigenvalue;
    dominantEigenvector = v;
end
