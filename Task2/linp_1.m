clc; clear;

% 目标函数，化为最小化
f = [-3; 1; 1]; 

A = [1, -2, 1; 4, -1, -2]; %  >= 转换为 <=
b = [11; -3]; 

Aeq = [-2, 0, 1];
beq = 1;

lb = [0; 0; 0];

[x, fval, exitflag] = linprog(f, A, b, Aeq, beq, lb);

if exitflag == 1
    fprintf('最优解：x1 = %.4f, x2 = %.4f, x3 = %.4f\n', x(1), x(2), x(3));
    fprintf('最优目标值：z = %.4f\n', -fval); % 恢复最大化
else
    fprintf('未找到最优解。\n');
end

