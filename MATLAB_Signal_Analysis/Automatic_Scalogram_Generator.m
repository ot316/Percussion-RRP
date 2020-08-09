close all;
input_filepath = "../Audio_Files_09.08.20_MATLAB/trimmed/";
output_filepath = "../Audio_Files_09.08.20_MATLAB/scalograms/";

files=dir(input_filepath);
for k=3:length(files)
    path = input_filepath + files(k).name;  %filepath
    [A,fs] = audioread(path,[10,3000]);     %read sample
    figure(1);
    CWTcoeffs = cwt(A,5:5:1000,'sym10','plot');     %cwt for continuous 1D wavelet transform
    colormap gray; 
%     colorbar;
    set(gca, 'Visible', 'off'); 
    title('Matrix A - Close Nodule')
    xlabel('Sample (time)','fontsize',16);
    ylabel('Scale level (frequency)','fontsize',16)
    saveas(gcf,(output_filepath + "/scalogram" + num2str(k) + ".png"))   %save figure to output filepath
end

