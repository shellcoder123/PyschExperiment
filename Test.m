% set up the screen
PsychDebugWindowConfiguration(0,0.5);              %for debugging mode transparent screen
screenNumber = max(Screen('Screens'));              % Select the relevant screen
[expinfo.w, expinfo.wrect] = Screen('OpenWindow', screenNumber, [128 128 128],[],[],[],[], [], 1);
expinfo.taskLayout = Screen('OpenOffScreenWindow', screenNumber, [128 128 128],[],[],[],4);
expinfo.taskLayout2 = Screen('OpenOffScreenWindow', screenNumber, [128 128 128],[],[],[],4);
expinfo.wOff = Screen('OpenOffScreenWindow', screenNumber, [128 128 128],[],[],[],4);
expinfo.wOff2 = Screen('OpenOffScreenWindow', screenNumber, [128 128 128],[],[],[],4);
expinfo.wOff3 = Screen('OpenOffScreenWindow', screenNumber, [128 128 128],[],[],[],4);
expinfo.wOff4 = Screen('OpenOffScreenWindow', screenNumber, [128 128 128],[],[],[],4);


expinfo.pauseMsg1   = 'VERSCHNAUFPAUSE!';
expinfo.pauseMsg2   = 'Druecken Sie die rechte Pfeiltaste, um fortzufahren';

[expinfo.maxx , expinfo.maxy] = Screen('WindowSize', expinfo.w);            % check resolution
expinfo.x = expinfo.maxx * 0.5;                                             % center of screen in X direction
expinfo.y = expinfo.maxy * 0.5;                                             % center of screen in Y direction

expinfo.background = [255 255 255];                                         % background color


%% Read the list of the words into matlab 
[num,words] = xlsread('WordList.xls');
expinfo.wordList_concrete = words;
wrds_perm = randperm(length(expinfo.wordList_concrete));  %randomizing words and picking the first 8 random ones.
g_words=expinfo.wordList_concrete(wrds_perm);
n_Words= g_words(1:8);
%% Code colors used within the experiment
%expinfo.Colors.white = WhiteIndex(expinfo.window);
expinfo.Colors.white = [255 255 255];
%expinfo.Colors.black = BlackIndex(expinfo.window);
expinfo.Colors.black = [0 0 0];
%expinfo.Colors.grey  = floor((expinfo.Colors.white+expinfo.Colors.black)/2);
expinfo.Colors.grey= [128, 128, 128];
expinfo.Colors.red=[255 0 0];
expinfo.Colors.blue=[0 0 255];
expinfo.Colors.green=[0 255 0];
expinfo.Colors.yellow= [255 255 0];
expinfo.Colors.pink = [255 50 255];
expinfo.Colors.purple   = [255 0 128];
expinfo.Colors.turquoise= [90 190 255];
expinfo.Colors.orange = [255 90 0];
expinfo.Colors.lila   = [138 20 236];
expinfo.Colors.feedbackRed = [225 0 0 ];
expinfo.Colors.ochre = [204 119 34 ]; 

%% General definitions of the display
expinfo.radius = 260;                           % Radius of the imaginary circle to present the memory object
expinfo.radiusP = 1;                            % Probe
expinfo.radi = 60;                              % Radius of the memory objects


expinfo.arrowRadius = 80;                       % Radius of the body of the cue
expinfo.radius3 = 20;                           % Radius for the head of the cue
%expinfo.arrowColor = expinfo.white;             % Color of the spatial cue arrows
expinfo.radi2 = 40;                             % Distance from the center to the arrow
expinfo.objSide = 35;

%% text information
expinfo.textsize = 24;              % Choose a font number (as used in word), but do not enter non-interger values (e.g., 7.5)
expinfo.textfont = 'Times';

expinfo.crossSize = 40;
expinfo.cueCrossSize = 100;
expinfo.textsize2 = 24;
expinfo.textfont = 'Times';

%% Timing - fixed in all trials
expinfo.fixation = 1;                           % a fixation cross duration
expinfo.encoding = 2;                           % duration of the memory array display
expinfo.retention = 1;                          % retention interval                      
expinfo.cueDur = 0.5;                           % duration of the cue

%% Experimental Parameters
expinfo.setSize = 5;
expinfo.extraSets= 3;
expinfo.nLocations = 8; % How many placeholders are there in the set
expinfo.responsesets= 8; %Number of responsesets
% 8 discrete colors
expinfo.eightColors = [expinfo.Colors.red; expinfo.Colors.green; expinfo.Colors.pink; expinfo.Colors.purple; expinfo.Colors.blue; expinfo.Colors.lila; expinfo.Colors.yellow; expinfo.Colors.turquoise];
expinfo.nWords= n_Words(1:expinfo.setSize);

%% General definitions of the display
expinfo.radius = 260;                           % Radius of the imaginary circle to present the memory object
expinfo.radiusP = 1;                            % Probe
expinfo.radi = 60;                              % Radius of the memory objects


expinfo.arrowRadius = 80;                       % Radius of the body of the cue
expinfo.radius3 = 20;                           % Radius for the head of the cue
expinfo.radi2 = 40;                             % Distance from the center to the arrow
expinfo.objSide = 35;

angle(1) = 270;                      % the position of the first item
step = 360/expinfo.nLocations;    
for u = 2:expinfo.nLocations
    angle(u) = angle(u-1) + step;    % defining the circle points by the angles (first point is already fixed by first angle)
end



% % Create the coordinates to draw the memory items (circles)
for j = 1:expinfo.nLocations
    Xvalue = cosd(angle(j))*expinfo.radius + expinfo.x;    %coordinate of the center of the object on the screen
    Yvalue = sind(angle(j))*expinfo.radius + expinfo.y;
    probe.circlevalue(1, j) = Xvalue- expinfo.radi;      % defining the points on the axes for each circle (adding and subtracting the radius to get 4 points per circle)
    probe.circlevalue(2, j) = Yvalue- expinfo.radi;
    probe.circlevalue(3, j) = Xvalue+ expinfo.radi;
    probe.circlevalue(4, j) = Yvalue+ expinfo.radi;
    probe.colrs(1,j)=0;
    probe.colrs (2,j)=0;
    probe.colrs(3,j)= 0;
end


% General definitions of the display
expinfo.radius = 260;                           % Radius of the imaginary circle to present the memory object
expinfo.radiusP = 1;                            % Probe
expinfo.radi = 60;                              % Radius of the memory objects


expinfo.arrowRadius = 80;                       % Radius of the body of the cue
expinfo.radius3 = 20;                           % Radius for the head of the cue
expinfo.radi2 = 40;                             % Distance from the center to the arrow
expinfo.objSide = 35;

angle(1) = 270;                      % the position of the first item
step = 360/expinfo.nLocations;    
for u = 2:expinfo.nLocations
    angle(u) = angle(u-1) + step;    % defining the circle points by the angles (first point is already fixed by first angle)
end



% % Create the coordinates to draw the memory items (circles)
for j = 1:expinfo.nLocations
    Xvalue = cosd(angle(j))*expinfo.radius + expinfo.x;    %coordinate of the center of the object on the screen
    Yvalue = sind(angle(j))*expinfo.radius + expinfo.y;
    probe.circlevalue(1, j) = Xvalue- expinfo.radi;      % defining the points on the axes for each circle (adding and subtracting the radius to get 4 points per circle)
    probe.circlevalue(2, j) = Yvalue- expinfo.radi;
    probe.circlevalue(3, j) = Xvalue+ expinfo.radi;
    probe.circlevalue(4, j) = Yvalue+ expinfo.radi;
    probe.colrs(1,j)=0;
    probe.colrs (2,j)=0;
    probe.colrs(3,j)= 0;
end




%% Locations of response bocxes(options for word and color recall)
%Create locations of N boxes in a row from left to right at the top of the
% % screen

N= 8                                      %Numer of response boxes
expinfo.frame = zeros(1,2);
maxx = expinfo.wrect(3);
maxy = expinfo.wrect(4);
gapx = maxx/200;                          % gap between frames
expinfo.frame(1) = (maxx-(N+1)*gapx)./N;  % frame width: need N+1 gaps (N-1 between N boxes, 1 left, 1 right)
expinfo.frame(2) = maxy/10;               % frame height

XX = gapx + 0.5 * expinfo.frame(1);       % center of first frame to the left
YY = maxy/10 + 0.5 * expinfo.frame(2);    % center of first frame to the left
for box = 1:N
    expinfo.X(box) = XX;
    expinfo.Y(box) = YY;
    XX = XX + gapx + expinfo.frame(1);    % move 1 frame breadth + 1 gap to the left --> center of next frame
end

frame = [0, 0, expinfo.frame];
Rect = zeros(expinfo.responsesets, 4);   % list of rectangles for the frames - each frame is specified by a vector of 4 values

%% Fixation Cross
CenteredText('+', expinfo.w, expinfo.crossSize, expinfo.textfont, expinfo.x, expinfo.y, expinfo.Colors.black, 1);
WaitSecs(expinfo.fixation);
%% Display of memory items
Screen('FillRect', expinfo.taskLayout, expinfo.background); % fills entire screen, effectively wiping it
candidates=randsample(1:8,5);                               % randomize 8 positions and pick only 5

clrs_rand=randperm(numel(expinfo.eightColors));             %randomize the 8 colors
g_randcolors=expinfo.eightColors(clrs_rand);

wrds_perm = randperm(length(expinfo.wordList_concrete));    %randomizing words and picking the 8 random ones.
g_words=expinfo.wordList_concrete(wrds_perm);
n_Words= g_words(1:8);
expinfo.nWords= n_Words(1:expinfo.setSize);

Screen('FrameOval', expinfo.w,  probe.colrs(:,candidates), probe.circlevalue(:,candidates), 5); %display randomly 5  circles

oldStyle=Screen(expinfo.w,'TextStyle',1);           % set the font style to bold
Screen ('TextSize', expinfo.w, expinfo.textsize);   % set text size to words size
Screen ('TextFont', expinfo.w,expinfo.textfont);    % set text font to words 

for pos= candidates                                          %Drawing randomly the five words each on its corresponding location
    XValue=probe.circlevalue(1,pos)+ expinfo.radi2;
    YValue= probe.circlevalue(2,pos)+ expinfo.radi2;
    selcolor= expinfo.eightColors (pos,:);
    Screen('DrawText',expinfo.w, n_Words{pos,1}, XValue,YValue, selcolor);
end


Screen ('Flip', expinfo.w); 
WaitSecs(expinfo.encoding);
Screen('FillRect', expinfo.taskLayout, expinfo.background);
Screen ('Flip', expinfo.w);
WaitSecs(expinfo.retention);
ColorResponse= expinfo.eightColors;

%Memory Test
 WorCue=randsample(candidates,1);
    for Word= WorCue
        Screen('DrawText',expinfo.w, n_Words{Word,1}, expinfo.x, expinfo.y, expinfo.Colors.black); %Selecting randomly from the displayed words one word as a cue
        Screen('Flip', expinfo.w, [], 1); % flips background screen to foreground, without erasing background
        WaitSecs(expinfo.cueDur);
        
            for item = 1:expinfo.responsesets           %For color report recall, present colored frames in the top of the screen
                Rect(item,:) = CenterRectOnPoint(frame, expinfo.X(item), expinfo.Y(item));
                Screen('FillRect', expinfo.w, expinfo.eightColors (item,:), Rect(item,:));
            end
            Screen('Flip', expinfo.w);
            
            

            SetMouse(expinfo.x,expinfo.y);                %Start the mouse cursor in the centre of the screen
            ShowCursor;                                   %Shows the mouse cursor
            xx=0; yy=0; buttons=[0 0];                    %Otherwise there's a delay after the first mouse click
            
            
            %Use the mouse to select the item
            startSecs = GetSecs;
            validpress = 0;
            while validpress==0
                [xx,yy,buttons] = GetMouse(expinfo.w);    % get the mouse coordinates
                if buttons(1)==1                          % if a button was pressed...
                    if xx==0 && yy==0, closeexp(expinfo); % can exit experiment by clicking on upper-left corner
                    end
                    for j=1:expinfo.responsesets           % loop over the response options
                        if  IsInRect(xx, yy, Rect(j,:))    % check whether mouse coordinates are in the frame of the currently considered response option
                            trial.response = ColorResponse(j,:);  % if yes, select the color in that frame as the chosen answer
                            trial.latency = GetSecs - startSecs; %response times
                            validpress=1;
                        end
                    end
                end
            end
            
            %Clear mouse clicks, hide cursor
            while buttons(1) == 1
                [xx,yy,buttons] = GetMouse(expinfo.w);
            end
            HideCursor;
            
            

            Screen('DrawText',expinfo.w, n_Words{Word,1}, expinfo.x, expinfo.y, expinfo.Colors.black); %Draw the same word centrally of the screen
            Screen('Flip', expinfo.w, [], 1); % flips background screen to foreground, without erasing background
            
            
            Screen('FrameOval', expinfo.w,  probe.colrs, probe.circlevalue, 8);%For location recall, present the circels around the cue
            Screen('Flip', expinfo.w);  % flips background screen to foreground
            WaitSecs(3);
    end 
           % % Print Response information into data file
            % fprintf (fid, '%d %d', trial.latency, trial.response); 
