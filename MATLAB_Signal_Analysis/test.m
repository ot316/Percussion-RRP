[data,Fs]=audioread('AudioFiles 10.03.20/No_Nodule_taps/No_Nodule_tapstap0.wav');                
    T = 1/Fs;             % Sampling period       
    L = length(data);     % Length of signal
    t = (0:L-1)*T;        % Time vector

    data_fft = fft(data); % perform fourier transform
    P2 = abs(data_fft/L);
    P1 = P2(1:L/2+1);
    P1(2:end-1) = 2*P1(2:end-1); % disregard negative time
    f = Fs*(0:(L/2))/L;
    plot(f,P1) 