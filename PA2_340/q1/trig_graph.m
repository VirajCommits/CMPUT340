 X2 = [-5.         -4.79591837 -4.59183673 -4.3877551  -4.18367347 -3.97959184  -3.7755102  -3.57142857 -3.36734694 -3.16326531 -2.95918367 -2.75510204  -2.55102041 -2.34693878 -2.14285714 -1.93877551 -1.73469388 -1.53061224  -1.32653061 -1.12244898 -0.91836735 -0.71428571 -0.51020408 -0.30612245  -0.10204082  0.10204082  0.30612245  0.51020408  0.71428571  0.91836735   1.12244898  1.32653061  1.53061224  1.73469388  1.93877551  2.14285714   2.34693878  2.55102041  2.75510204  2.95918367  3.16326531  3.36734694   3.57142857  3.7755102   3.97959184  4.18367347  4.3877551   4.59183673   4.79591837  5.        ];
Y2 = [ 1.51657986e+01  1.18834486e+01  1.14908377e+01  9.69999012e+00   8.83752995e+00  8.53654378e+00  7.26220222e+00  6.24526603e+00   6.14466521e+00  2.20438691e+00  3.02257790e+00  2.55301601e+00   1.20314417e+00  2.81993279e+00 -7.95772374e-02  5.17986596e-01  -2.02214422e+00 -1.88483645e+00 -6.00919079e-01 -1.89204707e-01   1.69449681e-02  3.91334228e-01 -1.73970249e+00 -3.19757434e-01  -6.00188224e-01  2.31330343e-01  5.82638717e-01  4.22184971e+00   3.59292410e-01  4.59202652e+00  4.71769806e+00  5.21676309e+00   6.70631069e+00  6.62448237e+00  7.35495405e+00  9.65171985e+00   9.61038903e+00  1.22648215e+01  1.29301284e+01  1.33289427e+01   1.76286428e+01  1.76382160e+01  2.07450785e+01  2.18295969e+01   2.30767522e+01  2.64519126e+01  2.74412541e+01  2.89516763e+01   3.31531920e+01  3.70987315e+01];

coefficient_vector_interpolate = func_fit(X2, Y2', 'interpolate', 'trig', 70);

X_plot_interpolate = linspace(min(X2), max(X2), 1000);
Y_matrix_interpolate = trig_basis_matrix(X_plot_interpolate,length(X2));

Y_plot_interpolate = Y_matrix_interpolate *coefficient_vector_interpolate ;

figure()
datapoints = scatter(X2, Y2, 'r', 'filled');
hold on;
trig_interpolate = plot(X_plot_interpolate, Y_plot_interpolate, 'g', 'LineWidth', 1);

xlabel('X2');  % Label for the x-axis
ylabel('Y2');  % Label for the y-axis

ylim([-8, 40]); % Adjust your_y_min and your_y_max as needed
xlim([-5.5, 5.5]); % Adjust your_x_min and your_x_max as needed



coefficient_vector_approx = func_fit(X2, Y2', 'approximate', 'trig', 30);

X_plot_approx = linspace(min(X2), max(X2), 1000);
Y_matrix_approx = trig_basis_matrix(X_plot_approx,30);

Y_plot_approx = Y_matrix_approx *coefficient_vector_approx ;

hold on;
trig_approx = plot(X_plot_approx, Y_plot_approx, 'b', 'LineWidth', 1);

ylim([-15, 40]);
xlim([-5.5, 5.5]); 

legend([trig_approx,trig_interpolate,datapoints], 'Trig Approx(parameters = 30)', 'Trig Interpolate',"DataSet2");
hold off;
