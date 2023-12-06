l = [1; 1]; % Example link lengths
theta = [pi/4; pi/4]; % Example joint angles
[pos, J] = evalRobot2D(l, theta);
disp('Position of the end effector:');
disp(pos');
disp('Jacobian matrix:');
disp(J);
