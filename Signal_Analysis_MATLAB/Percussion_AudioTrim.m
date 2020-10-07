%========================================================
%== Run this code to automatically split an audio file ==
%==                 V1 - Feb 29, 2020                  ==
%========================================================

% When using this file, you should only have to change the following
% values:
%   - audiofile
%   - Value for 'MinPeakDistance' (default 0.2 or 0.15)
%   - Value for 'MinPeakProminence' (default 0.001 or 0.009)
%   - margin_end (how much from the back you want to trim - default = 1200)
%
% Always check Figure 5 at any time to see whether the operation ran smoothly

%% Plot original audio signal
% Import file
audiofile = 'Nodule_taps_short.wav';
[A,fs] = audioread(audiofile);  

dt = 1/fs;
t = 0:dt:(length(A)*dt)-dt;
    
figure(1);
%The x-axis is time, and y-axis is amplitude
plot(t,A);
xlabel('Sample(time)');
ylabel('Amplitude')
title('Signal Amplitude')

%% Smoothening: S-Golay Filtering
figure(2);

% SGolay O-3, FL-11
SG_order = 3;
SG_framelen = 11;
sgf = sgolayfilt(A,SG_order,SG_framelen);

subplot(3,1,1)
plot(t,A)
hold on
plot(t,sgf)

legend('signal','sgolay order 3, fl 11')
xlabel('Sample(time)');
ylabel('Amplitude')
title('S-Golay Filtering')

% SGolay O-9, FL-21
subplot(3,1,2)
SG_order = 9;
SG_framelen = 21;
sgf = sgolayfilt(A,SG_order,SG_framelen);

plot(t,A)
hold on
plot(t,sgf)

legend('signal','sgolay order 7, fl 21')
xlabel('Sample(time)');
ylabel('Amplitude')
title('S-Golay Filtering')

% SGolay O-7, FL-21
subplot(3,1,3)
SG_order = 9;
SG_framelen = 13;
sgf = sgolayfilt(A,SG_order,SG_framelen);

plot(t,A)
hold on
plot(t,sgf)

legend('signal','sgolay order 9, fl 13')
xlabel('Sample(time)');
ylabel('Amplitude')
title('S-Golay Filtering')

% It seems like S-Golay is not able to smooth the signal as much as we'd
% like. This is expected as more effective at preserving high frequency 
% signal components but less successful at rejecting noise

% Therefore, we will use wavedec for smoothening the signal

%% Smoothening: 1-D Wavelet Decomposition

%We can decompose the signal to different levels of noise filtering.
n = 7; %Number of decomposition levels

% Here A is the vector,n is the decompression levels you want, the third is the wave family. 
% Current one is db8. db8 creates a smoother signal than db10.
[C1,L1] = wavedec(A,n,'db8');

%Then wenergy gives the percentage value which corresponds to the 
%decompression level plus the energy values which corresponds to the decomposition levels.  
[Ea1,Ed1] = wenergy(C1,L1);
% Ea1 is the percentage of energy of the approximation, and Ed1 is the
% percentage energy vector of details

%%%%% Reconstruction
%%%%%%%%%%%%%%%%%%%%%%%%
A3 = wrcoef('a',C1,L1,'db8',n);

% Plots all levels of noise filtering
figure(3);

[C1,L1] = wavedec(A,n,'db8'); %Decompose to n levels using the db8 wavelet
[Ea1,Ed1] = wenergy(C1,L1);% Looks at the energy proportions represented by each decomposition level

for i = 1:n
subplot(1,n,i)
sth = wrcoef('a',C1,L1,'db8',i); %Reconstruction of the i-th level
%%'a' for approximation and 'd' for detail reconstruction
plot(A,'k-','linewidth',3);hold on;plot(sth,'r-','linewidth',3);
legend('Original','Filtered')
xlabel('Sample(time)','fontsize',16)
ylabel('Amplitude','fontsize',16)
title(['Level - ', num2str(i)]);
set(gca,'fontsize',16)
end

% Only plot the last level of noise filtering
figure(4);
[C1,L1] = wavedec(A,n,'db8'); %Decompose to n levels using the db8 wavelet
[Ea1,Ed1] = wenergy(C1,L1);% Looks at the energy proportions represented by each decomposition level

for i = 1:n
sth = wrcoef('a',C1,L1,'db8',i); %Reconstruction of the i-th level
%%'a' for approximation and 'd' for detail reconstruction
end

plot(A,'k-','linewidth',1);hold on;plot(sth,'b-','linewidth',3);
legend('Original','Filtered')
xlabel('Sample','fontsize',16)
ylabel('Amplitude','fontsize',16)
title(['Level - ', num2str(i)]);
set(gca,'fontsize',16)

%% Find the peaks in the signal
figure(5);
[pks, locs] = findpeaks(sth,t,'MinPeakDistance',0.7,'MinPeakProminence',0.009); % Find prominent peaks

findpeaks(sth,t,'MinPeakDistance',0.7,'MinPeakProminence',0.009,'Annotate','extents','WidthReference','halfheight') %Plot peaks
text(locs+.02,pks,num2str((1:numel(pks))')) % Label them

xlabel('Sample(time)');
ylabel('Amplitude')
title('Local Maximas in Smoothened Function')

%% Save selected frames in signal
% The following line saves only the selected time frame
[npks, col] = size(pks); % Number of local maximas

ntimestamps = size(t);
lasttime = t(ntimestamps);

trim_times = [locs, lasttime]; %Array of timestamps of interest for trimming

[filepath,name,ext] = fileparts(audiofile); % Get the name of the file

for k = 1:npks-1
    new_name = [name,'_',num2str(k),'.wav'];
    
    % Calculate different frames of percussion
    start_idx = find(t==trim_times(k));
    end_idx = find(t==trim_times(k+1));
    
    % We don't want to trim starting or ending from local maximas, but before that
    margin_end = 1998;
    
    margin_start_idx = round(start_idx - 100);
    margin_end_idx = round(end_idx - margin_end);
    
    current_trim_times = t(margin_start_idx : margin_end_idx);
    current_trim_amplitudes = A(margin_start_idx : margin_end_idx);
    % Note: We are saving the unfiltered (original) amplitudes

    % Create new audio files trimmed to percussion frames
    audiowrite(new_name,current_trim_amplitudes,fs);
    
    figure();
	plot(current_trim_times,current_trim_amplitudes);
	xlabel('Sample(time)');
	ylabel('Amplitude');
    plot_title = ['Trimmed frame of percussion - n=',num2str(k)];
    title(plot_title);
end

% Plot only last frame of percussion to check
% figure(7);
% plot(current_trim_times,current_trim_amplitudes);
% xlabel('Sample(time)');
% ylabel('Amplitude')
% title('Last trimmed frame of percussion')
        