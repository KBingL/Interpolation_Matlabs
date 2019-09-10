%langrange方法主函数
%同时计算多点插值
%已有点x和y
x = [pi/4,pi/6,pi/3,pi/2];
y=[cos(pi/4),cos(pi/6),cos(pi/3),cos(pi/2)];
%需要插值点
t = [-40*pi/180,40*pi/180,50*pi/180,70*pi/180,170*pi/180];
disp('角度')
du = [-40,40,50,70,170]
%插值计算结果
disp('插值结果')
yt = lag(x,y,t)
%cos函数值
disp('cos函数值')
yreal = [cos(-40*pi/180),cos(40*pi/180),cos(50*pi/180),cos(70*pi/180),cos(170*pi/180)]
disp("插值与函数误差")
dy = yt - yreal
%给出插值多项式，需要显示的话，去掉下行分号
yt = lag(x,y);
%画出插值多项式图形
ezplot(yt,[-pi/4,pi/4])
hold on
ezplot('cos(t)',[-pi/4,pi/4]);
hold off



