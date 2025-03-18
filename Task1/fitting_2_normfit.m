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