clear
clc
ypr1 = load('���۽Ƕ�.txt');
ypr2 = load('�����Ƕ�.txt');
[num,~] = size(ypr1);
Dangle = [];
for p=1:num
    dangle = CalcuAngle(ypr1(p,:),ypr2(p,:));
    Dangle = [Dangle,dangle];
end
