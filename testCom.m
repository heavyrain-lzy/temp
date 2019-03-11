alpha0 = 618.752/3600;
beta0 = -236.075/3600;

u0 = 1258.951;
v0 = 1023.286;

alpha_show = 1.5283;
beta_show = 0.0727;

alpha_mea = alpha_show + alpha0
beta_mea = beta_show + beta0

alpha_temp1 = -1.6; x_temp1 = 1807.9256-u0;
alpha_temp2 = -1.8; x_temp2 = 1877.3456-u0;
x_mea = x_temp1 - (x_temp1 - x_temp2)*(alpha_temp1-alpha_mea)/(alpha_temp1-alpha_temp2);

beta_temp1 = 0; y_temp1 = 1023.2862-v0;
beta_temp2 = 0.2; y_temp2 = 1091.7361-v0;
y_mea = y_temp1 - (y_temp1 - y_temp2)*(beta_temp1-beta_mea)/(beta_temp1-beta_temp2);

theta = -(0.00200+0.00167)/2;

R = [cos(theta)  sin(theta);
     -sin(theta) cos(theta)];
 
X = R*[x_mea; y_mea]

x_pie = X(1);
y_pie = X(2);

alpha_com = alpha_temp1 - (alpha_temp1 - alpha_temp2)*(x_temp1-x_pie)/(x_temp1-x_temp2)
beta_com = beta_temp1 - (beta_temp1 - beta_temp2)*(y_temp1-y_pie)/(y_temp1-y_temp2)

alpha_com = alpha_com - alpha0
beta_com = beta_com - beta0



