x = [-2, -1.7, -1.4, -1.1, -0.8, -0.5, -0.2, 0.1, 0.4, 0.7, 1.0, 1.3, 1.6, 1.9, 2.2, 2.5, 2.8, 3.1, 3.4, 3.7, 4.0, 4.3, 4.6, 4.9];
y = [0.1029, 0.1174, 0.1316, 0.1448, 0.1556, 0.1662, 0.1733, 0.1775, 0.1785, 0.1764, 0.1711, 0.1630, 0.1526, 0.1402, 0.1266, 0.1122, 0.0977, 0.0835, 0.0702, 0.0588, 0.0479, 0.0373, 0.0291, 0.0224];

degrees = 2:6;
best_degree = 0;
best_rsquare = 0;
best_coeffs = [];

% 遍历不同阶次，选择最佳拟合
for degree = degrees
    [p, S] = polyfit(x, y, degree);
    rsquare = 1 - (S.normr^2) / ((length(y) - 1) * var(y));
    
    if rsquare > best_rsquare
        best_rsquare = rsquare;
        best_degree = degree;
        best_coeffs = p;
    end
end

fprintf('最佳多项式阶次：%d\n', best_degree);
fprintf('多项式系数：\n');
disp(best_coeffs);
%输出表达式
fprintf('拟合多项式：\n');
fprintf('y = %.4f', best_coeffs(1));
for i = 2:best_degree + 1
    fprintf(' + %.4f * x^%d', best_coeffs(i), i - 1);
end

fprintf('剩余标准差：%.4f\n', sqrt(S.normr^2 / (length(y) - best_degree - 1)));

x_fit = linspace(-2, 4.9, 1000);
y_fit = polyval(best_coeffs, x_fit);

figure;
plot(x, y, 'o', 'DisplayName', '观测数据');
hold on;
plot(x_fit, y_fit, '-', 'DisplayName', sprintf('%d 阶多项式拟合', best_degree));
xlabel('x');
ylabel('y');
title('最小二乘多项式拟合');
legend;
grid on;
hold off;