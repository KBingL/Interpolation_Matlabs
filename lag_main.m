%langrange����������
%ͬʱ�������ֵ
%���е�x��y
x = [pi/4,pi/6,pi/3,pi/2];
y=[cos(pi/4),cos(pi/6),cos(pi/3),cos(pi/2)];
%��Ҫ��ֵ��
t = [-40*pi/180,40*pi/180,50*pi/180,70*pi/180,170*pi/180];
disp('�Ƕ�')
du = [-40,40,50,70,170]
%��ֵ������
disp('��ֵ���')
yt = lag(x,y,t)
%cos����ֵ
disp('cos����ֵ')
yreal = [cos(-40*pi/180),cos(40*pi/180),cos(50*pi/180),cos(70*pi/180),cos(170*pi/180)]
disp("��ֵ�뺯�����")
dy = yt - yreal
%������ֵ����ʽ����Ҫ��ʾ�Ļ���ȥ�����зֺ�
yt = lag(x,y);
%������ֵ����ʽͼ��
ezplot(yt,[-pi/4,pi/4])
hold on
ezplot('cos(t)',[-pi/4,pi/4]);
hold off



