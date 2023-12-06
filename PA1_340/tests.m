% Test script for LU decomposition and solver
fprintf('Test 1: Example 2.13\n');
A1 = [1, 2, 2; 4, 4, 2; 4, 6, 4];
b1 = [3; 6; 10];

% Additional Test Case(Custom one)
fprintf('Test 2: Custom Test\n');
A2 = [1, 2, 3; 3, 2, 4; 1, 3, 2];
b2 = [1; 1; 3];

% Run LU decomposition and solver for each test
[x1, L1, U1] = solveLinearSystem(A1, b1);
[x2, L2, U2] = solveLinearSystem(A2, b2);

% Display results
fprintf('\nResults for Test 1 (Example 2.13):\n');
fprintf('Solution x1:\n');
disp(x1);
fprintf('L1 (Lower Triangular Matrix):\n');
disp(L1);
fprintf('U1 (Upper Triangular Matrix):\n');
disp(U1);

fprintf('\nResults for Test 2 (Custom Test):\n');
fprintf('Solution x2:\n');
disp(x2);
fprintf('L2 (Lower Triangular Matrix):\n');
disp(L2);
fprintf('U2 (Upper Triangular Matrix):\n');
disp(U2);

% Function to solve the linear system
function [x, L, U] = solveLinearSystem(A, b)
    % Perform LU decomposition
    [L, U] = myLU(A);
    
    % Solve for y using forward substitution
    y = fwdSubst(L, b);
    
    % Solve for x using backward substitution
    x = backSubst(U, y);
end
