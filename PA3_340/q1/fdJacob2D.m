function J = fdJacob2D(l, theta, h)

    first_column = (evalRobot2D(l, theta+[h;0]) - evalRobot2D(l, theta-[h;0]) ) / (2*h);
    second_column = ( evalRobot2D(l, theta+[0;h]) - evalRobot2D(l, theta-[0;h]) ) / (2*h);

    J = [first_column(1),second_column(1);first_column(2),second_column(2)];
    
% 2a)
% Are the results close enough to be useful?
% For small values h ,the values seem to be be close enough .But for higher
% values , it tends to deviate

% 2b)
% The finite-difference approximation is a numerical method that computes 
% derivatives by estimating the rate of change through small increments. It
% is used when analytic derivatives are difficult or impossible to obtain 
% analytically. The finite-difference method can be applied to functions for
% which analytic derivatives are not known or difficult to compute.
