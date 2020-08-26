%Program to read a directory of audio files and plot and save grayscale sym
%10 scalograms

close all;
input_filepath = "../Audio_Files_10.03.20_Experiment_Scalograms/No_Nodule_taps/";
output_filepath = "../Audio_Files_10.03.20_Experiment_Scalograms/No_Nodule_taps/";

files=dir(input_filepath);
for k=3:length(files)
    path = input_filepath + files(k).name;  %filepath
    [A,fs] = audioread(path,[10,3000]);     %read sample
    figure(1);
    CWTcoeffs = cwt(A,5:5:1000,'sym10','plot');     %cwt for continuous 1D wavelet transform
    colormap gray; 
    colorbar;
    title('Far Nodule')
    xlabel('Sample (time)','fontsize',16);
    ylabel('Frequency','fontsize',16)
    
    %uncommenting the below lines will save the plots and overwrite the
    %existing scalograms, use carefully
    
    %set(gca, 'Visible', 'off'); 
    %saveas(gcf,(output_filepath + num2str(k-2) + ".png"))   %save figure to output filepath
end

be