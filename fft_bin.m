    fbin0avgclose = zeros(1,604);
    fbin1avgclose = zeros(1,604);
    fbin2avgclose = zeros(1,604);
    fbin3avgclose = zeros(1,604);;
    fbin4avgclose = zeros(1,604);;
    fbin5avgclose = zeros(1,604);
    fbin6avgclose = zeros(1,604);
    fbin7avgclose = zeros(1,604);
    fbin8avgclose = zeros(1,604);
    fbin9avgclose = zeros(1,604);
    fbin10avgclose = zeros(1,604);
    
    fbin0avgfar = zeros(1,1247);
    fbin1avgfar = zeros(1,1247);
    fbin2avgfar = zeros(1,1247);
    fbin3avgfar = zeros(1,1247);
    fbin4avgfar = zeros(1,1247);
    fbin5avgfar = zeros(1,1247);
    fbin6avgfar = zeros(1,1247);
    fbin7avgfar = zeros(1,1247);
    fbin8avgfar = zeros(1,1247);
    fbin9avgfar = zeros(1,1247);
    fbin10avgfar = zeros(1,1247);
    
for i = 0:603
    [data,fs]=audioread(sprintf('AudioFiles 10.03.20/Nodule_taps/Nodule_tapstap%d.wav', i));                
    T = 1/fs;             % Sampling period       
    L = length(data);     % Length of signal
    t = (0:L-1)*T;        % Time vector

    data_fft = fft(data);
    P2 = abs(data_fft/L);
    P1 = P2(1:L/2+1);
    P1(2:end-1) = 2*P1(2:end-1);
    %f = fs*(0:(L/2))/L;
    
    %10 frequency bins
    fbin0avgclose = [fbin0avgclose, mean(P1(1:10))];
    fbin1avgclose = [fbin1avgclose, mean(P1(11:20))];
    fbin2avgclose = [fbin2avgclose, mean(P1(21:30))];
    fbin3avgclose = [fbin3avgclose, mean(P1(31:40))];
    fbin4avgclose = [fbin4avgclose, mean(P1(41:50))];
    fbin5avgclose = [fbin5avgclose, mean(P1(51:60))];
    fbin6avgclose = [fbin6avgclose, mean(P1(61:70))];
    fbin7avgclose = [fbin7avgclose, mean(P1(71:80))];
    fbin8avgclose = [fbin8avgclose, mean(P1(81:90))];
    fbin9avgclose = [fbin9avgclose, mean(P1(91:100))];
    fbin10avgclose = [fbin10avgclose, mean(P1(101:4477))];
       
end

for i = 0:1247
    [data,fs]=audioread(sprintf('AudioFiles 10.03.20/No_Nodule_taps/No_Nodule_tapstap%d.wav', i));                
    T = 1/fs;             % Sampling period       
    L = length(data);             % Length of signal
    t = (0:L-1)*T;        % Time vector

    data_fft = fft(data);
    P2 = abs(data_fft/L);
    P1 = P2(1:L/2+1);
    P1(2:end-1) = 2*P1(2:end-1);
    %f = fs*(0:(L/2))/L;
    
     %10 frequency bins
    fbin0avgfar = [fbin0avgfar, mean(P1(1:10))];
    fbin1avgfar = [fbin1avgfar, mean(P1(11:20))];
    fbin2avgfar = [fbin2avgfar, mean(P1(21:30))];
    fbin3avgfar = [fbin3avgfar, mean(P1(31:40))];
    fbin4avgfar = [fbin4avgfar, mean(P1(41:50))];
    fbin5avgfar = [fbin5avgfar, mean(P1(51:60))];
    fbin6avgfar = [fbin6avgfar, mean(P1(61:70))];
    fbin7avgfar = [fbin7avgfar, mean(P1(71:80))];
    fbin8avgfar = [fbin8avgfar, mean(P1(81:90))];
    fbin9avgfar = [fbin9avgfar, mean(P1(91:100))];
    fbin10avgfar = [fbin10avgfar, mean(P1(101:4477))];
    
end

%% statistical testing

[h,p] = ttest2(fbin0avgfar, fbin0avgclose, 'Alpha', 0.001)
[h,p] = ttest2(fbin1avgfar, fbin1avgclose, 'Alpha', 0.001)
[h,p] = ttest2(fbin2avgfar, fbin2avgclose, 'Alpha', 0.001)
[h,p] = ttest2(fbin3avgfar, fbin3avgclose, 'Alpha', 0.001)
[h,p] = ttest2(fbin4avgfar, fbin4avgclose, 'Alpha', 0.001)
[h,p] = ttest2(fbin5avgfar, fbin5avgclose, 'Alpha', 0.001)
[h,p] = ttest2(fbin6avgfar, fbin6avgclose, 'Alpha', 0.001)
[h,p] = ttest2(fbin7avgfar, fbin7avgclose, 'Alpha', 0.001)
[h,p] = ttest2(fbin8avgfar, fbin8avgclose, 'Alpha', 0.001)
[h,p] = ttest2(fbin9avgfar, fbin9avgclose, 'Alpha', 0.001)
[h,p] = ttest2(fbin10avgfar, fbin10avgclose, 'Alpha', 0.001)


