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