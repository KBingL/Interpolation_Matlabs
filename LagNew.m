function [y,R] = LagNew(X,Y,x,M)
%输入一组数据，插值点、M =max|f在x处的n+1阶导数|

if(nargin==4)
    n = length(X); %读取X长度
    m = length(x); %读取x长度
    for i = 1:m   %遍历输入的x
        z = x(i);s = 0.0;
        for k=1:n  %遍历存在的y
            la = 1;q1 = 1.0;c1  =1.0;
            for j = 1:n %遍历存在的x
                if j~=k
                    la = la*(z-X(j))/(X(k)-X(j));
                end
                q1 = abs(q1*(z-X(j)));
                c1 = c1*j;
            end
            s = la*Y(k)+s;
        end
        y(i) = s;
    end
    R = M*q1/c1;
end

if(nargin == 2)
n = length(X);
syms pp;
y = 0.0;
R = 0;
    for k=1:n
        dx = Y(k);
        for j=1:n
            if j~=k
                dx = dx*(pp-X(j))/(X(k)-X(j));
            end
        end
        y = dx+y;
       
    end
y = subs(y,'pp','x')
y = collect(y);
y = vpa(y,6);
end


    