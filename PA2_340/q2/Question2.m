% Problem A(load data for T and D from txt file)
data = load('q2_a.txt');
T = data(1, :); 
D = data(2, :); 

% Problem B(load data from pa2q2.mat given for q2)
load('pa2q2b.mat');

% Coefficient vector for Problem A
coefficient_vectorA = func_fit(T, D', 'interpolate', 'poly', 0);

% Coefficient vector for Problem B
coefficient_vectorB = func_fit(x, y', 'approximate', 'poly', 3);

% Scatter plot for Problem A
fig1 = figure();
scatter(T, D);
title('Problem A');
pause;

% ScatterPlot for Problem B
fig2 = figure();
scatter(x, y);
title('Problem B');
pause;

% Plot for Problem A
figure(fig1)
ylim([0, 500]);
xlim([0, 10]);
X_interp = linspace(min(T), max(D), 1000);
Y_interp = polyval(coefficient_vectorA, X_interp);
hold on;
plot(X_interp, Y_interp, 'r');
hold off;

pause;

% Plot for Problem B
figure(fig2)
ylim([-5, 30]);
xlim([-5, 5]);
X_interp = linspace(min(x), max(y), 1000);
Y_interp = polyval(coefficient_vectorB, X_interp);
hold on;
plot(X_interp, Y_interp, 'r');
hold off;

% For Problem A
% residual = actual - observed
% relative_residual = norm(residual)/norm()
residual = D - polyval(coefficient_vectorA, T); 
relative_residual = residual ./ D;
relative_residual = norm(relative_residual);
disp(residual);
disp(relative_residual);
% The errors predominantly exhibit negativity or are of negligible magnitude, 
% indicating that the model is accurate.

% For Problem B
residual= y - polyval(coefficient_vectorB, x);
residual = norm(residual);
relative_residual = residual ./ y;
relative_residual = norm(relative_residual);
disp(residual);
disp(relative_residual);
% The errors are either negative or very small, so we can conclude that the
% model is correct.

disp("derivative");
derivative = polyder(coefficient_vectorB);
disp(derivative);

area = trapz(x,polyval(coefficient_vectorB, x));
disp(area);

%{I chose interpolation over approximation because of the limited size and specific time intervals
% in our dataset. Our objective is to precisely ascertain the distances between the ball and the ground 
% at these designated times. In this context, interpolation is the preferred method. 
% Furthermore, I opted for a polynomial basis function, anticipating a gradual and continuous change 
% in the ball's distance over time. A polynomial function is well-suited for modeling 
% such smooth and continuous variations.%}

% For 2b, i chose approximation as as it enables to deal with continuous data.
% We chose Polynomial function with degree 3 as it captures the non-linear
% relationship in data 