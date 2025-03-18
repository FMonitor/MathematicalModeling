# 数学建模课程任务代码
## Task 1:
### 插值问题

1.已知当温度为T=【700，720，740，760，780】时，过热蒸汽体积的变化为V=【0.0977，0.1218，0.1406，0.1551，0.1664】，分别采用线性播值和三次样条插值求解T=750和T=770时的体积变化，并在一个图形界面中画出线性插值函数和三次样条插值函数。

<div style="text-align: center;">
    <img src="./Task1/interpolation.jpg" alt="插值问题">
</div>

### 拟合问题

1.现有函数 $g(x)=\frac{10a}{10b+(a-10b)e^{-asinx}}$，取 $a=1.1, b=0.01$ 计算 $x=1, 2, ..., 20$ 时，$g(x)$ 的值，把这样得到的数据作为模拟观测值，记作 $(x_i, y_i), i=1, 2, ..., 20$。
  
- （1）用lsqcurvefit拟合函数 $\hat{g}(x)$；
- （2）用fit拟合函数 $\hat{g}(x)$。

<div style="text-align: center;">
    <img src="./Task1/fitting_1.jpg" alt="拟合问题">
</div>


2.已知一组观测数据，如表所示
<div align="center">

| $x_i$ | -2 | -1.7 | -1.4 | -1.1 | -0.8 | -0.5 | -0.2 | 0.1 | 
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| $y_i$ | 0.1029 | 0.1174 | 0.1316 | 0.1448 | 0.1556 | 0.1662 | 0.1733 | 0.1775 |

| $x_i$ | 0.4 | 0.7 | 1.0 | 1.3 | 1.6 | 1.9 | 2.2 | 2.5 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| $y_i$ | 0.1785 | 0.1764 | 0.1711 | 0.1630 | 0.1526 | 0.1402 | 0.1266 | 0.1122 |

| $x_i$ | 2.8 | 3.1 | 3.4 | 3.7 | 4.0 | 4.3 | 4.6 | 4.9 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| $y_i$ | 0.0977 | 0.0835 | 0.0702 | 0.0588 | 0.0479 | 0.0373 | 0.0291 | 0.0224 |

</div>

- （1）试用插值方法缩制出 $x\in[-2, 4.9]$ 区间内的曲线，并比较各种插值算法的优劣。
- （2）试用最小二乘多项式拟合方法拟合表中数据，选择一个能较好拟合数据点的多项式的阶次，给出相应多项式的系数和剩余标准差。
- （3）若表中数据满足正态分布函数$y(x)=\frac{1}{\sqrt{2\pi}}e^{-\frac{(x-\mu)^2}{2\sigma^2}}$，试用最小二乘非线性拟合方法求出分布参数$\mu$和$\sigma$，并利用所求参数值绘制拟合曲线，观察拟合效果。
  
<div align="center">
    <img src="./Task1/fitting_2_interp.jpg" alt="插值问题">
</div>

<div align="center">
    <img src="./Task1/fitting_2_polyfit.jpg" alt="拟合问题">
</div>

<div align="center">
    <img src="./Task1/fitting_2_normfit.jpg" alt="拟合问题">
</div>
