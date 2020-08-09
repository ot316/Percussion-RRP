%x = importdata('Ad_1-000.txt');
%A = x.data(:,2);
[A,fs] = audioread('taps.mp3');
figure(1);
%Continuous wavelet transform upto 200 scale levels (analogous to frequency
%levels) using DB10 wavelet.
%The x-axis is time, and y-axis is frequency. Higher the scale, lower the
%frequency. The color map is the intensity of a particular frequency at a
%given time.
CWTcoeffs = cwt(A,1:20:500,'db10','plot'); colormap jet; colorbar;
xlabel('Sample (time)','fontsize',16);
ylabel('Scale level (Inverse of frequency)','fontsize',16)

figure(2);%Same in 3D
surf(CWTcoeffs); colormap jet;colorbar;
shading('interp'); view(-30,10);
xlabel('Sample (time)','fontsize',16);
ylabel('Scale level (Inverse of frequency)','fontsize',16)
zlabel('Intensity (coefficients)')

%We can also decompose the signal to different levels of noise filtering.
n = 6 %Number of decomposition levels
% Here A is the vector,n is the decompression levels you want, the third is the wave family. Mine one is db10.  
[C1,L1] = wavedec(A,n,'db10');

%Then wenergy gives the percentage value which corresponds to the 
%decompression level plus the energy values which corresponds to the decomposition levels.  
[Ea1,Ed1] = wenergy(C1,L1)
% Ea1 is the percentage of energy of the approximation, and Ed1 is the
% percentage energy vector of details
%%%%%%%%%%%%Reconstruction
A3 = wrcoef('a',C1,L1,'db10',n);

figure(3);
[C1,L1] = wavedec(A,n,'db10'); %Decompose to n levels using the db10 wavelet
[Ea1,Ed1] = wenergy(C1,L1);% Looks at the energy proportions represented by each decomposition level
for i = 1:n
subplot(1,n,i)
sth = wrcoef('a',C1,L1,'db10',i); %Reconstruction of the i-th level
%%'a' for approximation and 'd' for detail reconstruction
plot(A,'k-','linewidth',3);hold on;plot(sth,'r-','linewidth',3);
legend('Original','Filtered')
xlabel('Sample','fontsize',16)
ylabel('Amplitude','fontsize',16)
title(['Level - ', num2str(i)]);
set(gca,'fontsize',16)
end