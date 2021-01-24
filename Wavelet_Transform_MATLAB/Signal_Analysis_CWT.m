
% Author: Pilar Zhang Qiu

clc;
clear all;

% ======================================== Read multiple audio files ========================================

% Close Nodules .WAV
for k = 1:31
    % Create an audio file name, and read the file.
	audionameA1 = ['Nodule_taps_short_' num2str(k) '.wav'];

	if exist(audionameA1, 'file')        
        [A{k},fs_now] = audioread(audionameA1);

        dt = 1/fs_now;
        t_A{k} = 0:dt:(length(A{k})*dt)-dt;

    else
		fprintf('File %s does not exist.\n', audionameA1);
    end  
end

% Far Nodules .WAV
for k = 1:31
    % Create an audio file name, and read the file.
	audionameB1 = ['No_Nodule_taps_short_' num2str(k) '.wav'];

	if exist(audionameB1, 'file')        
        [B{k},fs_now] = audioread(audionameB1);

        dt = 1/fs_now;
        t_B{k} = 0:dt:(length(B{k})*dt)-dt;

    else
		fprintf('File %s does not exist.\n', audionameB1);
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
    set(gca,'FontSize',14)

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
    set(gca,'FontSize',14)

%     figure(2);
%     dtw(A{2},A{i});
end
%% HERE PLS

% ======================================== Average of aligned signals ========================================
% This is the average signal for all A functions. However, real frequencies
% are lost.
[wrow, wcol] = size(iA_x);
new_time = [1:39318];     % create your array

for i = 3:A_col
    curr_iAx = iA_x{i};
    WarpPath_A = A{curr_iAx}; %i,curr_iAx

    figure(2);
    plot(new_time,WarpPath_A,'b');

    legend('Avg. Signal')
    xlabel('Sample Time(unitless)');
    ylabel('Amplitude');
    title('Average of aligned signals');
    set(gca,'FontSize',14)
end

%% See how the aligning tool works
figure(3);
dtw(A{2},A{29});
set(gca,'FontSize',14)
% HI=======================================================

% %% ======================================== Smoothening: S-Golay Filtering ========================================
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

i = 29;
%subplot(2,1,1)
plot(t_A{i},A{i},'LineWidth',1.5)
hold on
plot(t_A{i},sgf_A{i},'LineWidth',1.5)
hold off

legend('Original signal','S-Golay: order 3, fl 41')
xlabel('Sample(time)');
ylabel('Amplitude');
title('S-Golay Filtering');
set(gca,'FontSize',14)

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

i = 29;
%subplot(2,1,1)
plot(t_B{i},B{i},'LineWidth',2)
hold on
plot(t_B{i},sgf_B{i},'LineWidth',2)
hold off

legend('Original signal','S-Golay: Order 3, FL 41')
xlabel('Sample(time)','fontsize',14);
ylabel('Amplitude','fontsize',14);
title('S-Golay Filtering','fontsize',14);
set(gca,'FontSize',14)

% Till heree

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

%% From here
%% ======================================== Spectogram ========================================
figure(5);
for m = 23
    [s,w,t,ps,fc,tc] = spectrogram(sgf_A{m});
    spectrogram(sgf_A{m},'yaxis');
end

%% ============================== CWT Coefficients - 1D Continuous Wavelet Transform ===============================
% Here I am only plotting scalogram for one specific percussion event
% (m=23), but I will be using all of them for the posterior analysis
% ------------------------------------------------------- A
figure(6);
m=23;
%Continuous wavelet transform up to 500 scale levels (analogous to
%frequency levels) using DB10 wavelet. The x-axis is time, and y-axis is
%frequency. Higher the scale, lower the frequency. The color map is the
%intensity of a particular frequency at a given time.

CWTcoeffs_A = cwt(sgf_A{m},5:5:1000,'sym10','plot');     %cwt for continuous 1D wavelet transform
colormap jet; 
h = colorbar;
set(get(h,'label'),'string','C-Values');

title('CWT Scalogram - Single Close Nodule File n=23','fontsize',14)
xlabel('Time(ms)','fontsize',14);
ylabel('Frequency (Hz)','fontsize',14)
set(gca,'FontSize',14)

% ------------------------------------------------------- B
figure(7);
CWTcoeffs_B = cwt(sgf_B{m},5:5:1000,'sym10','plot');     %cwt for continuous 1D wavelet transform
colormap jet; 
h = colorbar;
set(get(h,'label'),'string','C-Values');

title('CWT Scalogram - Close Nodule File n=23','fontsize',14)
xlabel('Time(ms)','fontsize',14);
ylabel('Frequency (Hz)','fontsize',14)
set(gca,'FontSize',14)

%% ============================== Split in groups of 25 timestamps ===============================
% ------------------------------------------------------- A
%Continuous wavelet transform up to 500 scale levels (analogous to
%frequency levels) using DB10 wavelet. The x-axis is time, and y-axis is
%frequency. Higher the scale, lower the frequency. The color map is the
%intensity of a particular frequency at a given time.

% fun = @(x) x(1:1000,:)  % Function to be repeated at each cell, extract first 1000 values

for i = 1:A_col
    %sgf_A_trimmed{i} = cellfun(fun,sgf_A)
    sgf_A_trimcurr = sgf_A{i};

    sgf_A_trim(1,i) = {sgf_A_trimcurr(1:1000,:)};
    sgf_A_trim(2,i) = {sgf_A_trimcurr(1:25,:)};
    sgf_A_trim(3,i) = {sgf_A_trimcurr(25:50-1,:)};
    sgf_A_trim(4,i) = {sgf_A_trimcurr(50:75-1,:)};
    sgf_A_trim(5,i) = {sgf_A_trimcurr(75:100-1,:)};
    sgf_A_trim(6,i) = {sgf_A_trimcurr(100:125-1,:)};
    sgf_A_trim(7,i) = {sgf_A_trimcurr(125:150-1,:)};
    sgf_A_trim(8,i) = {sgf_A_trimcurr(150:175-1,:)};
    sgf_A_trim(9,i) = {sgf_A_trimcurr(175:200-1,:)};
    sgf_A_trim(10,i) = {sgf_A_trimcurr(200:225-1,:)};
    sgf_A_trim(11,i) = {sgf_A_trimcurr(225:250-1,:)};
    sgf_A_trim(12,i) = {sgf_A_trimcurr(250:275-1,:)};
    sgf_A_trim(13,i) = {sgf_A_trimcurr(275:300-1,:)};
    sgf_A_trim(14,i) = {sgf_A_trimcurr(300:325-1,:)};
    sgf_A_trim(15,i) = {sgf_A_trimcurr(325:350-1,:)};
    sgf_A_trim(16,i) = {sgf_A_trimcurr(350:375-1,:)};
    sgf_A_trim(17,i) = {sgf_A_trimcurr(375:400-1,:)};
    sgf_A_trim(18,i) = {sgf_A_trimcurr(400:425-1,:)};
    sgf_A_trim(19,i) = {sgf_A_trimcurr(425:450-1,:)};
    sgf_A_trim(20,i) = {sgf_A_trimcurr(450:475-1,:)};
    sgf_A_trim(21,i) = {sgf_A_trimcurr(475:500-1,:)};
    % -------------- 500
    sgf_A_trim(22,i) = {sgf_A_trimcurr(500:525-1,:)};
    sgf_A_trim(23,i) = {sgf_A_trimcurr(525:550-1,:)};
    sgf_A_trim(24,i) = {sgf_A_trimcurr(550:575-1,:)};
    sgf_A_trim(25,i) = {sgf_A_trimcurr(575:600-1,:)};
    sgf_A_trim(26,i) = {sgf_A_trimcurr(600:625-1,:)};
    sgf_A_trim(27,i) = {sgf_A_trimcurr(625:650-1,:)};
    sgf_A_trim(28,i) = {sgf_A_trimcurr(650:675-1,:)};
    sgf_A_trim(29,i) = {sgf_A_trimcurr(675:700-1,:)};
    sgf_A_trim(30,i) = {sgf_A_trimcurr(700:725-1,:)};
    sgf_A_trim(31,i) = {sgf_A_trimcurr(725:750-1,:)};
    sgf_A_trim(32,i) = {sgf_A_trimcurr(750:775-1,:)};
    sgf_A_trim(33,i) = {sgf_A_trimcurr(775:800-1,:)};
    sgf_A_trim(34,i) = {sgf_A_trimcurr(800:825-1,:)};
    sgf_A_trim(35,i) = {sgf_A_trimcurr(825:850-1,:)};
    sgf_A_trim(36,i) = {sgf_A_trimcurr(850:875-1,:)};
    sgf_A_trim(37,i) = {sgf_A_trimcurr(875:900-1,:)};
    sgf_A_trim(38,i) = {sgf_A_trimcurr(900:925-1,:)};
    sgf_A_trim(39,i) = {sgf_A_trimcurr(925:950-1,:)};
    sgf_A_trim(40,i) = {sgf_A_trimcurr(950:975-1,:)};
    sgf_A_trim(41,i) = {sgf_A_trimcurr(975:1000-1,:)};
end

for i = 1:B_col

    sgf_B_trimcurr = sgf_B{i};

    sgf_B_trim(1,i) = {sgf_B_trimcurr(1:1000,:)};
    sgf_B_trim(2,i) = {sgf_B_trimcurr(1:25,:)};
    sgf_B_trim(3,i) = {sgf_B_trimcurr(25:50-1,:)};
    sgf_B_trim(4,i) = {sgf_B_trimcurr(50:75-1,:)};
    sgf_B_trim(5,i) = {sgf_B_trimcurr(75:100-1,:)};
    sgf_B_trim(6,i) = {sgf_B_trimcurr(100:125-1,:)};
    sgf_B_trim(7,i) = {sgf_B_trimcurr(125:150-1,:)};
    sgf_B_trim(8,i) = {sgf_B_trimcurr(150:175-1,:)};
    sgf_B_trim(9,i) = {sgf_B_trimcurr(175:200-1,:)};
    sgf_B_trim(10,i) = {sgf_B_trimcurr(200:225-1,:)};
    sgf_B_trim(11,i) = {sgf_B_trimcurr(225:250-1,:)};
    sgf_B_trim(12,i) = {sgf_B_trimcurr(250:275-1,:)};
    sgf_B_trim(13,i) = {sgf_B_trimcurr(275:300-1,:)};
    sgf_B_trim(14,i) = {sgf_B_trimcurr(300:325-1,:)};
    sgf_B_trim(15,i) = {sgf_B_trimcurr(325:350-1,:)};
    sgf_B_trim(16,i) = {sgf_B_trimcurr(350:375-1,:)};
    sgf_B_trim(17,i) = {sgf_B_trimcurr(375:400-1,:)};
    sgf_B_trim(18,i) = {sgf_B_trimcurr(400:425-1,:)};
    sgf_B_trim(19,i) = {sgf_B_trimcurr(425:450-1,:)};
    sgf_B_trim(20,i) = {sgf_B_trimcurr(450:475-1,:)};
    sgf_B_trim(21,i) = {sgf_B_trimcurr(475:500-1,:)};
    % -------------- 500
    sgf_B_trim(22,i) = {sgf_B_trimcurr(500:525-1,:)};
    sgf_B_trim(23,i) = {sgf_B_trimcurr(525:550-1,:)};
    sgf_B_trim(24,i) = {sgf_B_trimcurr(550:575-1,:)};
    sgf_B_trim(25,i) = {sgf_B_trimcurr(575:600-1,:)};
    sgf_B_trim(26,i) = {sgf_B_trimcurr(600:625-1,:)};
    sgf_B_trim(27,i) = {sgf_B_trimcurr(625:650-1,:)};
    sgf_B_trim(28,i) = {sgf_B_trimcurr(650:675-1,:)};
    sgf_B_trim(29,i) = {sgf_B_trimcurr(675:700-1,:)};
    sgf_B_trim(30,i) = {sgf_B_trimcurr(700:725-1,:)};
    sgf_B_trim(31,i) = {sgf_B_trimcurr(725:750-1,:)};
    sgf_B_trim(32,i) = {sgf_B_trimcurr(750:775-1,:)};
    sgf_B_trim(33,i) = {sgf_B_trimcurr(775:800-1,:)};
    sgf_B_trim(34,i) = {sgf_B_trimcurr(800:825-1,:)};
    sgf_B_trim(35,i) = {sgf_B_trimcurr(825:850-1,:)};
    sgf_B_trim(36,i) = {sgf_B_trimcurr(850:875-1,:)};
    sgf_B_trim(37,i) = {sgf_B_trimcurr(875:900-1,:)};
    sgf_B_trim(38,i) = {sgf_B_trimcurr(900:925-1,:)};
    sgf_B_trim(39,i) = {sgf_B_trimcurr(925:950-1,:)};
    sgf_B_trim(40,i) = {sgf_B_trimcurr(950:975-1,:)};
    sgf_B_trim(41,i) = {sgf_B_trimcurr(975:1000-1,:)};
end

%% Average all audio files of same nature

% Note that:
% CWTcoeffs_A_Complete{A,B} = (C, D)
    % A = number of time steps (41)
    % B = audio samples (48)
    % C = Frequency Steps (100)
    % D = trimmed time steps (25)
% We wanna average for all B

% ---------------------------- A
for i = 2:41    % For every time step
    for k = 1:A_col    % For every audio file

        sgf_A_T_AvgRows_curr(:,i-1,k) = sgf_A_trim{i,k};    % sgf_A_trim are time bands

        A_Sum_Rcurr = sum(sgf_A_T_AvgRows_curr, 3);
        [AS_row, AS_col] = size(A_Sum_Rcurr);

        A_Avg_R = A_Sum_Rcurr/AS_row;       
    end
end

CA_Avg_R = A_Avg_R(:,1);

for i = 2:AS_col
    catA = A_Avg_R(:,i);
	CA_Avg_R = cat(1, CA_Avg_R, catA);
end

% ---------------------------- B
for i = 2:41    % For every time step
    for k = 1:B_col    % For every audio file

        sgf_B_T_AvgRows_curr(:,i-1,k) = sgf_B_trim{i,k};    % sgf_A_trim are time bands

        B_Sum_Rcurr = sum(sgf_B_T_AvgRows_curr, 3);
        [BS_row, BS_col] = size(B_Sum_Rcurr);

        B_Avg_R = B_Sum_Rcurr/BS_row;       
    end
end

CB_Avg_R = B_Avg_R(:,1);

for i = 2:BS_col
    catA = B_Avg_R(:,i);
	CB_Avg_R = cat(1, CB_Avg_R, catA);
end

%% ============================================ Plot the averages ===========================================
% I create squares of 25Hz and 25ms and average them. Then I can plot these
% graphs, which should be averaged scalograms.
% ---------------------------- A
figure(8);

subplot(2,1,1);
CWTcoeffs_A_avg = cwt(CA_Avg_R,5:5:500,'sym10','plot');     %cwt for continuous 1D wavelet transform
[cfs_A,frq_A] = cwt(CA_Avg_R,fs_now);     %cwt for continuous 1D wavelet transform

colormap jet; 
h = colorbar;
set(get(h,'label'),'string','C-Values');

title('CWT Scalogram - Average of all Close Nodule Files','fontsize',14)
xlabel('Time(ms)','fontsize',14);
ylabel('Frequency (Hz)','fontsize',14)
set(gca,'FontSize',14)

% ---------------------------- B
% figure(9);

subplot(2,1,2);
CWTcoeffs_B_avg = cwt(CB_Avg_R,5:5:500,'sym10','plot');     %cwt for continuous 1D wavelet transform
[cfs_B,frq_B] = cwt(CB_Avg_R,fs_now);     %cwt for continuous 1D wavelet transform

colormap jet; 
h = colorbar;
set(get(h,'label'),'string','C-Values');

title('CWT Scalogram - Average of all Far Nodule Files','fontsize',14)
xlabel('Time(ms)','fontsize',14);
ylabel('Frequency (Hz)','fontsize',14)
set(gca,'FontSize',14)

%% Plot the C coefficients from the CWT
figure(10)

plot(1:1000,cfs_A,'LineWidth',0.7,'Color','b')
hold on
plot(1:1000,cfs_B,'LineWidth',0.7,'Color','r')
hold off

axis tight
title('CWT coefficients - Hardware','fontsize',14)
xlabel('Time (samples)','fontsize',14)
ylabel('Magnitude of Cs','fontsize',14)
legend('Close Nodule','Far Nodule')
set(gca,'FontSize',14)

%% ============================== Plot average signals amplitude vs time ===============================

figure(11);

plot(1:1000,CA_Avg_R,'LineWidth',1.5,'Color','b')
hold on
plot(1:1000,CB_Avg_R,'LineWidth',1.5,'Color','r')
hold off

title('Amplitude over time for averaged signals','fontsize',14)
xlabel('Sample (time)','fontsize',14);
ylabel('Amplitude','fontsize',14)
legend('Close Nodule','Far Nodule')
set(gca,'FontSize',14)

%% ============================== Plot average signals coefficients vs frequency ===============================

figure(12);

plot(frq_A,cfs_A,'LineWidth',0.5,'Color','b')
hold on
plot(frq_B,cfs_B,'LineWidth',0.5,'Color','r')
hold off

title('CWT coefficients over frequency (Avg. Signals)','fontsize',14)
xlabel('Frequency (Hz)','fontsize',14);
ylabel('Magnitude of Cs','fontsize',14)
legend('Close Nodule','Far Nodule')
set(gca,'FontSize',14)

%% ==================================== Average of Bands ===================================
% CWTcoeffs_A_avg is a matrix 100 x 1000. The 100 rows represent the
% frequency bands. the 1000 columns represent time in milliseconds.

% We want to merge the frequency bands in groups of 25Hz, 50Hz and 100Hz.

MRows_A = mean(CWTcoeffs_A_avg,2);
MRows_B = mean(CWTcoeffs_B_avg,2);

%------------------------- 5 Hz ------------------------------
figure(13);

MRows_A = flip(MRows_A);
MRows_B = flip(MRows_B);

plot(1:100,abs(MRows_A),'-o','LineWidth',1.5,'Color','b')
hold on
plot(1:100,abs(MRows_B),'-x','LineWidth',1.5,'Color','r')
hold off

title('Mean Intensity per Frequency Band','fontsize',14)
xlabel('Frequency Band (Each Band is 5Hz)','fontsize',14);
ylabel('Magnitude of Cs','fontsize',14)
legend('Close Nodule','Far Nodule')
set(gca,'FontSize',14)

[max_M,max_I] = max(abs(MRows_A-MRows_B))

%------------------------- 25 Hz ------------------------------
figure(14);

Rdc_MRows_A = zeros(1,20);
Rdc_MRows_B = zeros(1,20);

for i = 1:20    % For every time step
    i1 = 1 + (i-1)*5;
    i2 = 2 + (i-1)*5;
    i3 = 3 + (i-1)*5;
    i4 = 4 + (i-1)*5;
    i5 = 5 + (i-1)*5;

%     Rdc_MRows_A(1,i) = (MRows_A(i1) + MRows_A(i2) + MRows_A(i3) + MRows_A(i4) + MRows_A(i5))/5
%     Rdc_MRows_B(1,i) = (MRows_B(i1) + MRows_B(i2) + MRows_B(i3) + MRows_B(i4) + MRows_B(i5))/5

    Rdc_MRows_A(1,i) = abs(MRows_A(i1)) + abs(MRows_A(i2)) + abs(MRows_A(i3)) + abs(MRows_A(i4)) + abs(MRows_A(i5))/5;
    Rdc_MRows_B(1,i) = abs(MRows_B(i1)) + abs(MRows_B(i2)) + abs(MRows_B(i3)) + abs(MRows_B(i4)) + abs(MRows_B(i5))/5;
end

plot(1:20,Rdc_MRows_A,'-o','LineWidth',1.5,'Color','b')
hold on
plot(1:20,Rdc_MRows_B,'-x','LineWidth',1.5,'Color','r')
hold off

title('Mean Intensity per Frequency Band','fontsize',14)
xlabel('Frequency Band (Each Band is 25Hz)','fontsize',14);
ylabel('Absolute Magnitude of Cs','fontsize',14)
legend('Close Nodule','Far Nodule')
set(gca,'FontSize',14)

[max_M,max_I] = max(abs(MRows_A-MRows_B))

%------------------------- 50 Hz -----------------------------
figure(15);

Rdc_MRows_A = zeros(1,10);
Rdc_MRows_B = zeros(1,10);

for i = 1:10    % For every time step
    i1 = 1 + (i-1)*10;
    i2 = 2 + (i-1)*10;
    i3 = 3 + (i-1)*10;
    i4 = 4 + (i-1)*10;
    i5 = 5 + (i-1)*10;
    i6 = 6 + (i-1)*10;
    i7 = 7 + (i-1)*10;
    i8 = 8 + (i-1)*10;
    i9 = 9 + (i-1)*10;
    i10 = 10 + (i-1)*10;

    Rdc_MRows_A(1,i) = (abs(MRows_A(i1)) + abs(MRows_A(i2)) + abs(MRows_A(i3)) + abs(MRows_A(i4)) + abs(MRows_A(i5)) + abs(MRows_A(i6)) + abs(MRows_A(i7)) + abs(MRows_A(i8)) + abs(MRows_A(i9)) + abs(MRows_A(i10)))/10
    Rdc_MRows_B(1,i) = (abs(MRows_B(i1)) + abs(MRows_B(i2)) + abs(MRows_B(i3)) + abs(MRows_B(i4)) + abs(MRows_B(i5)) + abs(MRows_B(i6)) + abs(MRows_B(i7)) + abs(MRows_B(i8)) + abs(MRows_B(i9)) + abs(MRows_B(i10)))/10
end

plot(1:10,Rdc_MRows_A,'-o','LineWidth',1.5,'Color','b')
hold on
plot(1:10,Rdc_MRows_B,'-x','LineWidth',1.5,'Color','r')
hold off

title('Mean Intensity per Frequency Band','fontsize',14)
xlabel('Frequency Band (Each Band is 50Hz)','fontsize',14);
ylabel('Absolute Magnitude of Cs','fontsize',14)
legend('Close Nodule','Far Nodule')
set(gca,'FontSize',14)

[max_M,max_I] = max(abs(Rdc_MRows_A-Rdc_MRows_B))

%------------------------- 100 Hz ------------------------------
figure(16);

Rdc_MRows_A = zeros(1,5);
Rdc_MRows_B = zeros(1,5);

for i = 1:5    % For every time step
    i1 = 1 + (i-1)*20;
    i2 = 2 + (i-1)*20;
    i3 = 3 + (i-1)*20;
    i4 = 4 + (i-1)*20;
    i5 = 5 + (i-1)*20;
    i6 = 6 + (i-1)*20;
    i7 = 7 + (i-1)*20;
    i8 = 8 + (i-1)*20;
    i9 = 9 + (i-1)*20;
    i10 = 10 + (i-1)*20;
    i11 = 11 + (i-1)*20;
    i12 = 12 + (i-1)*20;
    i13 = 13 + (i-1)*20;
    i14 = 14 + (i-1)*20;
    i15 = 15 + (i-1)*20;
    i16 = 16 + (i-1)*20;
    i17 = 17 + (i-1)*20;
    i18 = 18 + (i-1)*20;
    i19 = 19 + (i-1)*20;
    i20 = 20 + (i-1)*20;

    Rdc_MRows_A(1,i) = (abs(MRows_A(i1)) + abs(MRows_A(i2)) + abs(MRows_A(i3)) + abs(MRows_A(i4)) + abs(MRows_A(i5)) + abs(MRows_A(i6)) + abs(MRows_A(i7)) + abs(MRows_A(i8)) + abs(MRows_A(i9)) + abs(MRows_A(i10)) ...
        + abs(MRows_A(i11))+abs(MRows_A(i12))+abs(MRows_A(i13))+abs(MRows_A(i14))+abs(MRows_A(i15))+abs(MRows_A(i16))+abs(MRows_A(i17))+abs(MRows_A(i18))+abs(MRows_A(i19))+abs(MRows_A(i20)))/20
    Rdc_MRows_B(1,i) = (abs(MRows_B(i1)) + abs(MRows_B(i2)) + abs(MRows_B(i3)) + abs(MRows_B(i4)) + abs(MRows_B(i5)) + abs(MRows_B(i6)) + abs(MRows_B(i7)) + abs(MRows_B(i8)) + abs(MRows_B(i9)) + abs(MRows_B(i10)) ...
        + abs(MRows_B(i11))+abs(MRows_B(i12))+abs(MRows_B(i13))+abs(MRows_B(i14))+abs(MRows_B(i15))+abs(MRows_B(i16))+abs(MRows_B(i17))+abs(MRows_B(i18))+abs(MRows_B(i19))+abs(MRows_B(i20)))/20
end

plot(1:5,Rdc_MRows_A,'-o','LineWidth',1.5,'Color','b')
hold on
plot(1:5,Rdc_MRows_B,'-x','LineWidth',1.5,'Color','r')
hold off

title('Mean Intensity per Frequency Band','fontsize',14)
xlabel('Frequency Band (Each Band is 100Hz)','fontsize',14);
ylabel('Absolute Magnitude of Cs','fontsize',14)
legend('Close Nodule','Far Nodule')
set(gca,'FontSize',14)

[max_M,max_I] = max(abs(Rdc_MRows_A-Rdc_MRows_B))
