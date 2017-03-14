function out = newCurveV4(f,es,whichAxis,pointNum)

global x;
global y;

if(whichAxis == 'X')
    x(pointNum) = es.Value;
else
    y(pointNum) = es.Value;
end

figure(f);
xx = linspace(0,x(end),101);
cs = spline([0 x],[0 y], xx); %interpolated values
plot(x,y,'o',xx,cs);
axis([0 1.2 0 2]);

end