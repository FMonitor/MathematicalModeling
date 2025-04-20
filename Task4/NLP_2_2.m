% 单位：股数
x = optimvar('x', 3, 'LowerBound', 0);

prices = [20; 25; 30];
expect_returns = [5; 8; 10];
total_money = 500000;
required_return = 0.2 * total_money;

Sigma = [4, 5, -10;
         5, 36, -15;
        -10, -15, 100];

% 将股数映射为金额
Q = diag(prices)' * Sigma * diag(prices);  % Q = Dᵀ * Σ * D

% 风险最小化的目标函数
risk = x' * Q * x;

prob = optimproblem('Objective', risk);
prob.Constraints.budget = prices' * x <= total_money;
prob.Constraints.return = expect_returns' * x >= required_return;

x0.x = [1000; 1000; 1000];
[sol,fval,exitflag,output] = solve(prob,x0);

returns_range = linspace(0.05, 0.3, 50) * total_money;
risks = zeros(size(returns_range));
solutions = zeros(3, length(returns_range));

for i = 1:length(returns_range)
    prob.Constraints.return = expect_returns' * x >= returns_range(i);
    [sol, fval] = solve(prob, x0);
    risks(i) = fval;
    solutions(:,i) = sol.x;
end

plot(returns_range / total_money, sqrt(risks), 'LineWidth', 2);
xlabel('预期收益率');
ylabel('组合风险（标准差）');
title('投资组合有效前沿');
grid on;
