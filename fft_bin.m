numberofbins = 500;
numberoffiles = 40;
f_bin_avg_close = zeros(604,numberofbins);
f_bin_avg_far = zeros(1247,numberofbins);

%% First Data set
for i = 0:numberoffiles
    [data,fs]=audioread(sprintf('AudioFiles 10.03.20/Nodule_taps/Nodule_tapstap%d.wav', i));                
    T = 1/fs;             % Sampling period       
    L = length(data);     % Length of signal
    t = (0:L-1)*T;        % Time vector

    data_fft = fft(data); % perform fourier transform
    P2 = abs(data_fft/L);
    P1 = P2(1:L/2+1);
    P1(2:end-1) = 2*P1(2:end-1); % disregard negative time
    
    binwidth = length(P1)/numberofbins;
    column = 1;
    oldii = 1;

    for ii = 1:binwidth:length(P1)
        f_bin_avg_close(i+1,column) = mean(P1(oldii:round(ii)));
        oldii = ii;
        column = column + 1;
    end      
end

%% second dataset
for i = 0:numberoffiles
    [data,fs]=audioread(sprintf('AudioFiles 10.03.20/No_Nodule_taps/No_Nodule_tapstap%d.wav', i));                
    T = 1/fs;         
    L = length(data);            
    t = (0:L-1)*T;        

    data_fft = fft(data);
    P2 = abs(data_fft/L);
    P1 = P2(1:L/2+1);
    P1(2:end-1) = 2*P1(2:end-1);
    
    binwidth = length(P1)/numberofbins;
    column = 1;
    oldii = 1;

    for ii = 1:binwidth:length(P1)
        f_bin_avg_far(i+1,column) = mean(P1(oldii:round(ii)));
        oldii = ii;
        column = column + 1;
    end   
    
end

%% statistical testing

ttest2matrix = zeros(numberofbins, 3);


for i = 2:numberofbins+1
    [h,p] = ttest2(f_bin_avg_far(:,i-1), f_bin_avg_close(:,i-1), 'Alpha', 0.005);
    ttest2matrix(i,1) = 22050/numberofbins*i-1;
    ttest2matrix(i,2) = h;
    ttest2matrix(i,3) = p;
end




