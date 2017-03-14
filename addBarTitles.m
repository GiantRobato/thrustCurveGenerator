function addBarTitles(x,y,width,height,name,offset,controlPanel)

uicontrol('Parent',controlPanel,'Style','text',...
    'Position',[x(1),(offset+.9)*y,width,height],...
    'string',name);
uicontrol('Parent',controlPanel,'Style','text',...
    'Position',[x(2),(offset+.5)*y,20,height],...
    'string','X');          
uicontrol('Parent',controlPanel,'Style','text',...
    'Position',[x(3),offset*y,20,height],...
    'string','Y');                    

end