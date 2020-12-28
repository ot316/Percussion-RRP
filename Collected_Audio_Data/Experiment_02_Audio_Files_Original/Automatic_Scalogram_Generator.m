% Author: Oli Thompson
% Program to read a directory of audio files and plot and save grayscale
% symlet 10 scalograms

close all;
files = dir;
directoryNames = {files([files.isdir]).name};
for i=3:length(directoryNames)
    input_filepath = directoryNames(i) + "/";
    output_filepath = directoryNames(i) + "/";

    files=dir(input_filepath);
    for k=3:length(files)-1 
        path = input_filepath + files(k).name;  %filepath
        [A,fs] = audioread(path,[3000,8000]);     %read sample
        figure(1);
        CWTcoeffs = cwt(A,5:5:1000,'sym10','plot'); 
        %cwt for continuous 1D wavelet transform
        colormap gray; 
    %     colorbar; 
        title('Far Nodule')
        xlabel('Sample (time)','fontsize',16);
        ylabel('Frequency','fontsize',16)

        %uncommenting the below lines will save the plots and overwrite the
        %existing scalograms, use carefully
        output_path = (output_filepath + regexprep(output_filepath,'[/]','') + "_scalogram_" + num2str(k-3) + ".png")
        set(gca, 'Visible', 'off'); 
        saveas(gcf,output_path)   %save figure to output filepath
        close
    end
end