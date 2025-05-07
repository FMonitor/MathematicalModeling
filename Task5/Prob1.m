%% 解析解
syms y(x)
n = 1/2;

% 定义微分方程
ode = x^2*diff(y,x,2) + x*diff(y,x) + (x^2 - n^2)*y == 0;

% 初值条件
cond1 = y(pi/2) == 2;
cond2 = subs(diff(y, x), x, (pi/2)) == -(2/pi);

% 求符号解
ySol = dsolve(ode, [cond1 cond2])
disp('符号解为：');
pretty(ySol)


%% 数值解
% 定义数值微分方程为一阶系统
f = @(x, y) [y(2); -(1/x)*y(2) - (x^2 - n^2)/x^2*y(1)];

% 初始条件
x0 = pi/2;
y0 = [2; -2/pi];

% 求解区间
xspan = [pi/2 10];

% 调用ode45求数值解
[x_num, y_num] = ode45(f, xspan, y0);


%% 对比图
figure;
plot(x_num, y_num(:,1), 'r--', 'LineWidth', 2); hold on;
fplot(matlabFunction(ySol), [0.1, 10], 'b', 'LineWidth', 1.5);
legend('数值解', '符号解');
title('符号解与数值解对比')
xlabel('x')
ylabel('y(x)')
grid on

