clear
clc
ypr1 = load('��������Ƕ�.txt');
ypr2 = load('������۽Ƕ�.txt');
ypr3 = load('��������ǶȲ���.txt');
[num,~] = size(ypr1);
Dangle1 = [];
Dangle2 = [];
for p=1:num
    dangle = CalcuAngle_Camera(ypr1(p,:),ypr2(p,:));
    Dangle1 = [Dangle1,dangle];
    dangle = CalcuAngle_Camera(ypr3(p,:),ypr2(p,:));
    Dangle2 = [Dangle2,dangle];
end