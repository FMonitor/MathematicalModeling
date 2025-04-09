clear; clc;

x = optimvar('x', 5, 'Type', 'integer', 'LowerBound', 0);
obj = -[20, 90, 80, 70, 30] * x;
prob = optimproblem('Objective', obj, 'ObjectiveSense', 'min');

cons = [
    -x(1) - x(2) - x(5) <= -30;
    -x(3) - x(4) <= -30;
     3*x(1) + 2*x(3) <= 120;
     3*x(2) + 2*x(4) + x(5) <= 48;
];

prob.Constraints.cons = cons;
[sol, fval, exitflag, output] = solve(prob);

disp("最优解为：")
disp(sol.x)
disp("最大目标函数值为：")
disp(-fval)