PsychJavaTrouble();         % makes sure to load the java functions to avoid problems during the experiment
clear all; % Start the experiment with empty workspace
clc; % Clear command window
 
PsychDebugWindowConfiguration(0,0.5);               %for debugging mode transparent screen
%expinfo.debug = 1;   % set to 1 if you want to run the code in debug mode (small display window), set to 0 for running experiment for real (full-screen display)
 
AssertOpenGL;                                       % Make sure we are running PTB3
%HideCursor;     % hides the cursor
 
% Create Folder for BackUp Files if it does not exist
if ~exist('DataFiles', 'dir')
    mkdir DataFiles
end
 
% add patch to the folders containing functions, instructions and trials
addpath('functions', 'instructions', 'trials');
seed = 18847;
PsychDebugWindowConfiguration(0,0.5);              %for debugging mode transparent screen
screenNumber = max(Screen('Screens'));              % Select the relevant screen
[expinfo.w, expinfo.wrect] = Screen('OpenWindow', screenNumber, [128 128 128],[0 0 800 600],[],[],[], [], 1);
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


%% Code colors used within the experiment

expinfo.Colors.white = [255 255 255];
expinfo.Colors.black = [0 0 0];

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
expinfo.radi2 = 50;                             % Distance from the center to the arrow
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
 
%%Parameters
expinfo.setSize = 5; 
expinfo.extraSets= 3;
expinfo.nLocations = 8; % How many placeholders are there in the set
expinfo.responsesets= 8; %Number of responsesets
% 8 discrete colors
expinfo.eightColors = [expinfo.Colors.red; expinfo.Colors.green; expinfo.Colors.pink; expinfo.Colors.purple; expinfo.Colors.blue; expinfo.Colors.lila; expinfo.Colors.yellow; expinfo.Colors.turquoise];
wrds_perm = randperm(length(expinfo.wordList_concrete));  %randomizing words and picking the first 8 random ones.
g_words=expinfo.wordList_concrete(wrds_perm);
n_Words= g_words(1:8);
expinfo.nWords= n_Words(1:expinfo.setSize);

expinfo.TestingCon = {'Testing1' 'Testing2'};
expinfo.TestingFactor = 1:length(expinfo.TestingCon);
expinfo.CueCondition = {'word' 'location' 'color'};
expinfo.CueCondFactor = 1:length(expinfo.CueCondition);
expinfo.WordsSel= randsample (n_Words,5); 
expinfo.WordSlFactor = 1:length(expinfo.WordsSel);
 
%% Specify Response Keys used in the experiment
expinfo.LeftKey = 'LeftArrow';
expinfo.RightKey = 'RightArrow';
expinfo.AbortKey = 'F12';

expinfo.ListGen = 'FullRandom';
%% Defining trials to be conducted
% Specify how many practice trials should be conducted
expinfo.nPracTrials = 10;

% Specify how many Trials in each cell of the experimental design should be
% conducted
expinfo.Trial2Cond = 10;
 
% get Trial Configurations of all experimental conditions
[WordList, TestingConList, CueConList] = BalanceFactors(expinfo.Trial2Cond, 0,expinfo.WordSlFactor, expinfo.TestingFactor, expinfo.CueCondFactor);
expinfo.TrialConfigurations = horzcat(WordList, TestingConList, CueConList);
 % Number of total Trials to be conducted
expinfo.nExpTrials = size(expinfo.TrialConfigurations,1);

expinfo.Trials2Pause = floor(expinfo.nExpTrials*0.20);

expinfo.Stimuli=expinfo.WordsSel; 
isPractice = 0; % Local variable specifying that we are running practice trials
 
% Generate a TrialList for the experimental trials
ExpTrials = MakeTrial(expinfo,isPractice); % function that sets up the trial
 

%% SETUP CODE 
%% Set up the memory array
 
angle(1) = 270;         % the position of the first item
step = 360/expinfo.nLocations;       


for u = 2:expinfo.nLocations
    angle(u) = angle(u-1) + step;    % defining the circle points by the angles (first point is already fixed by first angle)


end

candidates=randsample(1:8,5);          %randomize 8 and pick only 5

% Create the coordinates to draw the memory items (circles)
for j = 1:expinfo.nLocations
    Xvalue = cosd(angle(j))*expinfo.radius + expinfo.x; % coordinate of the center of the object on the screen
    Yvalue = sind(angle(j))*expinfo.radius + expinfo.y;
    probe.circlevalue(1, j) = Xvalue- expinfo.radi;      % defining the points on the axes for each circle (adding and subtracting the radius to get 4 points per circle)
    probe.circlevalue(2, j) = Yvalue- expinfo.radi;
    probe.circlevalue(3, j) = Xvalue+ expinfo.radi;
    probe.circlevalue(4, j) = Yvalue+ expinfo.radi;  
    probe.colrs(1,j)=0;
    probe.colrs (2,j)=0;
    probe.colrs(3,j)= 0;
end


%% Screen 1
CenteredText('+', expinfo.w, expinfo.crossSize, expinfo.textfont, expinfo.x, expinfo.y, expinfo.Colors.black, 1);   
WaitSecs(1); % last one second 


%%  Screen 2 
Screen('FrameOval', expinfo.w,  probe.colrs(:,candidates), probe.circlevalue(:,candidates), 5); %display 5 random circles
 
Screen ('TextSize', expinfo.w, expinfo.textsize);
Screen ('TextFont', expinfo.w,expinfo.textfont);
 
for pos= candidates %Drawing the stimuli by randomizing them and pick the random five
    XValue=probe.circlevalue(1,pos)+ expinfo.radi2
    YValue= probe.circlevalue(2,pos)+ expinfo.radi2
    selcolor= expinfo.eightColors (pos,:)
    Screen('DrawText',expinfo.w, n_Words{pos,1}, XValue,YValue, selcolor)
end
Screen ('Flip', expinfo.w);
WaitSecs(2); % last two seconds

%% Screen 3
Screen('FillRect', expinfo.taskLayout, expinfo.background);
Screen ('Flip', expinfo.w);
WaitSecs(1); % last one seconds 

%% Screen 4
%%Word Cue Condition
%Select randomly from the eight words one as a word cue  
WorCue=randsample(1:8,1)   
%% for Word= WorCue %Selecting randomly one word from 
Screen('DrawText',expinfo.w, n_Words{WorCue,1}, expinfo.x, expinfo.y, expinfo.Colors.black)
Screen('Flip', expinfo.w,[], 1);

WaitSecs(0.5);
N= 8             %Numer of response boxes
expinfo.frame = zeros(1,2);
maxx = expinfo.wrect(3);
maxy = expinfo.wrect(4); 
gapx = maxx/200;                          % gap between frames 
expinfo.frame(1) = (maxx-(N+1)*gapx)./N;  % frame width: need N+1 gaps (N-1 between N boxes, 1 left, 1 right)
expinfo.frame(2) = maxy/10;               % frame height
 
XX = gapx + 0.5 * expinfo.frame(1);   % center of first frame to the left
YY = maxy/10 + 0.5 * expinfo.frame(2); % center of first frame to the left 
for box = 1:N
    expinfo.X(box) = XX;
    expinfo.Y(box) = YY;
    XX = XX + gapx + expinfo.frame(1);  % move 1 frame breadth + 1 gap to the left --> center of next frame
end

frame = [0, 0, expinfo.frame]; 
Rect = zeros(expinfo.responsesets, 4); % list of rectangles for the frames - each frame is specified by a vector of 4 values
 
 
 frame = [0, 0, expinfo.frame]; 
 Rect = zeros(expinfo.responsesets, 4); % list of rectangles for the frames - each frame is specified by a vector of 4 values
for item = 1:expinfo.responsesets
Rect(item,:) = CenterRectOnPoint(frame, expinfo.X(item), expinfo.Y(item)); 
Screen('FillRect', expinfo.w, expinfo.eightColors (item,:), Rect(item,:));    
end
    
Screen('Flip', expinfo.w);

Screen('Close', expinfo.w);
