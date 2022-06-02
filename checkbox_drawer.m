function checkbox_drawer
clc; clear

global DRAW_SIGNAL DRAW_MESURE DRAW_BEANFORMING DRAW_FONCTION_DIRECTIVITE DRAW_FILTRAGE ADD_NOISE

% Create figure
h.f = figure('units','pixels','position',[200,600,200,200],...
             'toolbar','none','menu','none');
% Create yes/no checkboxes
h.c(1) = uicontrol('style','checkbox','units','pixels',...
                'position',[10,180,150,15],'string','Draw Signal');
h.c(2) = uicontrol('style','checkbox','units','pixels',...
                'position',[10,150,150,15],'string','Draw Mesures');    
h.c(3) = uicontrol('style','checkbox','units','pixels',...
                'position',[10,120,150,15],'string','Draw Beanforming');   
h.c(4) = uicontrol('style','checkbox','units','pixels',...
                'position',[10,90,150,15],'string','Draw fonction directivité'); 
h.c(5) = uicontrol('style','checkbox','units','pixels',...
                'position',[10,60,150,15],'string','Draw filtrage'); 
h.c(6) = uicontrol('style','checkbox','units','pixels',...
                'position',[10,30,150,15],'string','Add noise'); 
h.c(7) = uicontrol('style','checkbox','units','pixels',...
                'position',[10,5,150,15],'string','All options'); 
% Create OK pushbutton   
h.p = uicontrol('style','pushbutton','units','pixels',...
                'position',[100,5,70,20],'string','OK',...
                'callback',@p_call);
    % Pushbutton callback
    function p_call(varargin)
        vals = get(h.c,'Value');
        checked = find([vals{:}]);
        if isempty(checked)
            checked = 'none';
        end
        DRAW_SIGNAL = 0;
        DRAW_MESURE = 0;
        DRAW_BEANFORMING = 0;
        DRAW_FONCTION_DIRECTIVITE = 0;
        DRAW_FILTRAGE = 0;
        ADD_NOISE = 0;
        
        for checkedDraw = checked
           if checkedDraw == 1
               DRAW_SIGNAL = 1;
           elseif checkedDraw == 2
               DRAW_MESURE = 1;
           elseif checkedDraw == 3
               DRAW_BEANFORMING = 1;
           elseif checkedDraw == 4
               DRAW_FONCTION_DIRECTIVITE = 1;
           elseif checkedDraw == 5
               DRAW_FILTRAGE = 1;
           elseif checkedDraw == 6
               ADD_NOISE = 1;
           elseif checkedDraw == 7
               DRAW_SIGNAL = 1;
               DRAW_MESURE = 1;
               DRAW_BEANFORMING = 1;
               DRAW_FONCTION_DIRECTIVITE = 1;
               DRAW_FILTRAGE = 1;
               ADD_NOISE = 1;
           end
        end
%         disp(DRAW_SIGNAL)
%         disp(DRAW_MESURE)
%         disp(DRAW_BEANFORMING)
%         disp(DRAW_FONCTION_DIRECTIVITE)
%         disp(DRAW_FILTRAGE)
%         disp(ADD_NOISE)
        
        close()
    end
end