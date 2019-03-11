clear
clc
ypr1 = load('相机测量角度.txt');
ypr2 = load('相机理论角度.txt');
ypr3 = load('相机测量角度补偿.txt');
[num,~] = size(ypr1);
Dangle1 = [];
Dangle2 = [];
for p=1:num
    dangle = CalcuAngle_Camera(ypr1(p,:),ypr2(p,:));
    Dangle1 = [Dangle1,dangle];
    dangle = CalcuAngle_Camera(ypr3(p,:),ypr2(p,:));
    Dangle2 = [Dangle2,dangle];
end