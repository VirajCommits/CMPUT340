l = [1; 1];
theta0 = [pi/2; pi/2];
pos = [0.7071;1.7071];
n = 10;
mode = 0;
theta = invKin2D(l, theta0, pos, n, mode);
disp(theta)