l = [0.8; 0.7];
theta0 = [0, 0, pi];
desired = [1.6, 0, 0];
n = 10;
mode = 1;

theta = invKin3D(l, theta0, desired, n, mode);

plotRobot3D(l, theta);

hold on;
scatter3(desired(1), desired(2), desired(3), 'filled', 'MarkerFaceColor', 'r');
text(desired(1), desired(2), desired(3), 'Desired Point', 'FontSize', 10, 'Color', 'r');
hold off;

fprintf('Target point: [%.2f, %.2f, %.2f]\n', desired);
fprintf('Resulting joint angles: [%.2f, %.2f, %.2f]\n', theta);

% - Poor initial guess: If the initial guess is far from the actual solution, the method may struggle to converge.
% - Singularities: Near singular configurations in the robot's workspace can cause the Jacobian to become singular, affecting convergence.
% - Non-linearities: Highly non-linear systems or paths might lead to convergence issues, especially when the solution is far from the initial guess.
% - Joint limits: If the desired position violates joint limits or reaches joint singularities, convergence might fail.

% Adjusting the convergence criteria, using better initial guesses, handling singularities, or breaking down the path into smaller segments might help in improving convergence in such cases.
