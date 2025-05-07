% 参数定义
 d = 1;         
 k = 0.5;       
 v2 = 1;        
 v1 = k * v2;   

 % 微分方程定义
 odefun = @(t, Y) [ ...
     -v2*Y(1)/sqrt(Y(1)^2 + (d - Y(2))^2) + v1; ...
      v2*(d - Y(2))/sqrt(Y(1)^2 + (d - Y(2))^2)];

 % 初始值
 Y0 = [0; 0];

 % 解算
 [t, Y] = ode45(odefun, [0 10], Y0);

 % 绘图
 plot(Y(:,1), Y(:,2), 'b-', 'LineWidth', 2);
 hold on;
 plot(0, 0, 'go', 0, d, 'ro'); % 起点和终点
 xlabel('x'); ylabel('y');
 title('数值解');
 grid on;
 legend('航线', '起点', '终点');
 xlim([-0.5 0.7]);
 ylim([0 1]);

