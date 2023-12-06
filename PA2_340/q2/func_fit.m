function coefficient_vector = func_fit(X, Y, type, basis, parameters)
    % Check if the type is 'approximate' or 'interpolate'
    if strcmp(type, 'approximate')
        
        if strcmp(basis, 'poly')
            % Create a Vandermonde Matrix (A)
            A = zeros(length(X), parameters);
    
            for i = 1:length(X)
                value_x = X(i);
                for j = 1:parameters
                    A(i, j) = value_x^(j-1);
                end
            end
            
    
            % The coefficient vector c represents the polynomial coefficients
            coefficient_vector = fliplr(A)\Y;
            
            
        elseif strcmp(basis, 'trig')
            is_even = 0;
            num_terms = parameters;
            if mod(length(X),2) == 0
                num_terms = parameters-1;
                is_even = 1;
            end
            % Create a matrix for the trigonometric basis
            A = zeros(length(X), parameters);
            K = floor((num_terms-1)/2);

            
            for i = 1:length(X)
                counter_x = 1;
                counter_y = 1;
                value_x = X(i);
                for j=1:parameters
                    if j == 1
                        A(i,j) = 1;
                    elseif j<=K+1
                        value = counter_x*value_x;
                        A(i,j) = cos(value);
                        counter_x = counter_x + 1;
                    elseif j==num_terms-1 && is_even == 1
                        A(i,j) = X(i);
                    else
                        value = counter_y*value_x;
                        A(i,j) = sin(value);
                        counter_y = counter_y + 1;
                    end
                end
            end
            % Calculate c by multiplying the pseudo-inverse of A with Y
            c = A\Y;
        
            % The coefficient vector c represents the trigonometric coefficients
            coefficient_vector = c;
          
        else
            error('Invalid basis function');
        end
    elseif strcmp(type, 'interpolate')
        
        if strcmp(basis, 'poly')
            % Create a Vandermonde Matrix(A)
            A = zeros(length(X), length(X));

            for i = 1:length(X)
                value_x = X(i);
                for j = 1:length(X)
                    A(i, j) = value_x^(length(X) - j);
                end
            end
           

            % Calcualte c by multiplying inverse(of A) with Y(A\y)
            % c = pinv(A) * Y;
            % c = A/Y
            % create polynomial interpolation function using c matrix
            coefficient_vector = (A\Y);

            
        elseif strcmp(basis, 'trig')
            is_even = 0;
            num_terms = length(X);
            if mod(length(X),2) == 0
                num_terms = length(X)-1;
                is_even = 1;
            end
            % Create a matrix for the trigonometric basis
            A = zeros(length(X), length(X));
            K = floor((num_terms-1)/2);

            
            for i = 1:length(X)
                counter_x = 1;
                counter_y = 1;
                value_x = X(i);
                for j=1:length(X)
                    if j == 1
                        A(i,j) = 1;
                    elseif j<=K+1
                        value = counter_x*value_x;
                        A(i,j) = cos(value);
                        counter_x = counter_x + 1;
                    elseif j==num_terms-1 && is_even == 1
                        A(i,j) = X(i);
                    else
                        value = counter_y*value_x;
                        A(i,j) = sin(value);
                        counter_y = counter_y + 1;
                    end
                end
            end
            % Calculate c by multiplying the pseudo-inverse of A with Y
            c = A\Y;
        
            % The coefficient vector c represents the trigonometric coefficients
            coefficient_vector = c;
        
        else
            error('Invalid type');
        end
    end
    
end

