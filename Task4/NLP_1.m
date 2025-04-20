
x = optimvar('x', 5, 'Type', 'integer', 'LowerBound', 0, 'UpperBound', 99);

obj = x(1)^2 + x(2)^2 + 3*x(3)^2 + 4*x(4)^2 + 2*x(5)^2 ...
      - 8*x(1) - 2*x(2) - 3*x(3) - x(4) - 2*x(5);

prob = optimproblem('Objective', -obj); % 注意：默认是最小化，所以取负号

cons1 = sum(x) <= 400;
cons2 = x(1) + 2*x(2) + 2*x(3) + x(4) + 6*x(5) <= 800;
cons3 = 2*x(1) + x(2) + 6*x(3) <= 200;
cons4 = x(3) + x(4) + 5*x(5) <= 200;

prob.Constraints.cons1 = cons1;
prob.Constraints.cons2 = cons2;
prob.Constraints.cons3 = cons3;
prob.Constraints.cons4 = cons4;

x0.x = [1;1;1;1;1];

[sol,fval,exitflag,output] = solve(prob,x0);

disp('最优解：');
disp(sol.x);
disp('最优目标值（最大化）：');
disp(-fval);
