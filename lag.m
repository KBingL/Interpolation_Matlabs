%拉格朗日插值方法
%可以同时对多点插值
%t可以为向量
function s=lag(x,y,t) %lag是文件名
%采用符号推导，这样可以给出插值的具体公式
syms p;
%读取x向量维数
n= length(x);
s = 0;
for (k=1:n)
    la=y(k);
    %构造基函数
    for(j=1:k-1)
        la = la*(p-x(j))/(x(k)-x(j));
    end;
   
    for(j=k+1:n)
        la = la*(p-x(j))/(x(k)-x(j));
    end;
    
    s =s+la;
    simplify(s);
end;

%对输入参数做判断
%直接给出插值多项式
%如果三个参数，给出插值点的插值结果
%第三个参数可以为向量

if(nargin==2)
    s= subs(s,'p','x'); %将表达式s中的p替换为x
    %展开多项式
    s = collect(s);
    %把系数取到6位精度表达
    s = vpa(s,6);
else
    %读取t长度
    m = length(t);
    %分别对t的每一个分量插值
    for(i=1:m)
        temp(i) = subs(s,'p',t(i));
    end
    %得到系列插值点的插值结果
    %即得到的是向量，赋值给s
    
    s = temp;
    s = vpa(s,6);
end


    