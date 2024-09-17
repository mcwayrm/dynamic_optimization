%y(2): harvest, y(1): stock
%Parameter Values
 
a=20; 
b=1;
c=0.5;
d=.002;
r=.1;
%Define the differential equation system
%X ̇=cX-dX^2-h,h ̇=-h(r-c+2*d*X)
f=@(t,y)[c*y(1)-d*y(1)^2-y(2);-y(2)*(r-c+2*d*y(1)) ]
%Create the vector field, showing the strength of movement of %each variable.  The length of the vector shows how far the %system goes in a given amount of time.
vectfieldn(f,0:5:250,0:5:45)
%Create the X ̇=0 isocline.  The levels of harvest for which %stock doesn’t change.
y1=0:1:250
xisocline=c*y1-d*y1.^2
%Graph trajectories and isoclines on the same figure with “hold”
%Solve the function above multiple times.  Starting value for %harvest from 15 to 50.  Starting value for stock is 125.  Time %horizon from 1 to 30. Can change all of these.
% hold on
% for y20=0:2:24
%     [ts,ys]=ode45(f,[1,7],[80;y20]);
%     plot(ys(:,1),ys(:,2),'LineWidth',2)
% end
hold on
for y20=0:2:40
    [ts,ys]=ode45(f,[1,8],[120;y20]);
    plot(ys(:,1),ys(:,2),'LineWidth',2)
end
%Plot both isoclines on the figure.  
 
plot(y1,xisocline,'k','LineWidth',2)
line([(c-r)/(2*d) (c-r)/(2*d)],[0 45],'LineStyle','-','LineWidth',2,'Color','k')
hold off