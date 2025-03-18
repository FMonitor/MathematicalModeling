x = [-2, -1.7, -1.4, -1.1, -0.8, -0.5, -0.2, 0.1, 0.4, 0.7, 1.0, 1.3, 1.6, 1.9, 2.2, 2.5, 2.8, 3.1, 3.4, 3.7, 4.0, 4.3, 4.6, 4.9];
y = [0.1029, 0.1174, 0.1316, 0.1448, 0.1556, 0.1662, 0.1733, 0.1775, 0.1785, 0.1764, 0.1711, 0.1630, 0.1526, 0.1402, 0.1266, 0.1122, 0.0977, 0.0835, 0.0702, 0.0588, 0.0479, 0.0373, 0.0291, 0.0224];

x_interp = linspace(-2, 4.9, 1000);

% 线性插值
y_linear = interp1(x, y, x_interp, 'linear');

% 三次样条插值
y_spline = interp1(x, y, x_interp, 'spline');

% 绘制插值结果
figure;
plot(x, y, 'o', 'DisplayName', '观测数据');
hold on;
plot(x_interp, y_linear, '-', 'DisplayName', '线性插值', 'LineWidth', 1);
plot(x_interp, y_spline, '--', 'DisplayName', '三次样条插值', 'LineWidth', 3);
xlabel('x');
ylabel('y');
title('插值方法比较');
legend;
grid on;
hold off;