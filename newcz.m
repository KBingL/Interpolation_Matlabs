%牛顿插值算法

 x = 40*pi/180;
 M =1;
 X = [pi/6,pi/4,pi/3];
 Y = [0.5,0.7071,0.8660];

%function [y,R] =newcz(X,Y,x,M)
n = length(X);
m = length(x);


for t=1:m %遍历待解决的点
    z = x(t);%取其中一个
    A = zeros(n,n);%构建空的差商表n*n
    A(:,1) = Y';%差商表的第一列保存所有的Y转置
    s = 0.0;p=1.0;q1 = 1.0;c1 = 1.0;
    for j =2:n %从第2列开始计算保存，遍历每列
        for i = j:n %遍历每行，开始位置是对角线位置，故i=j:n
            A(i,j) = (A(i,j-1)-A(i-1,j-1))/(X(i)-X(i-j+1)); %计算每个插上
        end
        q1 = abs(q1*(z-X(j-1))); %计算误差的累乘项
        c1 = c1*j;%分子中的阶乘
    end
    C = A(n,n); %最后一阶差商的值
    q1 = abs(q1*(z-X(n))); %
    
    for k=(n-1):-1:1 %这里不是很明白，如何操作多项式的乘法
       C = conv(C,poly(X(k)))%用根构造多项式，conv的作用是在做多项式的乘法;
       d = length(C);
       C(d) = C(d)+A(k,k) %每个对角线的差商多项式乘积累加；
    end
    y(k ) = polyval(C,z);%求多项式的值
end
R = M*q1/c1;
