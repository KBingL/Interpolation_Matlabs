%�������ղ�ֵ����
%����ͬʱ�Զ���ֵ
%t����Ϊ����
function s=lag(x,y,t) %lag���ļ���
%���÷����Ƶ����������Ը�����ֵ�ľ��幫ʽ
syms p;
%��ȡx����ά��
n= length(x);
s = 0;
for (k=1:n)
    la=y(k);
    %���������
    for(j=1:k-1)
        la = la*(p-x(j))/(x(k)-x(j));
    end;
   
    for(j=k+1:n)
        la = la*(p-x(j))/(x(k)-x(j));
    end;
    
    s =s+la;
    simplify(s);
end;

%������������ж�
%ֱ�Ӹ�����ֵ����ʽ
%�������������������ֵ��Ĳ�ֵ���
%��������������Ϊ����

if(nargin==2)
    s= subs(s,'p','x'); %�����ʽs�е�p�滻Ϊx
    %չ������ʽ
    s = collect(s);
    %��ϵ��ȡ��6λ���ȱ��
    s = vpa(s,6);
else
    %��ȡt����
    m = length(t);
    %�ֱ��t��ÿһ��������ֵ
    for(i=1:m)
        temp(i) = subs(s,'p',t(i));
    end
    %�õ�ϵ�в�ֵ��Ĳ�ֵ���
    %���õ�������������ֵ��s
    
    s = temp;
    s = vpa(s,6);
end


    