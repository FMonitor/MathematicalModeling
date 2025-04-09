% 定义目标函数系数
f = [5, -5, -13]; % 注意 linprog 默认是求最小值，因此目标函数取负号

% 定义不等式约束矩阵和向量
A = [-1, 1, 3;
     12, 4, 10;
     2,3,5];
b = [20; 70;50];

% 定义变量的下界
lb = [0, 0, 0]; % x1, x2, x3 >= 0

% 使用 linprog 求解
[x, fval] = linprog(f, A, b, [], [], lb);

% 输出结果
disp('最优解：');
disp(x);
disp('目标函数最大值：');
disp(-fval); % 由于目标函数取了负号，这里需要再取负
