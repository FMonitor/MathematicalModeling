T = [700, 720, 740, 760, 780];
V = [0.0977, 0.1218, 0.1406, 0.1551, 0.1664];

T_interp = [750, 770];

V_linear = interp1(T, V, T_interp, 'linear');

V_spline = interp1(T, V, T_interp, 'spline');


fprintf('线性插值结果：\n');
fprintf('T=750时，V=%.4f\n', V_linear(1));
fprintf('T=770时，V=%.4f\n', V_linear(2));

fprintf('三次样条插值结果：\n');
fprintf('T=750时，V=%.4f\n', V_spline(1));
fprintf('T=770时，V=%.4f\n', V_spline(2));


T_plot = linspace(700, 780, 100); 
V_linear_plot = interp1(T, V, T_plot, 'linear');
V_spline_plot = interp1(T, V, T_plot, 'spline');

figure;

% 子图1：线性插值
subplot(1, 2, 1);
plot(T, V, 'o', 'DisplayName', '原始数据');
hold on;
plot(T_plot, V_linear_plot, '-', 'DisplayName', '线性插值'); 
xlabel('温度 T');
ylabel('体积 V');
title('线性插值');
legend;
grid on;
hold off;

% 子图2：三次样条插值
subplot(1, 2, 2);
plot(T, V, 'o', 'DisplayName', '原始数据'); 
hold on;
plot(T_plot, V_spline_plot, '-', 'DisplayName', '三次样条插值');
xlabel('温度 T');
ylabel('体积 V');
title('三次样条插值');
legend;
grid on;
hold off;