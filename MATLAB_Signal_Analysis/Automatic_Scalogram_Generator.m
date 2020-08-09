clear all;
input_filepath = "./Audio_Files_09.08.20_MATLAB/trimmed/";
output_filepath = input_filepath + "scalograms/";

files=dir(input_filepath);
for k=1:length(files)
   path = input_filepath + files(k).name
   [A,fs] = audioread(path)
   whos A

end

% figure(1);
% CWTcoeffs = cwt(A,5:5:500,'sym10','plot');     %cwt for continuous 1D wavelet transform
% surf(CWTcoeffs)
% colormap jet; 
% colorbar;
% 
% title('Matrix A - Close Nodule')
% xlabel('Sample (time)','fontsize',16);
% ylabel('Scale level (Inverse of frequency)','fontsize',16)