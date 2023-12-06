function [pos,j] = evalRobot2D(l, theta)
    
    l1 = l(1);
    l2 = l(2);

    theta1 = theta(1);
    theta2 = theta(2);

    pos1 = l1*cos(theta1) + l2*cos(theta1+theta2);
    pos2 = l1*sin(theta1) + l2*sin(theta1+theta2);

    pos = [pos1,pos2]';

    j = [-l1 * sin(theta1) - l2 * sin(theta1 + theta2), -l2 * sin(theta1 + theta2);
         l1 * cos(theta1) + l2 * cos(theta1 + theta2),  l2 * cos(theta1 + theta2)];

