c = [6;8;4;2];
Q = [1 2 0 0;
     2 1 2 0;
     0 2 1 2;
     0 0 2 1];

best_z = -inf;
best_x = [];

for x1 = [-1, 1]
    for x2 = [-1, 1]
        for x3 = [-1, 1]
            for x4 = [-1, 1]
                x = [x1; x2; x3; x4];
                
                prod_sum = x1 * x2 + x3 * x4;
                linear_sum = sum(x);
                
                if (-1 <= prod_sum) && (prod_sum <= 1) && ...
                   (-3 <= linear_sum) && (linear_sum <= 2)
                   
                    z = c' * x + 0.5 * x' * Q * x;
                    
                    if z > best_z
                        best_z = z;
                        best_x = x;
                    end
                end
            end
        end
    end
end

disp('最优解 x：');
disp(best_x');
disp(['最大目标函数值 z = ', num2str(best_z)]);
