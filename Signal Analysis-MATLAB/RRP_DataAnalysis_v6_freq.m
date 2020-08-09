clc;
clear all;

% ======================================== Read multiple audio files ========================================

% Close Nodules .WAV
for k = 1:15
    % Create an audio file name, and read the file.
	audionameA1 = ['./siliconnoduleclose1_' num2str(k) '.wav'];
    
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

%% Till heree

% SGolay O-7, FL-13
subplot(2,1,2)
SG_order = 7;
SG_framelen = 13;
sgf_A = sgolayfilt(A{i},SG_order,SG_framelen);

plot(t_A{i},A{i})
hold on
plot(t_A{i},sgf_A)

legend('signal','sgolay order 7, fl 13')
xlabel('Sample(time)');
ylabel('Amplitude')
title('S-Golay Filtering')

% %It seems like S-Golay is not able to smooth the signal as much as we'd
% like. This is expected as it is more effective at preserving high frequency 
% signal components but less successful at rejecting noise. This is OK.

% From here
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
CWTcoeffs_B = cwt(sgf_B{m},5:5:500,'sym10','plot');     %cwt for continuous 1D wavelet transform
colormap jet; 
colorbar;

title('Matrix B - Far Nodule')
xlabel('Sample (time)','fontsize',16);
ylabel('Scale level (Inverse of frequency)','fontsize',16)

% ============================== CWT Coefficients - Analysis ===============================
% ------------------------------------------------------- A
%Continuous wavelet transform up to 500 scale levels (analogous to
%frequency levels) using DB10 wavelet. The x-axis is time, and y-axis is
%frequency. Higher the scale, lower the frequency. The color map is the
%intensity of a particular frequency at a given time.

fun = @(x) x(1:1000,:)  % Function to be repeated at each cell, extract first 1000 values

for i = 1:A_col
    %sgf_A_trimmed{i} = cellfun(fun,sgf_A)
    sgf_A_trimcurr = sgf_A{i};
    
    sgf_A_trim(1,:) = {sgf_A_trimcurr(1:1000,:)};
    sgf_A_trim(2,:) = {sgf_A_trimcurr(1:25-1,:)};
    sgf_A_trim(3,:) = {sgf_A_trimcurr(25:50-1,:)};
    sgf_A_trim(4,:) = {sgf_A_trimcurr(50:75-1,:)};
    sgf_A_trim(5,:) = {sgf_A_trimcurr(75:100-1,:)};
    sgf_A_trim(6,:) = {sgf_A_trimcurr(100:125-1,:)};
    sgf_A_trim(7,:) = {sgf_A_trimcurr(125:150-1,:)};
    sgf_A_trim(8,:) = {sgf_A_trimcurr(150:175-1,:)};
    sgf_A_trim(9,:) = {sgf_A_trimcurr(175:200-1,:)};
    sgf_A_trim(10,:) = {sgf_A_trimcurr(200:225-1,:)};
    sgf_A_trim(11,:) = {sgf_A_trimcurr(225:250-1,:)};
    sgf_A_trim(12,:) = {sgf_A_trimcurr(250:275-1,:)};
    sgf_A_trim(13,:) = {sgf_A_trimcurr(275:300-1,:)};
    sgf_A_trim(14,:) = {sgf_A_trimcurr(300:325-1,:)};
    sgf_A_trim(15,:) = {sgf_A_trimcurr(325:350-1,:)};
    sgf_A_trim(16,:) = {sgf_A_trimcurr(350:375-1,:)};
    sgf_A_trim(17,:) = {sgf_A_trimcurr(375:400-1,:)};
    sgf_A_trim(18,:) = {sgf_A_trimcurr(400:425-1,:)};
    sgf_A_trim(19,:) = {sgf_A_trimcurr(425:450-1,:)};
    sgf_A_trim(20,:) = {sgf_A_trimcurr(450:475-1,:)};
    sgf_A_trim(21,:) = {sgf_A_trimcurr(475:500-1,:)};
    % -------------- 500
    sgf_A_trim(22,:) = {sgf_A_trimcurr(500:525-1,:)};
    sgf_A_trim(23,:) = {sgf_A_trimcurr(525:550-1,:)};
    sgf_A_trim(24,:) = {sgf_A_trimcurr(550:575-1,:)};
    sgf_A_trim(25,:) = {sgf_A_trimcurr(575:600-1,:)};
    sgf_A_trim(26,:) = {sgf_A_trimcurr(600:625-1,:)};
    sgf_A_trim(27,:) = {sgf_A_trimcurr(625:650-1,:)};
    sgf_A_trim(28,:) = {sgf_A_trimcurr(650:675-1,:)};
    sgf_A_trim(29,:) = {sgf_A_trimcurr(675:700-1,:)};
    sgf_A_trim(30,:) = {sgf_A_trimcurr(700:725-1,:)};
    sgf_A_trim(31,:) = {sgf_A_trimcurr(725:750-1,:)};
    sgf_A_trim(32,:) = {sgf_A_trimcurr(750:775-1,:)};
    sgf_A_trim(33,:) = {sgf_A_trimcurr(775:800-1,:)};
    sgf_A_trim(34,:) = {sgf_A_trimcurr(800:825-1,:)};
    sgf_A_trim(35,:) = {sgf_A_trimcurr(825:850-1,:)};
    sgf_A_trim(36,:) = {sgf_A_trimcurr(850:875-1,:)};
    sgf_A_trim(37,:) = {sgf_A_trimcurr(875:900-1,:)};
    sgf_A_trim(38,:) = {sgf_A_trimcurr(900:925-1,:)};
    sgf_A_trim(39,:) = {sgf_A_trimcurr(925:950-1,:)};
    sgf_A_trim(40,:) = {sgf_A_trimcurr(950:975-1,:)};
    sgf_A_trim(41,:) = {sgf_A_trimcurr(975:1000-1,:)};
end

%% Method 1 : Show all, difficult method
% figure(8);
% 
% for i = 1:A_col
%      for k = 1:41
%         CWTcoeffs_A_Complete{k,i} = cwt(sgf_A_trim{k,i},5:5:500,'sym10','plot');     %cwt for continuous 1D wavelet transform
%         sgf_A_trim{k,i}
%      end
% end
%
% Real timestep, better if we avg tho
% % for i = 1:A_col
% %      for k = 1:3
% %         real_timestep_curr = CWTcoeffs_A_Complete{k,i}
% % %         real_timestep{k,i} = real_timestep_curr
% %      end
% % end

%% Method 2 : Avg all
figure(8);

% Note that:
% CWTcoeffs_A_Complete{A,B} = (C, D)
    % A = number of time steps (41)
    % B = audio samples (48)
    % C = Inverse Frequency Steps (100)
    % D = trimmed time steps (25)
% We wanna average for all B

% ----------------------------
% CWTcoeffs_A_avg{k} = mean(sgf_A_trim, 2);     % Mean
% X = cat(1,sgf_A_trim{:})
% mean(X,1)

% for i = 1:A_col
%      for k = 1:41
%         %M = mean(A,dim) returns the mean along dimension dim. 
%         %For example, if A is a matrix, then mean(A,2) is a column vector containing the mean of each row.
%         CWTcoeffs_A_avg{k} = mean(sgf_A_trim, 2);     % Mean
%      end
% end
% ----------------------------
% PROBLEM HERE!
% ----------------------------

for i = 1:A_col
     for k = 1:41
%         M = mean(A,dim) returns the mean along dimension dim. 
%         For example, if A is a matrix, then mean(A,2) is a column vector containing the mean of each row.
        CWTcoeffs_A_avg{k} = mean(sgf_A_trim, 2);     % Mean
     end
end

plot(CWTcoeffs_A_Complete{:} ,smth,'r');
colormap jet; 
colorbar;

title('Matrix A - Close Nodule')
xlabel('Sample (time)','fontsize',16);
ylabel('Scale level (Inverse of frequency)','fontsize',16)



% %Same in 3D
% % ------------------------------------------------------- A
% figure(8);
% surf(CWTcoeffs_A); 
% colormap jet;
% colorbar;
% 
% shading('interp'); view(-30,10);
% xlabel('Sample (time)','fontsize',16);
% ylabel('Scale level (Inverse of frequency)','fontsize',16)
% zlabel('Intensity (coefficients)')
% 
% % ------------------------------------------------------- B
% figure(9);
% surf(CWTcoeffs_B); 
% colormap jet;
% colorbar;
% 
% shading('interp'); view(-30,10);
% xlabel('Sample (time)','fontsize',16);
% ylabel('Scale level (Inverse of frequency)','fontsize',16)
% zlabel('Intensity (coefficients)')
