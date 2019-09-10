function [y,R] = LagNew(X,Y,x,M)
%����һ�����ݣ���ֵ�㡢M =max|f��x����n+1�׵���|

if(nargin==4)
    n = length(X); %��ȡX����
    m = length(x); %��ȡx����
    for i = 1:m   %���������x
        z = x(i);s = 0.0;
        for k=1:n  %�������ڵ�y
            la = 1;q1 = 1.0;c1  =1.0;
            for j = 1:n %�������ڵ�x
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


    