clc;clear;

% 目标函数
f = [1,2,3,4];

Aeq = [1,-1,-1,1;1,-1,1,-3;1,-1,-2,3];

beq = [0;1;-0.5];

u = optimvar('u',4,'LowerBound',0);
v = optimvar('v',4,'LowerBound',0);

prob = optimproblem('Objective',sum(f*(u+v)),'ObjectiveSense','min');
prob.Constraints.cons1 = Aeq*(u-v) == beq;

[sol,fval,exitflag,output] = solve(prob);

if exitflag == 1
    x = sol.u - sol.v;
    fprintf('最优解：x1 = %.4f\n x2 = %.4f\n x3 = %.4f\n x4 = %.4f\n', x(1), x(2), x(3), x(4));
    fprintf('最优目标值：z = %.4f\n', fval);
else
    fprintf('未找到最优解。\n');
end