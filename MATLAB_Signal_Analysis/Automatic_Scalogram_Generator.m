% close all;
% input_filepath = "./Audio_Files_09.08.20_MATLAB/trimmed/";
% output_filepath = "./Audio_Files_09.08.20_MATLAB/scalograms/";

close all;
input_filepath = "A:\OneDrive - Imperial College London\Robotics Research Project\Percussion-RRP\Audio_Files_10.03.20_Experiment_Scalograms\Nodule_taps";
output_filepath = "A:\OneDrive - Imperial College London\Robotics Research Project\Percussion-RRP\Audio_Files_10.03.20_Experiment_Scalograms\Nodule_taps";

files=dir(input_filepath);
for k=3:length(files)
    path = input_filepath + files(k).name;  %filepath
    [A,fs] = audioread(path,[10,3000]);     %read sample
    figure(1);
    CWTcoeffs = cwt(A,5:5:1000,'sym10','plot');     %cwt for continuous 1D wavelet transform
    colormap gray; 
%     colorbar;
    set(gca, 'Visible', 'off'); 
    saveas(gcf,(output_filepath + num2str(k) + ".png"))   %save figure to output filepath
end

