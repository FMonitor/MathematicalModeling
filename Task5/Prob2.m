% 区间
tspan = [0 30];

x0 = 1;
y0 = 0.5;
init = [x0; y0];

% 微分方程组
f = @(t, z) [
    -z(1)^3;          % dx/dt = -x^3
     z(1) - z(2)^3    % dy/dt = x - y^3
];

[t, z] = ode45(f, tspan, init);
x = z(:,1);
y = z(:,2);

% x和y随t变化
figure;
subplot(2,1,1)
plot(t, x, 'b', 'LineWidth', 2);
title('x(t)')
xlabel('Time t')
ylabel('x')
grid on

subplot(2,1,2)
plot(t, y, 'r', 'LineWidth', 2);
title('y(t)')
xlabel('Time t')
ylabel('y')
grid on

% y 对 x
figure;
plot(x, y, 'k', 'LineWidth', 2);
title('Phase Plot: y vs x')
xlabel('x')
ylabel('y')
grid on
