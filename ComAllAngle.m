clear
clc
Angle_show = xlsread('D:\资料\光电校靶\数据处理.xlsx',3,'A2:B74');
[num,~] = size(Angle_show);
alpha_com = [];
beta_com = [];
for p = 1:num
    [alpha_comt,beta_comt] = ComAngle(Angle_show(p,1),Angle_show(p,2));
    alpha_com = [alpha_com,alpha_comt];
    beta_com = [beta_com,beta_comt];
end
Angle_com = [alpha_com',beta_com'];