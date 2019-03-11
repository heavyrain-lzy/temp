function [alpha_com,beta_com]= ComAngle(alpha_show,beta_show)
% alpha_show = 1.5283;
% beta_show = 0.0727;

DataOrigin = xlsread('D:\资料\光电校靶\相机标定.xlsx',1,'A2:E22');

alpha0 = 618.752/3600;
beta0 = -236.075/3600;

u0 = 1258.951;
v0 = 1023.286;



alpha_mea = alpha_show + alpha0;
beta_mea = beta_show + beta0;
if alpha_mea*10/2 - floor(alpha_mea*10/2) == 0
    Rowtem = (alpha_mea+2)*10/2+1;
    x_mea  = DataOrigin(Rowtem);
else
    Rowtem = fix((alpha_mea+2)*10/2);
    Rowtem1 = Rowtem + 1;
    alpha_temp1 = DataOrigin(Rowtem1,1); x_temp1 = DataOrigin(Rowtem1,2)-u0;
    alpha_temp2 = DataOrigin(Rowtem1+2,1); x_temp2 = DataOrigin(Rowtem1+1,2)-u0;
    x_mea = x_temp1 - (x_temp1 - x_temp2)*(alpha_temp1-alpha_mea)/(alpha_temp1-alpha_temp2);
end

if beta_mea*10/2 - floor(beta_mea*10/2) == 0
    Rowtem = (beta_mea+2)*10/2+1;
    y_mea  = DataOrigin(Rowtem);
else
    Rowtem = fix((beta_mea+2)*10/2);
    Rowtem1 = Rowtem + 1;
    beta_temp1 = DataOrigin(Rowtem1,1); y_temp1 = DataOrigin(Rowtem1,5)-v0;
    beta_temp2 = DataOrigin(Rowtem1+1,1); y_temp2 = DataOrigin(Rowtem1+1,5)-v0;
    y_mea = y_temp1 - (y_temp1 - y_temp2)*(beta_temp1-beta_mea)/(beta_temp1-beta_temp2);
end
theta = -(0.00200+0.00167)/2;

R = [cos(theta)  sin(theta);
     -sin(theta) cos(theta)];
 
X = R*[x_mea; y_mea];

x_pie = X(1);
y_pie = X(2);

alpha_com = alpha_temp1 - (alpha_temp1 - alpha_temp2)*(x_temp1-x_pie)/(x_temp1-x_temp2);
beta_com = beta_temp1 - (beta_temp1 - beta_temp2)*(y_temp1-y_pie)/(y_temp1-y_temp2);

alpha_com = alpha_com - alpha0;
beta_com = beta_com - beta0;
end