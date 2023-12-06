function A = trig_basis_matrix(X,row_limit)
    num = row_limit;
    is_even = 0;
    if mod(row_limit, 2) == 0
        num = row_limit-1;
        is_even = 1;
    end
    A = zeros(length(X), row_limit);
    K = floor((num - 1) / 2);
    for i = 1:length(X)
        counter_x = 1;
        counter_y = 1;
        value_x = X(i);
        for j = 1:row_limit
            if j == 1
                A(i, j) = 1;
            elseif j <= K+1
                value = counter_x * value_x;
                A(i, j) = cos(value);
                % A(i,j) = 2;
                counter_x = counter_x + 1;
            elseif j == num-1 && is_even == 1
                A(i, j) = X(i);
            else
                value = counter_y * value_x;
                A(i, j) = sin(value);
                % A(i,j) = 3;
                counter_y = counter_y + 1;
            end
        end

    end
end