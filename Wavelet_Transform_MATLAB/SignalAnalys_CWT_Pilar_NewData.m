
% Author: Pilar Zhang Qiu
% Module: Robotic Research Project - Medical Percussion
% Imperial College London, Dyson School of Design Engineering
% Latest Update: 31/Jan/2021

clc;
clear all;

%% ======================================== Read multiple audio files ========================================

% Different Depths for Samples A -----------------------------------------
    % Create an audio file name, and read the file. Do this for 235
    % iterations of each sample liver thickness
    
for k = 1:236 
	audionameA10 = ['SampleA_10mm_Liver_' num2str(k) '.wav'];

	if exist(audionameA10, 'file')        
        [A10{k},fs_now] = audioread(audionameA10);

        dt = 1/fs_now;
        t_A10{k} = 0:dt:(length(A10{k})*dt)-dt;

    else
		fprintf('File %s does not exist.\n', audionameA10);
    end  
end

for k = 1:236    
	audionameA15 = ['SampleA_15mm_Liver_' num2str(k) '.wav'];

	if exist(audionameA15, 'file')        
        [A15{k},fs_now] = audioread(audionameA15);

        dt = 1/fs_now;
        t_A15{k} = 0:dt:(length(A15{k})*dt)-dt;

    else
		fprintf('File %s does not exist.\n', audionameA15);
    end  
end

for k = 1:236
	audionameA20 = ['SampleA_20mm_Liver_' num2str(k) '.wav'];

	if exist(audionameA20, 'file')        
        [A20{k},fs_now] = audioread(audionameA20);

        dt = 1/fs_now;
        t_A20{k} = 0:dt:(length(A20{k})*dt)-dt;

    else
		fprintf('File %s does not exist.\n', audionameA20);
    end  
end

for k = 1:236
	audionameA25 = ['SampleA_25mm_Liver_' num2str(k) '.wav'];

	if exist(audionameA25, 'file')        
        [A25{k},fs_now] = audioread(audionameA25);

        dt = 1/fs_now;
        t_A25{k} = 0:dt:(length(A25{k})*dt)-dt;

    else
		fprintf('File %s does not exist.\n', audionameA25);
    end  
end

for k = 1:236
	audionameA30 = ['SampleA_30mm_Liver_' num2str(k) '.wav'];

	if exist(audionameA30, 'file')        
        [A30{k},fs_now] = audioread(audionameA30);

        dt = 1/fs_now;
        t_A30{k} = 0:dt:(length(A30{k})*dt)-dt;

    else
		fprintf('File %s does not exist.\n', audionameA30);
    end  
end


% Different Depths for Samples B -----------------------------------------
    % Create an audio file name, and read the file. Do this for 235
    % iterations of each sample liver thickness
    
for k = 1:236 
	audionameB10 = ['SampleB_10mm_Liver_' num2str(k) '.wav'];

	if exist(audionameB10, 'file')        
        [B10{k},fs_now] = audioread(audionameB10);

        dt = 1/fs_now;
        t_B10{k} = 0:dt:(length(B10{k})*dt)-dt;

    else
		fprintf('File %s does not exist.\n', audionameB10);
    end  
end

for k = 1:236    
	audionameB15 = ['SampleB_15mm_Liver_' num2str(k) '.wav'];

	if exist(audionameB15, 'file')        
        [B15{k},fs_now] = audioread(audionameB15);

        dt = 1/fs_now;
        t_B15{k} = 0:dt:(length(B15{k})*dt)-dt;

    else
		fprintf('File %s does not exist.\n', audionameB15);
    end  
end

for k = 1:236
	audionameB20 = ['SampleB_20mm_Liver_' num2str(k) '.wav'];

	if exist(audionameB20, 'file')        
        [B20{k},fs_now] = audioread(audionameB20);

        dt = 1/fs_now;
        t_B20{k} = 0:dt:(length(B20{k})*dt)-dt;

    else
		fprintf('File %s does not exist.\n', audionameB20);
    end  
end

for k = 1:236
	audionameB25 = ['SampleB_25mm_Liver_' num2str(k) '.wav'];

	if exist(audionameB25, 'file')        
        [B25{k},fs_now] = audioread(audionameB25);

        dt = 1/fs_now;
        t_B25{k} = 0:dt:(length(B25{k})*dt)-dt;

    else
		fprintf('File %s does not exist.\n', audionameB25);
    end  
end

for k = 1:236
	audionameB30 = ['SampleB_30mm_Liver_' num2str(k) '.wav'];

	if exist(audionameB30, 'file')        
        [B30{k},fs_now] = audioread(audionameB30);

        dt = 1/fs_now;
        t_B30{k} = 0:dt:(length(B30{k})*dt)-dt;

    else
		fprintf('File %s does not exist.\n', audionameB30);
    end  
end


% Different Depths for Samples C -----------------------------------------
    % Create an audio file name, and read the file. Do this for 235
    % iterations of each sample liver thickness
    
for k = 1:236 
	audionameC10 = ['SampleC_10mm_Liver_' num2str(k) '.wav'];

	if exist(audionameC10, 'file')        
        [C10{k},fs_now] = audioread(audionameC10);

        dt = 1/fs_now;
        t_C10{k} = 0:dt:(length(C10{k})*dt)-dt;

    else
		fprintf('File %s does not exist.\n', audionameC10);
    end  
end

for k = 1:236    
	audionameC15 = ['SampleC_15mm_Liver_' num2str(k) '.wav'];

	if exist(audionameC15, 'file')        
        [C15{k},fs_now] = audioread(audionameC15);

        dt = 1/fs_now;
        t_C15{k} = 0:dt:(length(C15{k})*dt)-dt;

    else
		fprintf('File %s does not exist.\n', audionameC15);
    end  
end

for k = 1:236
	audionameC20 = ['SampleC_20mm_Liver_' num2str(k) '.wav'];

	if exist(audionameC20, 'file')        
        [C20{k},fs_now] = audioread(audionameC20);

        dt = 1/fs_now;
        t_C20{k} = 0:dt:(length(C20{k})*dt)-dt;

    else
		fprintf('File %s does not exist.\n', audionameC20);
    end  
end

for k = 1:236
	audionameC25 = ['SampleC_25mm_Liver_' num2str(k) '.wav'];

	if exist(audionameC25, 'file')        
        [C25{k},fs_now] = audioread(audionameC25);

        dt = 1/fs_now;
        t_C25{k} = 0:dt:(length(C25{k})*dt)-dt;

    else
		fprintf('File %s does not exist.\n', audionameC25);
    end  
end

for k = 1:236
	audionameC30 = ['SampleC_30mm_Liver_' num2str(k) '.wav'];

	if exist(audionameC30, 'file')        
        [C30{k},fs_now] = audioread(audionameC30);

        dt = 1/fs_now;
        t_C30{k} = 0:dt:(length(C30{k})*dt)-dt;

    else
		fprintf('File %s does not exist.\n', audionameC30);
    end  
end

% Check size of each specific sample and liver thickness iterations cell
[A10_rows, A10_col] = size(A10);
[A15_rows, A15_col] = size(A15);
[A20_rows, A20_col] = size(A20);
[A25_rows, A25_col] = size(A25);
[A30_rows, A30_col] = size(A30);

[B10_rows, B10_col] = size(B10);
[B15_rows, B15_col] = size(B15);
[B20_rows, B20_col] = size(B20);
[B25_rows, B25_col] = size(B25);
[B30_rows, B30_col] = size(B30);

[C10_rows, C10_col] = size(C10);
[C15_rows, C15_col] = size(C15);
[C20_rows, C20_col] = size(C20);
[C25_rows, C25_col] = size(C25);
[C30_rows, C30_col] = size(C30);

% %% ======================================== Aligned signals ========================================
% % This section is used to prove that signals are aligned in time. We do
% % this just for the 10mm iterations of each sample (A, B, C) 
% % ================================== A ====================================
% for i = 3:A10_col
%     figure(1);
%     hold on;
%     % Each signal has a different time domain. Use dtw to align signals in
%     % the Y-axis
%     [distA10{i}, iA10_x{i}, iA10_y{i}] = dtw(A10{2},A10{i});
% 
%     % The vectors ix and iy have the same length. Each contains a 
%     % monotonically increasing sequence in which the indices to the 
%     % elements of the corresponding signal, x or y, are repeated the 
%     % necessary number of times.
% 
%     % The x-axis is time, and y-axis is amplitude
% 
%     plot(iA10_x{i},iA10_y{i},'r');
%     ylabel('Difference in amplitude');
%     xlabel('Time')
%     title('Difference between signals')
%     set(gca,'FontSize',14)
% 
% %     figure(2);
% %     dtw(A10{2},A10{i});
% end
% 
% % ================================== B ====================================
% for i = 3:B10_col
%     hold on;
%     % Each signal has a different time domain. Use dtw to align signals in
%     % the Y-axis
%     [distB10{i}, iB10_x{i}, iB10_y{i}] = dtw(B10{2},B10{i});
% 
%     % The vectors ix and iy have the same length. Each contains a 
%     % monotonically increasing sequence in which the indices to the 
%     % elements of the corresponding signal, x or y, are repeated the 
%     % necessary number of times.
% 
%     % The x-axis is time, and y-axis is amplitude
% 
%     plot(iB10_x{i},iB10_y{i},'b');
%     ylabel('Difference in amplitude');
%     xlabel('Time')
%     title('Difference between signals')
%     set(gca,'FontSize',14)
% 
% %     figure(2);
% %     dtw(B10{2},B10{i});
% end
% 
% % ================================== C ====================================
% for i = 3:C10_col
%     hold on;
%     % Each signal has a different time domain. Use dtw to align signals in
%     % the Y-axis
%     [distC10{i}, iC10_x{i}, iC10_y{i}] = dtw(C10{2},C10{i});
% 
%     % The vectors ix and iy have the same length. Each contains a 
%     % monotonically increasing sequence in which the indices to the 
%     % elements of the corresponding signal, x or y, are repeated the 
%     % necessary number of times.
% 
%     % The x-axis is time, and y-axis is amplitude
% 
%     plot(iC10_x{i},iC10_y{i},'b');
%     ylabel('Difference in amplitude');
%     xlabel('Time')
%     title('Difference between signals')
%     set(gca,'FontSize',14)
% 
% %     figure(2);
% %     dtw(C10{2},C10{i});
% end

% %% ======================================== Average of aligned signals ========================================
% % This is the average signal for all A functions. However, if we do the averages per frequencies, important 
% % temporal information might be lost, as seen here. Therefore,we will use S-Golay (next section) to decrease noise 
% % and do the average in groups of 25ms and 5Hz.
% 
% [wrow, wcol] = size(iA10_x);
% new_time = [1:39318];     % create your array
% 
% for i = 3:A10_col
%     curr_iA10_x = iA10_x{i};
%     WarpPath_A10 = A10{curr_iA10_x}; %i,curr_iAx
% 
%     figure(2);
%     plot(new_time,WarpPath_A10,'b');
% 
%     legend('Avg. Signal')
%     xlabel('Sample Time(unitless)');
%     ylabel('Amplitude');
%     title('Average of aligned signals');
%     set(gca,'FontSize',14)
% end
% 
% % See how the aligning tool works
% figure(3);
% dtw(A10{2},A10{29});    % Plot random iterations to check
% set(gca,'FontSize',14)

%% ======================================== Smoothening: S-Golay Filtering ========================================
% It seems like S-Golay is not able to smooth the signal as much as we'd
% like. This is expected as it is more effective at preserving high frequency 
% signal components but less successful at rejecting noise. This is OK.

% ====================================================== A
% -------------------------------------- Sample A - Depths
for i = 1:A10_col
    % Smaller framerates and higher orders = really accurate
    % Big framelengths and low orders = smoothens more
    % SGolay O-3, FL-41
    SG_order = 3;
    SG_framelen = 41;
    sgf_A10{i} = sgolayfilt(A10{i},SG_order,SG_framelen);
end

for i = 1:A15_col
    % Smaller framerates and higher orders = really accurate
    % Big framelengths and low orders = smoothens more
    % SGolay O-3, FL-41
    SG_order = 3;
    SG_framelen = 41;
    sgf_A15{i} = sgolayfilt(A15{i},SG_order,SG_framelen);
end

for i = 1:A20_col
    % Smaller framerates and higher orders = really accurate
    % Big framelengths and low orders = smoothens more
    % SGolay O-3, FL-41
    SG_order = 3;
    SG_framelen = 41;
    sgf_A20{i} = sgolayfilt(A20{i},SG_order,SG_framelen);
end

for i = 1:A25_col
    % Smaller framerates and higher orders = really accurate
    % Big framelengths and low orders = smoothens more
    % SGolay O-3, FL-41
    SG_order = 3;
    SG_framelen = 41;
    sgf_A25{i} = sgolayfilt(A25{i},SG_order,SG_framelen);
end

for i = 1:A30_col
    % Smaller framerates and higher orders = really accurate
    % Big framelengths and low orders = smoothens more
    % SGolay O-3, FL-41
    SG_order = 3;
    SG_framelen = 41;
    sgf_A30{i} = sgolayfilt(A30{i},SG_order,SG_framelen);
end

% -------------------------------------- Sample A S-Golay - Plots
% Plot a random original signal (n=29)and its S-Golay smoothened result
figure(4);
n = 29;
% subplot(2,1,1)
plot(t_A10{n},A10{n},'LineWidth',1.5)
hold on
plot(t_A10{n},sgf_A10{n},'LineWidth',1.5)
hold off

legend('Original signal A10 - n=29','S-Golay: order 3, fl 41')
xlabel('Sample(time)');
ylabel('Amplitude');
title('S-Golay Filtering');
set(gca,'FontSize',14)

% ====================================================== B
% -------------------------------------- Sample B - Depths
for i = 1:B10_col
    % Smaller framerates and higher orders = really accurate
    % Big framelengths and low orders = smoothens more
    % SGolay O-3, FL-41
    SG_order = 3;
    SG_framelen = 41;
    sgf_B10{i} = sgolayfilt(B10{i},SG_order,SG_framelen);
end

for i = 1:B15_col
    % Smaller framerates and higher orders = really accurate
    % Big framelengths and low orders = smoothens more
    % SGolay O-3, FL-41
    SG_order = 3;
    SG_framelen = 41;
    sgf_B15{i} = sgolayfilt(B15{i},SG_order,SG_framelen);
end

for i = 1:B20_col
    % Smaller framerates and higher orders = really accurate
    % Big framelengths and low orders = smoothens more
    % SGolay O-3, FL-41
    SG_order = 3;
    SG_framelen = 41;
    sgf_B20{i} = sgolayfilt(B20{i},SG_order,SG_framelen);
end

for i = 1:B25_col
    % Smaller framerates and higher orders = really accurate
    % Big framelengths and low orders = smoothens more
    % SGolay O-3, FL-41
    SG_order = 3;
    SG_framelen = 41;
    sgf_B25{i} = sgolayfilt(B25{i},SG_order,SG_framelen);
end

for i = 1:B30_col
    % Smaller framerates and higher orders = really accurate
    % Big framelengths and low orders = smoothens more
    % SGolay O-3, FL-41
    SG_order = 3;
    SG_framelen = 41;
    sgf_B30{i} = sgolayfilt(B30{i},SG_order,SG_framelen);
end

% -------------------------------------- Sample B S-Golay - Plots
% Plot a random original signal (n=29) and its S-Golay smoothened result
figure(5);
%subplot(2,1,1)
plot(t_B10{n},B10{n},'LineWidth',2)
hold on
plot(t_B10{n},sgf_B10{n},'LineWidth',2)
hold off

legend('Original signal B10 - n=29','S-Golay: Order 3, FL 41')
xlabel('Sample(time)','fontsize',14);
ylabel('Amplitude','fontsize',14);
title('S-Golay Filtering','fontsize',14);
set(gca,'FontSize',14)

% ====================================================== C
% -------------------------------------- Sample C - Depths
for i = 1:C10_col
    % Smaller framerates and higher orders = really accurate
    % Big framelengths and low orders = smoothens more
    % SGolay O-3, FL-41
    SG_order = 3;
    SG_framelen = 41;
    sgf_C10{i} = sgolayfilt(C10{i},SG_order,SG_framelen);
end

for i = 1:C15_col
    % Smaller framerates and higher orders = really accurate
    % Big framelengths and low orders = smoothens more
    % SGolay O-3, FL-41
    SG_order = 3;
    SG_framelen = 41;
    sgf_C15{i} = sgolayfilt(C15{i},SG_order,SG_framelen);
end

for i = 1:C20_col
    % Smaller framerates and higher orders = really accurate
    % Big framelengths and low orders = smoothens more
    % SGolay O-3, FL-41
    SG_order = 3;
    SG_framelen = 41;
    sgf_C20{i} = sgolayfilt(C20{i},SG_order,SG_framelen);
end

for i = 1:C25_col
    % Smaller framerates and higher orders = really accurate
    % Big framelengths and low orders = smoothens more
    % SGolay O-3, FL-41
    SG_order = 3;
    SG_framelen = 41;
    sgf_C25{i} = sgolayfilt(C25{i},SG_order,SG_framelen);
end

for i = 1:C30_col
    % Smaller framerates and higher orders = really accurate
    % Big framelengths and low orders = smoothens more
    % SGolay O-3, FL-41
    SG_order = 3;
    SG_framelen = 41;
    sgf_C30{i} = sgolayfilt(C30{i},SG_order,SG_framelen);
end

% -------------------------------------- Sample C S-Golay - Plots
% Plot a random original signal (n=29) and its S-Golay smoothened result
figure(5);
%subplot(2,1,1)
plot(t_C10{n},C10{n},'LineWidth',2)
hold on
plot(t_C10{n},sgf_C10{n},'LineWidth',2)
hold off

legend('Original signal C10 - n=29','S-Golay: Order 3, FL 41')
xlabel('Sample(time)','fontsize',14);
ylabel('Amplitude','fontsize',14);
title('S-Golay Filtering','fontsize',14);
set(gca,'FontSize',14)

% The lines below can be used to find the right 'O' and 'FL' combinations
% 'O' = order of the S-Golay filters
% 'FL' = Frame length

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

%% ======================================== Spectogram ========================================
% Plot the spectogram of a random sample iteration (e.g. m=23)
% This is just done to visually compare spectogram to the scalograms below.
figure(6);
for m = 23
    [s,w,t,ps,fc,tc] = spectrogram(sgf_A10{m});
    spectrogram(sgf_A10{m},'yaxis');
    
    title('Spectogram - Sample A, 10mm (Single Repetition m=23)','fontsize',14);
    xlabel('Time(ms)','fontsize',14);
    ylabel('Frequency (Hz)','fontsize',14);
end

%% ============================== CWT Coefficients - 1D Continuous Wavelet Transform ===============================
% Here I am only plotting scalogram for one specific percussion event
% (m=23), but I will be using all of them for the posterior analysis. 
% This is just done to visually compare scalograms to the spectograms above.
% ------------------------------------------------------- A
figure(7);
m=23;
%Continuous wavelet transform up to 500 scale levels (analogous to
%frequency levels) using DB10 wavelet. The x-axis is time, and y-axis is
%frequency. Higher the scale, lower the frequency. The color map is the
%intensity of a particular frequency at a given time.

subplot(1,3,1);
CWTcoeffs_A10 = cwt(sgf_A10{m},5:5:1000,'sym10','plot');     %cwt for continuous 1D wavelet transform
colormap jet; 
h = colorbar;
set(get(h,'label'),'string','C-Values');

title('CWT Scalogram - Sample A, 10mm (Single Repetition m=23)','fontsize',14);
xlabel('Time(ms)','fontsize',14);
ylabel('Frequency (Hz)','fontsize',14);
set(gca,'FontSize',14);

% ------------------------------------------------------- B
subplot(1,3,2);
CWTcoeffs_B10 = cwt(sgf_B10{m},5:5:1000,'sym10','plot');     %cwt for continuous 1D wavelet transform
colormap jet; 
h = colorbar;
set(get(h,'label'),'string','C-Values');

title('CWT Scalogram - Sample B, 10mm (Single Repetition m=23)','fontsize',14);
xlabel('Time(ms)','fontsize',14);
ylabel('Frequency (Hz)','fontsize',14);
set(gca,'FontSize',14);

% ------------------------------------------------------- C
subplot(1,3,3);
CWTcoeffs_C10 = cwt(sgf_C10{m},5:5:1000,'sym10','plot');     %cwt for continuous 1D wavelet transform
colormap jet; 
h = colorbar;
set(get(h,'label'),'string','C-Values');

title('CWT Scalogram - Sample C, 10mm (Single Repetition m=23)','fontsize',14);
xlabel('Time(ms)','fontsize',14);
ylabel('Frequency (Hz)','fontsize',14);
set(gca,'FontSize',14);

%% ============================== Split in groups of 25 timestamps ===============================
% Prepare and simplify samples for posterior Continuous Wavelet transformation analysis.
% The x-axis is time, and y-axis is frequency.
% The color map is the intensity of a particular frequency at a given time.

% We want to create squares of 25Hz and 25ms and average them. First, we
% split in groups of 25 ms (split x-axis)

%% ======================================================= A
for i = 1:A10_col
    %sgf_A10_trimmed{i} = cellfun(fun,sgf_A10)
    sgf_A10_trimcurr = sgf_A10{i};

    sgf_A10_trim(1,i) = {sgf_A10_trimcurr(1:1000,:)};
    sgf_A10_trim(2,i) = {sgf_A10_trimcurr(1:25,:)};
    sgf_A10_trim(3,i) = {sgf_A10_trimcurr(25:50-1,:)};
    sgf_A10_trim(4,i) = {sgf_A10_trimcurr(50:75-1,:)};
    sgf_A10_trim(5,i) = {sgf_A10_trimcurr(75:100-1,:)};
    sgf_A10_trim(6,i) = {sgf_A10_trimcurr(100:125-1,:)};
    sgf_A10_trim(7,i) = {sgf_A10_trimcurr(125:150-1,:)};
    sgf_A10_trim(8,i) = {sgf_A10_trimcurr(150:175-1,:)};
    sgf_A10_trim(9,i) = {sgf_A10_trimcurr(175:200-1,:)};
    sgf_A10_trim(10,i) = {sgf_A10_trimcurr(200:225-1,:)};
    sgf_A10_trim(11,i) = {sgf_A10_trimcurr(225:250-1,:)};
    sgf_A10_trim(12,i) = {sgf_A10_trimcurr(250:275-1,:)};
    sgf_A10_trim(13,i) = {sgf_A10_trimcurr(275:300-1,:)};
    sgf_A10_trim(14,i) = {sgf_A10_trimcurr(300:325-1,:)};
    sgf_A10_trim(15,i) = {sgf_A10_trimcurr(325:350-1,:)};
    sgf_A10_trim(16,i) = {sgf_A10_trimcurr(350:375-1,:)};
    sgf_A10_trim(17,i) = {sgf_A10_trimcurr(375:400-1,:)};
    sgf_A10_trim(18,i) = {sgf_A10_trimcurr(400:425-1,:)};
    sgf_A10_trim(19,i) = {sgf_A10_trimcurr(425:450-1,:)};
    sgf_A10_trim(20,i) = {sgf_A10_trimcurr(450:475-1,:)};
    sgf_A10_trim(21,i) = {sgf_A10_trimcurr(475:500-1,:)};
    % -------------- 500
    sgf_A10_trim(22,i) = {sgf_A10_trimcurr(500:525-1,:)};
    sgf_A10_trim(23,i) = {sgf_A10_trimcurr(525:550-1,:)};
    sgf_A10_trim(24,i) = {sgf_A10_trimcurr(550:575-1,:)};
    sgf_A10_trim(25,i) = {sgf_A10_trimcurr(575:600-1,:)};
    sgf_A10_trim(26,i) = {sgf_A10_trimcurr(600:625-1,:)};
    sgf_A10_trim(27,i) = {sgf_A10_trimcurr(625:650-1,:)};
    sgf_A10_trim(28,i) = {sgf_A10_trimcurr(650:675-1,:)};
    sgf_A10_trim(29,i) = {sgf_A10_trimcurr(675:700-1,:)};
    sgf_A10_trim(30,i) = {sgf_A10_trimcurr(700:725-1,:)};
    sgf_A10_trim(31,i) = {sgf_A10_trimcurr(725:750-1,:)};
    sgf_A10_trim(32,i) = {sgf_A10_trimcurr(750:775-1,:)};
    sgf_A10_trim(33,i) = {sgf_A10_trimcurr(775:800-1,:)};
    sgf_A10_trim(34,i) = {sgf_A10_trimcurr(800:825-1,:)};
    sgf_A10_trim(35,i) = {sgf_A10_trimcurr(825:850-1,:)};
    sgf_A10_trim(36,i) = {sgf_A10_trimcurr(850:875-1,:)};
    sgf_A10_trim(37,i) = {sgf_A10_trimcurr(875:900-1,:)};
    sgf_A10_trim(38,i) = {sgf_A10_trimcurr(900:925-1,:)};
    sgf_A10_trim(39,i) = {sgf_A10_trimcurr(925:950-1,:)};
    sgf_A10_trim(40,i) = {sgf_A10_trimcurr(950:975-1,:)};
    sgf_A10_trim(41,i) = {sgf_A10_trimcurr(975:1000-1,:)};
end

for i = 1:A15_col
    %sgf_A15_trimmed{i} = cellfun(fun,sgf_A15)
    sgf_A15_trimcurr = sgf_A15{i};

    sgf_A15_trim(1,i) = {sgf_A15_trimcurr(1:1000,:)};
    sgf_A15_trim(2,i) = {sgf_A15_trimcurr(1:25,:)};
    sgf_A15_trim(3,i) = {sgf_A15_trimcurr(25:50-1,:)};
    sgf_A15_trim(4,i) = {sgf_A15_trimcurr(50:75-1,:)};
    sgf_A15_trim(5,i) = {sgf_A15_trimcurr(75:100-1,:)};
    sgf_A15_trim(6,i) = {sgf_A15_trimcurr(100:125-1,:)};
    sgf_A15_trim(7,i) = {sgf_A15_trimcurr(125:150-1,:)};
    sgf_A15_trim(8,i) = {sgf_A15_trimcurr(150:175-1,:)};
    sgf_A15_trim(9,i) = {sgf_A15_trimcurr(175:200-1,:)};
    sgf_A15_trim(10,i) = {sgf_A15_trimcurr(200:225-1,:)};
    sgf_A15_trim(11,i) = {sgf_A15_trimcurr(225:250-1,:)};
    sgf_A15_trim(12,i) = {sgf_A15_trimcurr(250:275-1,:)};
    sgf_A15_trim(13,i) = {sgf_A15_trimcurr(275:300-1,:)};
    sgf_A15_trim(14,i) = {sgf_A15_trimcurr(300:325-1,:)};
    sgf_A15_trim(15,i) = {sgf_A15_trimcurr(325:350-1,:)};
    sgf_A15_trim(16,i) = {sgf_A15_trimcurr(350:375-1,:)};
    sgf_A15_trim(17,i) = {sgf_A15_trimcurr(375:400-1,:)};
    sgf_A15_trim(18,i) = {sgf_A15_trimcurr(400:425-1,:)};
    sgf_A15_trim(19,i) = {sgf_A15_trimcurr(425:450-1,:)};
    sgf_A15_trim(20,i) = {sgf_A15_trimcurr(450:475-1,:)};
    sgf_A15_trim(21,i) = {sgf_A15_trimcurr(475:500-1,:)};
    % -------------- 500
    sgf_A15_trim(22,i) = {sgf_A15_trimcurr(500:525-1,:)};
    sgf_A15_trim(23,i) = {sgf_A15_trimcurr(525:550-1,:)};
    sgf_A15_trim(24,i) = {sgf_A15_trimcurr(550:575-1,:)};
    sgf_A15_trim(25,i) = {sgf_A15_trimcurr(575:600-1,:)};
    sgf_A15_trim(26,i) = {sgf_A15_trimcurr(600:625-1,:)};
    sgf_A15_trim(27,i) = {sgf_A15_trimcurr(625:650-1,:)};
    sgf_A15_trim(28,i) = {sgf_A15_trimcurr(650:675-1,:)};
    sgf_A15_trim(29,i) = {sgf_A15_trimcurr(675:700-1,:)};
    sgf_A15_trim(30,i) = {sgf_A15_trimcurr(700:725-1,:)};
    sgf_A15_trim(31,i) = {sgf_A15_trimcurr(725:750-1,:)};
    sgf_A15_trim(32,i) = {sgf_A15_trimcurr(750:775-1,:)};
    sgf_A15_trim(33,i) = {sgf_A15_trimcurr(775:800-1,:)};
    sgf_A15_trim(34,i) = {sgf_A15_trimcurr(800:825-1,:)};
    sgf_A15_trim(35,i) = {sgf_A15_trimcurr(825:850-1,:)};
    sgf_A15_trim(36,i) = {sgf_A15_trimcurr(850:875-1,:)};
    sgf_A15_trim(37,i) = {sgf_A15_trimcurr(875:900-1,:)};
    sgf_A15_trim(38,i) = {sgf_A15_trimcurr(900:925-1,:)};
    sgf_A15_trim(39,i) = {sgf_A15_trimcurr(925:950-1,:)};
    sgf_A15_trim(40,i) = {sgf_A15_trimcurr(950:975-1,:)};
    sgf_A15_trim(41,i) = {sgf_A15_trimcurr(975:1000-1,:)};
end

for i = 1:A20_col
    %sgf_A20_trimmed{i} = cellfun(fun,sgf_A20)
    sgf_A20_trimcurr = sgf_A20{i};

    sgf_A20_trim(1,i) = {sgf_A20_trimcurr(1:1000,:)};
    sgf_A20_trim(2,i) = {sgf_A20_trimcurr(1:25,:)};
    sgf_A20_trim(3,i) = {sgf_A20_trimcurr(25:50-1,:)};
    sgf_A20_trim(4,i) = {sgf_A20_trimcurr(50:75-1,:)};
    sgf_A20_trim(5,i) = {sgf_A20_trimcurr(75:100-1,:)};
    sgf_A20_trim(6,i) = {sgf_A20_trimcurr(100:125-1,:)};
    sgf_A20_trim(7,i) = {sgf_A20_trimcurr(125:150-1,:)};
    sgf_A20_trim(8,i) = {sgf_A20_trimcurr(150:175-1,:)};
    sgf_A20_trim(9,i) = {sgf_A20_trimcurr(175:200-1,:)};
    sgf_A20_trim(10,i) = {sgf_A20_trimcurr(200:225-1,:)};
    sgf_A20_trim(11,i) = {sgf_A20_trimcurr(225:250-1,:)};
    sgf_A20_trim(12,i) = {sgf_A20_trimcurr(250:275-1,:)};
    sgf_A20_trim(13,i) = {sgf_A20_trimcurr(275:300-1,:)};
    sgf_A20_trim(14,i) = {sgf_A20_trimcurr(300:325-1,:)};
    sgf_A20_trim(15,i) = {sgf_A20_trimcurr(325:350-1,:)};
    sgf_A20_trim(16,i) = {sgf_A20_trimcurr(350:375-1,:)};
    sgf_A20_trim(17,i) = {sgf_A20_trimcurr(375:400-1,:)};
    sgf_A20_trim(18,i) = {sgf_A20_trimcurr(400:425-1,:)};
    sgf_A20_trim(19,i) = {sgf_A20_trimcurr(425:450-1,:)};
    sgf_A20_trim(20,i) = {sgf_A20_trimcurr(450:475-1,:)};
    sgf_A20_trim(21,i) = {sgf_A20_trimcurr(475:500-1,:)};
    % -------------- 500
    sgf_A20_trim(22,i) = {sgf_A20_trimcurr(500:525-1,:)};
    sgf_A20_trim(23,i) = {sgf_A20_trimcurr(525:550-1,:)};
    sgf_A20_trim(24,i) = {sgf_A20_trimcurr(550:575-1,:)};
    sgf_A20_trim(25,i) = {sgf_A20_trimcurr(575:600-1,:)};
    sgf_A20_trim(26,i) = {sgf_A20_trimcurr(600:625-1,:)};
    sgf_A20_trim(27,i) = {sgf_A20_trimcurr(625:650-1,:)};
    sgf_A20_trim(28,i) = {sgf_A20_trimcurr(650:675-1,:)};
    sgf_A20_trim(29,i) = {sgf_A20_trimcurr(675:700-1,:)};
    sgf_A20_trim(30,i) = {sgf_A20_trimcurr(700:725-1,:)};
    sgf_A20_trim(31,i) = {sgf_A20_trimcurr(725:750-1,:)};
    sgf_A20_trim(32,i) = {sgf_A20_trimcurr(750:775-1,:)};
    sgf_A20_trim(33,i) = {sgf_A20_trimcurr(775:800-1,:)};
    sgf_A20_trim(34,i) = {sgf_A20_trimcurr(800:825-1,:)};
    sgf_A20_trim(35,i) = {sgf_A20_trimcurr(825:850-1,:)};
    sgf_A20_trim(36,i) = {sgf_A20_trimcurr(850:875-1,:)};
    sgf_A20_trim(37,i) = {sgf_A20_trimcurr(875:900-1,:)};
    sgf_A20_trim(38,i) = {sgf_A20_trimcurr(900:925-1,:)};
    sgf_A20_trim(39,i) = {sgf_A20_trimcurr(925:950-1,:)};
    sgf_A20_trim(40,i) = {sgf_A20_trimcurr(950:975-1,:)};
    sgf_A20_trim(41,i) = {sgf_A20_trimcurr(975:1000-1,:)};
end

for i = 1:A25_col
    %sgf_A25_trimmed{i} = cellfun(fun,sgf_A25)
    sgf_A25_trimcurr = sgf_A25{i};

    sgf_A25_trim(1,i) = {sgf_A25_trimcurr(1:1000,:)};
    sgf_A25_trim(2,i) = {sgf_A25_trimcurr(1:25,:)};
    sgf_A25_trim(3,i) = {sgf_A25_trimcurr(25:50-1,:)};
    sgf_A25_trim(4,i) = {sgf_A25_trimcurr(50:75-1,:)};
    sgf_A25_trim(5,i) = {sgf_A25_trimcurr(75:100-1,:)};
    sgf_A25_trim(6,i) = {sgf_A25_trimcurr(100:125-1,:)};
    sgf_A25_trim(7,i) = {sgf_A25_trimcurr(125:150-1,:)};
    sgf_A25_trim(8,i) = {sgf_A25_trimcurr(150:175-1,:)};
    sgf_A25_trim(9,i) = {sgf_A25_trimcurr(175:200-1,:)};
    sgf_A25_trim(10,i) = {sgf_A25_trimcurr(200:225-1,:)};
    sgf_A25_trim(11,i) = {sgf_A25_trimcurr(225:250-1,:)};
    sgf_A25_trim(12,i) = {sgf_A25_trimcurr(250:275-1,:)};
    sgf_A25_trim(13,i) = {sgf_A25_trimcurr(275:300-1,:)};
    sgf_A25_trim(14,i) = {sgf_A25_trimcurr(300:325-1,:)};
    sgf_A25_trim(15,i) = {sgf_A25_trimcurr(325:350-1,:)};
    sgf_A25_trim(16,i) = {sgf_A25_trimcurr(350:375-1,:)};
    sgf_A25_trim(17,i) = {sgf_A25_trimcurr(375:400-1,:)};
    sgf_A25_trim(18,i) = {sgf_A25_trimcurr(400:425-1,:)};
    sgf_A25_trim(19,i) = {sgf_A25_trimcurr(425:450-1,:)};
    sgf_A25_trim(20,i) = {sgf_A25_trimcurr(450:475-1,:)};
    sgf_A25_trim(21,i) = {sgf_A25_trimcurr(475:500-1,:)};
    % -------------- 500
    sgf_A25_trim(22,i) = {sgf_A25_trimcurr(500:525-1,:)};
    sgf_A25_trim(23,i) = {sgf_A25_trimcurr(525:550-1,:)};
    sgf_A25_trim(24,i) = {sgf_A25_trimcurr(550:575-1,:)};
    sgf_A25_trim(25,i) = {sgf_A25_trimcurr(575:600-1,:)};
    sgf_A25_trim(26,i) = {sgf_A25_trimcurr(600:625-1,:)};
    sgf_A25_trim(27,i) = {sgf_A25_trimcurr(625:650-1,:)};
    sgf_A25_trim(28,i) = {sgf_A25_trimcurr(650:675-1,:)};
    sgf_A25_trim(29,i) = {sgf_A25_trimcurr(675:700-1,:)};
    sgf_A25_trim(30,i) = {sgf_A25_trimcurr(700:725-1,:)};
    sgf_A25_trim(31,i) = {sgf_A25_trimcurr(725:750-1,:)};
    sgf_A25_trim(32,i) = {sgf_A25_trimcurr(750:775-1,:)};
    sgf_A25_trim(33,i) = {sgf_A25_trimcurr(775:800-1,:)};
    sgf_A25_trim(34,i) = {sgf_A25_trimcurr(800:825-1,:)};
    sgf_A25_trim(35,i) = {sgf_A25_trimcurr(825:850-1,:)};
    sgf_A25_trim(36,i) = {sgf_A25_trimcurr(850:875-1,:)};
    sgf_A25_trim(37,i) = {sgf_A25_trimcurr(875:900-1,:)};
    sgf_A25_trim(38,i) = {sgf_A25_trimcurr(900:925-1,:)};
    sgf_A25_trim(39,i) = {sgf_A25_trimcurr(925:950-1,:)};
    sgf_A25_trim(40,i) = {sgf_A25_trimcurr(950:975-1,:)};
    sgf_A25_trim(41,i) = {sgf_A25_trimcurr(975:1000-1,:)};
end

for i = 1:A30_col
    %sgf_A30_trimmed{i} = cellfun(fun,sgf_A30)
    sgf_A30_trimcurr = sgf_A30{i};

    sgf_A30_trim(1,i) = {sgf_A30_trimcurr(1:1000,:)};
    sgf_A30_trim(2,i) = {sgf_A30_trimcurr(1:25,:)};
    sgf_A30_trim(3,i) = {sgf_A30_trimcurr(25:50-1,:)};
    sgf_A30_trim(4,i) = {sgf_A30_trimcurr(50:75-1,:)};
    sgf_A30_trim(5,i) = {sgf_A30_trimcurr(75:100-1,:)};
    sgf_A30_trim(6,i) = {sgf_A30_trimcurr(100:125-1,:)};
    sgf_A30_trim(7,i) = {sgf_A30_trimcurr(125:150-1,:)};
    sgf_A30_trim(8,i) = {sgf_A30_trimcurr(150:175-1,:)};
    sgf_A30_trim(9,i) = {sgf_A30_trimcurr(175:200-1,:)};
    sgf_A30_trim(10,i) = {sgf_A30_trimcurr(200:225-1,:)};
    sgf_A30_trim(11,i) = {sgf_A30_trimcurr(225:250-1,:)};
    sgf_A30_trim(12,i) = {sgf_A30_trimcurr(250:275-1,:)};
    sgf_A30_trim(13,i) = {sgf_A30_trimcurr(275:300-1,:)};
    sgf_A30_trim(14,i) = {sgf_A30_trimcurr(300:325-1,:)};
    sgf_A30_trim(15,i) = {sgf_A30_trimcurr(325:350-1,:)};
    sgf_A30_trim(16,i) = {sgf_A30_trimcurr(350:375-1,:)};
    sgf_A30_trim(17,i) = {sgf_A30_trimcurr(375:400-1,:)};
    sgf_A30_trim(18,i) = {sgf_A30_trimcurr(400:425-1,:)};
    sgf_A30_trim(19,i) = {sgf_A30_trimcurr(425:450-1,:)};
    sgf_A30_trim(20,i) = {sgf_A30_trimcurr(450:475-1,:)};
    sgf_A30_trim(21,i) = {sgf_A30_trimcurr(475:500-1,:)};
    % -------------- 500
    sgf_A30_trim(22,i) = {sgf_A30_trimcurr(500:525-1,:)};
    sgf_A30_trim(23,i) = {sgf_A30_trimcurr(525:550-1,:)};
    sgf_A30_trim(24,i) = {sgf_A30_trimcurr(550:575-1,:)};
    sgf_A30_trim(25,i) = {sgf_A30_trimcurr(575:600-1,:)};
    sgf_A30_trim(26,i) = {sgf_A30_trimcurr(600:625-1,:)};
    sgf_A30_trim(27,i) = {sgf_A30_trimcurr(625:650-1,:)};
    sgf_A30_trim(28,i) = {sgf_A30_trimcurr(650:675-1,:)};
    sgf_A30_trim(29,i) = {sgf_A30_trimcurr(675:700-1,:)};
    sgf_A30_trim(30,i) = {sgf_A30_trimcurr(700:725-1,:)};
    sgf_A30_trim(31,i) = {sgf_A30_trimcurr(725:750-1,:)};
    sgf_A30_trim(32,i) = {sgf_A30_trimcurr(750:775-1,:)};
    sgf_A30_trim(33,i) = {sgf_A30_trimcurr(775:800-1,:)};
    sgf_A30_trim(34,i) = {sgf_A30_trimcurr(800:825-1,:)};
    sgf_A30_trim(35,i) = {sgf_A30_trimcurr(825:850-1,:)};
    sgf_A30_trim(36,i) = {sgf_A30_trimcurr(850:875-1,:)};
    sgf_A30_trim(37,i) = {sgf_A30_trimcurr(875:900-1,:)};
    sgf_A30_trim(38,i) = {sgf_A30_trimcurr(900:925-1,:)};
    sgf_A30_trim(39,i) = {sgf_A30_trimcurr(925:950-1,:)};
    sgf_A30_trim(40,i) = {sgf_A30_trimcurr(950:975-1,:)};
    sgf_A30_trim(41,i) = {sgf_A30_trimcurr(975:1000-1,:)};
end

%% ======================================================= B
for i = 1:B10_col
    %sgf_B10_trimmed{i} = cellfun(fun,sgf_B10)
    sgf_B10_trimcurr = sgf_B10{i};

    sgf_B10_trim(1,i) = {sgf_B10_trimcurr(1:1000,:)};
    sgf_B10_trim(2,i) = {sgf_B10_trimcurr(1:25,:)};
    sgf_B10_trim(3,i) = {sgf_B10_trimcurr(25:50-1,:)};
    sgf_B10_trim(4,i) = {sgf_B10_trimcurr(50:75-1,:)};
    sgf_B10_trim(5,i) = {sgf_B10_trimcurr(75:100-1,:)};
    sgf_B10_trim(6,i) = {sgf_B10_trimcurr(100:125-1,:)};
    sgf_B10_trim(7,i) = {sgf_B10_trimcurr(125:150-1,:)};
    sgf_B10_trim(8,i) = {sgf_B10_trimcurr(150:175-1,:)};
    sgf_B10_trim(9,i) = {sgf_B10_trimcurr(175:200-1,:)};
    sgf_B10_trim(10,i) = {sgf_B10_trimcurr(200:225-1,:)};
    sgf_B10_trim(11,i) = {sgf_B10_trimcurr(225:250-1,:)};
    sgf_B10_trim(12,i) = {sgf_B10_trimcurr(250:275-1,:)};
    sgf_B10_trim(13,i) = {sgf_B10_trimcurr(275:300-1,:)};
    sgf_B10_trim(14,i) = {sgf_B10_trimcurr(300:325-1,:)};
    sgf_B10_trim(15,i) = {sgf_B10_trimcurr(325:350-1,:)};
    sgf_B10_trim(16,i) = {sgf_B10_trimcurr(350:375-1,:)};
    sgf_B10_trim(17,i) = {sgf_B10_trimcurr(375:400-1,:)};
    sgf_B10_trim(18,i) = {sgf_B10_trimcurr(400:425-1,:)};
    sgf_B10_trim(19,i) = {sgf_B10_trimcurr(425:450-1,:)};
    sgf_B10_trim(20,i) = {sgf_B10_trimcurr(450:475-1,:)};
    sgf_B10_trim(21,i) = {sgf_B10_trimcurr(475:500-1,:)};
    % -------------- 500
    sgf_B10_trim(22,i) = {sgf_B10_trimcurr(500:525-1,:)};
    sgf_B10_trim(23,i) = {sgf_B10_trimcurr(525:550-1,:)};
    sgf_B10_trim(24,i) = {sgf_B10_trimcurr(550:575-1,:)};
    sgf_B10_trim(25,i) = {sgf_B10_trimcurr(575:600-1,:)};
    sgf_B10_trim(26,i) = {sgf_B10_trimcurr(600:625-1,:)};
    sgf_B10_trim(27,i) = {sgf_B10_trimcurr(625:650-1,:)};
    sgf_B10_trim(28,i) = {sgf_B10_trimcurr(650:675-1,:)};
    sgf_B10_trim(29,i) = {sgf_B10_trimcurr(675:700-1,:)};
    sgf_B10_trim(30,i) = {sgf_B10_trimcurr(700:725-1,:)};
    sgf_B10_trim(31,i) = {sgf_B10_trimcurr(725:750-1,:)};
    sgf_B10_trim(32,i) = {sgf_B10_trimcurr(750:775-1,:)};
    sgf_B10_trim(33,i) = {sgf_B10_trimcurr(775:800-1,:)};
    sgf_B10_trim(34,i) = {sgf_B10_trimcurr(800:825-1,:)};
    sgf_B10_trim(35,i) = {sgf_B10_trimcurr(825:850-1,:)};
    sgf_B10_trim(36,i) = {sgf_B10_trimcurr(850:875-1,:)};
    sgf_B10_trim(37,i) = {sgf_B10_trimcurr(875:900-1,:)};
    sgf_B10_trim(38,i) = {sgf_B10_trimcurr(900:925-1,:)};
    sgf_B10_trim(39,i) = {sgf_B10_trimcurr(925:950-1,:)};
    sgf_B10_trim(40,i) = {sgf_B10_trimcurr(950:975-1,:)};
    sgf_B10_trim(41,i) = {sgf_B10_trimcurr(975:1000-1,:)};
end

for i = 1:B15_col
    %sgf_B15_trimmed{i} = cellfun(fun,sgf_B15)
    sgf_B15_trimcurr = sgf_B15{i};

    sgf_B15_trim(1,i) = {sgf_B15_trimcurr(1:1000,:)};
    sgf_B15_trim(2,i) = {sgf_B15_trimcurr(1:25,:)};
    sgf_B15_trim(3,i) = {sgf_B15_trimcurr(25:50-1,:)};
    sgf_B15_trim(4,i) = {sgf_B15_trimcurr(50:75-1,:)};
    sgf_B15_trim(5,i) = {sgf_B15_trimcurr(75:100-1,:)};
    sgf_B15_trim(6,i) = {sgf_B15_trimcurr(100:125-1,:)};
    sgf_B15_trim(7,i) = {sgf_B15_trimcurr(125:150-1,:)};
    sgf_B15_trim(8,i) = {sgf_B15_trimcurr(150:175-1,:)};
    sgf_B15_trim(9,i) = {sgf_B15_trimcurr(175:200-1,:)};
    sgf_B15_trim(10,i) = {sgf_B15_trimcurr(200:225-1,:)};
    sgf_B15_trim(11,i) = {sgf_B15_trimcurr(225:250-1,:)};
    sgf_B15_trim(12,i) = {sgf_B15_trimcurr(250:275-1,:)};
    sgf_B15_trim(13,i) = {sgf_B15_trimcurr(275:300-1,:)};
    sgf_B15_trim(14,i) = {sgf_B15_trimcurr(300:325-1,:)};
    sgf_B15_trim(15,i) = {sgf_B15_trimcurr(325:350-1,:)};
    sgf_B15_trim(16,i) = {sgf_B15_trimcurr(350:375-1,:)};
    sgf_B15_trim(17,i) = {sgf_B15_trimcurr(375:400-1,:)};
    sgf_B15_trim(18,i) = {sgf_B15_trimcurr(400:425-1,:)};
    sgf_B15_trim(19,i) = {sgf_B15_trimcurr(425:450-1,:)};
    sgf_B15_trim(20,i) = {sgf_B15_trimcurr(450:475-1,:)};
    sgf_B15_trim(21,i) = {sgf_B15_trimcurr(475:500-1,:)};
    % -------------- 500
    sgf_B15_trim(22,i) = {sgf_B15_trimcurr(500:525-1,:)};
    sgf_B15_trim(23,i) = {sgf_B15_trimcurr(525:550-1,:)};
    sgf_B15_trim(24,i) = {sgf_B15_trimcurr(550:575-1,:)};
    sgf_B15_trim(25,i) = {sgf_B15_trimcurr(575:600-1,:)};
    sgf_B15_trim(26,i) = {sgf_B15_trimcurr(600:625-1,:)};
    sgf_B15_trim(27,i) = {sgf_B15_trimcurr(625:650-1,:)};
    sgf_B15_trim(28,i) = {sgf_B15_trimcurr(650:675-1,:)};
    sgf_B15_trim(29,i) = {sgf_B15_trimcurr(675:700-1,:)};
    sgf_B15_trim(30,i) = {sgf_B15_trimcurr(700:725-1,:)};
    sgf_B15_trim(31,i) = {sgf_B15_trimcurr(725:750-1,:)};
    sgf_B15_trim(32,i) = {sgf_B15_trimcurr(750:775-1,:)};
    sgf_B15_trim(33,i) = {sgf_B15_trimcurr(775:800-1,:)};
    sgf_B15_trim(34,i) = {sgf_B15_trimcurr(800:825-1,:)};
    sgf_B15_trim(35,i) = {sgf_B15_trimcurr(825:850-1,:)};
    sgf_B15_trim(36,i) = {sgf_B15_trimcurr(850:875-1,:)};
    sgf_B15_trim(37,i) = {sgf_B15_trimcurr(875:900-1,:)};
    sgf_B15_trim(38,i) = {sgf_B15_trimcurr(900:925-1,:)};
    sgf_B15_trim(39,i) = {sgf_B15_trimcurr(925:950-1,:)};
    sgf_B15_trim(40,i) = {sgf_B15_trimcurr(950:975-1,:)};
    sgf_B15_trim(41,i) = {sgf_B15_trimcurr(975:1000-1,:)};
end

for i = 1:B20_col
    %sgf_B20_trimmed{i} = cellfun(fun,sgf_B20)
    sgf_B20_trimcurr = sgf_B20{i};

    sgf_B20_trim(1,i) = {sgf_B20_trimcurr(1:1000,:)};
    sgf_B20_trim(2,i) = {sgf_B20_trimcurr(1:25,:)};
    sgf_B20_trim(3,i) = {sgf_B20_trimcurr(25:50-1,:)};
    sgf_B20_trim(4,i) = {sgf_B20_trimcurr(50:75-1,:)};
    sgf_B20_trim(5,i) = {sgf_B20_trimcurr(75:100-1,:)};
    sgf_B20_trim(6,i) = {sgf_B20_trimcurr(100:125-1,:)};
    sgf_B20_trim(7,i) = {sgf_B20_trimcurr(125:150-1,:)};
    sgf_B20_trim(8,i) = {sgf_B20_trimcurr(150:175-1,:)};
    sgf_B20_trim(9,i) = {sgf_B20_trimcurr(175:200-1,:)};
    sgf_B20_trim(10,i) = {sgf_B20_trimcurr(200:225-1,:)};
    sgf_B20_trim(11,i) = {sgf_B20_trimcurr(225:250-1,:)};
    sgf_B20_trim(12,i) = {sgf_B20_trimcurr(250:275-1,:)};
    sgf_B20_trim(13,i) = {sgf_B20_trimcurr(275:300-1,:)};
    sgf_B20_trim(14,i) = {sgf_B20_trimcurr(300:325-1,:)};
    sgf_B20_trim(15,i) = {sgf_B20_trimcurr(325:350-1,:)};
    sgf_B20_trim(16,i) = {sgf_B20_trimcurr(350:375-1,:)};
    sgf_B20_trim(17,i) = {sgf_B20_trimcurr(375:400-1,:)};
    sgf_B20_trim(18,i) = {sgf_B20_trimcurr(400:425-1,:)};
    sgf_B20_trim(19,i) = {sgf_B20_trimcurr(425:450-1,:)};
    sgf_B20_trim(20,i) = {sgf_B20_trimcurr(450:475-1,:)};
    sgf_B20_trim(21,i) = {sgf_B20_trimcurr(475:500-1,:)};
    % -------------- 500
    sgf_B20_trim(22,i) = {sgf_B20_trimcurr(500:525-1,:)};
    sgf_B20_trim(23,i) = {sgf_B20_trimcurr(525:550-1,:)};
    sgf_B20_trim(24,i) = {sgf_B20_trimcurr(550:575-1,:)};
    sgf_B20_trim(25,i) = {sgf_B20_trimcurr(575:600-1,:)};
    sgf_B20_trim(26,i) = {sgf_B20_trimcurr(600:625-1,:)};
    sgf_B20_trim(27,i) = {sgf_B20_trimcurr(625:650-1,:)};
    sgf_B20_trim(28,i) = {sgf_B20_trimcurr(650:675-1,:)};
    sgf_B20_trim(29,i) = {sgf_B20_trimcurr(675:700-1,:)};
    sgf_B20_trim(30,i) = {sgf_B20_trimcurr(700:725-1,:)};
    sgf_B20_trim(31,i) = {sgf_B20_trimcurr(725:750-1,:)};
    sgf_B20_trim(32,i) = {sgf_B20_trimcurr(750:775-1,:)};
    sgf_B20_trim(33,i) = {sgf_B20_trimcurr(775:800-1,:)};
    sgf_B20_trim(34,i) = {sgf_B20_trimcurr(800:825-1,:)};
    sgf_B20_trim(35,i) = {sgf_B20_trimcurr(825:850-1,:)};
    sgf_B20_trim(36,i) = {sgf_B20_trimcurr(850:875-1,:)};
    sgf_B20_trim(37,i) = {sgf_B20_trimcurr(875:900-1,:)};
    sgf_B20_trim(38,i) = {sgf_B20_trimcurr(900:925-1,:)};
    sgf_B20_trim(39,i) = {sgf_B20_trimcurr(925:950-1,:)};
    sgf_B20_trim(40,i) = {sgf_B20_trimcurr(950:975-1,:)};
    sgf_B20_trim(41,i) = {sgf_B20_trimcurr(975:1000-1,:)};
end

for i = 1:B25_col
    %sgf_B25_trimmed{i} = cellfun(fun,sgf_B25)
    sgf_B25_trimcurr = sgf_B25{i};

    sgf_B25_trim(1,i) = {sgf_B25_trimcurr(1:1000,:)};
    sgf_B25_trim(2,i) = {sgf_B25_trimcurr(1:25,:)};
    sgf_B25_trim(3,i) = {sgf_B25_trimcurr(25:50-1,:)};
    sgf_B25_trim(4,i) = {sgf_B25_trimcurr(50:75-1,:)};
    sgf_B25_trim(5,i) = {sgf_B25_trimcurr(75:100-1,:)};
    sgf_B25_trim(6,i) = {sgf_B25_trimcurr(100:125-1,:)};
    sgf_B25_trim(7,i) = {sgf_B25_trimcurr(125:150-1,:)};
    sgf_B25_trim(8,i) = {sgf_B25_trimcurr(150:175-1,:)};
    sgf_B25_trim(9,i) = {sgf_B25_trimcurr(175:200-1,:)};
    sgf_B25_trim(10,i) = {sgf_B25_trimcurr(200:225-1,:)};
    sgf_B25_trim(11,i) = {sgf_B25_trimcurr(225:250-1,:)};
    sgf_B25_trim(12,i) = {sgf_B25_trimcurr(250:275-1,:)};
    sgf_B25_trim(13,i) = {sgf_B25_trimcurr(275:300-1,:)};
    sgf_B25_trim(14,i) = {sgf_B25_trimcurr(300:325-1,:)};
    sgf_B25_trim(15,i) = {sgf_B25_trimcurr(325:350-1,:)};
    sgf_B25_trim(16,i) = {sgf_B25_trimcurr(350:375-1,:)};
    sgf_B25_trim(17,i) = {sgf_B25_trimcurr(375:400-1,:)};
    sgf_B25_trim(18,i) = {sgf_B25_trimcurr(400:425-1,:)};
    sgf_B25_trim(19,i) = {sgf_B25_trimcurr(425:450-1,:)};
    sgf_B25_trim(20,i) = {sgf_B25_trimcurr(450:475-1,:)};
    sgf_B25_trim(21,i) = {sgf_B25_trimcurr(475:500-1,:)};
    % -------------- 500
    sgf_B25_trim(22,i) = {sgf_B25_trimcurr(500:525-1,:)};
    sgf_B25_trim(23,i) = {sgf_B25_trimcurr(525:550-1,:)};
    sgf_B25_trim(24,i) = {sgf_B25_trimcurr(550:575-1,:)};
    sgf_B25_trim(25,i) = {sgf_B25_trimcurr(575:600-1,:)};
    sgf_B25_trim(26,i) = {sgf_B25_trimcurr(600:625-1,:)};
    sgf_B25_trim(27,i) = {sgf_B25_trimcurr(625:650-1,:)};
    sgf_B25_trim(28,i) = {sgf_B25_trimcurr(650:675-1,:)};
    sgf_B25_trim(29,i) = {sgf_B25_trimcurr(675:700-1,:)};
    sgf_B25_trim(30,i) = {sgf_B25_trimcurr(700:725-1,:)};
    sgf_B25_trim(31,i) = {sgf_B25_trimcurr(725:750-1,:)};
    sgf_B25_trim(32,i) = {sgf_B25_trimcurr(750:775-1,:)};
    sgf_B25_trim(33,i) = {sgf_B25_trimcurr(775:800-1,:)};
    sgf_B25_trim(34,i) = {sgf_B25_trimcurr(800:825-1,:)};
    sgf_B25_trim(35,i) = {sgf_B25_trimcurr(825:850-1,:)};
    sgf_B25_trim(36,i) = {sgf_B25_trimcurr(850:875-1,:)};
    sgf_B25_trim(37,i) = {sgf_B25_trimcurr(875:900-1,:)};
    sgf_B25_trim(38,i) = {sgf_B25_trimcurr(900:925-1,:)};
    sgf_B25_trim(39,i) = {sgf_B25_trimcurr(925:950-1,:)};
    sgf_B25_trim(40,i) = {sgf_B25_trimcurr(950:975-1,:)};
    sgf_B25_trim(41,i) = {sgf_B25_trimcurr(975:1000-1,:)};
end

for i = 1:B30_col
    %sgf_B30_trimmed{i} = cellfun(fun,sgf_B30)
    sgf_B30_trimcurr = sgf_B30{i};

    sgf_B30_trim(1,i) = {sgf_B30_trimcurr(1:1000,:)};
    sgf_B30_trim(2,i) = {sgf_B30_trimcurr(1:25,:)};
    sgf_B30_trim(3,i) = {sgf_B30_trimcurr(25:50-1,:)};
    sgf_B30_trim(4,i) = {sgf_B30_trimcurr(50:75-1,:)};
    sgf_B30_trim(5,i) = {sgf_B30_trimcurr(75:100-1,:)};
    sgf_B30_trim(6,i) = {sgf_B30_trimcurr(100:125-1,:)};
    sgf_B30_trim(7,i) = {sgf_B30_trimcurr(125:150-1,:)};
    sgf_B30_trim(8,i) = {sgf_B30_trimcurr(150:175-1,:)};
    sgf_B30_trim(9,i) = {sgf_B30_trimcurr(175:200-1,:)};
    sgf_B30_trim(10,i) = {sgf_B30_trimcurr(200:225-1,:)};
    sgf_B30_trim(11,i) = {sgf_B30_trimcurr(225:250-1,:)};
    sgf_B30_trim(12,i) = {sgf_B30_trimcurr(250:275-1,:)};
    sgf_B30_trim(13,i) = {sgf_B30_trimcurr(275:300-1,:)};
    sgf_B30_trim(14,i) = {sgf_B30_trimcurr(300:325-1,:)};
    sgf_B30_trim(15,i) = {sgf_B30_trimcurr(325:350-1,:)};
    sgf_B30_trim(16,i) = {sgf_B30_trimcurr(350:375-1,:)};
    sgf_B30_trim(17,i) = {sgf_B30_trimcurr(375:400-1,:)};
    sgf_B30_trim(18,i) = {sgf_B30_trimcurr(400:425-1,:)};
    sgf_B30_trim(19,i) = {sgf_B30_trimcurr(425:450-1,:)};
    sgf_B30_trim(20,i) = {sgf_B30_trimcurr(450:475-1,:)};
    sgf_B30_trim(21,i) = {sgf_B30_trimcurr(475:500-1,:)};
    % -------------- 500
    sgf_B30_trim(22,i) = {sgf_B30_trimcurr(500:525-1,:)};
    sgf_B30_trim(23,i) = {sgf_B30_trimcurr(525:550-1,:)};
    sgf_B30_trim(24,i) = {sgf_B30_trimcurr(550:575-1,:)};
    sgf_B30_trim(25,i) = {sgf_B30_trimcurr(575:600-1,:)};
    sgf_B30_trim(26,i) = {sgf_B30_trimcurr(600:625-1,:)};
    sgf_B30_trim(27,i) = {sgf_B30_trimcurr(625:650-1,:)};
    sgf_B30_trim(28,i) = {sgf_B30_trimcurr(650:675-1,:)};
    sgf_B30_trim(29,i) = {sgf_B30_trimcurr(675:700-1,:)};
    sgf_B30_trim(30,i) = {sgf_B30_trimcurr(700:725-1,:)};
    sgf_B30_trim(31,i) = {sgf_B30_trimcurr(725:750-1,:)};
    sgf_B30_trim(32,i) = {sgf_B30_trimcurr(750:775-1,:)};
    sgf_B30_trim(33,i) = {sgf_B30_trimcurr(775:800-1,:)};
    sgf_B30_trim(34,i) = {sgf_B30_trimcurr(800:825-1,:)};
    sgf_B30_trim(35,i) = {sgf_B30_trimcurr(825:850-1,:)};
    sgf_B30_trim(36,i) = {sgf_B30_trimcurr(850:875-1,:)};
    sgf_B30_trim(37,i) = {sgf_B30_trimcurr(875:900-1,:)};
    sgf_B30_trim(38,i) = {sgf_B30_trimcurr(900:925-1,:)};
    sgf_B30_trim(39,i) = {sgf_B30_trimcurr(925:950-1,:)};
    sgf_B30_trim(40,i) = {sgf_B30_trimcurr(950:975-1,:)};
    sgf_B30_trim(41,i) = {sgf_B30_trimcurr(975:1000-1,:)};
end

%% =============================================== C
for i = 1:C10_col
    %sgf_C10_trimmed{i} = cellfun(fun,sgf_C10)
    sgf_C10_trimcurr = sgf_C10{i};

    sgf_C10_trim(1,i) = {sgf_C10_trimcurr(1:1000,:)};
    sgf_C10_trim(2,i) = {sgf_C10_trimcurr(1:25,:)};
    sgf_C10_trim(3,i) = {sgf_C10_trimcurr(25:50-1,:)};
    sgf_C10_trim(4,i) = {sgf_C10_trimcurr(50:75-1,:)};
    sgf_C10_trim(5,i) = {sgf_C10_trimcurr(75:100-1,:)};
    sgf_C10_trim(6,i) = {sgf_C10_trimcurr(100:125-1,:)};
    sgf_C10_trim(7,i) = {sgf_C10_trimcurr(125:150-1,:)};
    sgf_C10_trim(8,i) = {sgf_C10_trimcurr(150:175-1,:)};
    sgf_C10_trim(9,i) = {sgf_C10_trimcurr(175:200-1,:)};
    sgf_C10_trim(10,i) = {sgf_C10_trimcurr(200:225-1,:)};
    sgf_C10_trim(11,i) = {sgf_C10_trimcurr(225:250-1,:)};
    sgf_C10_trim(12,i) = {sgf_C10_trimcurr(250:275-1,:)};
    sgf_C10_trim(13,i) = {sgf_C10_trimcurr(275:300-1,:)};
    sgf_C10_trim(14,i) = {sgf_C10_trimcurr(300:325-1,:)};
    sgf_C10_trim(15,i) = {sgf_C10_trimcurr(325:350-1,:)};
    sgf_C10_trim(16,i) = {sgf_C10_trimcurr(350:375-1,:)};
    sgf_C10_trim(17,i) = {sgf_C10_trimcurr(375:400-1,:)};
    sgf_C10_trim(18,i) = {sgf_C10_trimcurr(400:425-1,:)};
    sgf_C10_trim(19,i) = {sgf_C10_trimcurr(425:450-1,:)};
    sgf_C10_trim(20,i) = {sgf_C10_trimcurr(450:475-1,:)};
    sgf_C10_trim(21,i) = {sgf_C10_trimcurr(475:500-1,:)};
    % -------------- 500
    sgf_C10_trim(22,i) = {sgf_C10_trimcurr(500:525-1,:)};
    sgf_C10_trim(23,i) = {sgf_C10_trimcurr(525:550-1,:)};
    sgf_C10_trim(24,i) = {sgf_C10_trimcurr(550:575-1,:)};
    sgf_C10_trim(25,i) = {sgf_C10_trimcurr(575:600-1,:)};
    sgf_C10_trim(26,i) = {sgf_C10_trimcurr(600:625-1,:)};
    sgf_C10_trim(27,i) = {sgf_C10_trimcurr(625:650-1,:)};
    sgf_C10_trim(28,i) = {sgf_C10_trimcurr(650:675-1,:)};
    sgf_C10_trim(29,i) = {sgf_C10_trimcurr(675:700-1,:)};
    sgf_C10_trim(30,i) = {sgf_C10_trimcurr(700:725-1,:)};
    sgf_C10_trim(31,i) = {sgf_C10_trimcurr(725:750-1,:)};
    sgf_C10_trim(32,i) = {sgf_C10_trimcurr(750:775-1,:)};
    sgf_C10_trim(33,i) = {sgf_C10_trimcurr(775:800-1,:)};
    sgf_C10_trim(34,i) = {sgf_C10_trimcurr(800:825-1,:)};
    sgf_C10_trim(35,i) = {sgf_C10_trimcurr(825:850-1,:)};
    sgf_C10_trim(36,i) = {sgf_C10_trimcurr(850:875-1,:)};
    sgf_C10_trim(37,i) = {sgf_C10_trimcurr(875:900-1,:)};
    sgf_C10_trim(38,i) = {sgf_C10_trimcurr(900:925-1,:)};
    sgf_C10_trim(39,i) = {sgf_C10_trimcurr(925:950-1,:)};
    sgf_C10_trim(40,i) = {sgf_C10_trimcurr(950:975-1,:)};
    sgf_C10_trim(41,i) = {sgf_C10_trimcurr(975:1000-1,:)};
end

for i = 1:C15_col
    %sgf_C15_trimmed{i} = cellfun(fun,sgf_C15)
    sgf_C15_trimcurr = sgf_C15{i};

    sgf_C15_trim(1,i) = {sgf_C15_trimcurr(1:1000,:)};
    sgf_C15_trim(2,i) = {sgf_C15_trimcurr(1:25,:)};
    sgf_C15_trim(3,i) = {sgf_C15_trimcurr(25:50-1,:)};
    sgf_C15_trim(4,i) = {sgf_C15_trimcurr(50:75-1,:)};
    sgf_C15_trim(5,i) = {sgf_C15_trimcurr(75:100-1,:)};
    sgf_C15_trim(6,i) = {sgf_C15_trimcurr(100:125-1,:)};
    sgf_C15_trim(7,i) = {sgf_C15_trimcurr(125:150-1,:)};
    sgf_C15_trim(8,i) = {sgf_C15_trimcurr(150:175-1,:)};
    sgf_C15_trim(9,i) = {sgf_C15_trimcurr(175:200-1,:)};
    sgf_C15_trim(10,i) = {sgf_C15_trimcurr(200:225-1,:)};
    sgf_C15_trim(11,i) = {sgf_C15_trimcurr(225:250-1,:)};
    sgf_C15_trim(12,i) = {sgf_C15_trimcurr(250:275-1,:)};
    sgf_C15_trim(13,i) = {sgf_C15_trimcurr(275:300-1,:)};
    sgf_C15_trim(14,i) = {sgf_C15_trimcurr(300:325-1,:)};
    sgf_C15_trim(15,i) = {sgf_C15_trimcurr(325:350-1,:)};
    sgf_C15_trim(16,i) = {sgf_C15_trimcurr(350:375-1,:)};
    sgf_C15_trim(17,i) = {sgf_C15_trimcurr(375:400-1,:)};
    sgf_C15_trim(18,i) = {sgf_C15_trimcurr(400:425-1,:)};
    sgf_C15_trim(19,i) = {sgf_C15_trimcurr(425:450-1,:)};
    sgf_C15_trim(20,i) = {sgf_C15_trimcurr(450:475-1,:)};
    sgf_C15_trim(21,i) = {sgf_C15_trimcurr(475:500-1,:)};
    % -------------- 500
    sgf_C15_trim(22,i) = {sgf_C15_trimcurr(500:525-1,:)};
    sgf_C15_trim(23,i) = {sgf_C15_trimcurr(525:550-1,:)};
    sgf_C15_trim(24,i) = {sgf_C15_trimcurr(550:575-1,:)};
    sgf_C15_trim(25,i) = {sgf_C15_trimcurr(575:600-1,:)};
    sgf_C15_trim(26,i) = {sgf_C15_trimcurr(600:625-1,:)};
    sgf_C15_trim(27,i) = {sgf_C15_trimcurr(625:650-1,:)};
    sgf_C15_trim(28,i) = {sgf_C15_trimcurr(650:675-1,:)};
    sgf_C15_trim(29,i) = {sgf_C15_trimcurr(675:700-1,:)};
    sgf_C15_trim(30,i) = {sgf_C15_trimcurr(700:725-1,:)};
    sgf_C15_trim(31,i) = {sgf_C15_trimcurr(725:750-1,:)};
    sgf_C15_trim(32,i) = {sgf_C15_trimcurr(750:775-1,:)};
    sgf_C15_trim(33,i) = {sgf_C15_trimcurr(775:800-1,:)};
    sgf_C15_trim(34,i) = {sgf_C15_trimcurr(800:825-1,:)};
    sgf_C15_trim(35,i) = {sgf_C15_trimcurr(825:850-1,:)};
    sgf_C15_trim(36,i) = {sgf_C15_trimcurr(850:875-1,:)};
    sgf_C15_trim(37,i) = {sgf_C15_trimcurr(875:900-1,:)};
    sgf_C15_trim(38,i) = {sgf_C15_trimcurr(900:925-1,:)};
    sgf_C15_trim(39,i) = {sgf_C15_trimcurr(925:950-1,:)};
    sgf_C15_trim(40,i) = {sgf_C15_trimcurr(950:975-1,:)};
    sgf_C15_trim(41,i) = {sgf_C15_trimcurr(975:1000-1,:)};
end

for i = 1:C20_col
    %sgf_C20_trimmed{i} = cellfun(fun,sgf_C20)
    sgf_C20_trimcurr = sgf_C20{i};

    sgf_C20_trim(1,i) = {sgf_C20_trimcurr(1:1000,:)};
    sgf_C20_trim(2,i) = {sgf_C20_trimcurr(1:25,:)};
    sgf_C20_trim(3,i) = {sgf_C20_trimcurr(25:50-1,:)};
    sgf_C20_trim(4,i) = {sgf_C20_trimcurr(50:75-1,:)};
    sgf_C20_trim(5,i) = {sgf_C20_trimcurr(75:100-1,:)};
    sgf_C20_trim(6,i) = {sgf_C20_trimcurr(100:125-1,:)};
    sgf_C20_trim(7,i) = {sgf_C20_trimcurr(125:150-1,:)};
    sgf_C20_trim(8,i) = {sgf_C20_trimcurr(150:175-1,:)};
    sgf_C20_trim(9,i) = {sgf_C20_trimcurr(175:200-1,:)};
    sgf_C20_trim(10,i) = {sgf_C20_trimcurr(200:225-1,:)};
    sgf_C20_trim(11,i) = {sgf_C20_trimcurr(225:250-1,:)};
    sgf_C20_trim(12,i) = {sgf_C20_trimcurr(250:275-1,:)};
    sgf_C20_trim(13,i) = {sgf_C20_trimcurr(275:300-1,:)};
    sgf_C20_trim(14,i) = {sgf_C20_trimcurr(300:325-1,:)};
    sgf_C20_trim(15,i) = {sgf_C20_trimcurr(325:350-1,:)};
    sgf_C20_trim(16,i) = {sgf_C20_trimcurr(350:375-1,:)};
    sgf_C20_trim(17,i) = {sgf_C20_trimcurr(375:400-1,:)};
    sgf_C20_trim(18,i) = {sgf_C20_trimcurr(400:425-1,:)};
    sgf_C20_trim(19,i) = {sgf_C20_trimcurr(425:450-1,:)};
    sgf_C20_trim(20,i) = {sgf_C20_trimcurr(450:475-1,:)};
    sgf_C20_trim(21,i) = {sgf_C20_trimcurr(475:500-1,:)};
    % -------------- 500
    sgf_C20_trim(22,i) = {sgf_C20_trimcurr(500:525-1,:)};
    sgf_C20_trim(23,i) = {sgf_C20_trimcurr(525:550-1,:)};
    sgf_C20_trim(24,i) = {sgf_C20_trimcurr(550:575-1,:)};
    sgf_C20_trim(25,i) = {sgf_C20_trimcurr(575:600-1,:)};
    sgf_C20_trim(26,i) = {sgf_C20_trimcurr(600:625-1,:)};
    sgf_C20_trim(27,i) = {sgf_C20_trimcurr(625:650-1,:)};
    sgf_C20_trim(28,i) = {sgf_C20_trimcurr(650:675-1,:)};
    sgf_C20_trim(29,i) = {sgf_C20_trimcurr(675:700-1,:)};
    sgf_C20_trim(30,i) = {sgf_C20_trimcurr(700:725-1,:)};
    sgf_C20_trim(31,i) = {sgf_C20_trimcurr(725:750-1,:)};
    sgf_C20_trim(32,i) = {sgf_C20_trimcurr(750:775-1,:)};
    sgf_C20_trim(33,i) = {sgf_C20_trimcurr(775:800-1,:)};
    sgf_C20_trim(34,i) = {sgf_C20_trimcurr(800:825-1,:)};
    sgf_C20_trim(35,i) = {sgf_C20_trimcurr(825:850-1,:)};
    sgf_C20_trim(36,i) = {sgf_C20_trimcurr(850:875-1,:)};
    sgf_C20_trim(37,i) = {sgf_C20_trimcurr(875:900-1,:)};
    sgf_C20_trim(38,i) = {sgf_C20_trimcurr(900:925-1,:)};
    sgf_C20_trim(39,i) = {sgf_C20_trimcurr(925:950-1,:)};
    sgf_C20_trim(40,i) = {sgf_C20_trimcurr(950:975-1,:)};
    sgf_C20_trim(41,i) = {sgf_C20_trimcurr(975:1000-1,:)};
end

for i = 1:C25_col
    %sgf_C25_trimmed{i} = cellfun(fun,sgf_C25)
    sgf_C25_trimcurr = sgf_C25{i};

    sgf_C25_trim(1,i) = {sgf_C25_trimcurr(1:1000,:)};
    sgf_C25_trim(2,i) = {sgf_C25_trimcurr(1:25,:)};
    sgf_C25_trim(3,i) = {sgf_C25_trimcurr(25:50-1,:)};
    sgf_C25_trim(4,i) = {sgf_C25_trimcurr(50:75-1,:)};
    sgf_C25_trim(5,i) = {sgf_C25_trimcurr(75:100-1,:)};
    sgf_C25_trim(6,i) = {sgf_C25_trimcurr(100:125-1,:)};
    sgf_C25_trim(7,i) = {sgf_C25_trimcurr(125:150-1,:)};
    sgf_C25_trim(8,i) = {sgf_C25_trimcurr(150:175-1,:)};
    sgf_C25_trim(9,i) = {sgf_C25_trimcurr(175:200-1,:)};
    sgf_C25_trim(10,i) = {sgf_C25_trimcurr(200:225-1,:)};
    sgf_C25_trim(11,i) = {sgf_C25_trimcurr(225:250-1,:)};
    sgf_C25_trim(12,i) = {sgf_C25_trimcurr(250:275-1,:)};
    sgf_C25_trim(13,i) = {sgf_C25_trimcurr(275:300-1,:)};
    sgf_C25_trim(14,i) = {sgf_C25_trimcurr(300:325-1,:)};
    sgf_C25_trim(15,i) = {sgf_C25_trimcurr(325:350-1,:)};
    sgf_C25_trim(16,i) = {sgf_C25_trimcurr(350:375-1,:)};
    sgf_C25_trim(17,i) = {sgf_C25_trimcurr(375:400-1,:)};
    sgf_C25_trim(18,i) = {sgf_C25_trimcurr(400:425-1,:)};
    sgf_C25_trim(19,i) = {sgf_C25_trimcurr(425:450-1,:)};
    sgf_C25_trim(20,i) = {sgf_C25_trimcurr(450:475-1,:)};
    sgf_C25_trim(21,i) = {sgf_C25_trimcurr(475:500-1,:)};
    % -------------- 500
    sgf_C25_trim(22,i) = {sgf_C25_trimcurr(500:525-1,:)};
    sgf_C25_trim(23,i) = {sgf_C25_trimcurr(525:550-1,:)};
    sgf_C25_trim(24,i) = {sgf_C25_trimcurr(550:575-1,:)};
    sgf_C25_trim(25,i) = {sgf_C25_trimcurr(575:600-1,:)};
    sgf_C25_trim(26,i) = {sgf_C25_trimcurr(600:625-1,:)};
    sgf_C25_trim(27,i) = {sgf_C25_trimcurr(625:650-1,:)};
    sgf_C25_trim(28,i) = {sgf_C25_trimcurr(650:675-1,:)};
    sgf_C25_trim(29,i) = {sgf_C25_trimcurr(675:700-1,:)};
    sgf_C25_trim(30,i) = {sgf_C25_trimcurr(700:725-1,:)};
    sgf_C25_trim(31,i) = {sgf_C25_trimcurr(725:750-1,:)};
    sgf_C25_trim(32,i) = {sgf_C25_trimcurr(750:775-1,:)};
    sgf_C25_trim(33,i) = {sgf_C25_trimcurr(775:800-1,:)};
    sgf_C25_trim(34,i) = {sgf_C25_trimcurr(800:825-1,:)};
    sgf_C25_trim(35,i) = {sgf_C25_trimcurr(825:850-1,:)};
    sgf_C25_trim(36,i) = {sgf_C25_trimcurr(850:875-1,:)};
    sgf_C25_trim(37,i) = {sgf_C25_trimcurr(875:900-1,:)};
    sgf_C25_trim(38,i) = {sgf_C25_trimcurr(900:925-1,:)};
    sgf_C25_trim(39,i) = {sgf_C25_trimcurr(925:950-1,:)};
    sgf_C25_trim(40,i) = {sgf_C25_trimcurr(950:975-1,:)};
    sgf_C25_trim(41,i) = {sgf_C25_trimcurr(975:1000-1,:)};
end

for i = 1:C30_col
    %sgf_C30_trimmed{i} = cellfun(fun,sgf_C30)
    sgf_C30_trimcurr = sgf_C30{i};

    sgf_C30_trim(1,i) = {sgf_C30_trimcurr(1:1000,:)};
    sgf_C30_trim(2,i) = {sgf_C30_trimcurr(1:25,:)};
    sgf_C30_trim(3,i) = {sgf_C30_trimcurr(25:50-1,:)};
    sgf_C30_trim(4,i) = {sgf_C30_trimcurr(50:75-1,:)};
    sgf_C30_trim(5,i) = {sgf_C30_trimcurr(75:100-1,:)};
    sgf_C30_trim(6,i) = {sgf_C30_trimcurr(100:125-1,:)};
    sgf_C30_trim(7,i) = {sgf_C30_trimcurr(125:150-1,:)};
    sgf_C30_trim(8,i) = {sgf_C30_trimcurr(150:175-1,:)};
    sgf_C30_trim(9,i) = {sgf_C30_trimcurr(175:200-1,:)};
    sgf_C30_trim(10,i) = {sgf_C30_trimcurr(200:225-1,:)};
    sgf_C30_trim(11,i) = {sgf_C30_trimcurr(225:250-1,:)};
    sgf_C30_trim(12,i) = {sgf_C30_trimcurr(250:275-1,:)};
    sgf_C30_trim(13,i) = {sgf_C30_trimcurr(275:300-1,:)};
    sgf_C30_trim(14,i) = {sgf_C30_trimcurr(300:325-1,:)};
    sgf_C30_trim(15,i) = {sgf_C30_trimcurr(325:350-1,:)};
    sgf_C30_trim(16,i) = {sgf_C30_trimcurr(350:375-1,:)};
    sgf_C30_trim(17,i) = {sgf_C30_trimcurr(375:400-1,:)};
    sgf_C30_trim(18,i) = {sgf_C30_trimcurr(400:425-1,:)};
    sgf_C30_trim(19,i) = {sgf_C30_trimcurr(425:450-1,:)};
    sgf_C30_trim(20,i) = {sgf_C30_trimcurr(450:475-1,:)};
    sgf_C30_trim(21,i) = {sgf_C30_trimcurr(475:500-1,:)};
    % -------------- 500
    sgf_C30_trim(22,i) = {sgf_C30_trimcurr(500:525-1,:)};
    sgf_C30_trim(23,i) = {sgf_C30_trimcurr(525:550-1,:)};
    sgf_C30_trim(24,i) = {sgf_C30_trimcurr(550:575-1,:)};
    sgf_C30_trim(25,i) = {sgf_C30_trimcurr(575:600-1,:)};
    sgf_C30_trim(26,i) = {sgf_C30_trimcurr(600:625-1,:)};
    sgf_C30_trim(27,i) = {sgf_C30_trimcurr(625:650-1,:)};
    sgf_C30_trim(28,i) = {sgf_C30_trimcurr(650:675-1,:)};
    sgf_C30_trim(29,i) = {sgf_C30_trimcurr(675:700-1,:)};
    sgf_C30_trim(30,i) = {sgf_C30_trimcurr(700:725-1,:)};
    sgf_C30_trim(31,i) = {sgf_C30_trimcurr(725:750-1,:)};
    sgf_C30_trim(32,i) = {sgf_C30_trimcurr(750:775-1,:)};
    sgf_C30_trim(33,i) = {sgf_C30_trimcurr(775:800-1,:)};
    sgf_C30_trim(34,i) = {sgf_C30_trimcurr(800:825-1,:)};
    sgf_C30_trim(35,i) = {sgf_C30_trimcurr(825:850-1,:)};
    sgf_C30_trim(36,i) = {sgf_C30_trimcurr(850:875-1,:)};
    sgf_C30_trim(37,i) = {sgf_C30_trimcurr(875:900-1,:)};
    sgf_C30_trim(38,i) = {sgf_C30_trimcurr(900:925-1,:)};
    sgf_C30_trim(39,i) = {sgf_C30_trimcurr(925:950-1,:)};
    sgf_C30_trim(40,i) = {sgf_C30_trimcurr(950:975-1,:)};
    sgf_C30_trim(41,i) = {sgf_C30_trimcurr(975:1000-1,:)};
end

%% Average all audio files of same nature
% Note that:
% CWTcoeffs_A_Complete{A,B} = (C, D)
    % A = number of time steps (41 groups of 25ms)
    % B = audio samples (235 iterations for each sample-liver thickness group)
    % C = Frequency Steps (100)
    % D = trimmed time steps (25)
% We wanna average for all B

%% =============================================== A
% --------------------------------------- Depth 10mm
for i = 2:41    % For every time step
    for k = 1:A10_col    % For every audio file
        sgf_A10_T_AvgRows_curr(:,i-1,k) = sgf_A10_trim{i,k};    % sgf_A10_trim are time bands of 25ms

        A10_Sum_Rcurr = sum(sgf_A10_T_AvgRows_curr, 3);
        [A10S_row, A10S_col] = size(A10_Sum_Rcurr);

        A10_Avg_R = A10_Sum_Rcurr/A10S_row;       
    end
end

CA10_Avg_R = A10_Avg_R(:,1);

for i = 2:A10S_col
    catA10 = A10_Avg_R(:,i);
	CA10_Avg_R = cat(1, CA10_Avg_R, catA10);
end

% --------------------------------------- Depth 15mm
for i = 2:41    % For every time step
    for k = 1:A15_col    % For every audio file
        sgf_A15_T_AvgRows_curr(:,i-1,k) = sgf_A15_trim{i,k};    % sgf_A15_trim are time bands of 25ms

        A15_Sum_Rcurr = sum(sgf_A15_T_AvgRows_curr, 3);
        [A15S_row, A15S_col] = size(A15_Sum_Rcurr);

        A15_Avg_R = A15_Sum_Rcurr/A15S_row;       
    end
end

CA15_Avg_R = A15_Avg_R(:,1);

for i = 2:A15S_col
    catA15 = A15_Avg_R(:,i);
	CA15_Avg_R = cat(1, CA15_Avg_R, catA15);
end

% --------------------------------------- Depth 20mm
for i = 2:41    % For every time step
    for k = 1:A20_col    % For every audio file
        sgf_A20_T_AvgRows_curr(:,i-1,k) = sgf_A20_trim{i,k};    % sgf_A20_trim are time bands of 25ms

        A20_Sum_Rcurr = sum(sgf_A20_T_AvgRows_curr, 3);
        [A20S_row, A20S_col] = size(A20_Sum_Rcurr);

        A20_Avg_R = A20_Sum_Rcurr/A20S_row;       
    end
end

CA20_Avg_R = A20_Avg_R(:,1);

for i = 2:A20S_col
    catA20 = A20_Avg_R(:,i);
	CA20_Avg_R = cat(1, CA20_Avg_R, catA20);
end

% --------------------------------------- Depth 25mm
for i = 2:41    % For every time step
    for k = 1:A25_col    % For every audio file
        sgf_A25_T_AvgRows_curr(:,i-1,k) = sgf_A25_trim{i,k};    % sgf_A25_trim are time bands of 25ms

        A25_Sum_Rcurr = sum(sgf_A25_T_AvgRows_curr, 3);
        [A25S_row, A25S_col] = size(A25_Sum_Rcurr);

        A25_Avg_R = A25_Sum_Rcurr/A25S_row;       
    end
end

CA25_Avg_R = A25_Avg_R(:,1);

for i = 2:A25S_col
    catA25 = A25_Avg_R(:,i);
	CA25_Avg_R = cat(1, CA25_Avg_R, catA25);
end

% --------------------------------------- Depth 30mm
for i = 2:41    % For every time step
    for k = 1:A30_col    % For every audio file
        sgf_A30_T_AvgRows_curr(:,i-1,k) = sgf_A30_trim{i,k};    % sgf_A30_trim are time bands of 25ms

        A30_Sum_Rcurr = sum(sgf_A30_T_AvgRows_curr, 3);
        [A30S_row, A30S_col] = size(A30_Sum_Rcurr);

        A30_Avg_R = A30_Sum_Rcurr/A30S_row;       
    end
end

CA30_Avg_R = A30_Avg_R(:,1);

for i = 2:A30S_col
    catA30 = A30_Avg_R(:,i);
	CA30_Avg_R = cat(1, CA30_Avg_R, catA30);
end

%% =============================================== B
% --------------------------------------- Depth 10mm
for i = 2:41    % For every time step
    for k = 1:B10_col    % For every audio file
        sgf_B10_T_AvgRows_curr(:,i-1,k) = sgf_B10_trim{i,k};    % sgf_B10_trim are time bands of 25ms

        B10_Sum_Rcurr = sum(sgf_B10_T_AvgRows_curr, 3);
        [B10S_row, B10S_col] = size(B10_Sum_Rcurr);

        B10_Avg_R = B10_Sum_Rcurr/B10S_row;       
    end
end

CB10_Avg_R = B10_Avg_R(:,1);

for i = 2:B10S_col
    catB10 = B10_Avg_R(:,i);
	CB10_Avg_R = cat(1, CB10_Avg_R, catB10);
end

% --------------------------------------- Depth 15mm
for i = 2:41    % For every time step
    for k = 1:B15_col    % For every audio file
        sgf_B15_T_AvgRows_curr(:,i-1,k) = sgf_B15_trim{i,k};    % sgf_B15_trim are time bands of 25ms

        B15_Sum_Rcurr = sum(sgf_B15_T_AvgRows_curr, 3);
        [B15S_row, B15S_col] = size(B15_Sum_Rcurr);

        B15_Avg_R = B15_Sum_Rcurr/B15S_row;       
    end
end

CB15_Avg_R = B15_Avg_R(:,1);

for i = 2:B15S_col
    catB15 = B15_Avg_R(:,i);
	CB15_Avg_R = cat(1, CB15_Avg_R, catB15);
end

% --------------------------------------- Depth 20mm
for i = 2:41    % For every time step
    for k = 1:B20_col    % For every audio file
        sgf_B20_T_AvgRows_curr(:,i-1,k) = sgf_B20_trim{i,k};    % sgf_B20_trim are time bands of 25ms

        B20_Sum_Rcurr = sum(sgf_B20_T_AvgRows_curr, 3);
        [B20S_row, B20S_col] = size(B20_Sum_Rcurr);

        B20_Avg_R = B20_Sum_Rcurr/B20S_row;       
    end
end

CB20_Avg_R = B20_Avg_R(:,1);

for i = 2:B20S_col
    catB20 = B20_Avg_R(:,i);
	CB20_Avg_R = cat(1, CB20_Avg_R, catB20);
end

% --------------------------------------- Depth 25mm
for i = 2:41    % For every time step
    for k = 1:B25_col    % For every audio file
        sgf_B25_T_AvgRows_curr(:,i-1,k) = sgf_B25_trim{i,k};    % sgf_B25_trim are time bands of 25ms

        B25_Sum_Rcurr = sum(sgf_B25_T_AvgRows_curr, 3);
        [B25S_row, B25S_col] = size(B25_Sum_Rcurr);

        B25_Avg_R = B25_Sum_Rcurr/B25S_row;       
    end
end

CB25_Avg_R = B25_Avg_R(:,1);

for i = 2:B25S_col
    catB25 = B25_Avg_R(:,i);
	CB25_Avg_R = cat(1, CB25_Avg_R, catB25);
end

% --------------------------------------- Depth 30mm
for i = 2:41    % For every time step
    for k = 1:B30_col    % For every audio file
        sgf_B30_T_AvgRows_curr(:,i-1,k) = sgf_B30_trim{i,k};    % sgf_B30_trim are time bands of 25ms

        B30_Sum_Rcurr = sum(sgf_B30_T_AvgRows_curr, 3);
        [B30S_row, B30S_col] = size(B30_Sum_Rcurr);

        B30_Avg_R = B30_Sum_Rcurr/B30S_row;       
    end
end

CB30_Avg_R = B30_Avg_R(:,1);

for i = 2:B30S_col
    catB30 = B30_Avg_R(:,i);
	CB30_Avg_R = cat(1, CB30_Avg_R, catB30);
end

%% =============================================== C
% --------------------------------------- Depth 10mm
for i = 2:41    % For every time step
    for k = 1:C10_col    % For every audio file
        sgf_C10_T_AvgRows_curr(:,i-1,k) = sgf_C10_trim{i,k};    % sgf_C10_trim are time bands of 25ms

        C10_Sum_Rcurr = sum(sgf_C10_T_AvgRows_curr, 3);
        [C10S_row, C10S_col] = size(C10_Sum_Rcurr);

        C10_Avg_R = C10_Sum_Rcurr/C10S_row;       
    end
end

CC10_Avg_R = C10_Avg_R(:,1);

for i = 2:C10S_col
    catC10 = C10_Avg_R(:,i);
	CC10_Avg_R = cat(1, CC10_Avg_R, catC10);
end

% --------------------------------------- Depth 15mm
for i = 2:41    % For every time step
    for k = 1:C15_col    % For every audio file
        sgf_C15_T_AvgRows_curr(:,i-1,k) = sgf_C15_trim{i,k};    % sgf_C15_trim are time bands of 25ms

        C15_Sum_Rcurr = sum(sgf_C15_T_AvgRows_curr, 3);
        [C15S_row, C15S_col] = size(C15_Sum_Rcurr);

        C15_Avg_R = C15_Sum_Rcurr/C15S_row;       
    end
end

CC15_Avg_R = C15_Avg_R(:,1);

for i = 2:C15S_col
    catC15 = C15_Avg_R(:,i);
	CC15_Avg_R = cat(1, CC15_Avg_R, catC15);
end

% --------------------------------------- Depth 20mm
for i = 2:41    % For every time step
    for k = 1:C20_col    % For every audio file
        sgf_C20_T_AvgRows_curr(:,i-1,k) = sgf_C20_trim{i,k};    % sgf_C20_trim are time bands of 25ms

        C20_Sum_Rcurr = sum(sgf_C20_T_AvgRows_curr, 3);
        [C20S_row, C20S_col] = size(C20_Sum_Rcurr);

        C20_Avg_R = C20_Sum_Rcurr/C20S_row;       
    end
end

CC20_Avg_R = C20_Avg_R(:,1);

for i = 2:C20S_col
    catC20 = C20_Avg_R(:,i);
	CC20_Avg_R = cat(1, CC20_Avg_R, catC20);
end

% --------------------------------------- Depth 25mm
for i = 2:41    % For every time step
    for k = 1:C25_col    % For every audio file
        sgf_C25_T_AvgRows_curr(:,i-1,k) = sgf_C25_trim{i,k};    % sgf_C25_trim are time bands of 25ms

        C25_Sum_Rcurr = sum(sgf_C25_T_AvgRows_curr, 3);
        [C25S_row, C25S_col] = size(C25_Sum_Rcurr);

        C25_Avg_R = C25_Sum_Rcurr/C25S_row;       
    end
end

CC25_Avg_R = C25_Avg_R(:,1);

for i = 2:C25S_col
    catC25 = C25_Avg_R(:,i);
	CC25_Avg_R = cat(1, CC25_Avg_R, catC25);
end

% --------------------------------------- Depth 30mm
for i = 2:41    % For every time step
    for k = 1:C30_col    % For every audio file
        sgf_C30_T_AvgRows_curr(:,i-1,k) = sgf_C30_trim{i,k};    % sgf_C30_trim are time bands of 25ms

        C30_Sum_Rcurr = sum(sgf_C30_T_AvgRows_curr, 3);
        [C30S_row, C30S_col] = size(C30_Sum_Rcurr);

        C30_Avg_R = C30_Sum_Rcurr/C30S_row;       
    end
end

CC30_Avg_R = C30_Avg_R(:,1);

for i = 2:C30S_col
    catC30 = C30_Avg_R(:,i);
	CC30_Avg_R = cat(1, CC30_Avg_R, catC30);
end

%% ================================= Plot the averages per frequency band ===============================
% I create squares of 25Hz and 25ms and average them. Then I can plot these graphs, which should be averaged scalograms.
% Continuous wavelet transform up to 500 scale levels (analogous to frequency levels) using DB10 wavelet. 

% ======================================================== A
figure(8);

% --------------------------------------- CWT for Depth 10mm
subplot(5,3,1); % 5 rows, 3 columns
CWTcoeffs_A10_avg = cwt(CA10_Avg_R,5:5:500,'sym10','plot');     %cwt for continuous 1D wavelet transform
[cfs_A10,frq_A10] = cwt(CA10_Avg_R,fs_now);

colormap jet; 
h = colorbar;
set(get(h,'label'),'string','C-Values');

title('CWT Scalogram - Average for Samples A, 10mm','fontsize',5)
xlabel('Time(ms)','fontsize',5);
ylabel('Frequency (Hz)','fontsize',5)
set(gca,'FontSize',5)

% --------------------------------------- CWT for Depth 15mm
subplot(5,3,4); % 5 rows, 3 columns
CWTcoeffs_A15_avg = cwt(CA15_Avg_R,5:5:500,'sym10','plot');     %cwt for continuous 1D wavelet transform
[cfs_A15,frq_A15] = cwt(CA15_Avg_R,fs_now);

colormap jet; 
h = colorbar;
set(get(h,'label'),'string','C-Values');

title('CWT Scalogram - Average for Samples A, 15mm','fontsize',5)
xlabel('Time(ms)','fontsize',5);
ylabel('Frequency (Hz)','fontsize',5)
set(gca,'fontsize',5)

% --------------------------------------- CWT for Depth 20mm
subplot(5,3,7); % 5 rows, 3 columns
CWTcoeffs_A20_avg = cwt(CA20_Avg_R,5:5:500,'sym10','plot');     %cwt for continuous 1D wavelet transform
[cfs_A20,frq_A20] = cwt(CA20_Avg_R,fs_now);

colormap jet; 
h = colorbar;
set(get(h,'label'),'string','C-Values');

title('CWT Scalogram - Average for Samples A, 20mm','fontsize',5)
xlabel('Time(ms)','fontsize',5);
ylabel('Frequency (Hz)','fontsize',5)
set(gca,'fontsize',5)

% --------------------------------------- CWT for Depth 25mm
subplot(5,3,10); % 5 rows, 3 columns
CWTcoeffs_A25_avg = cwt(CA25_Avg_R,5:5:500,'sym10','plot');     %cwt for continuous 1D wavelet transform
[cfs_A25,frq_A25] = cwt(CA25_Avg_R,fs_now);

colormap jet; 
h = colorbar;
set(get(h,'label'),'string','C-Values');

title('CWT Scalogram - Average for Samples A, 25mm','fontsize',5)
xlabel('Time(ms)','fontsize',5);
ylabel('Frequency (Hz)','fontsize',5)
set(gca,'fontsize',5)

% --------------------------------------- CWT for Depth 30mm
subplot(5,3,13); % 5 rows, 3 columns
CWTcoeffs_A30_avg = cwt(CA30_Avg_R,5:5:500,'sym10','plot');     %cwt for continuous 1D wavelet transform
[cfs_A30,frq_A30] = cwt(CA30_Avg_R,fs_now);

colormap jet; 
h = colorbar;
set(get(h,'label'),'string','C-Values');

title('CWT Scalogram - Average for Samples A, 30mm','fontsize',5)
xlabel('Time(ms)','fontsize',5);
ylabel('Frequency (Hz)','fontsize',5)
set(gca,'fontsize',5)

%% ======================================================== B
% --------------------------------------- CWT for Depth 10mm
subplot(5,3,2); % 5 rows, 3 columns
CWTcoeffs_B10_avg = cwt(CB10_Avg_R,5:5:500,'sym10','plot');     %cwt for continuous 1D wavelet transform
[cfs_B10,frq_B10] = cwt(CB10_Avg_R,fs_now);

colormap jet; 
h = colorbar;
set(get(h,'label'),'string','C-Values');

title('CWT Scalogram - Average for Samples B, 10mm','fontsize',5)
xlabel('Time(ms)','fontsize',5);
ylabel('Frequency (Hz)','fontsize',5)
set(gca,'fontsize',5)

% --------------------------------------- CWT for Depth 15mm
subplot(5,3,5); % 5 rows, 3 columns
CWTcoeffs_B15_avg = cwt(CB15_Avg_R,5:5:500,'sym10','plot');     %cwt for continuous 1D wavelet transform
[cfs_B15,frq_B15] = cwt(CB15_Avg_R,fs_now);

colormap jet; 
h = colorbar;
set(get(h,'label'),'string','C-Values');

title('CWT Scalogram - Average for Samples B, 15mm','fontsize',5)
xlabel('Time(ms)','fontsize',5);
ylabel('Frequency (Hz)','fontsize',5)
set(gca,'fontsize',5)

% --------------------------------------- CWT for Depth 20mm
subplot(5,3,8); % 5 rows, 3 columns
CWTcoeffs_B20_avg = cwt(CB20_Avg_R,5:5:500,'sym10','plot');     %cwt for continuous 1D wavelet transform
[cfs_B20,frq_B20] = cwt(CB20_Avg_R,fs_now);

colormap jet; 
h = colorbar;
set(get(h,'label'),'string','C-Values');

title('CWT Scalogram - Average for Samples B, 20mm','fontsize',5)
xlabel('Time(ms)','fontsize',5);
ylabel('Frequency (Hz)','fontsize',5)
set(gca,'fontsize',5)

% --------------------------------------- CWT for Depth 25mm
subplot(5,3,11); % 5 rows, 3 columns
CWTcoeffs_B25_avg = cwt(CB25_Avg_R,5:5:500,'sym10','plot');     %cwt for continuous 1D wavelet transform
[cfs_B25,frq_B25] = cwt(CB25_Avg_R,fs_now);

colormap jet; 
h = colorbar;
set(get(h,'label'),'string','C-Values');

title('CWT Scalogram - Average for Samples B, 25mm','fontsize',5)
xlabel('Time(ms)','fontsize',5);
ylabel('Frequency (Hz)','fontsize',5)
set(gca,'fontsize',5)

% --------------------------------------- CWT for Depth 30mm
subplot(5,3,14); % 5 rows, 3 columns
CWTcoeffs_B30_avg = cwt(CB30_Avg_R,5:5:500,'sym10','plot');     %cwt for continuous 1D wavelet transform
[cfs_B30,frq_B30] = cwt(CB30_Avg_R,fs_now);

colormap jet; 
h = colorbar;
set(get(h,'label'),'string','C-Values');

title('CWT Scalogram - Average for Samples B, 30mm','fontsize',5)
xlabel('Time(ms)','fontsize',5);
ylabel('Frequency (Hz)','fontsize',5)
set(gca,'fontsize',5)

%% ======================================================== C
% --------------------------------------- CWT for Depth 10mm
subplot(5,3,3); % 5 rows, 3 columns
CWTcoeffs_C10_avg = cwt(CC10_Avg_R,5:5:500,'sym10','plot');     %cwt for continuous 1D wavelet transform
[cfs_C10,frq_C10] = cwt(CC10_Avg_R,fs_now);

colormap jet; 
h = colorbar;
set(get(h,'label'),'string','C-Values');

title('CWT Scalogram - Average for Samples C, 10mm','fontsize',5)
xlabel('Time(ms)','fontsize',5);
ylabel('Frequency (Hz)','fontsize',5)
set(gca,'fontsize',5)

% --------------------------------------- CWT for Depth 15mm
subplot(5,3,6); % 5 rows, 3 columns
CWTcoeffs_C15_avg = cwt(CC15_Avg_R,5:5:500,'sym10','plot');     %cwt for continuous 1D wavelet transform
[cfs_C15,frq_C15] = cwt(CC15_Avg_R,fs_now);

colormap jet; 
h = colorbar;
set(get(h,'label'),'string','C-Values');

title('CWT Scalogram - Average for Samples C, 15mm','fontsize',5)
xlabel('Time(ms)','fontsize',5);
ylabel('Frequency (Hz)','fontsize',5)
set(gca,'fontsize',5)

% --------------------------------------- CWT for Depth 20mm
subplot(5,3,9); % 5 rows, 3 columns
CWTcoeffs_C20_avg = cwt(CC20_Avg_R,5:5:500,'sym10','plot');     %cwt for continuous 1D wavelet transform
[cfs_C20,frq_C20] = cwt(CC20_Avg_R,fs_now);

colormap jet; 
h = colorbar;
set(get(h,'label'),'string','C-Values');

title('CWT Scalogram - Average for Samples C, 20mm','fontsize',5)
xlabel('Time(ms)','fontsize',5);
ylabel('Frequency (Hz)','fontsize',5)
set(gca,'fontsize',5)

% --------------------------------------- CWT for Depth 25mm
subplot(5,3,12); % 5 rows, 3 columns
CWTcoeffs_C25_avg = cwt(CC25_Avg_R,5:5:500,'sym10','plot');     %cwt for continuous 1D wavelet transform
[cfs_C25,frq_C25] = cwt(CC25_Avg_R,fs_now);

colormap jet; 
h = colorbar;
set(get(h,'label'),'string','C-Values');

title('CWT Scalogram - Average for Samples C, 25mm','fontsize',5)
xlabel('Time(ms)','fontsize',5);
ylabel('Frequency (Hz)','fontsize',5)
set(gca,'fontsize',5)

% --------------------------------------- CWT for Depth 30mm
subplot(5,3,15); % 5 rows, 3 columns
CWTcoeffs_C30_avg = cwt(CC30_Avg_R,5:5:500,'sym10','plot');     %cwt for continuous 1D wavelet transform
[cfs_C30,frq_C30] = cwt(CC30_Avg_R,fs_now);

colormap jet; 
h = colorbar;
set(get(h,'label'),'string','C-Values');

title('CWT Scalogram - Average for Samples C, 30mm','fontsize',5)
xlabel('Time(ms)','fontsize',5);
ylabel('Frequency (Hz)','fontsize',5)
set(gca,'fontsize',5)

%% Plot the C coefficients from the CWT
% -------------------------------------------- A
figure(9);
plot(1:1000,cfs_A10,'LineWidth',0.7,'Color','b')
hold on
plot(1:1000,cfs_A15,'LineWidth',0.7,'Color','r')
hold on
plot(1:1000,cfs_A20,'LineWidth',0.7,'Color','g')
hold on
plot(1:1000,cfs_A25,'LineWidth',0.7,'Color','m')
hold on
plot(1:1000,cfs_A30,'LineWidth',0.7,'Color','y')
hold off

% Custom plot
axis tight
title('CWT coefficients - Samples A','fontsize',14)
xlabel('Time (samples)','fontsize',14)
ylabel('Magnitude of Cs','fontsize',14)
legend('10mm Liver','15mm Liver','20mm Liver','25mm Liver','30mm Liver')
set(gca,'FontSize',14)

% -------------------------------------------- B
figure(10);
plot(1:1000,cfs_B10,'LineWidth',0.7,'Color','b')
hold on
plot(1:1000,cfs_B15,'LineWidth',0.7,'Color','r')
hold on
plot(1:1000,cfs_B20,'LineWidth',0.7,'Color','g')
hold on
plot(1:1000,cfs_B25,'LineWidth',0.7,'Color','m')
hold on
plot(1:1000,cfs_B30,'LineWidth',0.7,'Color','y')
hold off

% Custom plot
axis tight
title('CWT coefficients - Samples B','fontsize',14)
xlabel('Time (samples)','fontsize',14)
ylabel('Magnitude of Cs','fontsize',14)
legend('10mm Liver','15mm Liver','20mm Liver','25mm Liver','30mm Liver')
set(gca,'FontSize',14)

% -------------------------------------------- C
figure(11);
plot(1:1000,cfs_C10,'LineWidth',0.7,'Color','b')
hold on
plot(1:1000,cfs_C15,'LineWidth',0.7,'Color','r')
hold on
plot(1:1000,cfs_C20,'LineWidth',0.7,'Color','g')
hold on
plot(1:1000,cfs_C25,'LineWidth',0.7,'Color','m')
hold on
plot(1:1000,cfs_C30,'LineWidth',0.7,'Color','y')
hold off

% Custom plot
axis tight
title('CWT coefficients - Samples C','fontsize',14)
xlabel('Time (samples)','fontsize',14)
ylabel('Magnitude of Cs','fontsize',14)
legend('10mm Liver','15mm Liver','20mm Liver','25mm Liver','30mm Liver')
set(gca,'FontSize',14)

%% ============================== Plot average signals amplitude vs time ===============================
% ---------------------------------------------- Between same Sample Groups
figure(12);

% Samples A
subplot(1,3,1);
plot(1:1000,CA10_Avg_R,'LineWidth',1.5,'Color','b')
hold on
plot(1:1000,CA15_Avg_R,'LineWidth',1.5,'Color','r')
hold on
plot(1:1000,CA20_Avg_R,'LineWidth',1.5,'Color','g')
hold on
plot(1:1000,CA25_Avg_R,'LineWidth',1.5,'Color','m')
hold on
plot(1:1000,CA30_Avg_R,'LineWidth',1.5,'Color','y')
hold off

title({'Amplitude over time for averaged signals','Samples A'},'fontsize',14)
xlabel('Sample (time)','fontsize',14);
ylabel('Amplitude','fontsize',14)
legend('10mm Liver','15mm Liver','20mm Liver','25mm Liver','30mm Liver')
set(gca,'FontSize',14)

% Samples B
subplot(1,3,2);
plot(1:1000,CB10_Avg_R,'LineWidth',1.5,'Color','b')
hold on
plot(1:1000,CB15_Avg_R,'LineWidth',1.5,'Color','r')
hold on
plot(1:1000,CB20_Avg_R,'LineWidth',1.5,'Color','g')
hold on
plot(1:1000,CB25_Avg_R,'LineWidth',1.5,'Color','m')
hold on
plot(1:1000,CB30_Avg_R,'LineWidth',1.5,'Color','y')
hold off

title({'Amplitude over time for averaged signals','Samples B'},'fontsize',14)
xlabel('Sample (time)','fontsize',14);
ylabel('Amplitude','fontsize',14)
legend('10mm Liver','15mm Liver','20mm Liver','25mm Liver','30mm Liver')
set(gca,'FontSize',14)

% Samples C
subplot(1,3,3);
plot(1:1000,CC10_Avg_R,'LineWidth',1.5,'Color','b')
hold on
plot(1:1000,CC15_Avg_R,'LineWidth',1.5,'Color','r')
hold on
plot(1:1000,CC20_Avg_R,'LineWidth',1.5,'Color','g')
hold on
plot(1:1000,CC25_Avg_R,'LineWidth',1.5,'Color','m')
hold on
plot(1:1000,CC30_Avg_R,'LineWidth',1.5,'Color','y')
hold off

title({'Amplitude over time for averaged signals','Samples C'},'fontsize',14)
xlabel('Sample (time)','fontsize',14);
ylabel('Amplitude','fontsize',14)
legend('10mm Liver','15mm Liver','20mm Liver','25mm Liver','30mm Liver')
set(gca,'FontSize',14)


% ---------------------------------------------- Between same Liver Thicknesses
figure(13);

% Liver thickness = 10mm
subplot(2,3,1);
plot(1:1000,CA10_Avg_R,'LineWidth',1.5,'Color','r')
hold on
plot(1:1000,CB10_Avg_R,'LineWidth',1.5,'Color','b')
hold on
plot(1:1000,CC10_Avg_R,'LineWidth',1.5,'Color','g')
hold off

title({'Amplitude over time for averaged signals','Liver Thickness: 10mm'},'fontsize',14)
xlabel('Sample (time)','fontsize',14);
ylabel('Amplitude','fontsize',14)
legend('Sample A','Sample B', 'Sample C')
set(gca,'FontSize',14)

% Liver thickness = 15mm
subplot(2,3,2);
plot(1:1000,CA15_Avg_R,'LineWidth',1.5,'Color','r')
hold on
plot(1:1000,CB15_Avg_R,'LineWidth',1.5,'Color','b')
hold on
plot(1:1000,CC15_Avg_R,'LineWidth',1.5,'Color','g')
hold off

title({'Amplitude over time for averaged signals','Liver Thickness: 15mm'},'fontsize',14)
xlabel('Sample (time)','fontsize',14);
ylabel('Amplitude','fontsize',14)
legend('Sample A','Sample B', 'Sample C')
set(gca,'FontSize',14)

% Liver thickness = 20mm
subplot(2,3,3);
plot(1:1000,CA20_Avg_R,'LineWidth',1.5,'Color','r')
hold on
plot(1:1000,CB20_Avg_R,'LineWidth',1.5,'Color','b')
hold on
plot(1:1000,CC20_Avg_R,'LineWidth',1.5,'Color','g')
hold off

title({'Amplitude over time for averaged signals','Liver Thickness: 20mm'},'fontsize',14)
xlabel('Sample (time)','fontsize',14);
ylabel('Amplitude','fontsize',14)
legend('Sample A','Sample B', 'Sample C')
set(gca,'FontSize',14)

% Liver thickness = 25mm
subplot(2,3,4);
plot(1:1000,CA25_Avg_R,'LineWidth',1.5,'Color','r')
hold on
plot(1:1000,CB25_Avg_R,'LineWidth',1.5,'Color','b')
hold on
plot(1:1000,CC25_Avg_R,'LineWidth',1.5,'Color','g')
hold off

title({'Amplitude over time for averaged signals','Liver Thickness: 25mm'},'fontsize',14)
xlabel('Sample (time)','fontsize',14);
ylabel('Amplitude','fontsize',14)
legend('Sample A','Sample B', 'Sample C')
set(gca,'FontSize',14)

% Liver thickness = 30mm
subplot(2,3,5);
plot(1:1000,CA30_Avg_R,'LineWidth',1.5,'Color','r')
hold on
plot(1:1000,CB30_Avg_R,'LineWidth',1.5,'Color','b')
hold on
plot(1:1000,CC30_Avg_R,'LineWidth',1.5,'Color','g')
hold off

title({'Amplitude over time for averaged signals','Liver Thickness: 30mm'},'fontsize',14)
xlabel('Sample (time)','fontsize',14);
ylabel('Amplitude','fontsize',14)
legend('Sample A','Sample B', 'Sample C')
set(gca,'FontSize',14)

%% ============================== Plot average signals coefficients vs frequency ===============================
figure(14);
% ---------------------------------------------- Between same Samples
% Samples A
subplot(1,3,1);
plot(frq_A10(44:71,:),cfs_A10(44:71,:),'LineWidth',0.5,'Color','b')    % We only plot frequencies from n=44 (971Hz) to n=71 (149Hz) in the array
hold on
plot(frq_A15(44:71,:),cfs_A15(44:71,:),'LineWidth',0.5,'Color','r')
hold on
plot(frq_A20(44:71,:),cfs_A20(44:71,:),'LineWidth',0.5,'Color','g')
hold on
plot(frq_A25(44:71,:),cfs_A25(44:71,:),'LineWidth',0.5,'Color','m')
hold on
plot(frq_A30(44:71,:),cfs_A30(44:71,:),'LineWidth',0.5,'Color','y')
hold off

title({'CWT coefficients over frequency (Avg. Signals)','Samples A'},'fontsize',14);
xlabel('Frequency (Hz)','fontsize',14);
ylabel('Magnitude of Cs','fontsize',14);
legend('10mm Liver','15mm Liver','20mm Liver','25mm Liver','30mm Liver');
set(gca,'FontSize',14);

% Samples B
subplot(1,3,2);
plot(frq_B10(44:71,:),cfs_B10(44:71,:),'LineWidth',0.5,'Color','b')
hold on
plot(frq_B15(44:71,:),cfs_B15(44:71,:),'LineWidth',0.5,'Color','r')
hold on
plot(frq_B20(44:71,:),cfs_B20(44:71,:),'LineWidth',0.5,'Color','g')
hold on
plot(frq_B25(44:71,:),cfs_B25(44:71,:),'LineWidth',0.5,'Color','m')
hold on
plot(frq_B30(44:71,:),cfs_B30(44:71,:),'LineWidth',0.5,'Color','y')
hold off

title({'CWT coefficients over frequency (Avg. Signals)','Samples B'},'fontsize',14);
xlabel('Frequency (Hz)','fontsize',14);
ylabel('Magnitude of Cs','fontsize',14);
legend('10mm Liver','15mm Liver','20mm Liver','25mm Liver','30mm Liver');
set(gca,'FontSize',14);

% Samples C
subplot(1,3,3);
plot(frq_C10(44:71,:),cfs_C10(44:71,:),'LineWidth',0.5,'Color','b')
hold on
plot(frq_C15(44:71,:),cfs_C15(44:71,:),'LineWidth',0.5,'Color','r')
hold on
plot(frq_C20(44:71,:),cfs_C20(44:71,:),'LineWidth',0.5,'Color','g')
hold on
plot(frq_C25(44:71,:),cfs_C25(44:71,:),'LineWidth',0.5,'Color','m')
hold on
plot(frq_C30(44:71,:),cfs_C30(44:71,:),'LineWidth',0.5,'Color','y')
hold off

title({'CWT coefficients over frequency (Avg. Signals)','Samples C'},'fontsize',14);
xlabel('Frequency (Hz)','fontsize',14);
ylabel('Magnitude of Cs','fontsize',14);
legend('10mm Liver','15mm Liver','20mm Liver','25mm Liver','30mm Liver');
set(gca,'FontSize',14);

% ---------------------------------------------- Between same Liver Thicknesses
figure(15);

% Liver thickness = 10mm
subplot(2,3,1);
plot(frq_A10(44:71,:),cfs_A10(44:71,:),'LineWidth',1.5,'Color','b')
hold on
plot(frq_B10(44:71,:),cfs_B10(44:71,:),'LineWidth',1.5,'Color','r')
hold on
plot(frq_C10(44:71,:),cfs_C10(44:71,:),'LineWidth',1.5,'Color','g')
hold off

title({'CWT coefficients over frequency (Avg. Signals)','Liver Thickness: 10mm'},'fontsize',14);
xlabel('Frequency (Hz)','fontsize',14);
ylabel('Magnitude of Cs','fontsize',14);
legend('Sample A','Sample B','Sample C');
set(gca,'FontSize',14);

% Liver thickness = 15mm
subplot(2,3,2);
plot(frq_A10(44:71,:),cfs_A15(44:71,:),'LineWidth',1.5,'Color','b')
hold on
plot(frq_B10(44:71,:),cfs_B15(44:71,:),'LineWidth',1.5,'Color','r')
hold on
plot(frq_C10(44:71,:),cfs_C15(44:71,:),'LineWidth',1.5,'Color','g')
hold off

title({'CWT coefficients over frequency (Avg. Signals)','Liver Thickness: 15mm'},'fontsize',14);
xlabel('Frequency (Hz)','fontsize',14);
ylabel('Magnitude of Cs','fontsize',14);
legend('Sample A','Sample B','Sample C');
set(gca,'FontSize',14);

% Liver thickness = 20mm
subplot(2,3,3);
plot(frq_A10(44:71,:),cfs_A20(44:71,:),'LineWidth',1.5,'Color','b')
hold on
plot(frq_B10(44:71,:),cfs_B20(44:71,:),'LineWidth',1.5,'Color','r')
hold on
plot(frq_C10(44:71,:),cfs_C20(44:71,:),'LineWidth',1.5,'Color','g')
hold off

title({'CWT coefficients over frequency (Avg. Signals)','Liver Thickness: 20mm'},'fontsize',14);
xlabel('Frequency (Hz)','fontsize',14);
ylabel('Magnitude of Cs','fontsize',14);
legend('Sample A','Sample B','Sample C');
set(gca,'FontSize',14);

% Liver thickness = 25mm
subplot(2,3,4);
plot(frq_A10(44:71,:),cfs_A25(44:71,:),'LineWidth',1.5,'Color','b')
hold on
plot(frq_B10(44:71,:),cfs_B25(44:71,:),'LineWidth',1.5,'Color','r')
hold on
plot(frq_C10(44:71,:),cfs_C25(44:71,:),'LineWidth',1.5,'Color','g')
hold off

title({'CWT coefficients over frequency (Avg. Signals)','Liver Thickness: 25mm'},'fontsize',14);
xlabel('Frequency (Hz)','fontsize',14);
ylabel('Magnitude of Cs','fontsize',14);
legend('Sample A','Sample B','Sample C');
set(gca,'FontSize',14);

% Liver thickness = 30mm
subplot(2,3,5);
plot(frq_A10(44:71,:),cfs_A30(44:71,:),'LineWidth',1.5,'Color','b')
hold on
plot(frq_B10(44:71,:),cfs_B30(44:71,:),'LineWidth',1.5,'Color','r')
hold on
plot(frq_C10(44:71,:),cfs_C30(44:71,:),'LineWidth',1.5,'Color','g')
hold off

title({'CWT coefficients over frequency (Avg. Signals)','Liver Thickness: 30mm'},'fontsize',14);
xlabel('Frequency (Hz)','fontsize',14);
ylabel('Magnitude of Cs','fontsize',14);
legend('Sample A','Sample B','Sample C');
set(gca,'FontSize',14);

%% ==================================== Average of Bands ===================================
% CWTcoeffs_A_avg is a matrix 100 x 1000. The 100 rows represent the
% frequency bands. the 1000 columns represent time in milliseconds.

% We want to merge the frequency bands in groups of 25Hz, 50Hz and 100Hz.

MRows_A10 = mean(CWTcoeffs_A10_avg,2);
MRows_A15 = mean(CWTcoeffs_A15_avg,2);
MRows_A20 = mean(CWTcoeffs_A20_avg,2);
MRows_A25 = mean(CWTcoeffs_A25_avg,2);
MRows_A30 = mean(CWTcoeffs_A30_avg,2);

MRows_B10 = mean(CWTcoeffs_B10_avg,2);
MRows_B15 = mean(CWTcoeffs_B15_avg,2);
MRows_B20 = mean(CWTcoeffs_B20_avg,2);
MRows_B25 = mean(CWTcoeffs_B25_avg,2);
MRows_B30 = mean(CWTcoeffs_B30_avg,2);

MRows_C10 = mean(CWTcoeffs_C10_avg,2);
MRows_C15 = mean(CWTcoeffs_C15_avg,2);
MRows_C20 = mean(CWTcoeffs_C20_avg,2);
MRows_C25 = mean(CWTcoeffs_C25_avg,2);
MRows_C30 = mean(CWTcoeffs_C30_avg,2);

%% ------------------------- 5 Hz ------------------------------
% Returns array B the same size as A, but with the order of the elements reversed
MRows_A10 = flip(MRows_A10);
MRows_A15 = flip(MRows_A15);
MRows_A20 = flip(MRows_A20);
MRows_A25 = flip(MRows_A25);
MRows_A30 = flip(MRows_A30);

MRows_B10 = flip(MRows_B10);
MRows_B15 = flip(MRows_B15);
MRows_B20 = flip(MRows_B20);
MRows_B25 = flip(MRows_B25);
MRows_B30 = flip(MRows_B30);

MRows_C10 = flip(MRows_C10);
MRows_C15 = flip(MRows_C15);
MRows_C20 = flip(MRows_C20);
MRows_C25 = flip(MRows_C25);
MRows_C30 = flip(MRows_C30);

% ---------------------------------------------- Between same Samples
figure(16);

% Sample A
subplot(1,3,1);
plot(1:100,abs(MRows_A10),'-o','LineWidth',1.5,'Color','b')
hold on
plot(1:100,abs(MRows_A15),'-x','LineWidth',1.5,'Color','r')
hold on
plot(1:100,abs(MRows_A20),'-o','LineWidth',1.5,'Color','g')
hold on
plot(1:100,abs(MRows_A25),'-x','LineWidth',1.5,'Color','m')
hold on
plot(1:100,abs(MRows_A30),'-o','LineWidth',1.5,'Color','y')
hold off

title({'Mean Intensity per Frequency Band','Samples A'},'fontsize',14)
xlabel('Frequency Band (Each Band is 5Hz)','fontsize',14);
ylabel('Magnitude of Cs','fontsize',14)
legend('10mm Liver','15mm Liver','20mm Liver','25mm Liver','30mm Liver');
set(gca,'FontSize',14)
                                                                      % Max difference between signal
[max_M_5Hz_SampleA,max_I_5Hz_SampleA] = max(abs(MRows_A10-MRows_A30)) % Here we assume A30 will have the highest intensity and A10 the lowest

% Sample B
subplot(1,3,2);
plot(1:100,abs(MRows_B10),'-o','LineWidth',1.5,'Color','b')
hold on
plot(1:100,abs(MRows_B15),'-x','LineWidth',1.5,'Color','r')
hold on
plot(1:100,abs(MRows_B20),'-o','LineWidth',1.5,'Color','g')
hold on
plot(1:100,abs(MRows_B25),'-x','LineWidth',1.5,'Color','m')
hold on
plot(1:100,abs(MRows_B30),'-o','LineWidth',1.5,'Color','y')
hold off

title({'Mean Intensity per Frequency Band','Samples B'},'fontsize',14)
xlabel('Frequency Band (Each Band is 5Hz)','fontsize',14);
ylabel('Magnitude of Cs','fontsize',14)
legend('10mm Liver','15mm Liver','20mm Liver','25mm Liver','30mm Liver');
set(gca,'FontSize',14)
                                                                      % Max difference between signal
[max_M_5Hz_SampleB,max_I_5Hz_SampleB] = max(abs(MRows_B10-MRows_B30)) % Here we assume B30 will have the highest intensity and B10 the lowest

% Sample C
subplot(1,3,3);
plot(1:100,abs(MRows_C10),'-o','LineWidth',1.5,'Color','b')
hold on
plot(1:100,abs(MRows_C15),'-x','LineWidth',1.5,'Color','r')
hold on
plot(1:100,abs(MRows_C20),'-o','LineWidth',1.5,'Color','g')
hold on
plot(1:100,abs(MRows_C25),'-x','LineWidth',1.5,'Color','m')
hold on
plot(1:100,abs(MRows_C30),'-o','LineWidth',1.5,'Color','y')
hold off

title({'Mean Intensity per Frequency Band','Samples C'},'fontsize',14)
xlabel('Frequency Band (Each Band is 5Hz)','fontsize',14);
ylabel('Magnitude of Cs','fontsize',14)
legend('10mm Liver','15mm Liver','20mm Liver','25mm Liver','30mm Liver');
set(gca,'FontSize',14)
                                                                      % Max difference between signal
[max_M_5Hz_SampleC,max_I_5Hz_SampleC] = max(abs(MRows_C10-MRows_C30)) % Here we assume C30 will have the highest intensity and C10 the lowest

% ---------------------------------------------- Between same Liver Thicknesses
figure(17);

% Liver Thickness: 10mm
subplot(2,3,1);
plot(1:100,abs(MRows_A10),'-o','LineWidth',1.5,'Color','b')
hold on
plot(1:100,abs(MRows_B10),'-x','LineWidth',1.5,'Color','r')
hold on
plot(1:100,abs(MRows_C10),'-o','LineWidth',1.5,'Color','g')
hold off

title({'Mean Intensity per Frequency Band','Liver Thickness: 10mm'},'fontsize',14)
xlabel('Frequency Band (Each Band is 5Hz)','fontsize',14);
ylabel('Magnitude of Cs','fontsize',14)
legend('Sample A','Sample B','Sample C');
set(gca,'FontSize',14)

% Liver Thickness: 15mm
subplot(2,3,2);
plot(1:100,abs(MRows_A15),'-o','LineWidth',1.5,'Color','b')
hold on
plot(1:100,abs(MRows_B15),'-x','LineWidth',1.5,'Color','r')
hold on
plot(1:100,abs(MRows_C15),'-o','LineWidth',1.5,'Color','g')
hold off

title({'Mean Intensity per Frequency Band','Liver Thickness: 15mm'},'fontsize',14)
xlabel('Frequency Band (Each Band is 5Hz)','fontsize',14);
ylabel('Magnitude of Cs','fontsize',14)
legend('Sample A','Sample B','Sample C');
set(gca,'FontSize',14)

% Liver Thickness: 20mm
subplot(2,3,3);
plot(1:100,abs(MRows_A20),'-o','LineWidth',1.5,'Color','b')
hold on
plot(1:100,abs(MRows_B20),'-x','LineWidth',1.5,'Color','r')
hold on
plot(1:100,abs(MRows_C20),'-o','LineWidth',1.5,'Color','g')
hold off

title({'Mean Intensity per Frequency Band','Liver Thickness: 20mm'},'fontsize',14)
xlabel('Frequency Band (Each Band is 5Hz)','fontsize',14);
ylabel('Magnitude of Cs','fontsize',14)
legend('Sample A','Sample B','Sample C');
set(gca,'FontSize',14)

% Liver Thickness: 25mm
subplot(2,3,4);
plot(1:100,abs(MRows_A25),'-o','LineWidth',1.5,'Color','b')
hold on
plot(1:100,abs(MRows_B25),'-x','LineWidth',1.5,'Color','r')
hold on
plot(1:100,abs(MRows_C25),'-o','LineWidth',1.5,'Color','g')
hold off

title({'Mean Intensity per Frequency Band','Liver Thickness: 25mm'},'fontsize',14)
xlabel('Frequency Band (Each Band is 5Hz)','fontsize',14);
ylabel('Magnitude of Cs','fontsize',14)
legend('Sample A','Sample B','Sample C');
set(gca,'FontSize',14)

% Liver Thickness: 30mm
subplot(2,3,5);
plot(1:100,abs(MRows_A30),'-o','LineWidth',1.5,'Color','b')
hold on
plot(1:100,abs(MRows_B30),'-x','LineWidth',1.5,'Color','r')
hold on
plot(1:100,abs(MRows_C30),'-o','LineWidth',1.5,'Color','g')
hold off

title({'Mean Intensity per Frequency Band','Liver Thickness: 30mm'},'fontsize',14)
xlabel('Frequency Band (Each Band is 5Hz)','fontsize',14);
ylabel('Magnitude of Cs','fontsize',14)
legend('Sample A','Sample B','Sample C');
set(gca,'FontSize',14)

%% ------------------------- 25 Hz ------------------------------
figure(18);

Rdc_MRows_A10 = zeros(1,20);
Rdc_MRows_A15 = zeros(1,20);
Rdc_MRows_A20 = zeros(1,20);
Rdc_MRows_A25 = zeros(1,20);
Rdc_MRows_A30 = zeros(1,20);

Rdc_MRows_B10 = zeros(1,20);
Rdc_MRows_B15 = zeros(1,20);
Rdc_MRows_B20 = zeros(1,20);
Rdc_MRows_B25 = zeros(1,20);
Rdc_MRows_B30 = zeros(1,20);

for i = 1:20    % For every time step
    i1 = 1 + (i-1)*5;
    i2 = 2 + (i-1)*5;
    i3 = 3 + (i-1)*5;
    i4 = 4 + (i-1)*5;
    i5 = 5 + (i-1)*5;

%     Rdc_MRows_A(1,i) = (MRows_A(i1) + MRows_A(i2) + MRows_A(i3) + MRows_A(i4) + MRows_A(i5))/5
%     Rdc_MRows_B(1,i) = (MRows_B(i1) + MRows_B(i2) + MRows_B(i3) + MRows_B(i4) + MRows_B(i5))/5

    Rdc_MRows_A10(1,i) = abs(MRows_A10(i1)) + abs(MRows_A10(i2)) + abs(MRows_A10(i3)) + abs(MRows_A10(i4)) + abs(MRows_A10(i5))/5;
    Rdc_MRows_A15(1,i) = abs(MRows_A15(i1)) + abs(MRows_A15(i2)) + abs(MRows_A15(i3)) + abs(MRows_A15(i4)) + abs(MRows_A15(i5))/5;
    Rdc_MRows_A20(1,i) = abs(MRows_A20(i1)) + abs(MRows_A20(i2)) + abs(MRows_A20(i3)) + abs(MRows_A20(i4)) + abs(MRows_A20(i5))/5;
    Rdc_MRows_A25(1,i) = abs(MRows_A25(i1)) + abs(MRows_A25(i2)) + abs(MRows_A25(i3)) + abs(MRows_A25(i4)) + abs(MRows_A25(i5))/5;
    Rdc_MRows_A30(1,i) = abs(MRows_A30(i1)) + abs(MRows_A30(i2)) + abs(MRows_A30(i3)) + abs(MRows_A30(i4)) + abs(MRows_A30(i5))/5;
    
    Rdc_MRows_B10(1,i) = abs(MRows_B10(i1)) + abs(MRows_B10(i2)) + abs(MRows_B10(i3)) + abs(MRows_B10(i4)) + abs(MRows_B10(i5))/5;
    Rdc_MRows_B15(1,i) = abs(MRows_B15(i1)) + abs(MRows_B15(i2)) + abs(MRows_B15(i3)) + abs(MRows_B15(i4)) + abs(MRows_B15(i5))/5;
    Rdc_MRows_B20(1,i) = abs(MRows_B20(i1)) + abs(MRows_B20(i2)) + abs(MRows_B20(i3)) + abs(MRows_B20(i4)) + abs(MRows_B20(i5))/5;
    Rdc_MRows_B25(1,i) = abs(MRows_B25(i1)) + abs(MRows_B25(i2)) + abs(MRows_B25(i3)) + abs(MRows_B25(i4)) + abs(MRows_B25(i5))/5;
    Rdc_MRows_B30(1,i) = abs(MRows_B30(i1)) + abs(MRows_B30(i2)) + abs(MRows_B30(i3)) + abs(MRows_B30(i4)) + abs(MRows_B30(i5))/5;

    Rdc_MRows_C10(1,i) = abs(MRows_C10(i1)) + abs(MRows_C10(i2)) + abs(MRows_C10(i3)) + abs(MRows_C10(i4)) + abs(MRows_C10(i5))/5;
    Rdc_MRows_C15(1,i) = abs(MRows_C15(i1)) + abs(MRows_C15(i2)) + abs(MRows_C15(i3)) + abs(MRows_C15(i4)) + abs(MRows_C15(i5))/5;
    Rdc_MRows_C20(1,i) = abs(MRows_C20(i1)) + abs(MRows_C20(i2)) + abs(MRows_C20(i3)) + abs(MRows_C20(i4)) + abs(MRows_C20(i5))/5;
    Rdc_MRows_C25(1,i) = abs(MRows_C25(i1)) + abs(MRows_C25(i2)) + abs(MRows_C25(i3)) + abs(MRows_C25(i4)) + abs(MRows_C25(i5))/5;
    Rdc_MRows_C30(1,i) = abs(MRows_C30(i1)) + abs(MRows_C30(i2)) + abs(MRows_C30(i3)) + abs(MRows_C30(i4)) + abs(MRows_C30(i5))/5;
end

% ---------------------------------------------- Between same Samples
figure(18);

% Sample A
subplot(1,3,1);
plot(1:20,Rdc_MRows_A10,'-o','LineWidth',1.5,'Color','b')
hold on
plot(1:20,Rdc_MRows_A15,'-x','LineWidth',1.5,'Color','r')
hold on
plot(1:20,Rdc_MRows_A20,'-o','LineWidth',1.5,'Color','g')
hold on
plot(1:20,Rdc_MRows_A25,'-x','LineWidth',1.5,'Color','m')
hold on
plot(1:20,Rdc_MRows_A30,'-o','LineWidth',1.5,'Color','y')
hold off

title({'Mean Intensity per Frequency Band','Samples A'},'fontsize',14)
xlabel('Frequency Band (Each Band is 25Hz)','fontsize',14);
ylabel('Magnitude of Cs','fontsize',14)
legend('10mm Liver','15mm Liver','20mm Liver','25mm Liver','30mm Liver');
set(gca,'FontSize',14)
                                                              % Max difference between signal
[max_M_25Hz_SampleA,max_I_25Hz_SampleA] = max(abs(Rdc_MRows_A10- Rdc_MRows_A30)) % Here we assume A30 will have the highest intensity and A10 the lowest

% Sample B
subplot(1,3,2);
plot(1:20,Rdc_MRows_B10,'-o','LineWidth',1.5,'Color','b')
hold on
plot(1:20,Rdc_MRows_B15,'-x','LineWidth',1.5,'Color','r')
hold on
plot(1:20,Rdc_MRows_B20,'-o','LineWidth',1.5,'Color','g')
hold on
plot(1:20,Rdc_MRows_B25,'-x','LineWidth',1.5,'Color','m')
hold on
plot(1:20,Rdc_MRows_B30,'-o','LineWidth',1.5,'Color','y')
hold off

title({'Mean Intensity per Frequency Band','Samples B'},'fontsize',14)
xlabel('Frequency Band (Each Band is 25Hz)','fontsize',14);
ylabel('Magnitude of Cs','fontsize',14)
legend('10mm Liver','15mm Liver','20mm Liver','25mm Liver','30mm Liver');
set(gca,'FontSize',14)
                                                              % Max difference between signal
[max_M_25Hz_SampleB,max_I_25Hz_SampleB] = max(abs(Rdc_MRows_B10- Rdc_MRows_B30)) % Here we assume B30 will have the highest intensity and B10 the lowest

% Sample C
subplot(1,3,3);
plot(1:20,Rdc_MRows_C10,'-o','LineWidth',1.5,'Color','b')
hold on
plot(1:20,Rdc_MRows_C15,'-x','LineWidth',1.5,'Color','r')
hold on
plot(1:20,Rdc_MRows_C20,'-o','LineWidth',1.5,'Color','g')
hold on
plot(1:20,Rdc_MRows_C25,'-x','LineWidth',1.5,'Color','m')
hold on
plot(1:20,Rdc_MRows_C30,'-o','LineWidth',1.5,'Color','y')
hold off

title({'Mean Intensity per Frequency Band','Samples C'},'fontsize',14)
xlabel('Frequency Band (Each Band is 25Hz)','fontsize',14);
ylabel('Magnitude of Cs','fontsize',14)
legend('10mm Liver','15mm Liver','20mm Liver','25mm Liver','30mm Liver');
set(gca,'FontSize',14)
                                                              % Max difference between signal
[max_M_25Hz_SampleC,max_I_25Hz_SampleC] = max(abs(Rdc_MRows_C10- Rdc_MRows_C30)) % Here we assume C30 will have the highest intensity and C10 the lowest

% ---------------------------------------------- Between same Liver Thickensses
figure(19);

% Liver Thickness: 10mm
subplot(2,3,1);
plot(1:20,abs(Rdc_MRows_A10),'-o','LineWidth',1.5,'Color','b')
hold on
plot(1:20,abs(Rdc_MRows_B10),'-x','LineWidth',1.5,'Color','r')
hold on
plot(1:20,abs(Rdc_MRows_C10),'-o','LineWidth',1.5,'Color','g')
hold off

title({'Mean Intensity per Frequency Band','Liver Thickness: 10mm'},'fontsize',14)
xlabel('Frequency Band (Each Band is 25Hz)','fontsize',14);
ylabel('Magnitude of Cs','fontsize',14)
legend('Sample A','Sample B','Sample C');
set(gca,'FontSize',14)

% Liver Thickness: 15mm
subplot(2,3,2);
plot(1:20,abs(Rdc_MRows_A15),'-o','LineWidth',1.5,'Color','b')
hold on
plot(1:20,abs(Rdc_MRows_B15),'-x','LineWidth',1.5,'Color','r')
hold on
plot(1:20,abs(Rdc_MRows_C15),'-o','LineWidth',1.5,'Color','g')
hold off

title({'Mean Intensity per Frequency Band','Liver Thickness: 15mm'},'fontsize',14)
xlabel('Frequency Band (Each Band is 25Hz)','fontsize',14);
ylabel('Magnitude of Cs','fontsize',14)
legend('Sample A','Sample B','Sample C');
set(gca,'FontSize',14)

% Liver Thickness: 20mm
subplot(2,3,3);
plot(1:20,abs(Rdc_MRows_A20),'-o','LineWidth',1.5,'Color','b')
hold on
plot(1:20,abs(Rdc_MRows_B20),'-x','LineWidth',1.5,'Color','r')
hold on
plot(1:20,abs(Rdc_MRows_C20),'-o','LineWidth',1.5,'Color','g')
hold off

title({'Mean Intensity per Frequency Band','Liver Thickness: 20mm'},'fontsize',14)
xlabel('Frequency Band (Each Band is 25Hz)','fontsize',14);
ylabel('Magnitude of Cs','fontsize',14)
legend('Sample A','Sample B','Sample C');
set(gca,'FontSize',14)

% Liver Thickness: 25mm
subplot(2,3,4);
plot(1:20,abs(Rdc_MRows_A25),'-o','LineWidth',1.5,'Color','b')
hold on
plot(1:20,abs(Rdc_MRows_B25),'-x','LineWidth',1.5,'Color','r')
hold on
plot(1:20,abs(Rdc_MRows_C25),'-o','LineWidth',1.5,'Color','g')
hold off

title({'Mean Intensity per Frequency Band','Liver Thickness: 25mm'},'fontsize',14)
xlabel('Frequency Band (Each Band is 25Hz)','fontsize',14);
ylabel('Magnitude of Cs','fontsize',14)
legend('Sample A','Sample B','Sample C');
set(gca,'FontSize',14)

% Liver Thickness: 30mm
subplot(2,3,5);
plot(1:20,abs(Rdc_MRows_A30),'-o','LineWidth',1.5,'Color','b')
hold on
plot(1:20,abs(Rdc_MRows_B30),'-x','LineWidth',1.5,'Color','r')
hold on
plot(1:20,abs(Rdc_MRows_C30),'-o','LineWidth',1.5,'Color','g')
hold off

title({'Mean Intensity per Frequency Band','Liver Thickness: 30mm'},'fontsize',14)
xlabel('Frequency Band (Each Band is 25Hz)','fontsize',14);
ylabel('Magnitude of Cs','fontsize',14)
legend('Sample A','Sample B','Sample C');
set(gca,'FontSize',14)
