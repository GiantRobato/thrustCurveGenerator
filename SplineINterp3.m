clear all
close all
endVal = 1;
leftEdge = 40;
sliderSpacing = 50;
sliderHeight = 15;
sliderWidth = 500;
xpos = [40 15 15]; %used for positioning slider titles

global x;
global y;
y = [.11 .98 endVal]; %start and end
x = [.1 .9 1];%location of spline points

xx = linspace(0,1,101);
cs = spline([0 x],[0 y], xx); %interpolated values
f = figure('name','curve');
plot(x,y,'o',xx,cs);
axis([0,1.2,0,2]);
controlPanel = figure('name','control panel');

p1x = uicontrol('Parent',controlPanel,'Style','slider',...
                'Position',[leftEdge,5.5*sliderSpacing,sliderWidth,sliderHeight],...
                'value',endVal, 'min',.1, 'max',1.5); 
p1y = uicontrol('Parent',controlPanel,'Style','slider',...
                'Position',[leftEdge,5*sliderSpacing,sliderWidth,sliderHeight],...
                'value',endVal, 'min',.1, 'max',1.5); 

addBarTitles(xpos,sliderSpacing,sliderWidth,sliderHeight,'P1',5,controlPanel);
          
p2x = uicontrol('Parent',controlPanel,'Style','slider',...
                'Position',[leftEdge,3.5*sliderSpacing,sliderWidth,sliderHeight],...
                'value',endVal, 'min',.5, 'max',1.5); 
p2y = uicontrol('Parent',controlPanel,'Style','slider',...
                'Position',[leftEdge,3*sliderSpacing,sliderWidth,sliderHeight],...
                'value',endVal, 'min',.5, 'max',1.5); 

addBarTitles(xpos,sliderSpacing,sliderWidth,sliderHeight,'P2',3,controlPanel);
          
p3x = uicontrol('Parent',controlPanel,'Style','slider',...
                'Position',[leftEdge,1.5*sliderSpacing,sliderWidth,sliderHeight],...
                'value',endVal, 'min',.5, 'max',1.5); 
p3y = uicontrol('Parent',controlPanel,'Style','slider',...
                'Position',[leftEdge,sliderSpacing,sliderWidth,sliderHeight],...
                'value',endVal, 'min',.5, 'max',1.5);
            
addBarTitles(xpos,sliderSpacing,sliderWidth,sliderHeight,'P3',1,controlPanel);
%The below uses es and ed which are automatically sent as inputs for the
%feedback in addition to any extra data (like f in this case). 
%p3y.Callback = @(es,ed) newCurve(f,es); 
p1y.Callback = @(es,ed) newCurveV4(f,es,'Y',1); 
p1x.Callback = @(es,ed) newCurveV4(f,es,'X',1); 
p2y.Callback = @(es,ed) newCurveV4(f,es,'Y',2); 
p2x.Callback = @(es,ed) newCurveV4(f,es,'X',2); 
p3y.Callback = @(es,ed) newCurveV4(f,es,'Y',3); 
p3x.Callback = @(es,ed) newCurveV4(f,es,'X',3); 
%fig2plotly(gcf,'offline',true);






