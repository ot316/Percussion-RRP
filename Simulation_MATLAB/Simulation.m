% Author: Jacob Tan
% Description

%%
clear
syms theta_1(t) theta_2(t) L_1 L_2 m_1 m_2 g F_in L_in d l_d x a K damp
x_1 = L_1*cos(theta_1);
y_1 = L_1*sin(theta_1);
x_2 = x_1 + L_2*cos(theta_2);
y_2 = y_1 + L_2*sin(theta_2);
vx_1 = diff(x_1);
vy_1 = diff(y_1);
vx_2 = diff(x_2);
vy_2 = diff(y_2);

ax_1 = diff(vx_1);
ay_1 = diff(vy_1);
ax_2 = diff(vx_2);
ay_2 = diff(vy_2);

% input force
F_o=L_in*F_in/L_1;

% resistant torque
r_1 = sqrt(l_d^2+d^2-2*d*l_d*cos(a)); % symmetrical tendon joints
r_2 = sqrt(l_d^2+d^2-2*d*l_d*cos(a));

r_1_t=sqrt((l_d+x)^2+d^2-2*d*(l_d+x)*cos(a+theta_2-theta_1));
r_2_t=sqrt((l_d+x)^2+d^2-2*d*(l_d+x)*cos(a-(theta_2-theta_1)));

r_1_d=r_1_t-r_1;
r_2_d=r_2_t-r_2;

F_s_1=r_1_d*K; % same spring constant for both springs
F_s_2=r_2_d*K;

t_s_1=F_s_1*(d*sin(a+theta_2-theta_1)/r_1_t)*(l_d+x);
t_s_2=F_s_2*(d*sin(a-(theta_2-theta_1))/r_2_t)*(l_d+x);

t_s=t_s_1+t_s_2; % total torque

F_2=t_s/L_2;

syms T_1 T_2
eqx_1 = m_1*ax_1(t) == T_1*cos(theta_1(t)) - T_2*cos(theta_2(t)) + F_o*sin(theta_1(t));
eqy_1 = m_1*ay_1(t) == T_1*sin(theta_1(t)) - T_2*sin(theta_2(t)) - m_1*g - F_o*cos(theta_1(t));
eqx_2 = m_2*ax_2(t) == T_2*cos(theta_2(t)) + F_2*sin(theta_2(t)) - damp*vx_2(t);
eqy_2 = m_2*ay_2(t) == T_2*sin(theta_2(t)) - m_2*g - F_2*cos(theta_2(t)) - damp*vy_2(t);
Tension = solve([eqx_1 eqy_1],[T_1 T_2]);
eqRed_1 = subs(eqx_2,[T_1 T_2],[Tension.T_1 Tension.T_2]);
eqRed_2 = subs(eqy_2,[T_1 T_2],[Tension.T_1 Tension.T_2]);

%%
F_in = 10;
L_in = 0.2;

d = 1;
l_d = 1;
x = 0.2;
a = deg2rad(30);
K = 10; % stiffness 

damp=0.9;

L_1 = 1;
L_2 = 0.5;
m_1 = 1;
m_2 = 1;
g = 9.8;
eqn_1 = subs(eqRed_1);
eqn_2 = subs(eqRed_2);
[V,S] = odeToVectorField(eqn_1,eqn_2);
M = matlabFunction(V,'vars',{'t','Y'});

initCond = [pi/4 0 pi/4 0];
sols = ode45(M,[0 10],initCond);

plot(sols.x,sols.y)
legend('\theta_2','d\theta_2/dt','\theta_1','d\theta_1/dt');

%%
x_1 = @(t) L_1*cos(deval(sols,t,3));
y_1 = @(t) L_1*sin(deval(sols,t,3));
x_2 = @(t) L_1*cos(deval(sols,t,3))+L_2*cos(deval(sols,t,1));
y_2 = @(t) L_1*sin(deval(sols,t,3))+L_2*sin(deval(sols,t,1));
fanimator(@(t) plot(x_1(t),y_1(t),'ro','MarkerSize',m_1*10,'MarkerFaceColor','r'),'FrameRate',60);
axis equal;
hold on;
fanimator(@(t) plot([0 x_1(t)],[0 y_1(t)],'r-'),'FrameRate',60);
fanimator(@(t) plot(x_2(t),y_2(t),'go','MarkerSize',m_2*10,'MarkerFaceColor','g'),'FrameRate',60);
fanimator(@(t) plot([x_1(t) x_2(t)],[y_1(t) y_2(t)],'g-'),'FrameRate',60);
fanimator(@(t) text(-0.3,0.3,"Timer: "+num2str(t,2)),'FrameRate',60);
hold off;
%%
plot(sols.x,sols.y)
legend('\theta_2','d\theta_2/dt','\theta_1','d\theta_1/dt');
%% Archive
syms d l_d x a theta_2 K

r_1 = sqrt(l_d^2+d^2-2*d*l_d*cos(a)); % symmetrical tendon joints
r_2 = sqrt(l_d^2+d^2-2*d*l_d*cos(a));

r_1_t=sqrt((l_d+x)^2+d^2-2*d*(l_d+x)*cos(a+theta_2));
r_2_t=sqrt((l_d+x)^2+d^2-2*d*(l_d+x)*cos(a-theta_2));

r_1_d=r_1_t-r_1;
r_2_d=r_2_t-r_2;

F_s_1=r_1_d*K; % same spring constant for both springs
F_s_2=r_2_d*K;

t_s_1=F_s_1*(d*sin(a+theta_2)/r_1_t)*(l_d+x);
t_s_2=F_s_2*(d*sin(a+theta_2)/r_2_t)*(l_d+x);

t_s=t_s_1+t_s_2; % total torque

F_2=t_s/L_2;
%%
d = 1;
l_d = 1;
x = 0.2;
a = deg2rad(30);
% ang=1:1:60;
% theta_2 = deg2rad(ang);
K = 5;

ang=1:1:60;
r1=zeros(length(60),1);
r2=zeros(length(60),1);
for i=1:1:60
    theta_2=deg2rad(i);
    r1(i)=vpa(subs(r_1_d));
    r2(i)=vpa(subs(r_2_d));
end
%%
plot(ang,r1);
hold on
plot(ang,r2);