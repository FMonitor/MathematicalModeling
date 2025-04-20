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

disp('最优股数：');
disp(sol.x);
disp('对应投资金额(：');
disp(prices .* sol.x);
disp(['组合总收益：', num2str(expect_returns' * sol.x)]);
std_risk = sqrt(fval);
fprintf('组合风险（标准差）：%.2f 元\n', std_risk);

