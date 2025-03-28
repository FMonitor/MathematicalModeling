clc;clear;

%minZ=-3100(x_11+x_12+x_13)+3800(x_21+x_22+x_23)+3500(x_31+x_32+x_33)+2850(x_41+x_42+x_43)
f = -[3100, 3100, 3100, 3800, 3800, 3800, 3500, 3500, 3500, 2850, 2850, 2850];

% 前舱、中舱、后舱的质量约束
A = [
    1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0;
    0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0;  
    0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1   
];

b = [10; 16; 8]; % 质量上限

v = [480/18, 650/15, 580/23, 390/12];  % 每吨货物的体积

% 加上体积约束，分别为前舱、中舱、后舱
A = [A;
    v(1), v(1), v(1), v(2), v(2), v(2), v(3), v(3), v(3), v(4), v(4), v(4)];  
A = [A;
    v(1), v(1), v(1), v(2), v(2), v(2), v(3), v(3), v(3), v(4), v(4), v(4)];
A = [A;
    v(1), v(1), v(1), v(2), v(2), v(2), v(3), v(3), v(3), v(4), v(4), v(4)];  
b = [b; 6800; 8700; 5300];  % 体积上限

% 货舱负载比例
Aeq = [
    16 16 16 16 -10 -10 -10 -10  0   0   0   0;
    0   0   0   0   8   8   8   8  -16 -16 -16 -16
];
beq = [0; 0];
lb = zeros(12,1); 

[x, fval] = linprog(f, A, b, Aeq, beq, lb);

% 输出结果
disp('最优货物装载质量 (吨)：');
disp(reshape(x, 3, 4)');%行代表货物，列代表货舱
disp(['最大利润：', num2str(-fval)]);
