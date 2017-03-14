clear all
close all
endVal = 1;
leftEdge = 40;
sliderSpacing = 50;
sliderHeight = 15;
sliderWidth = 500;

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
%position(n1, n2, n3, n4)
% n1 - x pos
% n2 - y pos
% n3 - width
% n4 - vertical size of bar
p1x = uicontrol('Parent',controlPanel,'Style','slider',...
                'Position',[leftEdge,5.5*sliderSpacing,sliderWidth,sliderHeight],...
                'value',endVal, 'min',.1, 'max',1.5); 
p1y = uicontrol('Parent',controlPanel,'Style','slider',...
                'Position',[leftEdge,5*sliderSpacing,sliderWidth,sliderHeight],...
                'value',endVal, 'min',.1, 'max',1.5); 

xpos = [40 15 15];

addBarTitles(xpos,sliderSpacing,sliderWidth,sliderHeight,'P1',5,controlPanel);
% p1title = uicontrol('Parent',controlPanel,'Style','text','Position',[40,5.9*sliderSpacing,sliderWidth,sliderHeight],...
%               'string','P1');
% p1xTitle = uicontrol('Parent',controlPanel,'Style','text','Position',[15,5.5*sliderSpacing,20,sliderHeight],...
%               'string','X');          
% p1yTitle = uicontrol('Parent',controlPanel,'Style','text','Position',[15,5*sliderSpacing,20,sliderHeight],...
%               'string','Y');                    
          
p2x = uicontrol('Parent',controlPanel,'Style','slider',...
                'Position',[leftEdge,3.5*sliderSpacing,sliderWidth,sliderHeight],...
                'value',endVal, 'min',.5, 'max',1.5); 
p2y = uicontrol('Parent',controlPanel,'Style','slider',...
                'Position',[leftEdge,3*sliderSpacing,sliderWidth,sliderHeight],...
                'value',endVal, 'min',.5, 'max',1.5); 
p2title = uicontrol('Parent',controlPanel,'Style','text','Position',[40,3.9*sliderSpacing,sliderWidth,sliderHeight],...
              'string','P2');
p2xTitle = uicontrol('Parent',controlPanel,'Style','text','Position',[15,3.5*sliderSpacing,20,sliderHeight],...
              'string','X');          
p2yTitle = uicontrol('Parent',controlPanel,'Style','text','Position',[15,3*sliderSpacing,20,sliderHeight],...
              'string','Y');          
          
p3x = uicontrol('Parent',controlPanel,'Style','slider',...
                'Position',[leftEdge,1.5*sliderSpacing,sliderWidth,sliderHeight],...
                'value',endVal, 'min',.5, 'max',1.5); 
p3y = uicontrol('Parent',controlPanel,'Style','slider',...
                'Position',[leftEdge,sliderSpacing,sliderWidth,sliderHeight],...
                'value',endVal, 'min',.5, 'max',1.5);
p3title = uicontrol('Parent',controlPanel,'Style','text','Position',[40,1.9*sliderSpacing,sliderWidth,sliderHeight],...
              'string','P3');          
p3xTitle = uicontrol('Parent',controlPanel,'Style','text','Position',[15,1.5*sliderSpacing,20,sliderHeight],...
              'string','X');          
p3yTitle = uicontrol('Parent',controlPanel,'Style','text','Position',[15,sliderSpacing,20,sliderHeight],...
              'string','Y');          

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






