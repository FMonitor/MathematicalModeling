clear; clc;

% 设备利润矩阵 P(i,j)：第i台设备给第j个企业带来的利润（千万元）
P = [4 2 3 4;
     6 4 5 5;
     7 6 7 6;
     7 8 8 6;
     7 9 8 6;
     7 10 8 6];

[m, n] = size(P); % m=6设备数，n=4企业数
prob = optimproblem('ObjectiveSense', 'maximize');

x = optimvar('x', m, n, 'Type', 'integer', 'LowerBound', 0, 'UpperBound', 1);

profit_expr = sum(sum(P .* x)); % 元素对应相乘再求和
prob.Objective = profit_expr;

assign_constraints = sum(x, 2) == 1;

prob.Constraints.assign = assign_constraints;

[sol, fval, exitflag, output] = solve(prob);
fprintf('最大利润为：%.2f 千万元\n', fval);
firm_names = ["甲", "乙", "丙", "丁"];
for i = 1:m
    assigned = find(sol.x(i, :) > 0.5); % 找出该设备分配给哪个企业
    fprintf('设备 %d 分配给企业 %s\n', i, firm_names(assigned));
end