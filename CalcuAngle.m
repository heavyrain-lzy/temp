function Dangle = CalcuAngle(ypr1,ypr2)
ypr1 = ypr1*pi/180;ypr2 = ypr2*pi/180;
x_pitch = ypr1(2);y_roll = ypr1(3);z_yaw = ypr1(1);
Rx = [1 0            0;
      0 cos(x_pitch) -sin(x_pitch);
      0 sin(x_pitch) cos(x_pitch)];
  
Ry = [cos(y_roll)  0 sin(y_roll);
      0            1 0          ;
      -sin(y_roll) 0 cos(y_roll)];

Rz = [cos(z_yaw) -sin(z_yaw)     0;
      sin(z_yaw) cos(z_yaw)      0;
      0            0             1];
 R1 = Ry*Rx*Rz;
 x_pitch = ypr2(2);y_roll = ypr2(3);z_yaw = ypr2(1);
Rx = [1 0            0;
      0 cos(x_pitch) -sin(x_pitch);
      0 sin(x_pitch) cos(x_pitch)];
  
Ry = [cos(y_roll)  0 sin(y_roll);
      0            1 0          ;
      -sin(y_roll) 0 cos(y_roll)];

Rz = [cos(z_yaw) -sin(z_yaw)     0;
      sin(z_yaw) cos(z_yaw)      0;
      0            0             1];
 R2 = Ry*Rx*Rz;
 
 %%
 alpha0 = 1.8/180*pi;
 beta0 = 1.8/180*pi;
 
 x0 = 1;
 y0 = x0*tan(alpha0);
 z0 = sqrt(x0^2+y0^2)*tan(beta0)';
 p0 = [x0 y0 z0]';
 R021 = R2*inv(R1);
 p1 = inv(R021)*p0;
 coss = p0'*p1/(norm(p0)*norm(p1));
 Dangle = acos(coss)*180/pi*3600;
end


