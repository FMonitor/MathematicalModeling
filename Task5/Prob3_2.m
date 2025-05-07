d = 100;                % 河宽 100m
v2 = 2;                 % 船速 2m/s
v1 = 1;                 % 水流速度 1m/s
k = v1 / v2;

% 微分方程和初始条件
odefun = @(t, Y) [ ...
    -v2*Y(1)/sqrt(Y(1)^2 + (d - Y(2))^2) + v1; ...
     v2*(d - Y(2))/sqrt(Y(1)^2 + (d - Y(2))^2)];

Y0 = [0; 0];

% 数值求解
[t, Y] = ode45(odefun, [0 200], Y0);

% 找到渡河完成的时间
idx = find(Y(:,2) >= d, 1);
T_cross = t(idx);     % 渡河所需时间
pos_at_T = Y(idx, :); % 对应位置

fprintf('渡河所需时间约为 %.2f 秒\n', T_cross);


figure;
plot(Y(:,1), Y(:,2), 'b-', 'LineWidth', 2); hold on;
plot(0, 0, 'go', 'MarkerSize', 10, 'MarkerFaceColor', 'g');         % 起点
plot(0, d, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');         % 理想终点
plot(pos_at_T(1), pos_at_T(2), 'ko', 'MarkerSize', 8);              % 实际终点
quiver(-10, d/2, 20, 0, 'Color', 'c', 'LineWidth', 2, 'MaxHeadSize', 2);
text(-10, d/2 + 5, '水流方向', 'Color', 'c');
N = 10;
for i = round(linspace(1, idx, N))
    dir = odefun(t(i), Y(i,:)')';
    dir = dir / norm(dir); % 单位向量方向
    quiver(Y(i,1), Y(i,2), dir(1)*5, dir(2)*5, 'r', 'LineWidth', 3, 'MaxHeadSize', 3);
end

xlabel('x 方向（河面） [m]');
ylabel('y 方向（过河） [m]');
title('小船航行轨迹');
legend('航行轨迹', '起点', '目标点', '到达点', 'Location', 'southeast');
grid on;
axis equal;
