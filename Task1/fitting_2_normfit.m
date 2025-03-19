x = [-2, -1.7, -1.4, -1.1, -0.8, -0.5, -0.2, 0.1, 0.4, 0.7, 1.0, 1.3, 1.6, 1.9, 2.2, 2.5, 2.8, 3.1, 3.4, 3.7, 4.0, 4.3, 4.6, 4.9];
y = [0.1029, 0.1174, 0.1316, 0.1448, 0.1556, 0.1662, 0.1733, 0.1775, 0.1785, 0.1764, 0.1711, 0.1630, 0.1526, 0.1402, 0.1266, 0.1122, 0.0977, 0.0835, 0.0702, 0.0588, 0.0479, 0.0373, 0.0291, 0.0224];

% 正态分布模型
normal_model = @(params, x) (1 / sqrt(2 * pi * params(2)^2)) * exp(-(x - params(1)).^2 / (2 * params(2)^2));

initialParams = [0, 1]; % [mu, sigma]

% 使用 lsqcurvefit 进行非线性拟合
fittedParams = lsqcurvefit(normal_model, initialParams, x, y);

fprintf('正态分布拟合结果：\n');
fprintf('mu = %.4f\n', fittedParams(1));
fprintf('sigma = %.4f\n', fittedParams(2));

x_fit = linspace(-2, 4.9, 1000);
y_fit = normal_model(fittedParams, x_fit);

figure;
plot(x, y, 'o', 'DisplayName', '观测数据');
hold on;
plot(x_fit, y_fit, '-', 'DisplayName', '正态分布拟合');
xlabel('x');
ylabel('y');
title('正态分布拟合');
legend;
grid on;
hold off;