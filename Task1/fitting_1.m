% 函数和数据
function y = g(x)
a = 1.1;
b = 0.01;
y = 10*a / (10*b + (a - 10*b) * exp(-a * sin(x)));
end

x = 1:20;
y = zeros(1, 20);
for i = 1:20
    y(i) = g(x(i));
end

% 定义拟合模型
model = @(params, x) 10 * params(1) ./ (10 * params(2) + (params(1) - 10 * params(2)) * exp(-params(1) * sin(x)));

% 初始参数猜测
initialParams = [1, 0.01]; % 初始猜测值 [a, b]

% 使用 lsqcurvefit 进行拟合
fittedParams = lsqcurvefit(model, initialParams, x, y);

% 输出拟合结果
fprintf('lsqcurvefit 拟合结果：\n');
fprintf('a = %.4f\n', fittedParams(1));
fprintf('b = %.4f\n', fittedParams(2));

% 使用 fittype 进行拟合
ft = fittype('10*a / (10*b + (a - 10*b) * exp(-a * sin(x)))', ...
    'independent', 'x', 'dependent', 'y');
opts = fitoptions('Method', 'NonlinearLeastSquares', ...
    'StartPoint', initialParams);
[fitResult, gof] = fit(x', y', ft, opts);

% 输出拟合结果
fprintf('fittype 拟合结果：\n');
disp(fitResult);

% 生成拟合曲线
x_fit = linspace(1, 20, 100);
y_lsqcurvefit = model(fittedParams, x_fit);
y_fittype = fitResult(x_fit);

% 绘制结果
figure;

% 子图1：lsqcurvefit 拟合结果
subplot(1, 2, 1);
plot(x, y, 'o', 'DisplayName', '观测数据');
hold on;
plot(x_fit, y_lsqcurvefit, '-', 'DisplayName', 'lsqcurvefit 拟合');
xlabel('x');
ylabel('y');
title('lsqcurvefit 拟合结果');
legend;
grid on;
hold off;

% 子图2：fittype 拟合结果
subplot(1, 2, 2);
plot(x, y, 'o', 'DisplayName', '观测数据');
hold on;
plot(x_fit, y_fittype, '-', 'DisplayName', 'fittype 拟合');
xlabel('x');
ylabel('y');
title('fittype 拟合结果');
legend;
grid on;
hold off;