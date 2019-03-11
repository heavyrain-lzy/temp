function Dangle = CalcuAngle_Camera(Angle_Mea,Angle_True)
%
%Param:  Dangle ���������ļн�(����) Angle_Mea �ǶȲ���ֵ(��)[alpha,beta]
%        Angle_Mea �Ƕ�����ֵ(��)[alpha,beta]

 alpha0 = Angle_Mea(1)/180*pi;
 beta0 = Angle_Mea(2)/180*pi;
 x0 = -1;
 y0 = -x0*tan(alpha0);
 z0 = sqrt(x0^2+y0^2)*tan(beta0)';
 p0 = [x0 y0 z0]';
 alpha1 = Angle_True(1)/180*pi;
 beta1 = Angle_True(2)/180*pi;
 x1 = -1;
 y1 = -x1*tan(alpha1);
 z1 = sqrt(x1^2+y1^2)*tan(beta1)';
 p1 = [x1 y1 z1]';

 coss = p0'*p1/(norm(p0)*norm(p1));
 Dangle = acos(coss)*180/pi*3600;
end
 