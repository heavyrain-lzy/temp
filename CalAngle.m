clear
clc
ypr1 = load('立刻测量.txt');
ypr2 = load('等待测量.txt');
[num,~] = size(ypr1);
Dangle = [];
for p=1:num
    dangle = CalcuAngle(ypr1(p,:),ypr2(p,:));
    Dangle = [Dangle,dangle];
end
