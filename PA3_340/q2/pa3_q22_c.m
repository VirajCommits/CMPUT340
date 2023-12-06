% Navigating to a point situated in the opposite quadrant can present challenges,
% primarily concerning the negotiation of singularities and joint limitations. 
% Dividing the path into smaller segments or employing smooth curves such as 
% splines or Bezier curves can assist in creating a more organic and attainable 
% trajectory for the robot. Additionally, define the lengths of the links in 
% the robot's structure.


l = [0.8, 0.7]';
theta0 = [1; 1; 1];
desired_opposite = [-1, -1, -1];
n = 100;
mode = 1;

theta_opposite = invKin3D(l, theta0, desired_opposite, n, mode);

plotRobot3D(l, theta_opposite);

disp('Inverse Kinematics Result for Opposite Quadrant Target Point:');
disp(theta_opposite');

