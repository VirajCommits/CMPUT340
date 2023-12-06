function theta = invKin3D(l, theta0, pos, n, mode)
    threshold = 0.01;
    x0 = theta0;
    
    if mode == 1
        for k = 1:n
            [current_pos, J] = evalRobot3D(l, x0);
            f = current_pos - pos;
            
            s = -J\ f';
            
            x0 = x0 + s';
            
            if norm(f) < threshold
                break;
            end
        end
        theta = x0';
    else
        % Broyden's Method
        % Initial Jacobian guess
        x0 = theta0';
        pos = pos';
        [current_pos1,Bk] = evalRobot3D(l,x0);
        fk = current_pos1' - pos;

        for k=0:n

            if norm(fk) < threshold
                break;
            end
            
            sk = -Bk \ fk;
            x0 = x0 + sk;
    
            [new_pos, ~] = evalRobot3D(l, x0);

            fk_1 = new_pos' - pos;
            yk = fk_1 - fk;
            val = ((yk - Bk * sk) * sk') / (sk' * sk);
            Bk = Bk + val;
  
            fk = fk_1;
        end
        theta = x0';
    end
end
