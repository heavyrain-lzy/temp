clear
clc
ypr1 = load('理论角度.txt');
ypr2 = load('测量角度.txt');
[num,~] = size(ypr1);
Dangle = [];
for p=1:num
    dangle = CalcuAngle(ypr1(p,:),ypr2(p,:));
    Dangle = [Dangle,dangle];
end
