% ================== Plotting saccade amplitude ========================== 
% Witten by: Daniel S asfaw 
% Any problems or queries e-mail me: daniel.asfaw@city.ac.uk
% ========================================================================

% initialise
close all;
clear all; %#ok
clc;

% path to preprocessed csv files
path = fullfile('..','Data','Gaze','Processed','Glaucoma');

% get files
CSV_files = dir(fullfile(path, '*.csv'));
nFile = length(CSV_files);

% for a random 4 participants, plot the distribution of saccades for each
% video
[~,idx] = sort(rand(1,nFile));
figure();
nToPlot = 3;
for i = 1:nToPlot
    % read the csv file
    fn = fullfile(path, CSV_files(idx(i)).name);
    fprintf('Reading %s..\n', fn)
    fileID = fopen(fn);
    C = textscan(fileID,'%s %s %s %s %s %s %s %s %s %s %s %s  ', 'delimiter',',');

    % extract the trials
    Trials = char(C{1,2}(1:end));
    
    % find the index of the start and end of the three conditions    
    [idx_1] = find(ismember(Trials,  'DadsArmy', 'rows'));
    [idx_2] = find(ismember(Trials,  'HistoryBoys', 'rows'));
    [idx_3] = find(ismember(Trials,  'SkiCross', 'rows'));    
    
    % Find the saccade amplitude for each trial
    Amp1 = str2num( char(C{1,11}(idx_1(:) ) ) ) ; 
    Amp2 = str2num( char(C{1,11}(idx_2(:) ) ) ) ;
    Amp3 = str2num( char(C{1,11}(idx_3(:) ) ) ) ;
    
    %Plot the histogram of amplitudes
    subplot(nToPlot, 3, (i-1)*3+1);
    histogram(Amp1,50);
    set(gca, 'XLim',[0 40], 'YLim',[0 200]);
    title(sprintf('DadsArmy; ID=%i', idx(i)));
    ylabel('Count');
    
    subplot(nToPlot, 3, (i-1)*3+2);
    histogram(Amp2,50);
    set(gca, 'XLim',[0 40], 'YLim',[0 200]);
    title(sprintf('HistoryBoys; ID=%i', idx(i)));
    if i==nToPlot, xlabel('Saccade amplitude'), end
    
    subplot(nToPlot, 3, (i-1)*3+3);
    histogram(Amp3,50);
    set(gca, 'XLim',[0 40], 'YLim',[0 200]);
    title(sprintf('SkiCross; ID=%i', idx(i)));  
end

%% save figure
saveas(gcf,'Saccade_amplitude.png')