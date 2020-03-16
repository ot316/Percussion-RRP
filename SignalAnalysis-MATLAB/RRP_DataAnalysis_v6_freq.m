clc;
clear all;

% ======================================== Read multiple audio files ========================================

% Close Nodules .WAV
for k = 1:15
    % Create an audio file name, and read the file.
	audionameA1 = ['siliconnoduleclose1_' num2str(k) '.wav'];
    
	if exist(audionameA1, 'file')        
        [A{k},fs_now] = audioread(audionameA1);
        
        dt = 1/fs_now;
        t_A{k} = 0:dt:(length(A{k})*dt)-dt;

    else
		fprintf('File %s does not exist.\n', audionameA1);
    end  
end
for k = 1:16
    % Create an audio file name, and read the file.
	audionameA2 = ['siliconnoduleclose2_' num2str(k) '.wav'];
    
	if exist(audionameA2, 'file')        
        [A{k+15},fs_now] = audioread(audionameA2);
        
        dt = 1/fs_now;
        t_A{k+15} = 0:dt:(length(A{k+15})*dt)-dt;

    else
		fprintf('File %s does not exist.\n', audionameA2);
    end  
end
for k = 1:17
    % Create an audio file name, and read the file.
	audionameA3 = ['siliconnoduleclose3_' num2str(k) '.wav'];
    
	if exist(audionameA3, 'file')        
        [A{k+31},fs_now] = audioread(audionameA3);
        
        dt = 1/fs_now;
        t_A{k+31} = 0:dt:(length(A{k+31})*dt)-dt;

    else
		fprintf('File %s does not exist.\n', audionameA3);
    end  
end

% Far Nodules .WAV
for k = 1:18
    % Create an audio file name, and read the file.
	audionameB1 = ['siliconnodulefar1_' num2str(k) '.wav'];
    
	if exist(audionameB1, 'file')        
        [B{k},fs_now] = audioread(audionameB1);
        
        dt = 1/fs_now;
        t_B{k} = 0:dt:(length(B{k})*dt)-dt;

    else
		fprintf('File %s does not exist.\n', audionameB1);
    end 
end
for k = 1:17
    % Create an audio file name, and read the file.
	audionameB2 = ['siliconnodulefar2_' num2str(k) '.wav'];
    
	if exist(audionameB2, 'file')        
        [B{k+18},fs_now] = audioread(audionameB2);
        
        dt = 1/fs_now;
        t_B{k+18} = 0:dt:(length(B{k+18})*dt)-dt;

    else
		fprintf('File %s does not exist.\n', audionameB2);
    end 
end
for k = 1:16
    % Create an audio file name, and read the file.
	audionameB3 = ['siliconnodulefar3_' num2str(k) '.wav'];
    
	if exist(audionameB3, 'file')        
        [B{k+35},fs_now] = audioread(audionameB3);
        
        dt = 1/fs_now;
        t_B{k+35} = 0:dt:(length(B{k+35})*dt)-dt;

    else
		fprintf('File %s does not exist.\n', audionameB3);
    end 
end

% ======================================== Aligned signals ========================================
[A_rows, A_col] = size(A);
for i = 3:A_col
    figure(1);
    hold on;
    % Each signal has a different time domain. Use dtw to align signals in
    % the Y-axis
    [distA{i}, iA_x{i}, iA_y{i}] = dtw(A{2},A{i});

    % The vectors ix and iy have the same length. Each contains a 
    % monotonically increasing sequence in which the indices to the 
    % elements of the corresponding signal, x or y, are repeated the 
    % necessary number of times.
    
    % The x-axis is time, and y-axis is amplitude
    
    plot(iA_x{i},iA_y{i},'r');
    ylabel('Difference in amplitude');
    xlabel('Time')
    title('Difference between signals')
    
%     figure(2);
%     dtw(A{2},A{i});
end

[B_rows, B_col] = size(B);
for i = 3:B_col
    hold on;
    % Each signal has a different time domain. Use dtw to align signals in
    % the Y-axis
    [distB{i}, iB_x{i}, iB_y{i}] = dtw(B{2},B{i});
    
    % The vectors ix and iy have the same length. Each contains a 
    % monotonically increasing sequence in which the indices to the 
    % elements of the corresponding signal, x or y, are repeated the 
    % necessary number of times.
    
    % The x-axis is time, and y-axis is amplitude
    
    plot(iB_x{i},iB_y{i},'b');
    ylabel('Difference in amplitude');
    xlabel('Time')
    title('Difference between signals')
    
%     figure(2);
%     dtw(A{2},A{i});
end

% ======================================== Average of aligned signals ========================================
% This is the average signal for all A functions. However, real frequencies
% are lost.
%[wrow, wcol] = size(iA_x);
new_time = [1:8983];     % create your array

for i = 3:A_col
    curr_iAx = iA_x{i};
    WarpPath_A = A{curr_iAx}; %i,curr_iAx
    
    figure(2);
    plot(new_time,WarpPath_A,'b');
    
    legend('Avg. Signal')
    xlabel('Sample Time(unitless)');
    ylabel('Amplitude');
    title('Average of aligned signals');
end

%% See how the aligning tool works
figure(3);
dtw(A{2},A{35});

%% ======================================== Smoothening: S-Golay Filtering ========================================
% ------------------------------------------------------ A
figure(4);
for i = 1:A_col
    % Smaller framerates and higher orders = really accurate
    % Big framelengths and low orders = smoothens more
    % SGolay O-3, FL-41
    SG_order = 3;
    SG_framelen = 41;
    sgf_A{i} = sgolayfilt(A{i},SG_order,SG_framelen);
end

i = 35;
%subplot(2,1,1)
plot(t_A{i},A{i})
hold on
plot(t_A{i},sgf_A{i})
hold off

legend('signal','sgolay order 3, fl 41')
xlabel('Sample(time)');
ylabel('Amplitude');
title('S-Golay Filtering A');

% ------------------------------------------------------ B
figure(5);
for i = 1:B_col
    % Smaller framerates and higher orders = really accurate
    % Big framelengths and low orders = smoothens more
    % SGolay O-3, FL-41
    SG_order = 3;
    SG_framelen = 41;
    sgf_B{i} = sgolayfilt(B{i},SG_order,SG_framelen);
end

i = 35;
%subplot(2,1,1)
plot(t_B{i},B{i})
hold on
plot(t_B{i},sgf_B{i})
hold off

legend('signal','sgolay order 3, fl 41')
xlabel('Sample(time)');
ylabel('Amplitude');
title('S-Golay Filtering B');

% % SGolay O-7, FL-13
% subplot(2,1,2)
% SG_order = 7;
% SG_framelen = 13;
% sgf_A = sgolayfilt(A{i},SG_order,SG_framelen);
% 
% plot(t_A{i},A{i})
% hold on
% plot(t_A{i},sgf_A)
% 
% legend('signal','sgolay order 7, fl 13')
% xlabel('Sample(time)');
% ylabel('Amplitude')
% title('S-Golay Filtering')

% It seems like S-Golay is not able to smooth the signal as much as we'd
% like. This is expected as it is more effective at preserving high frequency 
% signal components but less successful at rejecting noise. This is OK.

%% ======================================== Spectogram ========================================
% figure(5);
% for m = 45
%     [s,w,t,ps,fc,tc] = spectrogram(sgf_A{m});
%     spectrogram(sgf_A{m},'yaxis');
% end

%% ============================== CWT Coefficients - 1D Continuous Wavelet Transform ===============================
% ------------------------------------------------------- A
figure(6);
m=23;
%Continuous wavelet transform up to 500 scale levels (analogous to
%frequency levels) using DB10 wavelet. The x-axis is time, and y-axis is
%frequency. Higher the scale, lower the frequency. The color map is the
%intensity of a particular frequency at a given time.
CWTcoeffs_A = cwt(sgf_A{m},5:5:500,'sym10','plot');     %cwt for continuous 1D wavelet transform
colormap jet; 
colorbar;

title('Matrix A - Close Nodule')
xlabel('Sample (time)','fontsize',16);
ylabel('Scale level (Inverse of frequency)','fontsize',16)

% ------------------------------------------------------- B
figure(7);
for m = 1:
chopB = sgf_B{m};
CWTcoeffs_B = cwt(sgf_B{m},5:5:500,'sym10','plot');     %cwt for continuous 1D wavelet transform
colormap jet; 
colorbar;

title('Matrix B - Far Nodule')
xlabel('Sample (time)','fontsize',16);
ylabel('Scale level (Inverse of frequency)','fontsize',16)

%Same in 3D
% ------------------------------------------------------- A
figure(8);
surf(CWTcoeffs_A); 
colormap jet;
colorbar;

shading('interp'); view(-30,10);
xlabel('Sample (time)','fontsize',16);
ylabel('Scale level (Inverse of frequency)','fontsize',16)
zlabel('Intensity (coefficients)')

% ------------------------------------------------------- B
figure();
surf(CWTcoeffs_B); 
colormap jet;
colorbar;

shading('interp'); view(-30,10);
xlabel('Sample (time)','fontsize',16);
ylabel('Scale level (Inverse of frequency)','fontsize',16)
zlabel('Intensity (coefficients)')
